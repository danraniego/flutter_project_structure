class ApiResponse{
  bool success = false;
  String? message;
  Map? data;

  ApiResponse({
    required this.success,
    this.message,
    this.data
  });
}
