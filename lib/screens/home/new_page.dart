import 'package:examm/cubit/new_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPage extends StatelessWidget {
  NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.red,
                            child: state is ShowNumbers
                                ? Text(context
                                    .watch<GameCubit>()
                                    .lst1[index]
                                    .toString())
                                : null),
                        onTap: () {
                          context.read<GameCubit>().checkNumbers(
                              BlocProvider.of<GameCubit>(context, listen: false)
                                  .lst1[index]);
                        },
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: context.watch<GameCubit>().lst1.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<GameCubit>().showNumbers();
                      },
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.green,
                      child: Text(context.watch<GameCubit>().right.toString()),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.red,
                      child: Text(context.watch<GameCubit>().wrong.toString()),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
