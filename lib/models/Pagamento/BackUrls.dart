
class BackUrls {
  String success;
  String pending;
  String failure;

  BackUrls({required this.success, required  this.pending, required this.failure});

  factory BackUrls.fromJson(Map<String, dynamic> json) {
    return BackUrls(
      success: json['success'],
      pending: json['pending'],
      failure: json['failure'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'pending': pending,
      'failure': failure,
    };
  }
}