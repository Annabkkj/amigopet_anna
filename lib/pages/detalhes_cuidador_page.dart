
import 'package:flutter/material.dart';
import '../styles/amigopet_styles.dart';

class DetalhesCuidadorPage extends StatelessWidget {
final String nome;
final String servico;
final String avaliacao;
final String distancia;
final String experiencia;

const DetalhesCuidadorPage({
super.key,
required this.nome,
required this.servico,
required this.avaliacao,
required this.distancia,
required this.experiencia,
});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: AmigoPetStyles.fundo,

// =====================================================
// APP BAR
// =====================================================

appBar: AppBar(
backgroundColor: AmigoPetStyles.laranja,
elevation: 0,

leading: IconButton(
icon: const Icon(
Icons.arrow_back_rounded,
color: Colors.white,
),
onPressed: () {
Navigator.pop(context);
},
),

title: const Text(
'Perfil do cuidador',
style: AmigoPetStyles.appBarTitulo,
),

centerTitle: true,

actions: [
IconButton(
icon: const Icon(
Icons.favorite_border_rounded,
color: Colors.white,
),
onPressed: () {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Cuidador adicionado aos favoritos ❤️',
),
),
);
},
),
],
),

// =====================================================
// CONTEÚDO
// =====================================================

body: SingleChildScrollView(
child: Column(
children: [
// =================================================
// CABEÇALHO DO PERFIL
// =================================================

Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB(
20,
25,
20,
30,
),
decoration: const BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(30),
bottomRight: Radius.circular(30),
),
),
child: Column(
children: [
// Avatar
Container(
width: 105,
height: 105,
decoration: BoxDecoration(
color: AmigoPetStyles.laranjaSuave,
shape: BoxShape.circle,
border: Border.all(
color: AmigoPetStyles.laranja,
width: 3,
),
),
child: Center(
child: Text(
nome.isNotEmpty
? nome[0].toUpperCase()
    : '?',
style: const TextStyle(
fontSize: 42,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),
),
),

const SizedBox(height: 15),

// Nome
Text(
nome,
textAlign: TextAlign.center,
style: const TextStyle(
fontSize: 26,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 8),

// Verificado
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(
Icons.verified_rounded,
color: AmigoPetStyles.laranja,
size: 20,
),
const SizedBox(width: 5),
const Text(
'Cuidador verificado',
style: TextStyle(
fontSize: 14,
color: AmigoPetStyles.texto,
fontWeight: FontWeight.w500,
),
),
],
),

const SizedBox(height: 18),

// Avaliação / distância
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
_InfoPerfil(
icone: Icons.star_rounded,
valor: avaliacao,
texto: 'Avaliação',
),

Container(
height: 35,
width: 1,
color: Colors.grey.shade300,
margin: const EdgeInsets.symmetric(
horizontal: 25,
),
),

_InfoPerfil(
icone: Icons.location_on_rounded,
valor: distancia,
texto: 'Distância',
),
],
),
],
),
),

const SizedBox(height: 20),

Padding(
padding: const EdgeInsets.symmetric(
horizontal: 20,
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// =================================================
// SERVIÇO E EXPERIÊNCIA
// =================================================

Row(
children: [
Expanded(
child: _InformacaoCard(
icone: Icons.pets_rounded,
titulo: 'Serviço',
valor: servico,
),
),

const SizedBox(width: 12),

Expanded(
child: _InformacaoCard(
icone: Icons.workspace_premium_rounded,
titulo: 'Experiência',
valor: experiencia
    .replaceAll(
' de experiência',
'',
),
),
),
],
),

const SizedBox(height: 25),

// =================================================
// SOBRE
// =================================================

const Text(
'Sobre o cuidador',
style: TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 10),

Container(
width: double.infinity,
padding: const EdgeInsets.all(18),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(20),
boxShadow: const [
BoxShadow(
color: Colors.black12,
blurRadius: 7,
offset: Offset(0, 2),
),
],
),
child: Text(
_descricaoCuidador(),
style: const TextStyle(
fontSize: 15,
height: 1.5,
color: AmigoPetStyles.texto,
),
),
),

const SizedBox(height: 25),

// =================================================
// SERVIÇOS OFERECIDOS
// =================================================

const Text(
'Serviços oferecidos',
style: TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 12),

Wrap(
spacing: 10,
runSpacing: 10,
children: [
_ServicoChip(
icone: Icons.pets_rounded,
texto: servico,
),
const _ServicoChip(
icone: Icons.favorite_rounded,
texto: 'Cuidados com carinho',
),
const _ServicoChip(
icone: Icons.photo_camera_rounded,
texto: 'Fotos durante o serviço',
),
],
),

const SizedBox(height: 25),

// =================================================
// PETS ATENDIDOS
// =================================================

const Text(
'Pets que atende',
style: TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 12),

Row(
children: [
_PetTipo(
icone: Icons.pets_rounded,
texto: 'Cães',
),
const SizedBox(width: 12),
_PetTipo(
icone: Icons.pets_rounded,
texto: 'Gatos',
),
const SizedBox(width: 12),
_PetTipo(
icone: Icons.favorite_rounded,
texto: 'Filhotes',
),
],
),

const SizedBox(height: 25),

// =================================================
// DISPONIBILIDADE
// =================================================

const Text(
'Disponibilidade',
style: TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 12),

Container(
width: double.infinity,
padding: const EdgeInsets.all(18),
decoration: BoxDecoration(
color: AmigoPetStyles.creme,
borderRadius: BorderRadius.circular(20),
),
child: const Column(
children: [
_Horario(
dia: 'Segunda a sexta',
horario: '08:00 - 18:00',
),
SizedBox(height: 12),
_Horario(
dia: 'Sábado',
horario: '09:00 - 16:00',
),
SizedBox(height: 12),
_Horario(
dia: 'Domingo',
horario: '10:00 - 15:00',
),
],
),
),

const SizedBox(height: 25),

// =================================================
// PREÇO
// =================================================

Container(
width: double.infinity,
padding: const EdgeInsets.all(18),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(20),
boxShadow: const [
BoxShadow(
color: Colors.black12,
blurRadius: 7,
offset: Offset(0, 2),
),
],
),
child: Row(
children: [
Container(
width: 48,
height: 48,
decoration: BoxDecoration(
color:
AmigoPetStyles.laranjaSuave,
borderRadius:
BorderRadius.circular(14),
),
child: const Icon(
Icons.attach_money_rounded,
color:
AmigoPetStyles.marrom,
),
),

const SizedBox(width: 14),

const Expanded(
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Text(
'Valor do serviço',
style: TextStyle(
fontSize: 13,
color: Colors.grey,
),
),
SizedBox(height: 3),
Text(
'A partir de R\$ 40,00',
style: TextStyle(
fontSize: 18,
fontWeight:
FontWeight.bold,
color:
AmigoPetStyles.marrom,
),
),
],
),
),

const Text(
'por serviço',
style: TextStyle(
fontSize: 12,
color: Colors.grey,
),
),
],
),
),

