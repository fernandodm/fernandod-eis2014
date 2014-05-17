class Perro

attr_accessor :edad, :peso, :color

	def self.colorMayor(perro1,perro2)
		colores = {"Gris" => 0, "Marron" => 1, "Negro" => 2, "Blanco" => 3}
		colorPerro1 = colores[perro1.color]
		colorPerro2 = colores[perro2.color]
		return colorPerro1 > colorPerro2
	end

	def self.esMayorPorPeso(perro1,perro2)
		if perro1.peso > perro2.peso
			return true
		elsif perro1.peso < perro2.peso
			return false
		end

		return Perro.colorMayor(perro1,perro2)
	end

	def self.esMayor(perro1,perro2)
		if perro1.edad > perro2.edad
			return true
		elsif perro1.edad < perro2.edad
			return false
		end

		return Perro.esMayorPorPeso(perro1,perro2)
	end

	def self.ordenar(lista)
		ordenadosPorEdad = lista.sort{|a,b| b.edad <=> a.edad}
		tamanho = lista.length
		indice1 = 0
		indice2 = 1
		#este while es para agarrar los perros que no estan ordenados
		#empezando por el primero de la lista
		while indice1 < tamanho
			perro = ordenadosPorEdad[indice1]
			#este while sirve para:
			#1-comparar si el perro que se agarro no es mayor al siguiente
			#2-si no es mayor se hace un swap entre los dos perros y se corta el while
			#y asi vuelve a empezar con el primer perro de la lista en el while anterior
			#3-si el perro que se agarro es mayor al resto de la lista se le suma 1 a
			#indice1, asi pasa al siguiente de la lista en la iteracion que sigue,
			#y a indice2 se le suma indice1 mas 1, para poder comparar con el siguiente
			#perro del que se agarro...(*1)
			while indice2 < tamanho
				if !(Perro.esMayor(perro,ordenadosPorEdad[indice2]))
					##swap##
					perroMayor = ordenadosPorEdad[indice2]
					ordenadosPorEdad[indice2] = perro
					ordenadosPorEdad[indice1] = perroMayor
					break
				end
				indice2 = indice2 + 1
			end

			#(*1)
			if indice2 == tamanho
				indice1 = indice1 + 1
				indice2 = indice1 + 1
			end
		end 
		return ordenadosPorEdad
	end
end