
import 'package:flutter/material.dart';
import '../styles/amigopet_styles.dart';
import 'detalhes_cuidador_page.dart';
import 'home_page.dart';
import 'perfil_page.dart';

class CuidadoresPage extends StatelessWidget {
final String? filtroServico;

CuidadoresPage({
super.key,
this.filtroServico,
});

final List<Map<String, dynamic>> cuidadores = [
{
'nome': 'Mariana Silva',
'avaliacao': '4.9',
'distancia': '0,8 km',
'servico': 'Passeio',
'experiencia': '3 anos de experiência',
'inicial': 'M',
},
{
'nome': 'Lucas Oliveira',
'avaliacao': '4.8',
'distancia': '1,2 km',
'servico': 'Hospedagem',
'experiencia': '2 anos de experiência',
'inicial': 'L',
},
{
'nome': 'Ana Costa',
'avaliacao': '4.7',
'distancia': '1,5 km',
'servico': 'Banho e tosa',
'experiencia': '4 anos de experiência',
'inicial': 'A',
},
{
'nome': 'Gabriel Santos',
'avaliacao': '4.9',
'distancia': '2,0 km',
'servico': 'Passeio',
'experiencia': '5 anos de experiência',
'inicial': 'G',
},
{
'nome': 'Juliana Souza',
'avaliacao': '4.6',
'distancia': '2,4 km',
'servico': 'Hospedagem',
'experiencia': '2 anos de experiência',
'inicial': 'J',
},
];

@override
Widget build(BuildContext context) {
final cuidadoresFiltrados = filtroServico == null
? cuidadores
    : cuidadores
    .where(
(cuidador) => cuidador['servico'] == filtroServico,
)
    .toList();

return Scaffold(
backgroundColor: AmigoPetStyles.fundo,

// =====================================================
// APP BAR
// =====================================================

appBar: AppBar(
backgroundColor: AmigoPetStyles.laranja,
elevation: 0,

leading: Builder(
builder: (context) {
return IconButton(
icon: const Icon(
Icons.menu,
color: Colors.white,
size: 28,
),
onPressed: () {
Scaffold.of(context).openDrawer();
},
);
},
),

title: Row(
mainAxisSize: MainAxisSize.min,
children: [
Image.asset(
'assets/imagem/gatologo.png',
width: 50,
height: 50,
fit: BoxFit.contain,
),

const SizedBox(width: 2),

const Text(
'AmigoPet',
style: AmigoPetStyles.appBarTitulo,
),
],
),

centerTitle: true,

actions: [
PopupMenuButton<String>(
icon: const Icon(
Icons.tune,
color: Colors.white,
),

onSelected: (value) {
String mensagem = '';

if (value == 'proximos') {
mensagem = 'Ordenado pelos mais próximos';
} else if (value == 'avaliados') {
mensagem = 'Ordenado pelos melhor avaliados';
} else if (value == 'preco') {
mensagem = 'Ordenado pelo menor preço';
}

ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(mensagem),
),
);
},

itemBuilder: (context) => [
const PopupMenuItem(
value: 'proximos',
child: Row(
children: [
Icon(Icons.location_on_outlined),
SizedBox(width: 10),
Text('Mais próximos'),
],
),
),

const PopupMenuItem(
value: 'avaliados',
child: Row(
children: [
Icon(Icons.star_outline),
SizedBox(width: 10),
Text('Melhor avaliados'),
],
),
),

const PopupMenuItem(
value: 'preco',
child: Row(
children: [
Icon(Icons.attach_money),
SizedBox(width: 10),
Text('Menor preço'),
],
),
),
],
),
],
),

// =====================================================
// DRAWER
// =====================================================

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

// =================================================
// INÍCIO
// =================================================

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

Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(
builder: (context) => const HomePage(),
),
(route) => false,
);
},
),

// =================================================
// MEUS PETS
// =================================================

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

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Área de Meus Pets em breve 🐾',
),
),
);
},
),

// =================================================
// AGENDA
// =================================================

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

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Área de Agenda em breve 📅',
),
),
);
},
),

const Divider(
height: 30,
indent: 20,
endIndent: 20,
),

// =================================================
// MEU PERFIL
// =================================================

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

Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const PerfilPage(),
),
);
},
),

// =================================================
// CONFIGURAÇÕES
// =================================================

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

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Configurações em breve ⚙️',
),
),
);
},
),

