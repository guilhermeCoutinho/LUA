local debugMode = true
local DEBUG_DIA = 3
local DEBUG_INICIO = '08:00'
local DEBUG_TERMINO = '12:00'
local DEBUG_INICIO_HORA = '08'
local DEBUG_INICIO_MINUTO = '00'
local DEBUG_TERMINO_HORA = '12'
local DEBUG_TERMINO_MINUTO = '00'


local reserva = {
		dia = {},
		inicio = {},
		termino = {},
		inicio_formatado = {},
		termino_formatado = {}
	}

function verificaDisponibilidade( user_dia, horario_pendente_inicio , horario_pendente_termino  )

	local isDisponivel = true

	for i,v in ipairs ( reserva.dia ) do
		if (reserva.dia[i] == user_dia) then
			if ( reserva.inicio[i] < horario_pendente_inicio and horario_pendente_inicio < reserva.termino[i] ) then
				isDisponivel = false
			end
			if(reserva.inicio[i] < horario_pendente_termino and horario_pendente_termino < reserva.termino[i]) then
				isDisponivel = false
			end

		end
	end
	return isDisponivel

end



function start ( )

	local user_dia = DEBUG_DIA
	local user_inicio_string = DEBUG_INICIO
	local user_termino_string = DEBUG_TERMINO
	local user_inicio_hora 
	local user_inicio_minuto  
	local user_termino_minuto 
	local user_termino_hora 
	local horario_pendente_inicio
	local horario_pendente_termino


	if debugMode then
		user_inicio_hora = DEBUG_INICIO_HORA
		user_inicio_minuto = DEBUG_INICIO_MINUTO
		user_termino_minuto = DEBUG_TERMINO_MINUTO
		user_termino_hora = DEBUG_TERMINO_HORA
	end

	if (user_dia == 0 ) then 
		for i,v in ipairs(reserva.dia) do
			print(">", v , 
				"\n\t|" , reserva.inicio_formatado[i] , 
				"-" , reserva.termino_formatado[i])
		end


	else

		horario_pendente_inicio = user_inicio_hora * 60 + user_inicio_minuto
		horario_pendente_termino = user_termino_hora * 60 + user_termino_minuto

		local isDisponivel = 	verificaDisponibilidade (
					user_dia, horario_pendente_inicio , horario_pendente_termino )

		if (isDisponivel) then
			reserva.dia[#reserva.dia+1] = user_dia
			reserva.inicio[#reserva.inicio+1] = horario_pendente_inicio
			reserva.termino[#reserva.termino+1] = horario_pendente_termino
			reserva.termino_formatado[#reserva.termino_formatado+1] = user_termino_string
			reserva.inicio_formatado[#reserva.inicio_formatado+1] = user_inicio_string
			print ('[INFO] Reserva efetuada')
		else
			print ('[INFO] Horario nao disponivel')
		end
	end




end

start()
--DEBUG_DIA = 0
--start()
DEBUG_DIA = 3
DEBUG_INICIO = '09:00'
DEBUG_TERMINO = '10:00'
DEBUG_INICIO_HORA = '09'
DEBUG_INICIO_MINUTO = '00'
DEBUG_TERMINO_HORA = '10'
DEBUG_TERMINO_MINUTO = '00'
start()
DEBUG_DIA = 4
DEBUG_INICIO = '13:30'
DEBUG_TERMINO = '14:30'
DEBUG_INICIO_HORA = '13'
DEBUG_INICIO_MINUTO = '30'
DEBUG_TERMINO_HORA = '14'
DEBUG_TERMINO_MINUTO = '30'
start()
DEBUG_DIA = 0
start()
