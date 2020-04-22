import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/provider/home_provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_provider/model/homeModel/article.dart';
import 'package:flutter_provider/widget/image.dart';
import 'package:quiver/strings.dart';
import 'package:flutter_provider/components/home_page_comps/article_tag.dart';


class ArticleItem extends StatelessWidget {

  //top: 区分是否是置顶文章
  final bool top;

  //item
  final Article item;
  //文章内容
  // final T item;

  ArticleItem({Key key, this.top=false, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Material(
      color: top?Theme.of(context).accentColor.withAlpha(40):backgroundColor,
      child: InkWell(
        onTap:() {
          print('tap');
        },
        child: Container(
          // height: 80,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context,color: Colors.black12,width: 0.7)
            )
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: WrapperImage(
                      imageType: ImageType.random,
                      url: item.author,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      isNotBlank(item.author) ? item.author : item.shareUser ?? '',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Text(item.niceDate,
                      style: Theme.of(context).textTheme.caption),
                ],
              ),
              item.envelopePic.isEmpty ? Padding(
                padding: EdgeInsets.only(top: 7),
                child: ArticleTitleWidget(item.title),
              ) : 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ArticleTitleWidget(item.title),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                           item.desc,
                          style: Theme.of(context).textTheme.caption,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  WrapperImage(
                    url: item?.envelopePic,
                    height: 60,
                    width: 60,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  if( top )ArticleTag("置顶"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      (item.superChapterName != null
                              ? item.superChapterName + ' · '
                              : '') +
                          (item.chapterName ?? ''),
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ),
                ],
              ),
            ]
          )
        )
      )
    );
  }
}




class ArticleTitleWidget extends StatelessWidget {
  final String title;

  ArticleTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Html(
      padding: EdgeInsets.symmetric(vertical: 5),
      useRichText: false,
      data: title,
      defaultTextStyle: Theme.of(context).textTheme.subtitle,
    );
  }
}