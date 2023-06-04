import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';

class VedioListItem extends StatelessWidget {
  int index;
  VedioListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.volume_off,
                        color: kWhite,
                        size: 30,
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/images/Suraj-Pe-Mangal-Bhari-movie-poster-release-date.jpg'),
                      ),
                    ),
                    VedoListItemWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    VedoListItemWidget(icon: Icons.add, title: 'My List'),
                    VedoListItemWidget(icon: Icons.share, title: 'Share'),
                    VedoListItemWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VedoListItemWidget extends StatelessWidget {
  IconData icon;
  final String title;
  VedoListItemWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhite,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(color: kWhite, fontSize: 16),
          )
        ],
      ),
    );
  }
}
