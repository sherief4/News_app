import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/common_widgets.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      NewsCubit()..getSportsData(),
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit
              .get(context)
              .sports;
          if (list.length ==0) {
            return Center(child: CircularProgressIndicator(),);
          }
          else {
            return ListView.separated(
              itemBuilder:(context , index)=> buildArticleItem(list[index] ,context),
              separatorBuilder: (context, index) => mySeparator(),
              itemCount: list.length,);
          }
        },
      ),
    );
  }
}
