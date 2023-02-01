import 'package:colorgenerator/colorgenerator.dart' as colorgenerator;

void main(List<String> arguments) {
  ColorGenerator colorGenerator = ColorGenerator(r"""

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krz/core/assets/app_assets.dart';
import 'package:krz/core/extensions/fontWeight_ex.dart';
import 'package:krz/core/shared_widgets/base_scaffold.dart';
import 'package:krz/core/spacer.dart';
import 'package:krz/core/theme/theme_data.dart';

import '../../../../core/const/app_colors.dart';
import '../../../../core/const/app_const.dart';
import '../../../../core/shared_widgets/base_app_bar.dart';
import '../../../../core/shared_widgets/custom_checked.dart';
import '../../../../core/shared_widgets/drop_down_widget.dart';
import '../../../../core/shared_widgets/my_button.dart';
import '../../../../core/shared_widgets/title_with_horizontal_line.dart';
import '../../../auth/presentation/widgets/my_text_form_field.dart';
import '../widgets/get_date_from_picker_dialog.dart';
import '../widgets/text_fields_with_icon.dart';

class Profile extends GetView {
  
  final TextStyle _calendarStyle = AppTheme.labelLarge.copyWith(
    fontSize: 13.sp,
    color: Colors.black,
  );

  final ValueNotifier<DateTime?>? _selectedDate = ValueNotifier<DateTime?>(DateTime.now());

  Future<void> datePicker() async {
    final DateTime? range = await getDateFromPickerDialog(initialDate: _selectedDate!.value, minDate: DateTime.now());
    if (range != null) {
      _selectedDate!.value = range;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      scaffoldBackgroundColor: Color(0xffFFFFFF),
      appBar: BaseAppBar(
        title: 'edit_profile'.tr,
        onMenuTap: () {
          Get.back();
                scaffoldBackgroundColor: Color(0xffFFFFFF),

        },
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        children: [
          spacerH20(),
                scaffoldBackgroundColor: Color(0xffFFFFFF),

          TitleWithHorizontalLine(
            title: 'edit_profile'.tr,
          ),
          spacerH13(),
          MyTextFormField(
            height: 50.h,
            validator: (value) {
              if (value == null || value == '') {
                return 'برجاء اختيار ';
              }

              return null;
            },
            outLineText: 'name'.tr,
            borderRadius: 15.r,
            hintText: "".tr,

                  scaffoldBackgroundColor: Color(0xffFFFFFF),

            assetName: AppAssets.user_Svg,
            fillColor: AppColors.KColorTextField,
            onChanged: (val) {},
          ),
          spacerH13(),
          MyTextFormField(
            height: 50.h,
            validator: (value) {
              if (value == null || value == '') {
                return 'برجاء اختيار ';
              }

              return null;
            },

                  scaffoldBackgroundColor: Color(0xffFFFEEEEEe),

            outLineText: 'E-mail'.tr,
            borderRadius: 15.r,
            hintText: "".tr,
            assetName: AppAssets.email_Svg,
            fillColor: AppColors.KColorTextField,
            onChanged: (val) {},
          ),
          spacerH13(),
          MyTextFormField(
            height: 50.h,
            validator: (value) {
              if (value == null || value == '') {
                return 'برجاء اختيار ';
              }

              return null;
            },
            outLineText: 'Mobile number'.tr,
            borderRadius: 15.r,
            hintText: "".tr,
            assetName: AppAssets.phone_Svg,
            fillColor: AppColors.KColorTextField,
            onChanged: (val) {},
          ),
          spacerH13(),
          GestureDetector(
            onTap: () {
              datePicker();
            },
            child: MyTextFormField(
              height: 50.h,
              outLineText: 'birth_date'.tr,
              borderRadius: 15.r,
              hintText: "".tr,
              label: ValueListenableBuilder<DateTime?>(
                  valueListenable: _selectedDate!,
                  builder: (_, selectedDate, __) {
                    var monthName = AppConst.months[selectedDate!.month - 1].tr;

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.svg.calendarIcon,
                          color: AppColors.KColorCheckBox,
                        ),
                        spacerW13(),
                        Text('${selectedDate.day}', style: _calendarStyle),
                        Container(
                          width: 2,
                          height: 25.h,
                          color: AppColors.KColorGrey9,
                        ).paddingSymmetric(horizontal: 25),
                        Text(
                          monthName,
                          style: _calendarStyle.copyWith(
                            fontWeight: FontWeightEx.Medium,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 25.h,
                          color: AppColors.KColorGrey9,
                        ).paddingSymmetric(horizontal: 25),
                        Text(
                          '${selectedDate.year}',
                          style: _calendarStyle,
                        ),
                      ],
                    );
                  }),
              fillColor: AppColors.KColorTextField,
              enable: false,
            ),
          ),
          spacerH13(),
          DropDownWidgetX<String>(
            requiredFiled: true,
            withShadow: false,
            labelText: 'blood_type'.tr,
            hintText: '',
            radius: 15.r,
            itemAsString: (String? u) => u!,
            maxHeight: 100,
            fillColor: AppColors.KColorTextField,
            assetName: AppAssets.svg.bloodTypeIcon,
            items: ['A+', 'A-'],
            onChanged: (value) {},
          ),
          spacerH13(),
          MyTextFormField(
            height: 50.h,
            outLineText: 'birth_date'.tr,
            borderRadius: 15.r,
            hintText: "".tr,
            label: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppAssets.svg.calendarIcon,
                  color: AppColors.KColorCheckBox,
                ),
                spacerW13(),
                Text('25', style: _calendarStyle),
                Container(
                  width: 2,
                  height: 25.h,
                  color: AppColors.KColorGrey9,
                ).paddingSymmetric(horizontal: 25),
                Text(
                  'ينـــاير',
                  style: _calendarStyle.copyWith(
                    fontWeight: FontWeightEx.Medium,
                  ),
                ),
                Container(
                  width: 2,
                  height: 25.h,
                  color: AppColors.KColorGrey9,
                ).paddingSymmetric(horizontal: 25),
                Text(
                  '1993',
                  style: _calendarStyle,
                ),
              ],
            ),
            fillColor: AppColors.KColorTextField,
            enable: false,
          ),
          spacerH13(),
          Row(
            children: [
              TextFieldWithIcon(
                outLineText: 'الطول',
                label: 'سم',
                iconPath: AppAssets.svg.heightIcon,
                onChanged: (String value) {},
              ),
              spacerW16(),
              TextFieldWithIcon(
                outLineText: 'الطول',
                label: 'كجم',
                iconPath: AppAssets.svg.weightIcon,
                onChanged: (String value) {},
              ),
              spacerW16(),
              TextFieldWithIcon(
                outLineText: 'الطول',
                label: 'كجم',
                iconPath: AppAssets.svg.weightIcon,
                onChanged: (String value) {},
              ),
            ],
          ),
          spacerH20(),
          Text(
            'أمراض وراثية',
            style: GoogleFonts.cairo(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              height: 0.86,
            ),
            textAlign: TextAlign.right,
          ),
          spacerH8(),
          Wrap(
            children: [
              CustomChecked(title: "اســم مرض وراثـي"),
              CustomChecked(title: "اســم مرض وراثـي"),
              CustomChecked(title: "اســم مرض وراثـي"),
              CustomChecked(title: "اســم مرض وراثـي"),
              CustomChecked(title: "اســم مرض وراثـي"),
              CustomChecked(title: "اســم مرض وراثـي"),
            ],
          ),
          spacerH12(),
          Text(
            'الحساسية',
            style: GoogleFonts.cairo(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              height: 0.86,
            ),
            textAlign: TextAlign.right,
          ),
          spacerH8(),
          Wrap(
            children: [
              CustomChecked(title: "حساسية الشمس"),
              CustomChecked(title: "حساسية الجلد"),
              CustomChecked(title: "حساسية الشمس"),
              CustomChecked(title: "حساسية الشمس"),
              CustomChecked(title: "حساسية الشمس"),
            ],
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          bottom: 25,
          left: 8,
          right: 8,
        ),
        child: AppButton().MyButton(
          title: 'حفظ التعديلات',
          onPressed: () {
            Fluttertoast.showToast(msg: "تم التحميل");
            Get.back();
          },
        ),
      ),
    );
  }
}

class SuffixWidget extends StatelessWidget {
  SuffixWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  final TextStyle _calendarStyle = AppTheme.labelLarge.copyWith(
    fontSize: 13.sp,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: _calendarStyle.copyWith(
          fontSize: 10.sp,
          fontWeight: FontWeightEx.Medium,
        ),
      ).paddingOnly(left: 12),
    );
  }
}




""");

  colorGenerator.execute();
}

List<colorGeneratorModel> colorGolbalGenerator = [];

class ColorGenerator {
  List<colorGeneratorModel> colorGenerator = [];
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
    print(match.length);

    match.forEach(
      (element) {
        colorGenerator.add(colorGeneratorModel(
          colorName: element.group(0).toString(),
          colorNewName: "",
          fileName: "",
          rangEnd: element.end,
          rangStart: element.start,
        ));
      },
    );
  }

  void getNewColorName() {
    colorGenerator.forEach((element) {
      colorGolbalGenerator.where(
        (listItem) => (listItem.colorName == element.colorName),
      );
    });
  }
}

class colorGeneratorModel {
  String colorName;
  int rangStart;
  int rangEnd;
  String fileName;
  String colorNewName;

  colorGeneratorModel({
    required this.colorName,
    required this.rangEnd,
    required this.rangStart,
    required this.fileName,
    required this.colorNewName,
  });
}
