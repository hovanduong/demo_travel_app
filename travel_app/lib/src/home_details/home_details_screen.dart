import 'package:flutter/material.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({Key? key, required this.travel}) : super(key: key);
  final travel;
  @override
  _HomeDetailsScreenState createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(widget.travel.name,
            style: const TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: widget.travel.id,
                child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      widget.travel.image,
                      fit: BoxFit.cover,
                    ))),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'It was made famous by the film "The Beach", starring Leonardo DiCaprio, but in recent years   mass tourism has ravaged Thailand s Maya Bay, located in the idyllic Phi Phi islands. Now, after an extended shutdown amid   the Covid-19 pandemic, there are signs that this natural paradise is recovering. As visitors begin to return, the Thai government and tour operators are keen to avoid the mistakes of the past.',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            )
          ],
        ),
      )),
    );
  }
}
