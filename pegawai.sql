PGDMP                    	    |            pegawai    15.8    16.4 :    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Q           1262    16397    pegawai    DATABASE     �   CREATE DATABASE pegawai WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE pegawai;
                postgres    false            �            1259    16412 
   DEPARTEMEN    TABLE     ~   CREATE TABLE public."DEPARTEMEN" (
    "IDDEPARTEMEN" integer NOT NULL,
    "IDPEGAWAI" integer,
    "NAMADEPARTEMEN" text
);
     DROP TABLE public."DEPARTEMEN";
       public         heap    postgres    false            �            1259    16419    GAJI    TABLE     k   CREATE TABLE public."GAJI" (
    "IDGAJI" integer NOT NULL,
    "IDPEGAWAI" integer,
    "GAJINYA" text
);
    DROP TABLE public."GAJI";
       public         heap    postgres    false            �            1259    16398    PEGAWAI    TABLE     �   CREATE TABLE public."PEGAWAI" (
    "IDPEGAWAI" integer NOT NULL,
    "NAMA" text,
    "ALAMAT" text,
    "JENISKELAMIN" "char",
    "TGLLAHIR" text,
    "NOTELPON" text,
    "FOTO" text,
    created_at text,
    updated_at text
);
    DROP TABLE public."PEGAWAI";
       public         heap    postgres    false            �            1259    16497    PEGAWAI_IDPEGAWAI_seq    SEQUENCE     �   ALTER TABLE public."PEGAWAI" ALTER COLUMN "IDPEGAWAI" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PEGAWAI_IDPEGAWAI_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    16405    POSISI    TABLE     r   CREATE TABLE public."POSISI" (
    "IDPOSISI" integer NOT NULL,
    "IDPEGAWAI" integer,
    "NAMAPOSISI" text
);
    DROP TABLE public."POSISI";
       public         heap    postgres    false            �            1259    16452    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    16451    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    224            R           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    223            �            1259    16427 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    16426    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    219            S           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    218            �            1259    16444    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    postgres    false            �            1259    16464    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false            �            1259    16463    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    226            T           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    225            �            1259    16475    sessions    TABLE     �   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    16434    users    TABLE     @  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    current_team_id bigint,
    profile_photo_path character varying(2048),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text,
    two_factor_confirmed_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16433    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    221            U           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    220            �           2604    16455    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16430    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16467    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16437    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            ?          0    16412 
   DEPARTEMEN 
   TABLE DATA           U   COPY public."DEPARTEMEN" ("IDDEPARTEMEN", "IDPEGAWAI", "NAMADEPARTEMEN") FROM stdin;
    public          postgres    false    216   WE       @          0    16419    GAJI 
   TABLE DATA           B   COPY public."GAJI" ("IDGAJI", "IDPEGAWAI", "GAJINYA") FROM stdin;
    public          postgres    false    217   �E       =          0    16398    PEGAWAI 
   TABLE DATA           �   COPY public."PEGAWAI" ("IDPEGAWAI", "NAMA", "ALAMAT", "JENISKELAMIN", "TGLLAHIR", "NOTELPON", "FOTO", created_at, updated_at) FROM stdin;
    public          postgres    false    214   �E       >          0    16405    POSISI 
   TABLE DATA           I   COPY public."POSISI" ("IDPOSISI", "IDPEGAWAI", "NAMAPOSISI") FROM stdin;
    public          postgres    false    215   lH       G          0    16452    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    224   �H       B          0    16427 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    219   �H       E          0    16444    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          postgres    false    222   �I       I          0    16464    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          postgres    false    226   �I       J          0    16475    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          postgres    false    227   �I       D          0    16434    users 
   TABLE DATA           �   COPY public.users (id, name, email, email_verified_at, password, remember_token, current_team_id, profile_photo_path, created_at, updated_at, two_factor_secret, two_factor_recovery_codes, two_factor_confirmed_at) FROM stdin;
    public          postgres    false    221   MK       V           0    0    PEGAWAI_IDPEGAWAI_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."PEGAWAI_IDPEGAWAI_seq"', 36, true);
          public          postgres    false    228            W           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    223            X           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);
          public          postgres    false    218            Y           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          postgres    false    225            Z           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    220            �           2606    16418    DEPARTEMEN DEPARTEMEN_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."DEPARTEMEN"
    ADD CONSTRAINT "DEPARTEMEN_pkey" PRIMARY KEY ("IDDEPARTEMEN");
 H   ALTER TABLE ONLY public."DEPARTEMEN" DROP CONSTRAINT "DEPARTEMEN_pkey";
       public            postgres    false    216            �           2606    16425    GAJI GAJI_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."GAJI"
    ADD CONSTRAINT "GAJI_pkey" PRIMARY KEY ("IDGAJI");
 <   ALTER TABLE ONLY public."GAJI" DROP CONSTRAINT "GAJI_pkey";
       public            postgres    false    217            �           2606    16404    PEGAWAI PEGAWAI_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."PEGAWAI"
    ADD CONSTRAINT "PEGAWAI_pkey" PRIMARY KEY ("IDPEGAWAI");
 B   ALTER TABLE ONLY public."PEGAWAI" DROP CONSTRAINT "PEGAWAI_pkey";
       public            postgres    false    214            �           2606    16411    POSISI POSISI_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."POSISI"
    ADD CONSTRAINT "POSISI_pkey" PRIMARY KEY ("IDPOSISI");
 @   ALTER TABLE ONLY public."POSISI" DROP CONSTRAINT "POSISI_pkey";
       public            postgres    false    215            �           2606    16460    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    224            �           2606    16462 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    224            �           2606    16432    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    219            �           2606    16450 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    222            �           2606    16471 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    226            �           2606    16474 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    226            �           2606    16481    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    227            �           2606    16443    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    221            �           2606    16441    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    221            �           1259    16472 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    226    226            �           1259    16483    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    227            �           1259    16482    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    227            ?   6   x�3�4���2�4�tq�t��2�4��p�p:r�r�r:�9�Ds��qqq �X�      @   0   x�-��	  ��s�ٯX���!����8m?�'I��b���m�.IR�
      =     x�}��r�0ǯO����s���Y˶ǭ��u]�C�q��{����@����|�``��<%��"�)�$J�	�:0p�����o���C�C�+���!,�,�_�nS4���<Ki��?�_�6�����4��e;�ϳ�r����GJV�ȧ	Ůl��a��b��zStؠx8d���-B�w��<�oq6�g�./�0��nj��XB+�i�@�Y2K�\�)v��`�Z��L� ɢ�!���VjX�2=N�6ݸvO2,���ZD�=�/=���5Q� �U���G2��mg���gUY5�z��0ͧ9������qXd��i�B�O���8��P��J��:�i�FP.��M�S���U����4ZM>MPվ��}u^�	R_��,�#zԄ��*��e�>��	�i?{��WC��=�ܿ7�f���x�o��E>M�C�[U�y94Uy�2a��ѧ	e\�yʳ1��I��4u�L��ȧ	�K'�v�s�����ҕ�N���YO���o_uzxǭ���H����&�$�nV��';���Uܹ�P��w^�ݜ��cw��	4�=� ���u2�B�x\��o;���T쯂�|���x~>������x+yv[����Ō�q<rM$^��Dq��      >   T   x��Q
� �﷧����2uWԈ���#��QP8���p[�j��\)�ih����w��"k̞�3Na���}��}�w&��2      G      x������ � �      B   �   x�]�I�0E�p�*	��]*Y&1m��8��7)j���=�/��(mA+��w�E�D0	E��]�J�f��F����HB	?i\�f+�ED�!�=����U>����@]��]h�C �V�]�R�.��w�gy� ��K��i�d�.���ϔ��a狀�?Ͳby      E      x������ � �      I      x������ � �      J   d  x�-��n�0D��+��R�C�Aȃ:�D��!/���S�x��khuwg43w�����^�#kq��Z:ܲ�5��?���҃��K���6PҨ�ǡ1����u*o� )y
 �)����5���Y�����́N@���~ʀ�%'���YV��ɫ��1?���E;�cu۱�@\1�1nE�]3�$��w���Vq���2�=����Jc��l�Dk�,�]բ����g���7����DZ�kRΰEh�<�Ni(�n���2!nU�ԙ����c�����_�-f7:��y�������!�.�Зn��tI���$�����f�!���lC��T[oj�$ᇆL<&x���z�_R.�e      D      x������ � �     