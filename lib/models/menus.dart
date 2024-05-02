
class Menus{
  List<Menus> menusFromJson(dynamic str) =>
      List<Menus>.from((str).map((x) => Menus.fromJson(x)));
  final String title;
  final String  body;

  Menus({required this.title, required this.body,} );
  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
        title: json['title'],
        body: json['body']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body
    };
  }


}