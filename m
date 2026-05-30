Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6E296BCB
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 00:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101767; cv=pass; b=Ij8NJa0HAog0sUuxx36pOlI48pUjZ/HT1GlIGzDvuEtV1LrG9zoJRdxmkxtrDf/iBgkafBqONKcVZwgVQTfykp7eTBtyqCytkGxUQoN7YHjk32TaiqdiKYu2Pv4HVlMJ40pmfouquL/Uh4aA7f4YrVNclQKgvBS2GdzQ9Q2FsLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101767; c=relaxed/simple;
	bh=/5hCjxhlblu/dDXbaNzug8TLexppU7uEC3A76MTRqK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUmAGA9lW8WiSk9gfWjRxk5NlN9k50kpKT8EnHIKJcGj1ygkZLAqtS3DW9uAVXCcGQtJQ5jJZ0Q1q+7p1yLb50EgoOV+RWpRIxlnOwbxaZunV0TAKtNyN5M3Z/bHGCFHH4zPMQJcqpN7yNrHeIlanhurIzd6yAlWjNurN6U3CXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ndRGDEmc; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ndRGDEmc"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65eb226b1ceso8946168d50.0
        for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 17:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780101760; cv=none;
        d=google.com; s=arc-20240605;
        b=G/ZlhdH4HoDAtarRSXXRODgZn6eWru0p7hAfLBkzE/QXDnr6lM+XbZDq2KqFIMw1gj
         nouRB7QAfaIrUjxCu8MVdxsVtoUbcKGLFmTt83UXnZuclyZ2eIRk77qTqbxsqWdygdeD
         ZO9meBEMF9U2L9Cu+p4dUXE0mj7SuX/Awh4q04T62yk+Mw6bBJHOCrK3w5sM89TSgXU9
         uswfCdh1+qBGkflcQ6xaoV63VLFXLHA0miUstxQ+0SCJbNwQBqAp8xh+7HwxVm5toCE0
         Amxjwammj2kpxsPXgC/2ZNp3UbCFCqZdnq1/apw1iADSC7fJu7ROFzhur3WFoj5i4DOx
         qdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9C6pC6G8jgQw8SEpFdd3tqY/qCEk2540e42V0ZevSno=;
        fh=3s5F6xjWlhRx7KCyq5RfAFWpdWlb/75nHtpfJek+sGU=;
        b=Pc4Hk063FTe3P2zvh8sCIsE8ke5p/MuCOpst6eKPiyenJjs66Wrf2Ow6Dd2JDH8584
         gIyxMbQQE+/0mddzuxKDJK5YBhHaRLwZs7nF/2y4hTEHeLLKvZOIUFy4UUPLhe/vciq2
         ubOTdQWgQ3c0OKlK8oq/yzQagRTlw0VdaI5PHmsZVVe8dN9zlwL/3qwDgqrVQaaVMEOL
         hu0nIBhJGDBSo1A3kC+VxZ5uUpPIP6hWTgRvRNUoitMOd7JlprpiBMSU8z5lkX/xZ2I0
         9TRbK3fhOvlPDEbe23Gqg08C5SwUbSF9puA0tJ2TiVRl9k3tbK7bOg1W0WxH8z1M0uqV
         u/zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780101760; x=1780706560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9C6pC6G8jgQw8SEpFdd3tqY/qCEk2540e42V0ZevSno=;
        b=ndRGDEmcMS8m1gf3t/4lh9/7t0pDux+9viZ7kJ9bR+EDtuJsSFFFiksxQFI3uz/o8G
         f3HTIQtrcHjQpIffkMhhnDIAqB7wRdUt5KWK40x/lEoTnKAAz3gJ7H8HQRTV5vfkMqfx
         gcekgRx19xcqJ2N63kUWmX3P+GFGz1wVQvqx0pcJmcau8pJugYlX1A847j/WZYqj3RDD
         K3C68TKvSY7gJibeJXjzm2w5muAZ4FpxgiEtYOqn9lG6DngLmcKf5EPqpKAWhFQWuqX4
         NXWbp21Ya5vjsx4JPP0TrdoFR1DOINmf/SdyQSEA9Qz0iQh/dTP1kwXC/UeHWjHNJghu
         4X4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780101760; x=1780706560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9C6pC6G8jgQw8SEpFdd3tqY/qCEk2540e42V0ZevSno=;
        b=ewIvk57esteMIf7DoFp92eTJSkvMVmFMEiY0Zc5w8jwY4OdQ+KIIWEyHRix1ceXBCY
         ls2yn1Nll4F/SGgV49t4tGxXpYshtc3KWC64jnRxlCdDaESuJ4JPsOQJaCtwNp2vS8ZQ
         LMpNj5bf+6wFr2I1QGqjVRzPl+AgonQbjAVf3JrskqDnE0wyVCdLIPxthWnIQHurfijc
         s6HEp3OLvTJmNAER2C67gtN9sxjvRKLc32/lkZoNQDIBVFNA7Vl6cD9WV4yuV2hODzvA
         pPUiro7R91Tyec7GzNw2570fm2TReXVUy7sI5eI9ztw0hQbaw3ukw4aFHQkP+ZF1AjTd
         i0ZA==
