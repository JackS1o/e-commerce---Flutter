# E_commerce Flutter

## Sobre o projeto

Se trata de um E-commerce desenvolvido em Flutter no Frontend e NodeJS no Backend. Essa aplicação é uma loja virtual onde o usuário pode realizar compras de produtos cadastrados no sistema. O usuário pode realizar o login na aplicação e após isso ele pode adicionar produtos ao carrinho e finalizar a compra. O usuário também pode visualizar as compras realizadas na aplicação. 

## Como executar o projeto

- Clone o repositório
- Execute o comando `flutter pub get` para instalar as dependências
- Execute o comando `flutter run -d chrome --web-renderer html` para rodar o frontend da aplicação.
- No diretório `backend` execute o comando `docker-compose up -d` . O docker irá subir o container com o banco de dados e o servidor, o mesmo ficará disponível na porta 3000.

## Desafios encontrados e como foram resolvidos 

- A maior dificuldade que encontrei foi a sintaxe do Dart, pois nunca havia utilizado a linguagem e tive que aprender a utilizar a mesma em um curto espaço de tempo para desenvolver o projeto e também a sintaxe do Flutter, pois nunca havia utilizado a biblioteca. Nos primeiros dias de desenvolvimento tive que estudar bastante a linguagem e a biblioteca para conseguir evoluir. No final consegui desenvolver o projeto e aprender bastante sobre a linguagem e a biblioteca. Ela é muito interessante e possui muitas funcionalidades que facilitam o desenvolvimento de aplicações, como por exemplo o Provider que facilita a comunicação entre os widgets e o gerenciamento de estado da aplicação.

## Funcionalidades da aplicação

- Login
- Listagem de produtos
- Filtragem de produtos
- Adicionar produtos ao carrinho
- Remover produtos do carrinho
- Listagem de produtos no carrinho
- Finalizar compra
- Listagem de compras realizadas

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

## Preview

<p align="center">
Tela de Login / Tela de Principal / Tela de Carrinho / Tela de Pedidos
</p>
<p align="center">
<img src="./preview/login.png" alt="login" width="800"/>
<img src="./preview/home.png" alt="home" width="800"/>
<img src="./preview/carrinho.png" alt="carrinho" width="800"/>
<img src="./preview/pedidos.png" alt="pedidos" width="800"/>
</p>
<hr />