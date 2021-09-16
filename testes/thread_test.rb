system('cls')

threads = []
threads << Thread.new {
	sleep(0.9)
	puts "Whats the big deal"
}

threads << Thread.new {
	3.times {
		sleep(0.4)
		puts "Threads are fun!"
	}
}

threads.each { |thr| thr.join }

# Thread.new { sleep(200) }
# Thread.new { 1000000.times {|i| i*i } }
# Thread.new { Thread.stop }
# Thread.list.each {|t| p t}