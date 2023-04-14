programa
{
		
	inclua biblioteca Tipos --> tp
	funcao vazio separador()
	{
		escreva("-----------------------------------------------------------\n\n")	
	}
	funcao inicio()
	{

		cadeia kmInicial, kmFinal,litros
		real kmPorLitro, kmTotal
		
		escreva("Digite a quilometragem no velocímetro ao sair de viagem: ")
		leia(kmInicial)
		enquanto(tp.cadeia_e_inteiro(kmInicial, 10) != verdadeiro e tp.cadeia_e_real(kmInicial) != verdadeiro ou tp.cadeia_para_real(kmInicial) <= 0){
			limpa()
			escreva("Insira um valor válido e positivo!!\n\n")
			separador()
			escreva("Digite a quilometragem no velocímetro ao sair de viagem: ")
			leia(kmInicial)
		}
		
		escreva("\nDigite a quilometragem no velocímetro ao chegar: ")
		leia(kmFinal)
		enquanto(tp.cadeia_e_inteiro(kmFinal, 10) != verdadeiro e tp.cadeia_e_real(kmFinal) != verdadeiro ou tp.cadeia_para_real(kmFinal) <= 0){
			limpa()
			escreva("Insira um valor válido e positivo!!\n\n")
			separador()
			escreva("Digite a quilometragem no velocímetro ao chegar: ")
			leia(kmFinal)
		}
		
		escreva("\nDigite a quantidade total de litros de gasolina comprados: ")
		leia(litros)
		enquanto(tp.cadeia_e_inteiro(litros, 10) != verdadeiro e tp.cadeia_e_real(litros) != verdadeiro ou tp.cadeia_para_real(litros) <= 0){
			limpa()
			escreva("Insira um valor válido e positivo!!\n\n")
			separador()
			escreva("Digite a quantidade total de litros de gasolina comprados: ")
			leia(litros)
		}
		
		kmTotal = tp.cadeia_para_real(kmFinal) - tp.cadeia_para_real(kmInicial)
		kmPorLitro = kmTotal / tp.cadeia_para_real(litros)
		separador()
		escreva("\nVocê percorreu ", kmTotal, "km com ", litros, " litros de gasolina.\n")
		escreva("\nVocê rodou em média ", kmPorLitro, " km/l.\n")

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 538; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */