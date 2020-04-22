import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';


class StringUtils {
  static urlDecoder(String data) {
    return data == null ? null : HtmlUnescape().convert(data); 
  }
}