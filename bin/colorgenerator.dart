import 'dart:io';

Future<File> get _localFile async {
  //final path = await _localPath;
  return File('bin/home');
}

Future<int> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If encountering an error, return 0
    return 0;
  }
}

void main() async {
  final file = await _localFile;

  // Read the file
  final contents = await file.readAsString();

  //Directory tempDir = await getTemporaryDirectory();
  // var tempPath = tempDir.path;

  print(contents.toString());
  // print(tempPath);

  print("--------");
  //ColorGenerator colorGenerator = ColorGenerator("");

  //print(colorGenerator.isColorExiteas("material9"));
  ColorGenerator colorGenerator = ColorGenerator(contents);
  colorGenerator.execute();

  colorGenerator.getNewColorName();
  print("----------");

  colorGenerator.showColorsName();
  print("----------");
  colorGenerator.showGlobalColorsName();
  // */
}

List<ColorGeneratorModel> colorGolbalGenerator = [];

class ColorGenerator {
  List<ColorGeneratorModel> colorGenerator = [];
  String regExpression = r"Color\(0x(ff|FF)([A-z]|[0-9])*\";

  String data;

  ColorGenerator(this.data);
  void execute() {
    final regex = RegExp(
      r'Color\(0x(ff|FF)([A-z]|[0-9])*\)',
      multiLine: true,
      caseSensitive: true,
    );

    final match = regex.allMatches(data);
    //print(match.length);

    match.forEach(
      (element) {
        colorGenerator.add(ColorGeneratorModel(
          colorName: element.group(0).toString(),
          colorNewName: "",
          fileName: "",
          rangEnd: element.end,
          rangStart: element.start,
        ));
      },
    );
  }

  void showColorsName() {
    colorGenerator.forEach((element) {
      print(
          " Replace ${element.colorName.toString()} with ${element.colorNewName.toString()} in  Start ${element.rangStart.toString()} End ${element.rangEnd.toString()}  ;");
    });
  }

  void showGlobalColorsName() {
    colorGolbalGenerator.forEach((element) {
      print("var ${element.colorNewName.toString()} = ${element.colorName.toString()} ;");
    });
  }

  void getNewColorName() {
    colorGenerator.forEach((element) {
      if (isColorExiteas(element.colorName)) {
        element.colorNewName = SelectColorGeneratorModel!.colorNewName;
        SelectColorGeneratorModel = null;
      } else {
        element.colorNewName = "color${colorGolbalGenerator.length}";

        colorGolbalGenerator.add(
          ColorGeneratorModel(
            colorName: element.colorName,
            colorNewName: element.colorNewName,
            fileName: element.fileName,
            rangEnd: element.rangEnd,
            rangStart: element.rangStart,
          ),
        );
      }
    });
  }

  ColorGeneratorModel? SelectColorGeneratorModel;

  bool isColorExiteas(String colorName) {
    for (var i = 0; i < colorGolbalGenerator.length; i++) {
      if (colorGolbalGenerator.elementAt(i).colorName.contains(colorName)) {
        SelectColorGeneratorModel = colorGolbalGenerator.elementAt(i);
        return true;
      }
    }
    return false;
  }
}

class ColorGeneratorModel {
  String colorName;
  int rangStart;
  int rangEnd;
  String fileName;
  String colorNewName;

  ColorGeneratorModel({
    required this.colorName,
    required this.rangEnd,
    required this.rangStart,
    required this.fileName,
    required this.colorNewName,
  });
}
