import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleCubitScreen extends StatelessWidget {
  const MultipleCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Cubits'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: state.isDarkmode
                    ? const Icon(Icons.light_mode_outlined, size: 100)
                    : const Icon(
                        Icons.dark_mode_outlined,
                        size: 100,
                      ),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
          BlocBuilder<UsernameCubit, String>(
            builder: (context, state) {
              return Text(state, style: TextStyle(fontSize: 25));
            },
          ),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return TextButton.icon(
                icon: const Icon(
                  Icons.add,
                  size: 50,
                ),
                label: Text('$state', style: TextStyle(fontSize: 100)),
                onPressed: () {
                  context.read<CounterCubit>().incrementBy(2);
                },
              );
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          context
              .read<UsernameCubit>()
              .setUsername(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}
