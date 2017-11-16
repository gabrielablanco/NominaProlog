empleado(nombre('Orlando'), tipo_contrato('planta'), categoria('auxiliar')).
empleado(nombre('Alejandro'), tipo_contrato('planta'), categoria('asistente')).
empleado(nombre('Deicy'), tipo_contrato('planta'), categoria('titular')).
empleado(nombre('Pilar'), tipo_contrato('planta'), categoria('asociado')).
empleado(nombre('Fabio'), tipo_contrato('TCO'), categoria('auxiliar')).
empleado(nombre('Diego'), tipo_contrato('TCO'), categoria('asistente')).
empleado(nombre('Maria'), tipo_contrato('TCO'), categoria('titular')).
empleado(nombre('Gloria'), tipo_contrato('TCO'), categoria('asociado')).
empleado(nombre('Fernanda'), tipo_contrato('MTO'), categoria('auxiliar')).
empleado(nombre('Javier'), tipo_contrato('MTO'), categoria('asistente')).
empleado(nombre('Felipe'), tipo_contrato('MTO'), categoria('titular')).
empleado(nombre('Eugenia'), tipo_contrato('MTO'), categoria('asociado')).
empleado(nombre('Leonor'), tipo_contrato('HC'), categoria('auxiliar')).
empleado(nombre('Jeferson'), tipo_contrato('HC'), categoria('asistente')).
empleado(nombre('Liliana'), tipo_contrato('HC'), categoria('titular')).
empleado(nombre('Patricia'), tipo_contrato('HC'), categoria('asociado')).
empleado(nombre('Gabriela'), tipo_contrato('honorarios'), categoria('auxiliar')).
empleado(nombre('Sebastian'), tipo_contrato('honorarios'), categoria('asistente')).
empleado(nombre('Paula'), tipo_contrato('honorarios'), categoria('titular')).
empleado(nombre('Estela'), tipo_contrato('honorarios'), categoria('asociado')).

base_hora(tipo_contrato('planta'), 40).
base_hora(tipo_contrato('TCO'), 40).
base_hora(tipo_contrato('MTO'), 20).
base_hora(tipo_contrato('HC'), 16).
base_hora(tipo_contrato('honorarios'), 8).

paga_empleado(tipo_contrato('planta'), categoria('auxiliar'), 3200).
paga_empleado(tipo_contrato('planta'), categoria('asistente'), 8000).
paga_empleado(tipo_contrato('planta'), categoria('titular'), 16000).
paga_empleado(tipo_contrato('planta'), categoria('asociado'), 24000).
paga_empleado(tipo_contrato('TCO'), categoria('auxiliar'), 3200).
paga_empleado(tipo_contrato('TCO'), categoria('asistente'), 8000).
paga_empleado(tipo_contrato('TCO'), categoria('titular'), 16000).
paga_empleado(tipo_contrato('TCO'), categoria('asociado'), 24000).
paga_empleado(tipo_contrato('MTO'), categoria('auxiliar'), 1600).
paga_empleado(tipo_contrato('MTO'), categoria('asistente'), 4000).
paga_empleado(tipo_contrato('MTO'), categoria('titular'), 8000).
paga_empleado(tipo_contrato('MTO'), categoria('asociado'), 12000).
paga_empleado(tipo_contrato('HC'), categoria('auxiliar'), 1280).
paga_empleado(tipo_contrato('HC'), categoria('asistente'), 3200).
paga_empleado(tipo_contrato('HC'), categoria('titular'), 6400).
paga_empleado(tipo_contrato('HC'), categoria('asociado'), 9600).
paga_empleado(tipo_contrato('honorarios'), categoria('auxiliar'), 640).
paga_empleado(tipo_contrato('honorarios'), categoria('asistente'), 1600).
paga_empleado(tipo_contrato('honorarios'), categoria('titular'), 3200).
paga_empleado(tipo_contrato('honorarios'), categoria('asociado'), 4800).

bono_contrato(0.08, tipo_contrato('planta')).
bono_contrato(0.15, tipo_contrato('TCO')).
bono_contrato(0.10, tipo_contrato('MTO')).
bono_contrato(0.20, tipo_contrato('HC')).
bono_contrato(0.25, tipo_contrato('honorarios')).

semestre('Normal', 18).
semestre('Intersemestral', 4).

sueldo(empleado(nombre(X), Y, Z), Semestre, Total) :- empleado(nombre(X), Y, Z), paga_empleado(Y, Z, B),bono_contrato(Bono, Y), semestre(Semestre, S), base_hora(Y, H), Total is round((B*H*S)*(1+Bono)).

suma([], 0).
suma([X|Y], S):-suma(Y, S2), S is S2 + X.

nomina(Semestre, Total):-findall(Result, (sueldo(_, Semestre, Result)), Z), suma(Z, Total).









