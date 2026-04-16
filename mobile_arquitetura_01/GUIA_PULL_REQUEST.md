# 📝 Guia Completo: Como Fazer um Pull Request

## 🎯 Objetivo
Enviar suas alterações para o repositório GitHub e criar um Pull Request (PR).

**Repositório**: https://github.com/FelipiRocco220/mobile_arquitetura_01.git

---

## 📋 Pré-requisitos

Antes de começar, verifique se você tem:
- ✅ Git instalado: `git --version`
- ✅ Conta GitHub com acesso ao repositório
- ✅ Alterações salvas localmente

---

## ⚡ RESUMO RÁPIDO (Se você só quer enviar)

**4 Passos Principais**:

### **1️⃣ Abra o repositório no PowerShell**

```bash
cd $HOME\Downloads\mobile_arquitetura_01
```

### **2️⃣ Crie uma branch nova**

```bash
git checkout -b feature/arquitetura-completa
```

### **3️⃣ Copie seus arquivos atualizados**

**Via Explorador (mais fácil)**:
1. Abra: `C:\Users\FelipiGabrielSoaresR\Downloads\mobile_arquitetura_01-main (1)\...\mobile_arquitetura_01\lib`
2. Copie a pasta `lib` inteira
3. Cole em: `C:\Users\FelipiGabrielSoaresR\Downloads\mobile_arquitetura_01\lib`
4. Volte e copie todos os arquivos `.md` da fonte
5. Cole na raiz do repositório

**Ou via PowerShell**:
```powershell
$origem = "C:\Users\FelipiGabrielSoaresR\Downloads\mobile_arquitetura_01-main (1)\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01"

Copy-Item -Path "$origem\lib" -Destination ".\lib" -Recurse -Force
Copy-Item -Path "$origem\*.md" -Destination "." -Force
```

### **4️⃣ Envie tudo para GitHub**

```bash
# Verificar o que mudou
git status

# Adicionar tudo
git add .

# Fazer commit
git commit -m "feat: adiciona arquitetura completa com CRUD e documentação"

# Enviar para GitHub
git push -u origin feature/arquitetura-completa
```

### **5️⃣ Criar PR no GitHub**

1. Vá em: https://github.com/FelipiRocco220/mobile_arquitetura_01
2. Clique em "Compare & pull request" (botão verde que aparece)
3. Clique em "Create pull request"

**Pronto! ✅**

---

### **PASSO 1: Clonar o Repositório** (Se ainda não tiver)

```bash
# Abra o PowerShell e navegue até onde quer clonar
cd $HOME\Downloads

# Clone o repositório
git clone https://github.com/FelipiRocco220/mobile_arquitetura_01.git

# Entre no diretório do projeto
cd mobile_arquitetura_01
```

**O que acontece**: Uma cópia completa do repositório é baixada para seu computador.

---

#### **❌ ERRO: "destination path already exists and is not an empty directory"**

Se você receber este erro, significa que o repositório já foi clonado antes. Escolha uma solução:

##### **Solução 1: Usar diretório diferente** ✅ Mais Simples

```bash
cd $HOME\Downloads

# Clone com um nome diferente
git clone https://github.com/FelipiRocco220/mobile_arquitetura_01.git mobile_arquitetura_01_new

# Entre no novo diretório
cd mobile_arquitetura_01_new
```

##### **Solução 2: Deletar o diretório antigo**

```bash
cd $HOME\Downloads

# Delete o diretório antigo (cuidado!)
Remove-Item -Path "mobile_arquitetura_01" -Recurse -Force

# Clone novamente
git clone https://github.com/FelipiRocco220/mobile_arquitetura_01.git

# Entre no diretório
cd mobile_arquitetura_01
```

##### **Solução 3: Usar repositório existente** ✅ Recomendado

Se o diretório já é um repositório git, simplesmente entre nele:

```bash
cd $HOME\Downloads\mobile_arquitetura_01

# Atualize para a versão mais recente
git pull origin main
```

##### **Solução 4: Limpar o diretório antigo**

```bash
cd $HOME\Downloads\mobile_arquitetura_01

# Remova tudo
git reset --hard HEAD
git clean -fd

# Atualize
git pull origin main
```

**Use a Solução 3 ou 4 se o repositório já existe!**

---

### **PASSO 2: Verificar Status Atual**

```bash
# Veja em qual branch você está
git branch

# Verifique o status das alterações
git status
```

