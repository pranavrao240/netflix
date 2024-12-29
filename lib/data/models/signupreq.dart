class Signupreq {
  final String email;
  final String password;

  Signupreq({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password};
  }
}
