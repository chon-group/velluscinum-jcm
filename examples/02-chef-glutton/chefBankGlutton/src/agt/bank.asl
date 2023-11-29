// Agent bank in project chefBankGlutton
/* Initial beliefs and rules */
chainServer("http://testchain.chon.group:9984/").

/* Initial goals */
!createCoin.

/* Plans */
+!createCoin: chainServer(Server) <-
	.print("Creating digital wallet");
	velluscinum.buildWallet(myWallet);
	.wait(myWallet(PrK,PuK));

	.print("Creating and sharing a cryptocurrency");
	velluscinum.deployToken(Server,PrK,PuK,"name:ChainCoin",200,chainCoin);
	.wait(chainCoin(Coin));
	.broadcast(tell,cryptocurrency(Coin));
	.broadcast(tell,bankWallet(PuK));
	.broadcast(tell,chainServer(Server)).
	
+!lending(ResquestNumber,ClientWallet,Value)[source(Client)]: 
			chainCoin(Coin) & myWallet(Prk,PuB) & chainServer(Server) <-
	.print("Hello Agent ",Client,", Wellcome to BanChain! - Please wait while we check the transaction.");
	velluscinum.stampTransaction(Server,Prk,PuB,ResquestNumber,loan(Client));
	velluscinum.transferToken(Server,Prk,PuB,Coin,ClientWallet,Value,transactionTransfer);
	.send(Client,tell,bankAccount(ok)).
