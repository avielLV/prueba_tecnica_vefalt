import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prueba_tecnica_veflat/core/constant.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 25),
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
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('$carpIcon/search_icon.svg')),
          const Text(
            'Where are hou going to?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
