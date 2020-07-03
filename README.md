<p aling="center">
    <img alt="Last commit on GitHub" src="https://img.shields.io/github/last-commit/victorgrodriguesm7/delyrio-s">
    <img alt="Made by Victor" src="https://img.shields.io/badge/made%20by-Alunos%20do%20Liceu-%20%22%3E">
    <img alt="Project top programming language" src="https://img.shields.io/github/languages/top/victorgrodriguesm7/delyrio-s">
</p>

# De Lyrio's
## O que é?
É uma aplicação que tem o objetivo de facilitar a comunicação entre um restaurante e seus clientes. O mesmo utiliza NodeJS no seu backend, enquanto que utiliza React no frontend e Flutter no aplicativo mobile.
## Como funciona?
Os Funcionários do restaurante utilizarão o frontend para introduzir novos cardápios ao aplicativo e controlar os pedidos e reservas realizados pelos clientes, aumentando assim a produtividade do mesmo e a organização da empresa. Enquanto que o usuário terá total acesso ao aplicativo mobile, que contará com o cardápio do dia, promoções, reservas de mesa e etc, assim facilitando o acesso do mesmo já que o cliente não precisará ir até o restaurante para realizar o seu pedido e também poderá realizar suas reservas com uma maior agilidade.

# Feito com
-  [NodeJS](https://nodejs.org/en/)
-  [Express](http://expressjs.com/)
-  [Knex](http://knexjs.org/)
-  [Sqlite3](https://www.sqlite.org/index.html)
-  [React](https://reactjs.org/)
-  [Flutter](https://flutter.dev/)
-  [Dart Http](https://pub.dev/packages/http)
-  [Adobe XD](https://www.adobe.com/br/products/xd.html)
-  [VS Code](https://code.visualstudio.com/)

# :iphone: Imagens no Android

<p align="center">
  <img src="https://res.cloudinary.com/dozoyzosn/image/upload/v1593733540/De-lyrios/login_dm0stv.jpg" height="300">
  <img src="https://res.cloudinary.com/dozoyzosn/image/upload/v1593733542/De-lyrios/cadastro_rwavi5.jpg" height="300">
  <img src="https://res.cloudinary.com/dozoyzosn/image/upload/v1593733544/De-lyrios/home_ashnd2.jpg" height="300">
  <img src="https://res.cloudinary.com/dozoyzosn/image/upload/v1593733546/De-lyrios/dashboard_tolcnm.jpg" height="300">
  <img src="https://res.cloudinary.com/dozoyzosn/image/upload/v1593733538/De-lyrios/carrinho_kj6vdq.jpg" height="300">
</p>

### Itens a finalizar
- [X] Carrinho
- [ ] Pagina de configurações

# Como executar

Para executar a aplicação será necessário ter os seguintes itens:
* [Git](https://git-scm.com)
* [Flutter](https://flutter.dev/docs/get-started/install)

```bash
# Clonando Repositório
git clone https://github.com/victorgrodriguesm7/delyrio-s.git

# Vá para a pasta do aplicativo
cd delyrio-s\aplicativo

# Execute o flutter
flutter run
```
Para executar o projeto com seu próprio servidor será necessário instalar o [NodeJS](https://nodejs.org/en/) e instalar 
as depedências da seguinte forma:
```batch
# Execute esse comando nas pastas Backend e Frontend
npm install
```
Em seguida será necessário alterar os arquivos:

1.  [loginRepository](https://github.com/victorgrodriguesm7/delyrio-s/blob/master/aplicativo/lib/src/Pages/Login/loginRepository.dart)
```dart
final response = await client.post(
  'localhost:3333/session',
  body: json.encode(model.toJson()),
  headers: headers
);
```
2. [cadastroRepository](https://github.com/victorgrodriguesm7/delyrio-s/blob/master/aplicativo/lib/src/Pages/Cadastro/cadastroRepository.dart)
```dart
final response = await client.post(
  'localhost:3333/users',
  body: json.encode(model.toJson()),
  headers: headers
);
```
3. [Home](https://github.com/victorgrodriguesm7/delyrio-s/blob/master/aplicativo/lib/src/Pages/Home/homePage.dart)
```dart
 response = wait http.get('localhost:3333/cardapio');
```
4. [produtoPage](https://github.com/victorgrodriguesm7/delyrio-s/blob/master/aplicativo/lib/src/Pages/Produto/produtoPage.dart)
```dart
 Image.network(
  'localhost:3333/images/$tag.png',
  width: width,
  height: height * 0.5,
),
```
5. [Produto](https://github.com/victorgrodriguesm7/delyrio-s/blob/master/aplicativo/lib/src/components/Produto/produto.dart)
```dart
 Image.network(
  'https://de-lyrios-backend.herokuapp.com/images/$id.png',
  fit: BoxFit.fill,
),
```
6. [carrinhoRepository](https://github.com/victorgrodriguesm7/delyrio-s/blob/master/aplicativo/lib/src/components/Carrinho/carrinhoRepository.dart)
```dart
final response = await client.post(
  'localhost:3333/pedido',
  body: json.encode(model.toJson()),
  headers: headers
);
```
Após essas alterações você poderá executar o projeto :
```batch
# Na pasta Backend e Frontend use:
npm start

# Para executar o aplicativo use esse comando na pasta Aplicativo
flutter run
```

## :page_facing_up: Licença

Este projeto está sob a licença MIT. Veja a [Licença](https://github.com/victorgrodriguesm7/delyrio-s/blob/master/LICENSE) para mais informações
