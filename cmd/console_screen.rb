#!/usr/bin/ruby

require "curses"

class MyTerminal
  LINS = 28
  COLS = 90

  def initialize
    system('mode con: cols=#{COLS} lines=#{LINS}')
    system('title Teste de Tela')

    Curses.init_screen
    Curses.nonl
    Curses.raw
    Curses.noecho

    @basewin = Curses.stdscr
    @basewin.scrollok(true)
    @basewin.keypad(true)

    @win = @basewin.subwin(LINS, COLS, 0, 0)
    @win.box(?., ?.)
    # (0...LINS).each { |i| cout(@basewin, i, 0, '.'); cout(@basewin, i, COLS - 1, '.'); }
    # (0...COLS / 2).each { |i| cout(@basewin, 0, i * 2, '. '); cout(@basewin, LINS - 1, i * 2, '. '); }
    # cout(@basewin, LINS - 1, COLS - 1, ".")

    @timewin = @basewin.subwin(3, 23, 0, COLS - 23)
    @timewin.box(?|, ?-)

    @trailerwin = @basewin.subwin(3, COLS, LINS - 3, 0)
    @trailerwin.box(?|, ?-)

    @basewin.setpos(4, 2)
    # erro if Curses.lines != 28 || Curses.cols != 90
    # cout(@basewin, 1, 1, Curses.cols)
    # cout(@basewin, 2, 2, Curses.lines)

    @mutex = Mutex.new
    screenRefresh
    keypress
  end

  def cout(win, y, x, text)
    win.setpos(y, x)
    win.addstr(text.to_s)
    win.refresh
  end

  def screenRefresh
    Thread.new do
      @mutex.synchronize do
        y = @basewin.cury
        x = @basewin.curx

        now = Time.now.strftime('%d/%m/%Y %H:%M:%S')
        cout(@timewin, 1, 2, now)

        @basewin.setpos(y, x)
        @basewin.refresh
      end

      sleep(1)
      screenRefresh
    end
  end

  def keypress
    # while true
    100.times do
      ch = Curses.getch
      str = case ch
      when 258
        "down"
      when 259
        "up"
      when 260
        "left"
      when 261
        "right"
      when ?q
        quit
        break
      else
        ch.to_s
      end
      str = (str + " " * COLS)[0, COLS - 5]
      cout(@trailerwin, 1, 2, str)
    end
    Curses.close_screen
  end

  def quit
    str = "quit"
    4.times do
      cout(@trailerwin, 1, 2, str)
      str += "."
      sleep(0.3)
    end
  end
end

t = MyTerminal.new
