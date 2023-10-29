import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../stack/base/presentation/controlled_view.dart';
import '../../extensions/widget_ext.dart';
import '../controllers/main_controller.dart';
import '../custom/widgets/navigation_view.dart';

class MainPage extends ControlledView<MainController> {
  MainPage({
    super.key,
    super.params,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      items: [
        NavigationItem(
          label: 'Discover',
          icon: Icons.audiotrack,
          pageBuilder: () => Text(tr('title_app')).centered(),
        ),
        NavigationItem(
          label: 'Default',
          icon: Icons.playlist_play,
          pageBuilder: () => const Text('test2').centered(),
        ),
      ],
    );
  }
}
