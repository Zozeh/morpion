class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case

  
  def initialize(style)
    #TO DO : doit régler sa valeur, ainsi que son numéro de case
    @style = style
    joueur_a.choix
    puts "Positionez-vous "
    x = gets.chomp #A2
    #traiter leettre_value
    if x[0] == "A" 
      ligne=0
    elsif x[0] =="B"
      ligne=1
    elsif x[0] =="C"
      ligne=2
    end
    colonne = x[1].to_i      
    @board_case[ligne][colonne]=style
  end
  
end

class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
attr_accessor :board_case 
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    def initialize 
    @board_case = [["","",""], ["","",""], ["","",""]]
    board_show = Show.new
    board_show.show_board(@board_case)
    #TO DO :
  end

  def play_turn 
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    

     
  end

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul

    def search_winner(tests)
# verifie les diagonales du Morpion 
a1="#{tests[0][0]}#{tests[1][1]}#{tests[2][2]}"
b1="#{tests[0][2]}#{tests[1][1]}#{tests[2][0]}"
c1="#{tests[0][1]}#{tests[1][1]}#{tests[2][1]}"
d1="#{tests[1][0]}#{tests[1][1]}#{tests[1][2]}"
  if a1 == "XXX" || b1 == "XXX" || c1 == "XXX" || d1 =="XXX"
    winner = "X"
  elsif a1 == "OOO" || b1 == "OOO" || c1 == "OOO" || d1 =="OOO"
    winner = "O"
  end
# verifie les cotés du Morpion
e1="#{tests[0][0]}#{tests[0][1]}#{tests[0][2]}"
f1="#{tests[0][2]}#{tests[1][2]}#{tests[2][2]}"
g1="#{tests[2][2]}#{tests[2][1]}#{tests[2][0]}"
h1="#{tests[2][0]}#{tests[1][0]}#{tests[0][0]}"
  if e1 == "XXX" || f1 == "XXX" || g1 == "XXX" || h1 =="XXX"
    winner = "X"
  elsif e1 == "OOO" || f1 == "OOO" || g1 == "OOO" || h1 =="OOO"
    winner = "O"
  end
  return winner
end
  end

end

class Player
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  attr_reader :nom, :choix
  def initialize(nom, choice)
    #TO DO : doit régler son nom et sa valeur
  @nom = nom
  @choice = choice
  @choice_a = gets.chomp.upcase
    if @choice_a == "X"
      @choice_b = "O"
  puts "#{nom} a choisi X, #{nom} sera O"
    else choice_b = "X" 
  puts "#{nom} a choisi O, #{b} sera X"
  
  end
end


class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
attr_accessor :status, :choix_a, :choix_b

  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player

    puts "BIENVENUE AU JEU \"MORPION\""

    puts "Entrer le nom du joueur A:"
    a = gets.chomp.to_s
    
    puts "Entrer le nom du joueur B:"
    b = gets.chomp.to_s
    
      choix_a = choix_b = ""
      board = Board.new
      @status = "on going"
      joueur_a = Playeur.new(a, choix_a)
      joueur_b = Playeur.new(b, choix_b)
      
    puts "#{joueur_a.nom} ,choisir X ou O"

    choix_a = gets.chomp
    joueur_a.choix = choix_a
    if choix_a == "X"
      joueur_b.choix = "O" 
      puts "#{joueur_a.nom} a choisi \"X\", #{joueur_b.nom} sera \"O\""
    else
      joueur_b.choix = "X"
       puts "#{joueur_a.nom} a choisi\"O\", #{joueur_b.nom} sera\"X\""
    end

  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    @board_case = [["","",""], ["","",""], ["","",""]]
    board_show = Show.new
    board_show.show_board(@board_case)

     puts"     |     |     " 
    puts"  #{board[0][0]}  |  #{board[0][1]}  |  #{board[0][2]}  " 
    puts"     |     |     " 
    puts"-"*17
    puts"     |     |     " 
    puts"  #{board[1][0]}  |  #{board[1][1]}  |  #{board[1][2]}  " 
    puts"     |     |     " 
    puts"-"*17
    puts"     |     |     " 
    puts"  #{board[2][0]}  |  #{board[2][1]}  |  #{board[2][2]}  " 
    puts"     |     |     " 


    puts "#{joueur_a.nom} ,choisir X ou O"
    choix_a = gets.chomp
    joueur_a.choix = choix_a
    if choix_a == "X"
      joueur_b.choix = "O" 
      puts "#{joueur_a.nom} a choisi \"X\", #{joueur_b.nom} sera \"O\""
    else
      joueur_b.choix = "X"
       puts "#{joueur_a.nom} a choisi\"O\", #{joueur_b.nom} sera\"X\""
    end


    winner = " "

    # verifie les diagonales du Morpion 
    a1="#{tests[0][0]}#{tests[1][1]}#{tests[2][2]}"
    b1="#{tests[0][2]}#{tests[1][1]}#{tests[2][0]}"
    c1="#{tests[0][1]}#{tests[1][1]}#{tests[2][1]}"
    d1="#{tests[1][0]}#{tests[1][1]}#{tests[1][2]}"
      if a1 == "XXX" || b1 == "XXX" || c1 == "XXX" || d1 =="XXX"
        winner = "X"
      elsif a1 == "OOO" || b1 == "OOO" || c1 == "OOO" || d1 =="OOO"
        winner = "O"
      end
    # verifie les cotés du Morpion 
    e1="#{tests[0][0]}#{tests[0][1]}#{tests[0][2]}"
    f1="#{tests[0][2]}#{tests[1][2]}#{tests[2][2]}"
    g1="#{tests[2][2]}#{tests[2][1]}#{tests[2][0]}"
    h1="#{tests[2][0]}#{tests[1][0]}#{tests[0][0]}"
  if e1 == "XXX" || f1 == "XXX" || g1 == "XXX" || h1 =="XXX"
    winner = "X"
  elsif e1 == "OOO" || f1 == "OOO" || g1 == "OOO" || h1 =="OOO"
    winner = "O"
  end
  return winner
  
    i=1
  tour=choice_a
  joueur_actuel=a
  going="go"
  while(going=="go") do
    if i.even? 
      joueur_actuel=b 
      tour=choice_b
    else
      joueur_actuel=a
      tour=choice_a
    end
    puts "#{joueur_actuel} : Positionnez-vous "
    print "> "
    x = gets.chomp.upcase



  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    @board_case = [["","",""], ["","",""], ["","",""]]
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end


class Show

  def show_board(board)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)

    
    puts"     |     |     " 
    puts"  #{board[0][0]}  |  #{board[0][1]}  |  #{board[0][2]}  " 
    puts"     |     |     " 
    puts"-"*17
    puts"     |     |     " 
    puts"  #{board[1][0]}  |  #{board[1][1]}  |  #{board[1][2]}  " 
    puts"     |     |     " 
    puts"-"*17
    puts"     |     |     " 
    puts"  #{board[2][0]}  |  #{board[2][1]}  |  #{board[2][2]}  " 
    puts"     |     |     " 
   
  end

end

class Application
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    # 

      i=1
  @tour=choice_a
  @joueur_actuel=a
  going="go"
  while(going=="go") do
  if i.even? 
    joueur_actuel=b 
    tour=choice_b
  else
    joueur_actuel=a
    tour=choice_a
  end
  puts "#{joueur_actuel} : Positionnez-vous "
  print "> "
  x = gets.chomp.upcase
  end

end


Application.new.perform

