import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/layout/news_layout/news_layout.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
    providers: [
      BlocProvider(create:  (BuildContext context) => NewsCubit()..getScienceData()..getBusinessData()..getSportsData()),
      BlocProvider(create: (context) => NewsCubit()),
    ],
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepPurple,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.deepPurple),
                  color: Colors.white,
                  elevation: 0.7,
                  titleTextStyle: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                bottomNavigationBarTheme:
                    BottomNavigationBarThemeData(elevation: 0.7)),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepPurple,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Color(0xff333739),
              scaffoldBackgroundColor: Color(0xff333739),
              appBarTheme: const AppBarTheme(
                color: Color(0xff333739),
                elevation: 0.7,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 0.7,
                backgroundColor: Color(0xff333739),
                unselectedIconTheme: IconThemeData(
                  color: Colors.white,
                ),
                selectedItemColor: Colors.deepPurple,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
