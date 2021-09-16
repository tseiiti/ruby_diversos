require 'curses'

system('mode con: cols=80 lines=26')
system('title "awefawefako aoisjfaoiwufe"')
system('color 06')
# system('echo aweofiawjefa')
# system('pause')

=begin
 0 = Preto        8 = Cinza
 1 = Azul         9 = Azul claro
 2 = Verde        A = Verde claro
 3 = Verde-água   B = Verde-água claro
 4 = Vermelho     C = Vermelho claro
 5 = Roxo         D = Lilás
 6 = Amarelo      E = Amarelo claro
 7 = Branco       F = Branco brilhante
=end

# Curses.init_screen
begin
  Curses.setpos(16, 73)  # column 6, row 3
  Curses.addstr("Hello")

  Curses.getch  # Wait until user presses some key.
ensure
  Curses.close_screen
end

system('cls')