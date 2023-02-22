PGDMP                          {            rebo    15.0    15.0 �   n           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            o           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            p           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            q           1262    16398    rebo    DATABASE        CREATE DATABASE rebo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1256';
    DROP DATABASE rebo;
                postgres    false            r           0    0    DATABASE rebo    ACL     $   GRANT ALL ON DATABASE rebo TO rebo;
                   postgres    false    3953            s           0    0    SCHEMA public    ACL     &   GRANT USAGE ON SCHEMA public TO rebo;
                   pg_database_owner    false    5            �            1259    36076 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    rebo    false            �            1259    36075    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          rebo    false    221            t           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          rebo    false    220            �            1259    36085    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    rebo    false            �            1259    36084    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          rebo    false    223            u           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          rebo    false    222            �            1259    36069    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    codename character varying(100) NOT NULL,
    content_type_id integer NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    rebo    false            �            1259    36068    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          rebo    false    219            v           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          rebo    false    218            �            1259    36192    catalogue_brand    TABLE        CREATE TABLE public.catalogue_brand (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    parent_id bigint
);
 #   DROP TABLE public.catalogue_brand;
       public         heap    rebo    false            �            1259    36191    catalogue_brand_id_seq    SEQUENCE        CREATE SEQUENCE public.catalogue_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.catalogue_brand_id_seq;
       public          rebo    false    233            w           0    0    catalogue_brand_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.catalogue_brand_id_seq OWNED BY public.catalogue_brand.id;
          public          rebo    false    232            �            1259    36199    catalogue_category    TABLE     �   CREATE TABLE public.catalogue_category (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    parent_id bigint
);
 &   DROP TABLE public.catalogue_category;
       public         heap    rebo    false            �            1259    36198    catalogue_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalogue_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.catalogue_category_id_seq;
       public          rebo    false    235            x           0    0    catalogue_category_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.catalogue_category_id_seq OWNED BY public.catalogue_category.id;
          public          rebo    false    234            �            1259    36206    catalogue_product    TABLE     �  CREATE TABLE public.catalogue_product (
    id bigint NOT NULL,
    sell_buy smallint NOT NULL,
    upc bigint NOT NULL,
    price bigint NOT NULL,
    weight integer NOT NULL,
    description text NOT NULL,
    is_active boolean NOT NULL,
    create_time timestamp with time zone NOT NULL,
    modified_time timestamp with time zone NOT NULL,
    product_type_id bigint NOT NULL,
    user_id bigint NOT NULL,
    warranty boolean NOT NULL,
    CONSTRAINT catalogue_product_price_check CHECK ((price >= 0)),
    CONSTRAINT catalogue_product_sell_buy_check CHECK ((sell_buy >= 0)),
    CONSTRAINT catalogue_product_weight_check CHECK ((weight >= 0))
);
 %   DROP TABLE public.catalogue_product;
       public         heap    rebo    false            �            1259    36205    catalogue_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalogue_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.catalogue_product_id_seq;
       public          rebo    false    237            y           0    0    catalogue_product_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.catalogue_product_id_seq OWNED BY public.catalogue_product.id;
          public          rebo    false    236            &           1259    37064    catalogue_productattr    TABLE     �   CREATE TABLE public.catalogue_productattr (
    id bigint NOT NULL,
    value_id bigint,
    product_id bigint,
    attr_id bigint,
    type_id bigint
);
 )   DROP TABLE public.catalogue_productattr;
       public         heap    rebo    false            %           1259    37063    catalogue_productattr_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalogue_productattr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.catalogue_productattr_id_seq;
       public          rebo    false    294            z           0    0    catalogue_productattr_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.catalogue_productattr_id_seq OWNED BY public.catalogue_productattr.id;
          public          rebo    false    293            �            1259    36220    catalogue_productattribute    TABLE     �   CREATE TABLE public.catalogue_productattribute (
    id bigint NOT NULL,
    title character varying(32) NOT NULL,
    product_type_id bigint NOT NULL
);
 .   DROP TABLE public.catalogue_productattribute;
       public         heap    rebo    false            �            1259    36219 !   catalogue_productattribute_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalogue_productattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.catalogue_productattribute_id_seq;
       public          rebo    false    239            {           0    0 !   catalogue_productattribute_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.catalogue_productattribute_id_seq OWNED BY public.catalogue_productattribute.id;
          public          rebo    false    238            �            1259    36242    catalogue_productattributevalue    TABLE       CREATE TABLE public.catalogue_productattributevalue (
    id bigint NOT NULL,
    value character varying(48) NOT NULL,
    create_time timestamp with time zone NOT NULL,
    modified_time timestamp with time zone NOT NULL,
    product_attribute_id bigint NOT NULL
);
 3   DROP TABLE public.catalogue_productattributevalue;
       public         heap    rebo    false            �            1259    36241 &   catalogue_productattributevalue_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalogue_productattributevalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.catalogue_productattributevalue_id_seq;
       public          rebo    false    245            |           0    0 &   catalogue_productattributevalue_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.catalogue_productattributevalue_id_seq OWNED BY public.catalogue_productattributevalue.id;
          public          rebo    false    244            �            1259    36235    catalogue_productimage    TABLE     �   CREATE TABLE public.catalogue_productimage (
    id bigint NOT NULL,
    image character varying(100),
    product_id bigint NOT NULL
);
 *   DROP TABLE public.catalogue_productimage;
       public         heap    rebo    false            �            1259    36234    catalogue_productimage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalogue_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.catalogue_productimage_id_seq;
       public          rebo    false    243            }           0    0    catalogue_productimage_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.catalogue_productimage_id_seq OWNED BY public.catalogue_productimage.id;
          public          rebo    false    242            �            1259    36228    catalogue_producttype    TABLE     �   CREATE TABLE public.catalogue_producttype (
    id bigint NOT NULL,
    title character varying(32),
    create_time timestamp with time zone NOT NULL,
    modified_time timestamp with time zone NOT NULL
);
 )   DROP TABLE public.catalogue_producttype;
       public         heap    rebo    false            �            1259    36227    catalogue_producttype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catalogue_producttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.catalogue_producttype_id_seq;
       public          rebo    false    241            ~           0    0    catalogue_producttype_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.catalogue_producttype_id_seq OWNED BY public.catalogue_producttype.id;
          public          rebo    false    240            �            1259    36309    company_company    TABLE     8  CREATE TABLE public.company_company (
    id bigint NOT NULL,
    name character varying(48) NOT NULL,
    image character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    created_time timestamp with time zone NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);
 #   DROP TABLE public.company_company;
       public         heap    rebo    false            �            1259    36308    company_company_id_seq    SEQUENCE        CREATE SEQUENCE public.company_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.company_company_id_seq;
       public          rebo    false    247                       0    0    company_company_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.company_company_id_seq OWNED BY public.company_company.id;
          public          rebo    false    246            �            1259    36318    company_customer    TABLE     ,  CREATE TABLE public.company_customer (
    id bigint NOT NULL,
    name character varying(48),
    family character varying(48) NOT NULL,
    mobile character varying(20) NOT NULL,
    country character varying(30) NOT NULL,
    city character varying(30) NOT NULL,
    company_id bigint NOT NULL
);
 $   DROP TABLE public.company_customer;
       public         heap    rebo    false            �            1259    36317    company_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.company_customer_id_seq;
       public          rebo    false    249            �           0    0    company_customer_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.company_customer_id_seq OWNED BY public.company_customer.id;
          public          rebo    false    248                       1259    36383    company_customerbalance    TABLE     �   CREATE TABLE public.company_customerbalance (
    id bigint NOT NULL,
    balance bigint NOT NULL,
    created_time timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL,
    typedate_id bigint NOT NULL
);
 +   DROP TABLE public.company_customerbalance;
       public         heap    rebo    false                       1259    36382    company_customerbalance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_customerbalance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.company_customerbalance_id_seq;
       public          rebo    false    263            �           0    0    company_customerbalance_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.company_customerbalance_id_seq OWNED BY public.company_customerbalance.id;
          public          rebo    false    262            �            1259    36325    company_driver    TABLE     �  CREATE TABLE public.company_driver (
    id bigint NOT NULL,
    name character varying(48),
    family character varying(48) NOT NULL,
    mobile character varying(20) NOT NULL,
    plaque integer NOT NULL,
    vasat character varying(10) NOT NULL,
    iran smallint NOT NULL,
    company_id bigint NOT NULL,
    CONSTRAINT company_driver_iran_check CHECK ((iran >= 0)),
    CONSTRAINT company_driver_plaque_check CHECK ((plaque >= 0))
);
 "   DROP TABLE public.company_driver;
       public         heap    rebo    false            �            1259    36324    company_driver_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.company_driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.company_driver_id_seq;
       public          rebo    false    251            �           0    0    company_driver_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.company_driver_id_seq OWNED BY public.company_driver.id;
          public          rebo    false    250            �            1259    36334    company_location    TABLE     �   CREATE TABLE public.company_location (
    id bigint NOT NULL,
    name character varying(48) NOT NULL,
    address text NOT NULL,
    company_id bigint NOT NULL
);
 $   DROP TABLE public.company_location;
       public         heap    rebo    false            �            1259    36333    company_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.company_location_id_seq;
       public          rebo    false    253            �           0    0    company_location_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.company_location_id_seq OWNED BY public.company_location.id;
          public          rebo    false    252                       1259    36371    company_staff    TABLE     �  CREATE TABLE public.company_staff (
    id bigint NOT NULL,
    name character varying(48),
    family character varying(48) NOT NULL,
    mobile character varying(48) NOT NULL,
    age character varying(48) NOT NULL,
    jens smallint,
    is_married boolean,
    card_number character varying(48),
    role smallint NOT NULL,
    insurance boolean NOT NULL,
    insurance_status boolean NOT NULL,
    fix_salary bigint NOT NULL,
    salon smallint NOT NULL,
    status boolean NOT NULL,
    location_id bigint NOT NULL,
    codemeli character varying(48) NOT NULL,
    CONSTRAINT company_staff_jens_check CHECK ((jens >= 0)),
    CONSTRAINT company_staff_role_check CHECK ((role >= 0)),
    CONSTRAINT company_staff_salon_check CHECK ((salon >= 0))
);
 !   DROP TABLE public.company_staff;
       public         heap    rebo    false                       1259    36370    company_staff_id_seq    SEQUENCE     }   CREATE SEQUENCE public.company_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.company_staff_id_seq;
       public          rebo    false    261            �           0    0    company_staff_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.company_staff_id_seq OWNED BY public.company_staff.id;
          public          rebo    false    260                       1259    36360    company_transferwarehouse    TABLE       CREATE TABLE public.company_transferwarehouse (
    id bigint NOT NULL,
    quantity bigint NOT NULL,
    created_time timestamp with time zone NOT NULL,
    received_transfer_id bigint NOT NULL,
    sender_transfer_id bigint NOT NULL,
    typedate_id bigint NOT NULL
);
 -   DROP TABLE public.company_transferwarehouse;
       public         heap    rebo    false                       1259    36359     company_transferwarehouse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_transferwarehouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.company_transferwarehouse_id_seq;
       public          rebo    false    259            �           0    0     company_transferwarehouse_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.company_transferwarehouse_id_seq OWNED BY public.company_transferwarehouse.id;
          public          rebo    false    258            �            1259    36343    company_typedates    TABLE     �   CREATE TABLE public.company_typedates (
    id bigint NOT NULL,
    name character varying(48) NOT NULL,
    type smallint NOT NULL,
    company_id bigint NOT NULL,
    CONSTRAINT company_typedates_type_check CHECK ((type >= 0))
);
 %   DROP TABLE public.company_typedates;
       public         heap    rebo    false            �            1259    36342    company_typedates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_typedates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.company_typedates_id_seq;
       public          rebo    false    255            �           0    0    company_typedates_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.company_typedates_id_seq OWNED BY public.company_typedates.id;
          public          rebo    false    254                       1259    36351    company_warehouse    TABLE     �  CREATE TABLE public.company_warehouse (
    id bigint NOT NULL,
    transfer_type smallint NOT NULL,
    value_type smallint NOT NULL,
    quantity bigint NOT NULL,
    created_time timestamp with time zone NOT NULL,
    company_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    driver_id bigint NOT NULL,
    typedate_id bigint NOT NULL,
    CONSTRAINT company_warehouse_transfer_type_check CHECK ((transfer_type >= 0)),
    CONSTRAINT company_warehouse_value_type_check CHECK ((value_type >= 0))
);
 %   DROP TABLE public.company_warehouse;
       public         heap    rebo    false                        1259    36350    company_warehouse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.company_warehouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.company_warehouse_id_seq;
       public          rebo    false    257            �           0    0    company_warehouse_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.company_warehouse_id_seq OWNED BY public.company_warehouse.id;
          public          rebo    false    256            �            1259    36170    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    rebo    false            �            1259    36169    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          rebo    false    231            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          rebo    false    230            �            1259    36060    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    rebo    false            �            1259    36059    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          rebo    false    217            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          rebo    false    216            �            1259    36051    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    rebo    false            �            1259    36050    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          rebo    false    215            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          rebo    false    214                       1259    36553    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    rebo    false                       1259    36504    hoghoogh_amar    TABLE     �  CREATE TABLE public.hoghoogh_amar (
    id bigint NOT NULL,
    name character varying(42) NOT NULL,
    price integer NOT NULL,
    tedad double precision NOT NULL,
    tarikh character varying(42) NOT NULL,
    listprice_id bigint NOT NULL,
    staff_id bigint NOT NULL,
    type character varying(42) NOT NULL,
    is_sarparast boolean NOT NULL,
    location_id bigint NOT NULL
);
 !   DROP TABLE public.hoghoogh_amar;
       public         heap    rebo    false                       1259    36503    hoghoogh_amar_id_seq    SEQUENCE     }   CREATE SEQUENCE public.hoghoogh_amar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.hoghoogh_amar_id_seq;
       public          rebo    false    271            �           0    0    hoghoogh_amar_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.hoghoogh_amar_id_seq OWNED BY public.hoghoogh_amar.id;
          public          rebo    false    270            0           1259    45645    hoghoogh_amararchive    TABLE     L  CREATE TABLE public.hoghoogh_amararchive (
    id bigint NOT NULL,
    name character varying(42) NOT NULL,
    price integer NOT NULL,
    tedad double precision NOT NULL,
    type character varying(42) NOT NULL,
    year character varying(10) NOT NULL,
    month character varying(10) NOT NULL,
    location_id bigint NOT NULL
);
 (   DROP TABLE public.hoghoogh_amararchive;
       public         heap    rebo    false            /           1259    45644    hoghoogh_amararchive_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hoghoogh_amararchive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.hoghoogh_amararchive_id_seq;
       public          rebo    false    304            �           0    0    hoghoogh_amararchive_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.hoghoogh_amararchive_id_seq OWNED BY public.hoghoogh_amararchive.id;
          public          rebo    false    303                       1259    36495    hoghoogh_hoghoogh    TABLE     <  CREATE TABLE public.hoghoogh_hoghoogh (
    id bigint NOT NULL,
    sum_calculate bigint NOT NULL,
    sum_all bigint NOT NULL,
    days integer NOT NULL,
    mosaede bigint NOT NULL,
    vam bigint NOT NULL,
    bime bigint NOT NULL,
    tashvighi bigint NOT NULL,
    year character varying(10) NOT NULL,
    month character varying(10) NOT NULL,
    karaee double precision NOT NULL,
    amar jsonb NOT NULL,
    staff_id bigint NOT NULL,
    pele_price bigint NOT NULL,
    sarparasti bigint NOT NULL,
    total_pay bigint NOT NULL,
    location_id bigint NOT NULL
);
 %   DROP TABLE public.hoghoogh_hoghoogh;
       public         heap    rebo    false                       1259    36494    hoghoogh_hoghoogh_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hoghoogh_hoghoogh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.hoghoogh_hoghoogh_id_seq;
       public          rebo    false    269            �           0    0    hoghoogh_hoghoogh_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.hoghoogh_hoghoogh_id_seq OWNED BY public.hoghoogh_hoghoogh.id;
          public          rebo    false    268            2           1259    45707    hoghoogh_hoghoogharchive    TABLE     C  CREATE TABLE public.hoghoogh_hoghoogharchive (
    id bigint NOT NULL,
    sum_calculate bigint NOT NULL,
    sum_all bigint NOT NULL,
    days integer NOT NULL,
    pele_price bigint NOT NULL,
    total_pay bigint NOT NULL,
    sarparasti bigint NOT NULL,
    mosaede bigint NOT NULL,
    vam bigint NOT NULL,
    bime bigint NOT NULL,
    tashvighi bigint NOT NULL,
    year character varying(10) NOT NULL,
    month character varying(10) NOT NULL,
    karaee double precision NOT NULL,
    amar jsonb NOT NULL,
    location_id bigint NOT NULL,
    staff_id bigint NOT NULL
);
 ,   DROP TABLE public.hoghoogh_hoghoogharchive;
       public         heap    rebo    false            1           1259    45706    hoghoogh_hoghoogharchive_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hoghoogh_hoghoogharchive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.hoghoogh_hoghoogharchive_id_seq;
       public          rebo    false    306            �           0    0    hoghoogh_hoghoogharchive_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.hoghoogh_hoghoogharchive_id_seq OWNED BY public.hoghoogh_hoghoogharchive.id;
          public          rebo    false    305                       1259    36487    hoghoogh_listprice    TABLE     9  CREATE TABLE public.hoghoogh_listprice (
    id bigint NOT NULL,
    name character varying(42) NOT NULL,
    price integer NOT NULL,
    value_type smallint NOT NULL,
    is_active boolean NOT NULL,
    location_id bigint NOT NULL,
    CONSTRAINT hoghoogh_listprice_value_type_check CHECK ((value_type >= 0))
);
 &   DROP TABLE public.hoghoogh_listprice;
       public         heap    rebo    false            
           1259    36486    hoghoogh_listprice_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hoghoogh_listprice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.hoghoogh_listprice_id_seq;
       public          rebo    false    267            �           0    0    hoghoogh_listprice_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.hoghoogh_listprice_id_seq OWNED BY public.hoghoogh_listprice.id;
          public          rebo    false    266                       1259    36645    hoghoogh_sarparasti    TABLE       CREATE TABLE public.hoghoogh_sarparasti (
    id bigint NOT NULL,
    sum_day_sarparast integer NOT NULL,
    staff_id bigint NOT NULL,
    month character varying(10) NOT NULL,
    year character varying(10) NOT NULL,
    location_id bigint NOT NULL,
    role integer NOT NULL
);
 '   DROP TABLE public.hoghoogh_sarparasti;
       public         heap    rebo    false                       1259    36644    hoghoogh_sarparasti_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hoghoogh_sarparasti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.hoghoogh_sarparasti_id_seq;
       public          rebo    false    284            �           0    0    hoghoogh_sarparasti_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.hoghoogh_sarparasti_id_seq OWNED BY public.hoghoogh_sarparasti.id;
          public          rebo    false    283            	           1259    36478    hoghoogh_settinghoghoogh    TABLE       CREATE TABLE public.hoghoogh_settinghoghoogh (
    id bigint NOT NULL,
    price_bime_in_day integer NOT NULL,
    start_end_hoghoogh character varying(32) NOT NULL,
    num_day integer NOT NULL,
    darsad_all integer NOT NULL,
    darsad_sarparast integer NOT NULL,
    pele_one_day integer NOT NULL,
    pele_one_darsad integer NOT NULL,
    pele_two_day integer NOT NULL,
    pele_two_darsad integer NOT NULL,
    pele_three_day integer NOT NULL,
    pele_three_darsad integer NOT NULL,
    location_id bigint NOT NULL
);
 ,   DROP TABLE public.hoghoogh_settinghoghoogh;
       public         heap    rebo    false                       1259    36477    hoghoogh_settinghoghoogh_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hoghoogh_settinghoghoogh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.hoghoogh_settinghoghoogh_id_seq;
       public          rebo    false    265            �           0    0    hoghoogh_settinghoghoogh_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.hoghoogh_settinghoghoogh_id_seq OWNED BY public.hoghoogh_settinghoghoogh.id;
          public          rebo    false    264                       1259    36921    hoghoogh_tolid    TABLE     �   CREATE TABLE public.hoghoogh_tolid (
    id bigint NOT NULL,
    sum_tolid bigint NOT NULL,
    month character varying(10) NOT NULL,
    year character varying(10) NOT NULL,
    location_id bigint NOT NULL
);
 "   DROP TABLE public.hoghoogh_tolid;
       public         heap    rebo    false                       1259    36920    hoghoogh_tolid_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.hoghoogh_tolid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.hoghoogh_tolid_id_seq;
       public          rebo    false    286            �           0    0    hoghoogh_tolid_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.hoghoogh_tolid_id_seq OWNED BY public.hoghoogh_tolid.id;
          public          rebo    false    285                       1259    36540 	   info_info    TABLE     M  CREATE TABLE public.info_info (
    id bigint NOT NULL,
    name character varying(32) NOT NULL,
    family character varying(32) NOT NULL,
    image character varying(100) NOT NULL,
    shaba character varying(24) NOT NULL,
    image_shaba character varying(100) NOT NULL,
    codemeli character varying(24) NOT NULL,
    image_codemeli character varying(100) NOT NULL,
    create_time timestamp with time zone NOT NULL,
    modified_time timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.info_info;
       public         heap    rebo    false                       1259    36539    info_info_id_seq    SEQUENCE     y   CREATE SEQUENCE public.info_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.info_info_id_seq;
       public          rebo    false    273            �           0    0    info_info_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.info_info_id_seq OWNED BY public.info_info.id;
          public          rebo    false    272            .           1259    37484    learn_category    TABLE     �   CREATE TABLE public.learn_category (
    id bigint NOT NULL,
    title character varying(48) NOT NULL,
    image character varying(100),
    created_time timestamp with time zone NOT NULL,
    uploaded_at timestamp with time zone NOT NULL
);
 "   DROP TABLE public.learn_category;
       public         heap    rebo    false            -           1259    37483    learn_category_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.learn_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.learn_category_id_seq;
       public          rebo    false    302            �           0    0    learn_category_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.learn_category_id_seq OWNED BY public.learn_category.id;
          public          rebo    false    301            (           1259    37201    learn_learn    TABLE       CREATE TABLE public.learn_learn (
    id bigint NOT NULL,
    auther character varying(48) NOT NULL,
    title character varying(48) NOT NULL,
    price bigint NOT NULL,
    image character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    is_free boolean NOT NULL,
    created_time timestamp with time zone NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    type_id bigint,
    user_id bigint NOT NULL,
    category_id bigint NOT NULL,
    CONSTRAINT learn_learn_price_check CHECK ((price >= 0))
);
    DROP TABLE public.learn_learn;
       public         heap    rebo    false            '           1259    37200    learn_learn_id_seq    SEQUENCE     {   CREATE SEQUENCE public.learn_learn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.learn_learn_id_seq;
       public          rebo    false    296            �           0    0    learn_learn_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.learn_learn_id_seq OWNED BY public.learn_learn.id;
          public          rebo    false    295            ,           1259    37216    learn_lesson    TABLE     �  CREATE TABLE public.learn_lesson (
    id bigint NOT NULL,
    title character varying(48) NOT NULL,
    image character varying(100),
    video character varying(100),
    description text,
    is_active boolean NOT NULL,
    is_free boolean NOT NULL,
    created_time timestamp with time zone NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    section_id bigint NOT NULL,
    three1 character varying(100),
    three2 character varying(100),
    voice character varying(100)
);
     DROP TABLE public.learn_lesson;
       public         heap    rebo    false            +           1259    37215    learn_lesson_id_seq    SEQUENCE     |   CREATE SEQUENCE public.learn_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.learn_lesson_id_seq;
       public          rebo    false    300            �           0    0    learn_lesson_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.learn_lesson_id_seq OWNED BY public.learn_lesson.id;
          public          rebo    false    299            *           1259    37209    learn_section    TABLE     +  CREATE TABLE public.learn_section (
    id bigint NOT NULL,
    title character varying(48) NOT NULL,
    is_active boolean NOT NULL,
    is_free boolean NOT NULL,
    created_time timestamp with time zone NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    learn_id bigint NOT NULL
);
 !   DROP TABLE public.learn_section;
       public         heap    rebo    false            )           1259    37208    learn_section_id_seq    SEQUENCE     }   CREATE SEQUENCE public.learn_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.learn_section_id_seq;
       public          rebo    false    298            �           0    0    learn_section_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.learn_section_id_seq OWNED BY public.learn_section.id;
          public          rebo    false    297            �            1259    36115    login_myuser    TABLE     `  CREATE TABLE public.login_myuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    mobile character varying(11) NOT NULL,
    otp integer,
    otp_create_time timestamp with time zone NOT NULL,
    CONSTRAINT login_myuser_otp_check CHECK ((otp >= 0))
);
     DROP TABLE public.login_myuser;
       public         heap    rebo    false            �            1259    36127    login_myuser_groups    TABLE     �   CREATE TABLE public.login_myuser_groups (
    id bigint NOT NULL,
    myuser_id bigint NOT NULL,
    group_id integer NOT NULL
);
 '   DROP TABLE public.login_myuser_groups;
       public         heap    rebo    false            �            1259    36126    login_myuser_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.login_myuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.login_myuser_groups_id_seq;
       public          rebo    false    227            �           0    0    login_myuser_groups_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.login_myuser_groups_id_seq OWNED BY public.login_myuser_groups.id;
          public          rebo    false    226            �            1259    36114    login_myuser_id_seq    SEQUENCE     |   CREATE SEQUENCE public.login_myuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.login_myuser_id_seq;
       public          rebo    false    225            �           0    0    login_myuser_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.login_myuser_id_seq OWNED BY public.login_myuser.id;
          public          rebo    false    224            �            1259    36134    login_myuser_user_permissions    TABLE     �   CREATE TABLE public.login_myuser_user_permissions (
    id bigint NOT NULL,
    myuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 1   DROP TABLE public.login_myuser_user_permissions;
       public         heap    rebo    false            �            1259    36133 $   login_myuser_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.login_myuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.login_myuser_user_permissions_id_seq;
       public          rebo    false    229            �           0    0 $   login_myuser_user_permissions_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.login_myuser_user_permissions_id_seq OWNED BY public.login_myuser_user_permissions.id;
          public          rebo    false    228                        1259    37016    order_gateway    TABLE     -  CREATE TABLE public.order_gateway (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    gateway_request_url character varying(150),
    gateway_verify_url character varying(150),
    gateway_code character varying(12) NOT NULL,
    is_enable boolean NOT NULL,
    auth_data text
);
 !   DROP TABLE public.order_gateway;
       public         heap    rebo    false                       1259    37015    order_gateway_id_seq    SEQUENCE     }   CREATE SEQUENCE public.order_gateway_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.order_gateway_id_seq;
       public          rebo    false    288            �           0    0    order_gateway_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.order_gateway_id_seq OWNED BY public.order_gateway.id;
          public          rebo    false    287            $           1259    37050    order_order    TABLE       CREATE TABLE public.order_order (
    id bigint NOT NULL,
    price integer NOT NULL,
    created_time timestamp with time zone NOT NULL,
    updated_time timestamp with time zone NOT NULL,
    user_id bigint,
    CONSTRAINT order_order_price_check CHECK ((price >= 0))
);
    DROP TABLE public.order_order;
       public         heap    rebo    false            #           1259    37049    order_order_id_seq    SEQUENCE     {   CREATE SEQUENCE public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_order_id_seq;
       public          rebo    false    292            �           0    0    order_order_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;
          public          rebo    false    291            "           1259    37025    order_payment    TABLE     h  CREATE TABLE public.order_payment (
    id bigint NOT NULL,
    faktor_number uuid NOT NULL,
    amount integer NOT NULL,
    gateway character varying(40) NOT NULL,
    is_paid boolean NOT NULL,
    payment_log text NOT NULL,
    authority character varying(64) NOT NULL,
    user_id bigint,
    CONSTRAINT order_payment_amount_check CHECK ((amount >= 0))
);
 !   DROP TABLE public.order_payment;
       public         heap    rebo    false            !           1259    37024    order_payment_id_seq    SEQUENCE     }   CREATE SEQUENCE public.order_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.order_payment_id_seq;
       public          rebo    false    290            �           0    0    order_payment_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.order_payment_id_seq OWNED BY public.order_payment.id;
          public          rebo    false    289                       1259    36563    transaction_transaction    TABLE     <  CREATE TABLE public.transaction_transaction (
    id bigint NOT NULL,
    transaction_type smallint NOT NULL,
    amount bigint NOT NULL,
    created_time timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT transaction_transaction_transaction_type_check CHECK ((transaction_type >= 0))
);
 +   DROP TABLE public.transaction_transaction;
       public         heap    rebo    false                       1259    36562    transaction_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.transaction_transaction_id_seq;
       public          rebo    false    276            �           0    0    transaction_transaction_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.transaction_transaction_id_seq OWNED BY public.transaction_transaction.id;
          public          rebo    false    275                       1259    36588    transaction_transfertransaction    TABLE     Z  CREATE TABLE public.transaction_transfertransaction (
    id bigint NOT NULL,
    amount bigint NOT NULL,
    sender_name character varying(48) NOT NULL,
    received_name character varying(48) NOT NULL,
    created_time timestamp with time zone NOT NULL,
    received_transaction_id bigint NOT NULL,
    sender_transaction_id bigint NOT NULL
);
 3   DROP TABLE public.transaction_transfertransaction;
       public         heap    rebo    false                       1259    36587 &   transaction_transfertransaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_transfertransaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.transaction_transfertransaction_id_seq;
       public          rebo    false    282            �           0    0 &   transaction_transfertransaction_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.transaction_transfertransaction_id_seq OWNED BY public.transaction_transfertransaction.id;
          public          rebo    false    281                       1259    36581    transaction_userbalance    TABLE     �   CREATE TABLE public.transaction_userbalance (
    id bigint NOT NULL,
    balance bigint NOT NULL,
    created_time timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);
 +   DROP TABLE public.transaction_userbalance;
       public         heap    rebo    false                       1259    36580    transaction_userbalance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_userbalance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.transaction_userbalance_id_seq;
       public          rebo    false    280            �           0    0    transaction_userbalance_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.transaction_userbalance_id_seq OWNED BY public.transaction_userbalance.id;
          public          rebo    false    279                       1259    36571    transaction_userscore    TABLE     �   CREATE TABLE public.transaction_userscore (
    id bigint NOT NULL,
    score smallint NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT transaction_userscore_score_check CHECK ((score >= 0))
);
 )   DROP TABLE public.transaction_userscore;
       public         heap    rebo    false                       1259    36570    transaction_userscore_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_userscore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.transaction_userscore_id_seq;
       public          rebo    false    278            �           0    0    transaction_userscore_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.transaction_userscore_id_seq OWNED BY public.transaction_userscore.id;
          public          rebo    false    277            M           2604    36079    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    220    221    221            N           2604    36088    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    222    223    223            L           2604    36072    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    219    218    219            S           2604    36195    catalogue_brand id    DEFAULT     x   ALTER TABLE ONLY public.catalogue_brand ALTER COLUMN id SET DEFAULT nextval('public.catalogue_brand_id_seq'::regclass);
 A   ALTER TABLE public.catalogue_brand ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    232    233    233            T           2604    36202    catalogue_category id    DEFAULT     ~   ALTER TABLE ONLY public.catalogue_category ALTER COLUMN id SET DEFAULT nextval('public.catalogue_category_id_seq'::regclass);
 D   ALTER TABLE public.catalogue_category ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    234    235    235            U           2604    36209    catalogue_product id    DEFAULT     |   ALTER TABLE ONLY public.catalogue_product ALTER COLUMN id SET DEFAULT nextval('public.catalogue_product_id_seq'::regclass);
 C   ALTER TABLE public.catalogue_product ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    236    237    237            q           2604    37067    catalogue_productattr id    DEFAULT     �   ALTER TABLE ONLY public.catalogue_productattr ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productattr_id_seq'::regclass);
 G   ALTER TABLE public.catalogue_productattr ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    294    293    294            V           2604    36223    catalogue_productattribute id    DEFAULT     �   ALTER TABLE ONLY public.catalogue_productattribute ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productattribute_id_seq'::regclass);
 L   ALTER TABLE public.catalogue_productattribute ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    238    239    239            Y           2604    36245 "   catalogue_productattributevalue id    DEFAULT     �   ALTER TABLE ONLY public.catalogue_productattributevalue ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productattributevalue_id_seq'::regclass);
 Q   ALTER TABLE public.catalogue_productattributevalue ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    245    244    245            X           2604    36238    catalogue_productimage id    DEFAULT     �   ALTER TABLE ONLY public.catalogue_productimage ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productimage_id_seq'::regclass);
 H   ALTER TABLE public.catalogue_productimage ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    242    243    243            W           2604    36231    catalogue_producttype id    DEFAULT     �   ALTER TABLE ONLY public.catalogue_producttype ALTER COLUMN id SET DEFAULT nextval('public.catalogue_producttype_id_seq'::regclass);
 G   ALTER TABLE public.catalogue_producttype ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    241    240    241            Z           2604    36312    company_company id    DEFAULT     x   ALTER TABLE ONLY public.company_company ALTER COLUMN id SET DEFAULT nextval('public.company_company_id_seq'::regclass);
 A   ALTER TABLE public.company_company ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    246    247    247            [           2604    36321    company_customer id    DEFAULT     z   ALTER TABLE ONLY public.company_customer ALTER COLUMN id SET DEFAULT nextval('public.company_customer_id_seq'::regclass);
 B   ALTER TABLE public.company_customer ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    249    248    249            b           2604    36386    company_customerbalance id    DEFAULT     �   ALTER TABLE ONLY public.company_customerbalance ALTER COLUMN id SET DEFAULT nextval('public.company_customerbalance_id_seq'::regclass);
 I   ALTER TABLE public.company_customerbalance ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    263    262    263            \           2604    36328    company_driver id    DEFAULT     v   ALTER TABLE ONLY public.company_driver ALTER COLUMN id SET DEFAULT nextval('public.company_driver_id_seq'::regclass);
 @   ALTER TABLE public.company_driver ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    250    251    251            ]           2604    36337    company_location id    DEFAULT     z   ALTER TABLE ONLY public.company_location ALTER COLUMN id SET DEFAULT nextval('public.company_location_id_seq'::regclass);
 B   ALTER TABLE public.company_location ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    253    252    253            a           2604    36374    company_staff id    DEFAULT     t   ALTER TABLE ONLY public.company_staff ALTER COLUMN id SET DEFAULT nextval('public.company_staff_id_seq'::regclass);
 ?   ALTER TABLE public.company_staff ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    260    261    261            `           2604    36363    company_transferwarehouse id    DEFAULT     �   ALTER TABLE ONLY public.company_transferwarehouse ALTER COLUMN id SET DEFAULT nextval('public.company_transferwarehouse_id_seq'::regclass);
 K   ALTER TABLE public.company_transferwarehouse ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    258    259    259            ^           2604    36346    company_typedates id    DEFAULT     |   ALTER TABLE ONLY public.company_typedates ALTER COLUMN id SET DEFAULT nextval('public.company_typedates_id_seq'::regclass);
 C   ALTER TABLE public.company_typedates ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    254    255    255            _           2604    36354    company_warehouse id    DEFAULT     |   ALTER TABLE ONLY public.company_warehouse ALTER COLUMN id SET DEFAULT nextval('public.company_warehouse_id_seq'::regclass);
 C   ALTER TABLE public.company_warehouse ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    256    257    257            R           2604    36173    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    230    231    231            K           2604    36063    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    216    217    217            J           2604    36054    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    215    214    215            f           2604    36507    hoghoogh_amar id    DEFAULT     t   ALTER TABLE ONLY public.hoghoogh_amar ALTER COLUMN id SET DEFAULT nextval('public.hoghoogh_amar_id_seq'::regclass);
 ?   ALTER TABLE public.hoghoogh_amar ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    270    271    271            v           2604    45648    hoghoogh_amararchive id    DEFAULT     �   ALTER TABLE ONLY public.hoghoogh_amararchive ALTER COLUMN id SET DEFAULT nextval('public.hoghoogh_amararchive_id_seq'::regclass);
 F   ALTER TABLE public.hoghoogh_amararchive ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    303    304    304            e           2604    36498    hoghoogh_hoghoogh id    DEFAULT     |   ALTER TABLE ONLY public.hoghoogh_hoghoogh ALTER COLUMN id SET DEFAULT nextval('public.hoghoogh_hoghoogh_id_seq'::regclass);
 C   ALTER TABLE public.hoghoogh_hoghoogh ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    268    269    269            w           2604    45710    hoghoogh_hoghoogharchive id    DEFAULT     �   ALTER TABLE ONLY public.hoghoogh_hoghoogharchive ALTER COLUMN id SET DEFAULT nextval('public.hoghoogh_hoghoogharchive_id_seq'::regclass);
 J   ALTER TABLE public.hoghoogh_hoghoogharchive ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    306    305    306            d           2604    36490    hoghoogh_listprice id    DEFAULT     ~   ALTER TABLE ONLY public.hoghoogh_listprice ALTER COLUMN id SET DEFAULT nextval('public.hoghoogh_listprice_id_seq'::regclass);
 D   ALTER TABLE public.hoghoogh_listprice ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    267    266    267            l           2604    36648    hoghoogh_sarparasti id    DEFAULT     �   ALTER TABLE ONLY public.hoghoogh_sarparasti ALTER COLUMN id SET DEFAULT nextval('public.hoghoogh_sarparasti_id_seq'::regclass);
 E   ALTER TABLE public.hoghoogh_sarparasti ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    284    283    284            c           2604    36481    hoghoogh_settinghoghoogh id    DEFAULT     �   ALTER TABLE ONLY public.hoghoogh_settinghoghoogh ALTER COLUMN id SET DEFAULT nextval('public.hoghoogh_settinghoghoogh_id_seq'::regclass);
 J   ALTER TABLE public.hoghoogh_settinghoghoogh ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    265    264    265            m           2604    36924    hoghoogh_tolid id    DEFAULT     v   ALTER TABLE ONLY public.hoghoogh_tolid ALTER COLUMN id SET DEFAULT nextval('public.hoghoogh_tolid_id_seq'::regclass);
 @   ALTER TABLE public.hoghoogh_tolid ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    286    285    286            g           2604    36543    info_info id    DEFAULT     l   ALTER TABLE ONLY public.info_info ALTER COLUMN id SET DEFAULT nextval('public.info_info_id_seq'::regclass);
 ;   ALTER TABLE public.info_info ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    273    272    273            u           2604    37487    learn_category id    DEFAULT     v   ALTER TABLE ONLY public.learn_category ALTER COLUMN id SET DEFAULT nextval('public.learn_category_id_seq'::regclass);
 @   ALTER TABLE public.learn_category ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    302    301    302            r           2604    37204    learn_learn id    DEFAULT     p   ALTER TABLE ONLY public.learn_learn ALTER COLUMN id SET DEFAULT nextval('public.learn_learn_id_seq'::regclass);
 =   ALTER TABLE public.learn_learn ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    295    296    296            t           2604    37219    learn_lesson id    DEFAULT     r   ALTER TABLE ONLY public.learn_lesson ALTER COLUMN id SET DEFAULT nextval('public.learn_lesson_id_seq'::regclass);
 >   ALTER TABLE public.learn_lesson ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    300    299    300            s           2604    37212    learn_section id    DEFAULT     t   ALTER TABLE ONLY public.learn_section ALTER COLUMN id SET DEFAULT nextval('public.learn_section_id_seq'::regclass);
 ?   ALTER TABLE public.learn_section ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    298    297    298            O           2604    36118    login_myuser id    DEFAULT     r   ALTER TABLE ONLY public.login_myuser ALTER COLUMN id SET DEFAULT nextval('public.login_myuser_id_seq'::regclass);
 >   ALTER TABLE public.login_myuser ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    225    224    225            P           2604    36130    login_myuser_groups id    DEFAULT     �   ALTER TABLE ONLY public.login_myuser_groups ALTER COLUMN id SET DEFAULT nextval('public.login_myuser_groups_id_seq'::regclass);
 E   ALTER TABLE public.login_myuser_groups ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    226    227    227            Q           2604    36137     login_myuser_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.login_myuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.login_myuser_user_permissions_id_seq'::regclass);
 O   ALTER TABLE public.login_myuser_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    228    229    229            n           2604    37019    order_gateway id    DEFAULT     t   ALTER TABLE ONLY public.order_gateway ALTER COLUMN id SET DEFAULT nextval('public.order_gateway_id_seq'::regclass);
 ?   ALTER TABLE public.order_gateway ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    287    288    288            p           2604    37053    order_order id    DEFAULT     p   ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);
 =   ALTER TABLE public.order_order ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    292    291    292            o           2604    37028    order_payment id    DEFAULT     t   ALTER TABLE ONLY public.order_payment ALTER COLUMN id SET DEFAULT nextval('public.order_payment_id_seq'::regclass);
 ?   ALTER TABLE public.order_payment ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    289    290    290            h           2604    36566    transaction_transaction id    DEFAULT     �   ALTER TABLE ONLY public.transaction_transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_transaction_id_seq'::regclass);
 I   ALTER TABLE public.transaction_transaction ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    276    275    276            k           2604    36591 "   transaction_transfertransaction id    DEFAULT     �   ALTER TABLE ONLY public.transaction_transfertransaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_transfertransaction_id_seq'::regclass);
 Q   ALTER TABLE public.transaction_transfertransaction ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    282    281    282            j           2604    36584    transaction_userbalance id    DEFAULT     �   ALTER TABLE ONLY public.transaction_userbalance ALTER COLUMN id SET DEFAULT nextval('public.transaction_userbalance_id_seq'::regclass);
 I   ALTER TABLE public.transaction_userbalance ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    280    279    280            i           2604    36574    transaction_userscore id    DEFAULT     �   ALTER TABLE ONLY public.transaction_userscore ALTER COLUMN id SET DEFAULT nextval('public.transaction_userscore_id_seq'::regclass);
 G   ALTER TABLE public.transaction_userscore ALTER COLUMN id DROP DEFAULT;
       public          rebo    false    278    277    278                      0    36076 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          rebo    false    221   -�                0    36085    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          rebo    false    223   J�                0    36069    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, codename, content_type_id) FROM stdin;
    public          rebo    false    219   g�      "          0    36192    catalogue_brand 
   TABLE DATA           >   COPY public.catalogue_brand (id, name, parent_id) FROM stdin;
    public          rebo    false    233   ��      $          0    36199    catalogue_category 
   TABLE DATA           A   COPY public.catalogue_category (id, name, parent_id) FROM stdin;
    public          rebo    false    235   ��      &          0    36206    catalogue_product 
   TABLE DATA           �   COPY public.catalogue_product (id, sell_buy, upc, price, weight, description, is_active, create_time, modified_time, product_type_id, user_id, warranty) FROM stdin;
    public          rebo    false    237   k�      _          0    37064    catalogue_productattr 
   TABLE DATA           [   COPY public.catalogue_productattr (id, value_id, product_id, attr_id, type_id) FROM stdin;
    public          rebo    false    294   P�      (          0    36220    catalogue_productattribute 
   TABLE DATA           P   COPY public.catalogue_productattribute (id, title, product_type_id) FROM stdin;
    public          rebo    false    239   ʓ      .          0    36242    catalogue_productattributevalue 
   TABLE DATA           v   COPY public.catalogue_productattributevalue (id, value, create_time, modified_time, product_attribute_id) FROM stdin;
    public          rebo    false    245   E�      ,          0    36235    catalogue_productimage 
   TABLE DATA           G   COPY public.catalogue_productimage (id, image, product_id) FROM stdin;
    public          rebo    false    243   !�      *          0    36228    catalogue_producttype 
   TABLE DATA           V   COPY public.catalogue_producttype (id, title, create_time, modified_time) FROM stdin;
    public          rebo    false    241   ��      0          0    36309    company_company 
   TABLE DATA           i   COPY public.company_company (id, name, image, is_active, created_time, uploaded_at, user_id) FROM stdin;
    public          rebo    false    247   ��      2          0    36318    company_customer 
   TABLE DATA           _   COPY public.company_customer (id, name, family, mobile, country, city, company_id) FROM stdin;
    public          rebo    false    249   v�      @          0    36383    company_customerbalance 
   TABLE DATA           f   COPY public.company_customerbalance (id, balance, created_time, customer_id, typedate_id) FROM stdin;
    public          rebo    false    263   ��      4          0    36325    company_driver 
   TABLE DATA           c   COPY public.company_driver (id, name, family, mobile, plaque, vasat, iran, company_id) FROM stdin;
    public          rebo    false    251   ��      6          0    36334    company_location 
   TABLE DATA           I   COPY public.company_location (id, name, address, company_id) FROM stdin;
    public          rebo    false    253   ͘      >          0    36371    company_staff 
   TABLE DATA           �   COPY public.company_staff (id, name, family, mobile, age, jens, is_married, card_number, role, insurance, insurance_status, fix_salary, salon, status, location_id, codemeli) FROM stdin;
    public          rebo    false    261   �      <          0    36360    company_transferwarehouse 
   TABLE DATA           �   COPY public.company_transferwarehouse (id, quantity, created_time, received_transfer_id, sender_transfer_id, typedate_id) FROM stdin;
    public          rebo    false    259   ݢ      8          0    36343    company_typedates 
   TABLE DATA           G   COPY public.company_typedates (id, name, type, company_id) FROM stdin;
    public          rebo    false    255   ��      :          0    36351    company_warehouse 
   TABLE DATA           �   COPY public.company_warehouse (id, transfer_type, value_type, quantity, created_time, company_id, customer_id, driver_id, typedate_id) FROM stdin;
    public          rebo    false    257   �                 0    36170    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          rebo    false    231   4�                0    36060    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          rebo    false    217   H�                0    36051    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          rebo    false    215   Ե      K          0    36553    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          rebo    false    274   ��      H          0    36504    hoghoogh_amar 
   TABLE DATA           �   COPY public.hoghoogh_amar (id, name, price, tedad, tarikh, listprice_id, staff_id, type, is_sarparast, location_id) FROM stdin;
    public          rebo    false    271   ��      i          0    45645    hoghoogh_amararchive 
   TABLE DATA           f   COPY public.hoghoogh_amararchive (id, name, price, tedad, type, year, month, location_id) FROM stdin;
    public          rebo    false    304         F          0    36495    hoghoogh_hoghoogh 
   TABLE DATA           �   COPY public.hoghoogh_hoghoogh (id, sum_calculate, sum_all, days, mosaede, vam, bime, tashvighi, year, month, karaee, amar, staff_id, pele_price, sarparasti, total_pay, location_id) FROM stdin;
    public          rebo    false    269   k      k          0    45707    hoghoogh_hoghoogharchive 
   TABLE DATA           �   COPY public.hoghoogh_hoghoogharchive (id, sum_calculate, sum_all, days, pele_price, total_pay, sarparasti, mosaede, vam, bime, tashvighi, year, month, karaee, amar, location_id, staff_id) FROM stdin;
    public          rebo    false    306   �      D          0    36487    hoghoogh_listprice 
   TABLE DATA           a   COPY public.hoghoogh_listprice (id, name, price, value_type, is_active, location_id) FROM stdin;
    public          rebo    false    267   �      U          0    36645    hoghoogh_sarparasti 
   TABLE DATA           n   COPY public.hoghoogh_sarparasti (id, sum_day_sarparast, staff_id, month, year, location_id, role) FROM stdin;
    public          rebo    false    284   !      B          0    36478    hoghoogh_settinghoghoogh 
   TABLE DATA           �   COPY public.hoghoogh_settinghoghoogh (id, price_bime_in_day, start_end_hoghoogh, num_day, darsad_all, darsad_sarparast, pele_one_day, pele_one_darsad, pele_two_day, pele_two_darsad, pele_three_day, pele_three_darsad, location_id) FROM stdin;
    public          rebo    false    265   ~      W          0    36921    hoghoogh_tolid 
   TABLE DATA           Q   COPY public.hoghoogh_tolid (id, sum_tolid, month, year, location_id) FROM stdin;
    public          rebo    false    286   �      J          0    36540 	   info_info 
   TABLE DATA           �   COPY public.info_info (id, name, family, image, shaba, image_shaba, codemeli, image_codemeli, create_time, modified_time, is_active, uploaded_at, user_id) FROM stdin;
    public          rebo    false    273         g          0    37484    learn_category 
   TABLE DATA           U   COPY public.learn_category (id, title, image, created_time, uploaded_at) FROM stdin;
    public          rebo    false    302   �	      a          0    37201    learn_learn 
   TABLE DATA           �   COPY public.learn_learn (id, auther, title, price, image, is_active, is_free, created_time, uploaded_at, type_id, user_id, category_id) FROM stdin;
    public          rebo    false    296   �
      e          0    37216    learn_lesson 
   TABLE DATA           �   COPY public.learn_lesson (id, title, image, video, description, is_active, is_free, created_time, uploaded_at, section_id, three1, three2, voice) FROM stdin;
    public          rebo    false    300   �      c          0    37209    learn_section 
   TABLE DATA           k   COPY public.learn_section (id, title, is_active, is_free, created_time, uploaded_at, learn_id) FROM stdin;
    public          rebo    false    298   �                0    36115    login_myuser 
   TABLE DATA           �   COPY public.login_myuser (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, mobile, otp, otp_create_time) FROM stdin;
    public          rebo    false    225   �                0    36127    login_myuser_groups 
   TABLE DATA           F   COPY public.login_myuser_groups (id, myuser_id, group_id) FROM stdin;
    public          rebo    false    227   ;                0    36134    login_myuser_user_permissions 
   TABLE DATA           U   COPY public.login_myuser_user_permissions (id, myuser_id, permission_id) FROM stdin;
    public          rebo    false    229   X      Y          0    37016    order_gateway 
   TABLE DATA              COPY public.order_gateway (id, title, gateway_request_url, gateway_verify_url, gateway_code, is_enable, auth_data) FROM stdin;
    public          rebo    false    288   u      ]          0    37050    order_order 
   TABLE DATA           U   COPY public.order_order (id, price, created_time, updated_time, user_id) FROM stdin;
    public          rebo    false    292   �      [          0    37025    order_payment 
   TABLE DATA           u   COPY public.order_payment (id, faktor_number, amount, gateway, is_paid, payment_log, authority, user_id) FROM stdin;
    public          rebo    false    290   �      M          0    36563    transaction_transaction 
   TABLE DATA           f   COPY public.transaction_transaction (id, transaction_type, amount, created_time, user_id) FROM stdin;
    public          rebo    false    276   �      S          0    36588    transaction_transfertransaction 
   TABLE DATA           �   COPY public.transaction_transfertransaction (id, amount, sender_name, received_name, created_time, received_transaction_id, sender_transaction_id) FROM stdin;
    public          rebo    false    282   I      Q          0    36581    transaction_userbalance 
   TABLE DATA           U   COPY public.transaction_userbalance (id, balance, created_time, user_id) FROM stdin;
    public          rebo    false    280   S      O          0    36571    transaction_userscore 
   TABLE DATA           C   COPY public.transaction_userscore (id, score, user_id) FROM stdin;
    public          rebo    false    278   �      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          rebo    false    220            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          rebo    false    222            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 172, true);
          public          rebo    false    218            �           0    0    catalogue_brand_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.catalogue_brand_id_seq', 3, true);
          public          rebo    false    232            �           0    0    catalogue_category_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalogue_category_id_seq', 5, true);
          public          rebo    false    234            �           0    0    catalogue_product_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.catalogue_product_id_seq', 56, true);
          public          rebo    false    236            �           0    0    catalogue_productattr_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.catalogue_productattr_id_seq', 62, true);
          public          rebo    false    293            �           0    0 !   catalogue_productattribute_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.catalogue_productattribute_id_seq', 40, true);
          public          rebo    false    238            �           0    0 &   catalogue_productattributevalue_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.catalogue_productattributevalue_id_seq', 58, true);
          public          rebo    false    244            �           0    0    catalogue_productimage_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.catalogue_productimage_id_seq', 39, true);
          public          rebo    false    242            �           0    0    catalogue_producttype_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.catalogue_producttype_id_seq', 17, true);
          public          rebo    false    240            �           0    0    company_company_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.company_company_id_seq', 2, true);
          public          rebo    false    246            �           0    0    company_customer_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.company_customer_id_seq', 1, false);
          public          rebo    false    248            �           0    0    company_customerbalance_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.company_customerbalance_id_seq', 1, false);
          public          rebo    false    262            �           0    0    company_driver_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.company_driver_id_seq', 1, false);
          public          rebo    false    250            �           0    0    company_location_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.company_location_id_seq', 2, true);
          public          rebo    false    252            �           0    0    company_staff_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.company_staff_id_seq', 95, true);
          public          rebo    false    260            �           0    0     company_transferwarehouse_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.company_transferwarehouse_id_seq', 1, false);
          public          rebo    false    258            �           0    0    company_typedates_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.company_typedates_id_seq', 1, false);
          public          rebo    false    254            �           0    0    company_warehouse_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.company_warehouse_id_seq', 1, false);
          public          rebo    false    256            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 193, true);
          public          rebo    false    230            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 43, true);
          public          rebo    false    216            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 85, true);
          public          rebo    false    214            �           0    0    hoghoogh_amar_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.hoghoogh_amar_id_seq', 5922, true);
          public          rebo    false    270            �           0    0    hoghoogh_amararchive_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.hoghoogh_amararchive_id_seq', 148, true);
          public          rebo    false    303            �           0    0    hoghoogh_hoghoogh_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.hoghoogh_hoghoogh_id_seq', 202, true);
          public          rebo    false    268            �           0    0    hoghoogh_hoghoogharchive_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.hoghoogh_hoghoogharchive_id_seq', 90, true);
          public          rebo    false    305            �           0    0    hoghoogh_listprice_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.hoghoogh_listprice_id_seq', 37, true);
          public          rebo    false    266            �           0    0    hoghoogh_sarparasti_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.hoghoogh_sarparasti_id_seq', 22, true);
          public          rebo    false    283            �           0    0    hoghoogh_settinghoghoogh_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.hoghoogh_settinghoghoogh_id_seq', 2, true);
          public          rebo    false    264            �           0    0    hoghoogh_tolid_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.hoghoogh_tolid_id_seq', 3, true);
          public          rebo    false    285            �           0    0    info_info_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.info_info_id_seq', 12, true);
          public          rebo    false    272            �           0    0    learn_category_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.learn_category_id_seq', 4, true);
          public          rebo    false    301            �           0    0    learn_learn_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.learn_learn_id_seq', 5, true);
          public          rebo    false    295            �           0    0    learn_lesson_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.learn_lesson_id_seq', 5, true);
          public          rebo    false    299            �           0    0    learn_section_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.learn_section_id_seq', 12, true);
          public          rebo    false    297            �           0    0    login_myuser_groups_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.login_myuser_groups_id_seq', 1, false);
          public          rebo    false    226            �           0    0    login_myuser_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.login_myuser_id_seq', 11, true);
          public          rebo    false    224            �           0    0 $   login_myuser_user_permissions_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.login_myuser_user_permissions_id_seq', 1, false);
          public          rebo    false    228            �           0    0    order_gateway_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.order_gateway_id_seq', 1, false);
          public          rebo    false    287            �           0    0    order_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);
          public          rebo    false    291            �           0    0    order_payment_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.order_payment_id_seq', 1, false);
          public          rebo    false    289            �           0    0    transaction_transaction_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.transaction_transaction_id_seq', 30, true);
          public          rebo    false    275            �           0    0 &   transaction_transfertransaction_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.transaction_transfertransaction_id_seq', 16, true);
          public          rebo    false    281            �           0    0    transaction_userbalance_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.transaction_userbalance_id_seq', 13, true);
          public          rebo    false    279            �           0    0    transaction_userscore_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.transaction_userscore_id_seq', 1, false);
          public          rebo    false    277            �           2606    36083    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            rebo    false    221            �           2606    36101 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            rebo    false    223    223            �           2606    36090 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            rebo    false    223            �           2606    36081    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            rebo    false    221            �           2606    36092 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            rebo    false    219    219            �           2606    36074 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            rebo    false    219            �           2606    36197 $   catalogue_brand catalogue_brand_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.catalogue_brand
    ADD CONSTRAINT catalogue_brand_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.catalogue_brand DROP CONSTRAINT catalogue_brand_pkey;
       public            rebo    false    233            �           2606    36204 *   catalogue_category catalogue_category_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.catalogue_category
    ADD CONSTRAINT catalogue_category_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.catalogue_category DROP CONSTRAINT catalogue_category_pkey;
       public            rebo    false    235            �           2606    36216 (   catalogue_product catalogue_product_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.catalogue_product
    ADD CONSTRAINT catalogue_product_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.catalogue_product DROP CONSTRAINT catalogue_product_pkey;
       public            rebo    false    237            �           2606    36218 +   catalogue_product catalogue_product_upc_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.catalogue_product
    ADD CONSTRAINT catalogue_product_upc_key UNIQUE (upc);
 U   ALTER TABLE ONLY public.catalogue_product DROP CONSTRAINT catalogue_product_upc_key;
       public            rebo    false    237            ,           2606    37069 0   catalogue_productattr catalogue_productattr_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.catalogue_productattr
    ADD CONSTRAINT catalogue_productattr_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.catalogue_productattr DROP CONSTRAINT catalogue_productattr_pkey;
       public            rebo    false    294            �           2606    36226 :   catalogue_productattribute catalogue_productattribute_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.catalogue_productattribute
    ADD CONSTRAINT catalogue_productattribute_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.catalogue_productattribute DROP CONSTRAINT catalogue_productattribute_pkey;
       public            rebo    false    239            �           2606    36247 D   catalogue_productattributevalue catalogue_productattributevalue_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productattributevalue_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.catalogue_productattributevalue DROP CONSTRAINT catalogue_productattributevalue_pkey;
       public            rebo    false    245            �           2606    36240 2   catalogue_productimage catalogue_productimage_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.catalogue_productimage
    ADD CONSTRAINT catalogue_productimage_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.catalogue_productimage DROP CONSTRAINT catalogue_productimage_pkey;
       public            rebo    false    243            �           2606    36233 0   catalogue_producttype catalogue_producttype_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.catalogue_producttype
    ADD CONSTRAINT catalogue_producttype_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.catalogue_producttype DROP CONSTRAINT catalogue_producttype_pkey;
       public            rebo    false    241            �           2606    36314 $   company_company company_company_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.company_company
    ADD CONSTRAINT company_company_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.company_company DROP CONSTRAINT company_company_pkey;
       public            rebo    false    247            �           2606    36316 +   company_company company_company_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.company_company
    ADD CONSTRAINT company_company_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.company_company DROP CONSTRAINT company_company_user_id_key;
       public            rebo    false    247            �           2606    36323 &   company_customer company_customer_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.company_customer
    ADD CONSTRAINT company_customer_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.company_customer DROP CONSTRAINT company_customer_pkey;
       public            rebo    false    249            �           2606    36388 4   company_customerbalance company_customerbalance_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.company_customerbalance
    ADD CONSTRAINT company_customerbalance_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.company_customerbalance DROP CONSTRAINT company_customerbalance_pkey;
       public            rebo    false    263            �           2606    36332 "   company_driver company_driver_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.company_driver
    ADD CONSTRAINT company_driver_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.company_driver DROP CONSTRAINT company_driver_pkey;
       public            rebo    false    251            �           2606    36341 &   company_location company_location_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.company_location
    ADD CONSTRAINT company_location_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.company_location DROP CONSTRAINT company_location_pkey;
       public            rebo    false    253            �           2606    36379     company_staff company_staff_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.company_staff
    ADD CONSTRAINT company_staff_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.company_staff DROP CONSTRAINT company_staff_pkey;
       public            rebo    false    261            �           2606    36365 8   company_transferwarehouse company_transferwarehouse_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.company_transferwarehouse
    ADD CONSTRAINT company_transferwarehouse_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.company_transferwarehouse DROP CONSTRAINT company_transferwarehouse_pkey;
       public            rebo    false    259            �           2606    36367 L   company_transferwarehouse company_transferwarehouse_received_transfer_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.company_transferwarehouse
    ADD CONSTRAINT company_transferwarehouse_received_transfer_id_key UNIQUE (received_transfer_id);
 v   ALTER TABLE ONLY public.company_transferwarehouse DROP CONSTRAINT company_transferwarehouse_received_transfer_id_key;
       public            rebo    false    259            �           2606    36369 J   company_transferwarehouse company_transferwarehouse_sender_transfer_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.company_transferwarehouse
    ADD CONSTRAINT company_transferwarehouse_sender_transfer_id_key UNIQUE (sender_transfer_id);
 t   ALTER TABLE ONLY public.company_transferwarehouse DROP CONSTRAINT company_transferwarehouse_sender_transfer_id_key;
       public            rebo    false    259            �           2606    36349 (   company_typedates company_typedates_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.company_typedates
    ADD CONSTRAINT company_typedates_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.company_typedates DROP CONSTRAINT company_typedates_pkey;
       public            rebo    false    255            �           2606    36358 (   company_warehouse company_warehouse_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.company_warehouse
    ADD CONSTRAINT company_warehouse_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.company_warehouse DROP CONSTRAINT company_warehouse_pkey;
       public            rebo    false    257            �           2606    36178 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            rebo    false    231            �           2606    36067 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            rebo    false    217    217            �           2606    36065 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            rebo    false    217            �           2606    36058 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            rebo    false    215                       2606    36559 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            rebo    false    274                        2606    36509     hoghoogh_amar hoghoogh_amar_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.hoghoogh_amar
    ADD CONSTRAINT hoghoogh_amar_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.hoghoogh_amar DROP CONSTRAINT hoghoogh_amar_pkey;
       public            rebo    false    271            ?           2606    45650 .   hoghoogh_amararchive hoghoogh_amararchive_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.hoghoogh_amararchive
    ADD CONSTRAINT hoghoogh_amararchive_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.hoghoogh_amararchive DROP CONSTRAINT hoghoogh_amararchive_pkey;
       public            rebo    false    304            �           2606    36502 (   hoghoogh_hoghoogh hoghoogh_hoghoogh_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.hoghoogh_hoghoogh
    ADD CONSTRAINT hoghoogh_hoghoogh_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.hoghoogh_hoghoogh DROP CONSTRAINT hoghoogh_hoghoogh_pkey;
       public            rebo    false    269            �           2606    36635 :   hoghoogh_hoghoogh hoghoogh_hoghoogh_staff_id_d7431c1e_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.hoghoogh_hoghoogh
    ADD CONSTRAINT hoghoogh_hoghoogh_staff_id_d7431c1e_uniq UNIQUE (staff_id);
 d   ALTER TABLE ONLY public.hoghoogh_hoghoogh DROP CONSTRAINT hoghoogh_hoghoogh_staff_id_d7431c1e_uniq;
       public            rebo    false    269            B           2606    45714 6   hoghoogh_hoghoogharchive hoghoogh_hoghoogharchive_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.hoghoogh_hoghoogharchive
    ADD CONSTRAINT hoghoogh_hoghoogharchive_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.hoghoogh_hoghoogharchive DROP CONSTRAINT hoghoogh_hoghoogharchive_pkey;
       public            rebo    false    306            �           2606    36493 *   hoghoogh_listprice hoghoogh_listprice_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.hoghoogh_listprice
    ADD CONSTRAINT hoghoogh_listprice_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.hoghoogh_listprice DROP CONSTRAINT hoghoogh_listprice_pkey;
       public            rebo    false    267                       2606    36650 ,   hoghoogh_sarparasti hoghoogh_sarparasti_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.hoghoogh_sarparasti
    ADD CONSTRAINT hoghoogh_sarparasti_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.hoghoogh_sarparasti DROP CONSTRAINT hoghoogh_sarparasti_pkey;
       public            rebo    false    284            �           2606    36485 A   hoghoogh_settinghoghoogh hoghoogh_settinghoghoogh_location_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_settinghoghoogh
    ADD CONSTRAINT hoghoogh_settinghoghoogh_location_id_key UNIQUE (location_id);
 k   ALTER TABLE ONLY public.hoghoogh_settinghoghoogh DROP CONSTRAINT hoghoogh_settinghoghoogh_location_id_key;
       public            rebo    false    265            �           2606    36483 6   hoghoogh_settinghoghoogh hoghoogh_settinghoghoogh_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.hoghoogh_settinghoghoogh
    ADD CONSTRAINT hoghoogh_settinghoghoogh_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.hoghoogh_settinghoghoogh DROP CONSTRAINT hoghoogh_settinghoghoogh_pkey;
       public            rebo    false    265                       2606    36926 "   hoghoogh_tolid hoghoogh_tolid_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.hoghoogh_tolid
    ADD CONSTRAINT hoghoogh_tolid_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.hoghoogh_tolid DROP CONSTRAINT hoghoogh_tolid_pkey;
       public            rebo    false    286                       2606    36545    info_info info_info_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.info_info
    ADD CONSTRAINT info_info_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.info_info DROP CONSTRAINT info_info_pkey;
       public            rebo    false    273                       2606    36547    info_info info_info_user_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.info_info
    ADD CONSTRAINT info_info_user_id_key UNIQUE (user_id);
 I   ALTER TABLE ONLY public.info_info DROP CONSTRAINT info_info_user_id_key;
       public            rebo    false    273            <           2606    37489 "   learn_category learn_category_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.learn_category
    ADD CONSTRAINT learn_category_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.learn_category DROP CONSTRAINT learn_category_pkey;
       public            rebo    false    302            2           2606    37207    learn_learn learn_learn_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.learn_learn
    ADD CONSTRAINT learn_learn_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.learn_learn DROP CONSTRAINT learn_learn_pkey;
       public            rebo    false    296            9           2606    37223    learn_lesson learn_lesson_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.learn_lesson
    ADD CONSTRAINT learn_lesson_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.learn_lesson DROP CONSTRAINT learn_lesson_pkey;
       public            rebo    false    300            7           2606    37214     learn_section learn_section_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.learn_section
    ADD CONSTRAINT learn_section_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.learn_section DROP CONSTRAINT learn_section_pkey;
       public            rebo    false    298            �           2606    36142 H   login_myuser_groups login_myuser_groups_myuser_id_group_id_217eb397_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.login_myuser_groups
    ADD CONSTRAINT login_myuser_groups_myuser_id_group_id_217eb397_uniq UNIQUE (myuser_id, group_id);
 r   ALTER TABLE ONLY public.login_myuser_groups DROP CONSTRAINT login_myuser_groups_myuser_id_group_id_217eb397_uniq;
       public            rebo    false    227    227            �           2606    36132 ,   login_myuser_groups login_myuser_groups_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.login_myuser_groups
    ADD CONSTRAINT login_myuser_groups_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.login_myuser_groups DROP CONSTRAINT login_myuser_groups_pkey;
       public            rebo    false    227            �           2606    36125 $   login_myuser login_myuser_mobile_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.login_myuser
    ADD CONSTRAINT login_myuser_mobile_key UNIQUE (mobile);
 N   ALTER TABLE ONLY public.login_myuser DROP CONSTRAINT login_myuser_mobile_key;
       public            rebo    false    225            �           2606    36123    login_myuser login_myuser_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.login_myuser
    ADD CONSTRAINT login_myuser_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.login_myuser DROP CONSTRAINT login_myuser_pkey;
       public            rebo    false    225            �           2606    36156 \   login_myuser_user_permissions login_myuser_user_permis_myuser_id_permission_id_42886fd6_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.login_myuser_user_permissions
    ADD CONSTRAINT login_myuser_user_permis_myuser_id_permission_id_42886fd6_uniq UNIQUE (myuser_id, permission_id);
 �   ALTER TABLE ONLY public.login_myuser_user_permissions DROP CONSTRAINT login_myuser_user_permis_myuser_id_permission_id_42886fd6_uniq;
       public            rebo    false    229    229            �           2606    36139 @   login_myuser_user_permissions login_myuser_user_permissions_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.login_myuser_user_permissions
    ADD CONSTRAINT login_myuser_user_permissions_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.login_myuser_user_permissions DROP CONSTRAINT login_myuser_user_permissions_pkey;
       public            rebo    false    229            !           2606    37023     order_gateway order_gateway_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.order_gateway
    ADD CONSTRAINT order_gateway_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.order_gateway DROP CONSTRAINT order_gateway_pkey;
       public            rebo    false    288            (           2606    37056    order_order order_order_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.order_order DROP CONSTRAINT order_order_pkey;
       public            rebo    false    292            #           2606    37035 -   order_payment order_payment_faktor_number_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.order_payment
    ADD CONSTRAINT order_payment_faktor_number_key UNIQUE (faktor_number);
 W   ALTER TABLE ONLY public.order_payment DROP CONSTRAINT order_payment_faktor_number_key;
       public            rebo    false    290            %           2606    37033     order_payment order_payment_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.order_payment
    ADD CONSTRAINT order_payment_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.order_payment DROP CONSTRAINT order_payment_pkey;
       public            rebo    false    290                       2606    36569 4   transaction_transaction transaction_transaction_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.transaction_transaction
    ADD CONSTRAINT transaction_transaction_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.transaction_transaction DROP CONSTRAINT transaction_transaction_pkey;
       public            rebo    false    276                       2606    36593 D   transaction_transfertransaction transaction_transfertransaction_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.transaction_transfertransaction
    ADD CONSTRAINT transaction_transfertransaction_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.transaction_transfertransaction DROP CONSTRAINT transaction_transfertransaction_pkey;
       public            rebo    false    282                       2606    36586 4   transaction_userbalance transaction_userbalance_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.transaction_userbalance
    ADD CONSTRAINT transaction_userbalance_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.transaction_userbalance DROP CONSTRAINT transaction_userbalance_pkey;
       public            rebo    false    280                       2606    36997 E   transaction_userbalance transaction_userbalance_user_id_f3bee767_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.transaction_userbalance
    ADD CONSTRAINT transaction_userbalance_user_id_f3bee767_uniq UNIQUE (user_id);
 o   ALTER TABLE ONLY public.transaction_userbalance DROP CONSTRAINT transaction_userbalance_user_id_f3bee767_uniq;
       public            rebo    false    280                       2606    36577 0   transaction_userscore transaction_userscore_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.transaction_userscore
    ADD CONSTRAINT transaction_userscore_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.transaction_userscore DROP CONSTRAINT transaction_userscore_pkey;
       public            rebo    false    278                       2606    36579 7   transaction_userscore transaction_userscore_user_id_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.transaction_userscore
    ADD CONSTRAINT transaction_userscore_user_id_key UNIQUE (user_id);
 a   ALTER TABLE ONLY public.transaction_userscore DROP CONSTRAINT transaction_userscore_user_id_key;
       public            rebo    false    278            �           1259    36099    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            rebo    false    221            �           1259    36112 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            rebo    false    223            �           1259    36113 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            rebo    false    223            �           1259    36098 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            rebo    false    219            �           1259    36268 "   catalogue_brand_parent_id_24832d41    INDEX     c   CREATE INDEX catalogue_brand_parent_id_24832d41 ON public.catalogue_brand USING btree (parent_id);
 6   DROP INDEX public.catalogue_brand_parent_id_24832d41;
       public            rebo    false    233            �           1259    36274 %   catalogue_category_parent_id_4479cbbf    INDEX     i   CREATE INDEX catalogue_category_parent_id_4479cbbf ON public.catalogue_category USING btree (parent_id);
 9   DROP INDEX public.catalogue_category_parent_id_4479cbbf;
       public            rebo    false    235            �           1259    37129 *   catalogue_product_product_type_id_8830735d    INDEX     s   CREATE INDEX catalogue_product_product_type_id_8830735d ON public.catalogue_product USING btree (product_type_id);
 >   DROP INDEX public.catalogue_product_product_type_id_8830735d;
       public            rebo    false    237            �           1259    36307 "   catalogue_product_user_id_4f5f89a3    INDEX     c   CREATE INDEX catalogue_product_user_id_4f5f89a3 ON public.catalogue_product USING btree (user_id);
 6   DROP INDEX public.catalogue_product_user_id_4f5f89a3;
       public            rebo    false    237            *           1259    37138 &   catalogue_productattr_attr_id_4d1622f6    INDEX     k   CREATE INDEX catalogue_productattr_attr_id_4d1622f6 ON public.catalogue_productattr USING btree (attr_id);
 :   DROP INDEX public.catalogue_productattr_attr_id_4d1622f6;
       public            rebo    false    294            -           1259    37075 )   catalogue_productattr_product_id_fd2ed3ce    INDEX     q   CREATE INDEX catalogue_productattr_product_id_fd2ed3ce ON public.catalogue_productattr USING btree (product_id);
 =   DROP INDEX public.catalogue_productattr_product_id_fd2ed3ce;
       public            rebo    false    294            .           1259    37144 &   catalogue_productattr_type_id_74ab9c6d    INDEX     k   CREATE INDEX catalogue_productattr_type_id_74ab9c6d ON public.catalogue_productattr USING btree (type_id);
 :   DROP INDEX public.catalogue_productattr_type_id_74ab9c6d;
       public            rebo    false    294            /           1259    37094 '   catalogue_productattr_value_id_97c94455    INDEX     m   CREATE INDEX catalogue_productattr_value_id_97c94455 ON public.catalogue_productattr USING btree (value_id);
 ;   DROP INDEX public.catalogue_productattr_value_id_97c94455;
       public            rebo    false    294            �           1259    36305 3   catalogue_productattribute_product_type_id_1a8b6bc8    INDEX     �   CREATE INDEX catalogue_productattribute_product_type_id_1a8b6bc8 ON public.catalogue_productattribute USING btree (product_type_id);
 G   DROP INDEX public.catalogue_productattribute_product_type_id_1a8b6bc8;
       public            rebo    false    239            �           1259    36304 =   catalogue_productattributevalue_product_attribute_id_884dda21    INDEX     �   CREATE INDEX catalogue_productattributevalue_product_attribute_id_884dda21 ON public.catalogue_productattributevalue USING btree (product_attribute_id);
 Q   DROP INDEX public.catalogue_productattributevalue_product_attribute_id_884dda21;
       public            rebo    false    245            �           1259    36292 *   catalogue_productimage_product_id_49474fe8    INDEX     s   CREATE INDEX catalogue_productimage_product_id_49474fe8 ON public.catalogue_productimage USING btree (product_id);
 >   DROP INDEX public.catalogue_productimage_product_id_49474fe8;
       public            rebo    false    243            �           1259    36399 $   company_customer_company_id_650d5ee9    INDEX     g   CREATE INDEX company_customer_company_id_650d5ee9 ON public.company_customer USING btree (company_id);
 8   DROP INDEX public.company_customer_company_id_650d5ee9;
       public            rebo    false    249            �           1259    36475 ,   company_customerbalance_customer_id_6376b99f    INDEX     w   CREATE INDEX company_customerbalance_customer_id_6376b99f ON public.company_customerbalance USING btree (customer_id);
 @   DROP INDEX public.company_customerbalance_customer_id_6376b99f;
       public            rebo    false    263            �           1259    36476 ,   company_customerbalance_typedate_id_22941b4b    INDEX     w   CREATE INDEX company_customerbalance_typedate_id_22941b4b ON public.company_customerbalance USING btree (typedate_id);
 @   DROP INDEX public.company_customerbalance_typedate_id_22941b4b;
       public            rebo    false    263            �           1259    36405 "   company_driver_company_id_d2b05ef3    INDEX     c   CREATE INDEX company_driver_company_id_d2b05ef3 ON public.company_driver USING btree (company_id);
 6   DROP INDEX public.company_driver_company_id_d2b05ef3;
       public            rebo    false    251            �           1259    36411 $   company_location_company_id_3bbe51ef    INDEX     g   CREATE INDEX company_location_company_id_3bbe51ef ON public.company_location USING btree (company_id);
 8   DROP INDEX public.company_location_company_id_3bbe51ef;
       public            rebo    false    253            �           1259    36464 "   company_staff_location_id_2a688779    INDEX     c   CREATE INDEX company_staff_location_id_2a688779 ON public.company_staff USING btree (location_id);
 6   DROP INDEX public.company_staff_location_id_2a688779;
       public            rebo    false    261            �           1259    36457 .   company_transferwarehouse_typedate_id_70502401    INDEX     {   CREATE INDEX company_transferwarehouse_typedate_id_70502401 ON public.company_transferwarehouse USING btree (typedate_id);
 B   DROP INDEX public.company_transferwarehouse_typedate_id_70502401;
       public            rebo    false    259            �           1259    36417 %   company_typedates_company_id_06244068    INDEX     i   CREATE INDEX company_typedates_company_id_06244068 ON public.company_typedates USING btree (company_id);
 9   DROP INDEX public.company_typedates_company_id_06244068;
       public            rebo    false    255            �           1259    36438 %   company_warehouse_company_id_017526bf    INDEX     i   CREATE INDEX company_warehouse_company_id_017526bf ON public.company_warehouse USING btree (company_id);
 9   DROP INDEX public.company_warehouse_company_id_017526bf;
       public            rebo    false    257            �           1259    36439 &   company_warehouse_customer_id_a8b5cbbf    INDEX     k   CREATE INDEX company_warehouse_customer_id_a8b5cbbf ON public.company_warehouse USING btree (customer_id);
 :   DROP INDEX public.company_warehouse_customer_id_a8b5cbbf;
       public            rebo    false    257            �           1259    36440 $   company_warehouse_driver_id_6348ffae    INDEX     g   CREATE INDEX company_warehouse_driver_id_6348ffae ON public.company_warehouse USING btree (driver_id);
 8   DROP INDEX public.company_warehouse_driver_id_6348ffae;
       public            rebo    false    257            �           1259    36441 &   company_warehouse_typedate_id_b2c4802c    INDEX     k   CREATE INDEX company_warehouse_typedate_id_b2c4802c ON public.company_warehouse USING btree (typedate_id);
 :   DROP INDEX public.company_warehouse_typedate_id_b2c4802c;
       public            rebo    false    257            �           1259    36189 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            rebo    false    231            �           1259    36190 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            rebo    false    231                       1259    36561 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            rebo    false    274            	           1259    36560 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            rebo    false    274            �           1259    36537 #   hoghoogh_amar_listprice_id_2094ab3a    INDEX     e   CREATE INDEX hoghoogh_amar_listprice_id_2094ab3a ON public.hoghoogh_amar USING btree (listprice_id);
 7   DROP INDEX public.hoghoogh_amar_listprice_id_2094ab3a;
       public            rebo    false    271            �           1259    45663 "   hoghoogh_amar_location_id_4395a7ee    INDEX     c   CREATE INDEX hoghoogh_amar_location_id_4395a7ee ON public.hoghoogh_amar USING btree (location_id);
 6   DROP INDEX public.hoghoogh_amar_location_id_4395a7ee;
       public            rebo    false    271                       1259    36538    hoghoogh_amar_staff_id_8bdd7d06    INDEX     ]   CREATE INDEX hoghoogh_amar_staff_id_8bdd7d06 ON public.hoghoogh_amar USING btree (staff_id);
 3   DROP INDEX public.hoghoogh_amar_staff_id_8bdd7d06;
       public            rebo    false    271            =           1259    45656 )   hoghoogh_amararchive_location_id_d853a6b1    INDEX     q   CREATE INDEX hoghoogh_amararchive_location_id_d853a6b1 ON public.hoghoogh_amararchive USING btree (location_id);
 =   DROP INDEX public.hoghoogh_amararchive_location_id_d853a6b1;
       public            rebo    false    304            �           1259    37260 &   hoghoogh_hoghoogh_location_id_9d176494    INDEX     k   CREATE INDEX hoghoogh_hoghoogh_location_id_9d176494 ON public.hoghoogh_hoghoogh USING btree (location_id);
 :   DROP INDEX public.hoghoogh_hoghoogh_location_id_9d176494;
       public            rebo    false    269            @           1259    45727 -   hoghoogh_hoghoogharchive_location_id_65910b75    INDEX     y   CREATE INDEX hoghoogh_hoghoogharchive_location_id_65910b75 ON public.hoghoogh_hoghoogharchive USING btree (location_id);
 A   DROP INDEX public.hoghoogh_hoghoogharchive_location_id_65910b75;
       public            rebo    false    306            C           1259    45744 *   hoghoogh_hoghoogharchive_staff_id_bab4400a    INDEX     s   CREATE INDEX hoghoogh_hoghoogharchive_staff_id_bab4400a ON public.hoghoogh_hoghoogharchive USING btree (staff_id);
 >   DROP INDEX public.hoghoogh_hoghoogharchive_staff_id_bab4400a;
       public            rebo    false    306            �           1259    36520 '   hoghoogh_listprice_location_id_56f7b7e3    INDEX     m   CREATE INDEX hoghoogh_listprice_location_id_56f7b7e3 ON public.hoghoogh_listprice USING btree (location_id);
 ;   DROP INDEX public.hoghoogh_listprice_location_id_56f7b7e3;
       public            rebo    false    267                       1259    36967 (   hoghoogh_sarparasti_location_id_eb698592    INDEX     o   CREATE INDEX hoghoogh_sarparasti_location_id_eb698592 ON public.hoghoogh_sarparasti USING btree (location_id);
 <   DROP INDEX public.hoghoogh_sarparasti_location_id_eb698592;
       public            rebo    false    284                       1259    45750 %   hoghoogh_sarparasti_staff_id_3642d1ae    INDEX     i   CREATE INDEX hoghoogh_sarparasti_staff_id_3642d1ae ON public.hoghoogh_sarparasti USING btree (staff_id);
 9   DROP INDEX public.hoghoogh_sarparasti_staff_id_3642d1ae;
       public            rebo    false    284                       1259    36968 #   hoghoogh_tolid_location_id_789b0c30    INDEX     e   CREATE INDEX hoghoogh_tolid_location_id_789b0c30 ON public.hoghoogh_tolid USING btree (location_id);
 7   DROP INDEX public.hoghoogh_tolid_location_id_789b0c30;
       public            rebo    false    286            0           1259    37503     learn_learn_category_id_bb3a6476    INDEX     _   CREATE INDEX learn_learn_category_id_bb3a6476 ON public.learn_learn USING btree (category_id);
 4   DROP INDEX public.learn_learn_category_id_bb3a6476;
       public            rebo    false    296            3           1259    37234    learn_learn_type_id_d2f7842e    INDEX     W   CREATE INDEX learn_learn_type_id_d2f7842e ON public.learn_learn USING btree (type_id);
 0   DROP INDEX public.learn_learn_type_id_d2f7842e;
       public            rebo    false    296            4           1259    37235    learn_learn_user_id_ff700ef6    INDEX     W   CREATE INDEX learn_learn_user_id_ff700ef6 ON public.learn_learn USING btree (user_id);
 0   DROP INDEX public.learn_learn_user_id_ff700ef6;
       public            rebo    false    296            :           1259    37247     learn_lesson_section_id_2dc3b40f    INDEX     _   CREATE INDEX learn_lesson_section_id_2dc3b40f ON public.learn_lesson USING btree (section_id);
 4   DROP INDEX public.learn_lesson_section_id_2dc3b40f;
       public            rebo    false    300            5           1259    37241    learn_section_learn_id_68e7b05d    INDEX     ]   CREATE INDEX learn_section_learn_id_68e7b05d ON public.learn_section USING btree (learn_id);
 3   DROP INDEX public.learn_section_learn_id_68e7b05d;
       public            rebo    false    298            �           1259    36154 %   login_myuser_groups_group_id_2b306aee    INDEX     i   CREATE INDEX login_myuser_groups_group_id_2b306aee ON public.login_myuser_groups USING btree (group_id);
 9   DROP INDEX public.login_myuser_groups_group_id_2b306aee;
       public            rebo    false    227            �           1259    36153 &   login_myuser_groups_myuser_id_28d9709d    INDEX     k   CREATE INDEX login_myuser_groups_myuser_id_28d9709d ON public.login_myuser_groups USING btree (myuser_id);
 :   DROP INDEX public.login_myuser_groups_myuser_id_28d9709d;
       public            rebo    false    227            �           1259    36140 !   login_myuser_mobile_fd488a40_like    INDEX     p   CREATE INDEX login_myuser_mobile_fd488a40_like ON public.login_myuser USING btree (mobile varchar_pattern_ops);
 5   DROP INDEX public.login_myuser_mobile_fd488a40_like;
       public            rebo    false    225            �           1259    36167 0   login_myuser_user_permissions_myuser_id_6bc09590    INDEX        CREATE INDEX login_myuser_user_permissions_myuser_id_6bc09590 ON public.login_myuser_user_permissions USING btree (myuser_id);
 D   DROP INDEX public.login_myuser_user_permissions_myuser_id_6bc09590;
       public            rebo    false    229            �           1259    36168 4   login_myuser_user_permissions_permission_id_7376f5bb    INDEX     �   CREATE INDEX login_myuser_user_permissions_permission_id_7376f5bb ON public.login_myuser_user_permissions USING btree (permission_id);
 H   DROP INDEX public.login_myuser_user_permissions_permission_id_7376f5bb;
       public            rebo    false    229            )           1259    37062    order_order_user_id_7cf9bc2b    INDEX     W   CREATE INDEX order_order_user_id_7cf9bc2b ON public.order_order USING btree (user_id);
 0   DROP INDEX public.order_order_user_id_7cf9bc2b;
       public            rebo    false    292            &           1259    37041    order_payment_user_id_51d05b30    INDEX     [   CREATE INDEX order_payment_user_id_51d05b30 ON public.order_payment USING btree (user_id);
 2   DROP INDEX public.order_payment_user_id_51d05b30;
       public            rebo    false    290                       1259    36603 (   transaction_transaction_user_id_9105ab00    INDEX     o   CREATE INDEX transaction_transaction_user_id_9105ab00 ON public.transaction_transaction USING btree (user_id);
 <   DROP INDEX public.transaction_transaction_user_id_9105ab00;
       public            rebo    false    276                       1259    37003 ;   transaction_transfertransa_received_transaction_id_1d1fb16f    INDEX     �   CREATE INDEX transaction_transfertransa_received_transaction_id_1d1fb16f ON public.transaction_transfertransaction USING btree (received_transaction_id);
 O   DROP INDEX public.transaction_transfertransa_received_transaction_id_1d1fb16f;
       public            rebo    false    282                       1259    37009 >   transaction_transfertransaction_sender_transaction_id_21f2c4f7    INDEX     �   CREATE INDEX transaction_transfertransaction_sender_transaction_id_21f2c4f7 ON public.transaction_transfertransaction USING btree (sender_transaction_id);
 R   DROP INDEX public.transaction_transfertransaction_sender_transaction_id_21f2c4f7;
       public            rebo    false    282            E           2606    36107 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          rebo    false    223    3477    219            F           2606    36102 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          rebo    false    221    3482    223            D           2606    36093 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          rebo    false    219    217    3472            M           2606    36263 H   catalogue_brand catalogue_brand_parent_id_24832d41_fk_catalogue_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_brand
    ADD CONSTRAINT catalogue_brand_parent_id_24832d41_fk_catalogue_brand_id FOREIGN KEY (parent_id) REFERENCES public.catalogue_brand(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.catalogue_brand DROP CONSTRAINT catalogue_brand_parent_id_24832d41_fk_catalogue_brand_id;
       public          rebo    false    233    233    3512            N           2606    36269 Q   catalogue_category catalogue_category_parent_id_4479cbbf_fk_catalogue_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_category
    ADD CONSTRAINT catalogue_category_parent_id_4479cbbf_fk_catalogue_category_id FOREIGN KEY (parent_id) REFERENCES public.catalogue_category(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.catalogue_category DROP CONSTRAINT catalogue_category_parent_id_4479cbbf_fk_catalogue_category_id;
       public          rebo    false    235    235    3515            O           2606    37130 I   catalogue_product catalogue_product_product_type_id_8830735d_fk_catalogue    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_product
    ADD CONSTRAINT catalogue_product_product_type_id_8830735d_fk_catalogue FOREIGN KEY (product_type_id) REFERENCES public.catalogue_producttype(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.catalogue_product DROP CONSTRAINT catalogue_product_product_type_id_8830735d_fk_catalogue;
       public          rebo    false    3526    241    237            P           2606    36258 G   catalogue_product catalogue_product_user_id_4f5f89a3_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_product
    ADD CONSTRAINT catalogue_product_user_id_4f5f89a3_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.catalogue_product DROP CONSTRAINT catalogue_product_user_id_4f5f89a3_fk_login_myuser_id;
       public          rebo    false    3493    237    225            u           2606    37139 H   catalogue_productattr catalogue_productatt_attr_id_4d1622f6_fk_catalogue    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_productattr
    ADD CONSTRAINT catalogue_productatt_attr_id_4d1622f6_fk_catalogue FOREIGN KEY (attr_id) REFERENCES public.catalogue_productattribute(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.catalogue_productattr DROP CONSTRAINT catalogue_productatt_attr_id_4d1622f6_fk_catalogue;
       public          rebo    false    239    3523    294            S           2606    36298 _   catalogue_productattributevalue catalogue_productatt_product_attribute_id_884dda21_fk_catalogue    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productatt_product_attribute_id_884dda21_fk_catalogue FOREIGN KEY (product_attribute_id) REFERENCES public.catalogue_productattribute(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.catalogue_productattributevalue DROP CONSTRAINT catalogue_productatt_product_attribute_id_884dda21_fk_catalogue;
       public          rebo    false    3523    239    245            v           2606    37100 K   catalogue_productattr catalogue_productatt_product_id_fd2ed3ce_fk_catalogue    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_productattr
    ADD CONSTRAINT catalogue_productatt_product_id_fd2ed3ce_fk_catalogue FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.catalogue_productattr DROP CONSTRAINT catalogue_productatt_product_id_fd2ed3ce_fk_catalogue;
       public          rebo    false    237    294    3517            Q           2606    36248 U   catalogue_productattribute catalogue_productatt_product_type_id_1a8b6bc8_fk_catalogue    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_productattribute
    ADD CONSTRAINT catalogue_productatt_product_type_id_1a8b6bc8_fk_catalogue FOREIGN KEY (product_type_id) REFERENCES public.catalogue_producttype(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.catalogue_productattribute DROP CONSTRAINT catalogue_productatt_product_type_id_1a8b6bc8_fk_catalogue;
       public          rebo    false    239    241    3526            w           2606    37145 H   catalogue_productattr catalogue_productatt_type_id_74ab9c6d_fk_catalogue    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_productattr
    ADD CONSTRAINT catalogue_productatt_type_id_74ab9c6d_fk_catalogue FOREIGN KEY (type_id) REFERENCES public.catalogue_producttype(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.catalogue_productattr DROP CONSTRAINT catalogue_productatt_type_id_74ab9c6d_fk_catalogue;
       public          rebo    false    3526    241    294            x           2606    37110 I   catalogue_productattr catalogue_productatt_value_id_97c94455_fk_catalogue    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_productattr
    ADD CONSTRAINT catalogue_productatt_value_id_97c94455_fk_catalogue FOREIGN KEY (value_id) REFERENCES public.catalogue_productattributevalue(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.catalogue_productattr DROP CONSTRAINT catalogue_productatt_value_id_97c94455_fk_catalogue;
       public          rebo    false    245    3531    294            R           2606    36287 L   catalogue_productimage catalogue_productima_product_id_49474fe8_fk_catalogue    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalogue_productimage
    ADD CONSTRAINT catalogue_productima_product_id_49474fe8_fk_catalogue FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.catalogue_productimage DROP CONSTRAINT catalogue_productima_product_id_49474fe8_fk_catalogue;
       public          rebo    false    3517    237    243            T           2606    36389 C   company_company company_company_user_id_c99db68c_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_company
    ADD CONSTRAINT company_company_user_id_c99db68c_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.company_company DROP CONSTRAINT company_company_user_id_c99db68c_fk_login_myuser_id;
       public          rebo    false    3493    225    247            U           2606    36394 K   company_customer company_customer_company_id_650d5ee9_fk_company_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_customer
    ADD CONSTRAINT company_customer_company_id_650d5ee9_fk_company_company_id FOREIGN KEY (company_id) REFERENCES public.company_company(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.company_customer DROP CONSTRAINT company_customer_company_id_650d5ee9_fk_company_company_id;
       public          rebo    false    3534    249    247            a           2606    36465 N   company_customerbalance company_customerbala_customer_id_6376b99f_fk_company_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_customerbalance
    ADD CONSTRAINT company_customerbala_customer_id_6376b99f_fk_company_c FOREIGN KEY (customer_id) REFERENCES public.company_customer(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.company_customerbalance DROP CONSTRAINT company_customerbala_customer_id_6376b99f_fk_company_c;
       public          rebo    false    263    3539    249            b           2606    36470 N   company_customerbalance company_customerbala_typedate_id_22941b4b_fk_company_t    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_customerbalance
    ADD CONSTRAINT company_customerbala_typedate_id_22941b4b_fk_company_t FOREIGN KEY (typedate_id) REFERENCES public.company_typedates(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.company_customerbalance DROP CONSTRAINT company_customerbala_typedate_id_22941b4b_fk_company_t;
       public          rebo    false    263    3548    255            V           2606    36400 G   company_driver company_driver_company_id_d2b05ef3_fk_company_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_driver
    ADD CONSTRAINT company_driver_company_id_d2b05ef3_fk_company_company_id FOREIGN KEY (company_id) REFERENCES public.company_company(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.company_driver DROP CONSTRAINT company_driver_company_id_d2b05ef3_fk_company_company_id;
       public          rebo    false    3534    251    247            W           2606    36406 K   company_location company_location_company_id_3bbe51ef_fk_company_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_location
    ADD CONSTRAINT company_location_company_id_3bbe51ef_fk_company_company_id FOREIGN KEY (company_id) REFERENCES public.company_company(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.company_location DROP CONSTRAINT company_location_company_id_3bbe51ef_fk_company_company_id;
       public          rebo    false    253    3534    247            `           2606    36458 G   company_staff company_staff_location_id_2a688779_fk_company_location_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_staff
    ADD CONSTRAINT company_staff_location_id_2a688779_fk_company_location_id FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.company_staff DROP CONSTRAINT company_staff_location_id_2a688779_fk_company_location_id;
       public          rebo    false    253    261    3545            ]           2606    36442 Y   company_transferwarehouse company_transferware_received_transfer_id_36531506_fk_company_w    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_transferwarehouse
    ADD CONSTRAINT company_transferware_received_transfer_id_36531506_fk_company_w FOREIGN KEY (received_transfer_id) REFERENCES public.company_warehouse(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.company_transferwarehouse DROP CONSTRAINT company_transferware_received_transfer_id_36531506_fk_company_w;
       public          rebo    false    259    257    3553            ^           2606    36447 W   company_transferwarehouse company_transferware_sender_transfer_id_ab218b2b_fk_company_w    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_transferwarehouse
    ADD CONSTRAINT company_transferware_sender_transfer_id_ab218b2b_fk_company_w FOREIGN KEY (sender_transfer_id) REFERENCES public.company_warehouse(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.company_transferwarehouse DROP CONSTRAINT company_transferware_sender_transfer_id_ab218b2b_fk_company_w;
       public          rebo    false    257    259    3553            _           2606    36452 P   company_transferwarehouse company_transferware_typedate_id_70502401_fk_company_t    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_transferwarehouse
    ADD CONSTRAINT company_transferware_typedate_id_70502401_fk_company_t FOREIGN KEY (typedate_id) REFERENCES public.company_typedates(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.company_transferwarehouse DROP CONSTRAINT company_transferware_typedate_id_70502401_fk_company_t;
       public          rebo    false    255    3548    259            X           2606    36412 M   company_typedates company_typedates_company_id_06244068_fk_company_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_typedates
    ADD CONSTRAINT company_typedates_company_id_06244068_fk_company_company_id FOREIGN KEY (company_id) REFERENCES public.company_company(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.company_typedates DROP CONSTRAINT company_typedates_company_id_06244068_fk_company_company_id;
       public          rebo    false    255    3534    247            Y           2606    36418 M   company_warehouse company_warehouse_company_id_017526bf_fk_company_company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_warehouse
    ADD CONSTRAINT company_warehouse_company_id_017526bf_fk_company_company_id FOREIGN KEY (company_id) REFERENCES public.company_company(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.company_warehouse DROP CONSTRAINT company_warehouse_company_id_017526bf_fk_company_company_id;
       public          rebo    false    247    257    3534            Z           2606    36423 O   company_warehouse company_warehouse_customer_id_a8b5cbbf_fk_company_customer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_warehouse
    ADD CONSTRAINT company_warehouse_customer_id_a8b5cbbf_fk_company_customer_id FOREIGN KEY (customer_id) REFERENCES public.company_customer(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.company_warehouse DROP CONSTRAINT company_warehouse_customer_id_a8b5cbbf_fk_company_customer_id;
       public          rebo    false    257    3539    249            [           2606    36428 K   company_warehouse company_warehouse_driver_id_6348ffae_fk_company_driver_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_warehouse
    ADD CONSTRAINT company_warehouse_driver_id_6348ffae_fk_company_driver_id FOREIGN KEY (driver_id) REFERENCES public.company_driver(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.company_warehouse DROP CONSTRAINT company_warehouse_driver_id_6348ffae_fk_company_driver_id;
       public          rebo    false    257    3542    251            \           2606    36433 P   company_warehouse company_warehouse_typedate_id_b2c4802c_fk_company_typedates_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_warehouse
    ADD CONSTRAINT company_warehouse_typedate_id_b2c4802c_fk_company_typedates_id FOREIGN KEY (typedate_id) REFERENCES public.company_typedates(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.company_warehouse DROP CONSTRAINT company_warehouse_typedate_id_b2c4802c_fk_company_typedates_id;
       public          rebo    false    255    257    3548            K           2606    36179 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          rebo    false    3472    231    217            L           2606    36184 E   django_admin_log django_admin_log_user_id_c564eba6_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_login_myuser_id;
       public          rebo    false    225    231    3493            g           2606    36527 J   hoghoogh_amar hoghoogh_amar_listprice_id_2094ab3a_fk_hoghoogh_listprice_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_amar
    ADD CONSTRAINT hoghoogh_amar_listprice_id_2094ab3a_fk_hoghoogh_listprice_id FOREIGN KEY (listprice_id) REFERENCES public.hoghoogh_listprice(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.hoghoogh_amar DROP CONSTRAINT hoghoogh_amar_listprice_id_2094ab3a_fk_hoghoogh_listprice_id;
       public          rebo    false    271    3575    267            h           2606    45658 G   hoghoogh_amar hoghoogh_amar_location_id_4395a7ee_fk_company_location_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_amar
    ADD CONSTRAINT hoghoogh_amar_location_id_4395a7ee_fk_company_location_id FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.hoghoogh_amar DROP CONSTRAINT hoghoogh_amar_location_id_4395a7ee_fk_company_location_id;
       public          rebo    false    271    3545    253            i           2606    36532 A   hoghoogh_amar hoghoogh_amar_staff_id_8bdd7d06_fk_company_staff_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_amar
    ADD CONSTRAINT hoghoogh_amar_staff_id_8bdd7d06_fk_company_staff_id FOREIGN KEY (staff_id) REFERENCES public.company_staff(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.hoghoogh_amar DROP CONSTRAINT hoghoogh_amar_staff_id_8bdd7d06_fk_company_staff_id;
       public          rebo    false    271    3564    261            ~           2606    45651 K   hoghoogh_amararchive hoghoogh_amararchive_location_id_d853a6b1_fk_company_l    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_amararchive
    ADD CONSTRAINT hoghoogh_amararchive_location_id_d853a6b1_fk_company_l FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.hoghoogh_amararchive DROP CONSTRAINT hoghoogh_amararchive_location_id_d853a6b1_fk_company_l;
       public          rebo    false    304    3545    253            e           2606    37255 O   hoghoogh_hoghoogh hoghoogh_hoghoogh_location_id_9d176494_fk_company_location_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_hoghoogh
    ADD CONSTRAINT hoghoogh_hoghoogh_location_id_9d176494_fk_company_location_id FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.hoghoogh_hoghoogh DROP CONSTRAINT hoghoogh_hoghoogh_location_id_9d176494_fk_company_location_id;
       public          rebo    false    253    3545    269            f           2606    36636 I   hoghoogh_hoghoogh hoghoogh_hoghoogh_staff_id_d7431c1e_fk_company_staff_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_hoghoogh
    ADD CONSTRAINT hoghoogh_hoghoogh_staff_id_d7431c1e_fk_company_staff_id FOREIGN KEY (staff_id) REFERENCES public.company_staff(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.hoghoogh_hoghoogh DROP CONSTRAINT hoghoogh_hoghoogh_staff_id_d7431c1e_fk_company_staff_id;
       public          rebo    false    261    3564    269                       2606    45717 O   hoghoogh_hoghoogharchive hoghoogh_hoghoogharc_location_id_65910b75_fk_company_l    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_hoghoogharchive
    ADD CONSTRAINT hoghoogh_hoghoogharc_location_id_65910b75_fk_company_l FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.hoghoogh_hoghoogharchive DROP CONSTRAINT hoghoogh_hoghoogharc_location_id_65910b75_fk_company_l;
       public          rebo    false    306    3545    253            �           2606    45745 W   hoghoogh_hoghoogharchive hoghoogh_hoghoogharchive_staff_id_bab4400a_fk_company_staff_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_hoghoogharchive
    ADD CONSTRAINT hoghoogh_hoghoogharchive_staff_id_bab4400a_fk_company_staff_id FOREIGN KEY (staff_id) REFERENCES public.company_staff(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.hoghoogh_hoghoogharchive DROP CONSTRAINT hoghoogh_hoghoogharchive_staff_id_bab4400a_fk_company_staff_id;
       public          rebo    false    261    306    3564            d           2606    36515 Q   hoghoogh_listprice hoghoogh_listprice_location_id_56f7b7e3_fk_company_location_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_listprice
    ADD CONSTRAINT hoghoogh_listprice_location_id_56f7b7e3_fk_company_location_id FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.hoghoogh_listprice DROP CONSTRAINT hoghoogh_listprice_location_id_56f7b7e3_fk_company_location_id;
       public          rebo    false    3545    267    253            p           2606    36956 S   hoghoogh_sarparasti hoghoogh_sarparasti_location_id_eb698592_fk_company_location_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_sarparasti
    ADD CONSTRAINT hoghoogh_sarparasti_location_id_eb698592_fk_company_location_id FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.hoghoogh_sarparasti DROP CONSTRAINT hoghoogh_sarparasti_location_id_eb698592_fk_company_location_id;
       public          rebo    false    284    253    3545            q           2606    45751 M   hoghoogh_sarparasti hoghoogh_sarparasti_staff_id_3642d1ae_fk_company_staff_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_sarparasti
    ADD CONSTRAINT hoghoogh_sarparasti_staff_id_3642d1ae_fk_company_staff_id FOREIGN KEY (staff_id) REFERENCES public.company_staff(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.hoghoogh_sarparasti DROP CONSTRAINT hoghoogh_sarparasti_staff_id_3642d1ae_fk_company_staff_id;
       public          rebo    false    284    3564    261            c           2606    36510 O   hoghoogh_settinghoghoogh hoghoogh_settinghogh_location_id_32546bba_fk_company_l    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_settinghoghoogh
    ADD CONSTRAINT hoghoogh_settinghogh_location_id_32546bba_fk_company_l FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.hoghoogh_settinghoghoogh DROP CONSTRAINT hoghoogh_settinghogh_location_id_32546bba_fk_company_l;
       public          rebo    false    3545    265    253            r           2606    36962 I   hoghoogh_tolid hoghoogh_tolid_location_id_789b0c30_fk_company_location_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh_tolid
    ADD CONSTRAINT hoghoogh_tolid_location_id_789b0c30_fk_company_location_id FOREIGN KEY (location_id) REFERENCES public.company_location(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.hoghoogh_tolid DROP CONSTRAINT hoghoogh_tolid_location_id_789b0c30_fk_company_location_id;
       public          rebo    false    286    3545    253            j           2606    36548 7   info_info info_info_user_id_3a27f45c_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.info_info
    ADD CONSTRAINT info_info_user_id_3a27f45c_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.info_info DROP CONSTRAINT info_info_user_id_3a27f45c_fk_login_myuser_id;
       public          rebo    false    225    273    3493            y           2606    37498 A   learn_learn learn_learn_category_id_bb3a6476_fk_learn_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.learn_learn
    ADD CONSTRAINT learn_learn_category_id_bb3a6476_fk_learn_category_id FOREIGN KEY (category_id) REFERENCES public.learn_category(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.learn_learn DROP CONSTRAINT learn_learn_category_id_bb3a6476_fk_learn_category_id;
       public          rebo    false    3644    302    296            z           2606    37224 D   learn_learn learn_learn_type_id_d2f7842e_fk_catalogue_producttype_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.learn_learn
    ADD CONSTRAINT learn_learn_type_id_d2f7842e_fk_catalogue_producttype_id FOREIGN KEY (type_id) REFERENCES public.catalogue_producttype(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.learn_learn DROP CONSTRAINT learn_learn_type_id_d2f7842e_fk_catalogue_producttype_id;
       public          rebo    false    3526    241    296            {           2606    37229 ;   learn_learn learn_learn_user_id_ff700ef6_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.learn_learn
    ADD CONSTRAINT learn_learn_user_id_ff700ef6_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.learn_learn DROP CONSTRAINT learn_learn_user_id_ff700ef6_fk_login_myuser_id;
       public          rebo    false    225    296    3493            }           2606    37242 A   learn_lesson learn_lesson_section_id_2dc3b40f_fk_learn_section_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.learn_lesson
    ADD CONSTRAINT learn_lesson_section_id_2dc3b40f_fk_learn_section_id FOREIGN KEY (section_id) REFERENCES public.learn_section(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.learn_lesson DROP CONSTRAINT learn_lesson_section_id_2dc3b40f_fk_learn_section_id;
       public          rebo    false    298    3639    300            |           2606    37236 ?   learn_section learn_section_learn_id_68e7b05d_fk_learn_learn_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.learn_section
    ADD CONSTRAINT learn_section_learn_id_68e7b05d_fk_learn_learn_id FOREIGN KEY (learn_id) REFERENCES public.learn_learn(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.learn_section DROP CONSTRAINT learn_section_learn_id_68e7b05d_fk_learn_learn_id;
       public          rebo    false    3634    298    296            G           2606    36148 J   login_myuser_groups login_myuser_groups_group_id_2b306aee_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.login_myuser_groups
    ADD CONSTRAINT login_myuser_groups_group_id_2b306aee_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.login_myuser_groups DROP CONSTRAINT login_myuser_groups_group_id_2b306aee_fk_auth_group_id;
       public          rebo    false    227    221    3482            H           2606    36143 M   login_myuser_groups login_myuser_groups_myuser_id_28d9709d_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.login_myuser_groups
    ADD CONSTRAINT login_myuser_groups_myuser_id_28d9709d_fk_login_myuser_id FOREIGN KEY (myuser_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.login_myuser_groups DROP CONSTRAINT login_myuser_groups_myuser_id_28d9709d_fk_login_myuser_id;
       public          rebo    false    227    225    3493            I           2606    36157 R   login_myuser_user_permissions login_myuser_user_pe_myuser_id_6bc09590_fk_login_myu    FK CONSTRAINT     �   ALTER TABLE ONLY public.login_myuser_user_permissions
    ADD CONSTRAINT login_myuser_user_pe_myuser_id_6bc09590_fk_login_myu FOREIGN KEY (myuser_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.login_myuser_user_permissions DROP CONSTRAINT login_myuser_user_pe_myuser_id_6bc09590_fk_login_myu;
       public          rebo    false    229    225    3493            J           2606    36162 V   login_myuser_user_permissions login_myuser_user_pe_permission_id_7376f5bb_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.login_myuser_user_permissions
    ADD CONSTRAINT login_myuser_user_pe_permission_id_7376f5bb_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.login_myuser_user_permissions DROP CONSTRAINT login_myuser_user_pe_permission_id_7376f5bb_fk_auth_perm;
       public          rebo    false    3477    229    219            t           2606    37057 ;   order_order order_order_user_id_7cf9bc2b_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_user_id_7cf9bc2b_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.order_order DROP CONSTRAINT order_order_user_id_7cf9bc2b_fk_login_myuser_id;
       public          rebo    false    292    225    3493            s           2606    37036 ?   order_payment order_payment_user_id_51d05b30_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_payment
    ADD CONSTRAINT order_payment_user_id_51d05b30_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.order_payment DROP CONSTRAINT order_payment_user_id_51d05b30_fk_login_myuser_id;
       public          rebo    false    225    3493    290            k           2606    36598 S   transaction_transaction transaction_transaction_user_id_9105ab00_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_transaction
    ADD CONSTRAINT transaction_transaction_user_id_9105ab00_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.transaction_transaction DROP CONSTRAINT transaction_transaction_user_id_9105ab00_fk_login_myuser_id;
       public          rebo    false    3493    225    276            n           2606    37004 _   transaction_transfertransaction transaction_transfer_received_transaction_1d1fb16f_fk_transacti    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_transfertransaction
    ADD CONSTRAINT transaction_transfer_received_transaction_1d1fb16f_fk_transacti FOREIGN KEY (received_transaction_id) REFERENCES public.transaction_transaction(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.transaction_transfertransaction DROP CONSTRAINT transaction_transfer_received_transaction_1d1fb16f_fk_transacti;
       public          rebo    false    276    3595    282            o           2606    37010 _   transaction_transfertransaction transaction_transfer_sender_transaction_i_21f2c4f7_fk_transacti    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_transfertransaction
    ADD CONSTRAINT transaction_transfer_sender_transaction_i_21f2c4f7_fk_transacti FOREIGN KEY (sender_transaction_id) REFERENCES public.transaction_transaction(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.transaction_transfertransaction DROP CONSTRAINT transaction_transfer_sender_transaction_i_21f2c4f7_fk_transacti;
       public          rebo    false    3595    282    276            m           2606    36998 S   transaction_userbalance transaction_userbalance_user_id_f3bee767_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_userbalance
    ADD CONSTRAINT transaction_userbalance_user_id_f3bee767_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.transaction_userbalance DROP CONSTRAINT transaction_userbalance_user_id_f3bee767_fk_login_myuser_id;
       public          rebo    false    280    225    3493            l           2606    36604 O   transaction_userscore transaction_userscore_user_id_3bbbb53e_fk_login_myuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_userscore
    ADD CONSTRAINT transaction_userscore_user_id_3bbbb53e_fk_login_myuser_id FOREIGN KEY (user_id) REFERENCES public.login_myuser(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.transaction_userscore DROP CONSTRAINT transaction_userscore_user_id_3bbbb53e_fk_login_myuser_id;
       public          rebo    false    278    3493    225                  x������ � �            x������ � �         4  x�}��n�8���S�	����L�=�a�	����8lː���˰��*����|m�$V���ᱽ���~v���2�����I�ru@v����%6�w�nBP\����죋�2)�v��8����A�v+3���5�H��$�x�H�6�<��J�q��ɨ�JH��dT�$�6)2T��&)���ɿ���~����(�`U��K�F�J���	%:���uR=v�ic{�����-j��*ϰzn��hPH�}��>��Z+W�d^�$�V� �#!��Ҵ��/�4�&��ס��vS�׮�uox\��Z�!<`�X�@�۩;��Hv��q�!Qq�H�H`\u �7&� s��%᳷�t+�e�ٺ�ls����'�{r�[�?������I`��!>�C5w�.B�p�#�E��p0^�Pb`�O��xn�Ud��[G]�2�2-�)�{�f�����e�n�}��W����-ȰO�ts�|��6��O)�搹�ɧ����5�NЯ�$s"�:s�<����y�*�AuΚc��K7̦�|?A��$���y
@N-�>`����p{�B�9�k{j/;YL��~i�Z�%�4��\9KN��>BƮ���js��13w�`B�W�܊�
$(5�\
0H5�	h�j��>w�q���Lk�Z�᝖���k���y�%�R�%��ƭy3�3��@�ng2����4���@�;N�ˋ��B�ں5P�xlKyL�xfK�H9���5��o��>2��wƇz�֛<�.f B�y�h�:��9g� ��	3�|�o��Ҭ+�!{(�Ҁ"_(���C(aNx������3m���C�P�G+?r�J`��H�U�[�)W�n���6�<o�u㶴��Y��`�C!8��)�Rn�@s�3= P�%�<���,��9��,���2g����3t�mO�S/ݖL��T �<��T0�����%�x�	���Y����'�B��N!��0������%�Q��$Y)�C�EaXU
�A�M�w~v�t�������]:��Ʊz�*�H�Q�v]$���]��az/�W��[���G���I�H�Wᆐ3�C ��i��q�~G=9�|�z��cl�DF/0�nHp��X�0T��9�>z�M�!�E��%w䟘Q�T��)?����8e�Z��=H�6.�'�c��� �E��pk�OG�M��|T�����cߏ�x�X�KQ�� s���\�]���f��C�b�ArEc�A�FĤ����sw�Z�����b���k/�\MЙx���	:.�^�����MBZ�O�\A�q��@�U@��e4h j�P���M���\  �smI"����I�Um�����];�A ����` D�{���� p� ���Gg%�QۍO�|�T�� �GGWz���՝ �'�q��%i.|z櫺2�5�{�L��0��+���[��bv�S2��w�*�%'���b
~ؕ���:��o��WII�|���O�|)G�|
�*7����x:l������^
�	���yT�S 9'̶c
7�a�9Cп9��3Xkp      "   C   x�3伱����7����7�n����2��n��Xu��i���2FH�X~c�͖�= �=... ��)�      $   ]   x�3漱��ƛ�7�+�Xc�57�n��Z���e��݃����fH�Ev�������n���Q�7�X6E���g9������� �Q�      &   �   x���;n� ��"}d�3�����O��+�N�DH�`������F�P�J�P�ِ��z
Oo�)9M���ƻ�T�? ]��p[�fe!��f�%���ĺ�Sb���Us�m��y�5�3`����o�w9��n5�]J@ߖsL�^$����5jhJ�%R1���p��e��ӥ�<�n�=\��8c�QFs}8�q����X[n��]�G?����f�      _   j   x�5��!CѳS�
���^��:�x@��œ�� |��q��\���eSva?��va��¼8�yq�/�,3�i1�ߪt�|;�i9�r�_�R�9�<�����\!�      (   k   x�m���0��*� �_��|3$��� 	���̀�,�h4˟ؠ�q����c�G+ǔ�u)�,��4�u���BG��(΃u&� 3p����Wo�_8YJq      .   �  x���Mn�0F��)�/"P��:K.��M��=�zQ#q��7���t&�A�H���?�ofL���zٗ�:��~^��nx����Ã�u�;:O�-|�Ё_ ;��D�$�r,}X���!.E����q�������#@#X"J?�J�oo����V震Vg��9�) �A�r���b�	9,�F��rU�j���Cn�E�l	� D��*����F�V�wṼ'М�PeXh��IDd�8����;�d�7T��-ߥ�J�t�o�D����͙}䐫�î.g���h�clӢx�Y��W)�ǜ�� �<	K7 ��>�e�����pβ8N�P~\� ���i�u9�<����$v��H��XBs �Q{ݢ��%ʫ�Q�Јp�����y���z475v�(��q@pDƦ�S�Ƴ �=qno�� zGq�Y|�bN�.��M:�^��Y��6���9��5D�      ,   �   x�u�A� �����Om;�Ĉh�@d��JM-�����Ë�
�����lk�����@���;K����#��d����8�>�OR�l�l��'�X��p�w���Wkݖl&y>�xU�� �w�H0t���P��GR      *   �   x�u�MN�0�u}
�Q����9K��`�{e�ĆsL���BK[�zc[~�d=�l�ͧ���e���m1?n�;�%�iM,\K�6�C�:��i1�%����c?�����:CD5��0+�^�UP�|�O��b�K�¹��RN��0�|��_���~��)�
Pf�E��m/����6F(�d�'.m�Zo�
O���m
!|,���      0   �   x���;n�0Dk��~v��B��e��0�$��B��5�`fi_&R �R����̃�G��������?�i����r�c>r_�E4�K�i��KSo浭Z�]So?�TXJ��br�)�{
+K��_ �&�� �_y�}� �+���\"c�X��v=���Fm��������[<HYP�KĄ1A��<�{x��g-����TU      2      x������ � �      @      x������ � �      4      x������ � �      6   B   x�3伱���[�n����vύ�|C.#�[n�EW*��z�����n�`S���f+PC� �5      >   �	  x��YKr�\O��Kq��}�w�}]@���xZH�4~�>�ygu0�3Zϡ B���ꪬ�����p�v=l���C��_����}��4�P��;m�)��Z��t?w�_��ieM���'�ؿB�{��󟆫5�18������>)�v���a�v݄�-ym��Z����f�@�x �U�xn��D6:��)2�)��W?4:�`{ey|�6솽�����Hda���e�	a���Q6"U�/ ܝ͙g봵z5g���� �@xv�@؟	�J8(��4Ò�8�I9�IQ�C��럇�����cyN޻:�D)���@&�Ȑr$���QU��G��ܜ6&m8�:��ѩ���>�߃�~�_|����/�����s��k)�J%P���Q��	�ʁ��l��娽�:�	��O	���`9�t�b�y/����Dz<~J΁�·*(ypI�0�4䈁�K�d�y�	Az2�79H�l*9����"��*ٕVnAm���8ɂ���1��E-�U���/������x�H�jz�Q`JP�W� ��?"��מ��{�� ŕ�\�4VI����|6@�**������P	�b���Ñ2���"4��E#�x�Djr!���6� ��yКk�Jr��T�7��]),�mj�MK�)R�����,�	8�2r���BK?�lJV?�B-qr��:IiQ�+4��d�1w�Nzł�����־��Vd�� x�`�L�����H{
��";6'���W����vR��2�Y'���*r3a�!=���d����yu r$�^�3pn1E��g)�H�E�<:�uĴI+Q�IJ�N�|�H]�h�&�e#J�)Y��S�J�xS����wL�O�Jk#�!�V�Y&��x/�������wR�2f���_ g�L��~@��X����&`���ĕ)3O�VFw'c3)P��d>��\�#3���'�J_T H>��/�cbN&�H�_zada
���۵��TJ��@h�`�;r�e@W�HGKDN>�.�D���YI�����A�¬C�f3�Zc�<?�g5$0�/g�s�)�OQ�*7��ǜ2�B����~����h����7(^�H��D��m�:Lphb`,�d��,ң\X���}}X��>����s�-:���N�
}�Ls8&�/��2�!�h�������fAJ��`A�4V���d=�z���"F�[���x�W^�Es���I�	rp��T{��6os���e�L"��� RD>���}�T��"cX�X;L� ��P38f<�:�´��6�	^I=6R�0{���a�䈶!xf�C����zW��;?r�������o/J�#$�) ���h�dޘ�!�{���~3)�m�b=:��޵�UDIX>H�l���/þ��;��1��i��h�;N�l���}>�mj=D*��	I��?���rY�n�K�Ғͽ8�)P�a�de\�&������X�`m��rg��1qQn�Z��R~�˰�x6%����sW@11hP��zФg�v�v�.�N�Ь�x}�%���b%Oɮ�;P��sBa��8�$9�f���V�^��V����C�����v����� ��Z@�T�ӥ���*��0\{�I�հ�*��|L��}�mw��e�x�M�x0=B���1G�K�1Ha�U[ӱ�$����m��	V��C����O^g��4vZ�hyX�#&֘��z�ҋvI�#,�専Y�(�O
��Z�=@����W/f޹�Bx����C�9�%��J��b�LI�u�F�n�Z�ÅcJ֢�n�����i����eF�],G�ŒvR̰��b�B��-�׊��'4ayLU��V��C�B��Fx��ȈWa���`B��rY�-����.�%���[N���� t.�l����\��Ȇ%R@�������s��(�/��MtZ9���4�����Y��0ԩ���u`�I����8Z����18�Iƭ3;%fs��-��L���R�uo*��W�5Gh�ME�\U+W���鸮8�@�O�������&����o2FrV����:`Į嵊�G^P�[Q��Q|v�%*��WFA�"k��VQ�M���e�s��	i)����������a��.��	�x��g}E�sf��������[�ғ�#lq�r_]��]&�X����lVW(o�p���)��j��E�J.'c���T`I�HE���-z-҈�L�?��>k��{�,�3������|	���P�ܩ7'Y�	�W]��5���"��渕�S��@�&z�k&s�c�[��k��5̬���jU&j(`��k�ߥU.�Q�6?L<���Uho�����샻ᴶ@��Vq�9r�m�����P1����Q�b���u]%	2ev-����Kڕ�L���?�)�V?�G)�7j��      <      x������ � �      8      x������ � �      :      x������ � �             x��]�n\Ǳ^��b��D]�߳��������E�ń�e�eP�� �%k�Ȇ�`G�,'���1#�L��9��g~ȑě�0@�d}]��UuUu�f�q~�mn� �-��e��7L,���9�1)������tt��򳻧w��?}|�����������|yr~�ӣ����f���^ E'�V�V/V�W�~�v�d��\?�oW�|;�o_���.��㸂���fj�a��B��sµ&6�=G�����g�?�8��ΝaD��в�V8�NJ܎м�����?$p��2h��z�Y'�0R��܂R y�k��%�Y�1+�3�����-�uB�f�j���w�g�������m�-�$[p�S�=�}��J|XH�qP�xs 1���z�\g8��K��$��-����()ے�����Ns-��TmIQJ�C�`γϴ%e)i`;���IضdIK��V2�[+��j 7��T�lzv;Ά]��!�B�WU�"LҖ�n�Lg4�1om��$]�<d���0�M�Z����d̤ۑ8 t|�wz�V��F���~�Hx��-�o�-Ig��(=�j����F��:;q6`�|����.\�"� �~	�lYQ�ù�8E��#�@�С?aa��S�]q��TÐ��Fa�Ym��ՕЅ�U�Y�S۬�`J�R	�`�S�r����R����N��x����?��ڣ*Ƶ}���
61.p�o�aX��Ű�8�:G�g{ev�ģ�9#���)�1��+�������頋���6@-a�S�N�QL��+b��c�����/߾�n��	���}T�aY���Cdkbh.�cP�7�jP�����m�A#\����u�t(�����<����J`����q��><����(�7&@��0%���&0���xR�*�b����)D[#b����.�ဈ+�S�h.EÓKi�5n�
^]��Mk�@��d%��c�^������wME(
���p�Bi���C'	`�%&s�&��%Є4Hr7[?�L�5m��D�KZ��r��Q�묖��q�X=�����l�dj����d:#�-#�\����~�˷�k�jT�;+�P&��}F�b
C����hq����X�=��18��Zː�lh�6������3���C��yMA�J. p�JO��x��"(�j(���Bm@��/!q_��B�l@-@uFa���4��9jt{���)9e���隹r[���̛���[������ȹ��3�����z{يփ,g.� ն{ي�ٍT�@�G .����U��Bֹ� �PE�Zh�oatE�FX]���X$n�K5Ȧf�Jp���R FW7���\��qD+Á�J��h�����������K�!<�pG�|~�����I��f����Q�F�df'�?8�0w]�!t���n���9�{vz:�QrOut��*�uV7;���S���

�4O*�|v�ty�Y��y�G�Q|������ٽ�?:?=�������pzrN?&%���Y>:����QXv�s]���x�0����c�&��=����|~����B�?|�4?���H5���_NN��O�N)	��tr-n�K�+�/���U]�{S���$d�e颾�}#���3���YL�@���NzQ��&6IeK�{dd[@��?�� �v�+�BHq�4ǬIO�q�׳�l#��Z~��������_|y%H�����g0�R�P	8���g����װ��#r�������m�"��]�<B�Pr�"=���*�w�k�q:>�����t�X��3�R�w�N�&��
��08�ѿʔ�߼���G~��:��,MU]�l���"�]�d�;	���QI���@<�p7~������F�8_E~Rnџ��l���ż��Gk�5l_Aҭ<ѮF��jLW�?��H��AY�G�_�!��x�Y('	�`-7!��zL���RϾ���ɘ1��8u�p^����Jy����1b�y��%�SԼ�P�0D|�W�_"Y���;�%?���3���%5����I�l����B�gI�_֏��/W��gd��TP-�����9��K�s�b�t�5��vAw��
t��t\[: x���f�t	��s%\�73��+�yܼ��y�$Z�<V�eM�I&X�aSNp�r�*��Q�&E��Bx��b�b܏�f�J`Cql≓�
�/���[0:�92�vR1�\�'�Cw��q>pz~�Z�@�P���*%��{ȧy��d��5��5 F�NĻRY��i<Y�Y��HkO���n�^����NN�莦��"zB�p��
���'��������2oL׃)�K�X�S��=%rs��9���9n�d�2�X�Q���dn'S��l��
��N{��\�s5��q.�4t��q�ҶK	
�bIx�z�d�Ք7ᕦ%�����O4�ۊ+�JP��qn��ݖXiPb�kR�ji�~�E+�IP�g�$�YIax�U+�6��i��g=��W���tEmQqK��ڄ���L`�����&���$���`�jk��z�m���6���]Pl��3p
�������mrB�wz��'��� ��.$tx������qF��YH��1SJ�n9�2d�͕'@fO�8�aj����=, D��Ǿ5�������>Ȳ�l:)�21�z�_��{!�YJ�.*FV�n�^S���- �DrN�q �;P��nD�t����J	��1�0��9̆pʼ���[���V/|E���15���I�9��Т�-������(�7�=���^��$�WЦ� 'J�v�� L]���4����E��L�����FȌ�~ _���d~��zq���Cǽ�BMv_0��7���U�y�ڈ�e	��C��}�w��~t�џQ���!.�6�:��;��*Y�]�(���K��d������oЛ�U��퓖��� �|;�wD�	��qz���,s� �pu5�]�'�!�ݺ��}��i�ۓ�4��J�3I�I��U��c6>w�;]��&yK5p�$R��P�h*��0��u:����7���]h�3���ϰ��_�1k��d��~*����8?�񾭟:��*�2R�5����>�lxF����h�A�j��>#�z$�5CW��.������Ba(I%e4j풋�d���=��z��#R���*�����|��7@�RQǨ�V�P�h?�ٺ로C�"�����PꂻI�h���0C��:ސ(��Z���i��k�a����P�Tl#�ڎ ]���Cg�(�w��v0���ǉP��f��N�I��Ԏ:�"�[���[5���^Q�+!�C��`��`MPY�_�5A)����D�onE���FHL�t�8���~��@ȿ�^��ÀVYZ�h�1=b�i��I��8M!�½���&��ǣ� 韅=Em��|��T�9�W��0�W0rv�uP�t|�0@5��CYZ�1��j�)�@H�X"l�����0��`��/�BM;�`��� STN@�����bzm)�j�/�Iʛ���M�Y<4��`�{I,�m�t
��������Pm�P�����zM�!�ƙM^r%��ms7�Sڜ�xP��W�P,^^ _)3Y?A�9��j���u��9 ��y�5'7�߆�=f��tW���%��s�c���60���c�Ŋ����xh�&+�/��)'�:J�o��m陀��	 ����H
t��`A''fR�
�-��e3ȶHJ�tr� ��g)m�7Yç��������g��f�ZL�T��-;�l�a�l���Z�"9L�d<�jF��z)���D HU�ԗ�\�W�Ĳ��_��5���2����I� }�z�l�˽u��*��6��q�㵱�3�}'�WN�QG�e"�J0;&�oS�̻��O�ח�4l�d�=�Z���)YVN�^�w�B��!�7;@{w������������t�5�YeZj���M���N��.Q=����{#bt�^�����@�)���d��r���Ic�e{������D�Na~'C���6��Fce�s
D�U�9������S�Ή�� �   �1���P�a�n�K����wac¸�Ń�e�Ⱥ^d�_�Ȑ�	y�:���w]���4x��6�)� �èp���༬�e�S��G�>��W�b�;e� ��A�;�[F�A��ꛪ��T57Kթ�y����U�*�c`W�����Q��\�?�b"6�8g�f�U	�"�����*$��p�8��^�`���V�^'/ߡ�r��;@���E��9�w���<u4Ԗ�D����#�`�_X�a��?S���>�'�t�         |  x�}R���0=���i�m�e/TS͌�`;��bkՎ�{�=`xk��b2-�!	��Ҙ>ps������i�0%%�T���Mϊ�v�dJ��C0W�T��陪��x$�yC�jҁ.�Tܱ��>�݃��Z�ݞy
�ވ�Q3)m}�Ş��H9~�9�[L�6>��\+�렮�4�r�Bݦ漣�^,�n�0)�tg�]���]�[{����Z9�y ��t8p�Bn�����4��t8z>�8��mb��Ӏ;����Ӄ��~��.+�2��
�1K�Q���.��m�"�Ș%��+,��
|a����ֽ<p���N��i���	�lڀ�^�esx�}qX������rŅ��\6�6P���7�� ���C:           x����n�8��'O��E񠓟e�M�v��q����/�Dz��H�"(?S�ϟ��𸞯��z��\������8�h ���Fc���eh$s������� f�� :�֟�sG�w��Ň��'���>���q�����H����t�//�����q���������*�t���9.���#��1oe<\��帞�=8	t�&~�9\��|���}0x�1�Z#N��lS��t����	Cߣ���":��T����L���qi���:o��z������n�ן � o*��7����	�9�U���y�R��G�,�VźI�d�R�IC�F�$%`}�8�7��X�L�l�hA��U/u+G�I�ȁ83�b�}"Ȱ�0�9�rܱ�����=$�h�p��	��5;�5�3x���A�_�[�!<b�=�Bl�!�����y{��o/?��r�=�}Z�XK���Vq�T��B<.p٭�[
wQ�,k�����J�@m�m�iQQ��^·��-n�+yk�.��c>�g)���.�A����E��DM�dWD�Ƀ�.���$ܛ�GTH盎8�3@69��u(���L�U� �&�FpH^�י��nB��y�<H�q}z{����£��A�)P>R@����E��<�s]��RJ7��M:ޯ'B�SB�g��:S�&��'�Dc��h���.!0z�eMi��t���j>�7�J��o�Ւ��(ׇd��By7l�ၬ+�25zu}	�()�\@���ϴ��UKK0���Ł��"en���*(����x��6�N�����1���"Ǭ$n��jQ�ؕ�r'��KHZ-���j�2hp��7Ҏ�	Ua�����2%�E<L
E��s�v"t&TP2��Zc_QЇr��e"a�EI�e�n�Ώ0�:����-�K]p�`_ʋ��J����v�8A�2.�x1UV��ޢ�kc)�t�j�
C�U�&	�ah& ��ImW�ѯt�73���g�
%�λl� ��D�>-/��g���0ȼ��mͤ�N�D��N������i��OF���1���6��3S�B0Ŵlh�	z��zd@B�1�P.����\T�(D���Y��]�f�Ci���B}�:��q���<T���粇�j���~
��JVT�S�|dҔQ�(��� ��Z���\�b�s>��m�\�*��O���2 8W��7�B��>���M��+]�3���B��$�ذr���r�G��;6h�	Tr\�2���BYg˨�Gv�i�\���{=>.*֍�ߍ49�"<_5�}�P�^�v�Q���~����r�'LLs`2u��Kc�Y_�{<p��֖����(�($������|#�ܡ|����$��Qd�/%�òd�J�N�A��ȷ��v�(����M"�{z��9_��a���u#��ۡ�k�ڈ}1��E|܍���єg��H��;w(�H���U��ſ�m�
��^�҈椲�Q��`�����d�zE���GFL�K�����S�Ϭ�PL=ܢ�3+0g;�{������ �      K   �  x���ٮ�Z���o?Eݟ�2�	w(b���������y�êԪ��;�V����c��l��\2àr��T��ؚ�Kؠu���G#u�m���]�S�����Ǯ����8JO	GGm�bg�����k_WC7U���z[��
|�ܒ��&'�E��H]xl˭K�y+����9�tE/:S�«�m��pU5����������X�=(���Xd�:ݸ��qD\f0����u�d�"�/���U�UI� r���W � �1O3CD�0��_F>3�f�b꧸�re��%��E)y�j[�J�9ö�G}O_7Z�UO]�	T&�e.�Ξ����N��rEAm/��aCO\+s����dק<ϧ�~#\Wo_8X���g�M^)G���ecGG���dOr$
Ab��htAX���
Nja9����w�)�S.�iu~_��}h�;�R�zH�9d�:݌���
���^~�.��<�҈���Jo(��rUF����2�&0�.����u\o��e���0\rq��Ƞi� <Ż2�����uW��~ �G���Gӄe~q�C�p1W!���)�r�&0��*�i�I��ˍ�Ff�_HjM)mv�´8�oq��� �z9c��^��$u-��o���P\����mWW�������Hy�/�7-Q�{���^�+C�=��v�t��vu�O��k�ޙ��¨
^]��	�J��x�t�����\�'[wۢ�nμJbuK���m�w>�G�=%�'fl��y��cR2���Xnde�����"KW˦w}����7&?��i��@��ߵ��y?����=�K�ʁ�Q`{,��L~֞�&���x�h'rm*�D�E�&m��Un߀p��lWQ����o:�`])E>���Am�yu���o_%���NP!�=�C�Q�"�����w�l[�Æ��
�s��@o�s$l���5���)��q�6�z�E�=u_�Խ��?:�P	Gi������lv��k=;/g��鶽)|j�{-_w$�oͭ����8jǭs���EkI��d[�!�? �D��s����!���
�#]�YػM�emO���u��Q�Zo8�E���E��Z6��aB�����j`�$�� ���K"�fy�~���+�1;c��]9�nF�h���p8��7Wt����.J�o̞b4|���7�VCt��e��=Y�F��?g+ �x� q�/-�Ι�Ȩ��Y�v�yNr��{Y��Q�X�M�/� k�>�j�Y��'�Y��~N��N�佾�� �����X�h�kHF��K{4PY��\PdUG�d��5�lUk>�0#�l�)����҅�i�����'��{��j {��!���Y4�����u��d�%V6�"$i�&���[s�i{���5�_�v����辮�S}Jg����Rg-�K֔.���H��)��0��uE�q��ل��ʹ����P^]X��e�ɥ&2�,���W���,����n���Q�|7��t�|�h �T���˯ٰ��ئ
�V����;�ތ��wV�/����+�+�Iߓ��$�WI={A��F4�H4��&��p�	��C����2�J]](O����wiy�b��H����#��uF�$�˝��E�s#�V ���)�G�`Bӿ�����4�����4�UQ	j�����Nߨ�8�'jPn�|��n����N>b^�����0l��Qõ��sa��e(�|q�T��v�$��#��JB��$I�o�w�1=��,m^�s��|;ó(��C>_N�<�me�^R�/��\�`����z��z>8�LԭZ*�����}m��p,�{�G{��0�A�;����)t%L�br�����r⡴u��XϏ��`���aP2C�&���C7nvo"�o���!��C�A#���JX ��Dc	�x���:��M�<��y_U(��QP��'���t����^�7V��wDc`-�z��R�p-'<���?X�@�U�L�Lڦn�;�@Z�;u#���{s�Y�W���k�7{IքO���M���Z}��u��J��ε�!��g9����ӣ��|�h�.��q�9��S�FT�uߛ�?���¥Wj�z���&���&������gZݷ�~~�#����gc��W���9�M�oA��K��l����B��.�ٽ�܏�3g�3�߷���̵���i�@����4�p�������,���	�~q5�@�D��y��/u����f���W����O.n�7�ƚ7��H��fh��O&s�ϵ�M�
��^x�F�2�eN�)�m�8��C_�}[~/KNc�쫻�	�w�k���qYr�?K7����x&�9=&Q*��a/��:���]H�p��A�<���r����^V�m�U��oyz8�U�@�
�M��Ys��{����SM�D��C�g�_#��&���D���l�Dp&��v?8^Y� �a��uq]|��U��=Ur�ֽL��$��f;�O�846�Y��cN���byj��,A��M1tf6y�9Uٴ5�����*�ȭ���
���z�w��J�o_!��2u.V�g<�K�����Z"����r��@, �˪&jdϭ��
�孫�!S�L�s��Ŭ��Q�nt��W�I�v�"��3��*�_i�XAjE��c;8Ь�t{C�j=G����F���ze��;9�{��t����� J:羻&�~M-����L�ͨ��Z��	W��׺7�p�"����\�4��]ǽY�"��Ĕ^��X:�Z�.�어W���zz9c|����ť��g��XH��4e1����(�6�X�-�Ly ��k�$�W�B�2�������j�d��':��C�w����Ll���0?�B�������k�`��g\�:�"��$cc.f�����R��J1����^�x�^y��#�~�XW��=.�:�����b^��<�� ��,W�v��p�8X����7�ag�ɧ�{��uW�0�/�>��(ӿ*��Vy���p�����}^�c�ߗ�����_�����      H      x���M�,ɑ�9���VOX�j�{�I��z�+(�9�*jBV�A��DY�^�}�ʹ�5#��s䘪>����M�DE�O�Z���/���?���o�������ǲ�>ʴ��1��.�?����Q����������(�4�Z���6l��A�M��}�m=���U��qK�q�K�����}��������O���������7~d���x��$�>�ς-<�����i��E��TF�U����@�BO^��ϭe��<�ii�a٪>�����ۿ|���~���������)��o��S-�$�#�g�����/���{[@��@�5�Oo����O�~����w��_?�����~�~��g0�sԀBb~+࿽?�/���_�|�c�Δ���S2fY��SfZ��_�RfJ�u��V3g�S�I
�||��ޚ�ן>��k	���4���?�r��S�]�7���ן�ȟ����[�����_>���<�R�՚��͛�핀�����J�À���b��}r0|Ѣ���.h���ќ	890(�[9���Z��
��'�*k4}:����	w�-v�Qg�:^��[�%Jx/��m%�(���C�w�
����^"`7�(��\�M��nS"/�۱��
hy9;I��x9E���DK���r�^������U��ܜM��!��9�Vu�Ms���58o�9�߾u�_?��D��8- ��#��r�?�.���k����p%x�����9��ן�>�?�Y�W��{�	���O�����?}���ޯ�����5
(,�C&!X�Y%l������~�;���vz�߿�0G�O|¬�o�/ER��M�̳��B�����tkɦ*V��y��Y�{����\��|o/�L�@�>�����dK���Gf}����}cd��[�����sq'�;�9wF�������p��EC#�spgT���{�:��G��ٖ�"������;P�'6� ?�@�Ζ���X��2{��n/38]�q/t��S���"2���62��d����eQƝ�������}�p��4W~S�s�h��(���^�s-������~��o����~Q�	�3L����������;~<�f/��m`�/���5��������6���^����K͸�pp�H�9�j��9㖜גak����e�f8-$ܞs1^vd�ag4��W�'�f�Pˣ�MAկ����G|�7�����ó�>?��/��#>���>�{Tz{��w�~�g�ۖ����}�H���@���=���*�8c�"W3��Z�@gTx'nE�1P� .g,T�֌3*��=㌅��yd��P���n6&j��a�9}��=K�<g��Ml�k�Kɞ��64���})��+g���VA�ї�\j�F_�`��a6�R�B
�}	B�އ�9@+XE圾T0��q�;�����v	��b4'��".��Fs�-"qFsB�ⶈ��)[6����Ӛq��Llِ[��زg4�,�Fg4'XĚ=��X�2�Eܳ�Ҟ�Ӷ"����p����{§�����5���|&xǕ~�|�	�9/{��8�X��k��8�X���u�5��6�J�3D���9C�Qf�!
[{�<�!
;{�8����qm;T�ǹ;u�8�.��qN]��I�S�{�u	a�t���!K9�-��6fb�~<���+u�	>�W1�?�g1�7�w7���y&�yc[�1�;��e݉s0qÈs�hb�N�s��H�3��<�-g���Ɲ��5��;q��q'�X���4a���6��9m9�H�eb#M�Ӗ��4qΉ^�H#WڛWʹ�����pB���Tܨ�n����l}B �f����T�4~��c(�H�g�:Da���Z���Ԋ]Z�l�z&�G��B�kM0g�� H��@ ���a'�(g~8/A��>�"̹B3��1a�HaM{��e$����_=���������yJS�RI�LV��V��y6)TS3�0��g���G+�HP�f��9]���?;�r�Gz~��c���pqf?�0gm2��u�֧�sǯ��s�9�#a<��Y@�s6g!#�\s_��@�	�Z�4]�y&��X{g��G��1Ò=��)���kz�5}*NW����1ӟ>�vd�>��v���?som9C�?����*���m/��g�9�b�BU���ΏP�|V�"S�����l6ر��B��|�P�Z�'��ǿ��$�f��k�o�`��*41	ft�R�InFG◬/Ō��{KsZR�M�hI� �&�ђ���=�h�L�����/��8[��-L��BT�/�\!j��]��ա��1g�PwiC�ա��0g��HY��Ղ�-̹���-3�t%�a��`n��(a��"�s1<>�"v���z֑�z�b駚`����$	s���$aNKVz�����I�*�:T�7��OE1vX3��Z��_��W#� ��ҍ�8hJ7t�c����㍼'o��#sNǂY_2�}b���9'{��sG���\��BQv�9s��?�=��c��5����ʵf�l�s���}�[��\��tk,�ӭ~Q�g�[��@/D�V�(���L��E�>�~l�3,Wy!;=�q��>v蔃{5�}��)��~��>w�Dv��A�TX$ft�9�>6���c�6;=����w��<=v��\�;O�z�D5�G��KTey�g�Z�^2ۭV硙؞��	ޥp�{C@<^�!`��0������m`��pZE �l�@a�)h��U%<���|�C(���R',`L�(�ܣ�P��z4�\,�G�7=Xz4���MD�Iz4�X@�&���,�ң�!�)������؃�^��D�1M��=�C,`L�,�:���؃�O���y������rT'~}>q�#\M���_[���|TF�9�qV��.$!����(s��R����2ON�e���Zʜ:��(s��+Q��#����+�J�	NpQF78�J���� �ʮ�z�(��W%�5%r)���)�,0�ɓwQt���TS7j�^.�ۓR�U��,H��X8���S)�W�*�$���ŹmWAP6ς�քۖ�Y�M����`v$�'[�� ��H�(�ٌ\�f���È-��|`+a����ɴ{���(��ݜZ��;�[C�$~ts4+��nE=�ޙnF=9~�HԳ�g�D=�|v3�o�e$�Yy��HԳ򊕡	y+��qO����Ҙ)��*������}�{J��Ǹ��L�}�{J�4�u0�	�`�ر�'��qO`���=����'���'���'���g0�H��D���UtE�~')���"�q�@�q�ߡ�:u��û/���Tz��~,`L��e0�/�]qxh�`��Xe!�"���(�uW$�X�`�S�+=X��.V]�1]����U7.9�p�\�ư$
B�\r��B?�?c������Ong#�7�y!	n�?a0��&p��nD��!�j6�_AH���Y)7ӄ���n�]�����8I�	ja��P&��AH����6u�dO��%{F7pS.Ν�D���^��n��T���&z��_�A��T$
�Z����氍mO��Dc���=�N�F���>��A�}c%E�8J0��,l"`�da�N�!��_AХ��a]�SŢ�G�.��
��g���1��U��s�'Y�����c�(�#B7�p��f���r�{evJ�# �Y3��6.ߋ�fj��2;%{D�gl	՞=�'T35x�(D5=��G!�M�$��fڸf�ܞ�����f���P���V�t�"�w��SB]9��!��q_�=Q#ގsc�ɽ'��wB����t�n7�b�;�>�)��YCp����g�n̟�zv��׬�W�г=AϭH�ٟ��%:K�J�C�$�a���aC	�A�]%�E�/�%���Uע+��w	���@g��슼s�"JhT�hEt�lS�c�@�A�d���O�#���Z��1e��tL7�	C��Hp7л@��J��1 �f���b��97���5�ʀt��n�+�\�2Ŵk���g    <+�^GX{�Wɞ�����~+�TR�	׎Re��W!Ǒ��GU�%p�U8(Ƙӓ�v�S��:��y1^U�4kU��^��-���V�5_	��i^��(�ڽe��F�_��7<U)ݨ�~�N�xc.6NjS���FB���X>e_��q��يO������9��s�9�ϴ�0֞v|( �s�c�y|�]���q[��
�sE�;�v�]�:r��$����s��|�s.uQiK`�m	�)aΝ����Lrǻ7w7Gi�J0wҎwҮ����}�g35�g�I�L����@��`f��V�� ����.%��Q:3fa��M�zQ�8sFM�	Df�d=�T�ش='{�):������$��JL�M*a0+7����s��$��s����H��;T�X>䪈C	=�5��"a0;'���M���G+�bU�У��[(z�R�fQB�7թ2-�Q�G+�d)ztoke	c1Ъ�Pztr��VՈҥ��������߀+!2�43�HVuL7']��|�T̛�����ou�K���5�+�#_Qh���ȕ�,
,;m�{��M��~h����־����s�Q;O�[s��+��s���a�1s��an�9w�2f\�8��^cO�k�����>��u���Q}��5J�1�{T$��e.�%C	c[�ݢ ƶ�G$�m�w�H3�w�B��U��"ap���*�gw
%��d���*�gw
%���ݥ ��d5�t�&�9��5Y�1����]�j8���t��>t���>0�Х��J��1���]3kؑB	o����O�_��w?}��ܦ����c�#��"���<h�=$Z�I$t��$x�*a�2�T e�'�Zƪ-c���1Y�����xm*a�����ZFՇm�2�Zl]5�Ѯ�*c�6�n=zY下2�4��n�-m�J��LȚ���tߕ�ܡ�aߺ�}kB�t��w�|���n�"��r��P�:�ٙ3�㚝5�̹��T̜{��$X{|}M�J�����t\�=7���Tel���Y��U�/�EA��!xR	cݸ�pQ�0Ǿ�����y�%�0X7���F�ZxC��|���xݓ��>^��GFw��2�9n7qs㍞�J��qW�F���v�nɰv�n�0c���Yƌ�P�b�~�{�b�U `�o�{ϳ#��I�=������N���q�w��LV�������G`?@07J,���g��#�6
x��p���E�y�}����s ~���C^�0�UB��n�H��s���$��ό�F�t-��$~(�z.��D�s5���Y�G�����[�]Q�'2���k��{O� �9c�>� ���6����2�oi�V��I¹��ʜ�!N�p�;�j��z+��s5Cٵ+��q��;w�#bǉ�ǹ3|��O�=���Q���Zgຢ�<� %�5)ݱ]�0x-¬�
���0Hv�O �k:X��E�఺C%�쑡V������5H����럢U	c��$�5�]ͮX?� ���B&}7�b��;$k1��U�ͮX8�$�٣����f_�_�Q�����a���௧=�k�6a@�<�}�\�C��u�}�M�s���:k��K���u�!�mD��Z=8)h���a�{�
�������|�F�
�g�Ht���t�,L��](;�������]�ܤ��h�U�7�£)���v��pu����h���#X��jg��A\ߍ��M��No��B}7{�A];!A}7��9�D]F;$?��I㜒��-��/����s�D��Ԇď�"��w�ٹ %�"�JET��eq�PB��t�5��E�^��KUn�=T����O2 $6N*a��qV	��;�J��5~c@BWoB��U�`�Ρ~�|%�H�J�����#�;(�G�wP ��T��13ч���n�P�|%�bu5�fqJ�Q�З���1X���oj��PƘ^NɊ��;���V�Y�Mα+�~�h:�n��r�;/rn��ٮ�s�����;Dw�:� gO{��Cd���2~�M9;�CO- �6k�~\YK��I �W�&��<g�/��t����	R᜾�99�/0[X���cr��ӿ��n�8j�ZwE}��}
�e��Y��mF���CWg��ݝ�>ty�!x��,�d�7���H�C�g�]���ֺ�r�����;���ҽ_5�{\+�Sq: a,��� ��*�]�p;V|�n���q!lͱ8��<*2�����Z�ͧŁR�b��4���{���<37O����@۱`S�-qw�u�{�<I�
f�d���3Z�d�uی����*؈o�sU)�3���&��K����|q�S�㎟�Ή���'m�����(z���N �E@8�t�	�9�d���w4�9�[�"�9�{�`�Ω��^�s�B�C�u�����Z2 �����8�%rCN�y�h�O�p�g|��Y�ӭ>;�CN�*�����������������֕��潵��Ѻ"7vs�,\ii���ƕ��.WZZG�V�[Z��{ii�� oi�� �q)J芧�q	$���K�>�0�KV�_1V�|��A����[�?������X�I0w��#[�&s�K�l����� 3'�y�#`椗� sZ��.�bFK���`NK*L�hɼ��hI��U߀�h�V�h36-�U߀�hIrf�hIrf�i������ ��������������Q6�UB�%p��Q�a���S���G�]�rR&ܝ���N�|��l�}�Ν�6p�h�����G;=a�v�I8w�;Gt�I8w�KN���f	9)�K�-�S���թYm᜺��Ω�m�lnᬺ��Ω�n᜺��ΩK� �'pT�5Z�y�l_�6��ܤ�pƪ}�g	�-���-�c��k"Jx�f���M����o�W%��}��	�{�OM?�y�9 �7�1�!���.� P������X3���q�K�������:����#@�7�\��|͜����r������������s�"�. �f��]3[����f�\G�h�������[2�<:%�ϳ�/5}�N_x�sn��+_n��V�⡕�3r���Ͽ�����Ǐi�>���ؖ=�X�
NS�"�qRB<�ח���Uٹ{�¤�26��up�xp2µჄ��~d�#H_�����E%���^��(apաK�_*a�D\�a�D\�a�D<ч��d5�.�(���%�W�;J�Ǽ���Ndը��6U�08�V�a�Z٪�0^ ��U �ʔJ�18�9щ������}��uB�#��t�u
kF7&�����%��c�8v|�=c��.>�ּ"�>�f���ּQ�>s�� |�@�^�'�܍�|� �y��}n ���x��b�qz5�����{׸3xg3%m�`�`��ϳ�3�C¹[?w� ��=�#C�l��V�|�
EJ��1{}(׳ǅ�׵7Q�X���5���=�|���+1�(��^I�p�ѧ�&׎B���ՙ H�$��A��2q�j�"׾�����93$����������+g��~U�O8�/��H8�/U�:r�ӗ-ɞ���6��3�t��F.{�������h�-���ǻ��O�3ݰ@��&�s�<$w.�qg�B8��#΅ϣ��V��`2���9f΅C�`2מ{>�z���u�WƵá%]?�q�d0�s���,q6|>��d�7|Μ۸*Z���R��b��L朾�d0�k�KM�g{������K\�s�IH��Ơ�3�+�����Ox�o�� ]�J��#>�2����q�Z�~��|snT���-l�s��v�8� ��T��p�z� ��K܎��Y����x�
n[�?�A�6���n��q*Ɵݠ�Fݞ�m�t{�9���f�4*|ޜp�i��3u��MXۣ�_l�:N`�c����b�����94�F�s|`6gµ�j��m���8��Z�%8�o�XÕ���j-���[�%ܗ�t��'�1=x=�W%��^*a0'WTBO�k�Y�)�3���u�L    a�~/S���P� c���,��	*���,; H֯_��q����>o�D��{�"�}P��)���{�"��+9�"��j��F\�:���%��.��8���H����������	�e��q�9m�?h7%�i���5���c����
f���ё��GG.SN��͛�����d���ۿ|�����{�����疨�zIX�ԋ��D��z�. �m��m@8;���d�l|3��rVy+A~AJ�L��R��NJ4ʸ%=�B��q3�(����C�L�D��s&����</	g#�;oPĹP������q�)0�ڑĒ=Oy�x�"��p;}����y�S�%}�N_v�ڐ��g9(��(.�f����ll�9|�lz
���{66+Z��p�/kA\G�g�8�5�+�{�:K_�{��܈:/b�	o\��A'��nl��F,�Q��Ƙv��Ճ8�V��f�S��Պ8<�yS ���0�l8��@\{�*��s�mV�o`���7��]G%{���M�va�Eo
�ut��ϳ#z�>�v��m��s�fI�3rN_��2�Q�d�sv8]���]2�W����7�F��\�ռʪABOP�į-�.���@�`65���g&��u�f���H��k5Q���KW����Fet�	�oWF_��[5s*�����w�q{ےq�V�A�9��m�.gˣ9u͜�U��b�co+�l���{)sno�Bn�/�WW3�\l��#�苔��\!(�M8�.�ǉ��3���aŔ�/s��o��МQ�[�{̎dߡ�tZ�[^�[�+d��ϛ"���������HA���kF
r~t|���x&6��?¢oʹx�A�B8;�t�[΁+��-��
g'��.��o=(��\���܏L�^�(�9�n��O��l�4
Lf��.��-��u�4�$x�|�>#g�M��_3�� �f��^I���v��>h�WE$�m�0�0���n��������>O��J�%q�ri��7�^��-K�5U�y������˫E��?˫Ex[��DqN��!��ݯqN����8�B��%�]�v�r��P�k6�ݟ�1 �v��/�ЦKZ3�Y���`�cpΗ�f���_��9g�`�C���k�ӥ��9u
��=ᜣ_�X�\ﱐ�v��d��
Jd�sN_��H��C_p�[��Gު�Z��chMGFo#zO�anx=�9�#a�X�\�9��I�nB��0%c��|�������,̳)����WxmTc��W��[�v�Ǌ�~���u����l���%��8r8s�"�+ǜ�;q����}�� sν�!�ud����G�A���ؗd��
�u0��Sx�V�p5 sFY ��`FW�銭��cNU&xە��i>�h/�In������g�pT�pv����ܡ3ܖm�[�@y� U��|M�C`ph×s���8W%���|W$�T�బ�9�J���}�K8G'�<�"Or}���p��PB�c*_p�k����%�1Y{T��b�lnG��sGwN�3g67n>g�]�t�
�5S*��@�+.���kƵ�k�f�sBcfs�Zsƚ�R�5p�%!�-�+,��lK*�ᶽi������˚�"i�5WBRɔC�����41fVz�%c̬4�Zs�,�pf��J])�W|�fպC~V03���5��"���}E��!�ƃ��K������.j�z�J���#�rR1n}粀k�15?�И�Nc�`L�w���M8��XW���{�����Y$t��b#�0汼6�0xM�Ƽ������ɯ��C�mW	�^��Ƽ�k�)J�d����X%[U�\zt��ȡ�F���Ȇo�қ����L7�_�M)ݰ�k\���L7F>��)����G|�����)���+#����7g��Cdɸ�}%jk�n_��ځ���A\G�Q�=�����XG�1�yF[�h��c�C�d6*�Dc�pNYx>s.���00׾_�f���G��|�ml��|�����ʸ��$��q��Hh�ރ����7	[;�n\�ӏK�?oy���t�3Iv»[���~V=)�b�Q��s�o��ܻq�os�u�뗌�o�&�뗔>Y�:*Ύ�s�4�5/�\���s�z�8��vK[I���t�3���si�c�Lώ�WT=;�uZ�CM��f'������讈7��-�c�Ӄ�o�.l�w�kP��h$��,�XJ�l{g�G�s���%ιN<�����:I����$�>O��>s�[ƹkf�E����*�1��f���Hːk�:�\g���Hs��9i�<Vh����걭JeY���������W������N��w?�����(����~��2`>�F3���o\#A���E�4�w�H�=�e%�9��6���O���'�mpnW���iKƵ��oW�8���0�s��qc;2���?[��(�]��ؠ��bK�6��u!N��s�9��\{J�m��k����~ڙz\�E�-��I�gt�����7�/6x����6эQX! |0.M���,w
3�n���q�%㺏��ـ�8�ĵ��ߎ+q�Υ����"f��9,}.�ɑ��v+FM��;Xml��k����s�C�~ژ�8��=ۡ��о �l���L㮊�D�홤��vɥ��9��cs.��W\0g�'���>�=k+q�tz�ݖ9gmx�e��}��~ >c&�y���o>2�y�Z_��v�n����O͸zʸ�L�pv&��q�x�׾L�v؉k�����̵o�)�si�˽��֗���vD�fzfc�p�p��1)�$�����s�1��X�����A���g�3qE6�EmD�t0�(�`��xG��j�%��Մ��f.�`�c���q����kg��&Z��A��D�1D8�X1�a�ǜ;pI�-q�q�w�-qm;T�e��f��1�V��=Oi���u�;���N���3���o�l�X��^�vZ�W[3紆�̵Å�j 7��c����)����a�a�}�)���(�ШJ�@�?��'��*�P+<^+޸�3�y�oL
���w|i5qv�WC2ױ�M׶M��ɜ�M\��\�b�k�d�����^VhOb���-�ڣe��9su����f���rp�����qN]x,!sN]�,���Ǯ�`1반%�������V`z���l�_W�F^u'�7�i��.��Q3���./��v:��x��K.ü!�(;�3��vt=�Ni���ǆ�1����`���ѵ�/��4�\��r�s����)�\�����u�ܯ�B�!�g�Q�-��u�.K_�n�����q����z%�QW�ӈkO����M�����\�%��2��cΩw2��e>�qnX��~^���������p�XB���G��̀~h>:H�*[D��\-�ǫeOaG��:hr���r���2mL&���>eX{Üa��dks1k2��S���e�X"�i���|7cQ�8c�8�ƘQ��vƚ�.��XSMJ������E1�,�1�ԓ�>J�'\<O��?�Ag�y�t�V��)��(ר�`
�3��ru�k��9���¬ؒcG�p����
��V�� ��WE�I[|��bf�þAP��3��a�Լ`3��w�є�d3����޺r��ɺA�D0�'具bge�%�pv����3j��̨I2^$b�Q�d�`FMf��
f�$�J�S��0�&٭
���vgg4{q=�L���v����ׯ�{���v/�dnv�a���O�p�����9?,cn6Fpsw[$�F �En� �iKrkpN]�[#�sꒌ�ΩK2�'r�S�d�pN[b�HU�\����+�\o�sxo=����<ˡn�2���9��x#e��yş�{d�9|�;|���8hKs��u2Wp�97Ԍ��s��\,�\�`�%�\�f�uܥ�g��G���\=���k�7V��b��!�=��̵��d���+�1�lڪ������t�u\��.���p7$s��Wk�Gc�}A��C�̿7�~��?���k��z�����W?��	�?>�t&$�v�|�o��o��_����J�N?�    �	�� U��	������+F�ޟ�3��Z��ގ���ã7:[�Ƀ���$�U@����"���9�a����75�T�BJ���蹲L-���jM鹿���%H��K�����s�V��ɮ�Xv��e�f�d23��e�~f��/��d��k6�����@�q=��O1��Ɵ}���Ϯ�,yy��q���;���#]�]g���xc�!��L�2r�3�	��k�8W���q�{&'����t����Z2�5s�L�+d�5�_%{(�Vq����vYE��+c�JƜ�H�q���G�1�Z�83�.z����܂q��y�w
����ΐ�@���WT9&��e�sq��]aI�z.M)���*�U��;S��Q��K>�����Ɩ$a�Jڸ:0d1�0��,��3��Dp³��c���nTr�9��nPy�]̷�w�����w�8��������<e�����=����w1�q�|�<]�r�d�s�z�>�a���ԃ;�F��res�8a͞�-O�v朾���\{JF͞K�<y�Yot���$�ѱ���$��r���$|�<��F�͋'��g�p���o��/���uL������q큩��%Ν����Wx�-����g\ǀ�#��SK�~��Q�8{��;�sŁ\��\[_n;M���b�9w�����k��]��ټ��f����!C��s��3��ړ-�����털V��o�����Y�0�2�02��+�_3O�������d�	kEf���*�A��@�w������R��s-�sƵ�(�w�:��]3��e��v;�����^S2���&]����%}���=ώ���NB\{0�#��3��_�駍1�lډk_�\���_���bA1��҉����39t!�"A/�d�����s��yBN��ݨ��m8�4�AgޯfX�ژp)���
^)�[�	t�8p�y����1��\EvKħ��&�%����cC�s~t�Ռk�wK�:�C��s~4g��s/9w�7<2�Ł��\�K�]��/���s���,c��\ɗp�����1�q�J�K{��}�"��^|Ssc�^�8�M|�9瘛��[\'���k����,����V����^1�v��ٛSc~�PN.Ы�ߚ��+��hBKh��s�����زd�%�{,Ͻa�(Ԁr.�E�+P`�}UŽg�<h���+�2�� �{��q�3�cP�q�XaI�Ko�s�'.�:n����'��=[��q��9x�!��l=��/�����]����l��7�=��
�ӳ��A�Ř�v׾���uQ�2������Wqd\���{v�]2��(�\������]F�g�~⌾l�.֞�|��ĵ/��2=7w���������F�Y���_���)ƻ/M��	ፓ{acB�X�*�����$�Jx���˒�1��f\�D\w�q�
��{"�������)�۲�N���q)�l\�Y����nߖ���Q���ag�h"��"��������?_�f�J�N&󈄞�O�o���"�g�L�	=s� ���/�ȳ��碄��V����P�#zF���Uע�h%
�У��^!z�r�FG$�h%�K)ztJ�DB�NB�K�ztf�����4�H��I��L$t�d�Uu�1X:�@]c��Ի��`it��,}���x�u�Fy����
Gx;zyOĹ�9�=�p֦�k���qrę�7��%�z#V̵���f\5Ε0֎���k�0V��k�f�l�lm6W$0�\5��0g�:H�]PR��s�����X{y�V�Uf?4[<[����9ea�9��s�q�0�:�9]a7���l��,a�Y{6�#�E���T�@���
&o���
��H�q�����
�_	=Nd�X���TA�H�q���K$��dQ}��t��jnc:y@N�G�0��E5j�ɢ���dM4jL'���>��U�a�ɪ�a�ɪ���dU}��t��j�c:9�j���~(������1W F&���������6�{M�p�i�׀�1m���0�k�*ap��U��}��A�R	�R����U%��dI4jp�}8��`�	�R~�����^L�A�<�A�<�1���4H��*�����Iދ�1E����Ԙ��V����IUT/�?�g������Z~�����c���7�>�\�����5t!�:n�i�*��)֊��͆�x�6c��¯+�-W��X���>-�)6�v�������a?f�v�r,;�s�r���Ř�(��(��h3c�AM�
���],RV�h�ĭ#����F���i�	�{��Ќ�§�O����0�j�W�%xkr!�����B2����m�_Zj��Woj]�7�G���7���#ZW���-���Ϣ�sK�hx4�-�+��2>20�ʺ�M�{�qd��uT��xK�">�;?���9<�E����:��.����_t��穙/x�.��p}|`G������o�����sYgx�~��:��-��X�}�[�G�Z��Q�&��X�硬�N1�>�ײ�%0���~�����Mg�6@L$�ύ��
�c㳀I��Y�����,�P|f|P^*���� ��p�Y��8��,`�yH��a�X�氀M�`;X@�&¸EС�X��:4����ދ���/�u�_c���Òw������`O(0�AB^��SS�^33�W8�efN��ʌ��݇�74#��%_1�~{a�#��/�����~��}�TpN�O.L2�R`{U){���)G�w	�ǩ�$f�{)��-"�tI9�a��d)�O��Z"e�ޟ*�R��?���KI�n��F)U����ݸFU�����yB��R�t��د��o���L6x=̞��#��z񖭯���y�{�T�@��I@;Ѷ`�X@7Ҷ�`�A&3�j�١�3��t�L<�2W�,�#O�!�xΩ��7�֬t'"sNi���pNg+	gU�`@I@;y
6���A;�&V��^��
��7F��ss��V����Kg迕�:�߻����冒p.9T�=p�E0�*���U0�Jf���$�"6��f� s�!�|�C���%�4��S��"#La��d��9�'����Ɇ� ���pCY��DJě�xMa>�z-��d�^��#Y�+x+_$�H<�ʀތ��V��Ph�����.܈�Y�e��4Y�e`i�u[ZJ�欲lKK���/���TN�_��TN�_�����,��R9M>�x��_�%e��C7ɲ��ro��/������N�J�>&�Vl`}��ZC��u(��JRv ?&��4	�������J�n ?f�4o�c"(D�>��9�UU���fԜ��YF��G�Ҝ��ʵ�,�r%97��+�K��Y�d{�[u��A�P�絩��t�$���Q@՟ 5��V`�1�v����K�q䮔�R������1֑�)�b&w���L�&f��tJ�����3S&w�����h:��hy�)}��$/R���1B�ZTJ_�<fN7��tfz4�R�����TJ_�<��X����E@Jg�G�" �/ѓ�E@ʸꞦ����n�]^�[e��W��&��ҧ�Ir�d��&�`��s��u�dIM� bǋS�eZ���X*u'd ����k��H@{5aY �)���4���OZn ���'����3h���]
����]	�O�8�9�Y�8
g�8/�� �4f³�p�6K�� g�8tЦ�&< 	�T&��D�^���s�����O��p=��']�3J��Ȥ��f>G���H��L !�R$�擰եH �;f;�8m��K���W�1�?����\�#{��>+Hv�����b_�䚑D\���V$�v��H"|���6���N� >�2�o�������0|�<J�Ⱥo�)ćS&��h�W���q��}$eRE����I���a�顾Q�]�b�0�g'�1�H�u�E�c���r���3��?��g|E~�c�_��xd�����ƝK��@�^� 	  '�c [B��>�%���z�ޙ<�G��MQ5��C]W�
�cW��Ǝ�YKa��^�h|@?з�:��zR0ַ�p��x��
�#f����%�#f���b���nkP1�.dF3���Wx�b��1Kzŷ3���U��&�9U0���8R�aA����%�0m�<Z�&�.�;'�1��o�2�ǵ�����_����/�������7���Ȃ��[���sz)�kq�ݝh5}e%���ٸ�1�ٰ�0���m<c�8U�~�� �*�s1�Z�<!`�6p>���e�F��z9�1��m����s
#�4Ĝ��x4��nK$9�.��+y�N[ ��yVZ�}�s|���J��?�@���WX0h���
gG�L��BM��j\���1;���x�}&(9`ndz�1|�t�>R�vE� o��a��f�$���̀^����̌+�x���E��Mjy	�8-�A0�Һ	�	ƛ'�.�ѭ��#ZW�Ӈ
&�(�L>ᢴkK��X�Ү�u�!#@��g��^^?f��~�m����e�;��?ƛ�?~�7��ؗ�υ�:�F�$N~8-tDe�1�4��j�ɏ&%��>*X<�VU����	�-�� a�R�W�
M^5� �.�A�;`��\0�O%X���| 5%�=4L�w9Tb愙+̕&l/��!�:v�֞�D������-��ow�����;�A)Ϣ�;��h��s;x0�r�d��8��P@գ9��l�ң9�� 9�h:��9�Ni��0�m"�|��iyZ�6 �әX�S�{nv�*��9������ guF
V�[���)����s6`}e'U8Wv��#+��$3Y�� =�g���Ø�b�~�f+��o�pE���:	>rJ�N��,��ﮌב���tx�,@N�Mq}	>4�U�����ԡ؀�M{v0ϐE|��R�P3�~��؀�|{v��*F������{@{�j���&�υ;&^~h!
�ϕ��90��������h����p�.���R��Q�Q��$��a���nLn��9�����?0E�H� ت\m�\��g"�1�S�`&.����Y��C)}U0]oV)Y�`����<� �U$�`�*���/a�6���56�dmBK���L¬Y�P�}kk�[�Ա���w`i�D���ior�6|��-\߬�YA ��i�l| �Q�lx@C'��\x�2W���{]�ͅ�����L��(���@�+�S2��9}!�+�-.���l3W��=�%w�8)�K�/��#��EXO���6�l��0�0덂'����8�p�^�Θ�'i/p#}W�$��Pq@|�8`� ��	�� �T6 > �b'��t�\��G�Q��	�C�/�G.*�6C�Xmέy4vxK�B��8H��.~6/��jw@}�y��WK�ؼ�n���Gj�*�l�k����˶�D��.�>��"Q�Ȗ�8 Ev�/x)�H" ?h�������@ �h��Y�>ƙ���0��`�Q��ȉ���^4NO��0��ݯ��kס+3�蹼Ep@Dǥ3,�4G����K3`ZSj���g k^��A�r1�p#�]��֞Hh
0c��f$��bLxS}!&���p�	����%�򣣗PJ��
�����Kz�J雼��Z���o��N�B)}��d