**O que você deve ver**:
```
* main (ou master)
  On branch main
  Your branch is up to date with 'origin/main'.
```

---

### **PASSO 3: Criar uma Nova Branch (Recomendado)**

```bash
# Crie uma branch com um nome descritivo
# Formato: feature/nome-da-feature ou fix/nome-do-fix
git checkout -b feature/arquitetura-completa

# Ou use este comando (mais simples):
git switch -c feature/arquitetura-completa
```

**Exemplos de nomes de branch**:
- `feature/adicionar-validacao`
- `fix/corrigir-imports`
- `docs/atualizar-documentacao`
- `refactor/melhorar-cache`

**Resultado esperado**:
```
Switched to a new branch 'feature/arquitetura-completa'
```

---

### **PASSO 4: Copiar Seus Arquivos Modificados**

Se você trabalhou em um diretório diferente, copie os arquivos atualizados para este repositório.

#### **Opção A: Via Explorador (Mais Simples)** ✅ RECOMENDADO

1. **Abra duas janelas do Explorador**:
   - Janela 1: `C:\Users\FelipiGabrielSoaresR\Downloads\mobile_arquitetura_01-main (1)\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01`
   - Janela 2: `C:\Users\FelipiGabrielSoaresR\Downloads\mobile_arquitetura_01` (seu repositório clonado)

2. **Copiar arquivos de `lib/`**:
   - Na Janela 1: Entre em `lib`
   - Selecione tudo: `Ctrl+A`
   - Copie: `Ctrl+C`
   - Na Janela 2: Entre em `lib`
   - Cole: `Ctrl+V`

3. **Copiar arquivos markdown**:
   - Na Janela 1: Volte para raiz (pasta pai)
   - Selecione todos os arquivos `.md` (README_COMPLETO.md, ANALISE_REQUISITOS.md, etc)
   - Copie: `Ctrl+C`
   - Na Janela 2: Raiz do repositório
   - Cole: `Ctrl+V`

#### **Opção B: Via PowerShell (Se preferir comando)**

```powershell
# Defina o caminho de origem (use aspas!)
$origem = "C:\Users\FelipiGabrielSoaresR\Downloads\mobile_arquitetura_01-main (1)\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01"

# Copiar pasta lib inteira
Copy-Item -Path "$origem\lib" -Destination ".\lib" -Recurse -Force

# Copiar todos os .md
Copy-Item -Path "$origem\*.md" -Destination "." -Force

# Verificar se funcionou
Get-ChildItem -Recurse
```

#### **Opção C: Via Robocopy (Mais Robusto)**

```powershell
# Defina caminhos
$origem = "C:\Users\FelipiGabrielSoaresR\Downloads\mobile_arquitetura_01-main (1)\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01"
$destino = "."

# Copiar com robocopy
robocopy "$origem\lib" ".\lib" /E /COPY:DAT

# Copiar markdown
robocopy "$origem" "$destino" *.md
```

#### **Opção D: Via PowerShell com Tratamento de Erro**

```powershell
# Script com validação
$origem = "C:\Users\FelipiGabrielSoaresR\Downloads\mobile_arquitetura_01-main (1)\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01-main\mobile_arquitetura_01"

# Verificar se pasta existe
if (-Not (Test-Path $origem)) {
    Write-Host "❌ Pasta de origem não encontrada!" -ForegroundColor Red
    exit
}

# Copiar lib
Write-Host "📁 Copiando pasta lib..." -ForegroundColor Blue
Copy-Item -Path "$origem\lib" -Destination ".\lib" -Recurse -Force -ErrorAction Stop

# Copiar markdown
Write-Host "📄 Copiando arquivos markdown..." -ForegroundColor Blue
Copy-Item -Path "$origem\*.md" -Destination "." -Force -ErrorAction Stop

Write-Host "✅ Arquivos copiados com sucesso!" -ForegroundColor Green
Get-ChildItem -Recurse | Select-Object FullName
```

**Escolha a opção que funcionar melhor para você!**

---

### **PASSO 5: Verificar Mudanças**

```bash
# Veja quais arquivos foram modificados
git status

# Veja o diff (diferenças) dos arquivos
git diff

# Veja mudanças de um arquivo específico
git diff lib/presentation/product_provider.dart
```

**O que você verá**:
```
On branch feature/arquitetura-completa
Changes not staged for commit:
  modified:   lib/presentation/product_provider.dart
  modified:   lib/presentation/product_list_screen.dart
  new file:   GUIA_PULL_REQUEST.md
  ...
```

