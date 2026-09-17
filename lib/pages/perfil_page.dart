import 'package:flutter/material.dart';
import '../styles/amigopet_styles.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AmigoPetStyles.fundo,

      appBar: AppBar(
        backgroundColor: AmigoPetStyles.laranja,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Meu perfil',
          style: AmigoPetStyles.appBarTitulo,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // PERFIL
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: AmigoPetStyles.creme,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 42,
                      color: AmigoPetStyles.laranja,
                    ),
                  ),

                  const SizedBox(width: 18),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anna',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AmigoPetStyles.marrom,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'São Paulo, SP',
                          style: AmigoPetStyles.informacao,
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Apaixonada por pets 🐾',
                          style: TextStyle(
                            fontSize: 14,
                            color: AmigoPetStyles.textoSecundario,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AmigoPetStyles.laranja,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // INFORMAÇÕES PESSOAIS
            const Text(
              'Informações pessoais',
              style: AmigoPetStyles.titulo,
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  _itemInformacao(
                    Icons.person_outline,
                    'Nome',
                    'Anna',
                  ),

                  const Divider(height: 1),

                  _itemInformacao(
                    Icons.email_outlined,
                    'E-mail',
                    'anna@email.com',
                  ),

                  const Divider(height: 1),

                  _itemInformacao(
                    Icons.location_on_outlined,
                    'Localização',
                    'São Paulo, SP',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // PETS
            const Text(
              'Meus pets',
              style: AmigoPetStyles.titulo,
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                // MEL
                Expanded(
                  child: _cardPet(
                    emoji: '🐶',
                    nome: 'Mel',
                    tipo: 'Cachorra',
                    idade: '4 anos',
                  ),
                ),

                const SizedBox(width: 12),

                // OZZY
                Expanded(
                  child: _cardPet(
                    emoji: '🐱',
                    nome: 'Ozzy',
                    tipo: 'Gato',
                    idade: '5 meses',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // MINHA CONTA
            const Text(
              'Minha conta',
              style: AmigoPetStyles.titulo,
            ),

            const SizedBox(height: 12),

            _itemMenu(
              Icons.calendar_month_outlined,
              'Meus agendamentos',
                  () {},
            ),

            const SizedBox(height: 10),

            _itemMenu(
              Icons.favorite_border,
              'Cuidadores favoritos',
                  () {},
            ),

            const SizedBox(height: 10),

            _itemMenu(
              Icons.star_border,
              'Minhas avaliações',
                  () {},
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget _itemInformacao(
      IconData icone,
      String titulo,
      String valor,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
      child: Row(
        children: [
          Icon(
            icone,
            color: AmigoPetStyles.laranja,
            size: 23,
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 12,
                  color: AmigoPetStyles.textoSecundario,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                valor,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AmigoPetStyles.texto,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _cardPet({
    required String emoji,
    required String nome,
    required String tipo,
    required String idade,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Center(
            child: Text(
              emoji,
              style: const TextStyle(
                fontSize: 45,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            nome,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AmigoPetStyles.marrom,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            tipo,
            style: AmigoPetStyles.informacao,
          ),

          Text(
            idade,
            style: AmigoPetStyles.informacao,
          ),
        ],
      ),
    );
  }

  static Widget _itemMenu(
      IconData icone,
      String texto,
      VoidCallback aoClicar,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: aoClicar,
        leading: Icon(
          icone,
          color: AmigoPetStyles.laranja,
        ),
        title: Text(
          texto,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AmigoPetStyles.texto,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: AmigoPetStyles.textoSecundario,
        ),
      ),
    );
  }
}