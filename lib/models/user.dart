class UserUID {
  final String uid;
  String username = '';
  String email = '';
  UserUID({required this.uid});
  UserUID.getDetails({
    required this.uid,
    required this.username,
    required this.email,
  });
}
