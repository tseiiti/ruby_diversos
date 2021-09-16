system('cls')

m=1
n=1
p=3

menor = m;
medio = n;
maior = p;

if ((m < p) && (m < n))
    menor = m;
elsif ((n < p) && (n < m))
    menor = n;
elsif ((p < m) && (p < n))
    menor = p;
end

if (((m > p) && (m < n)) || ((m > n) && (m < p)))
    medio = m;
elsif (((n > p) && (n < m)) || ((n > m) && (n < p)))
    medio = n;
elsif (((p > m) && (p < n)) || ((p > n) && (p < m)))
    medio = p;
end

if ((m > p) && (m > n))
    maior = m;
elsif ((n > p) && (n > m))
    maior = n;
elsif ((p > m) && (p > n))
    maior = p;
end

puts menor;
puts maior;
puts medio;