X-Forwarded-Encrypted: i=1; AFNElJ+I1B4Ppu5iusyamJP3aM+xBofQOMU1Z3K/+cZBtOQpGwIzyYMVFdTKZ9plk0UY8zxNZo90GfjCu10DdS1C8hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdqi/gAMW1MFgndGEkplO0LyKZOvMdpKbkG9cGXu5Cj2HLjDpd
	YwH3Q2/Ik0RoIra0hraWJ+bwmGa+YpZo+uuIolLJ2klQMorM5EWWdRUfdKCdIquob8gpC6hmv/T
	cSfLbKrg4rFtyADXZPP6J85ZZiLtFs7z6sHbyfmGpPg==
X-Gm-Gg: Acq92OGwKTLidzR1hRfC9A5i7j64KauODMCk2z+k+BTGIhLjxL8H9NC+RaNCCgrAwpL
	cuqkynUzKE1FYzuwvR7g5q8iRKsmalz4YdINjNNbqwAtI7A2NLU/FJ0sJpoA0B+zdPgvzW1dTum
	ZB5k4QyWPS4MMhFIztd2CTNGoyBmHI94Z9ltDW237lDaiVXNkcqqHpKVDOSjZShoR7f8dtAhScM
	xcqww+7GKGHahXLqIA2YkyDkds1NURQy/tG6MVq2YJRvUhMS0gkeigbRTSYGSxwlTZFGXNKZ4ML
	L/pkOss2FaEQCQANPuhqOnVM/yrKazTvJkuQOemH5i9DaUqxka4DAv5ws2hH/Jkpehg=
X-Received: by 2002:a05:690c:480b:b0:7bd:9566:ef0c with SMTP id
 00721157ae682-7e05ea4cc3cmr16766257b3.26.1780101760314; Fri, 29 May 2026
 17:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com> <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
In-Reply-To: <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 30 May 2026 08:42:29 +0800
X-Gm-Features: AVHnY4L-oTZDn7xRb_-W1DfskfLnWnQK7ds7jlg7EeJxNaRDPoWxDaghmy3erNI
Message-ID: <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
	Christian Brauner <brauner@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Guodong Xu <docularxu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Drew

