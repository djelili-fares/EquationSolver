# Normes de Développement en C et C++ Embarqué et Outils Open Source

## Introduction

Le développement embarqué en C et C++ est crucial pour les systèmes où la performance, la fiabilité et la sécurité sont primordiales. Pour garantir que le code respecte ces critères, plusieurs normes ont été établies. Ce document présente les normes les plus utilisées dans le développement embarqué en C et C++ ainsi que les outils open source pour les vérifier.

## Normes de Développement en C et C++ Embarqué

### 1. MISRA (Motor Industry Software Reliability Association)

#### **Description**
La norme MISRA (Motor Industry Software Reliability Association) est une série de directives pour le développement de logiciels en C et C++. Initialement conçue pour l'industrie automobile, elle est maintenant utilisée dans divers domaines de systèmes embarqués pour améliorer la sécurité, la fiabilité et la maintenabilité du code.

#### **Directives Principales**
- **MISRA C** : Concentre sur les restrictions de l'utilisation du langage C pour éviter les comportements indéfinis et les erreurs courantes.
- **MISRA C++** : Semblable à MISRA C, mais pour le langage C++.

#### **Outils Open Source**
- **Cppcheck** : Outil d'analyse statique qui peut être configuré pour vérifier la conformité MISRA.
- **Clang-Tidy** : Analyseur de code intégré à Clang qui propose des vérifications MISRA.

### 2. CERT C/C++

#### **Description**
Le CERT C et CERT C++ sont des normes de codage développées par le Software Engineering Institute (SEI) pour améliorer la sécurité et la sûreté des applications C et C++.

#### **Directives Principales**
- **CERT C** : Fournit des règles et des recommandations pour écrire un code C sécurisé.
- **CERT C++** : Fournit des règles et des recommandations pour écrire un code C++ sécurisé.

#### **Outils Open Source**
- **Cppcheck** : Peut également être utilisé pour vérifier certaines règles CERT.
- **Clang-Tidy** : Supporte les vérifications CERT pour C et C++.

### 3. ISO/IEC 9899:2018 (C18) et ISO/IEC 14882:2017 (C++17)

#### **Description**
Les normes ISO pour les langages C et C++ définissent les spécifications du langage, y compris la syntaxe et les bibliothèques standard. Bien que ces normes soient principalement des spécifications de langage, elles incluent également des directives de bonnes pratiques.

#### **Directives Principales**
- **ISO C** : La norme la plus récente est C18.
- **ISO C++** : La norme la plus récente est C++17.

#### **Outils Open Source**
- **GCC (GNU Compiler Collection)** : Compile le code selon les normes ISO et peut activer des avertissements de conformité.
- **Clang** : Compilateur qui suit les normes ISO et fournit des avertissements et des erreurs de conformité.

## Outils Open Source pour la Vérification de la Conformité

### 1. Cppcheck

**Description** : Cppcheck est un outil d'analyse statique qui détecte les erreurs dans le code C et C++. Il peut être configuré pour vérifier la conformité aux normes comme MISRA et CERT.

