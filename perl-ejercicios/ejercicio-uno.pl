 #!/usr/bin/env perl

$rdmayor; # Radio del circulo mayor.
$rdmenor; # Radio del circulo menor.
$totcir; # Total de circulos a evaluar.

mostrar_ventana("Ingrese el radio del circulo mayor: ");
$rdmayor = readline(STDIN);
mostrar_ventana("Ingrese el radio del circulo menor: ");
$rdmenor = readline(STDIN);
mostrar_ventana("Ingrese la cantidad de circulos: ");
$totcir = readline(STDIN);

$totcirok = 0; # Total de circulos validos

for(my $i = 0; $i < $totcir; $i++)
{
    mostrar_ventana("Circulo: ". ($i + 1));
    mostrar_ventana("----------");

	mostrar_ventana("Ingrese la pocision en X: ");
	$posx = readline(STDIN);
	mostrar_ventana("Ingrese la pocision en Y; ");
	$posy = readline(STDIN);
	mostrar_ventana("Ingrese el radio del circulo: ");
	$rad = readline(STDIN);

	$dcp; # Distancia del centro al punto.
	$dtotal; # Distancia del centro al diametro.
	$dcp = sqrt(($posx ** 2) + ($posy ** 2));

	$resultado = evaluar_circulo($rdmayor, $rdmenor,$dcp, $rad);

	if($resultado)
	{
		$totcirok++;
	}
}

mostrar_ventana("Resultados");
mostrar_ventana("**********");
mostrar_ventana("Número total de circulos: $totcirok");

sub evaluar_circulo(){
	my $rdmayor = shift;
	my $rdmenor = shift;
	my $dishipo = shift;
	my $rad = shift;
	my $esdentro = 1;

	$rdmayor = $rdmayor + 0;
	$rdmenor = $rdmenor + 0;
	my $dismayor = $dishipo + $rad;
	my $dismenor = $dishipo - $rad;
	mostrar_ventana("------------------------------------------------------");

	mostrar_ventana("Distancia máxima: $rdmayor");
	mostrar_ventana("Distancia mínima: $rdmenor");
	mostrar_ventana("Distancia del punto (0,0) al centro del círculo actual: $dishipo");
	mostrar_ventana("Distancia del punto (0,0) al diámetro más lejano del círculo actual: $dismayor");
	mostrar_ventana("Distancia del punto (0,0) al diámetro más cercano del círculo actual: $dismenor");
	
	if($dismayor > $rdmayor)
	{
		mostrar_ventana("** El círculo sobrepasa los valores del círculo externo.");
		$esdentro = 0;
	}

	if($dismenor < $rdmenor)
	{
		mostrar_ventana("** El círculo sobrepasa los valores del circulo interno.");
		$esdentro = 0;
	}

	mostrar_ventana("Resultado de la evaluación: ". $esdentro);
	mostrar_ventana("------------------------------------------------------");

	return $esdentro;
}

sub mostrar_ventana()
{
	my $mensaje = shift;
	print $mensaje. "\n";
}