---

### **PASSO 6: Adicionar Arquivos (Staging)**

```bash
# Adicione todos os arquivos modificados
git add .

# Ou adicione arquivos específicos
git add lib/
git add README_COMPLETO.md
git add ANALISE_REQUISITOS.md

# Verifique o que foi adicionado
git status
```

**Status esperado**:
```
Changes to be committed:
  modified:   lib/presentation/product_provider.dart
  new file:   GUIA_PULL_REQUEST.md
  ...
```

---

### **PASSO 7: Fazer o Commit**

```bash
# Crie um commit com uma mensagem descritiva
git commit -m "feat: adiciona arquitetura completa com CRUD e documentação"

# Ou mensagens mais específicas:
git commit -m "refactor: melhora validação de formulários"
git commit -m "docs: adiciona guia completo de PR"
git commit -m "fix: corrige imports duplicados"
```

**Formato recomendado de mensagem**:
```
<tipo>: <descrição breve>

<descrição detalhada opcional>
```

**Tipos válidos**:
- `feat`: Nova funcionalidade
- `fix`: Correção de bug
- `docs`: Documentação
- `refactor`: Refatoração de código
- `style`: Formatação/estilo
- `test`: Testes
- `chore`: Tarefas diversas

**Exemplo completo**:
```bash
git commit -m "feat: implementa CRUD completo com validação

- Adiciona ProductProvider com métodos CRUD
- Melhora validadores de preço e URL
- Remove ProductService duplicado
- Adiciona ProductCard e ProductFormField
- Atualiza documentação com 6 arquivos"
```

---

### **PASSO 8: Enviar para o GitHub (Push)**

```bash
# Envie seus commits para o repositório remoto
git push origin feature/arquitetura-completa

# Primeira vez? Use:
git push -u origin feature/arquitetura-completa
```

**O que você verá**:
```
Enumerating objects: 25, done.
Counting objects: 100% (25/25), done.
Delta compression using up to 8 threads
...
 * [new branch]      feature/arquitetura-completa -> feature/arquitetura-completa
```

---

### **PASSO 9: Criar o Pull Request no GitHub**

#### **Opção A: Via Terminal (GitHub CLI)**

```bash
# Se tiver GitHub CLI instalado:
gh pr create --title "Arquitetura Completa com CRUD" `
  --body "Implementa arquitetura em camadas com CRUD completo, validação e documentação."
```

#### **Opção B: Via Website GitHub (Mais Simples)**

1. **Vá para o repositório**: https://github.com/FelipiRocco220/mobile_arquitetura_01
2. **Você verá uma notificação**:
   ```
   ⚡ Compare & pull request
   ```
3. **Clique em "Compare & pull request"**
4. **Preencha os campos**:
   - **Title**: "Arquitetura Completa com CRUD e Documentação"
   - **Description**: Escreva uma descrição detalhada do que foi feito

5. **Exemplo de Descrição**:
```markdown
## 📝 Descrição
Esta PR implementa a arquitetura completa do projeto com todas as atividades (04-09) implementadas.

## ✨ Mudanças Realizadas

### Código
- ✅ Implementa CRUD completo (CREATE, READ, UPDATE, DELETE)
- ✅ Melhora validação de formulários (preço, URL)
- ✅ Remove ProductService duplicado
- ✅ Adiciona ProductCard e ProductFormField widgets

### Documentação
- ✅ README_COMPLETO.md - Visão geral completa
- ✅ ANALISE_REQUISITOS.md - Análise de conformidade
- ✅ ENTREGAVEIS.md - Resumo de entregáveis
- ✅ INDICE.md - Guia de navegação
- ✅ DIAGRAMA_ARQUITETURA.puml - Diagrama detalhado
- ✅ Arquivos adicionais de documentação

## 🎯 Checklist
- [x] Código segue SOLID principles
- [x] Documentação completa
- [x] Testes adicionais (se aplicável)
- [x] Sem conflitos com main branch

## 📸 Screenshots (opcional)
Adicione screenshots da aplicação se relevante.

## 🔗 Issues Relacionadas
Closes #123 (substitua pelo número da issue, se houver)
```

6. **Clique em "Create pull request"**

---

### **PASSO 10: Acompanhar o Pull Request**

```bash
# Verifique PRs abertas
git pr list

