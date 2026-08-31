Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E476403E8D
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179600; cv=pass; b=hm7m8ClNhoxlW7VhkelEvzWGObcNtyR9jbSvCU6eYHrdqVL2q8+PdL0FztDXJw6TYUibU7X33//W6pXMeJIJdvnbYV+WYh4FWjdnsJe+3vglpPGtstlsiKRcn4hTgqdCCSwbJQqbU/+kscwxK5w/Wfi7RWi3vRkY+DCSYPS56fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179600; c=relaxed/simple;
	bh=gaRkedV713MsnXzEO4CGtOGQLpcQnFwA/KGBiZD2p+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIn1fjb8J5dyN6IodTJ0YD3PkbO1ODWoNxDHHaPDkZEPQPI+yUZACAEW5IcTAK+bsxm9u3WqXNhGbZH71NauSkjp/SV6MvRT96CedA2aGi/nC5WPyXh3BMIF8hao48DCcecQDMbKJWBSu2jeUko6SsZrcNI71nAzcCcst1CWh2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYOwLHLW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5b0yJkc; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYOwLHLW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5b0yJkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788179597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vykGLcQWkbD8ivoSk8Q9cZUvO6Y0xtJU1XX9cOdfeIs=;
	b=dYOwLHLW7EkCaLVyvTVQUPpBJ8XjqYFNccs+lZc5WrxOhqcoRlSUV0EDb/dvGQBLA64XBz
	uWB5/YOqTcBpAHhhDVuF1OBU2oc+MTQh3PuSM0grZa+m6q9IN0ZDIbLIzyAtP6U757QgMa
	SB/XG+9aC9b9M2llU0QGAApL2F1DIV8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-1KRHVuQoMGeh5Z_XB5RJiQ-1; Mon, 31 Aug 2026 08:33:14 -0400
X-MC-Unique: 1KRHVuQoMGeh5Z_XB5RJiQ-1
X-Mimecast-MFC-AGG-ID: 1KRHVuQoMGeh5Z_XB5RJiQ_1788179594
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8615bb9d4c2so18713287b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 05:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788179594; cv=none;
        d=google.com; s=arc-20260327;
        b=FbVMqNBhEl4GyuV2YRhkMy/WLJGzOnue567Bksyp/KhKIKc1dAwmgkKOXAOI2aH1qY
         DbkPk2TkEY086UE8bM1i7fozt0Xxlo4x5BMtaOkdsrG52oT1FUhBDpHG5B84OJCV9e5t
         ME2PHh0Q6jzHvkgTCgBuVzfKMvNm2mGmvPpgHQ2RJe7eQtw7m1bCn0aqNZwwvh9WIWsq
         N2Zdq63FY4Lwj5YxozrGMNjArYI71hcq+9fNw843KkdQMSbGW+BhnORH6+e4k9EJBIRg
         3rqxK1P5ANa1Y4uRFeK4jzWL7DEc8c+HiBPfBgi02O4U3gv40/Xzsjs3oZn8VvIfHK4A
         y9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vykGLcQWkbD8ivoSk8Q9cZUvO6Y0xtJU1XX9cOdfeIs=;
        fh=o+ETh8SGLtdPdw6bzeQsy6emGPdzbwSIGdgk541gJiw=;
        b=efxYCyp5hvY1JONuPujjMirRbr5bullqQy9X4sHOi/+YXaXjNtBXgqxzIbaCFpPf5h
         aH946nMz685A8lHkqtkEa3yJMTgDGmgWxm6IQ2ItnIPgo8d5FG3iGSyUY3xKNfnWLYsn
         SYan6uP6vtzo2zvvS/IU6qhKwEqsE/PrR4UXpsFaK+sLQXFUWAv9sdJu8xPBG1Al4ddN
         MiupM4FNTl+fLFwVke/8QYzchh/fzRtqVJza+pQD8jsxaz8dkLUSth0TR0vrWuwqHsAz
         7PXZK7g0XwKitsAnR5LqddQXDTt+g04ODaIcYUdK9px6FoSscHZg/fHaNZmOYOOfENTV
         KpJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788179594; x=1788784394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vykGLcQWkbD8ivoSk8Q9cZUvO6Y0xtJU1XX9cOdfeIs=;
        b=M5b0yJkch9jbyAmN49IAK3k5cXukhmc2QAKQnn1Pti5wNEpRpH9BDAJ/dSjrN0h1Yu
         CgCTUwV1Wx8kxTYLyhnshVAZ/7WuFA/eCYeKVDcUNDAZPoTpQliAvhmGn9mTorovf6RF
         rubviHBLB8iK6s+M580thkSldGBovfOL2YEqoifAL4ALNdiMLADc61ZZlHWN/Jv7XOkq
         J1L8/a/pxkAU/EWDfhIUSgKBxXNU6TT8R5inqo2Dl1XmW37DtkpAYtvnxa7tGoHqeB2Z
         yyKtlabTonVLYu10YZFetKVl6RNKvtaUSrEmSeO+gtaW0TccvbT1F8RObGuAIaMFz87Z
         SNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179594; x=1788784394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vykGLcQWkbD8ivoSk8Q9cZUvO6Y0xtJU1XX9cOdfeIs=;
        b=E2DnG8q0hTyGNxhPQ6TwWxk+JHpPx76K8JWTRlQavXE/S5Aq0t0Xf3HMnLXN5WX9XX
         zB964BEbnBe6IVNEM0nxHop1DpJ63jQKatvZ8HbkFU/LdLOG5C3YFt1vdd2gSbKdYp8z
         NbKSkInTaoTcnFTRcwKmoUF6vCBJktLErVukw6AGGLQHrHq8nQ9lZ6fVofJTKTOnvhGg
         y56uQFL9E1u4qew2/YbYEOpFadn5XNoIWq0E7KxeUdPgdICAs+6NrGgPedTIC8mq6Vhd
         DpYeKMBFDwHTdt/3O1mw/rPQVB7qkNnAP/auZw07Xul6qzb8ueqXIbvnVq1F8vMscQER
         8RaA==
