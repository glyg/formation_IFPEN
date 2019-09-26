- thermo_region0.out : fichier typique de sorties temporelles du code CFD. Le
  header suit toujours ce format. On trace en général une variable (par exemple
  la pression) en fonction de la 1ère colonne, "Crank"

- notebook pandas : contient les commandes pandas un peu typiques et utiles.
  Montre l'utilisation typique des fichiers temporaux.

- dossier SOLUTION3D : contient 1 solution 3D sous 2 formats, colonnes ASCII
  et paraview. Certains collègues utilisent directement les sorties colonnes
  ASCII pour en tirer des statistiques (par ex. en ne considérant qu'un
  sous-ensemble d'intérêt du domaine). On passe en général par un logiciel
  spécifique (ensight, paraview), pour visualiser les données et/ou scripter des
  post-traitements.
