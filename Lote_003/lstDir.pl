opendir(estedir,"c:\_Profissional");
@todosArquivos = readdir estedir;
closedir estedir;
print "@todosArquivos\n";