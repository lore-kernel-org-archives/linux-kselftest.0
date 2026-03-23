Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B339099A;
	Mon, 23 Mar 2026 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262756; cv=none; b=leC2Bh4q4pJp1qG8yS7Kllyd5M+jwZd2E4Eoe3D+IQwVEeEoF9OEZX6VdqH+55S3twRm27taZzhBzg/nWzQZxZTquLwDjOVcR1rB9inNh0/c147u5pEW/gBrK9xOy/y2vuKYF3oN1x/mUpOoZov7mYPFXl8vaHixVSno08JCJRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262756; c=relaxed/simple;
	bh=JYsprqtcku75CWvDcv3cdJaGucnAFj+1ng9vz7r448U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0rQG/4NzcYryBX7aLZBf8cewIlHAbvwphq5fGC4rnJjamCs22hLu8KDvnRq/wPon67NF42naDv/pkL/3ABacFtIY3mq0aBZ6v28LI2O14gi9KwCbS+INQ728PuSUvURX16VuHqFAJz43tNVUHxU9Yn3c9h0XFuXMkvYU1uAOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=k9ENy+T/; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="k9ENy+T/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=Vh2cYPwdhN0oWbsH3zOaPTdzsuCgZOI3qcYKiSCJPMc=; b=k9ENy+T/G6R1
	UWqys9GnIjRiJg4mfzonaGSm9RWJyMfGx8sCZ47oIlWwKkufkwAN0ZzPf07W6vy5Rx1v72FcCG+up
	FedaTdb0T6+WMfV/F0JLRt81hCiIxJRAJtjABDPYf48cMrKxtsGeM862aYTI1qjoHAFomUm1iZ2+V
	bLYR6Mp6hCUoUcYnsePLSr6e9KwJLFzQSv7QRtYB+r75JbHat80KLKdKEDmTr+pb55AK/mM5/OohO
	CREb0TagS5BxahUFIP/qjZQdaDZQMganUaOZkleLD0yE6WC1/BR1jKORf0ITb1YKfDA5JV70i85jx
	sIZV3X7PvN+LqZvFCLnJ2w==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1w4cl4-0077Vt-0J;
	Mon, 23 Mar 2026 11:45:33 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 62NAjeO3198749
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 10:45:40 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 62NAjcrG198748;
	Mon, 23 Mar 2026 10:45:38 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
        Edgecombe@dev004.aci.vzint.dev, Rick P <rick.p.edgecombe@intel.com>,
        Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH v3] selftests: x86: test_shadow_stack: return KSFT_SKIP when test is skipped
Date: Mon, 23 Mar 2026 10:45:36 +0000
Message-ID: <20260323104536.198738-1-aleksey.oladko@virtuozzo.com>
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
Changes in v3:
- Fixed incorrect return values in test_userfaultfd and test_uretprobe
- Link to v1: https://lore.kernel.org/linux-kselftest/20260322233938.190526-1-aleksey.oladko@virtuozzo.com/T/

Changes in v2:
- return SKIP only for "Could not enable Shadow stack" case
- Changed message from SKIP to FAIL for remaining cases
- Link to v1: https://lore.kernel.org/linux-kselftest/20260301014733.454260-1-aleksey.oladko@virtuozzo.com/T/

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
---
 .../testing/selftests/x86/test_shadow_stack.c  | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 21af54d5f4ea..d52c8c2f7800 100644
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
@@ -820,9 +821,11 @@ static int test_uretprobe(void)
 
 	type = determine_uprobe_perf_type();
 	if (type < 0) {
-		if (type == -ENOENT)
+		if (type == -ENOENT) {
 			printf("[SKIP]\tUretprobe test, uprobes are not available\n");
-		return 0;
+			return 0;
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

