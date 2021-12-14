import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/common_widgets.dart';

class ScienceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getScienceData(),

      child: BlocConsumer<NewsCubit , NewsAppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
           var  list = NewsCubit.get(context).science;
          if(list.length ==0 ){
            return Center(child: CircularProgressIndicator());
          }else{
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildArticleItem(list[index], context),
                separatorBuilder: (context, index) => mySeparator(),
                itemCount: list.length);
          }
        },

      ),
    );
  }
}
