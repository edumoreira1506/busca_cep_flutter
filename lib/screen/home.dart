import 'package:busca_cep_flutter/source/remote/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:busca_cep_flutter/model/zip_code_data.dart' as model;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final TextEditingController zipCodeController = TextEditingController();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isLoading = false;
  late AnimationController loadingAnimationController;

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

  Future<void> findZipCode() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Future.delayed(Duration(seconds: 3));

      final dio = Dio();
      final client = RestClient(dio);

      model.ZipCodeData zipCodeData =
          await client.getZipCodeData(widget.zipCodeController.text);

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
            const Text("Busca CEP - Flutter"),
            TextFormField(
              controller: widget.zipCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite um CEP',
                border: OutlineInputBorder(),
              ),
              enabled: !isLoading,
            ),
            ElevatedButton(
              onPressed: isLoading ? null : findZipCode,
              child: const Text("Buscar"),
            ),
            if (isLoading)
              LinearProgressIndicator(
                value: loadingAnimationController.value,
              )
          ],
        ));
  }
}
