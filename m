Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793060150;
	b=3h9J7zjckm5BytoK0v616ioNqcqkW38wJgM+HCojYbxNAN1s9Bhl60vSVYe6HxzTYuab
	 a5wLsSQsfNkQh2Xgmi51+RNaypAqWwtOoDeX/EuMtBkADFaOvEbHioD4TivTd3DGt46H4
	 kIoirpC1bOCGTdBINUSxBhmkMtGWcGNzpPKFduiDiRXSL8VO0wknG9JskEWW9A0dezGpp
	 pQaPCPg6wnGaXfPw+GCuk38Mek6f3aUROTwZNinIHZXyDXoy1VwM5q6ANC2d9lw6WYrzi
	 i8s5c9fzpXTUjA/xq0hXYjOKJe/umap4EH3D4jDPdH9YgAyn3+sokthnW8NPABFHzyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qKeQmKdHS147YBCUhe6/TQHxqYO/kgxJinnL8fZRSJA=;
	b=Z0nTknDFxOr/K9rPjUBeJq5pGdDJwNqApiKqpp36rezEKKbWKTKCBu6s+62hj3xr6rz7
	 Rypz1hjRg8uPixaRx8PNlrfY3GHsV+6gn+FQnTFjzXnT+zd7Eop40wgcBL9Dfrlv0gkaH
	 AzYpNARMAFi5W4uhod8H7Tr+FY2DeS7HFTlbXFuvLR7Cl4sbhG3KLxSfIWA85Bs1BnWAr
	 M+LR7IuTkE4GWeqMgyi4SkZyiFy9W1U2vIS/yIIPSUKbIrx3h7WrJckftAD5ybNoQyUke
	 /WvBmMKySfTQnjOAXSgllpFN5e1MwWm1EMW8FgTXw/wJZSFHf6zj9GiZ6KAni80TIug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0Wfg3DQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BE0606A327
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 00:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46BE0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0Wfg3DQ
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8acda240937so29012457b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 17:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793060148; cv=none;
        d=google.com; s=arc-20260327;
        b=h1bAg0rcvld6R64h9KaXdzwFe2v5NRSU6TQFHeM+ozpUFFcjF9Zg50XyV0lNdMed07
         5azSMp5MqV/RnJsYxr2auh4eviEESt1Lb0tN4+To+WGZe0D4JRsHbKigr07f48/6Gz0q
         pRdlm3R/pMJ3Es63uSx3k4H6XolfgjzMZBSr3dkGTFKYTVy+5V1tzdoq1mFonyQTgxEt
         Sv5SFrfXvRbycgLXvlBE7RbuWb0BS5UzQK5hQP83DUwtYWOzvNrC10lMUGcLROZTzieB
         SgnE1Y9z6izlihSSQWtW8IsK0xiPlClOgyfr4N/fVRV5dRF2ubW5G5MjkcQYnoGyWuyW
         JSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKeQmKdHS147YBCUhe6/TQHxqYO/kgxJinnL8fZRSJA=;
        fh=m01qFk7q4KvxR03dkdFEE9EF9PSuvTj+9h4Hun+Hl20=;
        b=RnqxEUZUzuQFhxpgRZrJyAgNvR7xdbGVcMdOWF3HiSaWYZNOQv/cg958CofLRZvxvJ
         tsfr9FUmBx9ATedWV5ZYN1VOPUZiwPDi/kNjHJWbNmk2/czCmGgRiWAW9a70wNLFqQV2
         vRRRDnqgoLR1nTtmVwESSLNcDQVXPrL8ksP8BcY0cNMAiUstSsjv0MOtxh+7CjgueV+N
         GHYOpspdfhkZ9bm1Blfuz+nVguRD/LOCvluEv622Pd0bMnEfWcgQOcY2o4gpyFOIDoLi
         tLioEk+fR8Xy/vPDcptXbmLC4OoPTPDBdAkmRzyu0jZ6FJ/Zvy4SGlIWKlhYp+Z+JROb
         8NSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060148; x=1793664948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKeQmKdHS147YBCUhe6/TQHxqYO/kgxJinnL8fZRSJA=;
        b=s0Wfg3DQSfdPBtgTrPJ7hEq4HUweU0fxNhhrERYXULKUVGjvojByBZj8KKVt7nRxU+
         qfuMSheIJo5HVMHmH35pJ0m4FosgwDQvoFqO6hWdyPRkiWPWjpgGD4+44lYarYwcj4p9
         lwGrCp9TiIJ7Y9Q7o3VLX5IDHtJph2ZfYWK9hb7nwFZcN/EGzSOwKwJdiqW4e4tKM19a
         TwcHswoqbtz3QUq2JqUArNS2ontBIM0U5Az1Xxt/qvNOY6jlotL5RVH54V4eQYaO9/UJ
         cfXBJNeZLYP/7FfHZRk1FnPXiW2XAqkAAz+W61A369XeoogwEs/6FcBTuT08s5U96hTP
         UsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060148; x=1793664948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKeQmKdHS147YBCUhe6/TQHxqYO/kgxJinnL8fZRSJA=;
        b=uyHLs+7fNMYcr1buL+ppqIYTJ93GAxcxeqd6KkWO+qu5YJHjKNGUNlHPg+IWR4VJKc
         c0ivqko9jr9WTYMpuawtQiNSfEsVklmoZLDJM3I80LK8gaFWcHutTeKwmQ2+mNAT3deS
         JmwNA2UdHndFv7S6xn7TT9BA88RDwAZz1Lz1e4ptwRHiHXzI1dVBJWSsERJVkO6ERsWF
         SiOi1nsu7Kbue5IabINl4TXIq6I1ThYpwCjdliZpIVBRP+KtPGynJeaRnX8yK21ddZUb
         Q9MfH0BZa53nM4hp58FHUrfWoFM7kSMWuaVLkEkfUUVlp9BQIaCDDjRapXUpmcQeSiHp
         HKWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSpxvsUdiSnnYLahDaZqzoxdN2214SPQ7nZC6miw6bJMVUzOTVzLGzVTLji+DXUpfMUlyquk/p532yKEcMvM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrffG+VPfAb9jY9Wjno0wROdjQsmhU4s6VGQpuXsPVNlSlk3cN
	bKTy42NcGgH44pzdlT17OAsJH/Mznd7nmk25QiM8LKw9BqK1ZY7AAP05EM1kKZNOTvb8hBn40QK
	4uMqCLH4TyJOlrxyaZtquWpQlm9RuVug=
