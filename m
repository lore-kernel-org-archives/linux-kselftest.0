Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D6238A721;
	Wed, 15 Apr 2026 06:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776234270; cv=none; b=fPJjvNP2j01hGrzJJ3inJnbQH7CT5qqRNNGl3vbVCRpDtNQ5AUoXtKQdr8dmNC5YI3wcRv5/DH1AcI2Sp++ISfYQUnRAi/Pqin39myEIpqJX0j3nbDmOwPcclegm/u4o+V2HQ9s3gAf7w8ffPU0TISIBfjglxSSWpSCVE2krojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776234270; c=relaxed/simple;
	bh=BFVHN3I7gfk9e1GzV/aQxQYDBFEid/EYjJjrCi8oulA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DklYmfGweCWxtzMaO/7lXoskxT6xflpEHJeS8B4YdfUs1oFW5u2NDoLXDhLwuB5PB+WwxGoGSTeFv8lW1sUAaAnOhSKVXIP/FCRPLVk1Qj1vdqZAFQ1l7f3fVkQ7y2SybuZCfXPSvayuiNcvxa4xoyAA4hgv4rhqMd+tvu8KmzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UtOXXLwr; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UtOXXLwr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=cKvxKrEAPFq/y0IpQgm674FoRAJX/pUpi5+a8m7Kle8=; b=UtOXXLwrRkelyZ5PhfZiAj7mA0
	HcTNrUWE4mTvsBHTkJkOPbEBh5qsWH2bp3xXxKTXe05kO58vTkrJJz0ySA8L9Kgc4GWPA9sHgB28b
	vUGKOU2tN7GkDSH34K4SHKAme+oaZnf1ZkFB4+2ouUcdu+UKWJrQL9tz6kuu14B3jxyPcQGuu+90Z
	IZiQSwSiuGf9Mnnxb70GsSJoX9TJbc0okZZUNzZDeQEOU5F3L4BhDOK1pkE4VTUBEtM70lw5aFiQO
	cKVNZiZcvqNg6QfVsiMGat7ZkJHC+wNRiDtaRH7GX4pzm1F6KwwL/Wj+afuBr6f4jjbFiuyOglal0
	kE79p83w==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wCtfj-000FBS-2d;
	Wed, 15 Apr 2026 08:24:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wCtfi-0008bK-1w;
	Wed, 15 Apr 2026 08:24:23 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>
Subject:
 Re: [PATCH 1/8] arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the
 hwcaps
Date: Wed, 15 Apr 2026 08:24:22 +0200
Message-ID: <8745494.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260302-arm64-dpisa-2025-v1-1-0855e7f41689@kernel.org>
References:
 <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <20260302-arm64-dpisa-2025-v1-1-0855e7f41689@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27971/Tue Apr 14 08:24:44 2026)

Am Montag, 2. M=E4rz 2026, 23:53:16 CEST schrieb Mark Brown:
> Currently for each hwcap we define both the HWCAPn_NAME definition which =
is
> exposed to userspace and a kernel internal KERNEL_HWCAP_NAME definition
> which we use internally. This is tedious and repetitive, instead use a
> script to generate the KERNEL_HWCAP_ definitions from the UAPI definition=
s.
>=20
> No functional changes intended.

Somehow this change causes to delete and generate kernel-hwcap.h on each
make call. This results in compiling essentially everything each time.

$ make Image
make[1]: Entering directory '/linux/build_arm64'
  REMOVE  arch/arm64/include/generated/asm/kernel-hwcap.h
  GEN     arch/arm64/include/generated/asm/kernel-hwcap.h
  CC      arch/arm64/kernel/asm-offsets.s
  CC      kernel/sched/rq-offsets.s
