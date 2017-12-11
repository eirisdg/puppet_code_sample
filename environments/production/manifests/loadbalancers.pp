# Convertimos Nodo4 en un proxy de balanceo
# Usamos el paquete HAPROXY, indicamos el nombre del balanceador, y definimos los balanceadores.

node 'puppetnode4' {
  include role::lb
}
