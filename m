Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239873;
	b=TZrQYlvmzZHIRJABqfxCMOWj/JQEQHwxpi/KNgufpwjqvp5PpEKHyJJj/HoyFoiCUPei
	 hH4Rc+juJDXjvMBSd1RnUag4lCF1xfT3LyaV5ZYKvrhARlLkF4WapankBclPSh+1a1jE/
	 Y4tkbHeWNHd1EK5zVEUCdlMnmCoFjHUVDyN4n1tj2c0cObXI4tFeSsFidwt8sKi7BvoXz
	 B37YeiMZYOy1KfqSAeeeke7A4grNxpUIUmUpFiV9+GmRvFesHtolnDXX8Ce4aMVPByZPJ
	 JBhXWoRHvDIphUIzTJKMvNcEvvpDISj73rbyhw/9ixmDbNjk6+oEdQY2CxotzAcsqBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239873;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-ZohoMailClient;
	bh=9W5U9MRLdiGXEzabQcr7VS1i+v+HHL0WqrvbrIzGW3Q=;
	b=5CE9BuCRc9vNl5mu5b4pLhznlOGEI/iamklGuGqZy6OdTDqwFODVjh4/YJK03OExDLGK
	 1FvPhheY5alR4Xsf+nAhMs/G6Z1Mrjw3DqLUWBpdcJmCJkdyB+75cAyDb+0olojjXLEnp
	 6uV8Tp9Ps/xwzvC9g4z1WFB9JR2nAO6dGFF5by5tzhf/FyNrV45abZ1uB//QxgIgolYAi
	 8vyCa1QdD8Ms7XK78xF1Jh33wnh1BsQpVLqp/Mc2xF49ngAZ7YcUHwTrdxErRJ/f1Yo4d
	 XlkznkN5O3Hgm8gFdgaCL4Dyl7ggr4MEcPYAB0p6cbT/yUNqE2+jI84/HVDFYtWvBzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icenowy.me;
	spf=pass smtp.mailfrom=icenowy.me;
	dkim=pass header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b="Zqa/eYBR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC87606A321;
	Mon,  9 Nov 2026 15:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC87606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=Zqa/eYBR
ARC-Seal: i=1; a=rsa-sha256; t=1794239816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OXNxm9K6TpVwKvnwPPPl3jqRoaY4ES0QKb2PPRjqXrNvo/HatRUvt4qGmFpc5pttihTZCVaFXzM5pGVjDONouhTDi5d/pWcX9RNfVrct0fShJ1r6uW/5odNwKbBZUwN6YuJKX4A1J9j1kBxXrEeJk+a/uEBAYlDLBlStE3ne4/A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794239816; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9W5U9MRLdiGXEzabQcr7VS1i+v+HHL0WqrvbrIzGW3Q=; 
	b=nnU3Az4/Y5XbPU0/MQjLSGBAmL1EhfPAp7cZ5niPHmOGRYMEB8GO2BSnUu8zEmpE4LrLmW5F+8ov9h3jmGKYPAXOL3B4qjcjtMSRj325WMZA5nQp8OIgLN1kRaCLgqF6GFjq2bJvn1HWTVvWt+YSaaXN3GaapTbqvfJN5DNlQI4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=Zqa/eYBRCDEfDOpFZ8B1SiZUoIS3Zl/4EULbz297rAQxidxQ2K97RoraPZkLwgt4tNZNbE33NQzosO16k++uFvpB/syXvt5Z0G2GN39ByiIhCKv7DWoQrshTsvbEMDNDGjIeEM6WpalH/dZhiLiJyTUtZW0TRVFE+Xtjd5BnZRVSh2Bfpc3EOXGHsFV9Jh1xk5beAANh0ahnZlj4q8UyZ1JsYPOdZ5ihf6BvUDCmtMXYuN02nI0KqX1ga/8Ii6k9iEkBuLdbJlYy87VukmEtGzhSGRZgIy3HmBfBSlgU9xyx6lEZLvB9JO4iI8Cz7n5OyTmqD7nKwjRgl3dt14V2ww==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=9W5U9MRLdiGXEzabQcr7VS1i+v+HHL0WqrvbrIzGW3Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179423981483454.124000191802565;
	Mon, 9 Nov 2026 07:56:54 -0800 (PST)
