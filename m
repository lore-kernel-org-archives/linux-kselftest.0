Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E405C14A;
	Sun, 22 Mar 2026 23:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774222810; cv=none; b=iPPYK69fFmEiaQWZsG+R27l5rUNbWv5KDvPbDANoO/JI14vmLY43SvSRu2/wWpNBiCna3ysIUi5rkTMxXUmGrhENGuYiKviv+RFGypzeFfw2jXfwuxFBY6mZdu5TS5QRob5yoCfnmj4GsVvmj7pNFBNRuAPBJ45p3j1t/zuy9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774222810; c=relaxed/simple;
	bh=YY0WnJpl9efQsesPTLITDM5ipSbgubyFbN3IYd2HlvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JgA0prc6yU0z0ZKd12EYBkwjP/sMtDKvh3RZLzLPznVKQ5aBQal8aENFkdvYOl31OGq9499tZGqwdoXmrOtifJC22FlzHDI5LJuBdVmjnVI3gJgLJi/XLbSKGi24RmmMfIpBt1npqNXSYZNPZMUQr+68++ZDv+AMCI01UpCThog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=By1MIVdi; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="By1MIVdi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=aRpSU/sj+SpBgYPHzOc3KxAO0LfrxvPpZ7/TLnsSX9E=; b=By1MIVdiu/jZ
	o/DSqfq/3/4rwCwr6+5y8LGxEeL+sgz2gumsTILvguBAbCAOqA0ugR7tnMcOurgGKLSsSJFAuZj5V
	x+L3F1GDnCisRnxLtTdsHmkDkASP7UDZ3dore+IvsLcRxuOm9ohG89NDWPy7vC3HY4qSoYs7Muy4v
	RWIGf/koSv/PF7BwUK8fiY5e4iIT8C0cIkvpl9mEaapLCtGHsdoxnLFlccQLJFT46oUo/JNNQ8Tec
	/HlrqZaecl3yj3RPLWknoPjxrNTwMeemkPCZx04FOSmmGFDg0zjiMCFDgiwbxJQijezuk2jfmWtqL
	9bSASehaFNplUtg/AE+CTg==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1w4SMa-006Xfv-2t;
	Mon, 23 Mar 2026 00:39:36 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 62MNdgih190537
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 22 Mar 2026 23:39:42 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 62MNddQL190536;
	Sun, 22 Mar 2026 23:39:39 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
        Edgecombe@dev004.aci.vzint.dev, Rick P <rick.p.edgecombe@intel.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH v2] selftests: x86: test_shadow_stack: return KSFT_SKIP when test is skipped
Date: Sun, 22 Mar 2026 23:39:38 +0000
Message-ID: <20260322233938.190526-1-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_shadow_stack prints a message indicating that the test is
skipped in some cases, but still returns 1. This causes the test
to be reported as failed instead of skipped.

Return KSFT_SKIP in the skip path so the result is reported
correctly.

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>

---
v2:
- return SKIP only for "Could not enable Shadow stack" case
- Changed message from SKIP to FAIL for remaining cases
---
 .../testing/selftests/x86/test_shadow_stack.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 21af54d5f4ea..4c5437846d26 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -35,6 +35,7 @@
 #include <sys/signal.h>
 #include <linux/elf.h>
 #include <linux/perf_event.h>
+#include "kselftest.h"
 
 /*
  * Define the ABI defines if needed, so people can run the tests
@@ -64,7 +65,7 @@
 int main(int argc, char *argv[])
 {
 	printf("[SKIP]\tCompiler does not support CET.\n");
-	return 0;
+	return KSFT_SKIP;
 }
 #else
 void write_shstk(unsigned long *addr, unsigned long val)
@@ -496,7 +497,7 @@ int test_userfaultfd(void)
 	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
 	if (uffd < 0) {
 		printf("[SKIP]\tUserfaultfd unavailable.\n");
-		return 0;
+		return KSFT_SKIP;
 	}
 
 	reset_test_shstk(0);
@@ -820,9 +821,11 @@ static int test_uretprobe(void)
 
 	type = determine_uprobe_perf_type();
 	if (type < 0) {
-		if (type == -ENOENT)
+		if (type == -ENOENT) {
 			printf("[SKIP]\tUretprobe test, uprobes are not available\n");
-		return 0;
+			return KSFT_SKIP;
+		}
+		return 1;
 	}
 
 	offset = get_uprobe_offset(uretprobe_trigger);
@@ -981,21 +984,21 @@ int main(int argc, char *argv[])
 
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
 		printf("[SKIP]\tCould not enable Shadow stack\n");
-		return 1;
+		return KSFT_SKIP;
 	}
 
 	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
-		ret = 1;
 		printf("[FAIL]\tDisabling shadow stack failed\n");
+		return 1;
 	}
 
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
-		printf("[SKIP]\tCould not re-enable Shadow stack\n");
+		printf("[FAIL]\tCould not re-enable Shadow stack\n");
 		return 1;
 	}
 
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
-		printf("[SKIP]\tCould not enable WRSS\n");
+		printf("[FAIL]\tCould not enable WRSS\n");
 		ret = 1;
 		goto out;
 	}
@@ -1057,6 +1060,7 @@ int main(int argc, char *argv[])
 	if (test_ptrace()) {
 		ret = 1;
 		printf("[FAIL]\tptrace test\n");
+		goto out;
 	}
 
 	if (test_32bit()) {
-- 
2.43.0