On Thu, May 28, 2026 at 12:35=E2=80=AFAM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> On Mon, May 11, 2026 at 09:34:53PM -0400, Guodong Xu wrote:
> > Introduce a per-hart and host-wide bitmap of conformant ISA "bases" --
> > named profile-class sets such as IMA and RVA23U64 -- and compute
> > both at init time.
> >
> > This is the cache that subsequent consumers (hwprobe's
> > RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
> > read without recomputing.
> >
> > riscv_init_isa_bases() iterates over all possible cpus to populate
> > each hart_isa[cpu].isa_bases, then computes the host-wide
> > riscv_isa_bases against the AND-across-harts riscv_isa bitmap.  It is
> > registered as a subsys_initcall so it executes after
> > core_initcall(tagged_addr_init), which probes senvcfg.PMM and
> > populates have_user_pmlen_*.  Without that ordering,
> > riscv_have_user_pmlen(7) would still return its default false and the
> > RVA23U64 detection path would always bail.
> >
> > The detection itself is encapsulated in riscv_set_isa_bases(), which
> > takes an output bases bitmap and an input ISA bitmap.
> >
> > Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2:
> > - Implement riscv_init_isa_bases() that runs at system init time,
> >   after tagged_addr_init() populates have_user_pmlen_*.
> > - Split RVA23S64 placeholder into a future patch.
> > ---
> >  arch/riscv/include/asm/cpufeature.h | 14 ++++++
> >  arch/riscv/kernel/cpufeature.c      | 92 +++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 106 insertions(+)
>
> Sashiko points out a few things about this patch which I think I
> agree with
>
> https://sashiko.dev/#/patchset/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544=
f1dc%40riscstar.com?part=3D8

Quote the following from Sashiko.dev:
> Should this mask specify the individual subset extensions required by the
> profile instead of the superset extensions like RISCV_ISA_EXT_B,
> RISCV_ISA_EXT_C, and RISCV_ISA_EXT_V?

My preference is to leave the mask on B/C/V (and A) as-is. I'd prefer to
keep matching on the single-letter, rather than expanding them. Here is why=
:

- The RVA23 profile lists A, B, C and V as single-letter mandatory
  extensions; it doesn't enumerate Zaamo/Zalrsc, Zba/Zbb/Zbs, Zc* or the
  Zve*/Zvl* subsets in the mandatory set.

- In current merged code, hwprobe_isa_ext0() is already using
  riscv_isa_extension_available() signle letter checking for C and V.

PS:
B maybe a special one, just in case anybody raise it. As the community
discussed when I adding it into the bindings, because B comes later than
its sub-components zba/zbb/zbs, so, when I added B, I cleaned up all
in-tree dts files which declared zba/zbb/zbs but not B and made them declar=
e
both.

Link: https://lore.kernel.org/linux-riscv/20260115-adding-b-dtsi-v2-0-254dd=
61cf947@riscstar.com/
[1]

Also, in the bindings: extensions.yaml, a schema rule is added which requir=
es
a node listing zba, zbb and zbs to also list b (and the reverse). Moving on=
,
new dtsi/dts fils, a node with only the subsets fails dtbs_check.

One may argue that the schema check doesn't cover ACPI path. But again,
shouldn't the vendor who publishs RVA23 hardware be conformant to the
extensions wording in RVA23 v1.0 spec?

What do you think?

Thanks,
Guodong Xu
docularxu@outlook.com


>
> Additional nit below.
>
> >
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/a=
sm/cpufeature.h
> > index 739fcc84bf7b2..facc31b2960c6 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -25,10 +25,24 @@ struct riscv_cpuinfo {
> >       unsigned long mimpid;
> >  };
> >
> > +enum {
> > +     RISCV_ISA_BASE_IMA,
> > +     RISCV_ISA_BASE_RVA23U64,
> > +     RISCV_NR_ISA_BASES,
> > +};
> > +
> > +/**
> > + * struct riscv_isainfo - per-hart ISA state
> > + * @isa: bitmap of ISA extensions this hart implements
> > + * @isa_bases: bitmap of profile bases this hart conforms to
> > + */
> >  struct riscv_isainfo {
> >       DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
> > +     DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
> >  };
> >
> > +extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)=
];
> > +
> >  DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> >
> >  extern const struct seq_operations cpuinfo_op;
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 81145621dc378..6e8dd33aa3888 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
> >  /* Host ISA bitmap */
> >  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> >
> > +/* Host ISA bases bitmap */
> > +DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
> > +
> >  /* Per-cpu ISA extensions. */
> >  struct riscv_isainfo hart_isa[NR_CPUS];
> >
> > @@ -1305,3 +1308,92 @@ void __init_or_module riscv_cpufeature_patch_fun=
c(struct alt_entry *begin,
> >       }
> >  }
> >  #endif
> > +
> > +/*
> > + * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
> > + * conforms to, given its resolved ISA bitmap.
> > + *
> > + * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all har=
ts) is
> > + * used.
> > + */
> > +static void riscv_set_isa_bases(unsigned long *bases, const unsigned l=
ong *isa_bitmap)
> > +{
> > +     const unsigned long *isa =3D isa_bitmap ? isa_bitmap : riscv_isa;
> > +     DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) =3D { 0 };
> > +     DECLARE_BITMAP(tmp, RISCV_ISA_EXT_MAX);
> > +
> > +     /* IMA */
> > +     set_bit(RISCV_ISA_EXT_I, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_M, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_A, ext_mask);
> > +
> > +     if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
> > +             return;
> > +
> > +     set_bit(RISCV_ISA_BASE_IMA, bases);
> > +
> > +     /* RVA23U64 */
> > +
> > +     /* Zic64b and Supm with PMLEN=3D7 */
> > +     if (riscv_cbom_block_size !=3D 64 ||
> > +         riscv_cbop_block_size !=3D 64 ||
> > +         riscv_cboz_block_size !=3D 64 ||
> > +         !riscv_have_user_pmlen(7))
> > +             return;
> > +
> > +     set_bit(RISCV_ISA_EXT_F, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_D, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_C, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_B, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_V, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
> > +     set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
> > +
> > +     if (bitmap_andnot(tmp, ext_mask, isa, RISCV_ISA_EXT_MAX))
> > +             return;
> > +
> > +     set_bit(RISCV_ISA_BASE_RVA23U64, bases);
> > +}
> > +
> > +/*
> > + * Populate the host ISA bases bitmap (riscv_isa_bases) and each
> > + * hart's per-cpu isa_bases.
> > + */
> > +static int __init riscv_init_isa_bases(void)
> > +{
> > +     int cpu;
> > +
> > +     for_each_possible_cpu(cpu)
> > +             riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu=
].isa);
> > +
> > +     riscv_set_isa_bases(riscv_isa_bases, NULL);
> > +     return 0;
> > +}
>
> Missing blank line here.
>
> Thanks,
> drew
>
> > +/*
> > + * Registered as subsys_initcall so it runs after
> > + * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
> > + */
> > +subsys_initcall(riscv_init_isa_bases);
> >
> > --
> > 2.43.0
> >
