# encoding: utf-8
#
# Класс Коллекция вещей
class ClothesCollection
  # Конструктор получает на вход массив со всеми названиями файлов
  # перебирает их, вытаскивает инфу и формирует новый класс со всей инфой про одежду
  def initialize(clothes_files)
    @clothes_collection =
      clothes_files.map do |file|
        lines = File.readlines(file, encoding: 'UTF-8', chomp: true)
        ClothesItem.new(lines)
      end
  end

  # Отбор одежды, подходящей по погоде (введенной пользователем)
  # и сортировка по типу одежды
  def select_by_weather(user_input)
    clothes_by_weather =
      @clothes_collection.select { |clothes| clothes.weather_correct?(user_input) }
    clothes_all = clothes_by_weather.group_by { |clothes| clothes.type }
  end
end
