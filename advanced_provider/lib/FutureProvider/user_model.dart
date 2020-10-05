// User Model
class User {
  final String name, job, website;
  const User(this.name, this.job, this.website);

  User.fromJson(Map<String, dynamic> json):
        this.name = json['name'],
        this.job = json['job'],
        this.website = json['website'];

  Map<String, dynamic> toJson() => {
    "name": this.name,
    "job": this.job,
    "website": this.website
  };
}

// User List Model
class UserList {
  final List<User> users;
  UserList(this.users);

  UserList.fromJson(List<dynamic> usersJson) :
        users = usersJson.map((user) => User.fromJson(user)).toList();
}