雼�3�PJV5UP7��0����0��S�t�O��>�s�X�3R�s���^Evyn��%�e��
X�B��p��*NC�Û ��C� �*�$�	��N��W�i���[0�2 m�k�#0���umx����J� tz3kp8�7��*�ӛ=q��x4�FG�i�Fӷ`���TX� �U<3��[I��F�aZ���6�N�e�zz5���YNӓh
��w�����iK��R]�������^ 梡Z�+���m�v{':������+r
�Hj�������H�ݤ���C9�6zT��~�!H� �"��?�>Gf��?OD�P����0�~:`�������H�t�J|�D@GL �泀��(�
�(FY�!l1
�u�\� /���	"�)U��+�I�Z2���u���/LvԂ{�We���Y	�0�����#�}���z
�\�yB�s�Dv�z���?�aB-����� ����{�p�ڸ)*�p�no0;�V��"�S{R�y���
㖅�s*�+(��h��;����?��?��9h      i   G  x�}T9r�@����PL\��_��H��	@ZEH����>���|���
A��Ǭֆ�,��vޓ��(#M�e���JkK���q�����G��� 9q�����{�N �� >�)��)`;)/c\)�7��{~U膭Ș*V�/���？�j:HS>b�T���o@_�� t�6Y@�-��(wO�h�˝¿V:Bd>Sok����P�Ŋ:���j1���N`�1�̃�s��'Thg��g�w%'���;��f�sM����"i^&`%-�%��?��۩	�=0�B6k�y��|�T�"">"�����f"h"�����bp�/��d�Һ[�@�}������*ˉ.aeLiZ�y�2ᬦB�<�#t�{�p�ǃs�^bH���� �͚\V�ɴ��L�"Oܽ-	.�%��&��V �%�KZ��$Ib�o�@����8%�㍸+C�6�tɾ��
M!ƍ����2!�3�����poBk$/���@��iE|�av �>�fN���.b�ǻ�N;�
�Dc��	��E�����{�?��U���H�e<Uu�~��Z����=�      F      x�Žˎ%Ir%���� W�@�m�V�_��fCtπ��^�!*3�ȯ঒	�QY(�z������Q��n�r��ܣ�I �"#"��KG�8W�u����->����������Ź�ӿ���t����>��WΕ�/�w��l����|��_~w��u]B]���ÇwKH������-^���[.o%������7����}�5o�����߿��~�~�7��~���_�����~���+�����+���������������M��W����_��?������_�����������~��������������]��������=�w|j�����W���_��W��]�w�����_����3Ȳ� Y5���� 5���� �4��2L �2�@�	 ê��6�鮧{3�̣���~��Ͽo@�����5�9�X���n��F�h�IX�fWןuk��<F�x�����x���������:ikV�w��m�)^���g1h��uh��yyt�I����v!��v��E�� ���6�S$��񶛽�p��K��n�:�AҞo��Go$�{*��^JT�.~8��}\By��[dR[���Qoq	[�)���E�i�Q���SD�B=��l&�����Ƕ�������O?��~��ۣ-~���v��[���
�F[�>�v��UKq=^z?�����|����~��2Wd��2�}R�°�������_���?��~l���
�T�������=����/�}��C��p1� �fr?�j{�O?~x�����[�m�ku1x�����&��y��u�vn��U`�q�����; d�>��G�l'В�W�YJ�|��覱�՚�
]���ޫ�D{�"߰~��a;��aE^�'��)r�D"��5��p�c,��WOX�A�ت�'@?WX��O����K�@7�1�a�P�H� ��gkF��� B;�Zs��[z�|7�9'����U�[�J[;���Mڕ]��)��M;�����SX*x]:`A@��kՁE��q��vE����th��oU�}�|W�U�yW����AB��њ� ��T�K�$iȿ�k��� }��+ ����Y-bv(3r�D��^�T�9C��5ۃ���ϯ1�����ң��zH�,���%�8�����*�G
ݝAdM�v�L���J|�CP�*S=�qp�F(�m����zDJ:X�H�\�W�?�D��eJJ�.�C���E��߭�-z%y�ӗ����ڦ7��E+���'?ĉ[�=�-��Q�)��RoU�)��)�y�Z�| :�]�>�G��!�۶W�ҎFm۱�2u�v@�m[�����U��>�1"ѳ������ĜHq���R�z�P����9���C%�·�W+�=�zKgRP�K��
]J����S�G=P�-C�ķ4Vܶ�[Z;����hƷ*����)��?� w�J�܁�.�-�ިA�l��waM�`�k|�'�f퍊\Xe.qN}X��Hq������o~���p�~�7*�� 9�xRYMM$��&p�rR{�l5�MM�����j&�G��LUR'�r\�+i�#����"Ģ*e��P5�](}���u\����M�����5�˥o�$tA��u��TKekBO�\:��vc�Co�{N�{ r�Ɛo�	��[�g�B�qO�j�j
��r���j�o��#��� 2T�N4��҃�,B�w3��z�T�U���-��B}n��57գ���sɲ'l��i�P @�g����l8H��4�.w��B��y�V���v��ȟ�r��J�?�p~���f�﯀{|�ΆS�����Y����ɔ#OM F�R��O�\�z��j�q"[���1����S%�6Uxk��ߜ��j���	T�3k%wWqݞ"/'dJ�y(si��1�U��,Btp�\	ă>�������t�� ���{�no��o"[A<�$B�Xt(;6�J��zS?�	l��H�Ec"���қ�L~N����N��e����lH۟�%��� ��9�Wv��??.�>ib]T��Vctլ�KN�_�֗��%��bm��ˊ$*�v|:���@{��0Ԏ��^���m)�ZVb1~�Aπ����,P�5���^
H�0Rb��H��gF�s�~��E�"�������+i��d�}$3Mt]�U7%c/�tsv@� .�Gd)�`ɢ�9��#b�R=0/ٓ:S^]�0H�j��WfU���y�Yٵp�Zr�ѓZi^90F� �iF�p��՚�M4G�Y��L�}1_�T�Q?=�tgu��I��V��7�����u��VࡷtO�9�*��,A��#�bk$�jl"?�UL,�tS�2��EK��	4��g	�I��m13����6L��׉���Q��W$����&�3��ۢ6��^]�f�9�RU梔B�CdM��➊w��)�X��#H��Td[Ī��ǒ��y������	���1T^�	�P�a
�K��3�9��S���aMT�(�c�����#j�,����t�c�$z� y�	�k��lQ�Z��5?"V�9mb]Q��r���	S�<3[��@���T���6M�(u�9�(YZ*J�ӻ���lxfvY�b�s"�eq��Y���t�u��zmr�E�oYM(I]��[�*Rߎ8E\��('EP��3B+?E�|�M��$�؍2�D�̦�5�GE�qK�0s������ϱ)3�s���>�)��)��`���Δ��*}V�O6ի�&�t��T�	��B�@Y����dg�W�m:� �yP=Hl�Nde��T�ڡ̴�	�b!ӄ�2[�*�>�t�Wq�ȃC��Q�,M�����&����r�*W,��nza٦ʕ��z�ѥ6�����ww�۔���D��q��"�4��C��J�t�3]�*����=��9�i"���s��N���M4,�Y\2�WZ��\ٲQ1LhܪF/�������U�nݥ<n=�R�� ą��LB\I0�X�2��U�Rf�{$du��U��~4���4��C�r��Imc0�p%Q��q��
W_e��f4.ru�R�P��9�6���&r��BG��b��@��ݻP^LB)L�?�E�b�F�1��U�Epӧ�Վ�.ӽ6�	!��}?�K��Џ�.�	p�|���oO�KI�����}���K�5��?�|��tbL͒��/bL�r/�K���OcR�����J��	GU�L���H��(pq��av	�թ��m��8��\q]�ƤU=�����V6�#!����Zjh�rҞjP`�����F��Rw�lrVUfQ�Wѕ{�T�+�σ�OK���d�8�q������t���T9�aF�\`ֹ(��rV*�r&��WK�l\z�,���8�.iO=8�AB5qH�^��iĕ�K�A��RߩRuǔ�eM\bI���)�I�jU�$�V��@�V���C�f��9M����!�a�u��jO��
��)W
�l\B�4'WZ���y��ʅ5q(r\�-6uq��K�A7��-�J�N�)��n�����Q���_.��_�5�*��ZP@Ł^�eo�����se�j��#��&�>��q�=��g)^��᤼r��Bqe��(@��$ͪ#�ȷ������~EZ�rXjb���Z;�4��9�y��t�s��)�Ҫ�P��uu�^	��ۊ;�b�UD"2zW���j�P���j��]�b2WU���t��6��|E��R��B���=�cd*�T9fc�#���R�nה��g���<��"�Љe]Qd��*%�oO�F�� �touD�Xܱ��8CXF@&�ܕ�!�ʫT��,�ߺN,G�}�=T�V�P1�N`�.�	���l�Dej�t1b䲉�\�f2eL�A�q�l�Lu�X'UiG&-�*�ңeu��H$Z��{��/�)�W�8}�6%KIUGT;{E�9!�E��OWZ�m�8C��nW(X�X4ջ�M�g9��~Q��@�.��B=І]'VKO`��e��C�ѷi
U9��@8ڴ�n6ɓ�f�\�=4���H�egm�@�);����6��*G�ܾ1sVU#:�#�1˄��� CS��ߧ�`7���2=Wצ�n��]xp6�*G��~���Zْ��L>W���*    ��ݕ���-3��N���ʌ*YN��W�ǧG�b�{-[��6���qB���E��AK����K�h}�?U���E�
�g�k�ҠM[]��K�OM�{�vv���.�+����/��c=|��M�m���ܦ%��������=������_�V\i�QU>.����^�(+��Av��� �����?��R%��2� �s�1�qH|�3�Ϙ<{��}��_�����z���jy�$�֐���v~���x��5�u+�Oπ����e'�Ӛ�O?����5����|u�㚃�U���a��-+ٖjݡ�;B���s�f�؃�yL���v_��|n�vs�Z\ռ���n��N�ۍ��������,��k'�`w�R���*3@���j�ܤ5�}�F�}P�ڕs�U��ϫ��mB@��z�%�Rr�?�b���at���W�=V��z�#�*��SB\9%��Ł��9z~H[ST�_�������5���%��β.>�����O�K�޹֗��w�xO������4Ж���Z��r.I��Ndf��$=���,gy6H�,A���5�V�,@�	5�5�@�`В�KIz�$H5�fq
۞-��~XO��wq3(���ؾ�[u�,@�^�M4:?�UW3k���c���7���_�T-i��)/�z~,aۚ�[��5�L.����C�FZB�r�ۡ���it���=h~S���<�ER�,K��@Nq�Tf��F�S\$uko$niGbš";s�"'A��Ⱥa�&�^]��i:ZG�8�9��_�Z�=�.i}�}^ܺ>�{��'OQu��?.>^~q{���?���7�����u	��1�}]E��͗�_"t_;5��e阧Юρ
�������<�����ٝ��\s ��1�#ڞۋ�Շ��E��e�|
���8D���ھ�A��m�E۷"h�歩h12J�V'��Ek�o����Bl��;�e5�;�e��ц��޲>]�}��lГ��}��l���}��l�W��}��l0bA�No�`� ���޲��<-�+��������N��	A;���%�X������P�ϮE�i�i��_b�=8w-x���{0����(�_�]}��{�<-!��y?}��L�W.�>*����,�?X���0(�UX�@�-\X�@R-��2��U� պ���_Xe�#Hv��J{��(a�QViۓ6�Aa����m�dr��U��۸�U�[��UgU�Ī�Ug۝�����d�A��i#נ�x���i�5�]_r#� ��eG�Ym��Q��C5�톯3���l�C�^�.�c�5���:>�
���*�`��g8Hz��i�S�U&����p:T��H,�f<��7>?�>��K,��ě��K�؈%��˒X��t�W◴��X��V�!�|Q�~�����-O>tj�_�=��ֱ��^���0դֱ��^$>���H|r5��iA���m��7��ulC/f�r��:��S1�t���a����>�����i7�)u�J�O�X���0��n�W��NM�čV� �H�v!�*5�%M�۰ᅴ5+W�a�U���n�<iU%��l9r��A�J��I��Ģ�i�v�I�M�� &@r�6Z��m�����q��N�VfV�A%G���ęK�4r=HX���<��xN:,�sâO��.;�&ŗv��lD����]6%.~'tnu}�p������D,�W���jh�,*C�;�kQ+4}؆���K��Υ��(�gQ�T��A��$=�$��@��E��'J�Hn˷<?�34pӡ�Cz±�cQ+,^�v�Y\	���VX\y�eÏKM_�M���N�c���%./\�8|��>�<�u[��R�e}�pϴ��|�P]��h,�9��]��S�Ƣ ���$+s!@jW���h�Hb�F�t4f� �%H��k}C� ��T�D�t4�0�*yjܚ����6>��QSH�dp�J]@��6>�:g��v���|�F��IU��h4Ъۨrn��V]� �hhn��u�C�E��t�n�ʹm��qb���<��ǒ��Z{�V�ha��5�>�A���X��7��ٯq�E�O� ���V�U,��ִ�\��T6�$WF���2mչW������G�:��U�M���$�]$5�@�\	�Z_ɑ\�'�y�H�{ -yb/���J�Ċ?��w$WF`T=ӝ�Vn�H�O�~���t�%�Nh��VV5�l�_7{��R�q7>Aܮ]�U�)X�3+��*�^�����'�=��-,�-Xײ���Q���aA�)���C��]���j�ؒl���P�hUF8$�֡�.7�ڣ�ʗI���2!���ˤA�)y��Orgm��6�A�R$6�m:�7T�0��e���*��֜���9$����y#��-Y�Eq�~�����J\���D�AZ��G�j�R��7*)��6��Ϣv}Ǎ
	
�h���ZH&�_~R�\���Za��!���Z�|Ih�!���h��b;���G�P[ڲ�R�mӄ	��O Zl����!S�TXE
�țj��{�0�W�A'D��"@a�S �6�~�0h͍�=��[��j�ݔe��v@G���O�ہ��t�{�ܾj�8�5�>�(�KJ��TB~Lbo�[�#���Ǯ���W���5L�K��ƛ#��i�G���_�}"��mo�]���Å��|���0z1����~���-��N[l��T��Uq	�0ijt
�`S�T��&!��
71���KO&	�Q͇Y�e1�8iP5�7rR�����p �O�oyO��gS���e���h���<��f��M�K�I�*��vɳ�f�*�s&��qɏ~㶏�g+���P�s��|x��0$H��K?bL,��M4S����z������<������,D��f8x�%�%P�%\S?q�T�Z0��M���^�3��O,�1	R5�I�(�ԼHՐ&G%	��?7l��o~���nt-�V/�zB�� E���ov�}�����h^��~���z2^h���@h�Y�Y�̘^��T� Պ�)\JB(���I&�~$���^j��N�N����)w ��ê�]I���LiXU���I�ʪ�Ar�~K�\t��\b	�@��-�KB��p]�M=���=�Ǖf=��ԁ�� �t��T�K0	s|m�I�%��o�`Rb��@��&h�X�:F[!�90��t��
��f8�'�ՠ�>�5ӣ�$tM����cm{�ɣ��E7%���NM_��v�����MH�E�Aq9�BE���ێ�~��/���݇��mߠmտ���1�5{�%WC.<�2����i��7�{b��}pu�x��&.���Y�[�Ai[�_ί�$w�tI��%��1E�o�yѶ���L+�<=e�Z�����6U�B�n�0�8����e�PCm�y��ԣXҤ%U��2bH� U��v��a{�(�K_�zO��W.n��iK�N�{������s�^��n�D�+�9������y�0>�ƌ5�[Hb���i:�$�}�4ciI�30e�h:��ꭚ�B4c	Reg�R4cpO���4m`iIե6ni��؞�ni���%Q���o�C�%��t��U7^�S^G\� �q�l�v�Z�2%Wi��*Mh�Ӈ���*VSv�&`^H����`,A�Ef��3�h�n��Ghէ�F�Y-n��2���j�n��y3Hj�lyW��V�sCF��pKR��ЇE��{���ن):AT~�c��uúC����nx�t�)W��/�o"�꠿J"Q�S�<��v������E���3�g��å�?|~��.!�E�k{{�k��RXyW<��TO�ʻb m���ʻ
��nᆑU�<�jŤ^�0)@���C Y�I��>X�IlO��S�U� �����c��4���U�<�T�T��Y3(W\`M�AM�R�����ѵi\�c���nx۸������H��&~��u2�U��!铸MJ�!��C��9�8�C�� ��7;%�F��8����oN�m�Q������lF��ͩ��H?�3�9]��a��>n���    pSh+r���)y���$�+���RT�)9�s�R��`fO�=g�r�Sl��<W�J�O\3�WN=�6$�Nɠ���\�������Y�%�nM��K������e���Ƕ����1eZs�k9��t���gL���H���N�393ͨ0r��a��V�j���T�a�V�\rw�Y�o�#T]���a��FsR��5��3aM5��dMR0�ܕơ�é�k��|[�'��Yב-��A�4��OF+��[�'�O������	�s'�Y�Җ9�C�z�KnL#�. 0���@G���#5v�����u[T7�#�#��}Xj)��[�	���_���S�a����1�o��G�ưxvn^T��	��j Y9a�Vi�ư���4%�#kX�I��l Y)�#H������&8�)o$�;MnȲ�EW��6/�5�AT��le�a�	ɠz`#�{9X��fML�����x#�c�vB����c��YS>�j�Y�3$HuՍ���H�;m������5U�1�g���V��FQ`��1�g��� �a���$��[�X9%�X��דE�����կu��e�FnQk]Cޣ�珪%7׾^�hL�W��;6��$~��Q��U�4O#���R��a���,A`Tc,�$��9q�M3?��v�#c:���mI��IMM���m	�j����Y�4$yD�x�&lN�(a���lJ�1��&ŉ�IE���?���z`���S������;�Ӛ&�#����܅^ 2'v"fN�c$fS���C̙Y��X����=���p�MIY}Ц&��<�F�z�l�7yXz���Ҟ*U�$�E��~Hۣ�"لp����1��@�I��d{��1+착��!�c��/����1`z���̠���%������+n��V�$�c���iI�'�֗�0L�Ř�t�%P$�f�-��g<|���^bE>�e}�3)���x-�k�����I?G�լ�(�XpaV@���t�A�iGS9��n�#D�k�TM+�����*� rk�\1�"۝�O��5��gcC�E-�wN����ju�g��/����:���q�n���'����e���u۵^ޭM��o��e]�)�����M�s�q�X�Ʋ$^�Qߨ�Q�����x�fT��`�S�^��̨��Q-qc�˯Hcp������r���=��Yʫ �MŌʙ�"��O��QbF���0�v.8fT���4j֍j�e69u�ꓽ>N8F�)��"�-�%�61����q��2W:l�rm+AF4�-ۚ��.^f�����<��-�RH��U�tPa�ny~�r�M�vr3�>+�����h&���� �^$����}D��CCy�M�%\Y��	٦��0v��B'1[�pm^~����}�%v�N�]�/Ԯ��̓�|�B�����
����	9	璚ִy�uB�|e߲���ɩUA���M����O�-6�Q'�"T�[�4�S�ߓD�=0%����ͥm��ī�i��v�;��&�M�;9BU��l.�6!Bu:u�G���	!�5��L��N~���{�������+(��?�ӥ=H�4M��Uڕ-�'�S�o���K�&��Q��m���_y"�Ѡ3"��6�܋M���_�Iiٓ�~��Zj�_s�p�Y�q��S��y 9�v�\����T[���|��	+m!ok:�*�D�-}��Ũ�4̿��<rlx灴�*�O�[n�8�p��� ��M~8�vH������y{�&��G�}�R����Xl�S��?o6(YX)��&ˠ�rE��٠'� �1b)�Ar��CuҢ�ülc?�]�〬:���3��)Ny@V]�����S��Nq��60��Y�8Hx>9�A��{���f������$'茓�$��kn�Tg��	�͜d�Q��<і�qq�)Ӱ�*�k颞�-���~m=|��a�B\KL/�
1'�&���V�`MrJ9�\����!l|�����Na8�U)��nl����Qm�ؙ�M��),��R�8��&|b��'lNU��Rkip'(�-���	�d�Xv���B����Ar���p���bZ͉���&����Mjb,6��=!��+`��v�l�Ky8a��]��j	��O�D��F�0#x��!�D�05t�U�ʶk_M���T�j;QdiħX:Qd �eS�J�J���	�[O���e)T�埠[�,���L:%�W�ն�D��3��1��'XxjT����d�8]S�2q,���u�&�`o�OX��0�\��e'@��RРrk���΄lX�EV�U;V'��S=`�l)5W�^ԍv��NY\�����b�&S~!1�0���m3��0�[�k�֩aB��ԭSÄ��e��	&\��N()apM��uBE	�kR�j\� F�Pc���.�	�f��"��m���.�	�Q��"������z��L�x��ӫf���&\�E�N����ΐ����z~��L=��N����ΐ��p�=�u��#d]۽;C>��'t������=]�e�/� ��췰�]�O~����3�C`�2�V��KN�9�����g+�6�F���ph=s��M�l�&H �ڄO8�#�I+�8G��Z�	L�#`nNj��FeE�I'�[�pUʨ�K�1���,iM���h�Ѧ�1��cL}&m�-��ԔW7n/�<���KH��6��===��0�%jT_���E�����Θ���JF�P��PȤ�[����<FF�M���#F�uij��h�C��i��7� 3�5u�
��::@��S=GC[s��Q%Z��56�NqxT!@��цpB'��亭�N�]��o�1�"Ǡ��l��=�S�U��I&�_�ۙ�{N�����_q��-��;����u�?�\�9�4Z\ 鞘t�H��)��:�ͅ��;�!�4����=:,y3HnO�x�� Ո���H�i+�$Uv��!�tR��H�n�]���?���b��MGڀ[��ؚ,_���nI1���q~ԮU��� ^��Q[,l���� �C�g�䪻ak *~�K��|���⧼�*H�M�g���MdkQ)�r�&ⶨ�a]i��akQ)���v-�L�S�٢��J�%^�)�,%���x��Ǵ<�~��չ�������}����g)`�����3�c�8��h6�R�>c��5�F�0R�c�j*�a$�%>|�0�4�a���i���Ŏj��`��ؤ�[l[Sp�L���#��!I��<�T7+��H�!}�N�i��	��5�`�N)!-��W�p`��`���Otq����}�W��0y�|~r���=yR͉j.Y����[�+�.�a��e���ǠL��O�N�H��(����4�	h�� HӻL��A�2�4�y	o��@���^�2�	hB�Ғ�I"�&�.-�-�G��/k�5��S4H�������D,�ylk��sD�м���l7ُX#W�������֜򒟨e@ ���x�.�5�yNyk�����ܦxܼJ�fx���)�)^�Zf�]���C_n�վMy�O��!��G�cs|
8�h��υ�]�^$�~�Kr{���G�R"���ՕR_�RO��Dm��zZ4%@R�p6��{M�T�2�._O��0K�._O��0K�._O�P0�&7��"����i�=��΀\��dG�"ˍ�=-B�V�x]NyO̲@@Ҽ~��{v�/��z�L��E(�ִ]��EX� �V�<��&��B�ESЪۂgO��H��b�߶)^7x��]�[��^�>��<{v��.�r��TuD�����X֨�s����rX.ms��Z.I���w/?�E�5��t�v&r&�Erڙ<�TϤ�H>��o�< �3��%7/:#A�6�#�i�;�.>�f�]:����A���R(/�;��x� u��kȾ�,%R�o�2m��rZ�t#��V��U�1���k^6��r��F#��,$Ϗ���DV{0���Kd�K�jn
""�=X�$��d�5q���,W]%R�nMV{pƚZ��挗\oo4ݚ�,�"oM��ۚ3�����C�, �CE�I��P��iZtd5]˥�&�"��i    �Er�+���yq��5�m�����/��aqk��o��� �)m����/֛�!�����M;�Գ&O&֛Y�渦�z'H|f�u���V_�w��;8b%S/S ?�®Ԅ[
��:궇"�wpĪ���Է�b��8��(|��n���>?�R�d��~��d<�K���o�ju�8&���/ �����x����k�!�~�K�
�ԩ.R��K����'Uap;��+r���k��Yޢ<a\��O��Lj��E��p-Ӵ� ���:��ƞ`y�FC����`�n��LJ� ���"�|G��f�6��y2\���F��e�Q��A�q��4h������ܪ8��շq$�dǚ:m���T��|)#�ܽ��o����?Y��l�@�r����!ˊ����_���Ab�?G�O�1���P��H�r�j�.�Q(����[�5����,��gi B���d�'��3e�N��!�����Î���>|����OW��d�B�#E�di"Q�%[�'��8\l����z��G
e~�$�^Ԃ��w��p�'�՟�m�;9�ǻΰ�uz���pm��QF;A)�.��Aj�Lj��E��V�:Z���unl�rԺE:e�%��A��M���Li���i����I��X<=X~���>����O�_A�5t�������D�����bN?G�]X�j��#vԹ�iP�ǽ�[si�Ky]�e�c�K�������қک3�|��4n�Y�m{424W��xJc!c�����F?I��I�pk�SF�&u�Ys<24��ؚ7�$��J(��ia��'kVv|��Ǭ9Ғ\�s`�O� �i����"����Ұðɑt~T�&����p���\��1��3r�n�]�u�se.�M�$��yya�;J�����_��b�;	߻�Z<�]� �|�-żs�>Z��X�o)��|b1ܰn-�%�HX�Jm�pӄ����%�f�I`$��fYH��p#�Y�m���V�ά
,�HeM
p�2rC3���N#94q7���ͬ>���18>�Z����`̬^ �/�����k�X�3|U���]I\�G�U�Fi;�e����e��AD��Z�\y
e��������qI-�Zc)�2��P/2e]��!;��ny���*']:�$g��1cE�`M�=���%Hn#��%H�m���f��>hI��b������Y���%M�Af��c{�Ue�����O���ȅ��	���$�e��>v�Q�IIa��R�mO�p0i����D}8����8T+�5L�}jkXf�Q �R��9ŝ;�*
9!\���6�k���s���D`�,5|iS5¶=�,�yiHu��͝*H�RM���§�C��a����`�6�Epo���W(��#�J{Nf$AM�#V.+@b�T�K|���t��1ݓB�+���Kۚ�L׶���K}=٦����l;��7?�x���}��o�����o.Ix�>vJ� ��.�$@�r؍�w�4�P�Xk�	���g�&��	�f��A�����K"�GNUcZ�U�Ո�2�7fP�?=Hlc��L������P��z���#׷'nҀ�t���D�0�V�ֻˡ7ua7��N�;��ۨu�1���^�2�.�أAk��Ѫ{���}�'�j�����R.����Ӈ[R�k���Ru+,e�K��f3���S����6C�-�c��HR�k�����A��퇆���
�TT�No~�A"dɲJ�*wՔ}/,�P	R݋�dLaI���4%c
K�S�$�VK/RZR���j�E�q�x���K�w𐻇%�(Q�&4U~˰��L��^T=��8��q=Q��J. ��T�_��Aɂ�Ү�`aɮa7���ZX�`��n+��̎���My�B�X�	�=hk�p�t����8�}ӧ��|�8�}S�%&�G�3�7��gs���M͐خ�4�AR����I�9�
�"�{�;���?�,Q���5��y"�s��y�����T/��|�����aO�284�4�Tg�Yi�iR��l��7�Y��8�x��Fok��ݻ4�4�2kK@�x���Hc�O#�b�-M\�B#�Nl�,lB�hO#�4*�5`�Ei4T����Ҹ���h�JW:����ƕ��-*�4�!fI���4���a��M>�7\��ɇG�E�HM���&�f<�Hm�kqP�.��>?�K^|����>��I��é�n>&�֕t�U�Q�FSu%�r$��[間 աŶ�ؑn9	Rm��]�C�ʛA��N�@�� �-�)P�CY�i�mT�ʍV�s5ITԡxݭ=��-:)�v�-�+ד�XU-ZS�WY����yЪOy�գn�_+Kܚ��}�z�k�������.M[$]Y��ִEҕ���r[��T�A�6�����]�,Ul�&���u�ƥ�S���r�����m��:z�YX9�~}���4w)Ų���,{�/ly}��q�C��_]����ܐd��Q���a�%�o Iw������$����9�<$�. UUSR��$��r��Z�$)����VOHR�"-�֡-I��N���X�ZN���AIQ�\u5�2^���
i�.�^!k�O$'�U'����;�=9V3�|���fI�:�M.6w�.�9����%hǇ
�'������!A�ҧo���ş�j�Tۋ�ꂐ;�ʗh g���'�+��,���ʇo��b[s�:?3�b�qn��X]�[lJ��Uz@��\93NZ���*gs6X-r�U�Ƈ��*�2sz;k����6�dn��v�b�S�Tx�o�=�E����d��Ɏ����\�%ְ���%;���u��z�KHCu�u��}Ɏ�,:��a{�#��ð�$w0[�
�H�hd��̓y m~�`�p1�r+�\Đ�q�!�v'�{0���RM��2�Ò�� ����%+KF|b�%�a��Ϙ��U�[�yX<�v���ê�� O��V��e�N�2���إi�h gxD�L;��.he��ȟH�c����2NЃ@�H��i˅��F<�!O����Y�{�j7�nY�{��0�nY�{�&2fY�{	RM�#�)>���7��밑���s�d,½�x$dOrQ�5��d�0�z*O0� �v�~��T��$�ޖ o əfaMF"�U��{;>�����_��3��45��r�R]Kv�X����SFqo�L��z����ݲƚ�����7cE�f���z�9zZ��4��)�ԯl�QO�BAj��Ĩ�e�0�Z���iY(̒���]Pr������Ѵ)/�i�(q֩c�HV6
S/��z�>���T#S��i�(aP��f��Fa"��@��wAﺍ��i��RM�CyZ
ڙ����R(Хi�=-���I&t@��_���0R���l�'��q���PN2;J���~gv��i[����-����}����z��⳯�_/����x�~ˬ�$!�����W���.��\�qZ��vE#�
t�u/�W�k�ǐY��0%7pu��
��.��
\H�tP�
�H���8��
�j��]gV0�� �����6�Ԅ�
ŭ��D��X�B����PX� I�Ҷ&9b=b%�)\��©���Yfx\Y�r�ס��ɔ2�� �k%rĊ-��f/3$r��DN��L���X��S9M�Ņ�[@���k���"����ϥ���>.i(֐Bȇ����8!j:��񁪣�w���"�!«{���#h�I%mw�@h��
m?GA��	m?�A[�	m�Ah�;��\4�>P~*�>�EЊ(�hM�m�G��Ek�o�;�e}h�}�����!������:���޲>j�о�[����wz�� B�NoY�Ch��-�Czm}����!������3���޲>��о�[���;�����z-�|#��"�ݿ��N�n�K��-�H�j)*,�s��qI��՘�s!oK�)�k�p_9�.[�a-/?�~�j����	^�7~x���W��퇇���ܕu���KW�K6/O���>����~�罓`�J��P�l�!\��	{�X��V�7�;�Aw��������c���m��&n`?���+@K�mzb\V�-��~F�c�g۲��O?��~���kaM�    m�J�!#�����I����z�@�Sx�,�n�+����ZfmW�\"yh�rT4��߃Ė^�(��S�ՁI�{U�m�ſb���E_f��G�X���+��Fl���g��ˏlT��G_�O�+li�r
ē�+���I��I�3� 	����o�{9�W
���������z��@��a������,�6N�#t�d6�>�T���=%�"�(Z�� kv���jK����G�����q�3Ho�Hl[��o�ޜP"���.��><��ro��m�~��
��Y�ޤ�:�E/��G��Vg�q��{��S��g:̓�
9���$�����O�Q� �J
4)g�k����ߛ�Wz�cՁ�"��%���Zw_�]4ƅmm�����es#�e�ޯ�����%�zl���W�N��EN2S@Lj*��/n�1n��{e!�7����G�8����U;loB��ޤ��ؐ��Iv�ٔO�xU�w�.�۔5�[xfCh3)�w$���Pվ�B�	&U�l�榆�5�[%<���;��]O���)k�8��1h��l��a65�%ְtH��Ԅ��P>�)���mʚ�)���'O������+��ML���ۜ(��<̉2���65�Y%F=@��c���}<h����5�����e�j�iJ$�&�2@�'WcS��812h�Ӊ���x�OI�Z��-]t�]i+�#췥���z�1��̽Բ��,���d1TN�,�V#��q�LL#KC�hGU����ʒe9ڑ:��ad��1RU�B��Z�O[�x9�O@�JXڣ��ˋ?}���1�jw�7C,C�!���B�{{K[҈$iK� -{��$�iRO[6u,C=��-��-)���;��TsG���-����X���Z�vz�AI�#iPU��6��Lv~�gЪ�,IZ���]�U'�a��n�>k�N`����A�$9��	��=�����T�;��fP��/�&l�<K6�;Mh�I�b��N������%�%��4rn��4M	���b,L-*='�V���>��=
�o��K�%���m��U=�Pk(��|��E -�b@'�t	J߬�[�6qU&;3G@��LnN3*�� ��H��˧`p-ś�8t~Q�M� �-�/�c6�,z�����K%�-����Wn˜��g�qX�A�F\A����f�~z�eB6�	�^ut{���"^[wY�$}�{�к�k��ѷ�K�M#ߦ�Y�3Y�M��[Ȧ��ao�ķ�}�.�ٔ_f�lj��l��6�g��	B̦|�;fS�;�&{�*\��*���UP�����-p���%\A�f�����]m�r�����?�N!
&��۔#1�^��^��g�)�2Qu۟����=l�i��wȓ�6:�)<�U��IFݲz�,�}䄀ߩ��M��m���%l�'D�E��ڜ)�N���R��S�����;`B,��K� ��?#8=A~���;R&�{���T�vٓ�1�N��zm� p��)�<������@���ւ�M'��W�l9^R���E���-.�Ѝ��%[\2��:K����s�u��n�3?��Jے¶�ڟ�m�XKz���(�������u�#z�Q��4�$&!��č��$� ��5����_�vo�ӡ.>�R�>���#���BC�}vQtxT���!�GX��Ee�_�->a�m	���Sb�5��h�O�z:)#v��a$�'F\�ڢ���-�E��0l�Ǝ��'�=���j^C\�y&�V��Q�AI�T#DȠ�,��0~��Ģ��9�m��σ�B���0̗i%1~D��=J����O�n�A�`�0B:��Ě����O�A�e^f[zn�@�V���ή���9[&{6��|�l�3����r�]'�O�J:����H�Ɏ���0�������F�x�vWCkr'0L1�&kwBk�A��N�n+:wh'�����龝@7|e�[�z��o���t�N �ahM����17Hw����f�Πӟ[Š�K�����G?.��灞ٗ�Ww���גkv���/n�Ƹm~+�xXd}���WLųI�0	RM/��g!��K�%M�!�r6 HS��񦢃T��&i������L�0��٦��?{���3�����|WL��6T����� ���nE7�����ϴ5'��H5AgR		B6�aC\
�a���ؖ4��)]���ܟ���/���延��7��w����.7{<;��H��yhW�}:F$�� ��_m�ZAL>$�P5aϘFL(��7��a��#?ZŮNW>�ln~�Oh�AO��a�<XJ�qx�t�w��e<���.�g��W�M�ų׈�Q�ov�٠9e��9�� mgr�����
�.�s�!��*k�!���#�-w�1���8���U�f^�}ZrNG�$vMIũE[��R���K��d��
�tz,c����ʎJ�
=豫��~����}�:�M3H��Hk�Mt4�ϱ��&:X�� H[�A�r���S�{���Xz�^s����%��J�ހ�jL�<Ο�/�����|����y�Z����H{܉��Z�3͠	���%H���j� �Ӊ�#eH�w�` YIG��Rg��S���*���o˜��u���nj�ҿV�jG:��w�&��j� �i���6#�� �#?��5���o�Q�m)��&��j�w�7x���䏼�'_��WKra���Gﷸ}t����X���@ u.��o��$�.0z�%0i�&��ĸ�DD�k[��$��XJ$w�Xb)E�s�:,��@b�&H���j
���K�!�=bM�AMAmb�H��3�Lu��"��Gu�L��j�� 5�ʖ�NC'��5#7�X��rk��ݚzN$^8=�p7�c{�lӒ�0�"mRnN0C��W}�qmZR~�*��D嶴+�_�	��@�]��O���'{]�����XS�(�Ö��/i����G\�K��1m��Dٱ�O�|��[��>|����OWNM~pK�^Da��}̆���" �	.f����	�*Iǖ��ߢ����yk6%��r�m��*Jg���E&�ٔ�zV������]�����lJ�F5<���ͤ�hȤ�n����������bp-:�.���k{2�-�k�b3�Y���(1�ۋB�j]�T�y�3�ÅLZ��|�&H��w�	M3X�i���2�h���N�X:��wr�Lc#�MI��Q-Nڢ�2�݊�t�e C�;��"�:hq�p��䡢h&�����[z�\R����_���j�Ҝj��wr�M)�P7RE�SmN`�S�Lۙ��q�'�,�*�e[�;9d�י�ǝ��$����@�O���2�`q{,�%��֗�:CO5��<~�����O>���$�7�:�I�O��	�xr�m���#�o�4w�)�J�1H�5���7r�j7�e�A�H��H���4���U�?%�5H6��j6�z/��DR	ܘ���-:�A~u�{��c�(� �-�a$@3(?�(��&3����Ֆ�H�fP~�3�A������g^M�$?a~/��[�4���,���[�����ksDI�M�UU9"�'ʒ��U��o7a2��&o9��P�qR�Y�5 �%+*0���[|~Bz�,�
�Eg�J����#ei�B.	V&�}r�A%�țAgDJ�12y��Jc���5.�|@�q��3b�������wP�O����GĮP�����^-
�|�Xt�c̅Π��z��er���Y�]69�,�2,K��.w��Y-\F�6�N	��~S�9L��+ʔlfIk�K_=G�H$LCU��"���Ũ�)�Χ�}z�����r[�$Ru�M~s�2k%T�(a��/�R�[��-����֜�s᢮���]����^]cJT׃��buiR{[�����K���!9�U�Ӧ�	�U��6U�l�:����a YgR]n�<+���������m��$+�+A��>$�I� o��� Y=�G����
"s�V�r	�<$�� �������,�f)m+M�=��氶��1�ء����x}_�����n��    {W���'zq�U���k���g��>���a�m��#`���oۄQ@G����m�g=1�&G{]���:��_Ў��f1�Z�����{�5�ZW�U�i"��8_D��q��r�>]�;E�.>��e��|�}\�E_��5��E�v�D� �<l{$E�*v���N`�'���>�)W�@� =������0��>��M���_��8Mg��"���O`[�2oK�q��@�d�.7��yj�fd��tαq^7ӣ��g<� O`����N�M��)�WlE�\�]w��;����K�|�Abk�&�}��ٗn����${� !s��!{����l��M0��?��1�?���������I��-}Y��p�b�r�L�˔@+��8�!y�N��n(A� �MA���W8 ��2�N`���'���v�����s皢A�a�m�ʝ")��5am��pD������\�R
�n�>�����?^;Gr�������uB���c�A:G��rcn�6i�CU)�}jrCD0w���y����hV�	��ƙ_����(m�/���ߺ�2�RA��ҩ����4M�#�5��$Y�M�����<#�|�D��bE/�����7�^������/�d�NL/_9��Ԙ�f�KP?�*�=u�qB"�=OR�N��{��a��74���Ac�

).����$��Rʡ��+6w)M���/QO.�"��$�&U��4��ݖbg2�u�n?�n˲N�(}�m7Qz�}�!	���[��j?]O�@n�2�txX�P %]����:�jq����(��>!ӝ�Lw���,�跒��gdt���Qщz3�A*�}�lU�2�ʩ'B�D��2�wF���f�O�Īq��'=Kk��ԡ�tb���U�����z��
�����ܞ\��9#��۲È����b����m�����3\��8�n���:�����\���k�;i�ˏ���ȫ�%�4vd����fW��y(�di OL2ڂ2YQO`�����[����NtY}\j�2��ˆ��ź�m��������!;���;>�^�͒ռ��^\"\hHkF9�.3H���GP_F�
Ր�N��H�2���vf�vw��<�ڙ���n�nH 5{vm�7�3�\�>� ٓ�
�Wx?�8�"N��lP��\ݠ�dB۠]��������^Ğ���2��=q�rg�yC���vWR��::����4D�:2D�͞]*n���	��=��4ԞZg;D���٠�!�0�A��+�֟KL�POp�����,o>O:�|`O��d��X���k��LJK�9e��L.���,�ɶ3)f{B;s��	�����n��t�O�@�&cR`�w�)�"t${�*�=mz��dI��B�^�����=m)ɮ�E]�DN��Q�Φ������{�L�9��)�~��2tiB^6�n�-^�D�|�2 �P��1�	{B�;L(l��������*� �m�w)�`��)8I�`X�eipm���d�~����g�����ؓn��ޖ�]j=X�<MH#g]�Ӗ\

F'0B{�M�o\���2JF B116p�ߣ�Q'�ڒK�_3:�ۣ�W�&f@�We�wi�Zyw32�'@b�_�)z�-Tw�1W6�)��'����@'�7�m͠��%�]d6�B?���St#�&�Ʌ��B�n~���Im97��m�i�hB:��A��ib���AMD��Or�u�AC	�LHϞ�]���g�c��A���>��31�|���2uBO�dP=���bø� ?<�uo{��^%�t����+(W�2أ����������c���6���ߧܭ-�9�]n[\-[�B�����]�7ĭ<7�Wæo�����2�!��?VbtIeZ�%͢�r�򊴝A�������A��M}���n��"Xk�Zë��w�j��s|�Eɪ�%�a�����i�ë���u���V�
���W�-"�m�E�Dא�rSYD��շ���:���AhS�V^��Tu��j�������հ��`l(�)�?~z�������^ۨ��Q�h���+�[%E�k��˩�����Abw=G-N�T����L� �2--��y[�����t�yb�8ڻ$G���.%�C��K�"��U�����@r
zr��*|b�Y���ܥ>Z�N=�j�/�B��[�!K���ON��F=�kt���\y���f�	I�+�L�P��q	2(R�� v��f,��Tɚ-o�����r�{|�-�
��3���ɑ��g�dU�Ơ��\H��(%W/G��Ҭ�Q^{�ɝ(�\Q�q۲�-�m�ק�-mY�u	aM�E�����uR5�ݟ8�2�%��
��ͨ�+��̬H���@�`Vġ�խ&����'�!����H�.|��A I
\�vk�iS�>x+H����
�@n3,�����.v���圫G��@ιHF�^=B�(-Ħ"3A[x\� [x=d���6��(R �m�W" ���\�͑M�,�vr;�(�\��g}z�P%�W�^M����٣a�U�vlNH�Ut�=���s?�W�e!l�H��}�?�QB��hw�N���8P��n�u�&��o`�t�c���7F��R(��q��P��V��i_[�4�)�|���؅/�U�?|���������!��ʕ�]�-� Ie��9A0aad�R1
_��e}�N��F�#RAT�U�&O�?.�/.'�m���ߊ��]4�m�)�����mKv�dߺ��s�/�qd-q4�;&{�,0`��h�#P]�4��1��H?�S�F���v�FO	V��Y��w��x����{��"RO���� �#�:
�U�=�8G���- ^�E��.YX'�L:�oP�@���U_�wg�	��9��4� �C�$���צe<d!����y#v3�S���2����'>�m�`��3Oj������VP$�H�ԉŇ6*yp1x�-3�]&nCL;M��"�j����I%�)�r��.4�R꾓/R}�-c�J`�o|ۘHRW?z3��D�rH�>���2%�H*�}����C.�/WZ3�S|�o�H1���F���v�8���=1�����yŚ��!�?=�]�����=�O��sb�7^i�#�'f�`9��5e�j����$��x��&���CV�yI�q3+��jJ�
qz�Aw�z����NN�3�;miZ��~'i0��"�����2$6�=�L���Ȗ�-���W	z�(�v1M���(T��HY�1BǞ"+!�����v���#�$W�x�vr&���(äd�V��R�]�}��6�Ī��T쐽���M��Xz:g�Ό��"͙�.ꜜT�|����ڲ�eB]�J�i�ɗ	%C��{��RS�K��;:˚�!m�'�ˊs��E�hT�1b�>�D��h�>�DH�zo�Y���l� �F�ٞ�ͷkI�*��Xq�E����ls�Ȓt�Q7�FeB���yq���$L��C�vS��L(�鞻I�>9���Q	��vu�F��Kd�ox[��m�+�G��V g�P.��5Ou]��8_���Ċ_[���Eb���'���Ço�����m�����8h���/���z{�8и����wBw��h�	�Qܨ u��RQ�$86ԛ,�ၦ_ �*���Hi�U�z@c��H��hi����W��)�hM����3	��Iik�'[�YW��H�*6�W�$DKkO(�#c�!j��	��Ф��$t�I}��iQH
��y�*�ƒrv���8�	��h�G<8�ӳ�:�F'rt��j���$bNR���⎔�*��g'�.�m.�XI����i��jHv���V=L�R�&�!�.���eie� �)��;�����>M�,��,#�諊Ѣ�^i��6�ʭ�����4Z�lI��L���4�蕿%uF[,F���H�[-v�g��ֱ�:���$tj���iuD���|@�\s��Wn.c�xj�4IM�y���iFPU�yj���=eG�:����7dϝ���)yT$�ؕ4��lIhG�s�N�*�'�՞�KU=5��c[m��1�%�;rJ��L`�$?��zI���W#�p3���U��+    ��Ki"FyC��,&��0��r�T��.0�N�'�Z0
c����=�LvJ��~-9���/|*u�~��7��ղ���<��j ;~�Q	,P^���v����HT��M=���؋!���a��	#@�Mj�V�6)�
nRC/l[{�k������+,��͖����)��ƾ@��2���#�2x�,�_�T��m�+"ϖV�fS��hS���<a��Y-S � 
���F�7�B��8]S�P^�j�&�����@���QB6��s�^}EM�숪��9��{5[�j�H��4ױmN� hs�]T��$�����TXΡ��$4�h1��+�^�A�v�Z����7I�6�Du@0��hB���*u��5S�|Ruz�L��,���;���#_.�v���<d����F^ΙT,fT.x�9�<!�mR��v�H��C�d���9�M��h1���I�N�-i�&�U���an�'8c�?���.�- 2^9'_������1��ػ�>��������E�; ����d����O6*y�sS(���OT5Ƣ�P(yv�Z���嘼{�#[ =!��rxmqI|�̙�y��(+��r�l%畫��%yz��������i�&yT^��:�'��B�@b٤qn6Js�h��	e"�OI����q7Q䳜@v���D4�s3Q깷��eB���ь&Q��\M����ԣJv�M�>i��"&�8��C�;�"��v�D�U���	e2�e�ʄ�
�Ԏ�����t�*/j���W*M=��ذ��cW�����d�{��s?�@�nT[�d�WJʐkY�p���q�K�͒�_�Xsr��K�L^|۹�m���/�l��Ҷn/�3r�m��|FX�2l��t�	�'�Q���"c6$�+�H���K�|� �k�b Yz$��@z~�_�U��&��Ф\�M�#dz*J�z_�D
ۧ�dg� �ҏ�����(.���u��7�h^���g�`�%����PރK�ک���֘IMI�B��=bT����-�
���H�j�%��W���O��<�L���Ζ)�Qh�G��ce��������2��X�U�@L���VF. ��\�i�"��� )�=����s���+QRi
eB_4t}�x
��kÈ���U*�T�/:���n�Q��$���N��p+���߈���
`��!k���tJ(���L%���E'[Ͳ���0���~\�s�g/���]&����Rss*�L��n|���"��BP���dw�D�ec��4�,ҵ �>s����dq�1���8V��@R�fHn�E@��͜,ΥX� ����o�vOĲ�ß����.-�/	�kh���-��.�d����rSC��@�m�ȥ���k��V\I��f�����]r��E�j�@
�H�5��)����.kX��R���m�v�؛7hյ��ڠ��Aπ�6h����)�I,y�3��W��mgv	�ۯ���vf�
*��4�۶ʙ(O�Wy,��Cmѻ�����	��u�Յ^G��Cqw�����
���#zz]�͞]��f{���0{r%ߤ=��XX�6�g��n#~>S�����(7�&���`K�2��:a�ՠ�4�v7���WEJ,}�m���z�u¤��&��,rEm�n���YC��(I:�Ne�X8�͞��^ҞE5�-a#�>���}?~h?4�W7�/�r��yr���n���zJ8�;�\)"���r�\�?��C�hB�S�����֞+����)V:���y�����Լ<�U���	��ʤ����5��b�`�ּ�Kz?`P@�Ĭ���tз�y�,�i�`[t~:>W���3��یL�	�X��.5�,��淛@�`�!dB"ٹU����Xd�Un��З~��o采��B)٣�O�|w-��W,z Y�qپ��?S�r�N�5Ԝa)~8srmFy�A���qA��)�ǔҫ���y>��An8��	�o��$u?��Q�l燩C�^Mu�>lf��Ö^�L�`�Em��h�)s#+�3un�A����pNO	8F��p�R�E�%xuQ�c��$�~Ik����~�]�w �������t]�k����d�r�=�3iɚ�[���0�En%Y�b�j`�%���Z��ů��fkB'_�+H��	� dM��W��Ĭ�&X���HHĚ�����������3�=�	r�8I4��Wn$��9��}����oZ,��x!��B���'m���m�ے�?=��s���o�9!k�w�>O���Ao&�7�#ϱa�r2���*k�=q�%z�[fv���I�������<{]c��٫�x��p�ࡲ���F%N>�'J���V�6*';��&baɡ�%��Ҕ�K��5�8N'�4Bǉ�~E��%��jL'�z)�>h�r�d��hʌ�����SrL&>�lPS�D�s��hf�}/�����L���j�'�{ƐFчM2��/�bw�!)�A��%��j!�4��k�w�/�"Ϧ$��Ή� !G�8���{�I��w���`$L�|]��-4��j���M�EK��BRS�{�ʁ�䙥}��R9�c�y�uޞi�n�z���=�'s����v�ͧ*�]��НO�p(����i���P�U�с�%t�RZ����`�)��Ĺq��P(��N$�܀}j�7?�x͒A�ֻMյ�[D<�#'T��i����#��������/������*��:�V@ }�ժm�Y���K�E���e�L�l�/�6����U��^�:C
�z��4f�Y�p�6��b}u�ے��xH��z$���P�ӣuSwU[���bbSP[��_t�f��?r�P����m�9G�H~��c6�5�B��r��]B\�z�0��{>Њ��	UL=���bE�Y�D��r[ ��r#3��H�N��\y�-4�쏞1���J��/�BY�����]����k�[��>�����7W4�q=|�%�Q?�[���*/¸��INl��sR��L�5�,@P:4^|V)С�VV�~��ZC4����]V7j 5�RK+�Vf�LlH�{�%�~��js�CaKuD���nu�A0�jG������t���XpgV1Cl���w�:Ҡ�1�}i���,Ibf��fv��}�t��1O��c7��hL�""��yu]j -�~ڊ3�$�Uu�L�ٕEu8���
`�>�؅y�Y�����x��ze�#1�U�=`�F�&�n��^l�\`Ҁ,ypp��]���J�΋\q��z�$���OU�#����r�[��*�^��Q���_���KUڊ�$���	Q�:��"y�v%��J�au��j%>)�����0�SWV�S�"*�ٓٿ)�Y]y3y�ů�Oy�۝�&Ca͢�H=���,(�����ephs68jV∫o�IIrc�C�X����i��$�5�J>:!8S�)=>��9p$�#�q��=$��vc���~S��M��l1���&���g�{����h�%
5_��1�3��*}��S_�c��Xr�J��Y�;�����)�kUc�2�y���R]sK��@�Hr�-�z��I�/�Z�Wɪ"<�I��{+B�wjviZFu�M9%ǡ�JK��"�QlF�gR;uz�1�9o$�85z��|?���`�H�x	Ԣ����1�<�]	Zg�?.a{b�=�ok�q���m�1�-�/?�s�+>�z_ͣ�h�4"�؊�5��(	R-��?5�"��9��%��}�֠��O\���]���&n[;�%�u-[Y_>|X|RXs�)�x,��s�'�f���:i����%.k I� ��,DL+�O"W;��mi�Q�s.��o����[�_��1\��rhrG�4Ӱ�XH��R5���E!���Wdo{;����!��*m�ҭ�����w��w1y*i�P4���a��h�<�ݣv�0B۱�����! ��0�WL�����EKU�A�y�mi��E�zI��H�FgL�XHyI	_d#)-)��J�����N��f'�-&^eۍj�M��(��+�UǪ�P W���q�B�xK���R�zW�uv�uNY������:�QN��[Ge
�z�hc%��T����k{rF�Sݘ}�q G
  x��4�'|B�[p)Y�RѳeSD�%gO5-5 �"{R�cq0f�N3�g�`�3�{\noZ9$	q�I��W�G���s<��G�'I�R90't�s�_�Ag����^��9������&$�4�_%��Z�-|������ۢ��%�0'tй�Y�1T ��.���v/� ���O�gUYx�Zt.G�U��|B����-'$g�{�qd^�)q�P�|F�V�"3qg�)5Z&�3�ԍ��f�U&B?���ٶ�&8��P4��rdL��rFϫ M5��oo*�K�sf�����o {��D#��L�l۔3*;^=ަ~������8'z�'F6
q�eY�:���qI�涬K��ZK.�����]�����ݲ��py���g\������	8�M:@´�+���2Ͷ�p�+�9�V�j�lX�A��Vc��8����HI���I���-���
��&��F��%�jo�I��t�2	4T9�.�+�y�3�O=�b�O�ea�lX�@����η����!i:
��s��Gݘ���G&E�J$�<yF�F���I�Q�1���$��m�X |l�+U!z㾡�G �?W�dْ�$O'0^Yr���M���P�sol���~H��.�� 2l�l���X�ʪo圞�����✡�ҿd�A�g
��h�K���$q:aM��gt��I�<�h����h�$+VU� �#R}��i���HJKG�j��&��1���nTY@&I�͑tM���D`h[�9����r,��"2Ûס<&s���l���f��NoR��֩[G���U��-�5�
 iW�=JZ{]n�6�J�aR4y�̍�O?!wb�'v�D���2�|�zնR�x�=	���C.'�:T��Y�����$�,m+a�����:K���h��,s7�)҉%�B�����}�k�eأ[���������rb\�ZrP�Ո˿����_>��򧫗����!&�����u�o�H�HĬ�'��WQ:�����(q;B��)ƙ:��>0$�)�u�+j&��F�� �Zk���3}G���I�Z��nH�t�䁰����4�d-�sj���c�����M��X�IDWnȬ��MX���ڐ\	,��']�kVW�$:$,C�$�$�b�m
S[�dA^�$�tt��B������Оd��@϶Iwh��ޭ#Ī��m�����'�Fh�YR*�b����Hj?9B<!탭5��Q�G�<��x�^k����fs�ȖzE,���+���J�k�u-k�Z�L���Y-�w����u�tBۑt���N�\:�j��
<?y�O�"�[kS�(�=��G�`T���E�$o�eG�c�ّ�b�&m���,�#Y(k�SJ\��m8{}V�r@݃v$?H�t���>[�i��['iN5�uG��Bv�'���C�pD��1�	�)莜P�aMI�0�+W�e}P�x�qB-��g��~��f\;>�L��T�6��`�z��	��J���ShC�	�]Z�g�B ?��:��V�N�x������[���^�Q�/o�Å򕁟g	Q]vS�vK�OW�/�j��ɧ�6�-LH�l�m	��T�Ya�M�kK3jd��mKb�	�I�Z��)+����"GZ~RR��K��TCqig��rv�z���p�.�U�ײ��ES,$A⺝_����z���9�����C�{H��7h
����
�G�*��Rti��lx3�U5KɵA� ��ڜ�LT�mi�l�$�*G��<>��ݛ��P��+�g�~`;�|�t�-u���O��v�	��������H	����k�ٯC��Y�ߒ�kI1��A��?M�#�B{۞�=�g�ٞ���<�:��)r�=Q�ڧ���DW�N�%1������Ê�O�ݿ����'��m��=!z��-$��S-)�v��y;�Dt�%ENU�o0��H�0hgZ�8������d�q�m����&�%�7JbaA��Y���
& ,�im����T}�z��eOb;!������O��y���P��fG�A�����՘�Ν��)�3��}�Φ��v�xz�`�D�����-f�	y|j�B3����*�j����H�ޅ>.A���)k!X�'U=�J[��)3�,c�	E��F������U������-�)������%�L6m���uԥ�ţBPs�Y���b�L����v'�ܝ�֪�;�fK�w���	զS��
M��n�j'�(3��IL2�m�'�CTaZ[�!L�9�V6&	k�6��f�Cw�ܤ���6N/%��5�05��͊�B��>����"[�!�O:�4��mQN�"�E-C���D��k�cB��=D����U��mQ�h'hn�oq®�;V>L�b� �"���Fn�8M��65cޝ������'�=@�;�Lc͠s��*Z[�.�#R�o ��~B�7&ְ0���|�\��9!ӭ��-��ާtУ��������7��%�zͰg��=�]�OLы\��D���˺�������Kve?(/?.ݜ��o.痶�8�]�4�CeB�:�ⰫsFS�'�ƌ1�=.F�2���%�1�,�4�R���&�Ĩ��D���.���p_����W_��*�c�      k      x�Ž͎4Iv��|�\I�0r3s73�W����vk1�BDwU/���bA�Bu5�=Gf�e�<��L�a~#N�8	��yVuW��f���=7�B
�2M��#�v?��_��p
��_�e^N���������_��R�����_�_�~����=�����?>�������_����翞��_��7���/�׿���������Ͽ�ͯ��j?�e�o��_����]�~�w���������}���T����_�������������������~��ߴ���~�_~�7�߿��qy�0s���1ą��v� �܀����/�z���7/�������p��7�q6���c������	�<��;��<� ��X�1p�B��:="�85���!fb�.�"g�k!��"��u�S�A\q���)����;^����Ǽ�������/c:�9�y�����:����Ծ��h����9�s~�����_���a���´�9�ѿ�,OK�kۿw�v�ײ�en���Yo�J��e��LM1�ӻ�2-�������w�߽��ꁵ�.�,�ۚ9u&x�}������cp����;-�x���]��:��L.�plw{t@�������/�{���7����~���߾��_��_��C�i'pE�۟�Н��5����np� �-�����zŦ,� u�^�)�|D�!qE� "E.Z���� RNߔE���x��\ 2eQXl!ǜq� ��b䠹iʢH�B<~�?#m�RO��J-9.o�V}������흤WG->����{G��8j1?����������O����Ş5�i�QO���T�W��=�G�)���]��]I�W���Ή�7�ʼ�b-��C�����o�m�̓Z�N��CHs)�(|��y�8�9��5 ��2��?=:�h���/���|�m��/��۫8��0�8�Mm���y�2�rz��9 \�Y��#Z��,"'����9�E��[���2ʇ/�ȅG^>ʅ/�ȃ��e��o
����w�~ ݸ�6�{�)���5��QYD��(�ʬ��!��8$���0l+ˈ��ye"g!���N1�����)�Ê\HUj:oʚ�2��c����O9����
Qz
�)�%���>B9��	��SXR^�y�����1�TM�h�R-�{�h����)�9!S)Z�6
�%'7O�����R�A��c*E���ѡ��Y˥Kٛ�J(c-ƒqi������3��N����Y	h#��X�*�a��db�2֢�t ͕�U��"U�ZT���>re�E��HHU�ZT�+E4`� ����V�E��@�"�귨���ȵ�-�����Nlν.��qg�V�E�Cw�~�<}m�3�א�z�J���Wa[O5ǥ��������W_ץ�q~����޳5������$�����p���� �%��)Z�R��¢�������
���&Gj>�tw6��8A]�l�Οլ�F��)�ZT>����U��!�Ԣ��zN wʪ����3���U5��ze}
���!����R�u����r<�	�/�%����dRz�z�;��1B�C�0(kf ����+�N��m%*��It�-Ba�N� ��/BŰ�$�!��#�N���"t�Z'Qth
�u9K�>5>�y3��k��/��頳6��rz/��p�9J�� �e҃j8�Bt�)*�Tá�c��LzP�B�LzP���X���P�.r��PU!F�N��������CU�):aitDO(t��]�h¨���r
k�e~����`��:��Q_��{E/�Y{��1���E�A���7j�����Щ�R>aTEO�)S�]TEOB�m���	8e.����h����FU��2���FU�d:���IV@2��.���)�Ӝ�9�ez�����4�)ϱ,��1M1��>T%����7D�w�ǵ!�~i
�N>��+�9�4��7�ph��D5�	��Vt:������rQ�Ω=%�v�Q{���?u	v��ZvN��� t*��
�AȤ�6�8 b?�� � �w� E�y@�E���x�u�x{��Sfĸ	SI �5d܄iX�$�"�v�L5y����Nt˹5���Bt�Ȅ�(� 29�Q�@̈́>�(�1gg�Io�I�X��TK�8¥HN�?�ܤ.���E&�� �x����oG<�NʊJ�4�C^���4�u�NOitF�.��P]	��ŃH�����ќ]�G�.�F����6E���*��c>�~:h��i��=�Tm��u������✹�j�D��(�T[�%ʪ��D��9*�ǈsA���AH��>-�r>��M�67�!ɚ�r����BrO��E!`��#Y�@��yG�-����C�O�n3��t¼�j\��k���������i��nRL����)�1�W��ǀu
��͟�3���)`;+���g��'V�~�ޝ����ǁ�cl��̮�V����XX="�{��/����1�����.�S^�����~��=[��/���#Mק�`�$��)��TJ^c��?���}�c�9�3QG�o��/��{�r]���;�ф�?��/�|y��������W~�\MD0���t�v�]�t;j�1\�&>���6{�������m;�ԥ�PÂB��)�N���f���������O/��>~z�����˷׮Դ�xׂ�;p�+� y �M�Bt]W�t��zI�����AE�y%2����o�7x�������' ���~����/�~i�m夹���c7��wU�q#	���&�?_AY���yM��"
���;�I^��^�^�ȵ�ƅ��|��B��{:
�:��;琮�jt�8]L=D䊚T�H����^��v|�Ō��w���/zY�� BҴk����5�}��Xw��?�!����������̿�l5�!�~����;wS���?���5�o�f�i�q<<t�s�*ڃ�9ǆ�N��{<���0�.]<�;�"ҴM�Aڷ�CQ\}Q���'a!g�8N�+�D�镒��g����v\)-?�����e��/�y����I1���Ǩ�w��&kto�T�k$B������DOy<�����*^��H���(Ԉ^[z0/7�>�����F�<^��C����¨0zR��hDۙ���Nշ��X���;�8!_'��/މscË�VqO�T��J_��#r�Ȍ��4D�}E���{69�~{X'��v"ǿ(&�@�CĬ�iq|���a"�3^���7�"GnF����Q"��:�,�g:��l����;#�9U+�sJB�O ZG��<A��N�̯�ƍ+e�X��2�l��T��
٤+E��l:���$;{􀗨O�BZ4���7�3��l���G�!?)^y4G�z��G7���a����v�#�`����/hrh&�|ض��"=T�Tp\�V*8(T*�����X��~Q&�R"=F���c��?hՇ��q,?.v�J���p,0F�����(sC�b���53������#��@U��J���N��`���;��zr���J�J��>d�[�м��C�~e(k\W�V�+��K(cP�#Ს�q�7���z���C/�t J(��O�tD�>�8���}社h0�z���gZ������F�u�\�F��qK o��E.׉�ڑ-%�Ҭ;ӕ=LĬ�s���$����LW\8`�.��xȅd���4���:\�#lR��B=J{+)�t�ќ4(m�A:��7<��J!R��Wf�Ǎ>�#.Q?=��\��q���;�u]=t,#���-ɂ�PE��D�����q��L�ZTy�VR��4��ƵBT����w��^E�'^s;���k�S�N�T���<�,󝶝����/�Ʌ}]���`9�:n��`�E�DB��Q�1蒳��`�	0QD�D18��"$@a�����<M�2DqzU�2�&�eE�{R)����@�S��/�����?����wW��ه�2w$HŴ���9眹:F������Ҁ�m煝D%���ԽJ���    ���)�����)n�VsYj�o��iy>oM�W��?����ψ�Tb��2�����47?���r��4}���l�J���E�D"QdP�z�.�8U�}PN�g{��+�A(�gե}`j�AM�!e懂b��h����K! 7��g̭t�=D�R��ό�#�4{ Ӑ�'�2�&��N��jT:z�-����2)b�����T��Tlmܙc�~$���X,�FB� ���`��AE,f<7缩�;��(���+�KDeY����u��-���쾧�B��g:nx�S[�ٴ�Vx3r�c�ա���g��"q�3�WLSBP���F�1�:<���ҫ���0qk^�c�T�?���b����]]��]AEۅx�kW�2�Q:0�� �ZTp�erH�]��A�ɰCD�at%�����$��T�vk�S)efX���	2�L2���B���{9f��ح�S�`AE1ftݝ�粲j�!�.Q5���A���
RnK �q@���CX	��� 0r�y�4F%;�c����dmHt�"k3z�ar1�*���V���!$����ᠡ�T���	r�􇡮V��r���9T�r���3*&4"������jnj�&H[�� ��5��D��5�$Q�3?�Р���j�*���|ML�z�����q Ce+0�9�4R�ɔ21z]�\JSE���(6����1!��M(���.����������:,�f>���*�	.ȿP_q	㸤��,�9:T<̿X�Ω�t�d�``ȵ�T�@4����8�������v,�fT�KF�R��`7�k<9B��͠B��Z��t)�H�l>XI���eP�Cv�uM�w_K��c�Q�W'HJ��T��P}��y^�-�C5С�����YK����MTH�:�\JZ����{��ٹ��w��P5�ܵ��n�3����'v�]z�X��<�	[�,�&�o�{��S�7�C���iY�T,u�&�,�Hɂ�!x�?ޚ܏�����f(������.N����3SAz���ܼ�0��z
��5.��׹��C��y�e��Lˤ)m|m���Ks\Ls�:}��?m���ﾼ|��ǫ�}#}��:�/�+���g~�`8 v�4zл�\+�l���������V��O��<�z �&7i;�h>����ɳ�u@���@����u,�&�9�n<��T��#�:�#7���J�ꏵ��g��GLӎ�8�}>:|M6� �@��n^��Hy�9�[�Д\8 ���y�)i:��{.AU[��������y=�H�&����:����S���>:��Jpt�i�����\�Ҽ~J�q��ʃ{�͊���E���`��`�٩BQn�2�I���7u>S�1��N��3�0 s�N�r�-K�l�EZ�_����"	3J�n��j�[^z���|
1-_�u�>�i�S��^���ׄt�S��,�3��V�x6�����o����w\�1d�8���ٍ��Kl��q1�g�� .# :3�=*1?b�ha�!vF�XG@��� ����{��ĔAt&hz6bx���ub|�9u�C^���8�uAwb��.N�������).���,q���c=�󼞚�Ӓ�z��Ԇ0�7o$]�	���i������_�-���o����z=��;���<�d{��8С�f�V��g��y<{FoD~���/��k��ut�$2�9侽��$
���P����߶��ݻk�R]�� �t�'�]*�p�!*�Hv	��0�H��]��9BE�r�T��,]��0�I��v�U�b�d�Oe�&�I�kr0D*�I�wP�a̢b�dy���$KB���8�B��-T�,��h���<.��q����E�,�!��3~ҷ�_C~���ĩ�Xpz�����i���^#��_VʽƋ1.����o������o|�e9v��o��VK~I�`��	��Pm�/��v�N�,�!����-r���vh�]u���=Tw�A���f�� TnW�2b�5�YƬ.kz$ڸm����b�<廡\'~g�%�<Eˎ�<��������k=�p�Z��;7�r�?���2n�P�.���;�ڛ9�� ��2jvI�$�K=V�.E������4JKpe�M���Q�U�F���H��IS�p�I� Nh�?�mϺxʵ`�5�a�G�+;8��$��K�N�M�։!"i0�0eb)B�*�����fE5�)���2�)�6��)�/��zp��_"'�C4��xi@3Hc�<'5B�7So�)2��`'1j����ݞ5,J�0Y�������,�o�P�=�����-�d��=�M�5Ta�v�0T���㈊��T�t}Z�4(��3l�TC�a���)�
�*��'j�f;s-���t3��^��R.�k��OΎ��`�*u�9��D�ղ{��$Va��P���P`J��0m�]������֌Z!��FC�˱���d�Ѱ$:~�A�
��;T�snmH���0�\�F3/{١1�:���J%�l����"�CB�؆!G빲�h��E:�S"f�<TK)tː�砗i
;p\sDlTu����^.(�s��= y{ ��H\�@�����*0o�+�Xz����|Gm�mj4���Q#�@>�ӅY�t�a���V>�ӗ����� �ѿ�N{`?�o#,��J��(_��f��A}��f��+,.�2@�h�*cEt=w��cf�E{ӏߟG��TAv�%�"��Q���	�B̢�&��W��j�fl����nɸ����2�=�y�z�Mȉ>M�:�̢�xx+��b����7��V�YL���S���'j�d�����Bm����%���&殓�ڄj�~�r�QY�0��p�"�>�����	��7W�R��N�ֺ�G��^}p��r��re�el�:�����&��S=>����ex����sU�8���5Lq��h�RW7��y��P��U�"�tI����4`������o�u�&�@6��k�!�#[1���C�]�yw�Q�X�)Ҁq/�o���α=B�4!�9���7��4rߵ�����P����F(Wъ�����L��1������-tp��0�'��0�����.Ժ�f �w�9���!0��E��]�.Wv�g�u�$E�50�����S����=+�!%�/&�I�l����6��O/֧XN�T�L��޿��O1�T���J�|4��sK�{��c�:��E�мRK���RA�h^�� ���r����Y!��)�ma�S����OG79ż��"��2�@��lg_u79�y�{V8 �E����Bt���E�e���3F)"�3V�/�K�V���6�r�[���٨�"��&���)�'��"��ul�%PqQ{#��{ܣIP��H�j}p?���梮���5���G�^�</Ki���ײ=�a�--|{��0�iy�c��A<_]��;gM���sɡ(�hh��a�7[L�����p���D�	�WG�.�щK��r�q�����������
*r�fH��gDI�g�TXSG� =*:�U�x,F���hȳ4�p��c_�B.ᬩ�X=��Va�|�s�S��w��4[��L��F�;$���)<@�uG.���?n	���_���WO{���θ@��ކ�j��(S�B4|3"�&o?�?�[�!�6��j�m4c�*�(��fRZt΋�f�B�,J�@�̅�f�S#�����(J��E�o�rD�9+�i�����ٛ���S�sVm�3��E{��[�Edte#&CQ.�����G��K�:�1!��}HTE�u�$����o퀄8"w�Y��#�B��Gf���`�
M���>}.lQ�k�Ȓ��c��~��ܔT%����6JZǩ#q�l�l;="����ٓ!g�g}H�'to(�+#��c/�e�ezJ�iY�s�������A�J�F٧]YkY�l�t�|��M������&U��(�&&Uư��8�z0t���)�S�e�JS�����~��is�ґ�吗5��]��{d�=��=�zr����O[��ﾼ|{�n�-E    �\�֞�H�$h&5�Х��$/[z�� �+�mGs?����#��Fc��1��te��D�N�C?��H��upF�H<-�t >�Ɯ��
�5�$!r֋*1b�i+���te��Hy��n���ӼמK�iQ�Gn�W,MW��<�%\�����(��Ŋ ���m��s���*�d�V̱k��I��m{~%H��d���CCKEviQ%ˀW��ӕEQ#-�,����* �+knF��-�l�	�����L�н��gUm����sNg>z��cGDBp����88���!������<���9�(��PObє`� KF'���R�#\��0�p���&�v��o���Qm�M�9N�:�����k ��2ĳp�+�g��,���Gk��)�S�1��ؽ��Tô�r
eJS
堈U���צּUDd��#}/�;�Ef�0Ae����l��P.���`E�X���v!$W{1�9�O�MPa3؎3IL���a�o7;��߿4e���4)�v�m�۬n��{YV �$�JCVa@l@i(W��6�ѹ��YD�1���ef^�\�" >�np:9&�^D�_ABo���|�����<����d_��M���Ru؀�DE^\B�L�U�UV�	2ax�L�z��`
�YXA�+�G����U� �UDɫ(�A 2%���Hk��F^EU��I�3�c^E)JH�L�7���T5�� =�R�YE��B*���N�{]�ķˣ!��>+	xTV2[w=V�ș>��b� B��I��4�e��@��0�]X@F�	�F�eNw��-*�C�>~0�[�SJ�8���q�}���S�a	<ߦxD��4��=�k��	�y���,�̸��x{�ȸYRz�4�fg"G]Tu5���bL���&������%+���fᢪGZ�ND�8��H~G*� U�UuS䬩tQQ�M-Bav������iä7JQ%�L�V�*{� d� JQeM����� 2d20��� B*S���������뿢�a��D��xS�{HY�:�Mq�YTŸyS��n�!o�#C�bV�G�Ï���S�Oq]���m��-�^[��b--/oG,�!}�kL;� �o|��6����iZ���E�|�Уϧ�W&�����jq��%���y��^�.���z�UmD#z��r�'4u ��6V>�6��c�6��b�!�0DH��;��ͩ%g�m9�/ܹ���+Y<����1��PC6���O��;ky�mE�j���M���� ��,����ȍ����.��"71S���J�rU�O��`%Gg9��hVT�Z!�8������8�z�j���j��Q��=�<�E͐<GD�ޜ.7J�j���'�l��,D%�oR�EY�Nr�|ɇ�C�<l��v^YwM�"���j3�!�3�����k�M��A����Sf2�2�G�L�G's�SZN��%�m2����1oS�[�8�x��|]K*o)�4�����uE��7����N�8���ZtN����JA0�i�cc�4����#9b7M�Ȝ�*0�,,�4�";j :�*�� ��G"�$jE1�=h'e@�EQ�Ad\�Q�@�d
DQ�c!
vDQ�c!
��q�G�5�0�b
��@t�i(�*'qm�X�A�8�-T$� �x\�H�:��E���A�8��h,,O)��渜�~�h�Xӡbi��:��()����e������2w�u��i׷�
����q�U�f�Q6�U��à�쉰��Ou��1^g���-��WBo!tS�	;�D���'ّh�����߈��$�l�PGKz��%,���������h���I��m�(������E��3D�����Њ����S�
F'���MM4�����r����?������@���z�������
����#�v�;�tV�7�	/���0�]�c����f�$M�,B���.& p�\8oq��8��,�š���?�	E��f�9��@�N\�f��YPI�v�Y~�_鋐�4���V&��i�Y� {m@����(��N�v;��v��.}:r;U��pF������v�U΋S��ry��Cc'���l�hǬʣ�cv��LI�A�ur��s���h�(l�kG��N�,iXAJ���K7#Q���5بBz������1D�>� ��ĽEKL�~���bB,h?����)�S�ii���?ΛN�Z�Ӷ��,y=M������5��^��Y3LZ����d�DӠs��{�	XԡHXx���l��
lι2�blE�ܾr�9�����@p�*D�	!!$p	��+ٖ�82�ێ&�}E�B�bV%2@g=ź�5�f��\Q;C��GL��fx+bj�|�;� �Ô�U	�"r�CT�D��&	ӆ$���8�����=T�- SM��s֌�]�� @�Ψ�*֕vR�8TY��I�S�8TI�P�U�Ui �r�8TI +B��qV� E�v��Zם˝l6���w2��6��^�?��7/8]�9\�ͳ�ˢ������a֊O:�M�vp���y���0��N��
�Lۖ�V'WۣCn`��@�0M�&�#�j増�G���C�Q���)������?�F��COPr*���ப��jV�8�ٌ���h��i�g�@U�F#2������>9�HϐS�z��j0�!c��j.� t�S�谪�����
&����h�� ����!c�W�H4$CFQV�H4$���5<���XS���Gx�>�XC����-b��@5����^y��'�Le���L���l��b� *v5(��{p��g����3jL�����.�S��31�%��Hs�)�Sf?T���� ᩢ�=>oA$CDUg
�դ�)�ӰFE�r��N����;*���p�s�D\���t�<S�kTU��Q;!�GUu	9d*Ў�򒑡p��FUy	AH=uIUw Lū^�*qn�Ri�?�Q�1��F8�4��!N�34������#�o�!>��qī�e��G%y��[k��9m��F<{ʝ�5y��Be��Ϟ7���RSy�RPӼ�5�?���)����է��OJ�v5��V� �Q�8!�l�g���8j��3� &`�� �Xb�>^'cALW��0��C�+l�����l(���L�eB���`����<��aT���ȫ����?"�g���f��V9�Md�U�kX��1U�S�����k��Ip��&*�#��6"�w��.*jsTwP��4����2��
**#�d��2�^H��)T�VB2��)T셐�l��wy��l����!�m���A�T���
BHY�E3�b]W�g�I��pA"��k3�"�7V�4��(�l��k9�Z3`�h�$�!n��'ԓ��5-�Ky��)��ö���#�S�S�S�Z	��,�h��R��[�6,���m��?x�F"S�jy�A脋���lb%�ӥB��
:ˬ��%�MvA,;/�B�jC�r���Qq��96Ħ�A�U8x����J;l��i:/'�8kE/���h��6��,!��@�(
i-D�ՌZ��'QLk!:�Ԋ�<��ZD]��@�(�j�����fEa��(܃� ��ZQy7�#�0o8�.a�����È�%9�½.a���	Ͷ�g���x�kX���>��b�JM9o��<Ͽ��ĺN�.�1/�}N:X�4��gfȎ���j ���mߠ�V�Pa��<V����S���9�I�q�L0)��atڃh9�<A�X���)y"a��	�a���
�fA�����@�����\�Y&��)��qe�=��!!��8mU�����3�G�g4tG.ߟa��ԫ��3RU�^p��j��J�Iup��j��Bt�t.vS\A���j��B�&�T#W�e$F��+�9�����%dNK5��ۥA�J;%h�.������i���(�i�Z��C�T���3_�U+*�P�!��Q����~�9<����k��N�)���t����)���SG�)�*		��#� t�԰cQq�e}�'�������*�0�P��ժ���!�BPU���)s3�UE;	�    ���*�I�	���*�I�bs��uț"tAj}����!o�s?ʙ8=�s�(�R�m�����h�9�����	Nˎ,�p�tWu�[:�C��S���p�Z�v!��&ar4S!��F�(�A��$��:��ɶ]��URr�G�[G���
�Pľ0tz�C>w���qJ��d���tz��a樝�8ʵ���.#G�'[�e���Y_����PI�'[Ʌ�C*����BdH9���\�=���d˚���)�ʶ:?`m��V�i^Na5�-nx�(�uY�F�>�9��L��j��2�wBG�\ֹAEC�
.��{̠s2]T��2	::,:]D�N{��E�N[�fl:�$U5Z�XQ�>�T��m"�sퟟ����vc�y�ݗ�����s�����u`�۳�����������L0=L�������������roD�qP׺Aw�Aj�?��;�;������̻���Gξ�������5�����)�(Zd���d?L�:��.����^�>l���&|D��>���>���E��ٛ1�ǁ�r�E-���.tQ��@���N���ii�|���'���h~�2�`1j}�({�m�j��w5�D���w`��D�^
�7~�x���tގ3��A 3�Ɗ��w5�>"��j~u1=͂�G�`g/���N/5ͳXf'U�ej� �
{���eq���g��i �� *�AR�`_[�Os>�b����ύ�!�������S��_~m�OS��8�T1�0/;B����,���\�����o�S�;v-8'A�T|.�-�g|-�ch�i������-\V��pNi���n���`��$H^w҂	{l��B٧Np�5�VpN�aY����En��w*�2����#ϸ���&�t UD��:��X���b���q�U��d�>���]�Z�(��C �@uU���\1��!T-J0��ԥ�!T-J0� �'�S}'�/be�K��MP�yC�x'M}3`{��4U(ir�����&����׀�U��W��0o��ee::�#�^���a���%�L�8F}M�`u҃Pq����[�L=�Q_�LVK�9µtx尌u�p�k��ԩ��T���X��V_F��>���.�s5�\���h�sܔW$[m�1�x��)!t5re[،+tOE��i~��)�i�S��?���}Jk^֒��f��Ӻ���jCR��>56SlW�w�?����O��]�$iv����YPP/A�H�����)6�$��f�>H��Z���Ƌ#�.A0]f/�sn�2	�*<��z������m2V��a�`ش�lU�헒c�.�.+�{�'=DO'R���K��B�0C�]T=0���4��p�Nr@�9N���A�#�.QK��$�.Q�w*+��U|����E	U�2r���p�����9g�e+/Lr@�Į�v^ �?���v5 ���+�]H��4�#^/�˙nٮD��]��j :n���"��`��ӗ��ݲ]D�t�v5 %&�t�v5 =K�M���z:����?�����?��7�ӏ*n�ِ>9�������O�zZSHqz�#��B��_1՚������'Jf�
�N@������q�5Yd<B���PC}Z6V޵,k��S�kY׍�7Υ�g��i������4�y�)��~��3�ڭ����`�B��'c"I-3�P\@�&A���&�;��\�LW%�g�J�LI0VcС�n�"��qgMe��$A��ItO�&N��Q��j���$(��N�>Q�B� ��u"���T=|�P��I��<�\"bR��Y��s��!�2N��DĤj�� �vQ�q��JDL��(Q��mRu!����Tt��]�`""OOy��괜so����G�u1���Ufk����jv�*��G���� �����<�Tq.d��2��!e�CQY-"e�CQY-"e�BQY-�.r�\(*�x�[uK�J��|b#E���'F�3�e��"�C�jw��x�)����Z^j!:��G���i	�8����Z��1�~�B�S�e+$�Njx�u��!Aj�w߸�d�����f;��o�������_I|��t�|}v8&A�������G'H�t����E�m5�t����Dd��&��n���N�=8e�{V-㵦Ƒ��]���BT�>٬�il�NެZlxl��N�|����N�=Rt1�țe�F��0��Um���"��#F�Kd�bc��@�RY���"��U���H�k3�D�lulc�U��/��Qh*:��/B�g�A|�����:䝆i�!�C�?�=�8���JS��^��N�C޿{�z�#�?���|\Lk��q������	q���)A��i��ť����׏�!z�凍��(�Wۣ�w��Ŭ�e�B�Z.n�;+���{���P��� ���L��L�^#@2��� �<9��U>'�!
���9�e�t[V��"�m���9�e�t����J�)�q�c�H��F�|N�q�9�N�AA䌎��:菺K�iI��jZ7w��#�~�b�1�g_i9���<�R޼�8Oz����rJkm���Ĵ
jk�����D5pZ
�m�3Z>e�_2؄#5q���B��Mk�����0{V�|H�B�4��+2�W���<�'DP�_��K�V������M��8ӢsdGS�Uy���1@���7���b�-��;��L��䩧�G���Ό�����Ti��SO��ȓY�g������DvM�zvwD���c��_s����eC�<���5���
�R]�Zs=�Do�(�C�!*��$���G����0�C��^P�d�ڑO�!Oju�ULx�<��X�ULx��N��ڑ���#'c�OIs�y2�~�2���s�s�oD���[Ƭ֧�!��u�v���֩,9�ӎ�h_g,ۚ��قEa�in��ق�((�t\����.�=Kt{p��]ba���b}�N8k�� >[�߃��C�Yߟ5ؔ�yVt2���{j�;�*(2�Z�U=јA�F�y0$R#�45򰨪��Ӑ�u{.G9�;FRx8�yXTuY�6�3��.k :iD�/5�B`DiȡY��k��u� �YFY���חu� �~}Y׏q��N΂˺~��Y��C�Fg����C^�{VT���.N�1ʺ~�A+ۻ��7�Bt&p8ӭ�A��G�V�ީ��,�0/�L��ȧ�3�ĔBNkt[��<�}"h1��/��<�i?�߶�z-�_�L��^�q���z!\�f|��0�S(�!"��y�0��s�+L&m����c2i�y�Y��=:�='�1��y��N���|�E��|��x#Y癣�X�UMVU3C���y��:&'_տ����?�"C��ij�zQQ\�N:��=�r���bƼ�s����ԎzR�֧�"zRD�`���REqt�Pg1N�@[x ��j4HI��tƢ@̞�rrnQ�RY���/��YT�T�.:7��YT�OV�ʽp��O�@t������#!͍����^;א�7�eB�e�N�s^U|Y#��44��9cοVQz]��1D�M�`;�L�<C]3��;��.���@]�%���y;����Ӛ�Z�3�_��4״�ө�9��r��{jtY����*Mf���F�dH��9(:ՓY�zǝ14�^��P�6�������	�a�Q��ێv}����W���/��m��
ĥ|�>vIF���/���-�gs���bN1��~�K��}���^F��'�'�⢴R ;#'���əw
t1����j;cQ� ������8+4���4;��"�1^�|EN������T:u0؟��h�����[a���������W���z{�iOfNSi���d����@+D�.��K���0)�� � y�H�Nfj�$�4Io"�E��@�E��3��偡��r��&�G
�vџvtS�D,���z�4;���h~D�p0)U�ɱB=D̳4o���|�p�z/GԄw�=�*��������G��Y��2B�rE����Hk#�w�u�dӼ�_��Y��ٰ�P_�������k��$�#2@0�9���bs��a�x@t�Äې�=H{���\lY��r�ے�    3��/�޿����"��l]6����C=�E��
A��7�1�,������S��,5M�����T����R�7
���B���ޫuy G�
�S�y�Tp��ܠs��DW~������B"�&�E,N�I�� �8ݢϘ����6���Ե�
�9�C�B"Zf���`�7�
���������#�*�^qsO��/���\/r�+�# B;t��hO۫vP�)*`��+`S�5|�0��5GQ���L�b�=��ݪ��6�:�'��at�r��5�r��D�=lO�L)�:HaB���~�O����N���o���씈�
��_L��ɔ�� �i���h�sO�y�A��3Hڜ.d���� iklH���*^�����q��qk���?�k!�����e�L�����P��i� !br��:ox�߅]��,��BJ[Ѳ�ς&v�]����.�s�7�A�}ɫ���Bǭi� ��w�
��-@�}�T��
�E=�01]۵kuGـ�E� ���bG�X<�e$S󀮩������-NC�;n}�Gy��^�� ��.�� Bb��= ���v�40�6~Q������t�q�w�g~q���||���6��deA�e���g�`��Y�Ӳ���
�=A�q`�����〴.L�>�A^{6Y)qd����joS��P�; ���{���:`̀:��$�������+�	��o�qfE���jK������y��������%vʵ����XD�ï�9�o���S�}��Q�s��tQ��-`�^F���(�h�Z�#U�#EOaZ!N�OAh�~����mTΐ���^\R���z)��5{��om��BU:�%	����;%_nȨ�2�V�2
�C��P)�uQ����f`j�$�K�8���Wg��MQ������4�V�Z��3t-�u!�%b
��E4��W(!t-5����2Į��\3���S5���g�S�5��i��� �R����&�ܑ�f���w<X`s�R��7�d�yX��0�`ѲA�h3��Љ�����Q9f+G�(�׶�=�L/~�x��<H��v�(W�W�y9Ƀ�\X���e�(sAd2��h����N�a`N!j{)҄�W��<���:�i���[9�%��<��2Ou*�n\�b���Em��)��5�E�{�^�������ۻ7k�:5����j��<k�i��U0�l����Nc'G=����g�-�7�&ST9#�f3!?�
��n%9�s���%@3s�R:tB����������� v�ڛ�b�����=Rk ��K�fWu���i��� K��ğL'LѢ'�	O ����F�56�I���޴������G�66D؝�*b�K B��`�渃Ӑu0����9X� B��艎Xg��[)O_OD�G��1'�"�������!�<�T�m?�_����ѭ3NE��*)v��ga���`}��bP�3}i��Z�ANpi@���?�;K�(�b��z)E��nGxeN��zW�>��QK���p���$c	S� >��ê���`Ł������9��r<�Zb(i�}��5��S(y)5���-ݾO��qMˮ�w��g���w�c+��$>C�y����J��)!I"o: ��j��u�Pο��e�ڝ�������m�Nl�w�¶h�e8J�I������X�)�=V�w�Dn����e��0�)j��^��FQ���TC)2�u�g�����7ktٽp��t��8�R�Q����+\GP���p,9�ST�~z�L[PT�V,{՟� v�ۧM9g��̛����	���X&i��mC�0){��֎&g3{��Gh57��X�ozX���"��)A,�ڟ�g�㿐�>6�q�
���W�.�|,�q/̱љs��cDg(@L����ymH�i@t/C��96:s���Ҁ	S5O�!�w�ikqڜ#�s�J�:�!��T�Z�4?�P����s���y�y���-�i�f��q^d����`��K�6NE1�7�?݆�4eA�{t^E�������]�{ph%�������ރu��L���nъΙ����5�M�k���f:U���[ �mSQ�؍�j �m�^��6�)�N�Qf��� ���[C�:jHU�o�0�n��Q#P,��5�j�3�}���"4��^=�ЙO`���Y�@tΙI4��v�=D'������)5?���Đj���G��ߧeJK\����r�*c�e�;g��oB�,�6�׬W�G��s�p���'u�gAc���P�p�ïw�tl/:Aۛ�	r�f��d��i��\�Y�|�!:;{HWxt����E"ڱ����9c�^T���K����a �Ѣr7��8N�-�� ��9NEq4-�#E�q��J`):�Ѫ�����д�x��{&�z�#�>o��͛���	è�x�8�u�����b��37�C�8�1�U�#^�ts�oS��v4�#^��).�t���)/�P²�u�}�S]�Z��5���|��a����AR����&_��~�'N�h��Q�mN1�i�6��� )Xt�z^�T�8�f�v���u�^DGpL~%\��C��ɩJ� � �m��E�Da�"��0�~T�)��x�kBU�$j!
�,AVh���#E&�d�;ё"LY��@t2U��Q���J�Y��*�#D�O�{Jv?�3�U�X):�L��A�B;�,T��A�:I�3�i�xi��@�8�i�"��*>UH��s|ʹEЩ,�o�~l���o�R%Ls^׺���D�Gݞ�G�,��&�x-�K�Ǘ�=A=�#��������HR�}�hFi�%<�(��WԐ��FgO� gUo搅���!@�B�Zgs���[�]C��~��j{Q�M�RUxq�r���aW6z��DhF�Dz�P�AL�%�$@��BH�RUǨ"k4��2Ut�f4\r�3��Bh!tȪ|ol�RU�h&�%g����Y�"�CD�o�eO����q�X.�3�޿�*h�i.�-���
 $����@����^'������)�Sl���n������>SIK܆^s���{�q���PS̻V�jMv[8��i���F���)��\���у�L6(�T�/*$T�ܹ�{�����o���1�� �Z�H���H0��	1�6��(LOr)��^Q��%���GYY��Ơ#��;%Ew���]���}^�v�V���/�В��|J��Z����cRU�-Dg�	�c�l��Nۡ�T3��4��s���*�[��N�v�z;��)�ߤ�!��t�E(&�4��'Ee����<��U���?��ޥk9�X�5�����71��2 7�j�jG���C��|4E$�q�&�k�L/����q�&U�����󪹡����lǥ��z���8�L��؎��p���W��(����j�j)3� s�I�I�"�p�|�>%��1�&�Za�pRԪɴ�?N��îZ֋$o>\!)O�<DK0�V�a��O�)��5���_�~���0m�����2
$_gN�_j��$!�A'�3+�`Ӏ�xT��b)ti3�'0�X��35�ЁGdn��"�`�����2��s����Њ�:�@���2�%Dnx�̢��BtZ��驢"����fDQ�i!:^5�TT�XDj6��h��;�s�lRQ�b�)�-�[���ǟ�y����+F;�.�T�h���lct���b� r�����Bt�t��� )~0
���Nqi���6���9˼Mq��6N��cY�`�e���*�9��������d7�7���.��6uX�II+�@��}V���a�g������v�=+�n�a��n X�lU�U�m `�X�;����J�׬�>#X�BJ��S�-����)�VYCX?���::���na�R;���nae�K��$���s�`�tk@���ҭ�]V���5�`����>V���J�`���/-.��m���p��c��0�)�S�s-珷"a�u�E���D�ZK�|S\t<�e�JyDz���P�    G�RV�x��ծ^C +e����JY�:�5��������J��:�5�R^q��w���맼[\t\?�����Sޭ��	��)���a��w��:���nqY��Sޭ��a��w�ː���nq��S�-.C�~ʻ�eH�Oy���2}ʻEeH��Sޭ�fH�SI�������׏��}
5���7���� 1��%Li}ˌ�\p=��0-9�D�t�td�`�/�\VA3��[�Z-#,՝l���b���bC�M�*ډ~�O�Z���'$?)�q
 ЊUl�%8YG#�b�9D�sz����b\���n�j	~�W��Ĵ�r�[,8�ĆصS-�c߶��y�D������r8J����N�����{��
_i��F�B0��UE�n
�CW�8t���MU�v#6�b��*Ng$B�Fo����Z!�FU[�½�UE���25T�o���1A���P�Au��5ȗ�x��y�C�49u}���2�����)N�1��X�4�SZc)���Qv*,S�=='�����?m��˷_���~�+A�]Y�̎�	%��!�B��� ,]�एS�\��|��'����Ğv��H�[f�b��aҼ\᪔�G9�AE�i��5��A���������9=��W�]l"������E��y��D������|+\�:��|�-���+���/c��W�є]�BTD�����4_�
���+^E���!�yerBqA�\W_�.hxA=�vP!o�*��N �#������{���=Mˍ�Z���Z"Z��k	��C��f��A�z��!���6�����Ϸ!�ɷ�^��o��4gy����FjW�b7����HC@�����^r��LkнCgvf�C_?��;�ȡ�SZw�x�Q����!��v(4�CO�Q�����!"�t���K�l��v��*cTQ�����F���}�2��d���@L��It���9D~��8� �\P�9
ɩ]vj�y[�\�� b'~����ɰ	t������ۏ/�^;��O�%X���t���#�A��p��u��p�6D�RX�r\=Tȗ�����.KD�L3�H��qՋ4�z�7�z5T�J�����:�f�z.��&��S���P�Gt�v�#��e5�P�K��>Յ�s�Rx��3�\v&,��D��iw�/�G]P˭��C�s4СL���N��iw�����ESƮ4�f&�-U�uC�~ z�X'�!b�>0e<{$�Tvn�o��n{ٻ���C!"��UR��� ��H�z��CĪ�3۞m�"�c���0)@�> ���;�;��)x�ԩT�: ��.~ {�FU��C�r	W�E!��.�k��և=�F�C���>!��I H������%*�*�*�y}�.�*3!�J������XO�L;W��8W!��Y�],>P���␫C=N�9ʣR�kvprY�ydz�)��f�V]�1giX
��op6A�>2뉔I˅i@.�?u.-�\hnc7xq���HqN���e��	c����6���SYN���w�}̯ߧ���Ӝ����5cXb��y֧��'(WΙ�[tb]zX)<M����9T:̮�Ɍ��TI���"& ���66pLD�����t5�h"��sƘ�͓��9�Atԗ�<9M�E���׹��S��
�?d�:�v��!n�B*�`���E��p�`}�8����At�h��`�
T�q��bI
��X��� ��� ���6�*"��=Z���a����n�%�}��T�C�2�B�`Ǽe����v�w�AsK����&m���Г"�y	�Tn9��
�A<����v@d���-��� �y���i�K�q�}�qlY�J>�P��#�����)�<��r�SX�y�!�3�-���<���;y���@vq��»�*��Z����&��]f�6�o����_Yd�:9/hX�k�$�5�n�D\,m�lE��1_6��+��x�Y#�t���:�rk�Pi�&.���Q�2ÈJ3�/�8E�">�1mύ��Uѭphg{��DS���c	����0}�Jh;��%T��,YӲK
s%$�V�3L��k�?ov����<��)��1�RtGU;����3H�,.��3]H�����1�G�*H5�ѯ���*�Фj8&�e���1K����Ú)j�q/���Ԩ�"f+�^q�e�;��/&.K�bj[���T�,��T�]�[Ň�M�+	R���̴� �!���X��؍d�lK�)���,1�֎!c�d&��)�e��~��.M2�/U؆�Mu�b�%}8wq���4�b��{�r�Ò�'B1�&�^PIC�:8I�q�,Kꌳ�#�"���6�;nf�b)�R��q�	��!;YʀZ���C�U,��4�#�<�YJ����,��4�3@�����X�߂3]@��Nu����@�OŅ��I+W�\$�O ~�C!�D���y$D��դ�ˢO�yt�l�qȢ�������ư,2�,��5�h	+�HVU���q�'$�(V�E��&tܢ�TH=��_,G��Bz�%/��U	���^�5<�r�[\H��G(��$���>ü�ug_޶ǘR�LG�4��[Gp
��k����|uT��l�.�5D������)���\��f�\?޺�vë����.� ��]�}��>��y�4�sW!�o("�Y4`0z�
��J�&#�J�8�Z@����M�A~��4�!WQԎ�B��Y�~�s>DH��7�Z
+L!�AC*�ܴ��qfr�AMn��v8���Q4�i!���1WR�BxE���zE������&�$���s�L��h!2��M��\�1;�}}�h>����}�(�υ rv{���|�8{�8�cT��7m1Ύ�n{�
\�qǄ�-<�IX)BWq�#�i�d�U�ӧ�U�*:BdX��^�ɹ�}��g���R��T�)�T�zf(x���ߧm���FU�WOU��)��y�Xmm�>�V�;;�j�J-"��x� @d�����wO��:�,���-֏�J Ԯ��HM��	���hU����F.��5*wuΘZXR�6�G��+t/��( r��+Wc�csf�:�ZDa%`�7�]B=-
p	���
i֡G���PEK�B'���&���3�����ȡQփi��}z����|T�#�	S@0�QF�/��:Mj�Q��v��G5���:sk@�]����d4&J������陣%>��mg��̽� ��Q��v0F�!ۙws�8�^�P޵�?+�Qr���AUw�����p����:��G�J�i�(�4S�jrn�4rt����tF7H��������.�e�!Ǻ�a��(�^�4�i�	�L;�ә��d�Y���V��1jw`-����97j�C���>���ь�#ӵ��F;�gl
ћ: ���.�X���z���BƲ�yV2�U�q�LH��0��
\� �-�S�ș��7G�\@��&׏���IrH�UT�����Ȼy�s\�&f>�D���ylRع���^d�Yr!��\��PuU�����!5�qs,;W+���#W�c� 0��kI%!bx#����Qt5F9�����2�(��ʍ�W��0darY17"�AT�Ho��	���c�έ�s\�ܺ��SYOeg	�۟��_����I;�:��֤�K�������W3�3�o����ͷ[�֠!�4=�=j?���v��TQ��s����U̹��S&ϰ�5���B�O�"��LIMO���:Ou��������b3P�����+�͎�&��N�}�$�1����u��|��=w���߷����ft�< ����^R�銹K8'nb�X+������o���"_{���/U����	 +�0=B�"v�>v�T�H��%w!v�>H�~좸�� t1��F�!9]�]r
������vd������0���40�m��B� R ���r�i�Y������@Q>�
��e�8ݗ����h�ar�-S�ٶʫ�<�@5{Z��    ���Z��MeV`�g��91A��?+Bx� �`֦�0��|��*�q:;���hHk/}
T��yk7�@�$�0/�^�w�����������?�_���퓯��3F���;�uF��W��v��H�`1B&ݼ����X�6n̤kr���Q�q�U���,9�ݟM���ٞ�Fs�E$���1D�=��~58�X���ޗF��,�#r���p��S���uVDal�׃�H�o;���@�_o9����n��ɹ�ne]W�
D5�雋�
��edǐ�5�&M�L2PK�r=�|@�p�f����>�Nfm�1�KL�q.~�ʸ����C�#UQ�*S(Ӏl�/hD�rj��1��4D�i@r��ṷ��fȒ�ht�+��e���([���fâ����T��4 ��w�\�[&�]i2�d�$_���T0Y�鍸z�(#��ij*�s�'���28;C��܈��a�>հ���u������}�e�e^^�b��Wk������Ӭ,�ز W����2�a�=>%sq)�9gF�HoY.�ww��w°����Cu
��S�U����� �����p���]dm�r�]cs("�yK<�%z�~4��%�+��pD���h��9������/]!�QS�0���u�"�R����}$I�Lv�Z7
���@�TyEΎp�g;h�H0�3<�iu�;R��r���H�A۲�!�R�e��2r��H?`��ˬ-�c����,�m��X�iL]N�����'\(G)�{�R�C$/�� j�8��b��g˿�	�l�������c�\:(Ɋ!���K_z��pY+�3�(���$���TҼ�,$�6�SK�5=S@k����x 8h�ֽd!	���5���H��T�Q�%�\J./X���Q6zȪg�d���Z6�I��q�]?�]����v]�cx/�3���{�=��K���s	�:6�
c�<�\�e���L{�
!����姖�`��J�v�%��ʃ�R�%	��M;"� I�^��2��}	Ӏ���sP�|e����C�/!j���慑�\��z�����a�"�O�iLtA�j��	K���L����Y�o��!�/yPQR�{�Ա	W�6�0 �)ݓP����)G�%���e�N� Tn���0�\�c��@�d�Y�:6�*%�W���NsqK�z��sKTd����+�X�[��HG�ֱ�vt�
z�ֱ)X����h����À��1U&�'�{���\�c��,�G���O9�g��?O�����0}�;�V)�6��w��<f^��PtYBg<�yBQ�� DK�BQ� <6	T�06��!�;7����A�lM���l�`~��֔bZ����OK]׺�SZb�q��-�~���0iY���LCHA�Sp~5ov�2�;!*�>�]���n�۞�o67��[�vX��K�n{�a�#��Y>�P1�g�9�O�\hSM���[�l�l���<{�����fl�ӰY�9�c�����C� arX B:l��nO���^~�����]����6H�)z�,hq����u�4vqA��&��|1��Ɛ������낙lFG0܍bd�����J�x ��E	E�0�_����'$*<G'&�e9�z����IdR�����7��k`��IO�c#�VĦF�|2%IH�l�+Q���1�b/������&Ġ����'��l���S�����L̚u"����O��>fGL3;��*�Q#��Q����kj������и����6�2��9FȥȲ(}nU�9f�7�s�s�Nv�K��z��� ����(�J��}J�M�I?�AmR�����e�V}VyqH�B~����3SkB�'������hzvF�)�5e��v���i��d	��*����0��N��DQ�-�@�q�rt����q@��[�0:�9�n��^>}�1{3=\�_D����aZ���oO�c��^�����<�/pՉpGk�93�N�Ȃ:m�T:"Y�$�G���2̣�w��jX��.oD�JI�I��qWp�~��sZh��I��q���'}Z�8����1�+Q�P��
i�g�
<���ʐ�:��D}���?�u����Ż�T�I,#�:N�+Kg���E�^�h�U�t��j�H�>I&O��.�����Zr��!�JF-�j�<�������y<��P���_��0��uH� �riҧ��;"tG$x���LHH�M��G%$RPc�T���i6�*`��L��z��cކ���T����������O˼��j<m�������H1����}ܜ��]ݯ�C�!��s�\ 0zk�ѩ&��afb2� �M�4p��p�ՙ��w笩�����i�t4���^��"���H7�`�9���"��D��pby�}\sҳ\RX�c^D)L�8�4�YD�-!E�2'='r�QΜ5%f+M/ԤfoFM��
�}����s�SG"/9E�2'� �bx��� `o�oi�N�伞���ֵ�����6�t�⿐	�/���~�	�I���9k�'N|e���[-4��������Y�4�G�͹P]��&m^Kj��lZ��zG�F�y��m o��i6�:�H�|�:8������I,�MVԞ�W>yQ;u�8"��%j��<Nt8��E��j�\��&B�����O���1F_������3r��[�7oC����9�R&�hR,���X��o�XA�=8���2�9��:�\D9�'8�v.`+4��Յ����rHoq�}p^�9t.d���6ґ�R���,���L(��a.#�uW��k��4�>IL�#��@9?~��i7�^op(W2^�V
�i�T��'E������fN��)E��~����ek���&����#P�Q���:q��28�tJ�<�����:��&��>���sX���F^��ݓ��<Քv�����u�H8�:��~U���:5y���2��!�]o	O�ʐ"�hUӂ{��"�jZp�|��S�/O5���v,y�}����VPS�lC�:)z��)Oͧ}3k0To�i�WtU�f� �nQ�p��sI�z��0<��]�N��9܏�m �]n��Wn��c��'3ZJrHﱡ����d�����b��|��� �t3�v��8=aX�'3�;�.2-�kU9 � :�̼���0�N?w6�Y�a� DI<�u�A�j)�C]U�� �L#تڄ��
���6aA��gUm�B�
xV�&,H��['��h# ��蓝��M�WY9oftx�e1�c�b
[eY��� Eõ}�x��&�U�p��2R�L�iRx�0��������WYk�ɴQ�Eѷ� �d
��:�YC��4MU]���J�@v�4(<�Й��Z��4V�"��C|u ¶1M#|u�:
w�>�q35���{h��K�N~H"�N~pđ&E�;MC�5�U}����uc1y��N!L�*�Su*1l��T��)�����g��q������8�!��l��K�cj�D0�|��A���q{x'��Z��`O&|&K�x��%�̊%a%Ȟ6
Xp�|>W�0��w���
J����LI2� ��e�vEI&
!䎚$�B���ǔ�Be������j���}7'����q��!�2t�S2�;�Y���g�G�<+f9�(�NcN� �'}�\Y*���B��^'i�z�<>��@��Y>�ϻ!��&����A%���\p3)��&�A�P���@��'�r�!���L0�n�F�ǉ�)�4Q�ǈ��z�̔q�k��j��/@oք4__FF�+�Ӯ���HR�l�|}%SKl����ӊe��4߄#��|.�dH.ZR.bHpl���"�`�ѿ<����6O�Ӗ"��Ŏ%)0D�����S�k�,Nrz��J�C����E���s9|.�3}J���^l��ac� sJ�f	�8��{.�Q����B��8��٦~���a}{�3��!��)�gnipH�H�:L"\2�,sy�x����P)t%�[���<���S2�T�p;|qڛr�ReA�����N�'F�^f̒~^��@��2-�T.*N�z�����]n9=�z��g���� �  ���V�?M�T�����Ƽ�f	��Ȋ�l
�4@���.�xk.���ɟ^~�}������Ǘo��㴸���V@mx��Y�e���w�n귵㵫��4�`��j�e!5M!k!r�Fղ���t�@D�WV�����7�ۻq��)�S���	 �u�� e
l����8��=D�Κ�)DȀ�K������.D�l�R#���#jO�jY����V'�9�m�Q��%)�Gȸ��!=�B�4�̽��'{�#O�WS�(y C�!�'�qsR;�F����si����D�:�Tb@�F�Kl`�z��'e���b	���Mz�� Fkz�W��+�%'�+]O�^�
���4�����Ռb�,S-(�:q�Dc�"Yo�c��t��
=����f�`�R��y�᯷���;�
��ER�����	��C��زog�(0t;ٺ��E���	5}�P���4�>�R��ٴ0��� )^NL?�m�\{��Y���B	�~_���Ҽ:F�G�M��i�8f�̉�0M�I&R��ũn}d��17S��w��!��u]��ݪ��R�8�@���{�:s\��z
s�KZ��G=�Sno�w^�u��_��Tr���Vk.�\�]
_���c�Lo	�I+����ӑ�ۅ�1l0��mlrDl�DD�������N�`xJ�K�lS��ꌉ3�t%����L�~�󎢃�)������k	��A[_l�3�xɩ}tIP@vv��n�z�% H�a]B�;�!>.QDUb :T��p���V��P��%t��G�DjP�DQ&�/�M��6"�h�:mMs��g�$���OQ"���M+vHt���4C[_B�>D���O	��D�ѡ�hJ��R ��׏|O���t�
�1��:��FD`(�>pD��M�P�b�F:U�Y���S����:�4�ى��8D�xv�df�O붔�֜��#�~��T�)��tZ��љs^s�D�2��-���C>c~gn�YR��|���3��^�������9��I��X��\�v�Y�^k))U�A(Un,e�Ԗ,@�ɚ���XE����f15xO�L��B�4�g�5Z��\�՝Tcֶ`a�h��d5
$��M�_���nޣ\�i����k��aa��k���Ȼ�TP=��;�8��A��C�0�1ZI����� �f�z"he!ˮm�C�e�����/M�����?\�v�yƂ�N���ܮ����̚A/��-�5樅ZS
�zw��}�j�w';����޻P!�/&�����d�@Z
츩Pw��QL��E$�T���"�rEuF�l}�q����3�/��tN�s���m��24�k��`������)Ū�����v@�\�uD�4��Bھ����{�ڍr��E9���_��]>8<�BJ����n�\y*���.<�m���2\����� �c�J?ȼ�]�����ҳӄ��`��x���A��e4O��Y�2���΋S՜�2���^�� P^]Ӻk%�P�W���R�(�G
٠��䤲h_!�q������}f:�O(��PϚ���NcZ������ٻ�\�m�[��q����@Ähm��I�\����~���{���5���
���3>f� Nz�>�w�ǱDJhu�kw�<y�{� �X%u_.�P~ą�����/����yzz�����g      D   7  x�eS;��@�G���)q��|��c�~���8v�_�ҧ^�s�s��eܳH��H*�����єG�8��������!M?Ho�o��OS�*�&	Kܹ��1qϧ���d㈌������%٣�J��5S˟
ob�?�����{j�V�{i��^��(w�B��;�����5`�w�:">�~�~y^�@Ck�\�=܋QŢ[è��_;��:���<(��.=P���0 ~A�v���=�r�&3����`�U�TS�EȊԛ{w%��@�6މjK6ɒ�5{�a��X������\M:
fj8�-�l��?~�+�0��QG�^�e���-��<�I p�*�E�E�@���⁁�Wh���K�KҠ��ح�Ǆ��_��ƽԅ���(�0I ��K���H	^J�d
4��9	�۳&'٥8��)!�Pʺ@s5�xEcѥ_�DL��#��2Ns3�����}	k�z�k� ���VNX�y� _{��Y���7I�PE�v~'����v��(ހ�'V
��p_6%��?/!�!���EfP^����m���V��      U   M   x�U���0�7�2�N�]����r�'@PP�t0� ��PucB�Z7V��E�O�ʳ9���e��si����mZ�      B   >   x�mʱ  ��� b��BA���Kp�$��ժ2�p~d!L�!���i�t�{�*$7���      W   1   x�3�442010�440�44�4�9��8-MML�-L���0�=... Ҙ�      J   �  x����n�@���S��v=v=^�@B��*H\���4�6Q�z�p�Sp)HEQũo�&/ú8�$Ziw5+}�i�����w��_�f������W��_6�~�^6_�ˈ�(EJI�ż��o_==E��   $'�(�~�����yz2����Y�?LG@N���/L�����񾺕($E� � �3v���l�A����1b�o�󰱿j�oo��)`
�[~H5�R��0��L��(Saf�<��d�	�zz;=�I��	E�2a(���y?~	�G/v9ھۖ��o���l����P��vN��[�}`u�Q��#E����5���_��"�����-uJ�uԫ�Y�\;�N��2���pf��������鋷���!.A)8/u&l�.�;�+,kkE�����b�V�q��w��      g   �   x���OJ�@��u��e&�͛o�"��!b����C,�Tt�M�zS��ڒ�,�������1���]����B���$(���M�N�r���T����˾��z��C��ժ�>����8jMPư1�(��.��d�9�y7��I��4�V�`��q����"o��!��3qXy��H�Y6�����m��g��E�Z�2�J�K�VKӒ�&yo��j�˄1D��ZO�L�)&t��t��_��      a     x����J�0���)r/Ks��6y�)Z2�����bO�M��JU|���e<��nh����/�0��l�#������O��k|�����[N��Ww��N�'=Y�ŵ<4��ҡ�PC8��E����"ͧ��"��y>e�ԇ�D�D���0J�1���Bj��1 ��NY%�*+!�0�z_c�����,�T[}�'�V �1g���J��H}�F�Wdjp;��!L�z*�_�y}�+nqG���R��Sܻ�Ȗ�a����������D����"�/?���      e   �   x����J�0��ӧȽ4=�iפ�ʄY*Veݍ�w�Sx3�p}�|:g�BHHr~�5=Ӌ��_�a�`:AHꦊϧm{y��ʓ�*���zҔF�]UB��/����iI+�;���Oo��[�艶��|�Fҽ�8`C[1���b�1�W�)�Sr7:,��O���kE�^d�����c�y]Mg{�~���=̙e5f����f�#���x����{Xh�t��l��o����(�> ,��$      c   �   x��ѻMCA���N�-���Z�J��� ��ԱK5���.�J�|�Y[�k{oߛv�/��<-�EHtG�S�P�JU��@qK:��B���==v5 g+�u�@!��/�5�T�{�(���{����>=;(�kρB^ߘ+	昔�c�o`P�7�ʄ"��<w��Gw5���.<����UKY�5�`�r��O?�7�VE��r��90�# \�F�j         H  x�uT�jA}��
�V<�2Ҍ
m�PB -4�6�ǉ�\Jj(��W���u����HG��hK�c�1�K���D��[��f��YX�FbM�L�
	�ܾ �`j��7��犆_��ZL�JA��6�5Л�,�酞@T2@ �ӓs��0du�����g�X,	s�1$��B����@n-���
_&��S�
���Jhe�X��PA`Z����l2�§���t~7u;��ċ�ۍYAZfrmֳ���L�Sa�NV��mp�	*Y%�\�F+e-I!H��b��T*UJ,&l��!l�A���-%ݲ�1*��EDj!��pS,�E�Ѿ��Ơ��3T<��&ki�.�@���i�¼�d�%C+<y�|���ep���
ш��@4�=�<��&�,Ѳ������d����
����x�}����po͢]��nb�s�)`?�ˇT`D����4~��9�������=������L��,��������_-w��q��駤g��~�������!~>8MG'(�x}�����������+r;�j!�V���9�#�dr����sN ���{{4r���<6M�P�c            x������ � �            x������ � �      Y      x������ � �      ]      x������ � �      [      x������ � �      M   m  x���Kn�0D��)�/"�ÏD���?G���\��,�yz�������_ȓ�I� wh7-5ؾH���+,|[�(�,h;l��JW�j��@����C���s��mUm�k���i�.:��k;�]��a��kq��p,�"�����읮�P� �]�<�h��t#��3t���sF�t����Y���tp� 8���|�2�}�q��:bt�ա�;�:ڸ�s�x��V�	�\<)�E�9�.n`o2͠˚��<P�������N7�>��.�)J��#�l��O�^%O:_����U�]%?���g�q[v�J�z���E�� ��x1&wj�Z�S��"?���f������'��Vɽ��\�y�.�� A��      S   �   x���=nD1��"}�?6�%�?GxҾݤ�ӹ0��N���)��.���ljF`����!Z��=���LB1�d�"V%k��'��Ǣ�<GV9&�"�N"������e���%���#)ΑnE:���Il�w�y�h����$F���JAgfl}1I���ʹ�M�Hק�?��O!p��L7�J�{z��4;�嗳��ᄮ��k���j�ng��>��f&��]�g0vKI��k�1�_�,      Q   Y   x�e̱�0����} ��I9"g��s���􇣑*&(8�.E�Z{wn}0�l�D��DC��2��;Nu�۱[�ZqG���Lw�k      O      x������ � �     