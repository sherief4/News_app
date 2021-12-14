import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/modules/business_screen/business_screen.dart';
import 'package:news_app/modules/science_screen/science_screen.dart';
import 'package:news_app/modules/sports_screen/sports_screen.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsAppStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int curIn = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_rounded), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball_rounded), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void changeBottomNavBar(int index) {
    curIn = index;
    if(curIn == 1){
      getSportsData();
    }
    if(index == 2){
      getScienceData();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];

  void getBusinessData() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "eg",
      "category": "business",
      "apiKey": "387a107fa3c24b51a9177dd12add1e57"
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      emit(NewsErrorState(e.toString()));
      print(e.toString());
    });
  }

  void getScienceData() {
    emit(NewsLoadingState());
    if(science.length == 0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        "country": "eg",
        "category": "science",
        "apiKey": "387a107fa3c24b51a9177dd12add1e57"
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((e){print(e.toString());});
    }else{
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSportsData() {
    emit(NewsLoadingState());
   if(sports.length ==0 ){
     DioHelper.getData(url: 'v2/top-headlines', query: {
       "country": "eg",
       "category": "sports",
       "apiKey": "387a107fa3c24b51a9177dd12add1e57"
     }).then((value) {
       sports = value.data['articles'];
       emit(NewsGetSportsSuccessState());
     }).catchError((e){print(e.toString());});
   }else{
     emit(NewsGetSportsSuccessState());
   }
   }


  bool isDark = false ;

  void changeTheme(){
   isDark = !isDark ;
   emit(ThemeChanged());
   }

   List <dynamic> search = [] ;
  void getSearchData(String value){
    emit(NewsSearchLoadingState());
    search = [] ;
    DioHelper.getData(url: 'v2/everything', query: {
      'q':value,
      'apiKey':'387a107fa3c24b51a9177dd12add1e57',
    }).then((value) {
      search = value.data ['articles'];
      emit(NewsSearchSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(NewsSearchErrorState());
    });
  }

}
