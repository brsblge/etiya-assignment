import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/presentation/extensions/widget_ext.dart';
import '../../../../../shared/presentation/ui/custom/widgets/progress_spinner.dart';
import '../../../../../stack/base/presentation/controlled_view.dart';
import '../../../domain/entities/event.dart';
import '../../cubits/event_cubit.dart';
import '../controllers/discover_controller.dart';
import '../custom/widgets/event_card.dart';

class DiscoverPage extends ControlledView<DiscoverController, Object> {
  DiscoverPage({super.key, super.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          if (state is EventsLoading) {
            return const ProgressSpinner();
          } else if (state is EventsLoaded) {
            return _EventsListView(state.events);
          } else {
            return Text(tr('error_fetch_events')).centered();
          }
        },
      ),
    );
  }
}

class _EventsListView extends StatelessWidget {
  const _EventsListView(this.events);

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    const itemSpacing = 16.0;

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index != events.length - 1 ? itemSpacing : 0,
          ),
          child: EventCard(event: events[index]),
        );
      },
      padding: const EdgeInsets.all(16),
    );
  }
}
