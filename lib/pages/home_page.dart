
import 'package:flutter/material.dart';
import '../styles/amigopet_styles.dart';
import 'cuidadores_page.dart';
import 'perfil_page.dart';

class HomePage extends StatelessWidget {
const HomePage({super.key});

void abrirCuidadores(BuildContext context, {String? servico}) {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => CuidadoresPage(
filtroServico: servico,
),
),
);
}

void abrirPerfil(BuildContext context) {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const PerfilPage(),
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: AmigoPetStyles.fundo,

// =========================
// MENU LATERAL
// =========================
drawer: Drawer(
child: Column(
children: [
Container(
width: double.infinity,
padding: const EdgeInsets.only(
top: 55,
bottom: 25,
),
decoration: const BoxDecoration(
color: AmigoPetStyles.laranja,
),
child: Column(
children: [
Image.asset(
'assets/imagem/gatologo.png',
width: 75,
height: 75,
fit: BoxFit.contain,
),
const SizedBox(height: 10),
const Text(
'AmigoPet',
style: TextStyle(
color: Colors.white,
fontSize: 23,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 4),
const Text(
'Cuidando de quem você ama 🐾',
style: TextStyle(
color: Colors.white,
fontSize: 13,
),
),
],
),
),

const SizedBox(height: 10),

// INÍCIO
ListTile(
leading: const Icon(
Icons.home_outlined,
color: AmigoPetStyles.laranja,
),
title: const Text(
'Início',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
),
),
onTap: () {
Navigator.pop(context);
},
),

// MEUS PETS
ListTile(
leading: const Icon(
Icons.pets_outlined,
color: AmigoPetStyles.laranja,
),
title: const Text(
'Meus Pets',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
),
),
onTap: () {
Navigator.pop(context);
},
),

// AGENDA
ListTile(
leading: const Icon(
Icons.calendar_month_outlined,
color: AmigoPetStyles.laranja,
),
title: const Text(
'Agenda',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
),
),
onTap: () {
Navigator.pop(context);
},
),

const Divider(
height: 30,
indent: 20,
endIndent: 20,
),

// MEU PERFIL
ListTile(
leading: const Icon(
Icons.person_outline,
color: AmigoPetStyles.laranja,
),
title: const Text(
'Meu Perfil',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
),
),
onTap: () {
Navigator.pop(context);
abrirPerfil(context);
},
),

// CONFIGURAÇÕES
ListTile(
leading: const Icon(
Icons.settings_outlined,
color: AmigoPetStyles.laranja,
),
title: const Text(
'Configurações',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
),
),
onTap: () {
Navigator.pop(context);
},
),

// AJUDA
ListTile(
leading: const Icon(
Icons.help_outline,
color: AmigoPetStyles.laranja,
),
title: const Text(
'Ajuda',
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.w600,
),
),
onTap: () {
Navigator.pop(context);
},
),

const Spacer(),

const Padding(
padding: EdgeInsets.only(bottom: 20),
child: Text(
'AmigoPet • Cuidando com carinho 🐾',
style: TextStyle(
color: Colors.grey,
fontSize: 11,
),
),
),
],
),
),

// =========================
// CONTEÚDO
// =========================
body: SafeArea(
child: SingleChildScrollView(
child: Column(
children: [
Padding(
padding: const EdgeInsets.fromLTRB(22, 20, 22, 10),
child: Row(
children: [
Builder(
builder: (context) {
return IconButton(
onPressed: () {
Scaffold.of(context).openDrawer();
},
icon: const Icon(
Icons.menu_rounded,
size: 30,
color: AmigoPetStyles.marrom,
),
);
},
),

Image.asset(
'assets/imagem/gatologo.png',
width: 48,
height: 48,
fit: BoxFit.contain,
),

const SizedBox(width: 8),

const Text(
'AmigoPet',
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),

const Spacer(),

IconButton(
onPressed: () {},
icon: const Icon(
Icons.notifications_none_rounded,
size: 30,
color: AmigoPetStyles.marrom,
),
),
],
),
),

// =========================
// BANNER
// =========================
Container(
margin: const EdgeInsets.fromLTRB(18, 8, 18, 20),
padding: const EdgeInsets.fromLTRB(20, 22, 10, 0),
decoration: BoxDecoration(
color: AmigoPetStyles.creme,
borderRadius: BorderRadius.circular(28),
),
child: Row(
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Olá! 🐾',
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),
const SizedBox(height: 10),
const Text(
'Encontre alguém de confiança para cuidar do seu pet.',
style: TextStyle(
fontSize: 17,
height: 1.4,
color: AmigoPetStyles.texto,
),
),
const SizedBox(height: 15),
],
),
),

const SizedBox(width: 5),

const Icon(
Icons.pets,
size: 100,
color: AmigoPetStyles.laranja,
),
],
),
),

// =========================
// SERVIÇOS
// =========================
const Padding(
padding: EdgeInsets.symmetric(horizontal: 22),
child: Align(
alignment: Alignment.centerLeft,
child: Text(
'Nossos serviços',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),
),
),

const SizedBox(height: 14),

