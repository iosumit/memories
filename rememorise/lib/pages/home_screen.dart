import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import '../widgets/note_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ReMemorise"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(
                10,
                (i) => StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: i.isEven ? 1.2 : 0.9,
                  child: NoteItem(
                    onTap: () => GoRouter.of(context).push('/home/detail'),
                  ),
                ),
              ).toList()),
        ),
      ),
    );
  }
}
