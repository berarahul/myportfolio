import 'package:flutter/material.dart';

import 'colors.dart';



ButtonStyle borderedButtonStyle =ButtonStyle(


    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.redColor,

        ),
        borderRadius: BorderRadius.circular(10)))

);