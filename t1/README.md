# Decodificador de Instruções MIPS em Assembly

Este projeto, desenvolvido para a disciplina de Organização de Computadores, é um decodificador de instruções de máquina da arquitetura MIPS escrito puramente em Assembly MIPS. O programa é capaz de ler um arquivo contendo instruções em formato binário, interpretá-las e, em seguida, gerar um arquivo de texto com a representação correspondente em linguagem Assembly MIPS.

O desenvolvimento foi um exercício prático para aplicar conceitos de manipulação de bits, estruturas de controle e leitura e escrita de arquivos em Assembly MIPS, utilizando o simulador MARS.

**Autor:** Tobias Viero de Oliveira

## Funcionalidades

O decodificador implementa as seguintes funcionalidades:

* **Leitura de Arquivo Binário**: Lê instruções de máquina de 32 bits diretamente de um arquivo de entrada (`ex-000-012.bin`).
* **Decodificação de Instruções**: Identifica os campos da instrução, como `opcode`, `rs`, `rt`, `rd`, `imm`, `target` e `funct`, utilizando operações de deslocamento de bits (`shift left` e `shift right`).
* **Tradução para Assembly**: Converte a instrução binária para sua representação em Assembly MIPS, lidando com diferentes formatos de instrução.
* **Geração de Arquivo de Saída**: Cria um arquivo de texto (`meuarquivo.txt`) contendo, para cada instrução, o Program Counter (PC) atual, a representação da instrução em hexadecimal e a instrução decodificada.
* **Manipulação Precisa de Dados**: Garante a precisão na manipulação dos campos, incluindo a extensão de sinal para valores imediatos quando necessário.
* **Tratamento de Erros**: Identifica e sinaliza adequadamente as instruções que não foram mapeadas ou são desconhecidas.

## Estrutura do Projeto

O código foi modularizado em três arquivos principais para facilitar a organização e a manutenção:

* `main.asm`: É o arquivo principal que controla o fluxo do programa. Ele é responsável pela leitura do arquivo binário, pelo laço de repetição que processa cada instrução e pela chamada das rotinas de decodificação e escrita.
* `hexa.asm`: Contém a lógica para realizar a conversão de um número binário para sua representação em string hexadecimal.
* `decoder.asm`: Um módulo auxiliar que contém a lógica para mapear os códigos numéricos dos registradores para seus nomes correspondentes em Assembly (ex: 29 para `$sp`) e para realizar a extensão de sinal.

## Como Executar

Para montar e executar este decodificador, certifique-se de que todos os arquivos (`Mars.jar`, `main.asm`, `hexa.asm`, `decoder.asm`, e `ex-000-012.bin`) estejam no mesmo diretório e siga os passos abaixo:

1.  **Iniciar o Simulador**: Execute o arquivo `Mars.jar` para abrir o ambiente de desenvolvimento MARS.
2.  **Abrir os Arquivos**: No menu do MARS, vá em `File > Open...` e selecione *todos* os arquivos de código Assembly: `main.asm`, `hexa.asm` e `decoder.asm`.
3.  **Configurar a Montagem**: Vá até o menu `Settings` e certifique-se de que a opção **"Assemble all files in directory"** está marcada. Isso é crucial para que os módulos separados do projeto sejam reconhecidos durante a montagem.
4.  **Montar (Assemble)**: Com a aba do `main.asm` em primeiro plano, vá em `Run > Assemble` (ou pressione `F3`).
5.  **Executar (Run)**: Clique em `Run > Go` (ou pressione `F5`) para executar o decodificador.
6.  **Verificar a Saída**: Após a conclusão, um novo arquivo chamado `meuarquivo.txt` será criado no diretório. Ele conterá as instruções decodificadas, conforme o formato especificado.
