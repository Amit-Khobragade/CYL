import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'App/cyl.dart';

void main() async {
  await initHiveForFlutter();
  HttpLink link = HttpLink('http://192.168.43.203:3000/products');
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  CameraDescription cameraDescription = (await availableCameras())[1];
  runApp(
    GraphQLProvider(
      client: client,
      child: Cyl(cameraDescription: cameraDescription),
    ),
  );
}
