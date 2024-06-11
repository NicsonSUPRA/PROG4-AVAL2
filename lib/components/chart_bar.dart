import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percent;

  const ChartBar(
      {super.key,
      required this.label,
      required this.percent,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('R\$${(percent * value).toStringAsFixed(2)}')),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(3)),
              ),
              FractionallySizedBox(
                heightFactor: percent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(3)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
