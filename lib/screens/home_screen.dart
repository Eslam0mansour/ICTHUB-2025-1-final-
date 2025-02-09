import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/functions/show_msg.dart';
import 'package:ict_final/home_cubit/home_cubit.dart';
import 'package:ict_final/home_cubit/home_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is GetProductsErrorState) {
            showMsg(context, "Error.....!");
          }

        },
        builder: (context, state) {
          HomeCubit homeCubit = context.read<HomeCubit>();

          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title: Text('Home Screen'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            body: state is GetProductsLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  )
                : ListView.builder(
                    itemCount: homeCubit.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                homeCubit.products[index].image,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeCubit.products[index].title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    homeCubit.products[index].description
                                        .toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Text(
                                    homeCubit.products[index].price.toString(),
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
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
