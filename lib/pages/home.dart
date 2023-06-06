import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // use any of these for your media query
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Responsive Layouts',
        ),
      ),
      //body: width > 480 ? const GridData() : const ListData(),
      // body: orientation == Orientation.landscape
      //     ? const GridData()
      //     : const ListData());
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1200) {
              return const GridData(
                aspectratio: 8,
              );
            } else if (constraints.maxWidth > 800) {
              return const GridData(aspectratio: 4);
            } else {
              return const ListData();
            }
          },
        ),
      ),
    );
  }
}

class ListData extends StatelessWidget {
  const ListData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 25,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.waves),
            title: Text('Person ${index + 1}'),
          );
        }));
  }
}

class GridData extends StatelessWidget {
  const GridData({
    super.key,
    required this.aspectratio,
  });

  final double aspectratio;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 4,
      children: List.generate(20, (index) {
        return ListTile(
          leading: const Icon(Icons.person),
          trailing: const Icon(Icons.waves),
          title: Text('Person ${index + 1}'),
        );
      }),
    );
  }
}
