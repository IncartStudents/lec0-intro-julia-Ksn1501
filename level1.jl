# переписать ниже примеры из первого часа из видеолекции: 
# https://youtu.be/4igzy3bGVkQ
# по желанию можно поменять значения и попробовать другие функции
println("I'm excited to learn Julia")

#1
my_answer = 45
typeof(my_answer)

my_pi= 3.14159
typeof(my_pi)

my_name = "Ksenia"
typeof(my_name)

my_answer = my_name
typeof(my_answer)

#2
sum = 6 + 10 
diff = 15 - 7
product = 35 * 6
quo = 200/6
power = 10 ^ 4
modulus = 101 % 2

#3
s1 = "I am a string."
s2 =  """I am also a string."""
typeof('a')
#'We will get an error here'

#4
name = "Ksenia"
num_fingers = 10
num_toes = 5
println("Hello, ma name is $name")
println("I have $num_fingers fingers and $num_toes toes. That is $(num_fingers + num_toes) digits in all")

#5
string("How many cats", "are too many cats?")
string("I don't know, but", 10, "are too few")
s3 = "How many cats";
s4 = "are too many cats?";
s3 * s4
"$s3$s4"

#6
myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")
myphonebook["Kramer"] = "555-FILK"
pop!(myphonebook, "Kramer")
#myphonebook[1]

#7
myfavoriteanimals = ("penguins", "cats", "sugargliders")
myfavoriteanimals[1]
#myfavoriteanimals[1] = "others"

#8
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]
fibonacci = [1, 1, 2, 3, 5, 7, 14]
mix = [1, 2, 3.0, "hi"]
myfriends[2]
myfriends[2] = "Baby Bop"
myfriends
push!(fibonacci, 21)
pop!(fibonacci)
fibonacci

favorite = [["koobideh", "chocolate", "eggs"], ["penguins", "cats", "sugargliders
"]]
numbers = [[1,2,3], [4,5], [6,7,8,9]]
rand(4, 3)
rand(4, 3, 2)

#9
#n = 0
#while n < 10 
    #n += 1 
    #println(n)
#end 
#выдает ошибку 'n' is not defined
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

i = 1
while i <= length(myfriends)
    friend = myfriends[i]
    println("Hi $friend, it's great to see you!")
end 

m,n = 5, 5 
A = zeroes(m, n)

for i in 1:m, j in 1:n
    B[i, j] = i + j
end
B
C = [i + j for i in 1:m, j in 1:n]

for n in 1:10
  A = [i + j for i in 1:n, j in 1:n]
  display(A)
end



#Conditionals
#=
if *condition 1*
  *option 1*
elseif *condition 2*
  *option 2*
else
  *option 3*
end
=#

x = 3
y = 90
if x > y
  println("$x is larger than $y")
elseif y > x
  println("$y is larger than $x")
else
  println("$x and $y are equal!")
end

if x > y
  x
else
  y
end
#=
a ? b : c
which equates to
if a
  b
else
  c
end
=#
# A fun related trick is short-circuit evaluation with the syntax a && b
(x > y) && println("$x is larger than $y")
(x < y) && println("$x is smaller than $y")



#Functions
#How to declare a function
function sayhi(name)
  println("Hi $name, it's great to see you!")
end
sayhi("C-3PO")
#alternatively, we could have declared either of these functions in a single line
sayhi2(name) = println("Hi $name, it's great to see you")
#Finally, we could have declared these as "anonymous" functions
sayhi3 = name -> println("Hi $name, it's great to see you!")
f3 = x -> x^2



#Duck-typing in Julia
sayhi(55595472)
#out: Hi 55595472, it's great to see you!



# Mutating vs. non-mutating functions
v = [3, 5, 2]
sort(v)
v #не изм
sort!(v)
v #изм


 
#Broadcasting
A = [i + 3*j for j in 0:2, i in 1:3]
f(A)
f(A) = A^2 = A * A
# f.(A) on the other hand will return an object that holds the square of A[i, j] at its corresponding entry



#Packages
#The first time you use a package on a given Julia installation, you need to explicity add it:
Pkg.add("Example")
using Example
#hello(::String) = "Hello, $who"
Pkg.add("Colors")
using Colors
#Let's create a palette of 100 different colors
palette = distinguishable_colors(100)
#and then we can create a randomly checkered matrix using the "rand" command
rand(palette, 3, 3)



#Plotting
#Basics
Pkg.add("Plots")
using Plots

x = -3:0.1:3
f(x) = x^2
y = f.(x)

gr() #Plots.GRBackend()
plot(x, y, label = "line")
scatter!(x, y, label = "points")
plotlyjs() #Plotly javascript loaded
plot(x, y, label = "line")
scatter!(x, y, label = "points")



# Getting slightly fancier
globaltemperatures = [14.4, 14.5, 14.8, 15.2, 15.5, 15.8]
numpirates = [45000, 20000, 15000, 5000, 400, 17]
plot(numpirates, globaltemperatures, legend = false)
scatter!(numpirates, globaltemperatures, legend = false)
xflip!()
xlabel!("Number of Pirates [Approximate]")
ylabel!("Global Temperature (C)")
title!("Influence of pirate population on global warming")

p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)
plot(p1, p2, p3, p4, layout = (2,2), legend = false)



# Multiple dispatch
#By calling methods() on + we can see how many exiting definitions we have for +
methods(+)
@which 3 + 3 # int
@which 3.0 + 3.0 # float
@which 3 + 3.0 # promotion

import Base: +
"hello" + "world" # error
@which "hello" + "world"
+(x::String, y::String) = string(x, y)
"hello" + "world" #out: hello world

foo(x, y) = println("ducked-typed foo!")
foo(x::Int, y::Float64) = println("foo with an integer and a float")
foo(x::Float64, y::Float64) = println("foo with two floats")
foo(x::Int, y::Int) = println("foo with two integers floats")
# foo(true, false) -> "duck-typed foo!"



# Basic linear algebra in Julia
A = rand(1:4, 3, 3)
B = A
C = copy(A)
[ B C ]

A[1] = 17
[B C]  # we have elemnt = 17
x = ones(3)
#=
1.0
1.0
1.0
=#

b = A*x
#=
23.0
9.0
5.0
=#

Asym = A+A' #transposition
Apd = A'A # transposed multiplication
A\b #solving linear systems
Atall = A[:,1:2] #overdetermined systems
display(Atall)
Atall\b

A = rand(3, 3)
[A[:,1] A[:,1]]\b

#underdetermined systems
Ashort = A[1:2, :]
display(Ashort)
Ashort\b[1:2]
