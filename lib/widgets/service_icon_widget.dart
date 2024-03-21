import 'package:flutter/material.dart';

class ServiceIcon extends StatelessWidget {
  (IconData iconData, String label) data;

  ServiceIcon({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFB5282B),
                  Color(0xFF801A18),
                ],
              )),
          child: Icon(
            data.$1,
            color: Colors.white,
          ),
        ),
        Text(
          data.$2,
          softWrap: true,
          style: const TextStyle(fontSize: 12,color: Colors.black),
        )
      ],
    );
  }
}
