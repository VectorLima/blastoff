programa
{
	inclua biblioteca Tipos --> tp
	funcao vazio separador()
	{
		escreva("-----------------------------------------------------------\n\n")	
	}
	funcao inicio()
	{

		cadeia inicial, cheque
		real atual

		escreva("Digite o saldo do cliente: ")
		leia(inicial)
		enquanto(tp.cadeia_e_inteiro(inicial, 10) != verdadeiro e tp.cadeia_e_real(inicial) != verdadeiro){
			limpa()
			escreva("Insira um valor válido!\n\n")
			escreva("Digite o saldo do cliente: ")
			leia(inicial)
		}

		escreva("Digite o valor do cheque: ")
		leia(cheque)
		enquanto(tp.cadeia_e_inteiro(cheque, 10) != verdadeiro e tp.cadeia_e_real(cheque) != verdadeiro){
			limpa()
			escreva("Insira um valor válido!\n\n")
			escreva("Digite o valor do cheque: ")
			leia(cheque)
		}
		separador()
		se (tp.cadeia_para_real(cheque) > tp.cadeia_para_real(inicial)){
			escreva("Cheque não pode ser descontado. Saldo insuficiente.\n")
		} senao {
			atual = tp.cadeia_para_real(inicial) - tp.cadeia_para_real(cheque)
			escreva("Cheque descontado. Saldo atual: R$", atual, "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 429; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */