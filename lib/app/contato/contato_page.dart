import 'package:flutter/material.dart';
import 'package:matricular/matricular.dart';
import 'package:matricularApp/app/api/AppAPI.dart';
import 'package:matricularApp/app/login/login_state.dart';
import 'package:matricularApp/routes.dart';
import 'package:provider/provider.dart';
import 'package:routefly/routefly.dart';
import 'package:signals/signals_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/whatsapp.dart';


class StartPage extends StatefulWidget {
  

  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late AppAPI appAPI;
  LoginState state = LoginState();
  WhatsApp whatsapp = WhatsApp();
  int phoneNumber = 5562992729766;
  @override
  void initState() {
    whatsapp.setup(
      accessToken: "YOUR_ACCESS_TOKEN_HERE",
      fromNumberId: 5562992536082,
    );
    super.initState();
  }

  void sair() {
    appAPI.config.token.set("null");
    Routefly.navigate(routePaths.login);
  }

  abrirWhatsApp2() async {
    print(await whatsapp.short(
      to: phoneNumber,
      message: "Hello Flutter",
      compress: true,
    ));
  }

  abrirWhatsApp() async {
    var whatsappUrl = "https://wa.me/5562992729766&text=Olá,tudo bem ?";

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
  abrirGoogleMaps() async {
    const urlMap = "https://www.google.com/maps/search/?api=1&query=-22.9732303,-43.2032649";
    if (await canLaunchUrl(Uri.parse(urlMap))) {
      await launchUrl(Uri.parse(urlMap));
    } else {
      throw 'Could not launch Maps';
    }
  }
  fazerLigacao() async {
    const url = "tel:62992536082";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
  void abrirInstagram() async {
    var messengerUrl = 'https://instagram.com/crechesagradafamilia';
    if (await canLaunchUrl(Uri.parse(messengerUrl))) {
      await launchUrl(Uri.parse(messengerUrl));
    } else {
      throw 'Could not launch $messengerUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    appAPI = context.read<AppAPI>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Contato'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sair',
            onPressed: this.state.isValid.watch(context)
                        ? null
                        : () => {sair()},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          height: MediaQuery.of(context).size.height - 120,
          //height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 6,
                child: TextButton(
                          onPressed: () {abrirWhatsApp2();},
                          child: const Text('WhatsApp'),
                        ),
              ),
              Flexible(
                flex: 6,
                child: TextButton(
                          onPressed: () {abrirInstagram();},
                          child: const Text('Instagram'),
                        ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
				currentIndex: 2,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Minha conta"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: "Contatos"
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if(index==0) Routefly.navigate(routePaths.home);
    if(index==1) Routefly.navigate(routePaths.conta);
    if(index==2) Routefly.navigate(routePaths.contato);
  }
}