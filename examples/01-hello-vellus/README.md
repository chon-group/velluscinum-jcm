## Hello Velluscinum

### Creating a JaCaMo Project
```sh
nilson@pc:~$ wget -q http://jacamo-lang.github.io/jacamo/nps/np1.2.zip
nilson@pc:~$ unzip -qq np1.2.zip 
nilson@pc:~$ ./gradlew -Dexec.args="hello-vellus --console"

> Task :run
Creating JaCaMo application hello-vellus
Creating path /home/nilson/hello-vellus

You can run your application with:
   cd /home/nilson/hello-vellus
   ./gradlew -q --console=plain
   
nilson@pc:~$ 
```

### Configuring Project
Edit  the project file __hello-vellus/hello_vellus.jcm__
```
mas vellus_hello {
    agent bob: sample_agent.asl
    uses package: velluscinum "com.github.chon-group:velluscinum-jcm:0.9-rc"
}
```

Edit the agent file __hello-vellus/src/agt/sample_agent.asl__
```sh
/* Initial beliefs and rules */
bigchainDB("http://testchain.chon.group:9984/").
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
```

### Importing Deps
```sh
nilson@pc:~$ cd hello-vellus/
nilson@pc:~/hello-vellus$ ./gradlew buildJCMDeps

> Task :buildJCMDeps
reading from file hello_vellus.jcm ...  file hello_vellus.jcm parsed successfully!
JCM packages dependencies updated at .jcm-deps.gradle

nilson@pc:~/hello-vellus$
``` 

### Run
```sh
nilson@pc:~/hello-vellus$ ./gradlew run --console=plain

> Task :run
Runtime Services (RTS) is running at 192.168.0.111:39417
Agent mind inspector is running at http://192.168.0.111:3272
CArtAgO Http Server running on http://192.168.0.111:3273
[bob] Creating a Wallet
[Velluscinum] Build Wallet... 5QRxjJo17PKge5wbCV8kbEMAU7ouMTEKPrSPkEoN1bF8
[bob] Creating a NFT
[Velluscinum] Creating Asset... 8cb6a30fc1e5f64b2cd1d2b0c30f54bb138065fb82db08b9f5ad83bf8bf4357a [pushed][successfully]
[bob] NFT registred: http://testchain.chon.group:9984:/api/v1/transactions/8cb6a30fc1e5f64b2cd1d2b0c30f54bb138065fb82db08b9f5ad83bf8bf4357a
[Velluscinum] Transfer Asset... b6d955762d71f61858cb6eaf2cc9d16252ef635a9c93b7461aff66ee69e6ae81 [pushed][successfully]
[bob] NFT transferred: http://testchain.chon.group:9984:/api/v1/transactions/b6d955762d71f61858cb6eaf2cc9d16252ef635a9c93b7461aff66ee69e6ae81

BUILD SUCCESSFUL in 7s
3 actionable tasks: 2 executed, 1 up-to-date
nilson@pc:~/hello-vellus$ 
```