use Tk;


my $janela = MainWindow->new;#creiamos a janela principal
$janela->minsize(qw(350 150));#O tamanho minimo
$janela->title("Exemplo");#titulo da janela
$janela->Label(-text=>"Ola Mundo")->pack;#creiamos um label
$janela->Button(-text=> "Sair",-command => sub{exit})->pack(-side=>'bottom',-expand=>1,-ipadx => 10,-ipady => 20);#creiamos um botão para sair


MainLoop();


