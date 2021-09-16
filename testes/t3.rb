require 'fileutils'
system('cls')

class T3
	def initialize(path)
		@path = path
	end

	def x
		2.times do |n|
			list_files()
			sleep(1)
		end
	end

	def list_files()
		Dir.entries(@path).each do |file|
			if !File.directory? file
				puts file
			end
		end
	end
end

# t = T3.new("C:/Users/Seiiti/Desktop")
# t.x

# puts File.methods

path = "C:/Users/Seiiti/Desktop/"
Dir.entries(path).each do |file_name|
	if !File.directory? file_name
		puts file_name
		puts File.absolute_path(file_name)
		puts "\n\n"
		puts FileUtils.identical?(path + file_name, "C:/Users/Seiiti/a+ Medicina Diagnóstica Ficha_ 1540308154 Cliente_ Sr.pdf")

		# f1 = File.open("C:/Users/Seiiti/Google Drive/android code/apostila_android_caelum.pdf", "r")
		# f2 = File.open("C:/Users/Seiiti/Desktop/apostila_android_caelum.pdf", "r")
		# puts FileUtils.identical?(f1, f2)
		# puts FileUtils.identical?("C:/Users/Seiiti/Google Drive/android code/apostila_android_caelum.pdf", "C:/Users/Seiiti/Desktop/apostila_android_caelum.pdf")
		# f1.close
		# f2.close

		# puts File.identical?(File.absolute_path(file_name), "C:/Users/Seiiti/Desktop/a+ Medicina Diagnóstica Ficha_ 1540308154 Cliente_ Sr.pdf")
		# puts File.ctime(File.absolute_path(file_name))
		# puts file_name.class
		# puts file.methods
		break
	end
end