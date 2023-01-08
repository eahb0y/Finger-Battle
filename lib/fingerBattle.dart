import 'package:fingerbattle/textStyle.dart';
import 'package:flutter/material.dart';

class FingerBattle extends StatefulWidget {
  const FingerBattle({Key? key}) : super(key: key);

  @override
  State<FingerBattle> createState() => _FingerBattleState();
}

class _FingerBattleState extends State<FingerBattle> {
  double blue = 0.0;
  double red = 0.0;
  String winner = '';
  bool isBegan = false;
  var halfScreen =
      (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height -
              MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .viewPadding
                  .top) /
          2;
  @override
  void initState() {
    super.initState();
    reset();
  }

  reset() {
    setState(() {
      blue = halfScreen;
      red = halfScreen;
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      blue += 10;
                      if (red - 10 > 0) {
                        red -= 10;
                      } else {
                        red = 0;
                        blue = halfScreen * 2; //test this part of code
                        winner = 'blue';
                      }
                    });
                  },
                  child: Container(
                    height: blue,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      red += 10;
                      if (blue - 10 > 0) {
                        blue -= 10;
                      } else {
                        blue = 0;
                        red = halfScreen * 2;
                        winner = 'red';
                      }
                    });
                    print(halfScreen * 2);
                    print(red);
                  },
                  child: Container(
                    color: Colors.red,
                    height: red,
                  ),
                )
              ],
            ),
            Visibility(
              visible: winner != "",
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Winner",
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          winner.toUpperCase(),
                          style: TextStyle(
                            color: winner == "blue" ? Colors.blue : Colors.red,
                            fontSize: 40,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            reset();
                          },
                          child: const ButtonText(
                            buttonText: 'RESTART',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !isBegan,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            TextForm(text: 'FINGER'),
                            SizedBox(
                              width: 20,
                            ),
                            TextForm(text: "BATTLE"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isBegan = true;
                            });
                          },
                          child: const ButtonText(
                            buttonText: 'START',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
