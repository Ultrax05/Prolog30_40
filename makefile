# Makefile

# Definición de las secuencias
seq_46_47 := $(shell seq 46 47)
seq_50_55 := $(shell seq 50 55)
seq_60_61 := $(shell seq 60 61)

# Objetivo principal
all: run_all

# Objetivo que ejecuta todos los programas
run_all: $(addprefix run_programa, $(seq_46_47)) $(addprefix run_programa, $(seq_50_55)) $(addprefix run_programa, $(seq_60_61))

# Regla para ejecutar los programas
run_programa%:
	swipl -s ../Prolog/Programa$(subst run_programa,,$@).pl -g main -t halt

.PHONY: all run_all run_programa% clean

# Objetivo para limpiar archivos generados
clean:
	@echo "Limpiando archivos generados..."
	# Añade comandos de limpieza si es necesario