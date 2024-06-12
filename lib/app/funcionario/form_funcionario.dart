import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _addFormKey = GlobalKey<FormState>();

  final nome = signal('');
  final cpf = signal('');
  final email = signal('');
  final cargo = signal('');
  final telefone = signal('');
  final senha = signal('');
  final confirmarSenha = signal('');
  late final isValid =
      computed(() => nome().isNotEmpty 
        && cpf().isNotEmpty
        && email().isNotEmpty
        && cargo().isNotEmpty
        && telefone().isNotEmpty
        && senha().isNotEmpty
        && confirmarSenha().isNotEmpty
        );
  final passwordError = signal<String?>(null);

  validateForm() {
    if (senha().length > 6 || confirmarSenha().length >6) {
      passwordError.value = null;
    } else {
      passwordError.value = 'Erro! Mínimo de 6 caracteres';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Novo funcionário'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            height: MediaQuery.of(context).size.height - 120,
            //height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: nome.set,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("nome")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: cpf.set,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("cpf")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: email.set,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("email")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: cargo.set,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("cargo")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: telefone.set,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("telefone")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: senha.set,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("senha"),
                          errorText: passwordError.watch(context)),
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,                
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: confirmarSenha.set,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("confirmarSenha"),
                          errorText: passwordError.watch(context)),
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,                
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  flex: 3,
                  child: FractionallySizedBox(
                    widthFactor: 0.4,
                    heightFactor: 0.5,
                    child: FilledButton(
                      onPressed: isValid.watch(context) ? validateForm : null,
                      child: const Text('Enviar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}