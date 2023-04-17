programa
{
	
	inclua biblioteca Tipos --> tp
	funcao vazio separador()
	{
		escreva("-----------------------------------------------------------\n\n")	
	}
	funcao inicio()
	{
		cadeia salario, financiamento
		
   		escreva("Digite o valor do seu salário: ")
		leia(salario)
		enquanto(tp.cadeia_e_inteiro(salario, 10) != verdadeiro e tp.cadeia_e_real(salario) != verdadeiro ou tp.cadeia_para_real(salario) <= 0){
			limpa()
			escreva("Insira um valor válido!\n\n")
			separador()
			escreva("Digite o valor do seu salário: ")
			leia(salario)
		}
		escreva("Digite o valor do financiamento pretendido: ")
		leia(financiamento)
		enquanto(tp.cadeia_e_inteiro(financiamento, 10) != verdadeiro e tp.cadeia_e_real(financiamento) != verdadeiro ou tp.cadeia_para_real(financiamento) <= 0){
			limpa()
			escreva("Insira um valor válido!\n\n")
			separador()
			escreva("Digite o valor do financiamento pretendido: ")
			leia(salario)
		}

		se (tp.cadeia_para_real(financiamento) <= tp.cadeia_para_real(salario) * 5){
			limpa()
			escreva("\nFinanciamento Concedido!\n")
		}
		
		senao {
			limpa()
			escreva("\nFinanciamento Negado!\n")
		}
		separador()
		escreva("Obrigado por nos consultar. :)\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1072; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
