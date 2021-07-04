
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {Key? key,
      required this.title,
      required this.details,
      this.spaceWidth = 10})
      : super(key: key);
  final String title;
  final double spaceWidth;
  final String details;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: spaceWidth,
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  details,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.justify,
                ),
              )),
            ],
          ),
          Divider(
            thickness: 1.5,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
