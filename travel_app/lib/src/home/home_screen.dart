import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // tieu de
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Home',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: const Icon(Icons.search),
                  )
                ],
              ),
              //tab bar
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                      isScrollable: true,
                      labelColor: Colors.blue, // hien thi mau
                      unselectedLabelColor:
                          Colors.black, // thay doi mau sau khi nhan
                      tabs: [
                        Text('Sights'),
                        Text('Tours'),
                        Text('Adventures'),
                      ],
                    )),
              ),
              // danh sach
              ...List.generate(ListTravel.listTravel.length, (index) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: ExactAssetImage(
                                    ListTravel.listTravel[index].image),
                              )),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Positioned(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.blue,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ListTravel.listTravel[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                Text(ListTravel.listTravel[index].date,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey))
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded,
                                size: 20, color: Colors.grey)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
