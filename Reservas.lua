local reserva = {
		dia = {},
		inicio = {},
		termino = {}
	}

function verificaDisponibilidade( user_dia, user_inicio_string , user_termino_string  )

	local isDisponivel = true
	
	local user_inicio_hora  = string.sub(user_inicio_string , 1 , 2)
	local user_inicio_minuto  = string.sub (user_inicio_string , 4 , 5)
	local user_termino_minuto  = string.sub ( user_termino_string , 1 ,2 )
	local user_termino_hora = string.sub ( user_termino_string , 4 , 5)
	

	local horario_pendente_inicio = (user_inicio_hora) * 60 + (user_inicio_minuto)
	local horario_pendente_termino = (user_termino_hora) * 60 + (user_termino_minuto)


	for i,v in ipairs ( reserva.dia ) do
		if (reserva.dia[i] == user_dia) then
			local inicio_reserva = (string.sub (reserva.inicio[i] , 1 , 2 ) ) * 60 + (string.sub(reserva.inicio[i] , 4 , 5))
			local termino_reserva = (string.sub (reserva.termino[i] , 1 , 2 ) ) * 60 + (string.sub(reserva.termino[i] , 4 , 5))

			if ( inicio_reserva < horario_pendente_inicio and horario_pendente_inicio < termino_reserva ) then
				isDisponivel = false
			end
			if( inicio_reserva < horario_pendente_termino and horario_pendente_termino < termino_reserva ) then
				isDisponivel = false
			end

		end
	end
	return isDisponivel

end



function start ( )

	local user_dia
	local user_inicio_string
	local user_termino_string

	io.write ("Dia: ")
	user_dia = io.read()

	if ( user_dia == '0' ) then
		for i,v in ipairs(reserva.dia) do
			print(">", v , 
				"\n\t|" , reserva.inicio[i],
				"-" , reserva.termino[i])
		end
	else
		io.write("Inicio: ")
		user_inicio_string = io.read()
		io.write("Termino: ")
		user_termino_string = io.read()

		local isDisponivel = 	verificaDisponibilidade (
					user_dia, user_inicio_string , user_termino_string )

		if (isDisponivel) then
			reserva.dia[#reserva.dia+1] = user_dia
			reserva.inicio[#reserva.inicio+1] = user_inicio_string
			reserva.termino[#reserva.termino+1] = user_termino_string
			print ('[INFO] Reserva efetuada')
		else
			print ('[INFO] Horario nao disponivel')
		end
	end
end

while true do
	start()
end
