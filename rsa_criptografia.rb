system("cls")

def isPrime(n)
  bool = true
  (2...n).each do |i|
    if n % i == 0
      bool = false
      break
    end
  end
  bool
end

# x = 100
# (3..x).each do |i|
#   if isPrime(i)
#     puts i
#     # (3..x).each do |j|
#     #   if isPrime(j)
#     #     puts "#{i} * #{j}" if i * j == (i - 1) * (j - 1)
#     #   end
#     # end
#   end
# end

def private_key(e, p, q)
  m = (p - 1) * (q - 1)
  (1...m).each do |i|
    if (e * i) % m == 1
      return i
    end
  end
  return 0
end

def crypto_aux(msg, k, n)
  aux = ""
  (0..(msg.length / 3)).each do |i|
    ini = i * 3
    fin = (i + 1) * 3 - 1
    num = msg[ini..fin]
    num = num + "00"
    num = num[0..2]
    num = num.to_i
    num = num ** k % n
    aux += num.to_s.rjust(3, "0") if num > 0
  end
  aux
end

def encrypt(msg, k, n)
  aux = ""
  msg.each_byte do |c|
      aux += c.to_s
  end
  return crypto_aux(aux, k, n)
end

def decrypt(msg, k, n)
  aux = crypto_aux(msg, k, n)
  str = ""
  while true
    num = aux[0..1].to_i
    if num < 32
      num = aux[0..2].to_i
      aux = aux[3..aux.length]
    else
      aux = aux[2..aux.length]
    end
    break if aux.nil? or num == 0
    str += num.chr
  end
  str
end

# número primo aleatório
p = 17 # 29

# número primo aleatório e preferencialmente próximo ao "p"
q = 11 # 37

# chave publica
e = 7 # 71

# fator 1
n = p * q

# # chave privada
d = private_key(e, p, q)

if d == 0
  puts "erro"
  return
end

puts "(e, n): (#{e},#{n})"
puts "(d, n): (#{d},#{n})"

msg = encrypt("hello", e, n)
puts "encrypt: #{msg}"

msg = decrypt(msg, d, n)
puts "decrypt: #{msg}"


# puts "4".rjust(2, "0")
# puts sprintf '%02d', 1
# puts "%.2i" %5