const SizedBox(height: 25),

// =================================================
// AVALIAÇÕES
// =================================================

const Text(
'Avaliações',
style: TextStyle(
fontSize: 21,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),

const SizedBox(height: 12),

_AvaliacaoCard(
nome: 'Camila',
avaliacao: '5.0',
comentario:
'Muito cuidadoso e atencioso! Meu pet adorou.',
),

const SizedBox(height: 10),

_AvaliacaoCard(
nome: 'Mariana',
avaliacao: '4.9',
comentario:
'Foi super responsável e sempre mandava fotos.',
),

const SizedBox(height: 30),

// =================================================
// BOTÃO AGENDAR
// =================================================

SizedBox(
width: double.infinity,
height: 58,
child: ElevatedButton(
onPressed: () {
ScaffoldMessenger.of(context)
    .showSnackBar(
const SnackBar(
content: Text(
'Agendamento iniciado! 📅🐾',
),
),
);
},
style: ElevatedButton.styleFrom(
backgroundColor:
AmigoPetStyles.laranja,
foregroundColor: Colors.white,
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(18),
),
),
child: const Row(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Icon(
Icons.calendar_month_rounded,
size: 23,
),
SizedBox(width: 10),
Text(
'Agendar serviço',
style: TextStyle(
fontSize: 17,
fontWeight: FontWeight.bold,
),
),
],
),
),
),

const SizedBox(height: 12),

// =================================================
// CONTATO
// =================================================

SizedBox(
width: double.infinity,
height: 54,
child: OutlinedButton(
onPressed: () {
ScaffoldMessenger.of(context)
    .showSnackBar(
const SnackBar(
content: Text(
'Abrindo conversa... 💬',
),
),
);
},
style: OutlinedButton.styleFrom(
foregroundColor:
AmigoPetStyles.laranja,
side: const BorderSide(
color: AmigoPetStyles.laranja,
),
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(18),
),
),
child: const Row(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Icon(
Icons.chat_bubble_outline_rounded,
),
SizedBox(width: 10),
Text(
'Entrar em contato',
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
],
),
),
),

const SizedBox(height: 35),
],
),
),
],
),
),
);
}

// =====================================================
// DESCRIÇÃO DO CUIDADOR
// =====================================================

String _descricaoCuidador() {
if (servico == 'Passeio') {
return '$nome é um cuidador apaixonado por animais e com '
'$experiencia. Especializado em passeios, oferece '
'atenção, segurança e muito carinho durante todo o '
'tempo com o pet.';
}

if (servico == 'Hospedagem') {
return '$nome trabalha com hospedagem de pets e possui '
'$experiencia. O objetivo é oferecer um ambiente '
'seguro, confortável e cheio de carinho para que '
'seu pet se sinta em casa.';
}

if (servico == 'Banho e tosa') {
return '$nome possui $experiencia e trabalha com '
'cuidados de higiene e bem-estar dos pets. O '
'atendimento é feito com cuidado, paciência e '
'atenção às necessidades de cada animal.';
}

return '$nome é um cuidador apaixonado por animais, com '
'$experiencia. Seu objetivo é oferecer um atendimento '
'seguro, responsável e cheio de carinho.';
}
}

