for i in `find -type f`
  do
        echo -e "`basename $i`\t`dirname $i`"
  done|sort|
  awk {
        file[NR]=$1
        dir[NR]=$2
  }#Armazena todos os arquivos e diretorios em arrays
 
  END {
        j=1
        for (i=1;i<NR;i++) {
                if (file[i]==file[i+1]) {
                        //del_files[j]=dir[i+1]"/"file[i+1]
                        system("rm "dir[i+1]"/"file[i+1])
                        j++
                }#Localiza as replicas, inseri-as em array e remove-as
        }
 
        if (j==1) print "Não existe réplica de arquivo!"
        else {
                print "Arquivos removidos:"
                for (k=1;k<=j;k++) print del_files[k]
        }#Imprime as replicas removidas
  }