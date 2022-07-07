import 'package:dengue/src/routes/app_routes.dart';
import 'package:flutter/material.dart';




import '../src/model/human.dart';

class HumanTile extends StatelessWidget {
 

  final Human human;

  const HumanTile(this.human);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(human.name),
      subtitle: Text(human.email),
      trailing: Container(
        width: 100,
        child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.HUMANEDIT);
            },
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){},
            color: Color.fromARGB(255, 194, 81, 73),
          ),
        ],
      ),
    ),
    );
  }
}