# Learning 3D 

> Projeto desenvolvido para a disciplina de Desenvolvimento Mobile do curso de Bacharelado em Ciência da Computação.

O **Learning 3D** é um aplicativo mobile focado em complementar a experiência de estudo de livros didáticos por meio da **Realidade Aumentada (AR)**. Ele funciona como uma ferramenta de apoio pedagógico, permitindo que estudantes visualizem modelos tridimensionais interativos diretamente no ambiente real, enriquecendo o aprendizado de disciplinas como Artes, Anatomia, Astronomia e Ciências Naturais.

---

## Sobre o Projeto

A proposta do aplicativo é transformar a leitura teórica e estática dos livros em uma experiência visual ativa. Ao estudar sobre uma escultura histórica ou a estrutura de um planeta, o aluno pode projetar o modelo 3D correspondente no espaço físico (como mesas ou superfícies), facilitando a compreensão espacial e anatômica dos objetos estudados.

---

## Funcionalidades

* **Matérias:** Navegação categorizada por disciplinas (Arte, Anatomia, Fauna, Astronomia).
* **Curiosidades Interativas:** Cards informativos com fatos e detalhes históricos importantes sobre cada elemento antes da visualização 3D.
* **Visualização 3D nativa:** Renderização interativa de arquivos `.glb` com controle de câmera, rotação e zoom.
* **Modo Realidade Aumentada (AR):** Projeção dos modelos tridimensionais em superfícies reais utilizando o ecossistema nativo do dispositivo.

---

## Tecnologias Utilizadas

* **Framework:** [Flutter](https://flutter.dev/) (linguagem Dart)
* **Visualização 3D/AR:** `model_viewer_plus` (integração nativa com o *Scene Viewer* do Android / *Quick Look* do iOS)
* **Tipografia:** Google Fonts (`leagueSpartan` e `roboto`)

---

## Como Executar o Projeto

### Pré-requisitos
Antes de começar, você vai precisar ter instalado em sua máquina o **Flutter SDK** configurado e um dispositivo físico Android (com suporte a ARCore) conectado via USB para testar a Realidade Aumentada.

### Passo a Passo

1. **Clonar o repositório:**
   ```bash
   git clone [https://github.com/AmandaDSCampos/Projeto-Mobile.git](https://github.com/AmandaDSCampos/Projeto-Mobile.git)