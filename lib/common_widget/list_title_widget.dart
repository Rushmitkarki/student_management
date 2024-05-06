import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.fname,
    required this.lname,
    required this.time,
    required this.imageName,
  });

  final String fname;
  final String lname;
  final String time;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/$imageName',
            ),
            radius: 30,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 30,
              width: 30,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      title: Text('$fname $lname '),
      subtitle: Text('$time ago'),
      trailing: Wrap(
        spacing: 8,
        children: [
          Image.asset(
            'assets/images/$imageName',
            height: 50,
          )
        ],
      ),
      onTap: () {},
    );
  }
}