X-Forwarded-Encrypted: i=1; AKwUvBw0xwE/WGTeGp+v1gzu7FM7vstpZTw09RIvNLwt+GEgpZSuYsqkbP8JnTQcWrBu/k3RbDatJRhgxUGhAok7fRk=@vger.kernel.org
X-Gm-Message-State: AFuF++lJUPRH3OSBoSfElZLga0zPi1Ad947aciwQTffWi9lt/c6lhsA/
	2t4MAQFRzLNIDjVOC9omlfhtXCPwE4dehaQ9ktLH86WnSkFnTyeOm7nxRTxaBVR5rRVoedeXSQy
	IHAw5VSi7PIAklpVFCVsYbfMt6n4HVM5r7CJplnTo2e0XPG5s0XhBUDvHoi8YRk8DpKqv5TCee9
	09UQvjIwci//Lfisz2g/Ri6T0Daw9gGyJFe3/WRcnIS85tuxNwY7iP
X-Gm-Gg: AYBFou2IFT2S2XrBHzpeFzjetIHOOfNJuXiHmeUbKEQfdIZkASm198WiCWQrcR2NX9F
	j6MMf6jnI2oSfHL+bw2gYtVVFF+CU+udKuHhdGn4/orqB7X9IXmwyDeg71uc+mMaNSYFnxu4WOy
	AyHDiA10k2hUmD4xD5HscujhHw4B0nqz+IdI5jViohwC2ouFf6oLQC8zw=
X-Received: by 2002:a05:690c:12:b0:81f:2403:9e70 with SMTP id 00721157ae682-86874be3a5cmr2835077b3.19.1788179594037;
        Mon, 31 Aug 2026 05:33:14 -0700 (PDT)
X-Received: by 2002:a05:690c:12:b0:81f:2403:9e70 with SMTP id
 00721157ae682-86874be3a5cmr2834877b3.19.1788179593435; Mon, 31 Aug 2026
 05:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com>
 <20260706-kunit_cgroups-v5-2-6c42c8753468@redhat.com> <aox7nCE6ety6s8iL@localhost.localdomain>
In-Reply-To: <aox7nCE6ety6s8iL@localhost.localdomain>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Aug 2026 14:33:01 +0200
X-Gm-Features: AcwNN1VESQqh0r-wdgek3mj8e31_XWzdy83B8uFKeigSXr8USOY8ZjvFSjh8Sv0
Message-ID: <CADSE00KZNUVT41-nZ4O_v8DAihrOmysE2N_LOMH4QJf-+Ha4qg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] selftests: cgroup: Add dmem selftest coverage
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 8:28=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> On Mon, Jul 06, 2026 at 02:06:41PM +0200, Albert Esteve <aesteve@redhat.c=
om> wrote:
> > +static long long dmem_read_limit_for_region(const char *cgroup, const =
char *ctrl,
> > +                                         const char *region_name)
>
> This should be replaceable with lib/cgroup_util.c:cg_read_key_long()

