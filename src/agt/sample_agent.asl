/* Initial beliefs and rules */
//bigchainDB("http://testchain.chon.group:9984/").
bigchainDB("http://10.100.12.115:9984/").
aliceKey("FNJPJdtuPQYsqHG6tuUjKjqv7SW84U4ipiyyLV2j6MEW").

/* Initial goals */
!start.

/* Plans */
+!start <-
	.print("Creating a Wallet");
	velluscinum.buildWallet(myWallet);
	.wait(myWallet(PrivateKey,PublicKey));
	
	.print("Creating a NFT");
	?bigchainDB(Server);
	velluscinum.deployNFT(Server,
			PrivateKey,PublicKey,
			"name:Meninas;author:Silva y Velázquez;place:Madrid;year:1656",
			"location:Madrid;value_eur:25000000;owner:Bob Agent",
			myNFT);

	.wait(myNFT(AssetID));
	.print("NFT registered: ",Server,"api/v1/transactions/",AssetID);

	.print("Tranfering the NFT");
	?aliceKey(AliceKey);
	velluscinum.transferNFT(Server,
				PrivateKey,PublicKey,
				AssetID,
				AliceKey,
				"value_eur:30000000;owner:Alice;location:Rio de Janeiro",
				transactionTo(alice));
				
	.wait(transactionTo(alice,TransferID));
	.print("NFT transferred: ",Server,"api/v1/transactions/",TransferID);
    .stopMAS.