// =================================================
// AJUDA
// =================================================

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

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Central de ajuda em breve ❓',
),
),
);
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

// =====================================================
// LISTA DE CUIDADORES
// =====================================================

body: SafeArea(
child: Padding(
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 20,
),

child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Cuidadores perto de você',
style: AmigoPetStyles.titulo,
),

const SizedBox(height: 6),

const Text(
'Encontre alguém de confiança para cuidar do seu pet.',
style: AmigoPetStyles.subtitulo,
),

const SizedBox(height: 25),

Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
const Text(
'Cuidadores disponíveis',
style: TextStyle(
fontSize: 17,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.texto,
),
),

Text(
'${cuidadoresFiltrados.length} disponíveis',
style: const TextStyle(
fontSize: 13,
color:
AmigoPetStyles.textoSecundario,
),
),
],
),

const SizedBox(height: 15),

Expanded(
child: ListView.builder(
itemCount: cuidadoresFiltrados.length,

itemBuilder: (context, index) {
final cuidador =
cuidadoresFiltrados[index];

return GestureDetector(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) =>
DetalhesCuidadorPage(
nome: cuidador['nome'],
servico:
cuidador['servico'],
avaliacao:
cuidador['avaliacao'],
distancia:
cuidador['distancia'],
experiencia:
cuidador['experiencia'],
),
),
);
},

child: Container(
margin: const EdgeInsets.only(
bottom: 15,
),

padding:
const EdgeInsets.all(15),

decoration:
AmigoPetStyles.cardCuidador,

child: Row(
children: [
Container(
width: 65,
height: 65,

decoration:
BoxDecoration(
color:
AmigoPetStyles
    .laranjaSuave,
borderRadius:
BorderRadius.circular(
18,
),
),

child: Center(
child: Text(
cuidador['inicial'],
style: const TextStyle(
fontSize: 25,
fontWeight:
FontWeight.bold,
color:
AmigoPetStyles
    .marrom,
),
),
),
),

const SizedBox(width: 14),

Expanded(
child: Column(
crossAxisAlignment:
CrossAxisAlignment
    .start,

children: [
Text(
cuidador['nome'],
style: AmigoPetStyles
    .nomeCuidador,
),

const SizedBox(height: 5),

Row(
children: [
const Icon(
Icons.star,
color:
AmigoPetStyles
    .laranja,
size: 18,
),

const SizedBox(
width: 4,
),

Text(
cuidador[
'avaliacao'],
style:
AmigoPetStyles
    .informacao,
),

const SizedBox(
width: 12,
),

const Icon(
Icons
    .location_on_outlined,
color:
AmigoPetStyles
    .laranja,
size: 17,
),

const SizedBox(
width: 3,
),

Text(
cuidador[
'distancia'],
style:
AmigoPetStyles
    .informacao,
),
],
),

const SizedBox(height: 8),

Container(
padding:
const EdgeInsets
    .symmetric(
horizontal: 10,
vertical: 5,
),

decoration:
AmigoPetStyles
    .chip,

child: Text(
cuidador[
'servico'],
style:
const TextStyle(
fontSize: 12,
color:
AmigoPetStyles
    .marrom,
fontWeight:
FontWeight.w500,
),
),
),

const SizedBox(height: 6),

Text(
cuidador[
'experiencia'],
style:
const TextStyle(
fontSize: 12,
color:
AmigoPetStyles
    .textoSecundario,
),
),
],
),
),

IconButton(
onPressed: () {},
icon: const Icon(
Icons.favorite_border,
color:
AmigoPetStyles.coral,
),
),
],
),
),
);
},
),
),
],
),
),
),

// =====================================================
// MENU INFERIOR
// =====================================================

bottomNavigationBar: BottomNavigationBar(
currentIndex: 1,
selectedItemColor:
AmigoPetStyles.laranja,
unselectedItemColor: Colors.grey,
backgroundColor: Colors.white,
type: BottomNavigationBarType.fixed,

onTap: (index) {
// INÍCIO
if (index == 0) {
Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(
builder: (context) => const HomePage(),
),
(route) => false,
);
}

// CUIDADORES
if (index == 1) {
return;
}

// PERFIL
if (index == 2) {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const PerfilPage(),
),
);
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
icon: Icon(
Icons.person_outline_rounded,
),
label: 'Perfil',
),
],
),
);
}
}

