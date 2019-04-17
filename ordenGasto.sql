/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     25/3/2019 10:05:04                           */
/*==============================================================*/


drop trigger TIB_SIG_MANTENIMIENTO on SIG_MANTENIMIENTO;

drop table SIG_CERTIFICADO_PRESUPUESTARIO;

drop table SIG_CONTRATO;

drop table SIG_DATOS_EMPLEADOS;

drop table SIG_DETALLE_CALCULO;

drop table SIG_DETALLE_PAGO;

drop table SIG_HISTORIAL_EMPLEADO;

drop table SIG_LOGIN;

drop table SIG_MANTENIMIENTO;

drop table SIG_ORDEN_GASTO;

drop table SIG_PROVEEDOR;

/*==============================================================*/
/* Table: SIG_CERTIFICADO_PRESUPUESTARIO                        */
/*==============================================================*/
create table SIG_CERTIFICADO_PRESUPUESTARIO (
   CEPRE_NUMERO_CERTIFICADO integer              not null,
   CONT_ID_CONTRATO     integer              null,
   MANT_NUMERO_MANTENIMI integer              not null,
   CEPRE_VALOR          decimal              null,
   CEPRE_OBJETO         varchar(200)         null,
   CEPRE_CODIGO_PRESUPUESTARIO integer              null,
   CEPRE_DESCRIPCION    character(100)       null,
   CEPRE_RUC            integer              null,
   constraint PK_SIG_CERTIFICADO_PRESUPUESTA primary key (CEPRE_NUMERO_CERTIFICADO)
);

/*==============================================================*/
/* Table: SIG_CONTRATO                                          */
/*==============================================================*/
create table SIG_CONTRATO (
   CONT_ID_CONTRATO     integer              not null,
   CONT_RUC             integer              null,
   CONT_TIPO_CONTRATO   character(50)        null,
   CONT_NUMERO_CONTRATO character(50)        null,
   CONT_FECHA           date                 null,
   CONT_PLAZO           character(255)       null,
   CONT_GARANTIA_TECNICO date                 null,
   CONT_ATMINISTRACION  character(50)        null,
   CONT_TECNICO         character(50)        null,
   CONT_PRECIO          decimal              null,
   CONT_MODO_PAGO       character(50)        null,
   CONT_FECHA_INI       date                 null,
   CONT_FECHA_FIN       date                 null,
   CONT_MANTENIMIENTO   character(50)        null,
   CONT_FECHA_INI_MAN   date                 null,
   CONT_FECHA_FIN_MAN   date                 null,
   CONT_OBJETO          character(50)        null,
   CONT_FECHA_ACTUALIZACION_DEFINI date                 null,
   constraint PK_SIG_CONTRATO primary key (CONT_ID_CONTRATO)
);

/*==============================================================*/
/* Table: SIG_DATOS_EMPLEADOS                                   */
/*==============================================================*/
create table SIG_DATOS_EMPLEADOS (
   DATEMP_C_I           integer              not null,
   DATEMP_NOMBRE        character(50)        null,
   DATEMP_CARGO         character(100)       null,
   DATEMP_ORDEN_COSTOS  integer              null,
   DATEMP_RESPONSABLE   character(50)        null,
   DATEMP_FECHA_HORA_INI timestamp            null,
   DATEMP_FECHA_HORA_FIN timestamp            null,
   DATEMP_CORREO        character(100)       null,
   DATEMP_EMP_MODIFICACION character(128)            null,
   DATEMP_FECHA_MODI    timestamp            null,
   constraint PK_SIG_DATOS_EMPLEADOS primary key (DATEMP_C_I)
);

/*==============================================================*/
/* Table: SIG_DETALLE_CALCULO                                   */
/*==============================================================*/
create table SIG_DETALLE_CALCULO (
   DETCAL_NUMERO_DETALLE integer              not null,
   ORDGA_NUMERO_ORDEN   integer              null,
   DETCAL_VALOR         decimal              null,
   constraint PK_SIG_DETALLE_CALCULO primary key (DETCAL_NUMERO_DETALLE)
);

/*==============================================================*/
/* Table: SIG_DETALLE_PAGO                                      */
/*==============================================================*/
create table SIG_DETALLE_PAGO (
   DEPA_ID_DETALLE      integer              not null,
   DEPA_ID_CONTRATO     integer              null,
   DEPA_ORDEN           character(50)        null,
   constraint PK_SIG_DETALLE_PAGO primary key (DEPA_ID_DETALLE)
);

/*==============================================================*/
/* Table: SIG_HISTORIAL_EMPLEADO                                */
/*==============================================================*/
create table SIG_HISTORIAL_EMPLEADO (
   DETEMP_ID_EMP        integer                 not null,
   DATEMP_C_I           integer              null,
   DETEMP_MODIFICACION  CHAR(50)             null,
   constraint PK_SIG_HISTORIAL_EMPLEADO primary key (DETEMP_ID_EMP)
);

/*==============================================================*/
/* Table: SIG_LOGIN                                             */
/*==============================================================*/
create table SIG_LOGIN (
   LOG_USUARIO          integer              not null,
   DATEMP_C_I           integer              null,
   LOG_COMTRASENA       character(50)        null,
   constraint PK_SIG_LOGIN primary key (LOG_USUARIO)
);

