programa
{
	inclua biblioteca Tipos --> tp
	
	funcao vazio separador()
	{
		escreva("-----------------------------------------------------------\n\n")	
	}
	
    	funcao inicio()
	{
		cadeia qtdVendas
		real salarioTotal, bonus
		inteiro c = 0

		
		escreva("Digite a quantidade de sistemas vendidos: ")
		leia(qtdVendas)
		
		enquanto (tp.cadeia_e_inteiro(qtdVendas, 10) != verdadeiro){
			limpa()
			se(c >= 3){
				escreva("Meu código é a prova de balas contra as suas ", c ," tentativas ;)\n")	
				separador()
			}
			c++
			escreva("Insira um valor válido!\n\n")
			separador()
			escreva("Digite a quantidade de sistemas vendidos: ")
			leia(qtdVendas)
		} 
		limpa()
		bonus = tp.inteiro_para_real((tp.cadeia_para_inteiro(qtdVendas, 10) * 50))
		salarioTotal = 500 + bonus
		escreva("O salário total do vendedor é de R$", salarioTotal, " e o bônus é de R$", bonus ,"\n")
		
	}
}	
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 513; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */