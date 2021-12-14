import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/common_widgets.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var search = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      NewsCubit.get(context).getSearchData(value);
                    },
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildArticleItem(search[index], context),
                        separatorBuilder: (context , index) => mySeparator(),
                        itemCount: search.length)),
              ],
            ),
          );
        },
      );
  }
}
