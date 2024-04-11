# выболнить большую часть заданий ниже:

"""
======================================================================
1. Система типов: приведение к типам,
конкретные и абстрактные типы,
множественная диспетчеризация
"""

"""
что происходит с типами, какого типа `c` и почему?
"""
a = 1
b = 2.0
c = a + b

Ответ: переменная 'c' будет числом с плавающей точкой, поскольку происходит операция сложения между целым числом 'a' и числом с плавающей точкой 'b'
"""
написать тип, параметризованный другим типом
"""

"""
написать функцию для двух аругментов, не указывая их тип,
и вторую функцию от двух аргментов с конкретными типами,
дать пример запуска
Ответ: 
function add_numbers(a, b)
  return a + b
end

function multiply_numbers(a::Int, b::Int)
  return a * b
end

result1 = add_numbers(5, 3)
println(result1)

result2 = multiply_numbers(4, 7)
println(result2)
"""

"""
абстрактный тип - ключевое слово?
Абстрактный тип представляет из себя "контейнер". Ключевого слова нет
примитивный тип - ключевое слово?
Примитивный тип представляет собой базовый тип данных. Ключевого слова нет 
композитный тип - ключевое слово?
Композитные типы позволяют создавать новые пользовательские типы, объединяющие несколько полей разных типов. Для создания композитного типа используется ключевое слово struct 
"""

"""
написать один абстрактный тип и два его подтипа (1 и 2)
написать функцию над абстрактным типом, и функцию над её подтипом-1
выполнить функции над объектами подтипов 1 и 2 и объяснить результат
(функция выводит произвольный текст в консоль)
Ответ: 
abstract type Shape end

struct Circle <: Shape
    radius::Float64
end

struct Rectangle <: Shape
    length::Float64
    width::Float64
end

function describe_shape(s::Shape)
    println("This is a shape.")
end

function describe_circle(c::Circle)
    println("This is a circle with radius $(c.radius).")
end

circle = Circle(5.0)
rectangle = Rectangle(3.0, 4.0)

describe_shape(circle)
describe_shape(rectangle)
describe_circle(circle)
"""

"""
======================================================================
2. Функции:
лямбды и обычные функции,
переменное количество аргументов,
именованные аргументы со значениями по умолчанию,
кортежи
Ответ: 
Лямбда функция 
add = (x, y) -> x + y
println(add(3, 4))  # Вывод: 7
Функция с переменным количеством аргументов
function print_args(args...)
    for arg in args
        println("Argument: $arg")
    end
end

print_args(1, "hello", 3.14)  # Вывод: Argument: 1, Argument: hello, Argument: 3.14
Именованные аргументы со значениями по умолчанию
function greet(name="Guest", message="Hello!")
    println("$message, $name!")
end

greet()              # Вывод: Hello, Guest!
greet("Alice")       # Вывод: Hello, Alice!
greet(message="Hi")  # Вывод: Hi, Guest!
Использование кортежей
function sum_tuple(t::Tuple)
    sum = 0
    for element in t
        sum += element
    end
    return sum
end

tuple_example = (1, 2, 3, 4)
println(sum_tuple(tuple_example))  # Вывод: 10


"""

"""
пример обычной функции
function square(x)
    return x * x
end

"""

"""
пример лямбда-функции (аннонимной функции)
square = x -> x * x

result = square(5)
println(result)  # Вывод: 25
"""

"""
пример функции с переменным количеством аргументов
function sum_args(args...)
    sum = 0
    for arg in args
        sum += arg
    end
    return sum
end

result1 = sum_args(1, 2, 3, 4)
result2 = sum_args(5, 10, 15)

println(result1)  # Вывод: 10
println(result2)  # Вывод: 30
"""

"""
пример функции с именованными аргументами
function area_rectangle(; width=1, height=1)
    return width * height
end

result1 = area_rectangle(width=3, height=4)
result2 = area_rectangle(height=5, width=2)

println(result1)  # Вывод: 12
println(result2)  # Вывод: 10
"""

"""
функции с переменным кол-вом именованных аргументов
function sum_values(; kwargs...)
    result = 0
    for (key, value) in kwargs
        result += value
    end
    return result
end

result1 = sum_values(a=3, b=5, c=7)
result2 = sum_values(x=10, y=20, z=30, w=40)

println(result1)  # Вывод: 15
println(result2)  # Вывод: 100
"""

