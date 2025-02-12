import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/features/counter/cubit/counter_cubit.dart';
import 'package:ict_final/features/login/login_screen.dart';
import 'package:ict_final/features/logout/logout_cubit.dart';
import 'package:ict_final/register/register_cubit/auth_cubit_states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Counter Screen"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        iconSize: 45,
                        onPressed: () {
                          context.read<CounterCubit>().decrementCounter();
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text("$state", style: TextStyle(fontSize: 45)),
                      IconButton(
                        iconSize: 45,
                        onPressed: () {
                          context.read<CounterCubit>().incrementCounter();
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  BlocProvider(
                    create: (context) => LogoutCubit(),
                    child: BlocConsumer<LogoutCubit, AuthStates>(
                      listener: (context, state) {
                        if (state is LogoutSuccessState) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        } else if (state is LogoutErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errMsg),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<LogoutCubit>().logout();
                          },
                          child: state is LogoutLoadingState
                              ? CircularProgressIndicator()
                              : Text("logout"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
