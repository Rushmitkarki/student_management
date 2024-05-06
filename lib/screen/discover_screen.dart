import 'package:flutter/material.dart';

import '../common_widget/list_title_widget.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ListTileWidget> lists = [
      const ListTileWidget(
          fname: 'Rushmit',
          lname: 'Karki',
          time: '2h',
          imageName: 'rushmit.jpg'),
      const ListTileWidget(
          fname: 'Rushmit',
          lname: 'Karki',
          time: '2h',
          imageName: 'rushmit.jpg'),
      const ListTileWidget(
          fname: 'Rushmit',
          lname: 'karki',
          time: '2h',
          imageName: 'rushmit.jpg'),
      const ListTileWidget(
          fname: 'Rushmit',
          lname: 'karki',
          time: '2h',
          imageName: 'rushmit.jpg'),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Discover'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: lists.length,
                  itemBuilder: (context, index) {
                    return lists[index];
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
