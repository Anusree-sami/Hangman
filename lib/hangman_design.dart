import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Hangman extends StatefulWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  int count = 0;
  int answer=0;
  bool l1 = false;
  bool l2 = false;
  bool l3 = false;
  bool l4 = false;
  bool l5 = false;
  bool head = false;
  bool body = false;
  bool lh = false;
  bool rh = false;
  bool ll = false;
  bool rl = false;
  void reset(){
    count=0;
    answer=0;
     l1 = false;
     l2 = false;
     l3 = false;
     l4 = false;
     l5 = false;
     head = false;
     body = false;
     lh = false;
     rh = false;
     ll = false;
     rl = false;
  }
  myLetter(String character,bool _visible) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 35,
          width: 10,
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Visibility(
              visible: _visible,
              child: Text(
                character,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  alphabets(String letter) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: InkWell(
          onTap: () {
            setState(() {
              if(answer == 4 || count ==6){
                if(answer == 4 && count<=6){
                  Alert(
                    context: context,
                    title: "WINNER",
                    image: Container(
                        height: 80,
                        width: 80,
                        child: Image.asset("images/tick.png")),
                  ).show();
                  reset();
                }
                else {
                  Alert(
                    context: context,
                    title: "BETTER LUCK NEXT TIME",
                    image: Container(
                        height: 80,
                        width: 80,
                        child: Image.asset("images/lose.png")),
                  ).show();
                  reset();
                }

              }
              else {
                if (letter == 'H') {
                  answer += 1;
                  l1 = true;
                } else if (letter == "E") {
                  answer += 1;
                  l2 = true;
                } else if (letter == "L") {
                  answer += 1;
                  l3 = true;
                  l4 =true;
                } else if (letter == "O") {
                  answer += 1;
                  l5 = true;
                } else {
                  count += 1;
                  if (count == 1) {
                    head = true;
                  } else if (count == 2) {
                    body = true;
                  } else if (count == 3) {
                    lh = true;
                  } else if (count == 4) {
                    rh = true;
                  } else if (count == 5) {
                    ll = true;
                  } else if (count == 6) {
                    rl = true;
                  }
                }
                print("$answer \n $count");
              }
            });
          },
          child: Container(
            height: 35,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Stack(
                  children: [
                    Image.asset('images/hang.png'),
                    Visibility(
                        visible: head, child: Image.asset('images/head.png')),
                    Visibility(
                        visible: body, child: Image.asset('images/body.png')),
                    Visibility(
                        visible: lh, child: Image.asset('images/left_hand.png')),
                    Visibility(
                        visible: rh, child: Image.asset('images/right_hand.png')),
                    Visibility(
                        visible: ll, child: Image.asset('images/left_leg.png')),
                    Visibility(
                        visible: rl, child: Image.asset('images/right_leg.png')),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              myLetter('H',l1),
              myLetter('E',l2),
              myLetter('L',l3),
              myLetter('L',l4),
              myLetter('O',l5),
              
            ],
          ),
          /*  Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 5/4,
                ) ,
                itemCount: word.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Visibility(
                        visible: _visibile,
                        child: Text(
                          word[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                      ),
                    ),
                  );

                },
            ),
          ),*/
          SizedBox(height: 10,),
          Row(
            children: [
              alphabets('A'),
              alphabets('B'),
              alphabets('C'),
              alphabets('D'),
              alphabets('E'),
              alphabets('F'),
            ],
          ),
          Row(
            children: [
              alphabets('G'),
              alphabets('H'),
              alphabets('I'),
              alphabets('J'),
              alphabets('K'),
              alphabets('L'),
            ],
          ),
          Row(
            children: [
              alphabets('M'),
              alphabets('N'),
              alphabets('O'),
              alphabets('P'),
              alphabets('Q'),
              alphabets('R'),
            ],
          ),
          Row(
            children: [
              alphabets('S'),
              alphabets('T'),
              alphabets('U'),
              alphabets('V'),
              alphabets('W'),
              alphabets('X'),
            ],
          ),
          Row(
            children: [
              alphabets('Y'),
              alphabets('Z'),
            ],
          ),
        ],
      ),
    );
  }
}