True. I'll take care of it.

>
> > +{
> > +     char buf[4096];
> > +     char *line, *saveptr =3D NULL;
> > +     char fname[256];
> > +     char fval[64];
> > +
> > +     if (cg_read(cgroup, ctrl, buf, sizeof(buf)) < 0)
> > +             return -2;
> > +
> > +     for (line =3D strtok_r(buf, "\n", &saveptr); line;
> > +          line =3D strtok_r(NULL, "\n", &saveptr)) {
> > +             if (!line[0])
> > +                     continue;
> > +             if (sscanf(line, "%255s %63s", fname, fval) !=3D 2)
> > +                     continue;
> > +             if (strcmp(fname, region_name))
> > +                     continue;
> > +             if (!strcmp(fval, "max"))
> > +                     return -1;
> > +             return strtoll(fval, NULL, 0);
> > +     }
> > +     return -2;
> > +}
> > +
> > +static long long dmem_read_limit(const char *cgroup, const char *ctrl)
> > +{
> > +     return dmem_read_limit_for_region(cgroup, ctrl, DM_SELFTEST_REGIO=
N);
> > +}
> > +
> > +static int dmem_write_limit(const char *cgroup, const char *ctrl,
> > +                         const char *val)
> > +{
> > +     char wr[512];
> > +
> > +     snprintf(wr, sizeof(wr), "%s %s", DM_SELFTEST_REGION, val);
> > +     return cg_write(cgroup, ctrl, wr);
> > +}
> > +
> > +static int dmem_selftest_charge_bytes(unsigned long long bytes)
> > +{
> > +     char wr[32];
> > +
> > +     snprintf(wr, sizeof(wr), "%llu", bytes);
> > +     return write_text(DM_SELFTEST_CHARGE, wr, strlen(wr));
> > +}
> > +
> > +static int dmem_selftest_uncharge(void)
> > +{
> > +     return write_text(DM_SELFTEST_UNCHARGE, "\n", 1);
> > +}
> > +
> > +/*
> > + * First, this test creates the following hierarchy:
> > + * A
> > + * A/B     dmem.max=3D1M
> > + * A/B/C   dmem.max=3D75K
> > + * A/B/D   dmem.max=3D25K
> > + * A/B/E   dmem.max=3D8K
> > + * A/B/F   dmem.max=3D0
> > + *
> > + * Then for each leaf cgroup it tries to charge above dmem.max
> > + * and expects the charge request to fail and dmem.current to
> > + * remain unchanged.
> > + *
> > + * For leaves with non-zero dmem.max, it additionally charges a
> > + * smaller amount and verifies accounting grows within one PAGE_SIZE
> > + * rounding bound, then uncharges and verifies dmem.current returns
> > + * to the previous value.
> > + *
> > + */
> > +static int test_dmem_max(const char *root)
> > +{
> > +     static const char * const leaf_max[] =3D { "75K", "25K", "8K", "0=
" };
> > +     static const unsigned long long fail_sz[] =3D {
> > +             (75ULL * 1024ULL) + 1ULL,
> > +             (25ULL * 1024ULL) + 1ULL,
> > +             (8ULL * 1024ULL) + 1ULL,
> > +             1ULL
> > +     };
> > +     static const unsigned long long pass_sz[] =3D {
> > +             4096ULL, 4096ULL, 4096ULL, 0ULL
> > +     };
>
> Possibly those could be signed (to save the casts down below).
>
> > +     char *parent[2] =3D {NULL};
> > +     char *children[4] =3D {NULL};
> > +     unsigned long long cap;
> > +     long long page_size;
> > +     long long cur_before, cur_after;
>
> Just `long` should be fine (with gcc).
>
> > +     int ret =3D KSFT_FAIL;
> > +     int charged =3D 0;
> > +     int in_child =3D 0;
> > +     long long v;
> > +     int i;
> > +
> > +     if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> > +             return KSFT_SKIP;
> > +
> > +     if (find_selftest_region(root, &cap) !=3D 1)
> > +             return KSFT_SKIP;
> > +
> > +     page_size =3D sysconf(_SC_PAGESIZE);
> > +     if (page_size <=3D 0)
> > +             goto cleanup;
> > +
> > +     parent[0] =3D cg_name(root, "dmem_prot_0");
> > +     if (!parent[0])
> > +             goto cleanup;
> > +
> > +     parent[1] =3D cg_name(parent[0], "dmem_prot_1");
> > +     if (!parent[1])
> > +             goto cleanup;
> > +
> > +     if (cg_create(parent[0]))
> > +             goto cleanup;
> > +
> > +     if (cg_write(parent[0], "cgroup.subtree_control", "+dmem"))
> > +             goto cleanup;
> > +
> > +     if (cg_create(parent[1]))
> > +             goto cleanup;
> > +
> > +     if (cg_write(parent[1], "cgroup.subtree_control", "+dmem"))
> > +             goto cleanup;
> > +
> > +     for (i =3D 0; i < 4; i++) {
>
>         for (i =3D 0; i < ARRAY_SIZE(children); i++) {
>
> > +             children[i] =3D cg_name_indexed(parent[1], "dmem_child", =
i);
> > +             if (!children[i])
> > +                     goto cleanup;
> > +             if (cg_create(children[i]))
> > +                     goto cleanup;
> > +     }
> > +
> > +     if (dmem_write_limit(parent[1], "dmem.max", "1M"))
> > +             goto cleanup;
> > +     for (i =3D 0; i < 4; i++)
>
>         for (i =3D 0; i < ARRAY_SIZE(children); i++) {
>
> > +             if (dmem_write_limit(children[i], "dmem.max", leaf_max[i]=
))
> > +                     goto cleanup;
> > +
> > +     v =3D dmem_read_limit(parent[1], "dmem.max");
> > +     if (v !=3D 1024LL * 1024LL)
>
> This...
>
> > +             goto cleanup;
> > +     v =3D dmem_read_limit(children[0], "dmem.max");
> > +     if (v !=3D 75LL * 1024LL)
>
> ...and these literals would be nicer with MB() macro and possibly added
> similar KB() macro.
>
> > +             goto cleanup;
> > +     v =3D dmem_read_limit(children[1], "dmem.max");
> > +     if (v !=3D 25LL * 1024LL)
> > +             goto cleanup;
> > +     v =3D dmem_read_limit(children[2], "dmem.max");
> > +     if (v !=3D 8LL * 1024LL)
> > +             goto cleanup;
> > +     v =3D dmem_read_limit(children[3], "dmem.max");
> > +     if (v !=3D 0)
> > +             goto cleanup;
> > +
> > +     for (i =3D 0; i < 4; i++) {
>
>         for (i =3D 0; i < ARRAY_SIZE(children); i++) {
>
> (to avoid unnamed non-trivial constant)
>
> > +             if (cg_enter_current(children[i]))
> > +                     goto cleanup;
> > +             in_child =3D 1;
> > +
> > +             cur_before =3D dmem_read_limit(children[i], "dmem.current=
");
> > +             if (cur_before < 0)
> > +                     goto cleanup;
> > +
> > +             if (dmem_selftest_charge_bytes(fail_sz[i]) >=3D 0) {
> > +                     charged =3D 1;
> > +                     goto cleanup;
> > +             }
> > +
> > +             cur_after =3D dmem_read_limit(children[i], "dmem.current"=
);
> > +             if (cur_after !=3D cur_before)
> > +                     goto cleanup;
> > +
> > +             if (pass_sz[i] > 0) {
> > +                     if (dmem_selftest_charge_bytes(pass_sz[i]) < 0)
> > +                             goto cleanup;
> > +                     charged =3D 1;
> > +
> > +                     cur_after =3D dmem_read_limit(children[i], "dmem.=
current");
> > +                     if (cur_after < cur_before + (long long)pass_sz[i=
])
> > +                             goto cleanup;
> > +                     if (cur_after > cur_before + (long long)pass_sz[i=
] + page_size)
> > +                             goto cleanup;
> > +
> > +                     if (dmem_selftest_uncharge() < 0)
> > +                             goto cleanup;
> > +                     charged =3D 0;
> > +
> > +                     cur_after =3D dmem_read_limit(children[i], "dmem.=
current");
> > +                     if (cur_after !=3D cur_before)
> > +                             goto cleanup;
> > +             }
> > +
> > +             if (cg_enter_current(root))
> > +                     goto cleanup;
> > +             in_child =3D 0;
> > +     }
> > +
> > +     ret =3D KSFT_PASS;
> > +
> > +cleanup:
> > +     if (charged)
> > +             dmem_selftest_uncharge();
> > +     if (in_child)
> > +             cg_enter_current(root);
> > +     for (i =3D 3; i >=3D 0; i--) {
>
> ditto with ARRAY_SIZE
>
> > +             if (!children[i])
> > +                     continue;
> > +             cg_destroy(children[i]);
> > +             free(children[i]);
> > +     }
> > +     for (i =3D 1; i >=3D 0; i--) {
>
> ditto with ARRAY_SIZE

I'll address all the points raised (here and all the above).

>
> > +             if (!parent[i])
> > +                     continue;
> > +             cg_destroy(parent[i]);
> > +             free(parent[i]);
> > +     }
> > +     return ret;
> > +}
> > +
> > +/*
> > + * This test sets dmem.min and dmem.low on a child cgroup, then charge
> > + * from that context and verify dmem.current tracks the charged bytes
> > + * (within one page rounding).
>
> I don't know, this doesn't test much of the .min nor .low protection,
> and the .current tracking is already tested by the above. I'd drop it
> for now.

Makes sense. I'll do that for the next version.

>
> > + */
> > +static int test_dmem_charge_with_attr(const char *root, bool min)
> > +{
> > +     unsigned long long cap;
> > +     const unsigned long long charge_sz =3D 12345ULL;
> > +     const char *attribute =3D min ? "dmem.min" : "dmem.low";
> > +     int ret =3D KSFT_FAIL;
> > +     char *cg =3D NULL;
> > +     long long cur;
> > +     long long page_size;
> > +     int charged =3D 0;
> > +     int in_child =3D 0;
> > +
> > +     if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> > +             return KSFT_SKIP;
> > +
> > +     if (find_selftest_region(root, &cap) !=3D 1)
> > +             return KSFT_SKIP;
> > +
> > +     page_size =3D sysconf(_SC_PAGESIZE);
> > +     if (page_size <=3D 0)
> > +             goto cleanup;
> > +
> > +     cg =3D cg_name(root, "test_dmem_attr");
> > +     if (!cg)
> > +             goto cleanup;
> > +
> > +     if (cg_create(cg))
> > +             goto cleanup;
> > +
> > +     if (cg_enter_current(cg))
> > +             goto cleanup;
> > +     in_child =3D 1;
> > +
> > +     if (dmem_write_limit(cg, attribute, "16K"))
> > +             goto cleanup;
> > +
> > +     if (dmem_selftest_charge_bytes(charge_sz) < 0)
> > +             goto cleanup;
> > +     charged =3D 1;
> > +
> > +     cur =3D dmem_read_limit(cg, "dmem.current");
> > +     if (cur < (long long)charge_sz)
> > +             goto cleanup;
> > +     if (cur > (long long)charge_sz + page_size)
> > +             goto cleanup;
> > +
> > +     if (dmem_selftest_uncharge() < 0)
> > +             goto cleanup;
> > +     charged =3D 0;
> > +
> > +     cur =3D dmem_read_limit(cg, "dmem.current");
> > +     if (cur !=3D 0)
> > +             goto cleanup;
> > +
> > +     ret =3D KSFT_PASS;
> > +
> > +cleanup:
> > +     if (charged)
> > +             dmem_selftest_uncharge();
> > +     if (in_child)
> > +             cg_enter_current(root);
> > +     cg_destroy(cg);
> > +     free(cg);
> > +     return ret;
> > +}
> > +
> > +static int test_dmem_min(const char *root)
> > +{
> > +     return test_dmem_charge_with_attr(root, true);
> > +}
> > +
> > +static int test_dmem_low(const char *root)
> > +{
> > +     return test_dmem_charge_with_attr(root, false);
> > +}
> > +
> > +/*
> > + * This test charges non-page-aligned byte sizes and verify dmem.curre=
nt
> > + * stays consistent: it must account at least the requested bytes and
> > + * never exceed one kernel page of rounding overhead. Then uncharge mu=
st
> > + * return usage to 0.
>
> The lower bound makes sense. Could you explain more about the upper
> bound and granularity? That applies only for the test module or is that
> intended constraint for any dmem-charging driver?

Uhm, the upper bound was modeled on test_memcontrol.c. Those tests
cannot match memory.current exactly, so use lower bound plus
values_close().

But for dmem, it isn't necessary; it accounts for the requested size
with no page rounding or extra charge. I'll fix that and check for
equality.

Thanks for raising this.

>
> > + */
> > +static int test_dmem_charge_byte_granularity(const char *root)
> > +{
> > +     static const unsigned long long sizes[] =3D { 1ULL, 4095ULL, 4097=
ULL, 12345ULL };
> > +     char *cg =3D NULL;
> > +     unsigned long long cap;
> > +     long long cur;
> > +     long long page_size;
> > +     int ret =3D KSFT_FAIL;
> > +     int charged =3D 0;
> > +     int in_child =3D 0;
> > +     size_t i;
> > +
> > +     if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> > +             return KSFT_SKIP;
> > +
> > +     if (find_selftest_region(root, &cap) !=3D 1)
> > +             return KSFT_SKIP;
> > +
> > +     page_size =3D sysconf(_SC_PAGESIZE);
> > +     if (page_size <=3D 0)
> > +             goto cleanup;
> > +
> > +     cg =3D cg_name(root, "dmem_dbg_byte_gran");
> > +     if (!cg)
> > +             goto cleanup;
> > +
> > +     if (cg_create(cg))
> > +             goto cleanup;
> > +
> > +     if (dmem_write_limit(cg, "dmem.max", "8M"))
> > +             goto cleanup;
> > +
> > +     if (cg_enter_current(cg))
> > +             goto cleanup;
> > +     in_child =3D 1;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> > +             if (dmem_selftest_charge_bytes(sizes[i]) < 0)
> > +                     goto cleanup;
> > +             charged =3D 1;
> > +
> > +             cur =3D dmem_read_limit(cg, "dmem.current");
> > +             if (cur < (long long)sizes[i])
> > +                     goto cleanup;
> > +             if (cur > (long long)sizes[i] + page_size)
> > +                     goto cleanup;
> > +
> > +             if (dmem_selftest_uncharge() < 0)
> > +                     goto cleanup;
> > +             charged =3D 0;
> > +
> > +             cur =3D dmem_read_limit(cg, "dmem.current");
> > +             if (cur !=3D 0)
> > +                     goto cleanup;
> > +     }
> > +
> > +     ret =3D KSFT_PASS;
> > +
> > +cleanup:
> > +     if (charged)
> > +             dmem_selftest_uncharge();
> > +     if (in_child)
> > +             cg_enter_current(root);
> > +     if (cg) {
> > +             cg_destroy(cg);
> > +             free(cg);
> > +     }
> > +     return ret;
> > +}
> > +
> > +#define T(x) { x, #x }
> > +struct dmem_test {
> > +     int (*fn)(const char *root);
> > +     const char *name;
> > +} tests[] =3D {
> > +     T(test_dmem_max),
> > +     T(test_dmem_min),
> > +     T(test_dmem_low),
> > +     T(test_dmem_charge_byte_granularity),
> > +};
> > +#undef T
> > +
> > +int main(int argc, char **argv)
> > +{
> > +     char root[PATH_MAX];
> > +     int i;
> > +
> > +     ksft_print_header();
> > +     ksft_set_plan(ARRAY_SIZE(tests));
> > +
> > +     if (cg_find_unified_root(root, sizeof(root), NULL))
> > +             ksft_exit_skip("cgroup v2 isn't mounted\n");
> > +
> > +     if (cg_read_strstr(root, "cgroup.controllers", "dmem"))
> > +             ksft_exit_skip("dmem controller isn't available (CONFIG_C=
GROUP_DMEM?)\n");
> > +
> > +     if (cg_read_strstr(root, "cgroup.subtree_control", "dmem"))
> > +             if (cg_write(root, "cgroup.subtree_control", "+dmem"))
> > +                     ksft_exit_skip("Failed to enable dmem controller\=
n");
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
> > +             switch (tests[i].fn(root)) {
> > +             case KSFT_PASS:
> > +                     ksft_test_result_pass("%s\n", tests[i].name);
> > +                     break;
> > +             case KSFT_SKIP:
> > +                     ksft_test_result_skip(
> > +                             "%s (need CONFIG_DMEM_SELFTEST, modprobe =
dmem_selftest)\n",
> > +                             tests[i].name);
>
> I'm worried that the KSFT_SKIP from a subtest might be too broad for the
> modprobe prompt.
> Perhaps you can check it by stat'ing DM_SELFTEST_CHARGE before any
> subtests start?

Agreed. I'll stat the helper in main().

BR,
Albert.

>
>
> > +                     break;
> > +             default:
> > +                     ksft_test_result_fail("%s\n", tests[i].name);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     ksft_finished();
> > +}
> >
> > --
> > 2.54.0
> >

