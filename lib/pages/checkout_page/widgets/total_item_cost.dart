import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';

class TotalItemCost extends StatefulWidget {
  TotalItemCost({
    super.key,
    required this.itemPrice,
  });

  final num itemPrice;
  static int count = 1;

  @override
  State<TotalItemCost> createState() => _TotalItemCostState();
}

class _TotalItemCostState extends State<TotalItemCost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
              color: orange, borderRadius: BorderRadius.circular(17)),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (TotalItemCost.count > 0) {
                        TotalItemCost.count--;
                      }
                    });
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SofiaPro'),
                  ),
                ),
                Text(
                  "${TotalItemCost.count}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SofiaPro'),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      TotalItemCost.count++;
                    });
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SofiaPro'),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          "\$${widget.itemPrice * TotalItemCost.count}",
          style: const TextStyle(
              fontFamily: 'SofiaPro',
              fontSize: 14,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
