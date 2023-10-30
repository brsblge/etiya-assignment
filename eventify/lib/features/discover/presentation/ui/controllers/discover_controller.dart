import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../stack/base/presentation/controller.dart';
import '../../cubits/event_cubit.dart';

class DiscoverController extends Controller<Object> {
  DiscoverController(
    super.logger,
    super.localizor,
    super.routeManager,
    super.popupManager,
  );

  @override
  void onStart() {
    super.onStart();
    context.read<EventCubit>().fetchEvents();
  }
}