X-Gm-Gg: AYBFou30LmMyNJ6GHByTtkKx9DrUghe8iAXiDY9EcCMPxHI5RRlWUNtncIMj7nyxSH9
	s0xUxQl+DOAEUeFLMHCel7fYxH2CL0m1Xg9uGvkIzIutSIAh06kSQUv3PUjJxxxWb78/aADzto9
	S4/7etK+qnGeZktK86iS5IXoYeTmZnn2+NXdERKUilZSRGEn8YOxwDc3cCYax6aI8PxeZMbfGwE
	9vcuCU2MkZPoP+tXm7uIf9Jn/vrtH3O/MVlu3P4bOmgPiIxyNim0iZheGzrHZBXFUf74tW5NT+S
	AN1VsRlZH+0iYKYmH5uypYT0q6gPyHSn15aWqnPY0T8olydK30IvomUadOKL9Q5oaTD84xEqrBD
	8hL8yYujbJN5/O2/mKjl2cPmKdOYXfV1PblF97v1SuCyx8GUPT5sF0Kz7AJ2G35LAGFzfAATUBV
	IGbdIcdB3K4xW+3Ec=
X-Received: by 2002:a05:690e:150f:b0:679:c803:98d1 with SMTP id
 956f58d0204a3-67a45496c6cmr4080476d50.152.1793060148265; Mon, 26 Oct 2026
 17:15:48 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com> <as4W9hToBqAvbzJ-@pathway.suse.cz>
