import 'package:flutter_test/flutter_test.dart';

// Criando a nossa lista de inteiros (funciona igual um array)
List<int> numeros = [1, 2, 3];

void main() {
 test('Adicionar elemento', () {
   // add: joga o elemento lá pro final da lista
   numeros.add(4);
   expect(numeros.contains(4), isTrue);
 });

 test('Adicionar outra lista', () {
   // addAll: junta vários elementos de uma vez só
   numeros.addAll([5, 6]);
   expect(numeros.contains(5), isTrue);
   expect(numeros.contains(6), isTrue);
 });

 test('Adicionar na posição', () {
   // insert: escolho a posição exata (índice 0) pra colocar o valor 0
   numeros.insert(0, 0);
   expect(numeros.indexOf(0), 0);
 });

 test('Remover elemento', () {
   // remove: procura o valor 2 e apaga ele
   numeros.remove(2);
   expect(numeros.contains(2), isFalse);
 });

 test('Remover na posição', () {
   // removeAt: apaga quem estiver na posição 0 da lista
   numeros.removeAt(0);
   expect(numeros.contains(0), isFalse);
 });

 test('Testar tamanho', () {
   // length: pega a quantidade total de itens
   expect(numeros.length, 5);
 });

 test('Testar vazio e não vazio', () {
   // isEmpty / isNotEmpty: checa rapidinho se a lista tá vazia ou não
   expect(numeros.isEmpty, isFalse);
   expect(numeros.isNotEmpty, isTrue);
 });

 test('Testar ordenação', () {
   // reversed vira a lista de trás pra frente; sort organiza do menor pro maior
   expect(numeros.reversed.toList(), [6, 5, 4, 3, 1]);
   expect(numeros, [1, 3, 4, 5, 6]);
   numeros = numeros.reversed.toList();
   expect(numeros, [6, 5, 4, 3, 1]);
   numeros.sort();
   expect(numeros, [1, 3, 4, 5, 6]);
 });

 test('Testar percorrer lista', () {
   int soma = 0;
   // for in: passa por cada número da lista, um por um
   for (int numero in numeros) {
     soma += numero;
   }
   expect(soma, 19);

   // map: transforma a lista inteira de uma vez (aqui, multiplicando tudo por 2)
   numeros = numeros.map((numero) => numero * 2).toList();
   expect(numeros, [2, 6, 8, 10, 12]);

   // where: funciona como um filtro, só deixa passar o que for divisível por 3
   numeros = numeros.where((numero) => numero % 3 == 0).toList();
   expect(numeros, [6, 12]);
 });
}