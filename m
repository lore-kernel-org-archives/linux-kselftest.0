Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793138883;
	b=vJq2xNza1ltiYMnT5uw5DxZFv9sPUQG0PaYrEP4X3dbc4qy4HO/RdJsGE3laN12AmzcD
	 mSM5SONAVHNRq17yWz3t75hb0flqIevSnRlUbI/RyT96Zum4CqgWqJKnJwVG1JsrMcXin
	 9TLLMYRRpYXD29ctCvMQwrUmb8MsKr/XEGNE2CqpA6r3m+HFmMg++VnJnFOJrQ9m98kLA
	 p8Z3VAjzSGRhq2Y8H+6Tir6bItSUHuk45RMW1vBfHhXwUfN5c/K+4un2NIQe+Zrbiz16v
	 +KzGCbuArRMduHMf2LwkXVC1pwamlYhfmMTfoibQsLor/XRz10kFCYjknim04j2YSHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
	b=Ufgv+ouRty1PlD9x66NbPy0jnNn6Njp++gZd6XwRDOgwbqxasJwWDOEuD+Kw/xXGEvPB
	 sWrZ+pqsmGLrsBygxyIR3jMOACbMrl+dIp7slOSYre2wvukem6V4WdESevjLUufCiDHN1
	 dLGYlGjo7hSmVsks9JvkCLAUvxWKvXOj/BZ3af56zNj9qfchBuDR5O4fV06jug/mpO6wh
	 Bj6/WhgnyZB42Pk6sDOnhLp3q9Zzx2AufPrk0bAftKggKsJhnLiVwduzK97hs8icxtral
	 3MEPjZN8JSE0q+JMjOVZdx2Q+jgLSf6kRT/QYC3ItbgIskBF96e4v0Qf2/N7t86BNsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JndHwKJi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3358606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 22:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3358606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JndHwKJi
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c46bd7a7345so62470266b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 15:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793138876; cv=none;
        d=google.com; s=arc-20260327;
        b=neO6cqqq0D7q/sSnASsbmsFlWSYm1TYxO6Z9x+esEwdSu+svXFd4vFZsdIg/lb6S24
         A5k0decETl7NLx4HoLZItQ6zmMT86l2Cw0Mbprdu65JetaoY0Rv0B7mNG48HcMcyvft2
         0rUQ4uXTJZmijKJ3LnWzlE6/qpK/5DxwDJhOS7ao5zP49x54pVHgneR6zDnUKTuTESpA
         mWb96PHqvssTY0qnepRVw5ubu7sO/S0S4aO1EBPkpTiwiPbtkjkuTfMV2LJgjsuR5Ekf
         IZo36jhx3CRTl7W2M+6YP7pCw/N6/tsq9bmeqpG9Y4jVHxLSaf7HoBhWGUegH8JPbFWd
         9c7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        fh=1b+cM6FGWUyhLKoY/AyP6I2qKuwxxytWJwYTY+g07lU=;
        b=eoun3kL5e3qJG4Zq25m/SxWSBClVOOwgdUTq+nJHDws7zS8Kcfdd0MNHXZ6is6lSPp
         InVHAUvo8oHkgh8CxZvUBOoVq4r9cpKKp0oe+hNoA6SoIP6GOiToTG5lkPLtiHKbD8mt
         igZzE8vJ5yBI2sEixYq1bCCMBq6ZtVSDW4MUkKOU3mxJOIcrvPS5HJMUL0TX8fyH0XAR
         sly1jlGYd3f+pIQt2B59dKijQ2FZVq3GN97UrPC664fSKwWhO2qlZZYzTdwAuGtJajdd
         ZjdrBA/CU/VAIgARpm9wPdtyHcwgEUzhE1rk1A+MWJNBSKgxsn7do2yf/e90tcB6i9VL
         scxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793138876; x=1793743676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        b=JndHwKJiqoQdimfnFC/tOH0NOP9CxQKxSiHFIN7R0ytrfsF1otC25j8OT21ypOBaw0
         SeH274c5gs94bjO0YMSWpQNXnGDmaTecGn12SItZKlKn2t20O71XSnnuJyjslHTVxzrE
         aAuZ1VDMdN0s8JEith1PGtfJvP5bQ3t6fw0A06t14GU6kC17bHFf55OjmQW375eIxizr
         i2JTJ5g1ClaP/isCuqEeFHpCWCC9L8W2JDWntColXyJVJbpXJhsN0FnMsx/BvsZ43C79
         9prCEcfErHTtXqtmR20XD7L0Eg4tfpbIY/LNsw94YqE/9dDt2m4t1kDcuTu9qRDguQ/g
         fS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138876; x=1793743676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        b=r/L2ahtvnzsVw5AxcCjEFbAY2t69Y7K/HqAvXmCnRkL0uQdq/XV0M0M0ySaTYkwvcn
         ChzWhwSheelHWD1q+cI1Szvxv2sy5PGqwM07AJDeG0nlCfKiCsck5idHSVjRlddARWk9
         tWquUesyNm5YiYvBEcacqz/PuNtAdEX/w1i6FhZ8ydYNBEvQbYFLz3Q9w5WbmolG6VL3
         RbPJRnRR9Z60m8t+mRXYEdxM2S0c4LnTW3kQQ0AWpPkuZIgZyBfbM/2ltLgg1QMT2R3S
         zgyYpdXO73FoFY/PeQrWr4UXxCwIGa6s7hy8h7woKw2PjY5kIROdSMP64IiEBfoZBxfO
         VFyw==
