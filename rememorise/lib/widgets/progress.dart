import 'package:flutter/material.dart';
import 'package:rememorise/utils/consts.dart';

dynamic showProgressDialog(context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Center(
              child: CircularProgressIndicator(
            color: Palates.primary,
          )));
    });
