import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';

Widget buildArticleItem(Map article , BuildContext context) {
  return InkWell(
    onTap: (){
      navigateTo(context, WebViewScreen(url: '${article['url']}',));
      
    },
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: NetworkImage(
                  '${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  '${article['title']}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
                Text(
                  '${article['publishedAt']}',
                  style:Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget mySeparator() {
  return Padding(
    padding: EdgeInsets.all(8.0),
  );
}
void navigateTo(BuildContext context , Widget route)=> Navigator.of(context).push(MaterialPageRoute(builder: (build){return route ;}));
