import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prueba_tecnica_veflat/core/constant.dart';

class CardSite extends StatelessWidget {
  const CardSite({super.key, required this.imagen, required this.titulo});
  final String imagen;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265,
      height: 20,
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
              child: Image.asset(imagen)),
          const SizedBox(width: 18),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
