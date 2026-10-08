Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFA829B766;
	Thu,  8 Oct 2026 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461955; cv=none; b=iy1Kkpxb9jln54CnRi+VBMyV6jWJ73CdWNmCmDtV8fS4bIjq9Dxd+dmU7QjyAX+nV+zu/Ngr9PWllOF/k5n+VrKWPaMJy6P0vfWi2Ozn+oHxf4CRrk4Lq6IBfAyLmhvj4o/iyWHUy/h1zsivjbCUV/hOzg+lzkEGILEpJq0ls3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461955; c=relaxed/simple;
	bh=8VH9pRt2I9MNz1f69L61xSEks35xSCJIXeoRIRkjUNs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mh5k0LBpjkLs9V7y0H4Fz7pJSwoomLw3MEk9aYF3eUw8JShIHMgJGX4YX1T/5Haw9beZiOBjt/pU80fsQmjUNLoBpWCva+0tpU5vAdO19fC2vXT5yoErHj63mZBjkMzuOBxWkxL/FOr4b03THv2ZQ1JOD1qAyMz406TnNtyEH1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=0zc37iog; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="0zc37iog"
Received: from ehlo.thunderbird.net ([172.59.192.127])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 698CFIZG2829579
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 8 Oct 2026 05:15:20 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 698CFIZG2829579
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1791461724;
	bh=4Sz+pK3R9YulfyfGBdLHONm7eyTCy5vssqIi6afeE5I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=0zc37iogkRc+Ny5WtnRgGp6d0N+G+hCV1xV08/36cQC1/RUKYc+HXj83dVkwHaT+M
	 weCNA7wkOa+mLStcOMqDXTTlhR9ivTae6/UsCzoF0m4s4AYQfKT6hEB2pykjAUX+UL
	 GeY549uYg0HCgAFexWRSYRkCcUj3PAIwOTg4fzwk4/0cNBkHNGbQxJdjmLDzn8vT4x
	 Gk3hC7/35wxQVZj0v+yWPYH/0ZhLvFEJ9s8XPrbjUwo3M5JWIy+iIR0repEygzMmm1
	 SFQ0TY+/tmurP0E9JfXQxchCQzHQsvZL6fAJGsGSCBQzNk3JvfSqB4dD4bwWKzmXQ8
	 7WSTXgLo1lANQ==
Date: Thu, 08 Oct 2026 14:15:09 +0200
From: "H. Peter Anvin" <hpa@zytor.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
CC: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Justin Stitt <justinstitt@google.com>,
        Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        Tomas Glozar <tglozar@kernel.org>, Willy Tarreau <w@1wt.eu>,
        x86@kernel.org
