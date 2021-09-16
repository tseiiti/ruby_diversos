# encoding: UTF-8
system('cls')



# directory = gets.strip
directory = "C:/Users/Seiiti/Pictures/Caelum Android/impar/"

# puts "Enter the target to replace"
# target = gets.strip
# puts "Enter the new target name"
# newTarget = gets.strip

count = -1
Dir.glob(directory + "*.jpg").sort.each do |file|
	puts file
	count += 2
	nome = directory + "android_" + "%.3i" %count + ".jpg"

	File.rename(file, nome)

	# if File.basename(file, File.extname(file)).include?(target)
	# 	newEntry = file.gsub(target, newTarget)
	# 	File.rename( file, newEntry )
	# 	puts "Rename from " + file + " to " + newEntry
	# end
end