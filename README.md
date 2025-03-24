# MyFavoriteMovies

Este é um aplicativo de filmes que segue a arquitetura VIPER e foi desenvolvido para ser escalável, testável e modular. Para rodar o projeto, basta escolher o target scheme "MyFavoriteMovies" e executar no Xcode.

## Funcionalidades

O aplicativo é composto por 4 telas principais:

1. **Tela de Busca**
   - Nessa tela, o usuário pode pesquisar por filmes.
   ![Tela de Busca](https://github.com/user-attachments/assets/2c7b16d8-64df-4f69-8118-da48818e5df2)

2. **Tela de Lista de Filmes**
   - Após realizar a busca, os filmes encontrados são exibidos nesta tela.
   ![Tela de Lista de Filmes](https://github.com/user-attachments/assets/7ad158bb-7a12-45d8-999b-37e802b46ee3)

3. **Tela de Favoritos**
   - Aqui o usuário pode visualizar e gerenciar seus filmes favoritos.
   ![Tela de Favoritos](https://github.com/user-attachments/assets/05789ede-ea22-4f9f-aa05-0a1cf3a1b167)

4. **Tela de Detalhes do Filme**
   - Ao selecionar um filme da lista ou dos favoritos, a tela de detalhes exibe informações adicionais.
   ![Tela de Detalhes do Filme](https://github.com/user-attachments/assets/c3585a02-7c73-4081-8824-cd62fa10fb99)

## Estrutura de Pastas

A estrutura de pastas segue a arquitetura **VIPER**, que foi utilizada para garantir a modularidade, escalabilidade e testabilidade do código. A organização das pastas é a seguinte:

<img width="345" alt="Captura de Tela 2025-03-23 às 21 21 55" src="https://github.com/user-attachments/assets/705ca0c2-b3ef-41a2-a912-f99315c5dc02" />

## Arquitetura VIPER

A arquitetura VIPER (View, Interactor, Presenter, Entity, Router) foi escolhida para separar claramente as responsabilidades, permitindo uma estrutura mais organizada e testável.

## Testes Unitários

Testes unitários foram implementados na **scene Search**, para garantir que a funcionalidade de busca de filmes esteja funcionando corretamente. Os testes cobrem os fluxos de sucesso e falha da busca.

## Detalhes adicionais
- Não foi feito uso de biblioteca de terceiros
