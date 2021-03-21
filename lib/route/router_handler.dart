import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:ticketunion/pages/DetailsPage.dart';




Handler detailsHanderl =Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      String goodsId = params['id'].first;
      String src = params['src'].first;
         //String               =params['url'];
      print('index>details goodsID is ${goodsId}');
      return DetailsPage(goodsId,src);
    }
);


