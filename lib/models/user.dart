class UserDetails {
  String uid = '';
  String username = '';
  String email = '';
  String address = '';
  String phone = '';
  UserDetails.init();
  UserDetails({required this.uid});
  UserDetails.getDetails({
    required this.uid,
    required this.username,
    required this.email,
  });
}
