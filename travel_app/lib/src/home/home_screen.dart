import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/src/home/components/circle_tab_indicator.dart';
import 'package:travel_app/src/resource/model/list_travel_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildTitle(),
        _buildTabs(),
        ...List.generate(ListTravel.listTravel.length, (index) {
           return Container(
              margin: const EdgeInsets.only(right: 28),
              width: 333,
              height: 218,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.6),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        ExactAssetImage(ListTravel.listTravel[index].image),
                  )),
            );
        })
        // ListView.builder(
        //   itemCount: ListTravel.listTravel.length,
        //   itemBuilder: (context, index) {
        //     return Container(
        //       margin: const EdgeInsets.only(right: 28),
        //       width: 333,
        //       height: 218,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(9.6),
        //           image: DecorationImage(
        //             fit: BoxFit.cover,
        //             image:
        //                 ExactAssetImage(ListTravel.listTravel[index].image),
        //           )),
        //     );
        //   },
        // )
      ],
    )));
  }

  Widget _buildTabs() {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(left: 14.4, top: 28.8),
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          labelStyle:
              GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
          indicator: CircleTabIndicator(color: Colors.blue, radius: 4),
          indicatorPadding: const EdgeInsets.symmetric(vertical: -10),
          isScrollable: true,
          tabs: const [
            Tab(
              child: Text('Sights'),
            ),
            Tab(
              child: Text('Tours'),
            ),
            Tab(
              child: Text('Adventures'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 57.6,
      margin: const EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Favorites',
              style: GoogleFonts.playfairDisplay(
                  fontSize: 40, fontWeight: FontWeight.w700)),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.search_outlined,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
