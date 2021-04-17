import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CacheImageManger{


  static Widget CaheImage(url,{height,witdh}){
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: witdh,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
              colorFilter:
              ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );

}
}