import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool click = true;
    final List<String> names = <String>[
      'all',
      'Bible in a Year',
      'Dailies',
      'Minutes',
      'Novenber'
    ];
    final List<String> name_program = <String>[
      'Sleep Hour',
      'Easy on the Mission',
    ];

    final List<String> name_program_ = <String>[
      'Relax with Me',
      'Sun and Energy'
    ];
    final List<String> Author = <String>['Ashna Mukherjee', 'Peter Mach'];
    final List<String> Author_ = <String>['Amanda James', 'Micheal Hiu'];
    final List<String> image_name = <String>[
      'lib/assets/img1.png',
      'lib/assets/img3.png'
    ];
    final List<String> image_name_ = <String>[
      'lib/assets/img2.png',
      'lib/assets/img4.png'
    ];
    final List<String> status = <String>['3 Session', '5 minutes'];
    return Scaffold(
      body: Column(children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: const Text("Meditate",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
            ),
            Container(
              width: 200,
            ),
            Container(
                child: Image.asset(
              'lib/assets/loupe.png',
              height: 20,
            ))
          ],
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemCount: names.length,
              itemBuilder: (context, int index) {
                return Center(
                    child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: const Color(0xffE6FEFF),
                        onPrimary: const Color(0xff039EA2)),
                    child: Text('${names[index]}'),
                  ),
                ));
              }),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset('lib/assets/big_sun.png'),
            const Text(
              "A Song of Moon",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            ),
            const Text(
              "Start with the basics",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 7),
                    child: Image.asset(
                      'lib/assets/heart.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                  Container(
                    child: const Text('9 Session',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.grey)),
                  ),
                  Container(
                    width: 160,
                  ),
                  Container(
                    child: const Text('Start',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.grey)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7),
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'lib/assets/arrow.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
        Expanded(
          flex: 3,
          child: ((ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          '${image_name[index]}',
                          width: 170,
                          height: 90,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${name_program[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            '${Author[index]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          margin: EdgeInsets.only(top: 2),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(right: 7),
                                child: Image.asset(
                                  'lib/assets/heart.png',
                                  width: 7,
                                  height: 7,
                                ),
                              ),
                              Container(
                                child: Text('${status[index]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.grey)),
                              ),
                              Container(
                                width: 60,
                              ),
                              Container(
                                child: const Text('Start',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.grey)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 7),
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'lib/assets/arrow.png',
                                  width: 7,
                                  height: 7,
                                ),
                              ),
                            ],
                          ))
                    ]);
              },
              separatorBuilder: ((context, index) =>
                  Container(height: 1, color: Colors.grey)),
              itemCount: name_program.length))),
        ),
        Expanded(
          flex: 3,
          child: ((ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          '${image_name_[index]}',
                          width: 170,
                          height: 90,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${name_program_[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            '${Author_[index]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          margin: EdgeInsets.only(top: 2),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(right: 7),
                                child: Image.asset(
                                  'lib/assets/heart.png',
                                  width: 7,
                                  height: 7,
                                ),
                              ),
                              Container(
                                child: Text('${status[index]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.grey)),
                              ),
                              Container(
                                width: 60,
                              ),
                              Container(
                                child: const Text('Start',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.grey)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 7),
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'lib/assets/arrow.png',
                                  width: 7,
                                  height: 7,
                                ),
                              ),
                            ],
                          ))
                    ]);
              },
              separatorBuilder: ((context, index) =>
                  Container(height: 1, color: Colors.grey)),
              itemCount: name_program.length))),
        ),
      ]),
    );
  }
}