^Cmake[3]: *** Deleting file 'kernel/sched/rq-offsets.s'
make[3]: *** [../scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Int=
errupt
make[2]: *** [/linux/Makefile:1371: prepare0] Interrupt
make[1]: *** [/linux/Makefile:248: __sub-make] Interrupt
make: *** [Makefile:248: __sub-make] Interrupt

make Image
make[1]: Entering directory '/linux/build_arm64'
  REMOVE  arch/arm64/include/generated/asm/kernel-hwcap.h
  GEN     arch/arm64/include/generated/asm/kernel-hwcap.h
  CC      arch/arm64/kernel/asm-offsets.s
  CC      kernel/sched/rq-offsets.s
  CC      arch/arm64/kernel/vdso/vgettimeofday.o
  LD      arch/arm64/kernel/vdso/vdso.so.dbg
  VDSOSYM include/generated/vdso-offsets.h
  OBJCOPY arch/arm64/kernel/vdso/vdso.so
  CC      init/version.o
^Cmake[4]: *** [../scripts/Makefile.build:289: init/version.o] Interrupt
make[3]: *** [../scripts/Makefile.build:548: init] Interrupt
make[2]: *** [/linux/Makefile:2140: .] Interrupt
make[1]: *** [/linux/Makefile:248: __sub-make] Interrupt
make: *** [Makefile:248: __sub-make] Interrupt

Best regards,
Alexander

>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/hwcap.h        | 120 +---------------------------=
=2D-----
>  arch/arm64/tools/Makefile             |   8 ++-
>  arch/arm64/tools/gen-kernel-hwcaps.sh |  23 +++++++
>  3 files changed, 32 insertions(+), 119 deletions(-)
>=20
> diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwca=
p.h
> index 72ea4bda79f3..abe8218b2325 100644
> --- a/arch/arm64/include/asm/hwcap.h
> +++ b/arch/arm64/include/asm/hwcap.h
> @@ -60,126 +60,10 @@
>   * of KERNEL_HWCAP_{feature}.
>   */
>  #define __khwcap_feature(x)		const_ilog2(HWCAP_ ## x)
> -#define KERNEL_HWCAP_FP			__khwcap_feature(FP)
> -#define KERNEL_HWCAP_ASIMD		__khwcap_feature(ASIMD)
> -#define KERNEL_HWCAP_EVTSTRM		__khwcap_feature(EVTSTRM)
> -#define KERNEL_HWCAP_AES		__khwcap_feature(AES)
> -#define KERNEL_HWCAP_PMULL		__khwcap_feature(PMULL)
> -#define KERNEL_HWCAP_SHA1		__khwcap_feature(SHA1)
> -#define KERNEL_HWCAP_SHA2		__khwcap_feature(SHA2)
> -#define KERNEL_HWCAP_CRC32		__khwcap_feature(CRC32)
> -#define KERNEL_HWCAP_ATOMICS		__khwcap_feature(ATOMICS)
> -#define KERNEL_HWCAP_FPHP		__khwcap_feature(FPHP)
> -#define KERNEL_HWCAP_ASIMDHP		__khwcap_feature(ASIMDHP)
> -#define KERNEL_HWCAP_CPUID		__khwcap_feature(CPUID)
> -#define KERNEL_HWCAP_ASIMDRDM		__khwcap_feature(ASIMDRDM)
> -#define KERNEL_HWCAP_JSCVT		__khwcap_feature(JSCVT)
> -#define KERNEL_HWCAP_FCMA		__khwcap_feature(FCMA)
> -#define KERNEL_HWCAP_LRCPC		__khwcap_feature(LRCPC)
> -#define KERNEL_HWCAP_DCPOP		__khwcap_feature(DCPOP)
> -#define KERNEL_HWCAP_SHA3		__khwcap_feature(SHA3)
> -#define KERNEL_HWCAP_SM3		__khwcap_feature(SM3)
> -#define KERNEL_HWCAP_SM4		__khwcap_feature(SM4)
> -#define KERNEL_HWCAP_ASIMDDP		__khwcap_feature(ASIMDDP)
> -#define KERNEL_HWCAP_SHA512		__khwcap_feature(SHA512)
> -#define KERNEL_HWCAP_SVE		__khwcap_feature(SVE)
> -#define KERNEL_HWCAP_ASIMDFHM		__khwcap_feature(ASIMDFHM)
> -#define KERNEL_HWCAP_DIT		__khwcap_feature(DIT)
> -#define KERNEL_HWCAP_USCAT		__khwcap_feature(USCAT)
> -#define KERNEL_HWCAP_ILRCPC		__khwcap_feature(ILRCPC)
> -#define KERNEL_HWCAP_FLAGM		__khwcap_feature(FLAGM)
> -#define KERNEL_HWCAP_SSBS		__khwcap_feature(SSBS)
> -#define KERNEL_HWCAP_SB			__khwcap_feature(SB)
> -#define KERNEL_HWCAP_PACA		__khwcap_feature(PACA)
> -#define KERNEL_HWCAP_PACG		__khwcap_feature(PACG)
> -#define KERNEL_HWCAP_GCS		__khwcap_feature(GCS)
> -#define KERNEL_HWCAP_CMPBR		__khwcap_feature(CMPBR)
> -#define KERNEL_HWCAP_FPRCVT		__khwcap_feature(FPRCVT)
> -#define KERNEL_HWCAP_F8MM8		__khwcap_feature(F8MM8)
> -#define KERNEL_HWCAP_F8MM4		__khwcap_feature(F8MM4)
> -#define KERNEL_HWCAP_SVE_F16MM		__khwcap_feature(SVE_F16MM)
> -#define KERNEL_HWCAP_SVE_ELTPERM	__khwcap_feature(SVE_ELTPERM)
> -#define KERNEL_HWCAP_SVE_AES2		__khwcap_feature(SVE_AES2)
> -#define KERNEL_HWCAP_SVE_BFSCALE	__khwcap_feature(SVE_BFSCALE)
> -#define KERNEL_HWCAP_SVE2P2		__khwcap_feature(SVE2P2)
> -#define KERNEL_HWCAP_SME2P2		__khwcap_feature(SME2P2)
> -#define KERNEL_HWCAP_SME_SBITPERM	__khwcap_feature(SME_SBITPERM)
> -#define KERNEL_HWCAP_SME_AES		__khwcap_feature(SME_AES)
> -#define KERNEL_HWCAP_SME_SFEXPA		__khwcap_feature(SME_SFEXPA)
> -#define KERNEL_HWCAP_SME_STMOP		__khwcap_feature(SME_STMOP)
> -#define KERNEL_HWCAP_SME_SMOP4		__khwcap_feature(SME_SMOP4)
> -
>  #define __khwcap2_feature(x)		(const_ilog2(HWCAP2_ ## x) + 64)
> -#define KERNEL_HWCAP_DCPODP		__khwcap2_feature(DCPODP)
> -#define KERNEL_HWCAP_SVE2		__khwcap2_feature(SVE2)
> -#define KERNEL_HWCAP_SVEAES		__khwcap2_feature(SVEAES)
> -#define KERNEL_HWCAP_SVEPMULL		__khwcap2_feature(SVEPMULL)
> -#define KERNEL_HWCAP_SVEBITPERM		__khwcap2_feature(SVEBITPERM)
> -#define KERNEL_HWCAP_SVESHA3		__khwcap2_feature(SVESHA3)
> -#define KERNEL_HWCAP_SVESM4		__khwcap2_feature(SVESM4)
> -#define KERNEL_HWCAP_FLAGM2		__khwcap2_feature(FLAGM2)
> -#define KERNEL_HWCAP_FRINT		__khwcap2_feature(FRINT)
> -#define KERNEL_HWCAP_SVEI8MM		__khwcap2_feature(SVEI8MM)
> -#define KERNEL_HWCAP_SVEF32MM		__khwcap2_feature(SVEF32MM)
> -#define KERNEL_HWCAP_SVEF64MM		__khwcap2_feature(SVEF64MM)
> -#define KERNEL_HWCAP_SVEBF16		__khwcap2_feature(SVEBF16)
> -#define KERNEL_HWCAP_I8MM		__khwcap2_feature(I8MM)
> -#define KERNEL_HWCAP_BF16		__khwcap2_feature(BF16)
> -#define KERNEL_HWCAP_DGH		__khwcap2_feature(DGH)
> -#define KERNEL_HWCAP_RNG		__khwcap2_feature(RNG)
> -#define KERNEL_HWCAP_BTI		__khwcap2_feature(BTI)
> -#define KERNEL_HWCAP_MTE		__khwcap2_feature(MTE)
> -#define KERNEL_HWCAP_ECV		__khwcap2_feature(ECV)
> -#define KERNEL_HWCAP_AFP		__khwcap2_feature(AFP)
> -#define KERNEL_HWCAP_RPRES		__khwcap2_feature(RPRES)
> -#define KERNEL_HWCAP_MTE3		__khwcap2_feature(MTE3)
> -#define KERNEL_HWCAP_SME		__khwcap2_feature(SME)
> -#define KERNEL_HWCAP_SME_I16I64		__khwcap2_feature(SME_I16I64)
> -#define KERNEL_HWCAP_SME_F64F64		__khwcap2_feature(SME_F64F64)
> -#define KERNEL_HWCAP_SME_I8I32		__khwcap2_feature(SME_I8I32)
> -#define KERNEL_HWCAP_SME_F16F32		__khwcap2_feature(SME_F16F32)
> -#define KERNEL_HWCAP_SME_B16F32		__khwcap2_feature(SME_B16F32)
> -#define KERNEL_HWCAP_SME_F32F32		__khwcap2_feature(SME_F32F32)
> -#define KERNEL_HWCAP_SME_FA64		__khwcap2_feature(SME_FA64)
> -#define KERNEL_HWCAP_WFXT		__khwcap2_feature(WFXT)
> -#define KERNEL_HWCAP_EBF16		__khwcap2_feature(EBF16)
> -#define KERNEL_HWCAP_SVE_EBF16		__khwcap2_feature(SVE_EBF16)
> -#define KERNEL_HWCAP_CSSC		__khwcap2_feature(CSSC)
> -#define KERNEL_HWCAP_RPRFM		__khwcap2_feature(RPRFM)
> -#define KERNEL_HWCAP_SVE2P1		__khwcap2_feature(SVE2P1)
> -#define KERNEL_HWCAP_SME2		__khwcap2_feature(SME2)
> -#define KERNEL_HWCAP_SME2P1		__khwcap2_feature(SME2P1)
> -#define KERNEL_HWCAP_SME_I16I32		__khwcap2_feature(SME_I16I32)
> -#define KERNEL_HWCAP_SME_BI32I32	__khwcap2_feature(SME_BI32I32)
> -#define KERNEL_HWCAP_SME_B16B16		__khwcap2_feature(SME_B16B16)
> -#define KERNEL_HWCAP_SME_F16F16		__khwcap2_feature(SME_F16F16)
> -#define KERNEL_HWCAP_MOPS		__khwcap2_feature(MOPS)
> -#define KERNEL_HWCAP_HBC		__khwcap2_feature(HBC)
> -#define KERNEL_HWCAP_SVE_B16B16		__khwcap2_feature(SVE_B16B16)
> -#define KERNEL_HWCAP_LRCPC3		__khwcap2_feature(LRCPC3)
> -#define KERNEL_HWCAP_LSE128		__khwcap2_feature(LSE128)
> -#define KERNEL_HWCAP_FPMR		__khwcap2_feature(FPMR)
> -#define KERNEL_HWCAP_LUT		__khwcap2_feature(LUT)
> -#define KERNEL_HWCAP_FAMINMAX		__khwcap2_feature(FAMINMAX)
> -#define KERNEL_HWCAP_F8CVT		__khwcap2_feature(F8CVT)
> -#define KERNEL_HWCAP_F8FMA		__khwcap2_feature(F8FMA)
> -#define KERNEL_HWCAP_F8DP4		__khwcap2_feature(F8DP4)
> -#define KERNEL_HWCAP_F8DP2		__khwcap2_feature(F8DP2)
> -#define KERNEL_HWCAP_F8E4M3		__khwcap2_feature(F8E4M3)
> -#define KERNEL_HWCAP_F8E5M2		__khwcap2_feature(F8E5M2)
> -#define KERNEL_HWCAP_SME_LUTV2		__khwcap2_feature(SME_LUTV2)
> -#define KERNEL_HWCAP_SME_F8F16		__khwcap2_feature(SME_F8F16)
> -#define KERNEL_HWCAP_SME_F8F32		__khwcap2_feature(SME_F8F32)
> -#define KERNEL_HWCAP_SME_SF8FMA		__khwcap2_feature(SME_SF8FMA)
> -#define KERNEL_HWCAP_SME_SF8DP4		__khwcap2_feature(SME_SF8DP4)
> -#define KERNEL_HWCAP_SME_SF8DP2		__khwcap2_feature(SME_SF8DP2)
> -#define KERNEL_HWCAP_POE		__khwcap2_feature(POE)
> -
>  #define __khwcap3_feature(x)		(const_ilog2(HWCAP3_ ## x) + 128)
> -#define KERNEL_HWCAP_MTE_FAR		__khwcap3_feature(MTE_FAR)
> -#define KERNEL_HWCAP_MTE_STORE_ONLY	__khwcap3_feature(MTE_STORE_ONLY)
> -#define KERNEL_HWCAP_LSFE		__khwcap3_feature(LSFE)
> -#define KERNEL_HWCAP_LS64		__khwcap3_feature(LS64)
> +
> +#include "asm/kernel-hwcap.h"
> =20
>  /*
>   * This yields a mask that user programs can use to figure out what
> diff --git a/arch/arm64/tools/Makefile b/arch/arm64/tools/Makefile
> index c2b34e761006..a94b3d9caad6 100644
> --- a/arch/arm64/tools/Makefile
> +++ b/arch/arm64/tools/Makefile
> @@ -3,7 +3,7 @@
>  gen :=3D arch/$(ARCH)/include/generated
>  kapi :=3D $(gen)/asm
> =20
> -kapisyshdr-y :=3D cpucap-defs.h sysreg-defs.h
> +kapisyshdr-y :=3D cpucap-defs.h kernel-hwcap.h sysreg-defs.h
> =20
>  kapi-hdrs-y :=3D $(addprefix $(kapi)/, $(kapisyshdr-y))
> =20
> @@ -18,11 +18,17 @@ kapi:   $(kapi-hdrs-y)
>  quiet_cmd_gen_cpucaps =3D GEN     $@
>        cmd_gen_cpucaps =3D mkdir -p $(dir $@); $(AWK) -f $(real-prereqs) =
> $@
> =20
> +quiet_cmd_gen_kernel_hwcap =3D GEN     $@
> +      cmd_gen_kernel_hwcap =3D mkdir -p $(dir $@); /bin/sh -e $(real-pre=
reqs) > $@
> +
>  quiet_cmd_gen_sysreg =3D GEN     $@
>        cmd_gen_sysreg =3D mkdir -p $(dir $@); $(AWK) -f $(real-prereqs) >=
 $@
> =20
>  $(kapi)/cpucap-defs.h: $(src)/gen-cpucaps.awk $(src)/cpucaps FORCE
>  	$(call if_changed,gen_cpucaps)
> =20
> +$(kapi)/kernel-hwcap.h: $(src)/gen-kernel-hwcaps.sh $(srctree)/arch/arm6=
4/include/uapi/asm/hwcap.h FORCE
> +	$(call if_changed,gen_kernel_hwcap)
> +
>  $(kapi)/sysreg-defs.h: $(src)/gen-sysreg.awk $(src)/sysreg FORCE
>  	$(call if_changed,gen_sysreg)
> diff --git a/arch/arm64/tools/gen-kernel-hwcaps.sh b/arch/arm64/tools/gen=
=2Dkernel-hwcaps.sh
> new file mode 100644
> index 000000000000..e7cdcf428d91
> --- /dev/null
> +++ b/arch/arm64/tools/gen-kernel-hwcaps.sh
> @@ -0,0 +1,23 @@
> +#!/bin/sh -e
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# gen-kernel-hwcap.sh - Generate kernel internal hwcap.h definitions
> +#
> +# Copyright 2026 Arm, Ltd.
> +
> +if [ "$1" =3D "" ]; then
> +	echo "$0: no filename specified"
> +	exit 1
> +fi
> +
> +echo "#ifndef __ASM_KERNEL_HWCAPS_H"
> +echo "#define __ASM_KERNEL_HWCAPS_H"
> +echo ""
> +echo "/* Generated file - do not edit */"
> +echo ""
> +
> +grep -E '^#define HWCAP[0-9]*_[A-Z0-9_]+' $1 | \
> +	sed 's/.*HWCAP\([0-9]*\)_\([A-Z0-9_]\+\).*/#define KERNEL_HWCAP_\2\t__k=
hwcap\1_feature(\2)/'
> +
> +echo ""
> +echo "#endif /* __ASM_KERNEL_HWCAPS_H */"
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


