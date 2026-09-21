import 'package:flutter_test/flutter_test.dart';

// Criando nosso dicionário (Map) com os nomes e as listas de notas
Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

void main() {
  test('Adicionar elemento', () {
    // putIfAbsent: só adiciona a Elena se ela ainda não estiver lá
    alunos.putIfAbsent('Elena', () => [9.0, 8.0]);
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos['Elena'], [9.0, 8.0]);
  });

  test('Adicionar outro dicionário', () {
    // addAll: junta vários elementos de uma vez só no nosso dicionário
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos.containsKey('Luiza'), isTrue);
  });

  test('Remover elemento', () {
    // remove: procura a chave 'Bruna' e apaga ela
    alunos.remove('Bruna');
    expect(alunos.containsKey('Bruna'), isFalse);
  });

  test('Atualizar elemento', () {
    // update: atualiza as notas da Carla
    alunos.update('Carla', (value) => [9.0, 8.0]);
    expect(alunos['Carla'], [9.0, 8.0]);
    
    // Dá pra atualizar direto passando o valor novo pra chave
    alunos['Carla'] = [8.0, 9.0];
    expect(alunos['Carla'], [8.0, 9.0]);
  });

  test('Testar percorrer dicionário', () {
    // keys pega só os nomes e values pega só as listas de notas
    expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);
    expect(alunos.values, [
      [8.0, 9.0],
      [8.0, 9.0],
      [9.0, 8.0],
      [8.0, 9.0],
    ]);
    
    double soma = 0;
    // forEach: passa por cada aluna (key) e suas notas (value) pra somar tudo
    alunos.forEach((key, value) {
      for (double nota in value) {
        soma += nota;
      }
    });
    expect(soma, 68.0);
  });

  test('Calcular médias', () {
    // Resolução do exercício calcular médias
    // Redefinindo as notas pra garantir que o cálculo bata com o expect
    alunos = {
      'Maria': [8.0, 9.0],
      'Carla': [8.0, 9.0],
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    };

    Map<String, double> medias = {};

    // forEach de novo: agora somando e dividindo pela quantidade de notas (length) pra achar a média
    alunos.forEach((chave, notas) {
      double soma = 0;
      
      for (double nota in notas) {
        soma += nota;
      }
      
      medias[chave] = soma / notas.length;
    });

    expect(medias, {'Maria': 8.5, 'Carla': 8.5, 'Elena': 8.5, 'Luiza': 8.5});
  });
}