X-Forwarded-Encrypted: i=1; AKwUvBzfuZ86f6xji7VEwOqpbjklcFkwSysLM9KYz39nbYXNwA5qkeMyJRZqB4b02whGJvVsUYCTeNF3ZgwLMdfGgeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGblN/qwKnxrnmz7l03Cn0X04Lu0qK/J6SxjJ2LvUO7TYXfSXo
	0XQdm2B4r7uA7b3LBzROWIHRo+fyFV+7zu8kFInbcEXwgp/4SuIFUpuv/MuQeORMPrhgLtqnRUT
	M1eXGv51OoX3Xbpg1hF0aEc6pTIplKwRXKnFsdbRy
X-Gm-Gg: AYBFou0T9SgGB7KnleaKTSJLPMfTLVJlo4B6zI+3oJTd9H6Nx3HN0ijGtgVOUScb+Ni
	8pJUWz581K9WaNFcH2dWmb7cqQZRky5kRg41cTv+sAshXIer+ocGjwXEVINbTHe8TD2pByo4y7j
	fQblrdTJD2h6ADtx3VVcrx4i24tRJE9rZyFxETRA+hX4HA0VtXMn3qJjXrllZD2Sy0KCjyIEJL8
	LJmPiBT7q3kJ0WP3CeWC6HWO9xQTBat8blzHGy9y8989R14qxU6IFp1HGOsItAo1fE/S/3iquI1
	I5ub3e4U3DGnWvS5+4eyS+PgrTOtaw3gV0MBn6h0kymCSi0U8gjvlNBuD7sjJZSmm6l72y5ccKQ
	sFEGfB36w0gLBU6V7e9I1EKyixIkqk7aACJLEa0e3buuPFsKu1kZRx3P/xtQDwr3hU9s+hwhRFB
	dqWKigMsWmZmVb
X-Received: by 2002:a17:907:97d5:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c49bd9e20e9mr50496066b.0.1793138875790; Tue, 27 Oct 2026
 15:07:55 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-12-wusamuel@google.com>
 <at8dNNb4vwovNZcZ@krava>
In-Reply-To: <at8dNNb4vwovNZcZ@krava>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 15:07:44 -0700
X-Gm-Features: AclHuK_4ySi3E2heiJLIOqDTOIX20dmWcYWcaizjPHfB4zOsCZlZ7RMy9jhhzuA
Message-ID: <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
>
> SNIP
>
> > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > +{
> > +     struct kallsyms_query q;
> > +     struct extern_desc *ext;
> > +     int err =3D 0;
> > +     int fd;
> > +     int i;
> > +
> > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > +     if (fd < 0)
> > +             return -errno;
> > +
> > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > +             ext =3D &obj->externs[i];
> > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > +                     continue;
> > +
> > +             q =3D (struct kallsyms_query){
> > +                     .size =3D sizeof(q),
> > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > +             };
> > +
> > +                     err =3D -errno;
> > +                     if (err =3D=3D -ENOENT) {
> > +                             err =3D 0;
> > +                             continue;
> > +                     }
> > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > +                             pr_warn("extern (ksym) '%s': resolution i=
s ambiguous\n",
> > +                                     ext->name);
> > +                     break;
> > +             }
> > +             ext->is_set =3D true;
> > +             ext->ksym.addr =3D q.sym_addr;
> > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%ll=
x\n",
> > +                      ext->name, ext->ksym.addr);
> > +     }
> > +     close(fd);
> > +     return err;
> > +}
> > +
> > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
> >  {
> > +     int err;
> > +
> > +     err =3D bpf_object__query_ksyms(obj);
>
> hi,
> we could also add similar support for libbpf_available_kallsyms_parse and
> probably in some other places like bpf_get_ksyms.. which makes me think i=
t
> could be useful to have KALLSYMS_QUERY support for multiple symbols
>
> thanks,
> jirka
>

Thanks for lookiing over this Jiri!

Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
number of tracefs symbols, and n is lines in kallsyms, with n >> m.
But AFAICT, libbpf_available_kallsyms_parse() would only be called in
pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
functions with addresses in available_filter_functions_addrs); so this
ioctl could never be called.

And regarding bpf_get_ksyms(), it loads all traceable functions and
needs the full syms table, so a /proc/kallsyms should fits better.

I did profile a slightly different form of querying multiple symbols
at once [1], but didn't see much benefit. struct kallsyms_query is
extensible via size and query_flags, so we can update in the future as
needed.

[1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ=
1wSm7sJ1w@mail.gmail.com/

[...]
