import 'dart:io';

class Livro {
  String titulo;
  String isbn;
  int qtdPaginas;

  Livro(this.titulo, this.isbn, this.qtdPaginas);

  Livro.vazio() : this('', '', 0);

  void exibirDados() {
    print('Título: $titulo');
    print('ISBN: $isbn');
    print('Quantidade de páginas: $qtdPaginas');
  }
}

void main() {
  List<Livro> livros = [];

  while (true) {
    print('\n*** Biblioteca ***\n');
    print('1 - Inserir livro');
    print('2 - Consultar livros');
    print('3 - Exibir livro com a maior quantidade de páginas');
    print('4 - Exibir livro com a menor quantidade de páginas');
    print('0 - Sair');

    stdout.write('\nEscolha uma opção: ');
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('\nDigite o título do livro: ');
        String? titulo = stdin.readLineSync();

        stdout.write('Digite o ISBN do livro: ');
        String? isbn = stdin.readLineSync();

        stdout.write('Digite a quantidade de páginas do livro: ');
        int? qtdPaginas = int.tryParse(stdin.readLineSync()!);

        if (titulo != null && isbn != null && qtdPaginas != null) {
          Livro livro = Livro(titulo, isbn, qtdPaginas);
          livros.add(livro);
          print('\nLivro cadastrado com sucesso!');
        } else {
          print('\nDados do livro inválidos. Cadastro cancelado!');
        }

        break;

      case '2':
        if (livros.isEmpty) {
          print('\nNão há livros cadastrados!');
        } else {
          print('\n*** Livros cadastrados ***\n');
          for (Livro livro in livros) {
            livro.exibirDados();
            print('------------------------');
          }
        }
        break;

      case '3':
        if (livros.isEmpty) {
          print('\nNão há livros cadastrados!');
        } else {
          Livro livroMaior = livros[0];
          for (Livro livro in livros) {
            if (livro.qtdPaginas > livroMaior.qtdPaginas) {
              livroMaior = livro;
            }
          }
          print('\nLivro com a maior quantidade de páginas:');
          livroMaior.exibirDados();
        }
        break;

      case '4':
        if (livros.isEmpty) {
          print('\nNão há livros cadastrados!');
        } else {
          Livro livroMenor = livros[0];
          for (Livro livro in livros) {
            if (livro.qtdPaginas < livroMenor.qtdPaginas) {
              livroMenor = livro;
            }
          }
          print('\nLivro com a menor quantidade de páginas:');
          livroMenor.exibirDados();
        }
        break;

      case '0':
        print('\nSaindo do programa...');
        return;

      default:
        print('\nOpção inválida!');
    }
  }
}
