import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:requisicoes/model/via_cep_response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  ViaCepResponse viaCepResponse = ViaCepResponse();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getDataFromCep() async {
    final resultado = await Dio().get(
      'https://viacep.com.br/ws/${_controller.text}/json/',
    );

    setState(() {
      viaCepResponse = ViaCepResponse.fromJson(resultado.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Cep'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                helperText: 'Digite seu cep',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                ),
              ),
            ),
            Text(viaCepResponse.cep != null ? viaCepResponse.cep! : ''),
            Text(viaCepResponse.logradouro != null
                ? viaCepResponse.logradouro!
                : ''),
            Text(viaCepResponse.complemento != null
                ? viaCepResponse.complemento!
                : ''),
            Text(viaCepResponse.bairro != null ? viaCepResponse.bairro! : ''),
            Text(viaCepResponse.resultadoLocalidade != null
                ? viaCepResponse.resultadoLocalidade!
                : ''),
            Text(viaCepResponse.uf != null ? viaCepResponse.uf! : ''),
            Text(viaCepResponse.ibge != null ? viaCepResponse.ibge! : ''),
            Text(viaCepResponse.gia != null ? viaCepResponse.gia! : ''),
            Text(viaCepResponse.ddd != null ? viaCepResponse.ddd! : ''),
            Text(viaCepResponse.siafi != null ? viaCepResponse.siafi! : ''),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getDataFromCep,
        child: const Icon(Icons.search),
      ),
    );
  }
}
