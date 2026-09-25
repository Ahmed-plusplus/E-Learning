import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors {

  static const primary = Color(0xFF3B71D8);
  static const splashBackground = Color(0xFF1E3A8A);
  static const splashIcon = Color(0xFFFBBF24);
  static const csAcademyTitle = Color(0xFFFFD656);
  static const textFieldTitle = Color(0xFF334155);
  static const eye = Color(0xFF94A3B8);
  static const textFieldBorder = Color(0xFFE2E8F0);
  static const textFieldBackground = Color(0xFFF8FAFC);
  static const textFieldHint = Color(0xFF6B7280);
  static const text1 = Color(0xFF9CA3AF);
  static const text2 = Color(0xFF64748B);
  static const cardTitle = Color(0xFF1F2937);
  static const cardBody = Color(0xFF4B5563);
  static const divider = Color(0xFFE5E7EB);
  static const titleDetails = Color(0xFF1E293B);
  static const priceDetails = Color(0xFF22C55E);
  static const title = Color(0xFF0F172A); // + text of text field
  static const descriptionDetails = Color(0xFF475569);
  static const courseTitle = Color(0xFF111827);
  static const buttonBackground = Color(0xFF3B71DB);
  // static const buttonBackground = Color(0x673AB71A);
  static const logoutColor = Color(0xFFEF4444);

  static final splashIconContainer = splashIcon.withAlpha((10*256/100).roundToDouble().toInt());
  static final splashIconBorder = splashIcon.withAlpha((20*256/100).roundToDouble().toInt());
  static final bottomBarNotSelectedItem = Colors.white.withAlpha((70*256/100).roundToDouble().toInt());
  static final welcomeTitle = Colors.white.withAlpha((90*256/100).roundToDouble().toInt());

  static const white = Colors.white;
  static const black = Colors.black;

}