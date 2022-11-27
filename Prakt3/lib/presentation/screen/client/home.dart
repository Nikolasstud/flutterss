import 'package:flutter/material.dart';

class HomeClient extends StatefulWidget {
  const HomeClient({Key? key}) : super(key: key);

  @override
  State<HomeClient> createState() => _HomeClientState();
}

class _HomeClientState extends State<HomeClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(child: 
        Column(
          children: [
            Text('Вы юзер'),
            SizedBox(height: 100,),
            Container(child: ElevatedButton(
              onPressed: () => 
              Navigator.pushNamedAndRemoveUntil(
                  context, 'sign_in', (route) => false),
              child: Text('Выйти')),
              ),
          ],
        ),
      )
    );
  }
}
