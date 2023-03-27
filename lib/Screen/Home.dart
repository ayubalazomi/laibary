import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bookProvider.dart';
import 'kindbook.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> images = [
    'assets/images/dra.png',
    'assets/images/chi.png',
    'assets/images/code.png',
    'assets/images/edi.png',
    'assets/images/mus.png',
    'assets/images/spo.png',
    'assets/images/sto.png',
  ];
  final List<String> tex = [
    'Drama',
    'child',
    'kotlin',
    'Engineering',
    'Muslim',
    'Sport',
    'java'
  ];

  void initState() {
    var prv = context.read<BookProvider>();
    prv.getRecentBooks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<BookProvider>();
    var response = provider.recentBooksResponse;
    late String _searchText;
    void initState() {
      super.initState();
      _searchText = '';
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flamengo"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
                child: TextField(

                    decoration: InputDecoration(filled: true,fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),

                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                  onSubmitted: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Kindbook (x: value),
                      ),
                    );
                  },

                ),
              ),
              //Image.asset("assets/images/cover.jpg"),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, bottom: 10),
                child: Text(
                  "BOOKS",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              response == null
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => Kindbook(
                                            x: tex[index],
                                          )));
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Card(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            height: 100,
                                            width: 140,
                                            "${images[index]}"),
                                        Text(
                                          "${tex[index]}",
                                          style: TextStyle(fontSize: 24),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        // separatorBuilder: (context, index) =>
                        //     const SizedBox(height: 16),
                        itemCount: (images.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                      ),
                    )
            ]),
      ),
    );
  }
}
