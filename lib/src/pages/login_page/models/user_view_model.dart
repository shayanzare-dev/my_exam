class UserViewModel {
  final int id;
  final String userName;
  final String password;

  const UserViewModel(
      {required this.id, required this.userName, required this.password});

  factory UserViewModel.fromJson({required final Map<String, dynamic> json}) =>
      UserViewModel(
          id: json['id'],
          userName: json['userName'],
          password: json['password']);

  @override
  String toString() {
    return 'UserViewModel{id: $id, userName: $userName, password: $password}';
  }
}
