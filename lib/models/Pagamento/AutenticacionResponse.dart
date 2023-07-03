
class AutenticacionResponse {
  String access_token;
  String token_type;
  int expires_in;
  String scope;
  int user_id;
  String refresh_token;

  AutenticacionResponse({
    required this.access_token,
    required this.token_type,
    required this.expires_in,
    required  this.scope,
    required this.user_id,
    required this.refresh_token,
  });

  factory AutenticacionResponse.fromJson(Map<String, dynamic> json) {
    return AutenticacionResponse(
      access_token: json['access_token'],
      token_type: json['token_type'],
      expires_in: json['expires_in'],
      scope: json['scope'],
      user_id: json['user_id'],
      refresh_token: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': access_token,
      'token_type': token_type,
      'expires_in': expires_in,
      'scope': scope,
      'user_id': user_id,
      'refresh_token': refresh_token,
    };
  }
}