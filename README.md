## 🚀 Sumário

- [Pré-requisitos](#-pré-requisitos)
- [Execução](#-execução)
- [Executando os testes](#-executando-os-testes)
- [Estruturado projeto](#-estruturado-projeto)
- [Padrões de projeto](#-padrões-de-projeto)

### 📋 Pré-requisitos

```
Deployment Target iOS 12
Swift 4.2
```


### ▶️ Execução

- Para rodar o projeto, basta abri-lo no XCode, navegar pela aba Product e clicar na opção Run, ou utilizar a combinação das teclas Command+R.


## ⚙️ Executando os testes

- Para rodar os testes do projeto, basta abri-lo no XCode, navegar pela aba Product e clicar na opção Test, ou utilizar a combinação das teclas Command+U.


## 📦 Estrutura do projeto

```shell
├── DigioStore
	└── Classes
	└── Controllers
	└── Extensions
	└── Fastlane
	└── Models
	└── Networking
	└── Resources
	└── ViewModels
	└── Views
├── DigioStore.xcodeproproj
└── DigioStoreTests
```


- **DigioStore**: Diretório raíz do projeto, onde encontra-se o código fonte do aplicativo final.
  - **Classes**: Diretório onde ficam classes diversas que podem ser reutilizadas por quaisquer módulos do projeto.
  - **Controllers**: Camada responsável pela lógica de apresentação das telas.
  - **Extensions**: Diretório onde ficam as extensões customizadas dos componentes do projeto.
  - **Fastlane**: Diretório responsável pelo CI/CD
  - **Models**: Camada responsável por representar o modelo de dado.
  - **Networking**: Camada responsável pela comunicação externa (API).
  - **Resources**: Diretório onde ficam os assets, fonts, etc, do projeto.
  - **ViewModels**: Camada, testável, responsável pela regra de negócio e lógica de apresentação.
  - **Views**: Camada responsável pelos elementos visuais.
- **DigioStoreTests**: Diretório onde ficam os testes unitários do projeto.


## 🧰 Padrões de projeto e arquitetura de código
 
- [MVVM](https://www.devmedia.com.br/entendendo-o-pattern-model-view-viewmodel-mvvm/18411) - Este projeto foi construído seguindo os conceitos do Pattern MVVM. Este foi escolhido, pois encaixa muito bem com framework UIKit e com a liguagem Swift. Também contaram, para escolha deste padrão, a organização das classes e a fácil comprenssão das ligações entre as mesmas.
