local dias = {
	"domingo",
	"segunda",
	"terca",
	"quarta",
	"quinta",
	"sexta",
	"sabado"
}

function geraDiaDaSemana () 
	local MAX_LIM = 7
	local MIN_LIM = 1
	return dias[math.random(MIN_LIM,MAX_LIM)]

end

local year = {
	janeiro = { days = 31 , primeiro_dia = geraDiaDaSemana()},
	fevereiro = { days = 28 , primeiro_dia = geraDiaDaSemana()},
	marco = { days = 31 , primeiro_dia = geraDiaDaSemana()},
	abril = { days = 30 , primeiro_dia = geraDiaDaSemana()},
	maio = { days = 31 , primeiro_dia = geraDiaDaSemana()},
	junho = { days = 30 , primeiro_dia = geraDiaDaSemana()},
	julho = { days = 31 , primeiro_dia = geraDiaDaSemana()},
	agosto = { days = 30 , primeiro_dia = geraDiaDaSemana()},
	setembro = { days = 31 , primeiro_dia = geraDiaDaSemana()},
	outubro = { days = 30 , primeiro_dia = geraDiaDaSemana()},
	novembro = { days = 31 , primeiro_dia = geraDiaDaSemana()},
	dezembro = { days = 30 , primeiro_dia = geraDiaDaSemana()}
}

function hu3 (diaDaSemana , diferenca)
	diferenca = diferenca - 1
	diferenca = diferenca%7
	local aux 
	for i = 1 , 8 do 
		if ( diaDaSemana == dias[i]) then
			aux = i
		end
	end
	aux = aux + diferenca - 1
	aux = aux % 7
	aux = aux + 1

	return dias[aux]
end

function diaDaSemana (mes , dia)
		
	local aux = hu3( year[mes].primeiro_dia , dia)
	
	if (year[mes].days >= dia) then
		print (aux)
	else 
		print (nil)
	end
end

diaDaSemana('janeiro',1)
diaDaSemana('janeiro',2)
diaDaSemana('janeiro',3)

diaDaSemana('janeiro',30)
diaDaSemana('janeiro',31)
diaDaSemana('janeiro',32)
