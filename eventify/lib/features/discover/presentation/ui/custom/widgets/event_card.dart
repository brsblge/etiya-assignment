import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../shared/presentation/extensions/build_context_ext.dart';
import '../../../../../../shared/presentation/extensions/widget_ext.dart';
import '../../../../domain/entities/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEventName(context),
        const SizedBox(height: 4),
        _buildEventAddress(context),
        const SizedBox(height: 4),
        _buildEventDate(context),
      ],
    ).bordered(
      borderColor: context.colorScheme.primaryDefault,
      backgroundColor: context.colorScheme.backgroundSecondary,
      padding: const EdgeInsets.all(8),
      radius: BorderRadius.circular(8),
    );
  }

  // Helpers
  Widget _buildEventName(BuildContext context) {
    return Text(
      event.name,
      style: context.textTheme.bodyBold.apply(
        color: context.colorScheme.textSecondary,
      ),
    );
  }

  Widget _buildEventAddress(BuildContext context) {
    return Text(
      event.address,
      style: context.textTheme.bodyMedium,
    );
  }

  Widget _buildEventDate(BuildContext context) {
    return Text(
      tr(
        'text_event_date',
        args: [DateFormat().format(event.date)],
      ),
      style: context.textTheme.bodyInfoMedium,
    );
  }
  // - Helpers
}
