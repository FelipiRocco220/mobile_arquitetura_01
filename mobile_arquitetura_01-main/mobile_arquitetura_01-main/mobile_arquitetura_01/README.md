# Mobile Arquitetura 01

Uma aplicação Flutter que consome a API Fake Store para exibir uma lista de produtos, organizada com arquitetura em camadas.

## Arquitetura

- **Apresentação**: UI e gerenciamento de estado
- **Domínio**: Entidades e contratos de repositório
- **Dados**: Modelos, fontes de dados e implementações de repositório
- **Núcleo**: Utilitários comuns

## Funcionalidades

- Busca produtos de https://fakestoreapi.com/products
- Exibe lista de produtos com título, preço e imagem

## Primeiros Passos

1. Certifique-se de que o Flutter está instalado.
2. Execute `flutter pub get` para instalar as dependências.
3. Execute `flutter run` para iniciar o aplicativo.


# Questionário de Reflexão (Atividade 2)

**1. Em qual camada foi implementado o mecanismo de cache?**
O cache foi implementado na camada de Repository. Isso é adequado porque o Repository é responsável por decidir de onde vêm os dados (API, cache, banco local), mantendo a separação de responsabilidades e facilitando a manutenção da arquitetura em camadas.

**2. Por que o ViewModel não deve realizar chamadas HTTP diretamente?**
O ViewModel não deve realizar chamadas HTTP diretamente para manter a separação de responsabilidades. Ele deve apenas coordenar o estado da interface e orquestrar a busca de dados através do Repository, que abstrai as fontes de dados.

**3. O que poderia acontecer se a interface acessasse diretamente o DataSource?**
Se a interface acessasse diretamente o DataSource, a arquitetura ficaria acoplada, dificultando testes, manutenção e evolução do sistema. Mudanças na fonte de dados impactariam diretamente a UI.

**4. Como essa arquitetura facilitaria a substituição da API por um banco de dados local?**
A arquitetura em camadas permite substituir a fonte de dados (por exemplo, trocar a API por um banco local) apenas alterando a implementação do Repository/DataSource, sem impactar a UI ou o ViewModel.