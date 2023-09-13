enum Endpoints {
  token('Token'),
  getUserData('api/MobileApp/GetUserData?UserId=2&LoginUserId=2'),
  updateUser('api/MobileApp/UpsertUsers'),

  // !default
  unknown('unknown');

  final String url;
  const Endpoints(this.url);
}