Subject: Re: [PATCH v4 1/2] selftests/nolibc: remove the x32 testcase
User-Agent: K-9 Mail for Android
In-Reply-To: <20261008-x32_removal-v4-1-d389a193c506@breakpoint.cc>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc> <20261008-x32_removal-v4-1-d389a193c506@breakpoint.cc>
Message-ID: <981CB9F6-143F-4EB0-9B95-8476B5A55633@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 8, 2026 11:07:42 AM GMT+02:00, Sebastian Andrzej Siewior <bigeas=
y@linutronix=2Ede> wrote:
>From: Sebastian Andrzej Siewior <sebastian@breakpoint=2Ecc>
>
>From: Thomas Wei=C3=9Fschuh <linux@weissschuh=2Enet>
>
>Support for the x32 ABI is about to be removed from the kernel itself=2E
>This will break the nolibc x32 testcase=2E
>
>Remove the testcase to avoid breaking the testsuite in general=2E
>
>This also ends official support from nolibc proper for x32=2E But as ther=
e
>is no clear x32-specific code in the nolibc codebase, there won't be a
>removal patch for that=2E
>
>Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh=2Enet>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix=2Ede>
>---
> tools/testing/selftests/nolibc/Makefile=2Enolibc | 6 ------
> tools/testing/selftests/nolibc/run-tests=2Esh    | 7 +------
> 2 files changed, 1 insertion(+), 12 deletions(-)
>
>diff --git a/tools/testing/selftests/nolibc/Makefile=2Enolibc b/tools/tes=
ting/selftests/nolibc/Makefile=2Enolibc
>index f70c8dfca0186=2E=2E895a6ea7a8e45 100644
>--- a/tools/testing/selftests/nolibc/Makefile=2Enolibc
>+++ b/tools/testing/selftests/nolibc/Makefile=2Enolibc
>@@ -47,7 +47,6 @@ XARCH_riscv      =3D riscv64
> XARCH            =3D $(or $(XARCH_$(ARCH)),$(ARCH))
>=20
> # map from user input variants to their kernel supported architectures
>-ARCH_x32         =3D x86
> ARCH_armthumb    =3D arm
> ARCH_ppc         =3D powerpc
> ARCH_ppc64       =3D powerpc
>@@ -70,7 +69,6 @@ ARCH            :=3D $(or $(ARCH_$(XARCH)),$(XARCH))
> # kernel image names by architecture
> IMAGE_i386       =3D arch/x86/boot/bzImage
> IMAGE_x86_64     =3D arch/x86/boot/bzImage
>-IMAGE_x32        =3D arch/x86/boot/bzImage
> IMAGE_x86        =3D arch/x86/boot/bzImage
> IMAGE_arm64      =3D arch/arm64/boot/Image
> IMAGE_arm        =3D arch/arm/boot/zImage
>@@ -106,7 +104,6 @@ DEFCONFIG_sh4        =3D rts7751r2dplus_defconfig
> DEFCONFIG_openrisc   =3D virt_defconfig
> DEFCONFIG            =3D $(or $(DEFCONFIG_$(XARCH)),defconfig)
>=20
>-EXTRACONFIG_x32       =3D -e CONFIG_X86_X32_ABI
> EXTRACONFIG_arm       =3D -e CONFIG_NAMESPACES
> EXTRACONFIG_armthumb  =3D -e CONFIG_NAMESPACES
> EXTRACONFIG_sparc32   =3D -e CONFIG_TMPFS
>@@ -119,7 +116,6 @@ EXTRACONFIG           =3D $(EXTRACONFIG_$(XARCH))
> TEST =3D
>=20
> # QEMU_ARCH: arch names used by qemu
>-QEMU_ARCH_x32        =3D x86_64
> QEMU_ARCH_x86        =3D x86_64
> QEMU_ARCH_arm64      =3D aarch64
> QEMU_ARCH_armthumb   =3D arm
>@@ -151,7 +147,6 @@ endif
> # QEMU_ARGS : some arch-specific args to pass to qemu
> QEMU_ARGS_i386       =3D -M pc -append "console=3DttyS0,9600 i8042=2Enoa=
ux panic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
> QEMU_ARGS_x86_64     =3D -M pc -append "console=3DttyS0,9600 i8042=2Enoa=
ux panic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>-QEMU_ARGS_x32        =3D -M pc -append "console=3DttyS0,9600 i8042=2Enoa=
ux panic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
> QEMU_ARGS_x86        =3D -M pc -append "console=3DttyS0,9600 i8042=2Enoa=
ux panic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
> QEMU_ARGS_arm64      =3D -M virt -cpu cortex-a53 -append "panic=3D-1 $(T=
EST:%=3DNOLIBC_TEST=3D%)"
> QEMU_ARGS_arm        =3D -M virt -append "panic=3D-1 $(TEST:%=3DNOLIBC_T=
EST=3D%)"
>@@ -189,7 +184,6 @@ Q=3D@
> endif
>=20
> CFLAGS_i386 =3D $(call cc-option,-m32)
>-CFLAGS_x32 =3D -mx32
> CFLAGS_arm =3D -marm
> CFLAGS_armthumb =3D -mthumb -march=3Darmv6t2
> CFLAGS_parisc32 =3D -mfast-indirect-calls
>diff --git a/tools/testing/selftests/nolibc/run-tests=2Esh b/tools/testin=
g/selftests/nolibc/run-tests=2Esh
>index dc0b1649c6419=2E=2E20e0d2dc0e9b9 100755
>--- a/tools/testing/selftests/nolibc/run-tests=2Esh
>+++ b/tools/testing/selftests/nolibc/run-tests=2Esh
>@@ -18,7 +18,7 @@ test_mode=3Dsystem
> werror=3D1
> llvm=3D
> all_archs=3D(
>-	i386 x86_64 x32
>+	i386 x86_64
> 	arm64 arm armthumb
> 	mips32le mips32be mipsn32le mipsn32be mips64le mips64be
> 	openrisc
>@@ -119,7 +119,6 @@ crosstool_arch() {
> 	mips*) echo mips;;
> 	s390*) echo s390;;
> 	sparc*) echo sparc64;;
>-	x32*) echo x86_64;;
> 	parisc32) echo hppa;;
> 	*) echo "$1";;
> 	esac
>@@ -198,10 +197,6 @@ test_arch() {
> 		echo "Unsupported configuration"
> 		return
> 	fi
>-	if [ "$arch" =3D "x32" ] && [ "$test_mode" =3D "user" ]; then
>-		echo "Unsupported configuration"
>-		return
>-	fi
>=20
> 	mkdir -p "$build_dir"
> 	swallow_output "${MAKE[@]}" defconfig
>

Acked-by: H=2E Peter Anvin (Rosaic) <hpa@zytor=2Ecom>
