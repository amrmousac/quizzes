import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/play_controller.dart';

class PlayView extends GetView<PlayController> {
  const PlayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlayView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PlayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
