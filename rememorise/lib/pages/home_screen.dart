import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rememorise/blocs/memories_bloc.dart';
import '../utils/consts.dart';
import '../widgets/note_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MemoriesBloc>(context, listen: false).fetchMemory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final memories = Provider.of<MemoriesBloc>(context, listen: true).memories;
    final syncing = Provider.of<MemoriesBloc>(context, listen: true).isSyncing;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ReMemorise"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).push('/home/detail'),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (syncing)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 14,
                        width: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Syncing...",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Palates.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(
                    memories.length,
                    (i) => StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: i.isEven ? 1.2 : 0.9,
                      child: NoteItem(
                        memory: memories[i],
                        onTap: () => GoRouter.of(context)
                            .push('/home/detail', extra: memories[i]),
                      ),
                    ),
                  ).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
