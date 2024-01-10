import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class ElevatedAddAnotherItem extends StatelessWidget {
  final VoidCallback onTap;

  const ElevatedAddAnotherItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.add_circle_outline_sharp,
              size: 40.0,
              color: orange,
            ),
            const Text(
              "Add Another Item",
              style: TextStyle(
                fontFamily: 'SofiaPro',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 20.0,
              color: Color.fromARGB(255, 53, 53, 53),
            ),
          ],
        ),
      ),
    );
  }
}
