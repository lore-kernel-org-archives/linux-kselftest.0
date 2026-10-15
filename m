Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAB73B8130;
	Thu, 15 Oct 2026 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090049; cv=none; b=bpzn7z2t3HpT3zHf7OIisA4eUlbuJ6cyAaZ7WE6h4aBPzLLZDmqwQLpUUQMlQ/J32zmDtkvsVr3WyNTlWeiloDRGNPKYKHP+wuT/jfOFVeONNff7Md6iGuUCszKayonWrhwMP4fPmRlNPmGSbHsr7htc126O/S9kL40e/9AOYWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090049; c=relaxed/simple;
	bh=0ECoLvPjTb5fPyv+CmBxEv2EO1EKQjH2X3bw330Ox8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMo9RaAKyQ5T1y5pnkKZwrPuYE9qkDZC+PtUeeEvsanm11/UxHrMudCuICK88NWRr3EKiU4W9yhA2Ro4YMilK+1qzFQeg9EbMZZUxeE9VWe2nL5VxdA+npWB/Mw7aHKobB3lrFUDYVY4diqe6hPs5W2cPv+jZTISbrXRi3/3naE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kS/l/faT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ps0VJiaL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kS/l/faT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ps0VJiaL"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792090043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXq9d9C5ASBHqxliD66OO+lvoLLpO0Hnm5xAQDCwfTc=;
	b=kS/l/faTTycKZiWY+9OCLzn7lIBU33AdmD0SNnZ40RwNNk0RUizynWv1avJjk+bVoBAK1a
	Xz43NlK2PEjHQwV5GT8qjtpKtOvJfAbFrlPxtuGyDNp+oT2H/zCVM1xzRVwtuH7rzhbKOG
	NcRMelS2Tlk6tq/rPs7wM7WKoLSLNpIOjqes8F6pi41WI0GuRG90+4Ir47XXjLTgUaCtlu
	Kt/N0gJc+R22A1eUOeGF7iUdxO43GeWMzC6Yaybcvvdoha0eehM9G6JsTunJan8PB6fYX3
	uowOwuwVf/rDyuiv0lgPDBMJhMhqjwGgeUMfCM85Cy0AiHsLNIMuxbMc+42Dpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792090043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXq9d9C5ASBHqxliD66OO+lvoLLpO0Hnm5xAQDCwfTc=;
	b=Ps0VJiaLGLaw7khi9ErpepVV76x+55SBaFrbrEyFpUNKYxLvZSamgej64yp671soqIXXgD
	v9vUkyWXeAmN6RAg==
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sam James <sam@gentoo.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tomas Glozar <tglozar@kernel.org>,
	Willy Tarreau <w@1wt.eu>,
	x86@kernel.org
Subject: [PATCH v5 1/2] selftests/nolibc: remove the x32 testcase
Date: Thu, 15 Oct 2026 20:47:14 +0200
Message-ID: <20261015-x32_removal-v5-1-2bfef9151fad@linutronix.de>
In-Reply-To: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Support for the x32 ABI is about to be removed from the kernel itself.
This will break the nolibc x32 testcase.

Remove the testcase to avoid breaking the testsuite in general.

This also ends official support from nolibc proper for x32. But as there
is no clear x32-specific code in the nolibc codebase, there won't be a
removal patch for that.

Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Acked-by: H. Peter Anvin (Rosaic) <hpa@zytor.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 tools/testing/selftests/nolibc/Makefile.nolibc | 6 ------
 tools/testing/selftests/nolibc/run-tests.sh    | 7 +------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing=
/selftests/nolibc/Makefile.nolibc
index f70c8dfca0186..895a6ea7a8e45 100644
--- a/tools/testing/selftests/nolibc/Makefile.nolibc
+++ b/tools/testing/selftests/nolibc/Makefile.nolibc
@@ -47,7 +47,6 @@ XARCH_riscv      =3D riscv64
 XARCH            =3D $(or $(XARCH_$(ARCH)),$(ARCH))
=20
 # map from user input variants to their kernel supported architectures
-ARCH_x32         =3D x86
 ARCH_armthumb    =3D arm
 ARCH_ppc         =3D powerpc
 ARCH_ppc64       =3D powerpc
