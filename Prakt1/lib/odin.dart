import 'package:flutter/material.dart';
import 'package:prakt1/dva.dart';

class odin extends StatelessWidget {
  const odin({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xff039EA2),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 149),
                  height: 30,
                  width: 184,
                  child: Image.asset('lib/assets/medinow.png'),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 12.5),
                    child: const Text('Meditate With Us!',
                        style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            color: Colors.white,
                            fontSize: 17))),
                Container(
                    width: 342,
                    height: 50,
                    margin: EdgeInsets.only(top: 45),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      child: const Text(
                        'Sign in with Apple',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    )),
                Container(
                    width: 342,
                    height: 50,
                    margin: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffCDFDFE),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      child: const Text(
                        'Continue with Email or Phone',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 12),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => dva()));
                        },
                        child: const Text(
                          'Continue With Google',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ))),
                Container(
                  margin: const EdgeInsets.only(top: 90),
                  height: 284,
                  width: 377,
                  child: Image.asset('lib/assets/meditate.png'),
                ),
              ]),
        ))));
  }
}
