import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constant.dart';

class CardSeguimiento extends StatelessWidget {
  const CardSeguimiento({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 17),
      padding: const EdgeInsets.only(top: 12, left: 14, bottom: 14.88),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 4,
              offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: Image.asset('$carpImagen/image4.png')),
          const SizedBox(width: 18),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Turn right',
                      style: TextStyle(
                          color: Color(0xFFB6E13D),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset('$carpIcon/card_segui_icon.svg')
                  ],
                ),
              ),
              const Text(
                "3 Birrel \nAvenue",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
              Row(
                children: [
                  SvgPicture.asset('$carpIcon/point_site_icon.svg'),
                  const SizedBox(
                    width: 3.6,
                  ),
                  const Text(
                    '10 Mtr Left',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFBDBDBD)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
