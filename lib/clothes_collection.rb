# encoding: utf-8
#
# Класс Коллекция вещей
class ClothesCollection
  # У экземпляра класса есть переменная отобранной одежды по запросу
  attr_accessor :clothes_select

  # Конструктор получает на вход массив со всеми названиями файлов
  # перебирает их, вытаскивает инфу и формирует новый класс со всей инфой про одежду
  def initialize(clothes_files)
    @clothes_collection =
      clothes_files.map do |file|
        lines = File.readlines(file, encoding: 'UTF-8', chomp: true)
        ClothesItem.new(lines)
      end

    # Определяем переменные как массивы
    @clothes_by_weather = []
    @clothes_select = []
  end

  # Отбор одежды, подходящей по погоде (введенной пользователем)
  def select_by_weather(user_input)
    @clothes_by_weather =
      @clothes_collection.select { |clothes| clothes.weather_correct?(user_input) }
    clothes_random_selection
  end

  # Группирование одежды по типам и отбор случайных элементов из одного типа одежды
  def clothes_random_selection
    clothes_all = @clothes_by_weather.group_by { |clothes| clothes.type }
    clothes_all.each_value { |value| @clothes_select << value.sample }
  end
end
