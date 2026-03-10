import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_flutter/screen/naruto_detail_screen.dart';
import '../cubit/naruto_cubit.dart';

class NarutoScreen extends StatefulWidget {
  const NarutoScreen({super.key});

  @override
  State<NarutoScreen> createState() => _NarutoScreenState();
}

class _NarutoScreenState extends State<NarutoScreen> {
  final cubit = NarutoCubit();

  @override
  void initState() {
    super.initState();
    cubit.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Naruto Characters')),
        body: BlocBuilder<NarutoCubit, NarutoState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is Success) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.list.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = state.list[index];
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NarutoDetailScreen(character: item,)
                      )
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                item.image, // Используем наш геттер, он всегда вернет String
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.person, size: 50),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                item.name ?? 'Unknown', // Обработка Null для имени
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is Error) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Press to load'));
          },
        ),
      ),
    );
  }
}
