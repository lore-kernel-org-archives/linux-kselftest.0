Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1FF4848BC;
	Thu,  8 Oct 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450479; cv=none; b=ClEWPucBPyDn7gAEIujWp43i2J+v86HjTAvLqa5lhTfNWsxtxDdrqrtdCNCyYk0GkHQqUQqTHx0gTqyGGBwOe6cd55ruGXmmpybWC/PlYul9TPIMFEu05T1OAUmLhLA1C1R67KsOZeg8HAVXRg1I0jFztS2TmPoiHUno5xVgxAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450479; c=relaxed/simple;
	bh=mTWXl1aY2EQ8EGEmeX4WuudcY5BppaRY1QwAzTHJzX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+eh4tCfgmvsBJxemSdxWukEGqHUbzdQrHhl185s0g2s5cCp9SB+1+hDGXi/hWDVNqaMU3LfhoITsTPWXGn5/Uzz3CIiOckjRAuzXyXnCFSOGlRDSUBv5n+z+QITJ6FXG8Xd7taCkrM7t4gUIFau5uAw1GFWCEPzuACUoFUakaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MJb6z/u4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qxeu7/dT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MJb6z/u4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qxeu7/dT"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791450466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3UV5WhIlGJoQPgJz40NsEZKfhqKXrsfoxMNp+HRn/c=;
	b=MJb6z/u4U51BoI7+qITW7UC8aACCEwsSzeH7UKcWysUBR3Nageadg49fXRWDGDtyqlN9Pm
	uVmanAlxpusQXSKdrog2HEJJjgKeZ5kKZteZj527j80gMP0dH8hFunYNwI8hLqdtGA1q7+
	vituE5zyREG0HRXIlhoQZ7pNguYF8c6sJyupiAn3MZTiLXkTPPCOAGZMJixTaAHPVbepod
	GMtC8ZTkwAeriKg6U+f7J4avIKnQiqnUyR3SFNrZyDA4/00K1txn7sEuS9xrHXaRBRxeWN
	TStRdd7ZIw9K1CeA9jrgQcF5N7K022KoZe3cK9ztQThC9Waaf3KLYx2ZEPEQ6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791450466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3UV5WhIlGJoQPgJz40NsEZKfhqKXrsfoxMNp+HRn/c=;
	b=Qxeu7/dTsPCYn8MNFl/UBjqnjPkH8snGXi84BQikrpwaWFGDksmdVWTbddmywPAGg9uQFN
	ik8aocN5Dcj4zvCw==
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [PATCH v4 1/2] selftests/nolibc: remove the x32 testcase
Date: Thu,  8 Oct 2026 11:07:42 +0200
Message-ID: <20261008-x32_removal-v4-1-d389a193c506@breakpoint.cc>
In-Reply-To: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

From: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Support for the x32 ABI is about to be removed from the kernel itself.
This will break the nolibc x32 testcase.

Remove the testcase to avoid breaking the testsuite in general.

This also ends official support from nolibc proper for x32. But as there
is no clear x32-specific code in the nolibc codebase, there won't be a
removal patch for that.

Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
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

