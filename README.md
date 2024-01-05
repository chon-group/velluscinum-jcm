# Velluscinum for JaCaMo
[![](https://jitpack.io/v/chon-group/velluscinum-jcm.svg)](https://jitpack.io/#chon-group/velluscinum-jcm)

This project presents a Multi-agent Systems (MAS) approach that can use digital assets as a factor of agreement in the relationship between cognitive agents using the Belief-Desire-Intention model. Adopting Distributed Ledger Technologies (DLT) technologies in MAS can facilitate the agreement between agents, taking what is registered in the Ledger as accurate, and also can be helpful to manage trust relationships, open MAS, and distributed scenarios. 

The Velluscinum JaCaMo Package extends the [jacamo-lang](https://github.com/jacamo-lang/jacamo) through integration with [BigchainDB](https://github.com/bigchaindb/bigchaindb), providing new internal actions to enable the use of digital assets to support the relationship between intelligent agents.
The actions offered by the middleware are available directly to the dimension of the agents that populate the MAS. They bridge the [Multi-agent Oriented Programming (MAOP) paradigm](https://doi.org/10.1016/j.scico.2011.10.004) and the [BigchainDB communication driver](https://github.com/bigchaindb/java-bigchaindb-driver). In this way, intelligent agents can create or transfer digital assets, stamp transactions or manage their wallets on the DLT directly from their dimension.


![schema2](https://github.com/chon-group/velluscinum-jcm/assets/32855001/aac47021-2c88-439b-b6cc-bccd2d48a355)


## The _Internal Actions_ provided by the middleware
- velluscinum.buildWallet(w) - generates a digital wallet and returns the belief +w(P,Q);
- velluscinum.deployNFT(S,P,Q,I,M,b) - registers an asset and returns the belief +b(A);
- velluscinum.transferNFT(S,P,Q,A,R,M,b) - transfer an asset and returns +b(T);
- velluscinum.deployToken(S,P,Q,I,V,b) - creates V units from an asset, returns +b(C);
- velluscinum.transferToken(S,P,Q,C,R,V,b) - transfer V units of C and returns +b(T);
- velluscinum.stampTransaction(S,P,Q,T) - stamps a transaction (T);
- velluscinum.tokenBalance(S,P,Q,C,q) - check the wallet Q and return +q(C,V).

Where:
- ___b___ is a belief that represents a result of an operation in DLT;
- ___w___ is a belief that represents an agent's wallet;
- ___q___ is a belief that represents the balance of C in the agent's wallet.
- ___A___ is a literal that represents a indivisible asset;
- ___C___ is a literal that represents a divisible asset;
- ___P___ e Q are literals that represent the agent's key pair;
- ___R___ is a literal that represents the public key of a recipient agent;
- ___S___ is a literal that represents the address of a DLT node;
- ___T___ is a literal that represents a transaction performed in the DTL;
- ___V___ is a literal that represents the number of parts of a C;
- ___I___ is a key-value array that represents the immutable data of an asset;
- ___M___ is a key-value array representing asset or transaction metadata;

### How to import?
Import the package in your _.JCM_ project file

```
mas yourJaCaMoProject {
    ...
    uses package: velluscinum "com.github.chon-group:velluscinum-jcm:0.9-rc"
    ...
}
```

## EXAMPLES
+   [Hello Vellus](examples/01-hello-vellus)
+   [The Chef and the Glutton](examples/02-chef-glutton)
+   [Building a House](examples/03-house-building)



## COPYRIGHT
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />Velluscinum is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>. The licensor cannot revoke these freedoms as long as you follow the license terms:

* __Attribution__ — You must give __appropriate credit__ like below:

Mori Lazarin, N., Machado Coelho, I., Pantoja, C.E., Viterbo, J. (2023). Velluscinum: A Middleware for Using Digital Assets in Multi-agent Systems. In: Mathieu, P., Dignum, F., Novais, P., De la Prieta, F. (eds) Advances in Practical Applications of Agents, Multi-Agent Systems, and Cognitive Mimetics. The PAAMS Collection. PAAMS 2023. Lecture Notes in Computer Science(), vol 13955. Springer, Cham. DOI: [https://doi.org/10.1007/978-3-031-37616-0_17](https://www.researchgate.net/publication/372282299_Velluscinum_A_Middleware_for_Using_Digital_Assets_in_Multi-agent_Systems)

### How to cite?
<details>
<summary> BibTeX Format </summary>

```
@InProceedings{velluscinum,
author="Mori Lazarin, Nilson
and Machado Coelho, Igor
and Pantoja, Carlos Eduardo
and Viterbo, Jos{\'e}",
editor="Mathieu, Philippe
and Dignum, Frank
and Novais, Paulo
and De la Prieta, Fernando",
title="{Velluscinum: A Middleware for Using Digital Assets in Multi-agent Systems}",
doi="10.1007/978-3-031-37616-0_17",
booktitle="Advances in Practical Applications of Agents, Multi-Agent Systems, and Cognitive Mimetics. The PAAMS Collection",
year="2023",
publisher="Springer Nature Switzerland",
address="Cham",
pages="200--212",
isbn="978-3-031-37616-0"
}
```

</details>