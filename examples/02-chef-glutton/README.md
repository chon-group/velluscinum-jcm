## The Chef and the Glutton

### Importing the JaCaMo Project
```sh
nilson@local2:~$ git clone https://github.com/chon-group/velluscinum-jcm.git
Cloning into 'velluscinum-jcm'...

nilson@local2:~$ cd velluscinum-jcm/examples/02-chef-glutton/
```

### Importing Deps
```sh
nilson@local2:~/velluscinum-jcm/examples/02-chef-glutton$ ./gradlew buildJCMDeps

> Task :buildJCMDeps
reading from file chef_glutton.jcm ...
file chef_glutton.jcm parsed successfully!

JCM packages dependencies updated at .jcm-deps.gradle
```

### Run

```sh
nilson@local2:~/velluscinum-jcm/examples/02-chef-glutton$ ./gradlew run
```
![Captura de tela de 2023-05-31 11-25-07](https://github.com/chon-group/velluscinum-jcm/assets/32855001/e41f6d0e-b52e-4a21-9f7c-8a9dedac38f5)
