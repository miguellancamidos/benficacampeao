title: "Anotacion guion pratica 11"
author: "Miguel Lanca"
format: qmd
bibliography: "../../doc/references.bib"
###Resultados y modificacion de los nombres de las proteinas


```{bash}
#| eval: true
#| echo: true

# Definir os caminhos dos ficheiros
INPUT="data/arquivo_original.fasta"
OUTPUT="proteinas.fasta"

# Verificar se o arquivo de saída já existe
if [ ! -f "$OUTPUT" ]; then
    echo "A processar o ficheiro..."
    
    # Executar o comando awk fornecido no exercício
    awk '( /^>/ ){split($1, A, /\|/); print ">" A[2]}(/^[^>]/){print $0}' "$INPUT" > "$OUTPUT"
    
    echo "Concluído. Ficheiro $OUTPUT criado."
else
    echo "O ficheiro $OUTPUT já existe. Salto para o próximo passo."
fi

```

# Paso previo para convertir el ensamblaje en una base de datos de BLAST:
BuildDatabase -name At4 ../2026-04-16/asm1/At4.fa

RepeatModeler -database At4 -threads 6 >& run.log