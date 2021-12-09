[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![Open Source](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://opensource.org/)

# **Clean Movies - TMDB**

---

O objetivo da construção do APP é usar uma arquitetura bem definida e desacoplada, seguindo a Clean Architecture para fazer a distribuição de responsabilidades em camadas, sempre seguindo os princípios do SOLID e aplicando Design Patterns para resolver alguns problemas comuns.

---

# **Principais Funcionalidades**

- Listar filmes populares
- Listar filmes lançados recentemente
- Listar filmes a serem lançados em breve
- Buscar filmes
- Favoritar Filmes
- Listar Filmes favoritos
- Listar detalhes do filme (elenco, trailers)
- Assistir trailers
- Multilinguagem (inglês e espanhol)
- Realizar feedback sobre o app
- Login com credenciais do TMDB
- Logout
- Login como convidado

## [**Link para a documentação da API**](https://developers.themoviedb.org/3)

## **App em funcionamento**

![](screens/cleanmovie.gif)

## Porquê de algumas decisões arquiteturais e de bibliotecas

- Uso do build_runner
  - o banco de dados escolhido para a aplicação (Hive) necessita de geração de tabelas.
- Uso do cached_network_image
  - Permite cachear imagens para utilização posterior. Ao requerer o mesmo recurso novamente, o widget busca do cache em vez da rede
- Uso do dartz
  - Dartz nos permite dar um poder maior para nossos usecases através da possibilidade de retornarmos um Either.
- Uso do equatable
  - O equatable nos permite melhorar a comparação de objetos nativa do Dart.
- Uso do flutter_bloc
  - Implementação do BloC específica para o Flutter.
- Uso do flutter_localizations
  - Nos permite localizar o app, com diversos idiomas, facilmente.
- Uso do flutter_svg
  - Carregar imagens SVG
- Uso do get_it
  - Referência na parte de injeção de dependências, o GetIt nos permite gerenciar vários níveis de dependência facilmente.
- Uso do google_fonts
  - Fontes customizadas são oferecidas com facilidade
- Uso do hive
  - Banco de dados chave-valor extremamente rápido.
- Uso do hive_generator
  - Gera classes do Hive e faz o mapeamento dos modelos para tabelas.
- Uso do http
  - Biblioteca para gerenciar chamadas HTTP - facilmente gerenciável
- Uso do mockito
  - Criar mocks para testes.
- Uso do path_provider
  - Uso de diretórios do dispositivo que o app está rodando
- Uso do rive
  - Animações customizadas
- Uso do wiredash
  - Permite o usuário reportar bugs e dar feedback para os desenvolvedores.
- Uso do youtube_player_flutter
  - Executar os trailers dos filmes.

> ## Princípios

- Single Responsibility Principle (SRP)
- Open Closed Principle (OCP)
- Liskov Substitution Principle (LSP)
- Interface Segregation Principle (ISP)
- Dependency Inversion Principle (DIP)
- Separation of Concerns (SOC)
- Don't Repeat Yourself (DRY)
- You Aren't Gonna Need It (YAGNI)
- Keep It Simple, Silly (KISS)
- Command Query Responsibility Segregation (CQRS)
- Composition Over Inheritance
- Small Commits

> ## Design Patterns

- Factory
- Adapter
- Composite
- Decorator
- Dependency Injection
- Abstract Server
- Composition Root
- Builder
- Singleton
- Observer

> ## Metodologias e Designs

- Clean Architecture
- Reactive Programming
- GitFlow
- Modular Design
- Use Cases
- Internacionalização

> ## Bibliotecas e Ferramentas

- Flutter
- Build Runner
- Cached Network Image
- Dartz
- Flutter Localizations
- Flutter SVG
- GetIt
- Http
- Path Provider
- Rive
- Wiredash
- Youtube Video Player
- Bloc
- Flutter Bloc
- Equatable
- Mockito
- Git
- Hive
