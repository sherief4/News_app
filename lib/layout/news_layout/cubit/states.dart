abstract class NewsAppStates {}

class NewsInitialState extends NewsAppStates {}

class NewsBottomNavState extends NewsAppStates {}

class NewsGetBusinessSuccessState extends NewsAppStates {}

class NewsGetScienceSuccessState extends NewsAppStates {}

class NewsGetSportsSuccessState extends NewsAppStates {}

class NewsErrorState extends NewsAppStates {
  final String error;
  NewsErrorState(this.error);

}

class NewsLoadingState extends NewsAppStates {

}

class ThemeChanged extends NewsAppStates{

}
class NewsSearchLoadingState extends NewsAppStates{

}
class NewsSearchSuccessState extends NewsAppStates{

}
class NewsSearchErrorState extends NewsAppStates{

}