enum RequestStepState { completed, pending }

class RequestStatusStep {
  const RequestStatusStep({
    required this.title,
    required this.description,
    required this.state,
    this.timestamp,
    this.isHighlighted = false,
  });

  final String title;
  final String description;
  final RequestStepState state;
  final String? timestamp;

  /// Emphasized title color for the active / current pending step.
  final bool isHighlighted;
}

enum RequestStatusFilter { completed, pending }