"""
передать кортеж в функцию, которая принимает на вход несколько аргументов
присвоить кортеж результату функции, которая возвращает несколько аргументов
использовать splatting - деструктуризацию кортежа в набор аргументов
def multiply(*args):
    res = 1
    for num in args:
        res *= num
    return res

def get_numbers():
    return 2, 3

some_numbers = (2, 4, 6)
print(multiply(*some_numbers))

num1, num2 = get_numbers()
print(num1)
print(num2)
"""

"""
======================================================================
3. loop fusion, broadcast, filter, map, reduce
"""

"""
перемножить все элементы массива
с помощью reduce
from functools import reduce

def multiply(x, y):
    return x * y

arr = [2, 3, 4, 5]

result = reduce(multiply, arr)

print(result)
"""

"""
написать функцию от одного аргумента и запустить ее по всем элементам массива
с помощью точки (broadcast)
c помощью map
указать, чем это лучше явного цикла?
def square(x):
    return x ** 2

arr = [2, 3, 4, 5]

result_broadcast = square(arr) 

result_map = list(map(square, arr)) 

print("Broadcast:", result_broadcast)
print("Map:", result_map)
"""

"""
перемножить вектор-строку [1 2 3] на вектор-столбец [10,20,30] и объяснить результат
vec_row = [1 2 3]

vec_col = [10, 20, 30]

result = vec_row * vec_col
"""

"""
в одну строку выбрать из массива [1, -2, 2, 3, 4, -5, 0] только четные и положительные числа
arr = [1, -2, 2, 3, 4, -5, 0]
result = arr[(arr .> 0) .& (arr .% 2 .== 0)]
"""


"""
======================================================================
4. Свой тип данных на общих интерфейсах
"""

"""
написать свой тип ленивого массива, каждый элемент которого
вычисляется при взятии индекса (getindex) по формуле (index - 1)^2
struct LazyArray
    len::Int
end

Base.getindex(A::LazyArray, index::Int) = (index - 1)^2

Base.size(A::LazyArray) = (A.len,)

lazy_arr = LazyArray(5)
for i in 1:5
    println(lazy_arr[i])  
end
"""

"""
Написать два типа объектов команд, унаследованных от AbstractCommand,
которые применяются к массиву:
`SortCmd()` - сортирует исходный массив
`ChangeAtCmd(i, val)` - меняет элемент на позиции i на значение val
Каждая команда имеет конструктор и реализацию метода apply!
abstract type AbstractCommand end

struct SortCmd <: AbstractCommand
    SortCmd() = new()
end

function apply!(cmd::SortCmd, target::Vector)
    sort!(target)
end

struct ChangeAtCmd <: AbstractCommand
    i::Int
    val

    ChangeAtCmd(i::Int, val) = new(i, val)
end

function apply!(cmd::ChangeAtCmd, target::Vector)
    target[cmd.i] = cmd.val
end
"""
abstract type AbstractCommand end
apply!(cmd::AbstractCommand, target::Vector) = error("Not implemented for type $(typeof(cmd))")


"""
Аналогичные команды, но без наследования и в виде замыканий (лямбда-функций)
struct SortCmd
    SortCmd() = begin
        cmd = () -> sort!(target)
    end
end

struct ChangeAtCmd
    i::Int
    val

    ChangeAtCmd(i::Int, val) = begin
        cmd = () -> target[i] = val
    end
end
"""

"""
======================================================================
5. Тесты: как проверять функции?
"""

"""
написать тест для функции
using Test

function add(a, b)
    return a + b
end

# Тестирование функции add
@test add(1, 2) == 3  
@test_throws MethodError add("hello", 2)  
"""

"""
======================================================================
6. Дебаг: как отладить функцию по шагам?
"""

"""
написать и отладить функцию по шагам с помощью макроса @enter и точек останова
function factorial(n)
    if n == 0
        return 1
    else
        return n * factorial(n-1)
    end
end

@enter factorial(5)
"""

"""
======================================================================
7. Профилировщик: как оценить производительность функции?

"""

