// import 'package:flutter/material.dart';
// import 'package:quizzes/app/utils/resources/styles_manager.dart';
// import 'package:quizzes/app/utils/resources/values_manager.dart';

// import 'color_manager.dart';
// import 'font_manager.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     useMaterial3: true,
//     // main colors
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightPrimary,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey1,
//     // cardview theme
//     cardTheme: CardTheme(
//         color: ColorManager.white,
//         shadowColor: ColorManager.grey,
//         elevation: AppSize.s4),
//     // app bar theme
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       color: ColorManager.primary,
//       elevation: 0,
//       titleTextStyle:
//           getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
//       iconTheme: IconThemeData(color: Colors.white),
//     ),

//     // button theme
//     buttonTheme: ButtonThemeData(
//         shape: const StadiumBorder(),
//         disabledColor: ColorManager.grey1,
//         buttonColor: ColorManager.primary,
//         splashColor: ColorManager.lightPrimary),

//     // elevated button them
//     elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//             textStyle: getRegularStyle(
//                 color: ColorManager.white, fontSize: FontSize.s17),
//             primary: ColorManager.primary,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(AppSize.s12)))),

//     // text theme
//     textTheme: TextTheme(
//         headline1:
//             getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
//         subtitle1:
//             getMediumStyle(color: ColorManager.black, fontSize: FontSize.s14),
//         caption: getRegularStyle(color: ColorManager.black),
//         bodyText1: getRegularStyle(color: ColorManager.black)),

//     // input decoration theme (text form field)
//     inputDecorationTheme: InputDecorationTheme(

//         // content padding

//         contentPadding: const EdgeInsets.all(AppPadding.p8),

//         // hint style
//         hintStyle:
//             getRegularStyle(color: ColorManager.black, fontSize: FontSize.s14),
//         labelStyle:
//             getMediumStyle(color: ColorManager.black, fontSize: FontSize.s14),
//         errorStyle: getRegularStyle(color: ColorManager.error),

//         // enabled border style
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: ColorManager.primary, width: 1),
//             borderRadius: const BorderRadius.all(Radius.circular(5))),

//         // focused border style
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: ColorManager.primary, width: 1),
//             borderRadius: const BorderRadius.all(Radius.circular(5))),

//         // error border style
//         errorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//             borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20))),
//         // focused border style
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
//             borderRadius:
//                 const BorderRadius.all(Radius.circular(AppSize.s20)))),
//     // label style
//   );
// }