**Utilisation** :
```sh
cppcheck --enable=all --std=c99 --language=c path/to/your/c/code
cppcheck --enable=all --std=c++14 --language=c++ path/to/your/cpp/code


### 2.Clang-Tidy
Description : Clang-Tidy est un outil d'analyse de code statique basé sur Clang qui fournit des diagnostics pour améliorer la qualité du code. Il supporte les vérifications MISRA et CERT.
Utilisation :
clang-tidy -checks="cert-*,misra-*" path/to/your/code.cpp


### 3. GCC (GNU Compiler Collection)
Description : GCC est un compilateur qui supporte de nombreuses normes C et C++. Il peut générer des avertissements et des erreurs de conformité.

Utilisation :
gcc -Wall -Wextra -pedantic -std=c99 path/to/your/code.c
g++ -Wall -Wextra -pedantic -std=c++14 path/to/your/code.cpp


### 4. Clang
Description : Clang est un compilateur qui suit strictement les normes ISO pour C et C++. Il fournit des diagnostics détaillés et des erreurs de conformité.

Utilisation :
clang -Wall -Wextra -pedantic -std=c99 path/to/your/code.c
clang++ -Wall -Wextra -pedantic -std=c++14 path/to/your/code.cpp

Conclusion
La conformité aux normes de développement est essentielle pour garantir la qualité, la sécurité et la fiabilité des systèmes embarqués. En utilisant des outils open source comme Cppcheck, Clang-Tidy, GCC et Clang, les développeurs peuvent assurer que leur code respecte les normes telles que MISRA, CERT, et ISO. Intégrer ces outils dans un pipeline de CI/CD permet d'automatiser ces vérifications et d'améliorer continuellement la qualité du code.

//*************************************************************************//
//*************************************************************************//

Pour assurer que les différents codes sources de votre application EquationSolver sont conformes aux normes, je recommande d'appliquer la norme MISRA (Motor Industry Software Reliability Association) car elle est largement utilisée dans les systèmes embarqués et est reconnue pour ses directives strictes qui améliorent la sécurité, la fiabilité et la maintenabilité du code.

Application de la Norme MISRA
Choix de la norme:
MISRA C : Pour votre code C.
MISRA C++ : Pour votre code C++.
Étapes pour vérifier la conformité à la norme MISRA
Installer les Outils d'Analyse Statique :

Cppcheck : Un outil open source d'analyse statique qui peut vérifier la conformité MISRA avec des configurations appropriées.
Clang-Tidy : Un autre outil puissant qui supporte les vérifications MISRA.
Configurer les Outils :

Configurer Cppcheck pour vérifier les règles MISRA.
Configurer Clang-Tidy pour activer les vérifications MISRA.
Utilisation de Cppcheck pour vérifier la conformité MISRA
Installation de Cppcheck :

sh
Copier le code
sudo apt-get install cppcheck
Configuration et Exécution de Cppcheck pour MISRA C et C++ :

Créez un fichier de configuration pour spécifier les règles MISRA.

cppcheck_config.xml
xml
Copier le code
<rules>
    <rule ref="misra-c2012-*" />
    <rule ref="misra-cpp2008-*" />
</rules>
Exécutez Cppcheck avec la configuration MISRA :

sh
Copier le code
cppcheck --enable=all --std=c99 --language=c --rule-file=cppcheck_config.xml path/to/your/c/code
cppcheck --enable=all --std=c++14 --language=c++ --rule-file=cppcheck_config.xml path/to/your/cpp/code
Utilisation de Clang-Tidy pour vérifier la conformité MISRA
Installation de Clang-Tidy :

sh
Copier le code
sudo apt-get install clang-tidy
Configuration et Exécution de Clang-Tidy pour MISRA C et C++ :

Exécutez Clang-Tidy avec les vérifications MISRA :
sh
Copier le code
clang-tidy -checks="misc-*,readability-*,performance-*,cppcoreguidelines-*,modernize-*,misra-c*" path/to/your/code.c -- -Ipath/to/include
clang-tidy -checks="misc-*,readability-*,performance-*,cppcoreguidelines-*,modernize-*,misra-cpp*" path/to/your/code.cpp -- -Ipath/to/include


// Pourquoi utiliser les deux outils ?
*** Cppcheck est spécialisé dans la détection des erreurs de logique et des problèmes potentiels de sécurité.
*** Clang-Tidy fournit des vérifications supplémentaires de style de code et des suggestions de refactoring.
En utilisant les deux outils, vous bénéficiez d'une couverture plus complète des types de problèmes potentiels dans votre code.


//*************************************************************************//
//*************************************************************************//
//*************************************************************************//
//*************************************************************************//

Installation de Cppcheck
Pour installer Cppcheck, vous pouvez utiliser les gestionnaires de paquets appropriés pour votre système d'exploitation.
    sudo apt-get install cppcheck
