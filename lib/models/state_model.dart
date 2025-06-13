class StateModel {
  final List<AppState>? data;
  final String? error;

  StateModel({this.data, this.error});

  StateModel.withError(String errorMessage)
      : data = [],
        error = errorMessage;

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppState.fromJson(e))
          .toList(),
    );
  }
}

class AppState {
  final int stateId;
  final String stateName;
  final String stateCode;
  final String latitude;
  final String longitude;
  final String stateType;
  final int country;

  AppState({
    required this.stateId,
    required this.stateName,
    required this.stateCode,
    required this.latitude,
    required this.longitude,
    required this.stateType,
    required this.country,
  });

  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(
      stateId: json['id'] ?? 0,
      stateName: json['name'] ?? "",
      stateCode: json['state_code'] ?? "",
      latitude: json['latitude'] ?? "",
      longitude: json['longitude'] ?? "",
      stateType: json['state_type'] ?? "",
      country: json['country'] ?? 0,
    );
  }
}
