import 'package:bloc_rick_morty/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/characters_bloc.dart';
import '../../domain/entities/character.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    
    context.read<CharactersBloc>().add(const CharactersFetched());

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll - 200) {
      
      context.read<CharactersBloc>().add(const CharactersFetched());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBg,
        title: const Text('Clean + BLoC + Dio', ),
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state.status == CharactersStatus.loading &&
              state.characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == CharactersStatus.failure) {
            return Center(
              child: Text(state.errorMessage ?? 'Ката чыкты'),
            );
          }

          if (state.characters.isEmpty) {
            return const Center(child: Text('Маалымат табылган жок'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<CharactersBloc>()
                  .add(const CharactersFetched(refresh: true));
            },
            child: GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: state.hasReachedEnd
                  ? state.characters.length
                  : state.characters.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                if (index >= state.characters.length) {
                  
                  return const Center(child: CircularProgressIndicator());
                }

                final Character c = state.characters[index];

                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          c.image,
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        c.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        c.status,
                        style: TextStyle(
                          color: c.status == "Alive"
                              ? AppColors.alive
                              : AppColors.dead,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
