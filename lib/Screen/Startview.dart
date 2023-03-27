




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../provider/bookProvider.dart';
import 'Home.dart';

class Startview extends StatefulWidget {
  const Startview({Key? key}) : super(key: key);

  @override
  State<Startview> createState() => _StartviewState();
}

class _StartviewState extends State<Startview> {
  @override
  void initState() {
    var prv = context.read<BookProvider>();
    prv.getRecentBooks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prvwatch = context.watch<BookProvider>();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              "assets/images/sra.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: const [

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 590),
                    child: MaterialButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text(
                        "Go to Read",
                        style: TextStyle(fontSize: 48, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}