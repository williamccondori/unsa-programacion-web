 #!/usr/bin/env perl

$radio_circulo_mayor; # Radio del circulo mayor.
$radiio_circulo_menor; # Radio del circulo menor.
$totcir; # Total de circulos a evaluar.

mostrar_ventana("Ingrese el radio del circulo mayor: ");
$radio_circulo_mayor = readline(STDIN);
mostrar_ventana("Ingrese el radio del circulo menor: ");
$radiio_circulo_menor = readline(STDIN);
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

	$resultado = evaluar_circulo($radio_circulo_mayor, $radiio_circulo_menor,$dcp, $rad);

	if($resultado)
	{
		$totcirok++;
	}
}

mostrar_ventana("Resultados");
mostrar_ventana("**********");
mostrar_ventana("Número total de circulos: $totcirok");

sub evaluar_circulo(){
	my $radio_circulo_mayor = shift;
	my $radiio_circulo_menor = shift;
	my $dishipo = shift;
	my $rad = shift;
	my $esdentro = 1;

	$radio_circulo_mayor = $radio_circulo_mayor + 0;
	$radiio_circulo_menor = $radiio_circulo_menor + 0;
	my $dismayor = $dishipo + $rad;
	my $dismenor = $dishipo - $rad;
	mostrar_ventana("------------------------------------------------------");

	mostrar_ventana("Distancia máxima: $radio_circulo_mayor");
	mostrar_ventana("Distancia mínima: $radiio_circulo_menor");
	mostrar_ventana("Distancia del punto (0,0) al centro del círculo actual: $dishipo");
	mostrar_ventana("Distancia del punto (0,0) al diámetro más lejano del círculo actual: $dismayor");
	mostrar_ventana("Distancia del punto (0,0) al diámetro más cercano del círculo actual: $dismenor");
	
	if($dismayor > $radio_circulo_mayor)
	{
		mostrar_ventana("** El círculo sobrepasa los valores del círculo externo.");
		$esdentro = 0;
	}

	if($dismenor < $radiio_circulo_menor)
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
