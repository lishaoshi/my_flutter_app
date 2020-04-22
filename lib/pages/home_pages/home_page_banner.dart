import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/provider/home_provider.dart';


class BannerWidget extends StatelessWidget {
  const BannerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Consumer<HomeProvider>(
          builder: (_, homeValue, __) {
            if(homeValue.banners.isEmpty) {
              print(homeValue.banners);
              return CupertinoActivityIndicator();
            }
            return Swiper(
              itemCount: homeValue.banners.length,
              // controller: SwiperController(),
              loop: true,
              pagination: SwiperPagination(),
              autoplay: true,
              itemBuilder: (_, index) {
                return Image.network("${homeValue.banners[index].imagePath}", fit: BoxFit.fill,);
              },

            );
          },
        ),
    );
  }
}