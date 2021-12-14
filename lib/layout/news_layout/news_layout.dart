import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/common_widgets.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..isDark,
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, states) {},
        builder: (context, states) {

          var cubit = NewsCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.curIn,
              items: cubit.bottomNavItems,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
            appBar: AppBar(
              title: Text('NewsApp'),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                  ),

                ),
                IconButton(
                  onPressed:(){
                    cubit.changeTheme();
                  },
                  icon: Icon(
                    Icons.brightness_4_sharp,
                    color: Colors.deepPurple,
                  ),

                ),
              ],
            ),
            body: cubit.screens[cubit.curIn],
          );
        },
      ),
    );
  }
}
