% HECHOS: producto(Nombre, Categoria, PrecioBase)

producto(laptop_hp, electronica, 800).
producto(silla_gamer, muebles, 150).
producto(monitor_4k, electronica, 300).
producto(mesa_comedor, muebles, 450).
producto(lampara_led, iluminacion, 30).

en_oferta(muebles, 0.20).
en_oferta(iluminacion, 0.10).


% REGLAS

% PrecioBase <= $200
producto_barato(Nombre) :-
  producto(Nombre, X, Pb),
  Pb < 200.

precio_con_descuento(Nombre, P) :-
  producto(Nombre,Cat,Pb),
  en_oferta(Cat,Desc),
  P = (Pb * Desc).
  

% main
:- initialization(main).
main:- 

write('Es barata la Silla Gamer?'),
  (
    producto_barato(silla_gamer)
    ->
    write(' Si')
    ;
    write(' No')
    ),
    nl,

write('Es barata la Lampara Led?'),
  (
    producto_barato(lampara_led)
    ->
    write(' Si')
    ;
    write(' No')
    ),
    nl,

write('Es barata la Laptop HP?'),
  (
    producto_barato(laptop_hp)
    ->
    write(' Si')
    ;
    write(' No')
    ),
    nl,
    
write('Queda en descuento la Mesa de Comedor?'),
  (
    precio_con_descuento(mesa_comedor, P)
    ->
    write(P)
    ;
    write(' No')
    ),
    nl,

halt(0).
