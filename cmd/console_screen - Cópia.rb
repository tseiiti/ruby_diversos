require 'curses'
include  Curses

system('cls')
system('mode con: cols=90 lines=28')
system('title Teste de Tela')

class MyTerminal
	@window =  Curses::Window.new(0, 0, 0, 0)
	@mutex = Mutex.new
	@key = Curses::Key

	def self.wUpdate
		Thread.new do
			@mutex.synchronize do
				# @cury = @window.cury
				# @curx = @window.curx

				now = Time.now.strftime('%d/%m/%Y %H:%M:%S')
				@window.setpos(2, 62)
				@window.addstr("#{@mutex.class} #{now}")
				# @window.setpos(@cury, @curx)

				@window.refresh
				sleep(1)
			end

			wUpdate
		end
	end

	def self.teste
		@window.box("|", "-")

		threads = []

		threads << Thread.new do
			# x = @window.getch
			# x = @window.getbkgd

			# @window.setpos(3, 2)
			# x = @window.getstr
			# @window.box("|", "-")
			# @window.setpos(6, 10)
			# @window.addstr(x.to_s)
			# @window.refresh

			Curses.raw # intercept everything
			Curses.noecho
			@window.keypad = true
			loop do
				ch = @window.getch
				@window.setpos(10, 10)
				@window.addstr "                                                  "
				@window.setpos(10, 10)
				# @window.addch ?\n
			  case ch
			    when ?q     then break
				  # when ?k		 then @window.addstr "up char \n"
				  # when ?27		 then @window.addstr "Esc"
			  	when KEY_UP then @window.addstr "up...."
			  	when KEY_A1 then @window.addstr "Upper left of keypad"
			  	when KEY_A3 then @window.addstr "Upper right of keypad"
					when KEY_B2 then @window.addstr "Center of keypad"
					when KEY_BACKSPACE then @window.addstr "Backspace"
					when KEY_BEG then @window.addstr "Beginning key"
					when KEY_BREAK then @window.addstr "Break key"
					when KEY_BTAB then @window.addstr "Back tab key"
					when KEY_C1 then @window.addstr "Lower left of keypad"
					when KEY_C3 then @window.addstr "Lower right of keypad"
					when KEY_CANCEL then @window.addstr "Cancel key"
					when KEY_CATAB then @window.addstr "Clear all tabs"
					when KEY_CLEAR then @window.addstr "Clear Screen"
					when KEY_CLOSE then @window.addstr "Close key"
					when KEY_COMMAND then @window.addstr "Cmd (command) key"
					when KEY_COPY then @window.addstr "Copy key"
					when KEY_CREATE then @window.addstr "Create key"
					when KEY_CTAB then @window.addstr "Clear tab"
					when KEY_DC then @window.addstr "Delete character"
					when KEY_DL then @window.addstr "Delete line"
					when KEY_DOWN then @window.addstr "the down arrow key"
					when KEY_EIC then @window.addstr "Enter insert char mode"
					when KEY_END then @window.addstr "End key"
					when KEY_ENTER then @window.addstr "Enter or send"
					when KEY_EOL then @window.addstr "Clear to end of line"
					when KEY_EOS then @window.addstr "Clear to end of screen"
					when KEY_EXIT then @window.addstr "Exit key"
					when KEY_FIND then @window.addstr "Find key"
					when KEY_HELP then @window.addstr "Help key"
					when KEY_HOME then @window.addstr "Home key (upward+left arrow)"
					when KEY_IC then @window.addstr "Insert char or enter insert mode"
					when KEY_IL then @window.addstr "Insert line"
					when KEY_LEFT then @window.addstr "the left arrow key"
					when KEY_LL then @window.addstr "Home down or bottom (lower left)"
					when KEY_MARK then @window.addstr "Mark key"
					when KEY_MAX then @window.addstr "The maximum allowed curses key value."
					when KEY_MESSAGE then @window.addstr "Message key"
					when KEY_MIN then @window.addstr "The minimum allowed curses key value."
					# when KEY_MOUSE then @window.addstr "Mouse event read"
					when KEY_MOVE then @window.addstr "Move key"
					when KEY_NEXT then @window.addstr "Next object key"
					when KEY_NPAGE then @window.addstr "Next page"
					when KEY_OPEN then @window.addstr "Open key"
					when KEY_OPTIONS then @window.addstr "Options key"
					when KEY_PPAGE then @window.addstr "Previous page"
					when KEY_PREVIOUS then @window.addstr "Previous object key"
					when KEY_PRINT then @window.addstr "Print or copy"
					when KEY_REDO then @window.addstr "Redo key"
					when KEY_REFERENCE then @window.addstr "Reference key"
					when KEY_REFRESH then @window.addstr "Refresh key"
					when KEY_REPLACE then @window.addstr "Replace key"
					when KEY_RESET then @window.addstr "Reset or hard reset"
					when KEY_RESIZE then @window.addstr "Screen Resized"
					when KEY_RESTART then @window.addstr "Restart key"
					when KEY_RESUME then @window.addstr "Resume key"
					when KEY_RIGHT then @window.addstr "the right arrow key"
					when KEY_SAVE then @window.addstr "Save key"
					when KEY_SBEG then @window.addstr "Shifted beginning key"
					when KEY_SCANCEL then @window.addstr "Shifted cancel key"
					when KEY_SCOMMAND then @window.addstr "Shifted command key"
					when KEY_SCOPY then @window.addstr "Shifted copy key"
					when KEY_SCREATE then @window.addstr "Shifted create key"
					when KEY_SDC then @window.addstr "Shifted delete char key"
					when KEY_SDL then @window.addstr "Shifted delete line key"
					when KEY_SELECT then @window.addstr "Select key"
					when KEY_SEND then @window.addstr "Shifted end key"
					when KEY_SEOL then @window.addstr "Shifted clear line key"
					when KEY_SEXIT then @window.addstr "Shifted exit key"
					when KEY_SF then @window.addstr "Scroll 1 line forward"
					when KEY_SFIND then @window.addstr "Shifted find key"
					when KEY_SHELP then @window.addstr "Shifted help key"
					when KEY_SHOME then @window.addstr "Shifted home key"
					when KEY_SIC then @window.addstr "Shifted input key"
					when KEY_SLEFT then @window.addstr "Shifted left arrow key"
					when KEY_SMESSAGE then @window.addstr "Shifted message key"
					when KEY_SMOVE then @window.addstr "Shifted move key"
					when KEY_SNEXT then @window.addstr "Shifted next key"
					when KEY_SOPTIONS then @window.addstr "Shifted options key"
					when KEY_SPREVIOUS then @window.addstr "Shifted previous key"
					when KEY_SPRINT then @window.addstr "Shifted print key"
					when KEY_SR then @window.addstr "Scroll 1 line backward (reverse)"
					when KEY_SREDO then @window.addstr "Shifted redo key"
					when KEY_SREPLACE then @window.addstr "Shifted replace key"
					when KEY_SRESET then @window.addstr "Soft (partial) reset"
					when KEY_SRIGHT then @window.addstr "Shifted right arrow key"
					when KEY_SRSUME then @window.addstr "Shifted resume key"
					when KEY_SSAVE then @window.addstr "Shifted save key"
					when KEY_SSUSPEND then @window.addstr "Shifted suspend key"
					when KEY_STAB then @window.addstr "Set tab"
					when KEY_SUNDO then @window.addstr "Shifted undo key"
					when KEY_SUSPEND then @window.addstr "Suspend key"
					when KEY_UNDO then @window.addstr "Undo key"
					when KEY_UP then @window.addstr "the up arrow key"
					# when REPORT_MOUSE_POSITION then @window.addstr "report mouse movement"
			   #  when ?b     then @window.addch ?b
			   #  when ?\C-s  then @window.addstr "^s" # Ctrl+S
				  else				@window.addstr "%s" % ch
			  end
			end

			# 1000.times do
			# 	x = @window.getbkgd
			# 	@window.setpos(6, 10)
			# 	@window.addstr(x.to_s)
			# end
		end

		wUpdate

		threads.each { |thr| thr.join }

		@window.close
	end
