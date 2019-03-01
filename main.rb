# encoding: utf-8
#
# Программа-Выбор одежды по погоде
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем классы для описания одной вещи и для описания коллекции вещей
require_relative "lib/clothes_item"
require_relative "lib/clothes_collection"

# Помещаем все файлы с одеждой в массив
clothes_files = Dir["data/*"]

# Создаем объект класса
clothes = ClothesCollection.new(clothes_files)

# Ожидаем ответа на вопрос
puts "Сколько градусов за окном? (можно с минусом)"
user_input = STDIN.gets.to_i

# Передаем ответ для обработки созданному объекту
clothes.select_by_weather(user_input)

# Выводим одежду по запросу
puts "\nПредлагаем сегодня надеть"
puts clothes.clothes_select
puts
