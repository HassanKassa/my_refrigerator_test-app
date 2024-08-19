import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ordered_app/src/item_management/domain/item.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:bot_toast/bot_toast.dart';

import '../application/item_repository_service.dart';

final editItemProvider = FutureProvider.autoDispose
    .family<void, (FormGroup, Item)>((ref, arg) async {
  final itemRepositoryService = ref.watch(itemRepositoryServiceProvider);
  try {
    BotToast.showLoading();
    await itemRepositoryService.updateRefrigeratorItems(arg.$1, arg.$2);
    BotToast.cleanAll();
    BotToast.showText(text: "Done", contentColor: Colors.green);
  } catch (e) {
    // ignore: avoid_print
    print("$e+++++++++++++++++++++++++++++++");
    BotToast.cleanAll();
    BotToast.showText(text: "Error", contentColor: Colors.red);
  }
});
