# elc1011-organizacao-de-computadores
# Trabalhos de Organização de Computadores

Repositório com os trabalhos práticos desenvolvidos para a disciplina de ELC1011 - Organização de Computadores, ministrada pelo Prof. Giovani Baratto na UFSM.

---

## Trabalho 1: Decodificador de Instruções MIPS

O primeiro trabalho consiste em um decodificador de instruções MIPS desenvolvido inteiramente em Assembly. O programa lê um arquivo binário contendo instruções de máquina, processa cada uma delas e gera um arquivo de texto com a instrução decodificada.

### Funcionalidades
- Leitura de um arquivo binário.
- Extração dos campos da instrução (`opcode`, `funct`, registradores, etc.) através de manipulação de bits.
- Conversão da instrução para formato hexadecimal.
- Mapeamento de registradores para seus nomes simbólicos (ex: `$t0`, `$sp`).
- Geração de um arquivo de saída formatado com o PC, a instrução em hexadecimal e a instrução em Assembly MIPS.

---

## Trabalho 2: Assembly MIPS e Arquitetura de Processadores

Este trabalho é dividido em várias partes que abordam desde a programação em Assembly MIPS até a análise teórica do funcionamento de um processador.

### Questão 1: Divisão de Inteiros de 32 bits
- **Descrição:** Implementação em Assembly MIPS do segundo algoritmo de divisão para números inteiros de 32 bits. O programa calcula o quociente e o resto da operação.
- **Detalhes Técnicos:** Como o algoritmo exige um registrador de resto com o dobro do tamanho dos operandos, foi criada uma função (`shift_left`) para simular o deslocamento de bits em um par de registradores de 32 bits.
- **Arquivo:** `ex1.asm`

### Questão 2: Cálculo de Cosseno com Ponto Flutuante
- **Descrição:** Programa que calcula uma aproximação do cosseno de um ângulo (em graus) utilizando a série de Taylor. O programa primeiro converte o ângulo para radianos e depois aplica a série, truncada no sétimo termo (n=7).
- **Detalhes Técnicos:** O código utiliza o coprocessador de ponto flutuante para manipular valores `double` e implementa funções para calcular potenciação e fatorial, necessárias para os termos da série.
- **Arquivo:** `ex2.asm`

### Questões 3 e 4: Conversão de Ponto Flutuante
- **Descrição:** Resolução de exercícios de conversão entre a representação decimal e a representação em ponto flutuante de precisão simples (padrão IEEE 754).
  - Questão 3: Converte o número decimal `114,55469` para ponto flutuante.
  - Questão 4: Converte o número em ponto flutuante `0x343400` para seu valor decimal.
- **Arquivo:** `Qestões 3 e 4.pdf`

### Questões 5, 6 e 7: Análise de Datapath Monociclo
- **Descrição:** Análise detalhada do fluxo de execução das instruções `sw`, `beq` e `j` em um processador monociclo.
- **Detalhes Técnicos:** Para cada instrução, o trabalho apresenta o diagrama do datapath com os sinais de controle e o fluxo de dados destacados, acompanhado de uma explicação textual passo a passo.
- **Arquivo:** `T2 - Org.pdf` (páginas 4 a 12)