@@ -70,7 +69,6 @@ ARCH            :=3D $(or $(ARCH_$(XARCH)),$(XARCH))
 # kernel image names by architecture
 IMAGE_i386       =3D arch/x86/boot/bzImage
 IMAGE_x86_64     =3D arch/x86/boot/bzImage
-IMAGE_x32        =3D arch/x86/boot/bzImage
 IMAGE_x86        =3D arch/x86/boot/bzImage
 IMAGE_arm64      =3D arch/arm64/boot/Image
 IMAGE_arm        =3D arch/arm/boot/zImage
@@ -106,7 +104,6 @@ DEFCONFIG_sh4        =3D rts7751r2dplus_defconfig
 DEFCONFIG_openrisc   =3D virt_defconfig
 DEFCONFIG            =3D $(or $(DEFCONFIG_$(XARCH)),defconfig)
=20
-EXTRACONFIG_x32       =3D -e CONFIG_X86_X32_ABI
 EXTRACONFIG_arm       =3D -e CONFIG_NAMESPACES
 EXTRACONFIG_armthumb  =3D -e CONFIG_NAMESPACES
 EXTRACONFIG_sparc32   =3D -e CONFIG_TMPFS
@@ -119,7 +116,6 @@ EXTRACONFIG           =3D $(EXTRACONFIG_$(XARCH))
 TEST =3D
=20
 # QEMU_ARCH: arch names used by qemu
-QEMU_ARCH_x32        =3D x86_64
 QEMU_ARCH_x86        =3D x86_64
 QEMU_ARCH_arm64      =3D aarch64
 QEMU_ARCH_armthumb   =3D arm
@@ -151,7 +147,6 @@ endif
 # QEMU_ARGS : some arch-specific args to pass to qemu
 QEMU_ARGS_i386       =3D -M pc -append "console=3DttyS0,9600 i8042.noaux p=
anic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
 QEMU_ARGS_x86_64     =3D -M pc -append "console=3DttyS0,9600 i8042.noaux p=
anic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
-QEMU_ARGS_x32        =3D -M pc -append "console=3DttyS0,9600 i8042.noaux p=
anic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
 QEMU_ARGS_x86        =3D -M pc -append "console=3DttyS0,9600 i8042.noaux p=
anic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
 QEMU_ARGS_arm64      =3D -M virt -cpu cortex-a53 -append "panic=3D-1 $(TES=
T:%=3DNOLIBC_TEST=3D%)"
 QEMU_ARGS_arm        =3D -M virt -append "panic=3D-1 $(TEST:%=3DNOLIBC_TES=
T=3D%)"
@@ -189,7 +184,6 @@ Q=3D@
 endif
=20
 CFLAGS_i386 =3D $(call cc-option,-m32)
-CFLAGS_x32 =3D -mx32
 CFLAGS_arm =3D -marm
 CFLAGS_armthumb =3D -mthumb -march=3Darmv6t2
 CFLAGS_parisc32 =3D -mfast-indirect-calls
diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/se=
lftests/nolibc/run-tests.sh
index dc0b1649c6419..20e0d2dc0e9b9 100755
--- a/tools/testing/selftests/nolibc/run-tests.sh
+++ b/tools/testing/selftests/nolibc/run-tests.sh
@@ -18,7 +18,7 @@ test_mode=3Dsystem
 werror=3D1
 llvm=3D
 all_archs=3D(
-	i386 x86_64 x32
+	i386 x86_64
 	arm64 arm armthumb
 	mips32le mips32be mipsn32le mipsn32be mips64le mips64be
 	openrisc
@@ -119,7 +119,6 @@ crosstool_arch() {
 	mips*) echo mips;;
 	s390*) echo s390;;
 	sparc*) echo sparc64;;
-	x32*) echo x86_64;;
 	parisc32) echo hppa;;
 	*) echo "$1";;
 	esac
@@ -198,10 +197,6 @@ test_arch() {
 		echo "Unsupported configuration"
 		return
 	fi
-	if [ "$arch" =3D "x32" ] && [ "$test_mode" =3D "user" ]; then
-		echo "Unsupported configuration"
-		return
-	fi
=20
 	mkdir -p "$build_dir"
 	swallow_output "${MAKE[@]}" defconfig

--=20
2.55.0

