# encoding: utf-8
#
# Класс Описание одной вещи, у которого есть название,
# тип одежды и диапазон температур для ношения
class ClothesItem
  # У любого экземпляра класса будут три переменные — название,
  # тип одежды и диапазон температур для ношения
  attr_accessor :name, :type, :range

  # Конструктор вытаскивает из массива класса Коллекции вещей
  # как называется одежда, ее тип,
  def initialize(clothes_collection)
    @name = clothes_collection[0]
    @type = clothes_collection[1]
    # диапазон температур, предварительно преобразовав строку к нужному виду
    temp = clothes_collection[2].gsub(/[^\-+\d]/, " ").split(" ")
    @range = temp[0].to_i..temp[1].to_i
  end

  # Сверка градусов пользователя и наличествующей одежды по этой температуре
  def weather_correct?(user_input)
    @range === user_input
  end

  # Вывод одежды, которая подошла по погоде
  def to_s
    "#{@name} (#{type}) #{range}"
  end
end
