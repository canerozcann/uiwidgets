import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class ScrollableContainersPage extends StatelessWidget {
  const ScrollableContainersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.redAccent,
              margin: const EdgeInsets.all(8),
              child: Center(
                child: Container(
                  height: 100,
                  width: 170,
                  color: Colors.black,
                  margin: const EdgeInsets.all(8),
                  child: const Center(
                      child: Text(
                    'Nested Container',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      border: Border.all(color: Colors.blue[900]!, width: 15),
                    ),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text('Container with Border'),
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.yellowAccent,
                    margin: const EdgeInsets.all(8),
                    child: const Center(child: Text('Row Usage Container')),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      content: const Text(
                        'But containers dont stop at just layout and styling. They can also respond to user interactions like this.',
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Close',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.blueAccent,
                margin: const EdgeInsets.all(8),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Action Using With Container'),
                      Text(
                        '(Click To Container For Action!)',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.orangeAccent,
              margin: const EdgeInsets.all(8),
              child: const Center(child: Text('4. Container')),
            ),
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.purpleAccent,
              margin: const EdgeInsets.all(8),
              child: const Center(child: Text('5. Container')),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