"""
оценить производительность функции с помощью макроса @profview
function my_function(n)
    result = 0
    for i in 1:n
        result += i
    end
    return result
end

using Profile
@profview my_function(1000000)
"""
function generate_data(len)
    vec1 = Any[]
    for k = 1:len
        r = randn(1,1)
        append!(vec1, r)
    end
    vec2 = sort(vec1)
    vec3 = vec2 .^ 3 .- (sum(vec2) / len)
    return vec3
end

@time generate_data(1_000_000);

"""
предложить, как переписать функцию так, чтобы она выполнялась быстрее?
function generate_data_optimized(len)
    vec1 = randn(len)  
    vec2 = sort(vec1)
    mean_val = sum(vec2) / len
    vec3 = vec2 .^ 3 .- mean_val
    return vec3
end

@time generate_data_optimized(1_000_000);
"""

"""
======================================================================
8. Отличия от матлаба: приращение массива и предварительная аллокация?
"""

"""
написать функцию определения первой разности, которая принимает и возвращает массив
и для каждой точки входного (x) и выходного (y) выходного массива вычисляет:
y[i] = x[i] - x[i-1]
function generate_data_optimized(len)
    vec1 = randn(len)  # создаем массив нормально распределенных случайных чисел
    vec2 = sort(vec1)
    mean_val = sum(vec2) / len
    vec3 = vec2 .^ 3 .- mean_val
    return vec3
end

@time generate_data_optimized(1_000_000);
"""

"""
аналогичная функция, которая отличается тем, что внутри себя не аллоцирует новый массив y,
а принимает его первым аргументом, сам массив аллоцируется до вызова функции
function generate_data_inplace(y)
    len = length(y)
    randn!(y, len)  
    sort!(y)  
    mean_val = sum(y) / len
    y .= y .^ 3 .- mean_val  
    return y
end

data_array = Array{Float64}(undef, 1_000_000)  
@time generate_data_inplace(data_array);
"""

"""
написать код, который добавляет элементы в конец массива, в начало массива,
в середину массива
array = [1, 2, 3, 4, 5]

push!(array, 6)

unshift!(array, 0)

insert!(array, 3, 2.5)

println(array)
"""

"""
======================================================================
9. Модули и функции: как оборачивать функции внутрь модуля, как их экспортировать
и пользоваться вне модуля?
"""


"""
написать модуль с двумя функциями,
экспортировать одну из них,
воспользоваться обеими функциями вне модуля
module MyModule

export add_numbers

function add_numbers(a, b)
    return a + b
end

function multiply_numbers(a, b)
    return a * b
end

end

using .MyModule
result_sum = add_numbers(3, 4)
result_mult = multiply_numbers(2, 5)

println("Сумма чисел: ", result_sum)
println("Произведение чисел: ", result_mult)
"""
module Foo
    #export ?
end
# using .Foo ?
# import .Foo ?

"""
======================================================================
10. Зависимости, окружение и пакеты
"""

"""
что такое environment, как задать его, как его поменять во время работы?
с помощью него можно получить доступ к переменным среды, если мы хотим изменить переменную среду во время работы программы, то мы просто присваимваем ей новое значение 
"""

"""
что такое пакет (package), как добавить новый пакет?
это набор связанных функций, классов и других элементов программного кода, предназначенных для выполнения определенной задачи. добавление нового пакета происходит через специальную систему управления пакетами
"""

"""
как начать разрабатывать чужой пакет?
нужно сделать форк репозитрия пакета на GitHub, затем склонируем форк, утсанавливаем зависимотси и вносим изменения 
"""

"""
как создать свой пакет? (сложный вопрос, поэтому необязательно)
для начала нужо разобраться с функциональностью совего пакета. Потом создать репозиторий на GitHub для своего пакета, затем нужно настроить структуру совего пакета, а после идет написание кода, документации и много тонкостей 
"""

"""
======================================================================
11. Аргументы запуска Julia
"""

"""
Как задать окружение при запуске?
загрузить переменные перед запуском, использовать переменные в коде
"""

"""
Как задать скрипт, который будет выполняться при запуске:
а) из файла .jl
нужно запустить Julia с аргументом, указывающим путь к вашему скрипту

б) из текста команды? (см. флаг -e)
нужно передать сам скрипт в кавычках после флага -e.
"""
