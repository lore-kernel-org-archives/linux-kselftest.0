Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819AC39DBCC;
	Thu, 13 Aug 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619089; cv=none; b=bRN6e3LS7zic6vqEFer7Yw4iam8Q1ZgZq1JPUsfpVWfg/S+cFDAqTdvHG8NMQ5QNiqsFpCppqQGd+m1En+rbwkkAZI2O4uRb8rRmQlVEjQ9yIcv9PT7jcdZviNzPitjTuuHmVxM06DgcHWtwPPtNWSI8bABa7L9BrRmsCDVrI8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619089; c=relaxed/simple;
	bh=PcKCi1LRbWnZy64nxiug7UjKJeLsZzyf1j+yiyWTKZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFzm7YA1oS1udBMV4Xz7VWo4GhBXe1octEuzYNG2AekPQBz0NcwixEMdWSeAn9XojD51dHWM506V2LS14THTSNJnIkqGd7VMJWO1dvWnp6wWXC4K8WxQDrERB0+lAj0SnfDteVgtWY1Higmia+sk6VZVAksgmfMDxVkQCbgUj2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J+CKo+Qx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kIsHvHi4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J+CKo+Qx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kIsHvHi4"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786619081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=drylERYSkymMGuM71Lww0ecHEIF1JsaXC010vxJDEHc=;
	b=J+CKo+QxLt7W1XYe43zmJsjrxTH+4WlOCGl6qKbASeGtp3X1ov5SFJ0YJwFY824OVi/SWt
	vUT3OBv7r6fHJsXCr+LmzLB3nAgF/mrW552nVkH/W5vwTw8z2MipZajES4muihtK3XfKi5
	JMB/4akdk2AsnrjJwLdFk2o8XwV638+8b9d/plyNCYrdkJRbgu/DFaLHaXZK+vSP1LRSn1
	SuF/SPSBjFRVE+GkhmskqHZKIadewsjC62reM2TdSSMZCgK6kTWgWjeUBkbLsc1RxkLwcS
	/Ch13ueab1EwJt2DCryG1MLST86a1CNrneddIEfAQeUd474MULOfMAktgwTOXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786619081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=drylERYSkymMGuM71Lww0ecHEIF1JsaXC010vxJDEHc=;
	b=kIsHvHi4IH0CZs929YaJR3EeJF1DDjgSIiJymDq5HJKQBKe3OwvYQJrz0+H7aNjmXpr4C4
	HdTsXAESosnJLCAw==
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
Subject: [PATCH v3 1/2] selftests/nolibc: remove the x32 testcase
Date: Thu, 13 Aug 2026 13:04:32 +0200
Message-ID: <20260813-x32_removal-v3-1-e8f96cd15478@linutronix.de>
In-Reply-To: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
References: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
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
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 tools/testing/selftests/nolibc/Makefile.nolibc | 6 ------
 tools/testing/selftests/nolibc/run-tests.sh    | 7 +------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing=
/selftests/nolibc/Makefile.nolibc
index 06f881e2e90c3..dadde26b9d3bf 100644
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
@@ -118,7 +115,6 @@ EXTRACONFIG           =3D $(EXTRACONFIG_$(XARCH))
 TEST =3D
=20
 # QEMU_ARCH: arch names used by qemu
-QEMU_ARCH_x32        =3D x86_64
 QEMU_ARCH_x86        =3D x86_64
 QEMU_ARCH_arm64      =3D aarch64
 QEMU_ARCH_armthumb   =3D arm
@@ -150,7 +146,6 @@ endif
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
@@ -187,7 +182,6 @@ Q=3D@
 endif
=20
 CFLAGS_i386 =3D $(call cc-option,-m32)
-CFLAGS_x32 =3D -mx32
 CFLAGS_arm =3D -marm
 CFLAGS_armthumb =3D -mthumb -march=3Darmv6t2
 CFLAGS_parisc32 =3D -mfast-indirect-calls
diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/se=
lftests/nolibc/run-tests.sh
index 6460e25001de8..78d59d9e4a8aa 100755
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
@@ -118,7 +118,6 @@ crosstool_arch() {
 	mips*) echo mips;;
 	s390*) echo s390;;
 	sparc*) echo sparc64;;
-	x32*) echo x86_64;;
 	parisc32) echo hppa;;
 	*) echo "$1";;
 	esac
@@ -197,10 +196,6 @@ test_arch() {
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

