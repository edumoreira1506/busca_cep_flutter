import 'package:busca_cep_flutter/source/local/database.dart';
import 'package:busca_cep_flutter/source/remote/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:busca_cep_flutter/model/zip_code_data.dart' as model;
import 'dart:async';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final TextEditingController zipCodeController = TextEditingController();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isLoading = false;
  late AnimationController loadingAnimationController;
  final database = AppDatabase();
  String batteryLevel = '';

  static const platform = MethodChannel('samples.flutter.dev/battery');

  @override
  void initState() {
    loadingAnimationController = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });

    loadingAnimationController.repeat();
    super.initState();
  }

  Future<void> getBatteryLevel() async {
    setState(() {
      isLoading = true;
    });

    String newBatteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      newBatteryLevel = 'Nível de bateria $result %';
    } on PlatformException catch (e) {
      newBatteryLevel = "Erro obtendo nível de bateria: '${e.message}'.";
    }

    setState(() {
      batteryLevel = newBatteryLevel;
      isLoading = false;
    });
  }

  Future<List<ZipCodeDataData>> getZipCodesFromDB() async {
    List<ZipCodeDataData> allItems =
        await database.select(database.zipCodeData).get();

    return allItems;
  }

  Future<void> findZipCode() async {
    setState(() {
      isLoading = true;
    });

    try {
      var typedZipCode = widget.zipCodeController.text.replaceAll("\\D", "");
      var zipCodesFromDB = await getZipCodesFromDB();
      var zipCodePersisted = zipCodesFromDB.firstWhere(
          (item) => item.cep == typedZipCode,
          orElse: () => const ZipCodeDataData(
              cep: "", estado: "", localidade: "", bairro: "", logradouro: ""));

      model.ZipCodeData zipCodeData;

      // It uses DB data when the zipcode is already stored
      if (zipCodePersisted.cep != "") {
        zipCodeData = model.ZipCodeData(
            cep: zipCodePersisted.cep,
            localidade: zipCodePersisted.localidade,
            estado: zipCodePersisted.estado,
            bairro: zipCodePersisted.bairro,
            logradouro: zipCodePersisted.logradouro);
      } else {
        await Future.delayed(const Duration(seconds: 3));

        final dio = Dio();
        final client = RestClient(dio);

        zipCodeData =
            await client.getZipCodeData(widget.zipCodeController.text);

        database.into(database.zipCodeData).insert(ZipCodeDataCompanion.insert(
            cep: typedZipCode,
            localidade: zipCodeData.localidade ?? "",
            estado: zipCodeData.estado ?? "",
            bairro: zipCodeData.bairro ?? "",
            logradouro: zipCodeData.logradouro ?? ""));
      }

      showBottomSheet(
        enableDrag: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                title: Text('Estado: ${zipCodeData.estado}'),
              ),
              ListTile(
                title: Text('Cidade: ${zipCodeData.localidade}'),
              ),
              ListTile(
                title: Text('Bairro: ${zipCodeData.bairro}'),
              ),
              ListTile(
                title: Text('Logradouro: ${zipCodeData.logradouro}'),
              ),
            ],
          );
        },
      );
    } on Exception {
      var snackBar = const SnackBar(
        content: Text('Algo deu errado, tente novamente'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Busca CEP - Flutter",
                style: Theme.of(context).textTheme.titleLarge),
            TextFormField(
              controller: widget.zipCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite um CEP',
                border: const OutlineInputBorder(),
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              enabled: !isLoading,
            ),
            ElevatedButton(
              onPressed: isLoading ? null : findZipCode,
              child: const Text("Buscar"),
            ),
            ElevatedButton(
              onPressed: isLoading ? null : getBatteryLevel,
              child: const Text("Ver nível de bateria"),
            ),
            Text(batteryLevel),
            if (isLoading)
              LinearProgressIndicator(
                value: loadingAnimationController.value,
              )
          ],
        ));
  }
}
