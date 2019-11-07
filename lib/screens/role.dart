import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            child: Container(
              color: Colors.greenAccent,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  children:[
                    Expanded(flex: 3, child:Container(child: Image.asset('assets/images/professor.png'))),
                    Expanded(flex: 1, child:Container(padding: const EdgeInsets.all(15.0), child: Text("Start a lecture", style: Theme.of(context).textTheme.title)))
                  ]
              ),
            )
        ),
        Expanded(
            child: Container(
                color: Colors.orangeAccent,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    children:[
                      Expanded(flex: 3, child: Container(child: Image.asset('assets/images/student.png'))),
                      Expanded(flex: 1, child: Container(padding: const EdgeInsets.all(15.0), child: Text("Join a lecture", style: Theme.of(context).textTheme.title))),
                    ]
                )
            )
        )
      ],
    );

  }
}