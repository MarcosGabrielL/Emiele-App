
class Notification {
  String id;
  String message;
  String info;
  String date;
  String cod;
  String level;
  String usuario;
  bool isRead;

  Notification({
    required this.id,
    required this.message,
    required this.info,
    required this.date,
    required this.cod,
    required this.level,
    required this.usuario,
    required this.isRead,
  });
}