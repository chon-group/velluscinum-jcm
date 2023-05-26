// Agent banco in project cozinheiroEcomilao.mas2j
/* Crenças Iniciais */
chainServer("http://testchain.chon.group:9984/").


/* Objetivos Iniciais */
!createCoin.

/* Planos */
+!createCoin: chainServer(Server) <-
	.print("Criando uma Carteira Digital");
	velluscinum.buildWallet(myWallet);
	.wait(myWallet(PrK,PuK));

	.print("Criando e publicando uma Moeda Digital");
	velluscinum.deployToken(Server,PrK,PuK,"name:ChainCoin",200,chainCoin);
	.wait(chainCoin(Coin));
	.broadcast(tell,cryptocurrency(Coin));
	.broadcast(tell,bankWallet(PuK));
	.broadcast(tell,chainServer(Server)).
	
+!solicitacaoEmprestimo(Protocolo,NrCarteira,Valor)[source(Cliente)]: 
			chainCoin(Coin) & myWallet(Prk,PuB) & chainServer(Server) <-
	.print("Prezado Agente ",Cliente,", seja bem-vindo ao BanChain! - Aguarde equanto validamos sua transação.");
	velluscinum.stampTransaction(Server,Prk,PuB,Protocolo,emprestimo(Cliente));
	velluscinum.transferToken(Server,Prk,PuB,Coin,NrCarteira,Valor,transactionTransfer);
	.send(Cliente,tell,contaBancaria(ok)).