Message-ID: <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
Subject: Re: [PATCH v9 1/4] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
From: Icenowy Zheng <uwu@icenowy.me>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>, Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti	 <alex@ghiti.fr>, Randy Dunlap
 <rdunlap@infradead.org>, Radim Krcmar	 <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org, Andy Chiu
 <tchiu@tenstorrent.com>,  Florian Weimer <fweimer@redhat.com>, Peter
 Bergner <bergner@oss.tenstorrent.com>, Zihong Yao	
 <zihong.plct@isrc.iscas.ac.cn>, Mark Harris <mark.hsj@gmail.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 09 Nov 2026 23:56:47 +0800
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
References: 
	<20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
	 <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-11-09=E4=B8=80=E7=9A=84 07:47 -0500=EF=BC=8CGuodong Xu=E5=86=
=99=E9=81=93=EF=BC=9A
> Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
> (named profile-class sets such as IMA and RVA23U64), computed at init
> time by riscv_init_isa_bases().
>=20
> The IMA base is set unconditionally: it is behavior the kernel always
> provides, and is intentionally not derived from the I, M and A
> extensions.
>=20
> Register riscv_init_isa_bases() as an arch_initcall. That is late
> enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM
> and
> populated have_user_pmlen_*; without that ordering,
> riscv_have_user_pmlen(7) would still return its default false and the
> RVA23U64 detection path would always bail. It is also early enough
> that
> arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
> when it snapshots the hwprobe values into the vDSO data page.
>=20
> Consider this as the cache that subsequent consumers (hwprobe's
> RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
> can read without recomputing, which keeps them consistent with
> each other.
>=20
> Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> ---
> v9: Set the IMA base unconditionally; do not derive it from I, M and
> A.
> v8: Add Co-developed-by for Andrew Jones (Conor).
> v7:
> - Register riscv_init_isa_bases() at arch_initcall, ahead of the vDSO
> =C2=A0 hwprobe snapshot at arch_initcall_sync; v6 returned 0 for
> =C2=A0 RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO.
> - Keep riscv_isa_bases static; add riscv_isa_base_available().
> v6: No change.
> v5: No change.
> v4:
> - In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
> =C2=A0 lines to make them conform to the order they appear in the RVA23
> 1.0
> =C2=A0 Profile.
> v3:
> - Add a blank line before the subsys_initcall() registration
> (Andrew).
> - Set the local ext_mask with __set_bit() and test the mandate set
> with
> =C2=A0 !bitmap_subset() (Sashiko).
> - Require the Zic64b ISA extension in the RVA23U64 mask,
> =C2=A0 instead of open-coded cache block-size check. (New, thoughts from
> Andrew)
> v2:
> - Implement riscv_init_isa_bases() that runs at system init time,
> =C2=A0 after tagged_addr_init() populates have_user_pmlen_*.
> - Split RVA23S64 placeholder into a future patch.
> ---
> =C2=A0arch/riscv/include/asm/cpufeature.h |=C2=A0 13 +++++
> =C2=A0arch/riscv/kernel/cpufeature.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 109
> ++++++++++++++++++++++++++++++++++++
> =C2=A02 files changed, 122 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h
> b/arch/riscv/include/asm/cpufeature.h
> index 99799cc6c198..2ce1a1e212c9 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -25,8 +25,20 @@ struct riscv_cpuinfo {
> =C2=A0	unsigned long mimpid;
> =C2=A0};
> =C2=A0
> +enum {
> +	RISCV_ISA_BASE_IMA,

I may have missed something, but would it be worth to add a GC tier?

I think many Linux distros have GC defined as their baseline.

Thanks,
Icenowy

> +	RISCV_ISA_BASE_RVA23U64,
> +	RISCV_NR_ISA_BASES,
> +};
> +
> +/**
> + * struct riscv_isainfo - per-hart ISA state
> + * @isa: bitmap of ISA extensions this hart implements
> + * @isa_bases: bitmap of profile bases this hart conforms to
> + */
> =C2=A0struct riscv_isainfo {
> =C2=A0	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
> +	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
> =C2=A0};
> =C2=A0
> =C2=A0DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> @@ -134,6 +146,7 @@ extern const size_t riscv_isa_ext_count;
> =C2=A0extern bool riscv_isa_fallback;
> =C2=A0
> =C2=A0unsigned long riscv_isa_extension_base(const unsigned long
> *isa_bitmap);
> +bool riscv_isa_base_available(const unsigned long *isa_bases,
> unsigned int base);
> =C2=A0static __always_inline bool riscv_cpu_has_extension_likely(int cpu,
> const unsigned long ext)
> =C2=A0{
> =C2=A0	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be <
> RISCV_ISA_EXT_MAX");
> diff --git a/arch/riscv/kernel/cpufeature.c
> b/arch/riscv/kernel/cpufeature.c
> index 72bce616491f..0377fc148785 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
> =C2=A0/* Host ISA bitmap */
> =C2=A0DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> =C2=A0
> +/* Host ISA bases bitmap */
> +static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES)
> __read_mostly;
> +
> =C2=A0/* Per-cpu ISA extensions. */
> =C2=A0struct riscv_isainfo hart_isa[NR_CPUS];
> =C2=A0
> @@ -81,6 +84,26 @@ bool __riscv_isa_extension_available(const
> unsigned long *isa_bitmap, unsigned i
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
> =C2=A0
> +/**
> + * riscv_isa_base_available() - Check whether a given ISA base is
> + * available or not
> + *
> + * @isa_bases: ISA bases bitmap to use
> + * @base: bit position of the desired ISA base
> + * Return: true or false
> + *
> + * NOTE: If isa_bases is NULL then the host ISA bases bitmap will be
> used.
> + */
> +bool riscv_isa_base_available(const unsigned long *isa_bases,
> unsigned int base)
> +{
> +	const unsigned long *bmap =3D isa_bases ? isa_bases :
> riscv_isa_bases;
> +
> +	if (base >=3D RISCV_NR_ISA_BASES)
> +		return false;
> +
> +	return test_bit(base, bmap);
> +}
> +
> =C2=A0static int riscv_ext_f_depends(const struct riscv_isa_ext_data
> *data,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const unsigned long *isa_bi=
tmap)
> =C2=A0{
> @@ -1406,3 +1429,89 @@ void __init_or_module
> riscv_cpufeature_patch_func(struct alt_entry *begin,
> =C2=A0	if (early)
> =C2=A0		local_flush_icache_all();
> =C2=A0}
> +
> +/*
> + * Compute the set of bases a hart conforms to. Profile bases such
> as
> + * RVA23U64 are derived from its resolved ISA bitmap.
> + *
> + * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all
> harts) is
> + * used.
> + */
> +static void riscv_set_isa_bases(unsigned long *bases, const unsigned
> long *isa_bitmap)
> +{
> +	const unsigned long *isa =3D isa_bitmap ? isa_bitmap :
> riscv_isa;
> +	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) =3D { 0 };
> +
> +	/* The IMA base is behavior the kernel always provides. */
> +	set_bit(RISCV_ISA_BASE_IMA, bases);
> +
> +	/* RVA23U64 */
> +
> +	/* Supm with PMLEN=3D7 */
> +	if (!riscv_have_user_pmlen(7))
> +		return;
> +
> +	__set_bit(RISCV_ISA_EXT_I, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_M, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_A, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_F, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_D, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_C, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_B, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_V, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
> +	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
> +
> +	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
> +		return;
> +
> +	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
> +}
> +
> +/*
> + * Populate the host ISA bases bitmap (riscv_isa_bases) and each
> + * hart's per-cpu isa_bases.
> + */
> +static int __init riscv_init_isa_bases(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu)
> +		riscv_set_isa_bases(hart_isa[cpu].isa_bases,
> hart_isa[cpu].isa);
> +
> +	riscv_set_isa_bases(riscv_isa_bases, NULL);
> +	return 0;
> +}
> +
> +/*
> + * Registered as arch_initcall: late enough that
> + * core_initcall(tagged_addr_init) has populated have_user_pmlen_*,
> + * and early enough that arch_initcall_sync(init_hwprobe_vdso_data)
> + * finds the ISA bases populated when it snapshots the hwprobe
> + * values into the vDSO data page.
> + */
> +arch_initcall(riscv_init_isa_bases);
