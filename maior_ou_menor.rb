def da_boas_vindas
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Bem vindo ao jogo da adivinhação"
    puts"Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    system "cls"
end


def pede_dificuldade

    puts "Qual o nível de dificuldade?"
    puts
    puts "                                                      ##### "
    puts "                                          #####       ##### "
    puts "                              #####       #####       ##### "
    puts "                    #####     #####       #####       ##### "
    puts "      #####         #####     #####       #####       ##### "

    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "

    dificuldade = gets.to_i
end


def sorteia_numero_secreto(dificuldade)


    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4 
        maximo = 150
    else
        maximo = 200
    end 
    #{
    puts "Escolhendo um número secreto entre 1 e #{maximo}}..."

    

    puts "Dificuldade deseja é #{dificuldade}"
    sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    sorteado
end


def pede_um_numero (chutes, tentativa, limite_de_tentativas)

    puts "\n\n\n\n\n\n"
    puts "Tentativa #{tentativa}  de #{limite_de_tentativas}"
    puts "Chutes até agora: #{chutes} " 
    puts "Entre com o número"
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute} "
    chute.to_i
end    

def verifica_se_acertou (numero_secreto,chute)
 system "cls"
 acertou = numero_secreto == chute

 if acertou 
    puts ganhou
    return true
end
maior = numero_secreto > chute
if maior
    puts "O número secreto é maior!"
else
    puts "O número secreto é menor!"
end 
false
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts "                OOOOOOO               "
    puts
    puts "               Acertou!                "
    puts
end


def joga (dificuldade)

    numero_secreto = sorteia_numero_secreto(dificuldade)
    chutes = []
    postos_ate_agora = 1000

    limite_de_tentativas = 5
    for tentativa in 1..limite_de_tentativas
        chute = pede_um_numero chutes, tentativa,limite_de_tentativas
        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        postos_ate_agora -= pontos_a_perder
        chutes << chute
        break if  verifica_se_acertou numero_secreto, chute
    end
    puts "Total de pontos: #{postos_ate_agora}"

end

def quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    system "cls" 
    quero_jogar.upcase == "S"   

end

da_boas_vindas
dificuldade = pede_dificuldade

loop do 
    joga dificuldade
    if !quer_jogar?
        break
    end
end