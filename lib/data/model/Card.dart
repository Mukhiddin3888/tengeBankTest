import 'package:flutter/material.dart';
import 'dart:ui';

class CardModel {
  final int id;
  final int cardType;
  final int cardNumber;
  final String background;

  CardModel(
      {required this.id,
      required this.cardType,
      required this.cardNumber,
      required this.background});
}