Padding(
padding: const EdgeInsets.symmetric(horizontal: 18),
child: Row(
children: [
Expanded(
child: _ServicoCard(
icone: Icons.directions_walk_rounded,
titulo: 'Passeios',
cor: AmigoPetStyles.laranjaSuave,
onTap: () {
abrirCuidadores(
context,
servico: 'Passeio',
);
},
),
),

const SizedBox(width: 10),

Expanded(
child: _ServicoCard(
icone: Icons.home_rounded,
titulo: 'Hospedagem',
cor: const Color(0xFFFFC4C4),
onTap: () {
abrirCuidadores(
context,
servico: 'Hospedagem',
);
},
),
),

const SizedBox(width: 10),

Expanded(
child: _ServicoCard(
icone: Icons.content_cut_rounded,
titulo: 'Banho e tosa',
cor: const Color(0xFFDCC8F2),
onTap: () {
abrirCuidadores(
context,
servico: 'Banho e tosa',
);
},
),
),
],
),
),

const SizedBox(height: 25),

// =========================
// BOTÃO
// =========================
Padding(
padding: const EdgeInsets.symmetric(horizontal: 20),
child: SizedBox(
width: double.infinity,
height: 58,
child: ElevatedButton(
onPressed: () {
abrirCuidadores(context);
},
style: ElevatedButton.styleFrom(
backgroundColor: AmigoPetStyles.laranja,
foregroundColor: Colors.white,
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18),
),
),
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.search_rounded,
size: 29,
),
SizedBox(width: 10),
Text(
'Encontrar cuidador',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
SizedBox(width: 10),
Icon(
Icons.arrow_forward_rounded,
),
],
),
),
),
),

const SizedBox(height: 28),

// =========================
// BENEFÍCIOS
// =========================
Container(
margin: const EdgeInsets.symmetric(horizontal: 20),
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(24),
boxShadow: const [
BoxShadow(
color: Colors.black12,
blurRadius: 8,
offset: Offset(0, 3),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Por que usar o AmigoPet?',
style: TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 20),

Row(
mainAxisAlignment:
MainAxisAlignment.spaceAround,
children: [
_Beneficio(
icone: Icons.verified_rounded,
texto: 'Cuidadores\nverificados',
),
_Beneficio(
icone: Icons.star_rounded,
texto: 'Avaliações\nreais',
),
_Beneficio(
icone: Icons.favorite_rounded,
texto: 'Mais segurança\npara seu pet',
),
_Beneficio(
icone: Icons.pets_rounded,
texto: 'Todo carinho\nque ele merece',
),
],
),
],
),
),

const SizedBox(height: 30),

const Text(
'Juntos por eles! 🐾',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
fontStyle: FontStyle.italic,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 30),
],
),
),
),

// =========================
// MENU INFERIOR
// =========================
bottomNavigationBar: BottomNavigationBar(
currentIndex: 0,
selectedItemColor: AmigoPetStyles.laranja,
unselectedItemColor: Colors.grey,
backgroundColor: Colors.white,
type: BottomNavigationBarType.fixed,

onTap: (index) {
if (index == 0) {
return;
}

if (index == 1) {
abrirCuidadores(context);
}

if (index == 2) {
abrirPerfil(context);
}
},

items: const [
BottomNavigationBarItem(
icon: Icon(Icons.home_rounded),
label: 'Início',
),
BottomNavigationBarItem(
icon: Icon(Icons.pets_rounded),
label: 'Cuidadores',
),
BottomNavigationBarItem(
icon: Icon(Icons.person_outline_rounded),
label: 'Perfil',
),
],
),
);
}
}

// =====================================================
// CARD DE SERVIÇO
// =====================================================

class _ServicoCard extends StatelessWidget {
final IconData icone;
final String titulo;
final Color cor;
final VoidCallback onTap;

const _ServicoCard({
required this.icone,
required this.titulo,
required this.cor,
required this.onTap,
});

@override
Widget build(BuildContext context) {
return InkWell(
onTap: onTap,
borderRadius: BorderRadius.circular(18),
child: Container(
height: 145,
padding: const EdgeInsets.all(10),
decoration: BoxDecoration(
color: const Color(0xFFFFF4E4),
borderRadius: BorderRadius.circular(18),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
width: 62,
height: 62,
decoration: BoxDecoration(
color: cor,
shape: BoxShape.circle,
),
child: Icon(
icone,
size: 32,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 10),

Text(
titulo,
textAlign: TextAlign.center,
style: const TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),
],
),
),
);
}
}

// =====================================================
// BENEFÍCIO
// =====================================================

class _Beneficio extends StatelessWidget {
final IconData icone;
final String texto;

const _Beneficio({
required this.icone,
required this.texto,
});

@override
Widget build(BuildContext context) {
return Expanded(
child: Column(
children: [
Icon(
icone,
size: 32,
color: AmigoPetStyles.laranja,
),

const SizedBox(height: 8),

Text(
texto,
textAlign: TextAlign.center,
style: const TextStyle(
fontSize: 11,
color: AmigoPetStyles.texto,
),
),
],
),
);
}
}

