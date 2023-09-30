import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main(List<String> arguments) async {
  final response = await http.get(Uri.https('dummyjson.com', '/products'));
  Map<String, dynamic> data = convert.jsonDecode(response.body);

  List<dynamic> products = data['products'];
  List<dynamic> ratings = products.map((r) => r['rating'] as dynamic).toList();

  double sum = 0.0;

  ratings.forEach(
    (element) {
      sum += element;
    },
  );
  print(sum / ratings.length);
  print(sum);
}
