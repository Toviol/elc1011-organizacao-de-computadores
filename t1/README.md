Decodificador de Instruções MIPS em Assembly
Este projeto, desenvolvido para a disciplina de Organização de Computadores, é um decodificador de instruções de máquina da arquitetura MIPS escrito puramente em Assembly MIPS. O programa é capaz de ler um arquivo contendo instruções em formato binário, interpretá-las e, em seguida, gerar um arquivo de texto com a representação correspondente em linguagem Assembly MIPS.

O desenvolvimento foi um exercício prático para aplicar conceitos de manipulação de bits, estruturas de controle e leitura e escrita de arquivos em Assembly MIPS, utilizando o simulador MARS.


Autor: Tobias Viero de Oliveira 

Funcionalidades
O decodificador implementa as seguintes funcionalidades:


Leitura de Arquivo Binário: Lê instruções de máquina de 32 bits diretamente de um arquivo de entrada (ex-000-012.bin).


Decodificação de Instruções: Identifica os campos da instrução, como opcode, rs, rt, rd, imm, target e funct, utilizando operações de deslocamento de bits (shift left e shift right).


Tradução para Assembly: Converte a instrução binária para sua representação em Assembly MIPS, lidando com diferentes formatos de instrução (Tipo-R, Tipo-I, Tipo-J).


Geração de Arquivo de Saída: Cria um arquivo de texto (output.txt) contendo, para cada instrução, o Program Counter (PC) atual, a representação da instrução em hexadecimal e a instrução decodificada.


Manipulação Precisa de Dados: Garante a precisão na manipulação dos campos, incluindo a extensão de sinal para valores imediatos quando necessário.


Tratamento de Erros: Identifica e sinaliza adequadamente as instruções que não foram mapeadas ou são desconhecidas.

Estrutura do Projeto
O código foi modularizado em três arquivos principais para facilitar a organização e a manutenção:

main.asm: É o arquivo principal que controla o fluxo do programa. Ele é responsável pela leitura do arquivo binário, pelo laço de repetição que processa cada instrução e pela chamada das rotinas de decodificação e escrita.


hexa.asm: Contém a lógica para realizar a conversão de um número binário para sua representação em string hexadecimal.


decoder.asm: Um módulo auxiliar que contém a lógica para mapear os códigos numéricos dos registradores para seus nomes correspondentes em Assembly (ex: 29 para $sp) e para realizar a extensão de sinal.

Claro! Aqui está uma sugestão de texto no estilo README para o seu projeto no GitHub, com base nos arquivos que você forneceu.

Decodificador de Instruções MIPS em Assembly
Este projeto, desenvolvido para a disciplina de Organização de Computadores, é um decodificador de instruções de máquina da arquitetura MIPS escrito puramente em Assembly MIPS. O programa é capaz de ler um arquivo contendo instruções em formato binário, interpretá-las e, em seguida, gerar um arquivo de texto com a representação correspondente em linguagem Assembly MIPS.

O desenvolvimento foi um exercício prático para aplicar conceitos de manipulação de bits, estruturas de controle e leitura e escrita de arquivos em Assembly MIPS, utilizando o simulador MARS.


Autor: Tobias Viero de Oliveira 

Funcionalidades
O decodificador implementa as seguintes funcionalidades:


Leitura de Arquivo Binário: Lê instruções de máquina de 32 bits diretamente de um arquivo de entrada (ex-000-012.bin).


Decodificação de Instruções: Identifica os campos da instrução, como opcode, rs, rt, rd, imm, target e funct, utilizando operações de deslocamento de bits (shift left e shift right).


Tradução para Assembly: Converte a instrução binária para sua representação em Assembly MIPS, lidando com diferentes formatos de instrução (Tipo-R, Tipo-I, Tipo-J).


Geração de Arquivo de Saída: Cria um arquivo de texto (output.txt) contendo, para cada instrução, o Program Counter (PC) atual, a representação da instrução em hexadecimal e a instrução decodificada.


Manipulação Precisa de Dados: Garante a precisão na manipulação dos campos, incluindo a extensão de sinal para valores imediatos quando necessário.


Tratamento de Erros: Identifica e sinaliza adequadamente as instruções que não foram mapeadas ou são desconhecidas.

Estrutura do Projeto
O código foi modularizado em três arquivos principais para facilitar a organização e a manutenção:

main.asm: É o arquivo principal que controla o fluxo do programa. Ele é responsável pela leitura do arquivo binário, pelo laço de repetição que processa cada instrução e pela chamada das rotinas de decodificação e escrita.


hexa.asm: Contém a lógica para realizar a conversão de um número binário para sua representação em string hexadecimal.


decoder.asm: Um módulo auxiliar que contém a lógica para mapear os códigos numéricos dos registradores para seus nomes correspondentes em Assembly (ex: 29 para $sp) e para realizar a extensão de sinal.

Como Executar
Para montar e executar este decodificador, siga os passos abaixo:

Pré-requisitos: É necessário ter o simulador MARS (MIPS Assembler and Runtime Simulator) (Mars.jar).

Configuração: Coloque os arquivos main.asm, hexa.asm, decoder.asm e o arquivo binário de entrada ex-000-012.bin no mesmo diretório.

Montagem:

Abra o MARS.

Vá em File > Open e selecione o arquivo main.asm. O simulador automaticamente incluirá os outros arquivos.

Monte o código em Run > Assemble (ou pela tecla de atalho F3).

Execução:

Clique em Run > Go (ou pela tecla de atalho F5).

Verificação: Após a execução, um arquivo chamado output.txt será criado no mesmo diretório, contendo a saída do programa com as instruções decodificadas.