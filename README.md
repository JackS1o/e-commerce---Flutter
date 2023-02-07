# e_commerce Flutter

Tecnologias utilizadas:

- Flutter
- Dart
- HTTP
- Provider
- shared_preferences
- Docker
- NodeJS
- Express
- MySQL
- Sequelize
- Cors

## Funcionalidades da aplicação

- Login
- Listagem de produtos
- Adicionar produtos ao carrinho
- Remover produtos do carrinho
- Listagem de produtos no carrinho
- Finalizar compra
- Listagem de compras realizadas

## Sobre o projeto

Se trata de um E-commerce desenvolvido em Flutter no Frontend e NodeJS no Backend. Essa aplicação é uma loja virtual onde o usuário pode realizar compras de produtos cadastrados no sistema. O usuário pode realizar o login na aplicação e após isso ele pode adicionar produtos ao carrinho e finalizar a compra. O usuário também pode visualizar as compras realizadas na aplicação. 

## Como rodar o projeto

- Clone o repositório
- Rode o comando `flutter pub get` para instalar as dependências
- Rode o comando `flutter run -d chrome --web-renderer html` para rodar o frontend da aplicação.

## Como rodar o servidor

- No diretório `backend` Rode o comando `docker-compose up -d` . O docker irá subir o container com o banco de dados e o servidor e o mesmo ficará disponível na porta 3000.

## Desafios encontrados e como foram resolvidos 

- A maior dificuldade que encontrei foi a sintaxe do Dart, pois nunca havia utilizado a linguagem e tive que aprender a utilizar a mesma em um curto espaço de tempo para desenvolver o projeto e também a sintaxe do Flutter, pois nunca havia utilizado a biblioteca. Nos primeiros dias de desenvolvimento tive que estudar bastante a linguagem e a biblioteca para conseguir evoluir. No final consegui desenvolver o projeto e aprender bastante sobre a linguagem e a biblioteca. Ela é muito interessante e possui muitas funcionalidades que facilitam o desenvolvimento de aplicações, como por exemplo o Provider que facilita a comunicação entre os widgets e o gerenciamento de estado da aplicação.
