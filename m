Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CA63ECBD2;
	Fri, 27 Feb 2026 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174767; cv=none; b=kjhUlLBBHKs806YJ7p54euCTQ1LdvBIspgLvhM8KzjlM7uq9I24fq24566Jo4GblTOwd8NKLCBfl8Ilj/kIWCP2Q5hiqYrabsp0MBxb4N1/qUDrRSPBCggmTaGyFMntWmC124Kqgb2Bw6zbdNGeqJLJXedCoFuFXnx1lYdQ2o+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174767; c=relaxed/simple;
	bh=QJMybOX9OzGtSZQCKdMpT0WREYp0r6b7yNMdehba/rY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEZ0hasg6p9pUPDTT42d9lXiFDqcfltAYtX/yQmCX+rBR0sA1JUf6k6pCptMXTbyldn7Hw7Dx/GgrrAXgNptB3++mye12Fb6MnpG9FNkG1SUJGf3flokZ/t7WHaoQQo8CsD3jSlQLGwvKFdWyJf+3iQOiKc5yfK+sUaY1nM0Ur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pfhCUZKi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mdhfMeVN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pfhCUZKi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mdhfMeVN"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufhnx4JeHKyHe742vQeks9fGQvpbO2kyDWtB8r2S2X8=;
	b=pfhCUZKigC/+I6Ky2++bQcer4UgWcNmpKTqjtKXrW54Mc7z1J6w7qKXIwuhmjb8soXTZZb
	TQF3B8RovSQRi4nLM2XoT18zApoqZkQC4x+ITk0efUv1ZwelEnakPwsc0v6oGlbLOI8xfS
	krVe8+9rjHT7J/EWWFyUkTqwh3XjsEUGxDL5eSecmwAvL6+yNdPnuGLTNiTHC1j4omXD2w
	Q8UEUCdh5DyRGKwLb/uYArB42D/XccBLLoxdtd4jZCIxI+W9AisUV2dPM4n53uLnzycxB2
	1jjbe5Uc1chHQH9tcKZG74V7NldgFmyEh/5ayY/fh4pvLiN0azjwxLUwHKYkag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufhnx4JeHKyHe742vQeks9fGQvpbO2kyDWtB8r2S2X8=;
	b=mdhfMeVNYUwMHS9K7XURuwnPtS/wMKNJMYoYTiNTlkuHgdT2oW7b03Ad4XfaBstpvVIewt
	XDsYDLiMokXNnWDA==
Date: Fri, 27 Feb 2026 07:46:00 +0100
Subject: [PATCH v2 5/6] selftests: vDSO: vdso_test_correctness: Use
 facilities from parse_vdso.c
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-selftest-cleanups-v2-5-d84830fa8beb@linutronix.de>
References: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
In-Reply-To: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174759; l=4190;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QJMybOX9OzGtSZQCKdMpT0WREYp0r6b7yNMdehba/rY=;
 b=imbeRzC/066sq3HzGO6qlpGwl7r+6XRI12/EXModBqA8F4aVikcuJmQ6Hmeosemivan+sV/gh
 2q81yISqUaSCZDVJIEd+UJJKLQI5TvBis6NeCi0FyfM3XQUXXGXGR8Q
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The soname from the vDSO is not a public API. Furthermore it requires
libc to implement dlsym() and friends.

Use the facilities from parse_vdso.c instead which uses the official
vDSO ABI to find it, aligned with the other vDSO selftests.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/Makefile              |  4 +--
 .../testing/selftests/vDSO/vdso_test_correctness.c | 30 ++++++++++------------
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
index 2de5cef311c8..a61047bdcd57 100644
--- a/tools/testing/selftests/vDSO/Makefile
+++ b/tools/testing/selftests/vDSO/Makefile
@@ -26,13 +26,11 @@ CFLAGS_NOLIBC := -nostdlib -nostdinc -ffreestanding -fno-asynchronous-unwind-tab
 $(OUTPUT)/vdso_test_gettimeofday: parse_vdso.c vdso_test_gettimeofday.c
 $(OUTPUT)/vdso_test_getcpu: parse_vdso.c vdso_test_getcpu.c
 $(OUTPUT)/vdso_test_abi: parse_vdso.c vdso_test_abi.c
