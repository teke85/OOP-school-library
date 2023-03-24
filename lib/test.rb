require 'test/unit'

class Cat
    def say
        "Miau Miau"
    end
end

class Dog
    def say
        "woo wooo"
    end
end

class TestAnimals < Test::Unit::TestCase
def setup
    @cat = Cat.new
    @dog = Dog.new
end

def test_cat
    assert_equal "Miau Miau", @cat.say
end

def test_dog
    assert_equal "woo wooo", @dog.say
end

end