// Agent glutton in project chefBankGlutton
/* Initial beliefs and rules */
foodStock(10).
energy(0).

/* Initial goals */
!enjoy.

/* Plans */
+!requestLend: cryptocurrency(Coin) & bankWallet(BankW) & chainServer(Server) & myWallet(MyPriv,MyPub)<-
	.print("Requesting Lend");
	velluscinum.deployNFT(Server,MyPriv,MyPub,
				"name:comilao;address:5362fe5e-aaf1-43e6-9643-7ab094836ff4",
				"description:Createing Bank Account",
				account);
				
	.wait(account(AssetID));
	velluscinum.transferNFT(Server,MyPriv,MyPub,AssetID,BankW,
				 "description:requesting lend;value_chainCoin:10",requestID);
	.wait(requestID(PP));
	
	.print("Lend Contract nr:",PP);
	.send(bank,achieve,lending(PP,MyPub,10)).
	
+!eat: hungry & foodStock(C) & C>3 & energy(E) & E<=10 <-
	-+foodStock(C-3);
	-+energy(E+3);
	.print("Eating........ [Fridge=",C-3,"] [Energy=",E+3,"]");
	.wait(1000);
	!eat.
	
+!eat: energy(E) & E>10	<-
	.print("Satisfied...... [Energy=",E,"]");
	-hungry;
	!enjoy.

+!eat <-
	?foodStock(X);
	.print("I need food..... [Fridge=",X,"]");
	.wait(1000);
	!orderFood.

+!enjoy: energy(E) & E>5 <-
	.print("Enjoying....");
	.wait(1000);
	-+energy(E-3);
	-hungry;
	!enjoy.

+!enjoy: energy(E) & E<=5<-
	.print("Tired..... [Energy=",E,"]");
	+hungry;
	!eat.

+!orderFood: bankAccount(ok)[source(bank)] & cryptocurrency(Coin) 
			& chainServer(Server) & myWallet(MyPriv,MyPub) 
			& chefWallet(Chef)<-
			
	.print("Ordering food.....");
	velluscinum.transferToken(Server,MyPriv,MyPub,Coin,Chef,5,payment);
	.wait(payment(Transfer));
	.send(chef,achieve,order(pizza,5,Transfer));
	.wait(5000);
	!eat.

+!orderFood: not bankAccount(ok)[source(bank)] <-
	.wait(5000);
	velluscinum.buildWallet(myWallet);
	!requestLend;
	.wait(5000);
	.send(chef,askOne,chefWallet(Chef),Reply);
	+Reply;
	!orderFood.
	
-!orderFood: cryptocurrency(Coin) & chainServer(Server) 
		& myWallet(MyPriv,MyPub) <-
		velluscinum.tokenBalance(Server,MyPriv,MyPub,Coin,balance).	

+delivering(Product,Qtd)[source(Chef)] <-
	?foodStock(X);
	-+foodStock(X+Qtd);
	.print("Wow! Pizza!!!!");
	-delivering(Product,Qtd)[source(Chef)].
	
+balance(T,V)[source(self)]: cryptocurrency(Coin)[source(bank)] & V<5 & Coin==T <-
	.drop_desire(enjoy);
	.print("I don't have money! :(");
	.wait(5000).