# velluscinum-jcm
[![](https://jitpack.io/v/chon-group/velluscinum-jcm.svg)](https://jitpack.io/#chon-group/velluscinum-jcm)

### Download JaCaMo
```sh
nilson@pc:~$ wget -q http://jacamo-lang.github.io/jacamo/nps/np1.2.zip
nilson@pc:~$ unzip np1.2.zip 
Archive:  np1.2.zip
  inflating: build.gradle            
  inflating: create.sh               
   creating: gradle/
   creating: gradle/wrapper/
  inflating: gradle/wrapper/gradle-wrapper.jar  
  inflating: gradle/wrapper/gradle-wrapper.properties  
  inflating: gradlew                 
  inflating: gradlew.bat 
```
### Creating Project

```sh
nilson@pc:~$ ./gradlew --console=plain
> Task :compileJava NO-SOURCE
> Task :processResources NO-SOURCE
> Task :classes UP-TO-DATE

> Task :run
JaCaMo 1.2 built on Tue May 23 17:03:04 CEST 2023


Enter the identification of the new application: vellus_hello      
Creating JaCaMo application vellus_hello
Creating path /home/nilson/vellus_hello

You can run your application with:
   cd /home/nilson/vellus_hello
   ./gradlew -q --console=plain

or (if you have JaCaMo CLI installed)
   jacamo /home/nilson/vellus_hello/vellus_hello.jcm

BUILD SUCCESSFUL in 1m 21s
1 actionable task: 1 executed
nilson@pc:~$ 
```

Edit  ___yourMultiAgentSystem.jcm___ adding velluscinum JaCaMo package.
```sh
mas vellus_hello {

    agent bob: sample_agent.asl
    
    uses package: velluscinum "com.github.chon-group:velluscinum-jcm:0.9-beta"
}
```

Edit /home/nilson/vellus_hello/src/agt/sample_agent.asl
```sh
/* Initial beliefs and rules */
bigchainDB("http://testchain.chon.group:9984/").
aliceKey("FNJPJdtuPQYsqHG6tuUjKjqv7SW84U4ipiyyLV2j6MEW").

/* Initial goals */
!start.

/* Plans */
+!start <-
	.print("Creating a Wallet");
	.buildWallet(myWallet);
	.wait(myWallet(PrivateKey,PublicKey));
	
	.print("Creating a NFT");
	?bigchainDB(Server);
	.deployNFT(Server,
			PrivateKey,PublicKey,
			"name:Meninas;author:Silva y Velázquez;place:Madrid;year:1656",
			"location:Madrid;value_eur:25000000;owner:Bob Agent",
			myNFT);

	.wait(myNFT(AssetID));
	.print("NFT registered: ",Server,"api/v1/transactions/",AssetID);

	.print("Tranfering the NFT");
	?aliceKey(AliceKey);
	.transferNFT(Server,
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
nilson@pc:~$ cd /home/nilson/vellus_hello/
nilson@pc:~/vellus_hello$ ./gradlew buildJCMDeps

> Task :buildJCMDeps
reading from file vellus_hello.jcm ...
file vellus_hello.jcm parsed successfully!

JCM packages dependencies updated at .jcm-deps.gradle

BUILD SUCCESSFUL in 5s
2 actionable tasks: 2 executed
nilson@pc:~/vellus_hello$
``` 

### Run
```sh
nilson@pc:~/vellus_hello$ ./gradlew build

> Task :testJaCaMo
Runtime Services (RTS) is running at 192.168.0.111:39417
Agent mind inspector is running at http://192.168.0.111:3272
CArtAgO Http Server running on http://192.168.0.111:3273
[Velluscinum] Build Wallet... 5QRxjJo17PKge5wbCV8kbEMAU7ouMTEKPrSPkEoN1bF8
[Velluscinum] Creating Asset... 8cb6a30fc1e5f64b2cd1d2b0c30f54bb138065fb82db08b9f5ad83bf8bf4357a [pushed][successfully]
[Velluscinum] Transfer Asset... b6d955762d71f61858cb6eaf2cc9d16252ef635a9c93b7461aff66ee69e6ae81 [pushed][successfully]

BUILD SUCCESSFUL in 7s
3 actionable tasks: 2 executed, 1 up-to-date
nilson@pc:~/vellus_hello$ 

```
