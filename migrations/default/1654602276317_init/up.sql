SET check_function_bodies = false;
CREATE TABLE public."user" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    telephone bigint NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "modifiedAt" timestamp with time zone DEFAULT now() NOT NULL,
    dob timestamp with time zone
);
CREATE TABLE public.user_address (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    address_line_1 text NOT NULL,
    address_line_2 text NOT NULL,
    city text NOT NULL,
    postal_code text NOT NULL,
    country text NOT NULL,
    telephone bigint NOT NULL,
    mobile bigint NOT NULL
);
CREATE TABLE public.user_payment (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    payment_type text NOT NULL,
    provider text NOT NULL,
    account_no bigint NOT NULL,
    expiry timestamp with time zone NOT NULL
);
ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_payment
    ADD CONSTRAINT user_payment_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_payment
    ADD CONSTRAINT user_payment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
