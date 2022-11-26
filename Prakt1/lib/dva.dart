import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prakt1/tri.dart';

class dva extends StatelessWidget {
  const dva({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 26),
              width: 343,
              height: 231,
              decoration: BoxDecoration(
                  color: const Color(0xffF2C94C),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset('lib/assets/man.png'),
            ),
            Container(
              width: 343,
              height: 24,
              margin: const EdgeInsets.only(top: 12),
              child: const Text(
                'Peter Mach',
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'PlusJakartaSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
            Container(
              width: 343,
              margin: const EdgeInsets.only(top: 1),
              child: const Text(
                'Mind Deep Relax',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PlusJakartaSans',
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            Container(
              width: 343,
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PlusJakartaSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
            Container(
                width: 343,
                height: 50,
                margin: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => tri()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff039EA2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(right: 14),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 24,
                            )),
                        Container(
                            child: const Text(
                          'Play Next Session',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )),
                      ],
                    ))),
            Container(
              width: 343,
              height: 73,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff2F80ED)),
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 200,
                              margin: const EdgeInsets.only(left: 13),
                              child: const Text(
                                'Sweet Memories',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17),
                              ),
                            ),
                            Container(
                              width: 200,
                              margin: const EdgeInsets.only(left: 13),
                              child: const Text(
                                'December 29 Pre-Launch',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                margin: EdgeInsets.only(right: 16),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.more_horiz,
                                    size: 36,
                                    color: Color(0xffD9D9D9),
                                  ),
                                ))))
                  ]),
            ),
            Container(
              color: Color(0xffD9D9D9),
              width: 343,
              height: 1,
            ),
            Container(
              width: 343,
              height: 73,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff039EA2)),
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 200,
                              margin: const EdgeInsets.only(left: 13),
                              child: const Text(
                                'A Day Dream',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17),
                              ),
                            ),
                            Container(
                              width: 200,
                              margin: const EdgeInsets.only(left: 13),
                              child: const Text(
                                'December 29 Pre-Launch',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                margin: EdgeInsets.only(right: 16),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.more_horiz,
                                    size: 36,
                                    color: Color(0xffD9D9D9),
                                  ),
                                ))))
                  ]),
            ),
            Container(
              color: Color(0xffD9D9D9),
              width: 343,
              height: 1,
            ),
            Container(
              width: 343,
              height: 73,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffF09235)),
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 200,
                              margin: const EdgeInsets.only(left: 13),
                              child: const Text(
                                'Mind Explore',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17),
                              ),
                            ),
                            Container(
                              width: 200,
                              margin: const EdgeInsets.only(left: 13),
                              child: const Text(
                                'December 29 Pre-Launch',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                margin: EdgeInsets.only(right: 16),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.more_horiz,
                                    size: 36,
                                    color: Color(0xffD9D9D9),
                                  ),
                                ))))
                  ]),
            ),
            Container(
              color: Color(0xffD9D9D9),
              width: 343,
              height: 1,
            ),
          ],
        ),
      ))),
    );
  }
}
