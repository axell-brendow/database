$DATA = (GET-DATE -Year 2019 -Month 1 -Day 1)
$VALOR_AQUISICAO = 2.2
$QUANT_LIVROS = 11

for ($i = 0; $i -lt $QUANT_LIVROS; $i++)
{
    echo "/* EXEMPLARES DO LIVRO $($i + 1) */"

    for ($j = 0; $j -lt 3; $j++) # 3 Exemplares
    {
        echo "INSERT INTO EXEMPLAR (CODLIVRO, DATAAQUISICAO, VALORAQUISICAO)
VALUES ($($i + 1), '$($DATA.ToString('yyyy-MM-dd'))', $VALOR_AQUISICAO);"
    
        $VALOR_AQUISICAO++
        $DATA = $DATA.AddDays(7)
    }

    echo ""
}
