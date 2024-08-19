import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:bot_toast/bot_toast.dart';

import '../application/item_repository_service.dart';


final addItemProvider =
    FutureProvider.autoDispose.family((ref, FormGroup formGroup) async {
  final itemRepositoryService = ref.watch(itemRepositoryServiceProvider);
  try {
    BotToast.showLoading();
    await itemRepositoryService.createRefrigeratorItems(formGroup);
    BotToast.cleanAll();
    BotToast.showText(text: "Done", contentColor: Colors.green);
  } catch (e) {
    // ignore: avoid_print
    print("$e+++++++++++++++++++++++++++++++");
    BotToast.cleanAll();
    BotToast.showText(text: "Error", contentColor: Colors.red);
  }
});
