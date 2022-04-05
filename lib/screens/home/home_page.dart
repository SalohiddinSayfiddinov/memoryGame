import 'package:examm/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _inputController = TextEditingController();
  List lst1 = [];
  dynamic b = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountCubit(),
      child: BlocConsumer<CountCubit, CountState>(
        listener: (context, state) {
          if (state is CountZero) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Timer Tugadi",
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      child: const Icon(Icons.arrow_downward),
                      onPressed: () {
                        context.read<CountCubit>().changeValue('-');
                      },
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.arrow_upward),
                      onPressed: () {
                        context.read<CountCubit>().changeValue('+');
                      },
                    ),
                  ],
                ),
                Text(
                  context.watch<CountCubit>().count.toString(),
                ),
                ElevatedButton(
                  child: const Text("Set Timer"),
                  onPressed: () {
                    context.read<CountCubit>().startTimer();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void hisobla(List<String> nums) {
    num jami = 0;
    nums.forEach(
      (element) {
        jami += double.parse(element);
      },
    );
    debugPrint("Jami: " + jami.toString());
  }
}
