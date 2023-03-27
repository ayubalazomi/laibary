import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../provider/bookProvider.dart';
import 'Startview.dart';

class Kindbook extends StatefulWidget {
  String x;

  Kindbook({Key? key, required this.x}) : super(key: key);

  @override
  State<Kindbook> createState() => _KindbookState();
}

class _KindbookState extends State<Kindbook> {
  void initState() {
    var prv = context.read<BookProvider>();
    prv.getMoreBooks(widget.x);

    super.initState();
  }

  // get response => null;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<BookProvider>();
    var response = provider.kindBook;
    final Uri _url =Uri.parse('https://www.dbooks.org/d/9811040710-1679573713-991a97c182d34806/') ;

    void _launchURL() async {
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.x} Books"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(children: [
        //  response == null
        //    ? const Center(child: CircularProgressIndicator())
        //  :
        Expanded(
          child: GridView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex) => Startview()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.network(
                            width: 170, "${response?.books?[index].image}"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          child: Text(
                            "${response?.books?[index].title}",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Text(
                          "By ${response?.books?[index].authors}",
                          style: TextStyle(fontSize: 14),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8),
                                child: MaterialButton(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {

                                  },
                                  child: Text(
                                    "Read",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8),
                                child: MaterialButton(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    _launchURL();
                                  },
                                  child: Text(
                                    "Download",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            // separatorBuilder: (context, index) =>
            //     const SizedBox(height: 16),
            itemCount: (response?.books?.length),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          ),
        )
      ]),
    );
  }
}