/*==============================================================*/
/* Table: SIG_MANTENIMIENTO                                     */
/*==============================================================*/
create table SIG_MANTENIMIENTO (
   MANT_NUMERO_MANTENIMI integer              not null,
   CONT_ID_CONTRATO     integer              null,
   MANT_FECHA           date                 null,
   MANT_VALOR           decimal              null,
   MANT_FECHA_PAGO      decimal              null,
   MANT_IVA             decimal              null,
   MANT_RUC             integer              null,
   MANT_INFORMACION     character(50)        null,
   constraint PK_SIG_MANTENIMIENTO primary key (MANT_NUMERO_MANTENIMI)
);

/*==============================================================*/
/* Table: SIG_ORDEN_GASTO                                       */
/*==============================================================*/
create table SIG_ORDEN_GASTO (
   ORDGA_NUMERO_ORDEN   integer              not null,
   DATEMP_C_I           integer              null,
   CEPRE_NUMERO_CERTIFICADO integer              null,
   CONT_ID_CONTRATO     integer              null,
   ORDGA_FECHA_ORDEN_GASTO date                 null,
   ORDGA_CONTRATO       character(50)        null,
   ORDGA_PRECIO_UNITARIO decimal              null,
   ORDGA_SUBTOTAL       decimal              null,
   ORDGA_IVA            decimal              null,
   ORDGA_OTRO_IMPUESTO  decimal              null,
   ORDGA_TOTAL          decimal              null,
   ORDGA_CODIGO_PRESUPUESTARIO integer              null,
   ORDGA_DESCRIPCION    character(100)       null,
   ORDGA_VALOR_CERTIFICADO decimal              null,
   ORDGAGASTO_AFECTUAR  decimal              null,
   ORDGA_SALDO          decimal              null,
   ORDGA_RUC            integer              null,
   ORDGA_TIPO_PAGO      character(50)        null,
   ORDGA_MESES_ACUMULABLES character(50)        null,
   constraint PK_SIG_ORDEN_GASTO primary key (ORDGA_NUMERO_ORDEN)
);

/*==============================================================*/
/* Table: SIG_PROVEEDOR                                         */
/*==============================================================*/
create table SIG_PROVEEDOR (
   PRO_RUC              integer              not null,
   PRO_NOMBRE           character(50)        null,
   PRO_TELEFONO         integer              null,
   PRO_CONTACTO         character(255)       null,
   PRO_CONTACTO_DATO    character(50)        null,
   PRO_CONTACTO_EMAIL   character(50)        null,
   constraint PK_SIG_PROVEEDOR primary key (PRO_RUC)
);

alter table SIG_CERTIFICADO_PRESUPUESTARIO
   add constraint FK_SIG_CERT_REFERENCE_SIG_CONT foreign key (CONT_ID_CONTRATO)
      references SIG_CONTRATO (CONT_ID_CONTRATO)
      on delete restrict on update restrict;

alter table SIG_CERTIFICADO_PRESUPUESTARIO
   add constraint SIG_CERT_REFERENCE_SIG_MANT foreign key (MANT_NUMERO_MANTENIMI)
      references SIG_MANTENIMIENTO (MANT_NUMERO_MANTENIMI)
      on delete restrict on update restrict;

alter table SIG_CONTRATO
   add constraint FK_SIG_CONT_REFERENCE_SIG_PROV foreign key (CONT_RUC)
      references SIG_PROVEEDOR (PRO_RUC)
      on delete restrict on update restrict;

alter table SIG_DETALLE_CALCULO
   add constraint FK_SIG_DETA_REFERENCE_SIG_ORDE foreign key (ORDGA_NUMERO_ORDEN)
      references SIG_ORDEN_GASTO (ORDGA_NUMERO_ORDEN)
      on delete restrict on update restrict;

alter table SIG_DETALLE_PAGO
   add constraint FK_SIG_DETA_REFERENCE_SIG_CONT foreign key (DEPA_ID_CONTRATO)
      references SIG_CONTRATO (CONT_ID_CONTRATO)
      on delete restrict on update restrict;

alter table SIG_HISTORIAL_EMPLEADO
   add constraint FK_SIG_HIST_REFERENCE_SIG_DATO foreign key (DATEMP_C_I)
      references SIG_DATOS_EMPLEADOS (DATEMP_C_I)
      on delete restrict on update restrict;

alter table SIG_LOGIN
   add constraint FK_SIG_LOGI_REFERENCE_SIG_DATO foreign key (DATEMP_C_I)
      references SIG_DATOS_EMPLEADOS (DATEMP_C_I)
      on delete restrict on update restrict;

alter table SIG_MANTENIMIENTO
   add constraint FK_SIG_MANT_REFERENCE_SIG_CONT foreign key (CONT_ID_CONTRATO)
      references SIG_CONTRATO (CONT_ID_CONTRATO)
      on delete restrict on update restrict;

alter table SIG_ORDEN_GASTO
   add constraint FK_SIG_ORDE_REFERENCE_SIG_DATO foreign key (DATEMP_C_I)
      references SIG_DATOS_EMPLEADOS (DATEMP_C_I)
      on delete restrict on update restrict;

alter table SIG_ORDEN_GASTO
   add constraint FK_SIG_ORDE_REFERENCE_SIG_CONT foreign key (CONT_ID_CONTRATO)
      references SIG_CONTRATO (CONT_ID_CONTRATO)
      on delete restrict on update restrict;

alter table SIG_ORDEN_GASTO
   add constraint FK_SIG_ORDE_REFERENCE_SIG_CERT foreign key (CEPRE_NUMERO_CERTIFICADO)
      references SIG_CERTIFICADO_PRESUPUESTARIO (CEPRE_NUMERO_CERTIFICADO)
      on delete restrict on update restrict;

