import 'package:flutter/material.dart';
import 'package:mvc/views/home/home.controller.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeController hc = HomeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MVC'),
      ),
      body: Center(
        child: Text(hc.text),
      ),
      bottomNavigationBar: SizedBox(
        height: 45,
        width: size.width,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty
                  .all<Color>(Colors.blue),
          ),
          onPressed: () {
            hc.post();
          },
          child: const Text('Update'),
        )
      ),
    );
  }
}