In-Reply-To: <as4W9hToBqAvbzJ-@pathway.suse.cz>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 18:15:21 -0600
X-Gm-Features: AclHuK9LH_u23sCYiYKMz0I-9md-phfbwb6JA9KZbhXjHlVRGYmTapsg8H2JBYc
Message-ID: <CAJfuBxw-cq3AYXKZ07Y3732tDM-NYxt+rs8Fz6S=P7+1TF5WNA@mail.gmail.com>
Subject: Re: [PATCH v12 33/40] dyndbg: Ignore additional arguments from pr_fmt
To: Petr Mladek <pmladek@suse.com>
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
	Philipp Hahn <phahn-oss@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 5:33=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote:
> > From: Philipp Hahn <phahn-oss@avm.de>
> >
> > pr_fmt can be used to add a common prefix to any output from a module:
> >       #define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> >
> > But adding additional arguments breaks dynamic debug:
> > > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 arguments, =
but takes just 3
> > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > |                                                  ^
> > > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)       \
> > > |
> > > error: =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA_CLS=E2=80=99 undeclared=
 (first use in this function)
> > > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT=
, fmt)
> > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> I wonder what this error about undeclared macro means.
>
> > > note: in expansion of macro =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA=E2=
=80=99
> > > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));    =
     \
> > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > note: in expansion of macro =E2=80=98pr_debug_ratelimited=E2=80=99
> > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > |         ^~~~~~~~~~~~~~~~~~~~
> >
> > Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to slurp
> > any additional argument, which `pr_fmt` might add.
> >
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor=
,
> >               dump_stack();                                   \
> >  }
> >
> > -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)    \
> > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)       \
> >       static struct _ddebug  __aligned(8)                     \
> >       __section("__dyndbg_descs") name =3D {                    \
> >               .modname =3D KBUILD_MODNAME,                      \
> > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > index f594c1266bfd..5d701952e739 100644
> > --- a/include/linux/printk.h
> > +++ b/include/linux/printk.h
> > @@ -742,7 +742,7 @@ do {                                               =
                       \
> >       static DEFINE_RATELIMIT_STATE(_rs,                              \
> >                                     DEFAULT_RATELIMIT_INTERVAL,       \
> >                                     DEFAULT_RATELIMIT_BURST);         \
> > -     DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));         \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);         \
>
> IMHO, this changes the existing behavior. The prefix added by
> pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
> Is this intentional, please?
>

yes, its intentional.

515a9adce0f0 ("include/linux/printk.h: include pr_fmt in pr_debug_ratelimit=
ed")
added pr-fmt to both the METADATA macro call, and to the printk() just belo=
w it.
The commit-msg was clearly about adding it to the __dynamic_pr_debug() itse=
lf,
the METADATA addition was overzealous.

Removing it brings pr_debug_ratelimited() into conformance with the other
*_pr_debug_* calls:
    dynamic_pr_debug, dev_dbg_ratelimited, net_dbg_ratelimited.

and as you noted, this makes the ... variadic unnecessary.

Ive added the Fixes: tag accordingly.

thanks for the review & pushback.
and apologies for the delay, I picked up a FLU shortly after sending v12.




> Anyway, if we do not longer pass pr_fmt(fmt) then we should not
> need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().
>
> By other words, we newly pass just the format "fmt" without the parametes=
.
> The 4th parameter was added by pr_fmt().
>
>
> IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
> BEFINE_DYNAMIC_DEBUG_METADATA() and
> DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
> to accept var args. I would expect something like:
>
> #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)  \
> ...
>
> #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)           \
>         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt,=
 ##__VA_ARGS__)
>
>
> or maybe, we could "eat" the extra parameters in
> DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
> DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
> DEFINE_DYNAMIC_DEBUG_METADATA(), aka
>
> #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)           \
>         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
>
>
> Or do I miss something, please?
>
> It is possible that the macros work another way. Or this depends
> on another change. I checked only this patch...
>
> Best Regards,
> Petr
>
> PS: I was curious what Sashiko says about this change and it seems
>     that it does not review this patchset from some reasons.

I checked shortly after sending, it was "embargoed" for 24 hrs,
perhaps cuz it was so soon after rc7

>
> >       if (DYNAMIC_DEBUG_BRANCH(descriptor) &&                         \
> >           __ratelimit(&_rs))                                          \
> >               __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS_=
_);    \
