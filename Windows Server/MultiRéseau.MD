__________________________________________________________________________________________________________________________________________
## <p align=center>**Mise en place de l'environnement**</align>

__________________________________________________________________________________________________________________________________________
### **I. Présentation de la configuration Réseau**:

````
- L'environnement sera composé de deux réseaux distinct avec un DHCP et DNS distinct.

- Un Windows Server 2016 pour le réseau Virtuel qui aura comme rôle le serveur WINS.

- Un serveur Linux ayant les services WSD, Samba (Prise en charge Wins)

> Des partages seront créer.
````


#### Information sur les Réseaux:
````
  1. Un réseau Physique en CIDR: 192.168.1.0/24
  
  2. Un réseau Virtuel  en CIDR: 192.168.10.0/24
````

 #### Information sur les Paserelle:
````
  1. La passerelle du réseau physique à comme adresse IP: 192.168.1.1
  
  2. La passerelle du réseau Virtuel  à comme adresse IP: 192.168.10.1
````
__________________________________________________________________________________________________________________________________________


____
#### **Windows Serveur 2016**
````
WINS:
C'est un système de centralisation dynamique des listes des noms des machines: 
 - On dit aux ordinateurs du réseau d'aller inscrire leur nom au serveur Wins
 - Lorsqu'on a besoin de résoudre un nom NetBIOS en adresse IP, on demande au serveur WINS.
 - C'est un système qui permet de limiter grandement les diffusions et permet en plus de fonctionner en environnement routé.
````
