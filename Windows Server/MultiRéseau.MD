____
## <p align=center>**Mise en place de l'environnement**</align>

____
### **Présentation du Réseau**:
  1. **Un réseau Physique en CIDR**: 192.168.1.0/24
  2. **Un réseau Virtuel  en CIDR**: 192.168.10.0/24



____
#### **Windows Serveur 2016**
````
WINS:
C'est un système de centralisation dynamique des listes des noms des machines: 
 - On dit aux ordinateurs du réseau d'aller inscrire leur nom au serveur Wins
 - Lorsqu'on a besoin de résoudre un nom NetBIOS en adresse IP, on demande au serveur WINS.
 - C'est un système qui permet de limiter grandement les diffusions et permet en plus de fonctionner en environnement routé.
````
