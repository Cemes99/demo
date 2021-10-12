import 'package:demo/widgets/list_food.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants.dart';

import 'package:demo/widgets/top_home_page.dart';
import 'package:demo/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? key = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        padding: appMargin,
        child: Column(
          children: <Widget>[
            const HomeTopWidget(),
            spaceV,
            const SearchBar(),
            spaceV,
            Flexible(
              child: ListView(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(mainTextColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: mainTextColor, width: 2)
                            )
                        )
                    ),
                    onPressed: () {
                      setState(() {
                        key = '';
                      });
                    },
                    child: const Text('Tất cả', style: TextStyle(color: Colors.black),),
                  ),
                  spaceH,
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(mainTextColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: mainTextColor, width: 2)
                            )
                        )
                    ),
                    onPressed: () {
                      setState(() {
                        key = 'Vegetable';
                      });
                    },
                    child: const Text('Rau củ', style: TextStyle(color: Colors.black),),
                  ),
                  spaceH,
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(mainTextColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: mainTextColor, width: 2)
                            )
                        )
                    ),
                    onPressed: () {
                      setState(() {
                        key = 'Coffee';
                      });
                    },
                    child: const Text('Cà phê', style: TextStyle(color: Colors.black),),
                  ),
                  spaceH,
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(mainTextColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: mainTextColor, width: 2)
                            )
                        )
                    ),
                    onPressed: () {
                      setState(() {
                        key = 'Pizza';
                      });
                    },
                    child: const Text('Pizza', style: TextStyle(color: Colors.black),),
                  ),
                ],
                scrollDirection: Axis.horizontal,
              ),
              flex: 1,
            ),
            spaceV,
            Flexible(
              child: ListFoodWidget(key!),
              flex: 6,
            ),
          ],
        ),
      )
    );
  }
}