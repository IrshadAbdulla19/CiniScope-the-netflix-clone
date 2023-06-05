import 'package:flutter/material.dart';
import 'package:netflix_demo/core/colors/colors.dart';
import 'package:netflix_demo/core/constansts/contsands.dart';
import 'package:netflix_demo/presentation/home/widgats/custom_button.dart';
import 'package:netflix_demo/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix_demo/presentation/new_and_hot/widgets/everyonce_watching_widget.dart';
import 'package:netflix_demo/presentation/new_and_hot/widgets/vedio_widget.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            title: Text(
              'New & hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              Wrap(
                children: [
                  Icon(
                    Icons.cast,
                    color: kWhite,
                    size: 30,
                  ),
                  kWidth,
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                  kWidth
                ],
              )
            ],
            bottom: TabBar(
                unselectedLabelColor: kWhite,
                labelColor: backgrondColorBlack,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(color: kWhite, borderRadius: kRadius30),
                tabs: const [
                  Tab(
                    text: '🍟 Coming soon',
                  ),
                  Tab(
                    text: "👀 Everyone's watchig",
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryonceWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemBuilder: (cntx, indx) {
        return ComingSoonMainWidget();
      },
      itemCount: 6,
    );
  }

  Widget _buildEveryonceWatching() {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (cntx, indx) {
          return EveryonceWatcingWidget();
        });
  }
}
