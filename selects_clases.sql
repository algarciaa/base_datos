select * 
from tienda.cliente;


select c.*
from tienda.cliente c
where c.tipo_identificacion = 'CEDULA';

select c.*
from tienda.cliente c
where c.tipo_identificacion != 'CEDULA';

select c.*
from tienda.cliente c
where c.tipo_identificacion IN ('PASAPORTE', 'RUC');


select tp.*
from tienda.tipo_producto tp;

select p.*
from tienda.producto p;

select tp.id_tipo_producto,
       tp.descripcion as descripcion_tipo_producto,
       p.id_producto,
       p.descripcion as descripcion_producto 
from tienda.tipo_producto tp
     inner join tienda.producto p
     on tp.id_tipo_producto = p.id_tipo_producto;


select pro.id_proveedor,
       pro.nombre as nombre_proveedor,
       tp.id_tipo_producto,
       tp.nombre "nombre_tipo_producto",
       p.id_producto,
       p.nombre nombre_producto
from tienda.producto p
     inner join tienda.tipo_producto tp
     on p.id_tipo_producto = tp.id_tipo_producto
     inner join tienda.proveedor pro
     on p.id_proveedor = pro.id_proveedor;


select f.id_factura,
       df.id_producto,
       p.id_producto,
       p.nombre
from tienda.factura f
     inner join tienda.detalle_factura df 
     on f.id_factura = df.id_factura
     inner join tienda.producto p
     on df.id_producto = p.id_producto 
where f.id_factura = 1;
