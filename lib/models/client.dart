class Client {
  final String clientNIC;
  final String visitType;
  final String branchLatitude;
  final String branchLongitude;
  final String comment;
  final String userId;
  final String visitTypeName;
  final DateTime visitDateTime;

  Client({
    required this.clientNIC,
    required this.visitType,
    required this.branchLatitude,
    required this.branchLongitude,
    required this.comment,
    required this.userId,
    required this.visitTypeName,
    required this.visitDateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      "clientNIC": clientNIC,
      "visitType": visitType,
      "branchLatitude": branchLatitude,
      "branchLongitude": branchLongitude,
      "comment": comment,
      "userId": userId,
      "visitTypeName": visitTypeName,
      "visitDateTime": visitDateTime.toIso8601String(),
    };
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      clientNIC: json['clientNIC'] ?? '',
      visitType: json['visitType'] ?? '',
      branchLatitude: json['branchLatitude'] ?? '',
      branchLongitude: json['branchLongitude'] ?? '',
      comment: json['comment'] ?? '',
      userId: json['userId'] ?? '',
      visitTypeName: json['visitTypeName'] ?? '',
      visitDateTime:
          DateTime.tryParse(json['visitDateTime'] ?? '') ?? DateTime.now(),
    );
  }
}