+$(OUTPUT)/vdso_test_correctness: parse_vdso.c vdso_test_correctness.c
 
 $(OUTPUT)/vdso_standalone_test_x86: vdso_standalone_test_x86.c parse_vdso.c | headers
 $(OUTPUT)/vdso_standalone_test_x86: CFLAGS:=$(CFLAGS_NOLIBC) $(CFLAGS)
 
-$(OUTPUT)/vdso_test_correctness: vdso_test_correctness.c
-$(OUTPUT)/vdso_test_correctness: LDFLAGS += -ldl
-
 $(OUTPUT)/vdso_test_getrandom: parse_vdso.c
 $(OUTPUT)/vdso_test_getrandom: CFLAGS += -isystem $(top_srcdir)/tools/include \
                                          $(KHDR_INCLUDES) \
diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 9b564888e74d..a94ab4d597b1 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -11,18 +11,20 @@
 #include <time.h>
 #include <stdlib.h>
 #include <unistd.h>
+#include <sys/auxv.h>
 #include <sys/syscall.h>
-#include <dlfcn.h>
 #include <string.h>
 #include <errno.h>
 #include <sched.h>
 #include <stdbool.h>
 #include <limits.h>
 
+#include "parse_vdso.h"
 #include "vdso_config.h"
 #include "vdso_call.h"
 #include "kselftest.h"
 
+static const char *version;
 static const char **name;
 
 #ifndef __NR_clock_gettime64
@@ -102,39 +104,32 @@ static void *vsyscall_getcpu(void)
 
 static void fill_function_pointers(void)
 {
-	void *vdso = dlopen("linux-vdso.so.1",
-			    RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
-	if (!vdso)
-		vdso = dlopen("linux-gate.so.1",
-			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
-	if (!vdso)
-		vdso = dlopen("linux-vdso32.so.1",
-			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
-	if (!vdso)
-		vdso = dlopen("linux-vdso64.so.1",
-			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
-	if (!vdso) {
+	unsigned long sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
+
+	if (!sysinfo_ehdr) {
 		printf("[WARN]\tfailed to find vDSO\n");
 		return;
 	}
 
-	vdso_getcpu = (getcpu_t)dlsym(vdso, name[4]);
+	vdso_init_from_sysinfo_ehdr(sysinfo_ehdr);
+
+	vdso_getcpu = (getcpu_t)vdso_sym(version, name[4]);
 	if (!vdso_getcpu)
 		printf("Warning: failed to find getcpu in vDSO\n");
 
 	vgetcpu = (getcpu_t) vsyscall_getcpu();
 
-	vdso_clock_gettime = (vgettime_t)dlsym(vdso, name[1]);
+	vdso_clock_gettime = (vgettime_t)vdso_sym(version, name[1]);
 	if (!vdso_clock_gettime)
 		printf("Warning: failed to find clock_gettime in vDSO\n");
 
 #if defined(VDSO_32BIT)
-	vdso_clock_gettime64 = (vgettime64_t)dlsym(vdso, name[5]);
+	vdso_clock_gettime64 = (vgettime64_t)vdso_sym(version, name[5]);
 	if (!vdso_clock_gettime64)
 		printf("Warning: failed to find clock_gettime64 in vDSO\n");
 #endif
 
-	vdso_gettimeofday = (vgtod_t)dlsym(vdso, name[0]);
+	vdso_gettimeofday = (vgtod_t)vdso_sym(version, name[0]);
 	if (!vdso_gettimeofday)
 		printf("Warning: failed to find gettimeofday in vDSO\n");
 
@@ -429,6 +424,7 @@ static void test_gettimeofday(void)
 
 int main(int argc, char **argv)
 {
+	version = versions[VDSO_VERSION];
 	name = (const char **)&names[VDSO_NAMES];
 
 	fill_function_pointers();

-- 
2.53.0

