# velluscinum-jcm - Middleware Velluscinum package for JaCaMo
[![](https://jitpack.io/v/chon-group/velluscinum-jcm.svg)](https://jitpack.io/#chon-group/velluscinum-jcm)

This project presents a Multi-agent Systems (MAS) approach that can use digital assets as a factor of agreement in the relationship between cognitive agents using the Belief-Desire-Intention model. Adopting Distributed Ledger Technologies (DLT) technologies in MAS can facilitate the agreement between agents, taking what is registered in the Ledger as accurate, and also can be helpful to manage trust relationships, open MAS, and distributed scenarios. 

The Velluscinum JaCaMo Package extends the [jacamo-lang](https://github.com/jacamo-lang/jacamo) through integration with [BigchainDB](https://github.com/bigchaindb/bigchaindb), providing new internal actions to enable the use of digital assets to support the relationship between intelligent agents.
The actions offered by the middleware are available directly to the dimension of the agents that populate the MAS. They bridge the [Multi-agent Oriented Programming (MAOP) paradigm](https://doi.org/10.1016/j.scico.2011.10.004) and the [BigchainDB communication driver](https://github.com/bigchaindb/java-bigchaindb-driver). In this way, intelligent agents can create or transfer digital assets, stamp transactions or manage their wallets on the DLT directly from their dimension.

![schema2](https://github.com/chon-group/velluscinum-jcm/assets/32855001/aac47021-2c88-439b-b6cc-bccd2d48a355)

## The built-in internal actions provided by the middleware are described below:
- velluscinum.buildWallet(w) - generates a digital wallet and returns the belief +w(P,Q);
- velluscinum.deployNFT(S,P,Q,I,M,b) - registers an asset and returns the belief +b(A);
- velluscinum.transferNFT(S,P,Q,A,R,M,b) - transfer an asset and returns +b(T);
- velluscinum.deployToken(S,P,Q,I,V,b) - creates V units from an asset, returns +b(C);
- velluscinum.transferToken(S,P,Q,C,R,V,b) - transfer V units of C and returns +b(T);
- velluscinum.stampTransaction(S,P,Q,T) - stamps a transaction (T);
- velluscinum.tokenBalance}(S,P,Q,C,q) - check the wallet Q and return +q(C,V).

Where:
- b is a belief that represents a result of an operation in DLT;
- w is a belief that represents an agent's wallet;
- q is a belief that represents the balance of C in the agent's wallet.
- A is a literal that represents a divisible asset;
- C is a literal that represents a indivisible asset;
- P e Q are literals that represent the agent's key pair;
- R is a literal that represents the public key of a recipient agent;
- S is a literal that represents the address of a DLT node;
- T is a literal that represents a transaction performed in the DTL;
- V is a literal that represents the number of parts of a C;
- I is a key-value array that represents the immutable data of an asset;
- M is a key-value array representing asset or transaction metadata;

## How to use
Import the package in your .JCM project file
```
mas yourJaCaMoProject {
    ...
    uses package: velluscinum "com.github.chon-group:velluscinum-jcm:0.9-rc"
}
```
## Examples
+   [Hello Vellus](https://github.com/chon-group/velluscinum-jcm/tree/main/examples/01-hello-vellus)
+   [The Chef and the Glutton](https://github.com/chon-group/velluscinum-jcm/tree/main/examples/02-chef-glutton)
+   [Building a House](https://github.com/chon-group/velluscinum-jcm/tree/main/examples/03-house-building)