end

MyTerminal.teste
system('cls')


# Curses.init_screen()

# my_str = "LOOK! PONIES!"
# win = Curses::Window.new( 8, (my_str.length + 10),
#                           (Curses.lines - 8) / 2,
#                           (Curses.cols - (my_str.length + 10)) / 2 )
# win.box("|", "-")
# win.setpos(2,3)
# win.addstr(my_str)
# # or even
# win << "\nORLY"
# win << "\nYES!! " + my_str
# win.refresh
# # win.getch
# x = win.begx
# y = win.begy

# puts x
# win.setpos(3,3)
# puts y

# win.close


# sleep(2)





















# Curses.init_screen
# 3.times {
# 	now = Time.now.strftime('%d/%m/%Y %H:%M:%S')
# 	puts now
# "#{Time.now.strftime('%d/%m/%Y %H:%M:%S')}"
# 	# sleep(1)
# }

# Curses.getch  # Wait until user presses some key.



=begin

PS C:\Users\Seiiti\Documents\ruby-and-ms-access> ruby .\console_screen.rb
ESCDELAY=
ESCDELAY
TABSIZE
TABSIZE=
use_default_colors
init_screen
close_screen
closed?
stdscr
refresh
doupdate
clear
clrtoeol
echo
noecho
raw
noraw
cbreak
nocbreak
crmode
nocrmode
nl
nonl
beep
flash
ungetch
setpos
standout
standend
inch
addch
insch
addstr
getch
getstr
delch
deleteln
insertln
keyname
lines
cols
curs_set
scrl
setscrreg
attroff
attron
attrset
bkgdset
bkgd
resizeterm
resize
start_color
init_pair
init_color
has_colors?
can_change_color?
colors
color_content
color_pairs
pair_content
color_pair
pair_number
timeout=
def_prog_mode
reset_prog_mode
freeze
===
==
<=>
<
<=
>
>=
to_s
included_modules
include?
name
ancestors
instance_methods
public_instance_methods
protected_instance_methods
private_instance_methods
constants
const_get
const_set
const_defined?
const_missing
class_variables
remove_class_variable
class_variable_get
class_variable_set
class_variable_defined?
public_constant
private_constant
module_exec
class_exec
module_eval
class_eval
method_defined?
public_method_defined?
private_method_defined?
protected_method_defined?
public_class_method
private_class_method
autoload
autoload?
instance_method
public_instance_method
nil?
=~
!~
eql?
hash
class
singleton_class
clone
dup
initialize_dup
initialize_clone
taint
tainted?
untaint
untrust
untrusted?
trust
frozen?
inspect
methods
singleton_methods
protected_methods
private_methods
public_methods
instance_variables
instance_variable_get
instance_variable_set
instance_variable_defined?
instance_of?
kind_of?
is_a?
tap
send
public_send
respond_to?
respond_to_missing?
extend
display
method
public_method
define_singleton_method
object_id
to_enum
enum_for
equal?
!
!=
instance_eval
instance_exec
__send__
__id__
PS C:\Users\Seiiti\Documents\ruby-and-ms-access>

=end