$CODEMPRESTITEM = 1
$MULTA = 0.0

for ($aluno = 1; $aluno -le 3; $aluno++) # 3 alunos
{
    $CODEXEMPLAR = 1
    $DATA = (GET-DATE -Year 2019 -Month 2 -Day 16)

    echo "/* ITENS EMPRESTADOS AO ALUNO $aluno */"

    for ($i = 0; $i -lt 10; $i++) # 10 livros
    {
        for ($j = 0; $j -lt 3; $j++) # 3 exemplares
        {
            echo "INSERT INTO ITEMEMPREST (CODEMPRESTITEM, CODEXEMPLAR, DATADEVOL, MULTA)
VALUES ($CODEMPRESTITEM, $CODEXEMPLAR, '$($DATA.ToString('yyyy-MM-dd'))', $MULTA);"
        
            $CODEMPRESTITEM++
            $CODEXEMPLAR++
            $DATA = $DATA.AddDays(7)
            $MULTA += 3.25
        }
    }

    # Cria empréstimos dos exemplares 22 ao 30 para todos alunos exceto o primeiro
    if ($aluno -gt 1)
    {
        for ($j = 1; $j -le 4; $j++) # 4 exemplares a mais emprestados
        {
            $CODEXEMPLAR = 22
        
            # Os exemplares de 22 a 30 são livros que não são do MACHADO DE ASSIS
            for ($i = 22; $i -lt 31; $i++)
            {
                echo "INSERT INTO ITEMEMPREST (CODEMPRESTITEM, CODEXEMPLAR, DATADEVOL, MULTA)
VALUES ($CODEMPRESTITEM, $CODEXEMPLAR, '$($DATA.ToString('yyyy-MM-dd'))', $MULTA);"
            
                $CODEMPRESTITEM++
                $CODEXEMPLAR++
                $DATA = $DATA.AddDays(7)
                $MULTA += 3.25
            }
        }
    }

    echo ""
}
