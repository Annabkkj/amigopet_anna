import 'package:flutter/material.dart';

class AmigoPetStyles {
  // =========================
  // CORES DO AMIGOPET
  // =========================

  static const Color laranja = Color(0xFFF4A025);

  static const Color laranjaSuave = Color(0xFFF8C56B);

  static const Color creme = Color(0xFFFFEED1);

  static const Color marrom = Color(0xFF654007);

  static const Color coral = Color(0xFFD84638);

  static const Color fundo = Color(0xFFFFF9F1);

  static const Color texto = Color(0xFF263238);

  static const Color textoSecundario = Color(0xFF757575);


  // =========================
  // TEXTO DA APP BAR
  // =========================

  static const TextStyle appBarTitulo = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );


  // =========================
  // TÍTULO PRINCIPAL
  // =========================

  static const TextStyle titulo = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: marrom,
  );


  // =========================
  // SUBTÍTULO
  // =========================

  static const TextStyle subtitulo = TextStyle(
    fontSize: 15,
    color: textoSecundario,
  );


  // =========================
  // NOME DO CUIDADOR
  // =========================

  static const TextStyle nomeCuidador = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: texto,
  );


  // =========================
  // INFORMAÇÕES
  // =========================

  static const TextStyle informacao = TextStyle(
    fontSize: 14,
    color: textoSecundario,
  );


  // =========================
  // CARD DOS CUIDADORES
  // =========================

  static final BoxDecoration cardCuidador = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),

    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );


  // =========================
  // CHIP DE SERVIÇO
  // =========================

  static final BoxDecoration chip = BoxDecoration(
    color: creme,
    borderRadius: BorderRadius.circular(20),
  );


  // =========================
  // BOTÃO PRINCIPAL
  // =========================

  static final ButtonStyle botaoPrincipal =
  ElevatedButton.styleFrom(
    backgroundColor: laranja,
    foregroundColor: Colors.white,

    minimumSize: const Size(
      double.infinity,
      52,
    ),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),

    elevation: 0,
  );


  // =========================
  // BOTÃO CANCELAR
  // =========================

  static final ButtonStyle botaoCancelar =
  ElevatedButton.styleFrom(
    backgroundColor: coral,
    foregroundColor: Colors.white,

    minimumSize: const Size(
      double.infinity,
      50,
    ),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),

    elevation: 0,
  );
}