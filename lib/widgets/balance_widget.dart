import 'package:flutter/material.dart';
import 'package:wallet_app/const/string.dart';

import '../utils/randon_number.dart';
import 'custom_text_widget.dart';

class BalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFB5282B),
                Color(0xFF801A18),
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                  label: AppString.txtBalance,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              const SizedBox(
                height: 10,
              ),
              CustomTextWidget(
                  label: '${RandomNumber.randomNumberGenerator()} Ks',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              const Spacer(),
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: AppString.txtPlatinum,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      children: [
                        TextSpan(
                          text: ' 93848 ${AppString.txtPoint}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const CustomTextWidget(
                      label: AppString.txtExpiredDate, fontSize: 14),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
