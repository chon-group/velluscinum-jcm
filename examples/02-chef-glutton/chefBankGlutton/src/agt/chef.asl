// Agent chef in project chefBankGlutton
/* Initial beliefs and rules */
lastOrder(0).

/* Initial goals */
!createWallet.

/* Plans */
+!createWallet <-
	.print("Creating a digital wallet!");
	velluscinum.buildWallet(myWallet);
	.wait(myWallet(Priv,Pub));
	+chefWallet(Pub).

+!order(Product,Qtd,Payment)[source(Client)]: cryptocurrency(Coin) 
			& chainServer(Server) & myWallet(MyPriv,MyPub) <-
	?lastOrder(N);
	OrderNr=N+1;
	-+lastOrder(OrderNr);
	.print("Received the order",OrderNr," ckecking payment...");
	velluscinum.stampTransaction(Server,MyPriv,MyPub,Payment,payment(OrderNr));
	+preparingOrder;
	!cooking(OrderNr,Product,Qtd,Client);
	-preparingOrder.

+!cooking(OrderNr,Product,Qtd,Client) <-
	.print("Preparing order Nr ",OrderNr);
	.wait(1000);
	.send(Client,tell,delivering(Product,Qtd)).