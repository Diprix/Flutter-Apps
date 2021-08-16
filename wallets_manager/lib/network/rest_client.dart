import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wallets_manager/dto/everthing_response.dart';
import 'package:http/http.dart' as http;

class RestClient {
  Future<EverythingResponse> everything() async {
    final response = await http
        .get(Uri.parse('https://newsapi.org/v2/everything?q=italy'), headers: {
      HttpHeaders.authorizationHeader: 'Bearer 93a5d6393ff64983a58f999357462959'
    });

    if (response.statusCode == 200) {
      return EverythingResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Errore API');
    }
  }

  Future<EverythingResponse> getBuyPrice() async {
    final response = await http.get(
      Uri.parse('https://api.coinbase.com/v2/prices/BTC-USD/buy'),
      // headers: {
      //   HttpHeaders.authorizationHeader:
      //       'Bearer 93a5d6393ff64983a58f999357462959'
      // },
    );

    if (response.statusCode == 200) {
      return EverythingResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Errore API');
    }
  }

}
