import 'package:flutter/material.dart';
import 'package:insights_news/core/app_colors.dart';

class NotificatonsView extends StatefulWidget {
  const NotificatonsView({super.key});

  @override
  State<NotificatonsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NotificatonsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      'Notificatons',
      style: TextStyle(color: AppColors.lomanada),
    )));
  }
}