// =========================================================
// INFORMAÇÃO DO PERFIL
// =========================================================

class _InfoPerfil extends StatelessWidget {
final IconData icone;
final String valor;
final String texto;

const _InfoPerfil({
required this.icone,
required this.valor,
required this.texto,
});

@override
Widget build(BuildContext context) {
return Row(
children: [
Icon(
icone,
color: AmigoPetStyles.laranja,
size: 23,
),
const SizedBox(width: 6),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
valor,
style: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),
Text(
texto,
style: const TextStyle(
fontSize: 11,
color: Colors.grey,
),
),
],
),
],
);
}
}

// =========================================================
// CARD DE INFORMAÇÃO
// =========================================================

class _InformacaoCard extends StatelessWidget {
final IconData icone;
final String titulo;
final String valor;

const _InformacaoCard({
required this.icone,
required this.titulo,
required this.valor,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(15),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(18),
boxShadow: const [
BoxShadow(
color: Colors.black12,
blurRadius: 6,
offset: Offset(0, 2),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(
icone,
color: AmigoPetStyles.laranja,
size: 27,
),

const SizedBox(height: 10),

Text(
titulo,
style: const TextStyle(
fontSize: 12,
color: Colors.grey,
),
),

const SizedBox(height: 4),

Text(
valor,
maxLines: 2,
overflow: TextOverflow.ellipsis,
style: const TextStyle(
fontSize: 14,
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),
],
),
);
}
}

// =========================================================
// CHIP DE SERVIÇO
// =========================================================

class _ServicoChip extends StatelessWidget {
final IconData icone;
final String texto;

const _ServicoChip({
required this.icone,
required this.texto,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(
horizontal: 13,
vertical: 10,
),
decoration: BoxDecoration(
color: AmigoPetStyles.laranjaSuave,
borderRadius: BorderRadius.circular(15),
),
child: Row(
mainAxisSize: MainAxisSize.min,
children: [
Icon(
icone,
size: 17,
color: AmigoPetStyles.marrom,
),
const SizedBox(width: 6),
Text(
texto,
style: const TextStyle(
fontSize: 12,
fontWeight: FontWeight.w600,
color: AmigoPetStyles.marrom,
),
),
],
),
);
}
}

// =========================================================
// TIPO DE PET
// =========================================================

class _PetTipo extends StatelessWidget {
final IconData icone;
final String texto;

const _PetTipo({
required this.icone,
required this.texto,
});

@override
Widget build(BuildContext context) {
return Expanded(
child: Container(
padding: const EdgeInsets.symmetric(
vertical: 14,
),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(16),
boxShadow: const [
BoxShadow(
color: Colors.black12,
blurRadius: 5,
offset: Offset(0, 2),
),
],
),
child: Column(
children: [
Icon(
icone,
color: AmigoPetStyles.laranja,
size: 27,
),
const SizedBox(height: 6),
Text(
texto,
style: const TextStyle(
fontSize: 12,
fontWeight: FontWeight.w600,
color: AmigoPetStyles.marrom,
),
),
],
),
),
);
}
}

// =========================================================
// HORÁRIO
// =========================================================

class _Horario extends StatelessWidget {
final String dia;
final String horario;

const _Horario({
required this.dia,
required this.horario,
});

@override
Widget build(BuildContext context) {
return Row(
children: [
const Icon(
Icons.access_time_rounded,
color: AmigoPetStyles.laranja,
size: 21,
),

const SizedBox(width: 10),

Expanded(
child: Text(
dia,
style: const TextStyle(
fontSize: 14,
fontWeight: FontWeight.w600,
color: AmigoPetStyles.marrom,
),
),
),

Text(
horario,
style: const TextStyle(
fontSize: 13,
color: AmigoPetStyles.texto,
),
),
],
);
}
}

// =========================================================
// AVALIAÇÃO
// =========================================================

class _AvaliacaoCard extends StatelessWidget {
final String nome;
final String avaliacao;
final String comentario;

const _AvaliacaoCard({
required this.nome,
required this.avaliacao,
required this.comentario,
});

@override
Widget build(BuildContext context) {
return Container(
width: double.infinity,
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(18),
boxShadow: const [
BoxShadow(
color: Colors.black12,
blurRadius: 5,
offset: Offset(0, 2),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
CircleAvatar(
radius: 20,
backgroundColor:
AmigoPetStyles.laranjaSuave,
child: Text(
nome[0],
style: const TextStyle(
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),
),

const SizedBox(width: 10),

Expanded(
child: Text(
nome,
style: const TextStyle(
fontWeight: FontWeight.bold,
color: AmigoPetStyles.marrom,
),
),
),

const Icon(
Icons.star_rounded,
color: AmigoPetStyles.laranja,
size: 18,
),

const SizedBox(width: 3),

Text(
avaliacao,
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
],
),

const SizedBox(height: 12),

Text(
comentario,
style: const TextStyle(
fontSize: 13,
height: 1.4,
color: AmigoPetStyles.texto,
),
),
],
),
);
}
}