# Ou acesse o GitHub para acompanhar:
# https://github.com/FelipiRocco220/mobile_arquitetura_01/pulls
```

**Passos que podem ocorrer**:
1. ✅ GitHub verifica automaticamente (CI/CD)
2. 💬 Revisores fazem comentários
3. 🔄 Você faz ajustes se necessário:
   ```bash
   # Faça as alterações solicitadas
   git add .
   git commit -m "refactor: ajusta conforme feedback da PR"
   git push origin feature/arquitetura-completa
   ```
4. ✅ PR é aprovada e mergeada

---

## 🔄 Sincronizar com a Branch Principal (Antes de PR)

Se houve alterações na `main` enquanto você trabalhava:

```bash
# Atualize a main local
git fetch origin

# Rebase sua branch
git rebase origin/main

# Ou merge (alternativa)
git merge origin/main

# Push forçado se necessário (cuidado!)
git push origin feature/arquitetura-completa -f
```

---

## ❌ Solução de Problemas

### **Problema: Conflito de Merge**

```bash
# Se houver conflitos:
# 1. Abra os arquivos com conflitos (marcados com <<<<<<, ======, >>>>>>)
# 2. Resolva manualmente
# 3. Adicione os arquivos resolvidos
git add .

# 4. Continue o rebase/merge
git rebase --continue
# ou
git commit -m "Resolve merge conflicts"
```

### **Problema: Commits Errados**

```bash
# Desfaça o último commit (mantém alterações)
git reset --soft HEAD~1

# Desfaça o último commit (descarta alterações)
git reset --hard HEAD~1

# Desfaça antes de fazer push
git push --force-with-lease origin feature/arquitetura-completa
```

### **Problema: Mudar de Branch Sem Salvar**

```bash
# Salve temporariamente
git stash

# Mude de branch
git checkout main

# Volte à branch
git checkout feature/arquitetura-completa

# Recupere o trabalho
git stash pop
```

---

## ✅ Checklist Final Antes de Fazer PR

- [ ] Branch criada com nome descritivo
- [ ] Todos os arquivos foram copiados corretamente
- [ ] `git status` mostra apenas arquivos intencionais
- [ ] Commits têm mensagens claras e descritivas
- [ ] `git log` mostra histórico legível
- [ ] Código foi testado localmente
- [ ] Não há arquivos não rastreados desnecessários
- [ ] Sem conflitos com a branch principal
- [ ] Documentação foi atualizada
- [ ] PR tem título e descrição clara

---

## 📚 Referências Úteis

### Comandos Git Essenciais

```bash
# Ver histórico de commits
git log --oneline -10

# Ver commits de um arquivo
git log --follow lib/presentation/product_provider.dart

# Ver quem modificou cada linha
git blame lib/presentation/product_provider.dart

# Ver detalhes de um commit
git show abc123def

# Listar branches locais
git branch -a

# Deletar branch local
git branch -d feature/arquitetura-completa

# Deletar branch remota
git push origin --delete feature/arquitetura-completa
```

### Links Úteis

- **GitHub Docs**: https://docs.github.com/en/pull-requests
- **Git Cheat Sheet**: https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet
- **Conventional Commits**: https://www.conventionalcommits.org/

---

## 🎓 Workflow Resumido

```bash
# 1. Clonar
git clone https://github.com/FelipiRocco220/mobile_arquitetura_01.git
cd mobile_arquitetura_01

# 2. Criar branch
git checkout -b feature/meu-recurso

# 3. Fazer alterações (copiar arquivos)
# ... edite, adicione ou delete arquivos ...

# 4. Adicionar e commitar
git add .
git commit -m "feat: descrição clara do que foi feito"

# 5. Enviar para GitHub
git push -u origin feature/meu-recurso

# 6. Criar PR
# Acesse GitHub e clique em "Compare & pull request"
```

---

## 🎉 Próximos Passos Após Merge

```bash
# Quando sua PR foi mergeada:

# 1. Volte para main
git checkout main

# 2. Atualize main local
git pull origin main

# 3. Delete sua branch local
git branch -d feature/arquitetura-completa

# 4. Delete branch remota
git push origin --delete feature/arquitetura-completa

# 5. Comece um novo trabalho
git checkout -b feature/proximo-recurso
```

---

**Última Atualização**: 15/04/2026
**Versão**: 1.0
**Status**: ✅ Pronto para Usar

Se tiver dúvidas, consulte a [documentação oficial do GitHub](https://docs.github.com/pt/pull-requests).
