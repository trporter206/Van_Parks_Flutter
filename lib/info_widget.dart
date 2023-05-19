import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData iconSymbol;
  final MaterialColor circleColor;

  const InfoWidget({super.key, required this.text1, required this.text2, required this.iconSymbol, required this.circleColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: circleColor.shade200,
          child: Icon(iconSymbol, color: circleColor.shade800,),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                  text2,
                  style: const TextStyle(
                    fontSize: 15.0,
                      fontWeight: FontWeight.w300
                  )
              )
            ],
          ),
        ),
      ],
    );
  }
}
