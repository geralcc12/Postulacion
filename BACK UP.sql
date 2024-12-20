PGDMP  .    5                |            ACME    17.2    17.2 (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    ACME    DATABASE     y   CREATE DATABASE "ACME" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "ACME";
                     postgres    false            �            1259    16549    asignacion_territorio    TABLE     �   CREATE TABLE public.asignacion_territorio (
    asignacion_id integer NOT NULL,
    vendedor_id integer NOT NULL,
    territorio_id integer NOT NULL,
    fecha_asignacion date NOT NULL,
    fecha_salida date
);
 )   DROP TABLE public.asignacion_territorio;
       public         heap r       postgres    false            �            1259    16511 	   categoria    TABLE     w   CREATE TABLE public.categoria (
    categoria_id integer NOT NULL,
    nom_categoria character varying(50) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap r       postgres    false            �            1259    16486    cliente    TABLE     �   CREATE TABLE public.cliente (
    cliente_id integer NOT NULL,
    nombre_cliente character varying(255) NOT NULL,
    segmento_id integer NOT NULL
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    16496    locales    TABLE     �   CREATE TABLE public.locales (
    local_id integer NOT NULL,
    nombre_local character varying(255) NOT NULL,
    territorio_id integer NOT NULL,
    cliente_id integer NOT NULL
);
    DROP TABLE public.locales;
       public         heap r       postgres    false            �            1259    16516    producto    TABLE       CREATE TABLE public.producto (
    producto_id integer NOT NULL,
    nom_produc character varying(50) NOT NULL,
    marca character varying(255) NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    comercializador character varying(255),
    categoria_id integer NOT NULL
);
    DROP TABLE public.producto;
       public         heap r       postgres    false            �            1259    16481    segmento    TABLE     u   CREATE TABLE public.segmento (
    segmento_id integer NOT NULL,
    nom_segmento character varying(255) NOT NULL
);
    DROP TABLE public.segmento;
       public         heap r       postgres    false            �            1259    16461 
   territorio    TABLE     z   CREATE TABLE public.territorio (
    territorio_id integer NOT NULL,
    nom_territorio character varying(50) NOT NULL
);
    DROP TABLE public.territorio;
       public         heap r       postgres    false            �            1259    16456    vendedor    TABLE     t   CREATE TABLE public.vendedor (
    vendedor_id integer NOT NULL,
    nom_vendedor character varying(50) NOT NULL
);
    DROP TABLE public.vendedor;
       public         heap r       postgres    false            �            1259    16528    venta    TABLE     [  CREATE TABLE public.venta (
    id integer NOT NULL,
    fecha date NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    total numeric(10,2) GENERATED ALWAYS AS (((cantidad)::numeric * precio_unitario)) STORED,
    cliente_id integer NOT NULL,
    local_id integer NOT NULL
);
    DROP TABLE public.venta;
       public         heap r       postgres    false            �          0    16549    asignacion_territorio 
   TABLE DATA           z   COPY public.asignacion_territorio (asignacion_id, vendedor_id, territorio_id, fecha_asignacion, fecha_salida) FROM stdin;
    public               postgres    false    225   2       �          0    16511 	   categoria 
   TABLE DATA           @   COPY public.categoria (categoria_id, nom_categoria) FROM stdin;
    public               postgres    false    222   h2       �          0    16486    cliente 
   TABLE DATA           J   COPY public.cliente (cliente_id, nombre_cliente, segmento_id) FROM stdin;
    public               postgres    false    220   �2       �          0    16496    locales 
   TABLE DATA           T   COPY public.locales (local_id, nombre_local, territorio_id, cliente_id) FROM stdin;
    public               postgres    false    221   }3       �          0    16516    producto 
   TABLE DATA           r   COPY public.producto (producto_id, nom_produc, marca, precio_unitario, comercializador, categoria_id) FROM stdin;
    public               postgres    false    223   c5       �          0    16481    segmento 
   TABLE DATA           =   COPY public.segmento (segmento_id, nom_segmento) FROM stdin;
    public               postgres    false    219   7       �          0    16461 
   territorio 
   TABLE DATA           C   COPY public.territorio (territorio_id, nom_territorio) FROM stdin;
    public               postgres    false    218   F7       �          0    16456    vendedor 
   TABLE DATA           =   COPY public.vendedor (vendedor_id, nom_vendedor) FROM stdin;
    public               postgres    false    217   �7       �          0    16528    venta 
   TABLE DATA           h   COPY public.venta (id, fecha, producto_id, cantidad, precio_unitario, cliente_id, local_id) FROM stdin;
    public               postgres    false    224   8       R           2606    16553 0   asignacion_territorio asignacion_territorio_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.asignacion_territorio
    ADD CONSTRAINT asignacion_territorio_pkey PRIMARY KEY (asignacion_id);
 Z   ALTER TABLE ONLY public.asignacion_territorio DROP CONSTRAINT asignacion_territorio_pkey;
       public                 postgres    false    225            L           2606    16515    categoria categoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (categoria_id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public                 postgres    false    222            H           2606    16490    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cliente_id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    220            J           2606    16500    locales locales_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_pkey PRIMARY KEY (local_id);
 >   ALTER TABLE ONLY public.locales DROP CONSTRAINT locales_pkey;
       public                 postgres    false    221            N           2606    16522    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (producto_id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public                 postgres    false    223            F           2606    16485    segmento segmento_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.segmento
    ADD CONSTRAINT segmento_pkey PRIMARY KEY (segmento_id);
 @   ALTER TABLE ONLY public.segmento DROP CONSTRAINT segmento_pkey;
       public                 postgres    false    219            D           2606    16465    territorio territorio_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.territorio
    ADD CONSTRAINT territorio_pkey PRIMARY KEY (territorio_id);
 D   ALTER TABLE ONLY public.territorio DROP CONSTRAINT territorio_pkey;
       public                 postgres    false    218            B           2606    16460    vendedor vendedor_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (vendedor_id);
 @   ALTER TABLE ONLY public.vendedor DROP CONSTRAINT vendedor_pkey;
       public                 postgres    false    217            P           2606    16533    venta venta_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_pkey;
       public                 postgres    false    224            Z           2606    16559 >   asignacion_territorio asignacion_territorio_territorio_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_territorio
    ADD CONSTRAINT asignacion_territorio_territorio_id_fkey FOREIGN KEY (territorio_id) REFERENCES public.territorio(territorio_id);
 h   ALTER TABLE ONLY public.asignacion_territorio DROP CONSTRAINT asignacion_territorio_territorio_id_fkey;
       public               postgres    false    4676    218    225            [           2606    16554 <   asignacion_territorio asignacion_territorio_vendedor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion_territorio
    ADD CONSTRAINT asignacion_territorio_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedor(vendedor_id);
 f   ALTER TABLE ONLY public.asignacion_territorio DROP CONSTRAINT asignacion_territorio_vendedor_id_fkey;
       public               postgres    false    4674    217    225            S           2606    16491     cliente cliente_segmento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_segmento_id_fkey FOREIGN KEY (segmento_id) REFERENCES public.segmento(segmento_id);
 J   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_segmento_id_fkey;
       public               postgres    false    219    220    4678            T           2606    16506    locales locales_cliente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.cliente(cliente_id);
 I   ALTER TABLE ONLY public.locales DROP CONSTRAINT locales_cliente_id_fkey;
       public               postgres    false    220    4680    221            U           2606    16501 "   locales locales_territorio_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_territorio_id_fkey FOREIGN KEY (territorio_id) REFERENCES public.territorio(territorio_id);
 L   ALTER TABLE ONLY public.locales DROP CONSTRAINT locales_territorio_id_fkey;
       public               postgres    false    218    221    4676            V           2606    16523 #   producto producto_id_categoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_categoria_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(categoria_id);
 M   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_id_categoria_fkey;
       public               postgres    false    223    222    4684            W           2606    16534    venta venta_cliente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.cliente(cliente_id);
 E   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_cliente_id_fkey;
       public               postgres    false    224    4680    220            X           2606    16544    venta venta_local_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_local_id_fkey FOREIGN KEY (local_id) REFERENCES public.locales(local_id);
 C   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_local_id_fkey;
       public               postgres    false    224    221    4682            Y           2606    16539    venta venta_producto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(producto_id);
 F   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_producto_id_fkey;
       public               postgres    false    223    224    4686            �   B   x�]ʻ  C�:��	[0�ρ�h�������7Q��b��g�g�l@F�$�%$�M�,�;3Ѳ
      �   C   x�3�tN�II-J,�2�t/*-�/Vp�IM.)�OO��/�2���/�O��M*1�K�)+�2c���� �F�      �   �   x�U��j�@е�+�B�N�X&�AM���Q�8�D3ڿ�����#���t/��{��Xh�������j����K�r��WTk+�������34Q��!�p�ʽ�;�O��+�ܢ�8��zs�I�4���e��7�[j��t��e������m>(�+IN�_��M�?:      �   �  x�m�=r�0�k�<AF ��Rr
�Ǌ5�i^(X�b�(��H�3�bY�r��[�aw�lkɵ�m�q��I�	Vq9��k�|dL����X�o�2����A���v�|��p�C,�VS#aλgh9��=+A+��j�n�T�5���3�}����C���q2-]�XlG�B� 7�-�CL��Ǆd-y��fL(&���>�����&�8�h�B_q�!�G�I�oZJm\�r���bv!���i~Υ��@��%�D��v�q�6�\̊\�.s�^rY��L&\ޏ�V��}��^g��?�$ �3oVs���Us5��J.[�p"X]r%�ϵ˞#uP�w�{��&�����ł��cO�r,:���Yٱg�E�������	��ӹt�U�_�<_L�ߩ����*L�y�_鞁e��������H}��|���Z�֓�ޢ��%���w!y���e��U��O����6R      �   �  x���Kn�0E�f^A��dH�T-*"Q�J�8`T��	���.��i�b#uj��ｶ1��I�E�g�<q�s��&��p	�*q�Ch�Wq�C���]��ڕ�
Jyv:B5�u(��]+`T�:��Y�F@�5��f}q\�bU�%��˒7jĲ��~��ES2������Ɉy^vu8:BL!�����G�7b\d0����,YS�%i8���m�)%��Ҙ��5���0]�h���]bV����d�FP��F��tMvВ��$���e�&��ܬ���o�p�ג�`�J�m�{̷a����!}z[q[���)?�qlI^�0W�#l1}a��KL���¿'܄�>��s�S��~@˲��& �-��2���H�2T��F �6s�C�Y�      �   .   x�3�H-NN�2�t��+.)*MN����2����K-�L����� ��#      �   `   x�3���KT��/*I�2�p�S�J��!���".��Ԝ�D.S���Ԣ"���.3N���D�����̼���b.s��o*Ј���̒ļD�=... %!|      �   N   x�3��*M�Sp+J�K�,N��2��OJ-*��2�tKL���I�2�HM)��2��/J-.I-�2��,�L�K����� P�      �   	  x�m�[r !E�q/I	������1���SS�|��ꑫa�,��Ob�_��7gj�I �Q#����R'��,�F�*��ǁX������V���1� l���#��8|:^P��2�4|�b�0r��?�߅����b8��ˡ���$�A,���]Ǿ�;3�*6���[\�Y�$�.n17_�y�)|qw*Tz�B��.q3�e�)v��Yi8�$�@!M��TP&c���Y�%�0)��L��C��,�H�P%����]���i��b�I�J:E[~(T�XS��<)Ti��ʇ�V��'stP�H>�I<"��*��Q���Ix����jshC��\�*jt��;WAEA�����߂�����������=oGK:nAD'vMʞ�,(������y����'�<�p��֮Mu3uf����w���]�|90�yg�Ln�@Gf�m�Cϓ�zy(�y
בqb�#��
g3�>xy���'1���(�y;E�*(�y�8�d�&��˾V�E�MY����y�����WIk���ͅaM�wK�6O�J;8�E"�~XaL�sPNz�q$x���r�R`��]TAu�{Mڧ[S-���A�S5�y;�o�~Պ�z�c�@}�1���y�TS��}��U1P���}-����m��%5��Ս�ڃa���}�:���/��w�V���-58������A"�w�ϩA����C�+��X侺�8z�5�=�-E���3���y���k���S]�,�~�U����/�F)�9��ߔ�_*���     