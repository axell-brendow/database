$QUANT_ALUNOS = 3

for ($i = 0; $i -lt $QUANT_ALUNOS; $i++)
{
    echo "/* EMPRESTIMOS QUE O ALUNO $($i + 1) REALIZOU */"

    $DATA = (GET-DATE -Year 2019 -Month 2 -Day 15)

    for ($j = 0; $j -lt 10; $j++) # 10 livros
    {
        for ($k = 0; $k -lt 3; $k++) # 3 exemplares
        {
            echo "INSERT INTO EMPRESTIMO (DATA, CODALUNO) VALUES ('$($DATA.ToString('yyyy-MM-dd'))', $($i + 1));"
            $DATA = $DATA.AddDays(7)
        }
    }

    # Cria empréstimos dos exemplares 22 ao 30 para todos alunos exceto o primeiro
    if ($i -gt 0)
    {
        # Os exemplares de 22 a 30 são livros que não são do MACHADO DE ASSIS
        for ($k = 22; $k -lt 31; $k++)
        {
            for ($l = 0; $l -lt 4; $l++) # 4 exemplares
            {
                echo "INSERT INTO EMPRESTIMO (DATA, CODALUNO) VALUES ('$($DATA.ToString('yyyy-MM-dd'))', $($i + 1));"
                $DATA = $DATA.AddDays(7)
            }
        }
    }
    
    echo ""
}
