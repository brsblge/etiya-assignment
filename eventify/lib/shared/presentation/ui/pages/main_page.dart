import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../features/discover/presentation/ui/pages/discover_page.dart';
import '../../../../stack/base/presentation/controlled_view.dart';
import '../../extensions/widget_ext.dart';
import '../controllers/main_controller.dart';
import '../custom/widgets/navigation_view.dart';

class MainPage extends ControlledView<MainController, Object> {
  MainPage({
    super.key,
    super.params,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      items: [
        NavigationItem(
          label: tr('title_discover'),
          icon: Icons.event,
          pageBuilder: () => DiscoverPage(),
        ),
        NavigationItem(
          label: tr('title_settings'),
          icon: Icons.settings,
          pageBuilder: () => Text(
            tr('title_settings'),
          ).centered(),
        ),
      ],
    );
  }
}
