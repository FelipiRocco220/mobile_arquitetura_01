# Mobile Arquitetura 02

Uma aplicação Flutter que consome a API Fake Store para exibir, criar, editar e deletar produtos. Implementa arquitetura em camadas com estado explícito, tratamento de erros e cache local.

## Arquitetura e Estrutura de Pastas

```
lib/
├── models/
│   └── product.dart          # Modelo de dados com fromJson/toJson
├── services/
│   └── product_service.dart  # Serviço centralizado de API (GET, POST, PUT, DELETE)
├── screens/
│   ├── product_list_screen.dart      # Listagem de produtos
│   ├── product_form_screen.dart      # Formulário (cadastro e edição)
│   └── product_detail_screen.dart    # Detalhes do produto
├── widgets/
│   ├── product_card.dart        # Cartão reutilizável de produto
│   └── product_form_field.dart  # Campo de formulário reutilizável
├── presentation/
│   └── product_provider.dart    # ViewModel (coordena estado e operações)
└── main.dart
```

## Componentes Principais

### 1. Models (`models/product.dart`)
- **Responsabilidade**: Definição da estrutura de dados
- **Métodos**: `fromJson()` (API → Dart), `toJson()` (Dart → API), `copyWith()`
- **Campos**: id, title, price, description, image, category

### 2. Service (`services/product_service.dart`)
Centraliza todas as chamadas HTTP:
- `fetchProducts()` - GET /products (lista completa)
- `getProductById()` - GET /products/{id} (um produto)
- `addProduct()` - POST /products (criar novo)
- `updateProduct()` - PUT /products/{id} (atualizar)
- `deleteProduct()` - DELETE /products/{id} (deletar)

### 3. Screens (Telas)

#### ProductListScreen
- Exibe lista de produtos com estado explícito (carregando, erro, sucesso)
- Botões de ação: Detalhes, Editar, Deletar
- FAB para novo produto

#### ProductFormScreen
- Mesma tela para Cadastro e Edição
- Validação de campos
- Diferencia novo produto (sem id) de edição (com id)

#### ProductDetailScreen
- Exibe todas as informações do produto
- Layout amigável com imagem em destaque

### 4. Widgets (`widgets/`)

#### ProductCard
- Cartão reutilizável com imagem, título, preço e categoria
- Menu de ações (detalhes, editar, deletar)

#### ProductFormField
- Campo de formulário customizável
- Suporta diferentes tipos de input (text, number, multiline, url)

### 5. Provider (`presentation/product_provider.dart`)
Coordena o estado da aplicação:
- `fetchProducts()` - Busca com cache automático
- `addProduct()` - Adiciona novo produto
- `updateProduct()` - Atualiza produto existente
- `deleteProduct()` - Remove produto

## Requisitos Arquiteturais Mantidos

✅ **UI não realiza chamadas HTTP diretamente**
- ProductListScreen e ProductFormScreen apenas coordenam via Provider

✅ **ViewModel coordena o estado**
- ProductProvider gerencia loading, erro e sucesso
- Orquestra todas as operações de CRUD

✅ **Repository decide de onde os dados vêm**
- ProductService (anteriormente ProductRepository) escolhe a fonte

✅ **DataSources executam apenas operações de IO**
- ProductRemoteDataSource realiza apenas requisições HTTP

## Estados da Interface

1. **Carregando**: CircularProgressIndicator
2. **Erro**: Mensagem de erro com botão "Tentar Novamente"
3. **Sucesso**: Lista de produtos com opções de ação
4. **Vazio**: Mensagem quando lista está vazia

## Tratamento de Erros

- Exceções da API são capturadas e exibidas ao usuário
- Telas de formulário mostram SnackBar com status
- Tentativas de retry disponíveis

## Cache Local

- Implementado automaticamente na camada de Repository
- Dados previamente carregados são utilizados em caso de falha de API
- Usuário é informado quando está visualizando dados em cache

## Funcionalidades CRUD

- ✅ **Create (POST)**: Novo produto via ProductFormScreen
- ✅ **Read (GET)**: Lista em ProductListScreen, detalhes em ProductDetailScreen
- ✅ **Update (PUT)**: Edição via ProductFormScreen
- ✅ **Delete (DELETE)**: Remoção com confirmação

## Gerenciamento de Estado

- **Provider 6.0.5**: Para reatividade e notificação de mudanças
- **setState**: Não utilizado em telas, apenas Provider

## Primeiros Passos

1. Certifique-se de que o Flutter está instalado
2. Execute `flutter pub get` para instalar as dependências
3. Execute `flutter run` para iniciar o aplicativo

## Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  http: ^1.1.0
  cupertino_icons: ^1.0.0
```

---

# Questionário de Reflexão (Atividade 2)

**1. Em qual camada foi implementado o mecanismo de cache?**
O cache foi implementado na camada de Service/Repository. Isso é adequado porque é responsabilidade dessa camada decidir de onde vêm os dados (API, cache, banco local), mantendo a separação de responsabilidades e facilitando a manutenção da arquitetura em camadas.

**2. Por que o ViewModel não deve realizar chamadas HTTP diretamente?**
O ViewModel não deve realizar chamadas HTTP diretamente para manter a separação de responsabilidades. Ele deve apenas coordenar o estado da interface e orquestrar a busca de dados através do Service/Repository, que abstrai as fontes de dados.

**3. O que poderia acontecer se a interface acessasse diretamente o DataSource?**
Se a interface acessasse diretamente o DataSource, a arquitetura ficaria acoplada, dificultando testes, manutenção e evolução do sistema. Mudanças na fonte de dados impactariam diretamente a UI, violando o princípio de separação de responsabilidades.

**4. Como essa arquitetura facilitaria a substituição da API por um banco de dados local?**
A arquitetura em camadas permite substituir a fonte de dados (por exemplo, trocar a API por um banco local wie SQLite) apenas alterando a implementação do Service/DataSource, sem impactar a UI ou o ViewModel. A interface do Repository permaneceria a mesma, garantindo compatibilidade total.