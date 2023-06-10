import 'package:flutter/material.dart';
import 'package:netflix_demo/core/api_constant.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';

class VedioWidget extends StatelessWidget {
  VedioWidget({super.key, required this.imgPth});
  String? imgPth;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "${imgBaseUrl}${imgPth}",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_off,
                  color: kWhite,
                  size: 30,
                )),
          ),
        ),
      ],
    );
  }
}
