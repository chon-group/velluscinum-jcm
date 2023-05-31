## Building a House

### Importing the JaCaMo Project
```sh
nilson@pc:~$ git clone https://github.com/chon-group/velluscinum-jcm.git
Cloning into 'velluscinum-jcm'...

nilson@pc:~$ cd velluscinum-jcm/examples/03-house-building/
nilson@pc:~/velluscinum-jcm/examples/03-house-building$ 
```

### Create coin
```sh
nilson@pc:~/velluscinum-jcm/examples/03-house-building$ ./createCoin.sh 
Preparing cryptocurrency to execute the example
Using http://testchain.chon.group:9984 as Node in BigchainDB Network
 
Creating the Bank Of Agents and the JacamoCoin
[Velluscinum] Build Wallet... 5nuSmcyQateeW5t2NcUyfdpz9kDbkizjyUEx8Mn52xcN
 Load TransfInfo from file... .jacamoCoin/JacamoCoin.asset
[Velluscinum] Creating Token... 3c1eb4182f1cf02a565eefdb04fc7f1b601e882d0407f2b96df27b05da8c793a [pushed][successfully]
 
Transfering 50000 JacamoCoin to Giacomo Agent
[Velluscinum] Build Wallet... D3CrtN94hEXWWLUzyxGsJ4qfTaxC7PgVbMgEiUnSFWHg
[Velluscinum] Transfer Token... a6f535defca4a2b89bfc068fda30545e5097043928ed749373f0077b66992e75 [pushed][successfully]
 
Updating beliefs about jacamoCoin
 
Updating beliefs about Giacomo Wallet
 
Executing the house_building jacamo example
nilson@pc:~/velluscinum-jcm/examples/03-house-building$ 
```

### Importing Deps
```sh
nilson@pc:~/velluscinum-jcm/examples/03-house-building$ ./gradlew buildJCMDeps

> Task :buildJCMDeps
reading from file house_building.jcm ...
file house_building.jcm parsed successfully!

JCM packages dependencies updated at .jcm-deps.gradle

nilson@pc:~/velluscinum-jcm/examples/03-house-building$ 

```

### Run

```sh
nilson@pc:~/velluscinum-jcm/examples/03-house-building$ ./gradlew run
```
![Captura de tela de 2023-05-31 11-52-56](https://github.com/chon-group/velluscinum-jcm/assets/32855001/5b3c789a-1e8f-4c47-8192-4e27277c36b6)

