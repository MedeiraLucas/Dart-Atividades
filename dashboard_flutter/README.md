# 📊 Dashboard Responsivo em Flutter

## 📌 Descrição do Projeto

Este projeto consiste no desenvolvimento de um **dashboard responsivo em Flutter**, capaz de se adaptar automaticamente a diferentes tamanhos de tela (mobile, tablet e desktop).

A aplicação apresenta **cards com informações**, além de um **gráfico simples**, utilizando conceitos modernos de layout responsivo como `MediaQuery`, `GridView` e widgets reutilizáveis.

---

## 🎯 Objetivo

Criar uma interface adaptável que proporcione uma boa experiência ao usuário em qualquer dispositivo, aplicando boas práticas de desenvolvimento em Flutter.

---

## 🧠 Conceitos Utilizados

* 📱 Responsividade com `MediaQuery`
* 🔲 Layout em grade com `GridView`
* ♻️ Componentização com widgets reutilizáveis
* 🎨 Estilização com `BoxDecoration`
* ⚡ Animações com `AnimatedScale`
* 📊 Representação visual com gráfico simples
* 📋 Navegação com `Drawer`

---

## 🖥️ Layout Responsivo

| Dispositivo | Largura da Tela | Layout    |
| ----------- | --------------- | --------- |
| 📱 Mobile   | < 600px         | 1 coluna  |
| 📲 Tablet   | 600 - 900px     | 2 colunas |
| 💻 Desktop  | > 900px         | 4 colunas |

---

## 🧩 Funcionalidades

### ✅ Cards Informativos

Cada card apresenta:

* Ícone representativo
* Título
* Valor numérico
* Cor personalizada
* Animação ao toque

### ✅ Gráfico Simples

* Representação visual de dados (barras)
* Labels (dias da semana)
* Estilização com bordas arredondadas

### ✅ Menu Lateral (Drawer)

* Navegação simples
* Itens de menu (Dashboard, Relatórios, Configurações)

---

## ⚙️ Tecnologias Utilizadas

* Flutter
* Dart
* Material Design 3

---

## 📂 Estrutura do Projeto

```
lib/
 └── main.dart
```

* `DashboardPage` → Tela principal
* `DashboardCard` → Componente reutilizável de card
* `SimpleChart` → Componente de gráfico

---

## 🚀 Como Executar o Projeto

1. Clone o repositório:

```bash
git clone <seu-repositorio>
```

2. Acesse a pasta:

```bash
cd nome-do-projeto
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Execute o projeto:

```bash
flutter run
```

---

## ⭐ Diferenciais (BÔNUS)

* Layout totalmente responsivo
* Animação nos cards
* Componentes reutilizáveis
* Código organizado e fácil de manter
* Interface limpa e moderna

---

## 📈 Possíveis Melhorias Futuras

* Integração com API real
* Gráficos dinâmicos (charts)
* Autenticação de usuário
* Dark Mode
* Persistência de dados

---

## 👨‍💻 Autor

Projeto desenvolvido como atividade acadêmica do curso de **Análise e Desenvolvimento de Sistemas (ADS)**.

---

## 📄 Licença

Este projeto é apenas para fins educacionais.
