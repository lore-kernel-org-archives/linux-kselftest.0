Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BF82ECE9B;
	Sun,  1 Mar 2026 01:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329676; cv=none; b=XiRX9iMTqZQPgumJwkWzzmvyW+SXoFa3+vd3g8wzW7JCAxKGpVf9E+ZJ6MlzH4YGWtRWQMXoSh3UVfZKkdX+txUV/9eM0yKmf5yA6kw5NI30GVCN0NuMUU9J0MMz46PkvD9ld83jdw07q/VrjolJh4X+X9Jv1n3pAQcc/Z+RTzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329676; c=relaxed/simple;
	bh=qCr7+LBlG4A+YvgRKNFsG3TL5b+R2l8bVbhYzIFg9hA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RH5FaQmfPURTURbVFA9DkztCf//9NbYI+FAuhUmX1rZAnsoYVHRyT51PPE0f9TLu3I2EutZ9jexb7IjO2ZFiSa3JeapwBrte7NCPVW6wSGoPfRgMqfrY789rlFD4CclUnr+2nFUFfGZbB1qbk7ApJLm5x0DDMqFBzTd2xsFlnBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=WCv0NBHv; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="WCv0NBHv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=k/Lj5i3hsvVfDGVhRK3+YKT9QvZIKPXBH/Z/ZtzqLvY=; b=WCv0NBHv82Ld
	t7JDCUn44GJRogZKreuDTaAB1XXDcrFNEi6pwl4kZ9gJUX9okDTksmJ1LHiJwes1MJ7lJb1J0FzHp
	lbH9TXqV2U0qgPSnFXhYSKNSzedGznlfHWNMJphZIIgZp38ce/FCr0Koq7okUDbvbrPHWA9Zauy1c
	mSdv6LSdS++xnkw8gOzO74366ZIVUvMEShV3uptFbooIPHDRP/x54N+6hCNRJdfe5tT5RY8TgpaJZ
	D4VoO0unnHr8mPySTR1UEGHoAmYiNMDajz5a0DHq74fy70z+v7V/QP8QauMmxx4u7dMncCgK09J+P
	FDFlYKEfi59ddaCbMoHtvg==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1vwVsq-00Cd8g-0k;
	Sun, 01 Mar 2026 02:47:33 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 6211lcni454271
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 1 Mar 2026 01:47:38 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 6211laAW454270;
	Sun, 1 Mar 2026 01:47:36 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH] selftests: x86: test_shadow_stack: return KSFT_SKIP when test is skipped
Date: Sun,  1 Mar 2026 01:47:33 +0000
Message-ID: <20260301014733.454260-1-aleksey.oladko@virtuozzo.com>
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
 tools/testing/selftests/x86/test_shadow_stack.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 21af54d5f4ea..1747ea4cb725 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -35,6 +35,7 @@
 #include <sys/signal.h>
 #include <linux/elf.h>
 #include <linux/perf_event.h>
+#include "kselftest.h"
 
 /*
  * Define the ABI defines if needed, so people can run the tests
@@ -981,7 +982,7 @@ int main(int argc, char *argv[])
 
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
 		printf("[SKIP]\tCould not enable Shadow stack\n");
-		return 1;
+		return KSFT_SKIP;
 	}
 
 	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
@@ -991,12 +992,12 @@ int main(int argc, char *argv[])
 
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
 		printf("[SKIP]\tCould not re-enable Shadow stack\n");
-		return 1;
+		return KSFT_SKIP;
 	}
 
 	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
 		printf("[SKIP]\tCould not enable WRSS\n");
-		ret = 1;
+		ret = KSFT_SKIP;
 		goto out;
 	}
 
-- 
2.43.0

