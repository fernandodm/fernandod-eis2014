require 'rspec'
require_relative '../lib/Perro.rb'

describe 'Perro' do
	
	before(:all) do
		@perro1 = Perro.new
		@perro2 = Perro.new
		@perro3 = Perro.new
		@perro4 = Perro.new
		@perro1.color = "Blanco"
		@perro1.edad = 4
		@perro1.peso = 80
		@perro2.color = "Negro"
		@perro2.edad = 4
		@perro2.peso = 80
		@perro3.color = "Marron"
		@perro3.edad = 9
		@perro3.peso = 10
		@perro4.color = "Gris"
		@perro4.edad = 9
		@perro4.peso = 80
	end

	describe 'colorMayor' 
		it 'deberia retornar true cuando colorMayor(perro1,perro2)' do
			bool = Perro.colorMayor(@perro1,@perro2)
			bool.should be true
		end

		it 'deberia retornar false cuando colorMayor(perro2,perro1)' do
			bool = Perro.colorMayor(@perro2,@perro1)
			bool.should be false
		end

		it 'deberia retornar true cuando colorMayor(perro2,perro4)' do
			bool = Perro.colorMayor(@perro2,@perro4)
			bool.should be true
		end

	describe 'esMayorPorPeso'
		it 'deberia retornar true cuando esMayorPorPeso(perro1,perro3)' do
			bool = Perro.esMayorPorPeso(@perro1,@perro3)
			bool.should be true
		end

		it 'deberia retornar false cuando esMayorPorPeso(perro3,perro4)' do
			bool = Perro.esMayorPorPeso(@perro3,@perro4)
			bool.should be false
		end

	describe 'esMayor'
		it 'deberia retornar false cuando esMayor(perro1,perro3)' do
			bool = Perro.esMayor(@perro1,@perro3)
			bool.should be false
		end

		it 'deberia retornar true cuando esMayor(perro3,perro1)' do
			bool = Perro.esMayor(@perro3,@perro1)
			bool.should be true
		end

		it 'deberia retornar true cuando esMayor(perro1,perro2)' do
			bool = Perro.esMayor(@perro1,@perro2)
			bool.should be true
		end

	describe 'ordenar'
		it 'deberia retornar [perro3,perro4,perro1,perro2] cuando 
			ordenar([perro1,perro2,perro3,perro4])' do
			perros = [@perro1,@perro2,@perro3,@perro4]
			perrosOrdenados = Perro.ordenar(perros)
			perrosOrdenados[0].color.should == "Gris"
			perrosOrdenados[1].color.should == "Marron"
			perrosOrdenados[2].color.should == "Blanco"
			perrosOrdenados[3].color.should == "Negro"
		end
end