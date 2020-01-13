

my $janela = MainWindow->new;#creiamos a janela principal
$janela->minsize(qw(350 150));#O tamanho minimo
$janela->title("Exemplo");#titulo da janela
$janela->Label(-text=>"Ola Mundo")->pack;#creiamos um label
$janela->Button(-text=> "Sair",-command => sub{exit})->pack(-side=>'bottom',-expand=>1);#creiamos um botão para sair

$janela->Label(-text=>"Enter name:")->pack;#creiamos um label
$janela->Button(-text=> "Push Me",-command =>  proc{push_button});

proc push_button{} {
	.ent insert "Hello "
}



MainLoop();


