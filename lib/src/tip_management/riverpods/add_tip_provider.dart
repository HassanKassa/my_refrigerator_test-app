import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/tip_management/application/tip_repository_service.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:bot_toast/bot_toast.dart';

final addTipProvider =
    FutureProvider.autoDispose.family((ref, FormGroup formGroup) async {
  final tipRepositoryService = ref.watch(tipRepositoryServiceProvider);
  try {
    BotToast.showLoading();
    await tipRepositoryService.createStorageTips(formGroup);
    BotToast.cleanAll();
    BotToast.showText(text: "Done", contentColor: Colors.green);
  } catch (e) {
    // ignore: avoid_print
    print("$e+++++++++++++++++++++++++++++++");
    BotToast.cleanAll();
    BotToast.showText(text: "Error", contentColor: Colors.red);
  }
});
