Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEA3418363;
	Thu,  3 Sep 2026 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421111; cv=none; b=hnk/V3jyaz3YDFcz8nVGYZjRFVob5Y9tEQSD59AejhSLuYWVTUJCJLFG1xHcXUsmJ4vVVXUfk5/KpWEMEHUxodCe0MJ0pNvxfF9boZQ43ZUWDSnMNc6souPSXBDUehx8C2vWdLOUHlWFg8RgsEYbSrs0rAL86Qe2/4G+C1o893k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421111; c=relaxed/simple;
	bh=Di/4PqdAEQOJQ/ayv+51BektmeNr4Z4vFgZ+NMwhuQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SC/P7HmsCiahNCpvy1tIBfCbabIexsx9fBx7TgeghdGiV53Pbv7/9q5imH6MjEJfpEAwIPpS2M0QmTRw00AIANSwyrEW8zD08EeAN8pP3G7GPqFPCowINN33HxmKxIXL9MvTBPqBuZNCZQoqkNW98pt9GGg6Hf8gcYBVU5tUAw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oJu12IJq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KMzkbaDi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oJu12IJq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KMzkbaDi"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnKv5IjDqBc3X8/pWetZaLv1z0pddVPv9JqcNEXKQZY=;
	b=oJu12IJqMxeK0hNpb/I2q3QbkkjMqmSAAfJjDJ5suJJuiZiZCwvRf5+OG06Dk+v6Dmr8at
	XfqPM8pt3T/iyoBVVhjUA/GK3oMARbHYgSxzr09R3yU5tGWSxPiGyZHNw61jfDDVcD3tbb
	tfoBxNnDySA5BNXVI3Px+n6r9L2fglJzi9gmeEH09/sYRY0Z/krq413xcoPoj/4o13YoPJ
	RVs/tR5sp6Hm4YEZF7QkvczctOQMJh9+MCQt20CDdzaIIsC8H3j9iDvwbbgNODNZtaDg/F
	jxybzml/aaeb6uZ1Va6Z4OUjizGfv1Bv0YpYR/nQM7p8y6s12F2lFmw7LwlJQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnKv5IjDqBc3X8/pWetZaLv1z0pddVPv9JqcNEXKQZY=;
	b=KMzkbaDiBT6+7uGSkxkiJ7f4AzUIonesZ+rBcpX61I6/XVa25Va1Nm6rk1k0zOJfXR7DvX
	YyxEe8XClRiBVIDg==
Date: Thu, 03 Sep 2026 09:38:17 +0200
Subject: [PATCH v2 5/8] selftests: vDSO: vdso_test_gettimeofday: Use types
 from vdso_types.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-vdso-test-types-v2-5-1eec04eb3658@linutronix.de>
References: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
In-Reply-To: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421097; l=1447;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Di/4PqdAEQOJQ/ayv+51BektmeNr4Z4vFgZ+NMwhuQM=;
 b=Xh0v3S2AW3PRmOt0/MiYKx1JPmdS19myqwQCRLwLAXCmstTdWORW+5Dl2gjIhL1ln3HjXbNsw
 iowx925zyKdDSo3bjieKK7jguksV0jzJbFHGPDGEiSntqQ85rIgoL4S
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The libc types are not necessarily compatible with the vDSO functions.

Use the dedicated types from vdso_types.h instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
index 990b29e0e272..2119a6429835 100644
--- a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
+++ b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
@@ -12,12 +12,12 @@
 
 #include <stdio.h>
 #include <sys/auxv.h>
-#include <sys/time.h>
 
 #include "kselftest.h"
 #include "parse_vdso.h"
 #include "vdso_config.h"
 #include "vdso_call.h"
+#include "vdso_types.h"
 
 int main(int argc, char **argv)
 {
@@ -33,15 +33,14 @@ int main(int argc, char **argv)
 	vdso_init_from_sysinfo_ehdr(getauxval(AT_SYSINFO_EHDR));
 
 	/* Find gettimeofday. */
-	typedef long (*gtod_t)(struct timeval *tv, struct timezone *tz);
-	gtod_t gtod = (gtod_t)vdso_sym(version, name[0]);
+	vdso_gettimeofday_t gtod = (vdso_gettimeofday_t)vdso_sym(version, name[0]);
 
 	if (!gtod) {
 		printf("Could not find %s\n", name[0]);
 		return KSFT_SKIP;
 	}
 
-	struct timeval tv;
+	struct __kernel_old_timeval tv;
 	long ret = VDSO_CALL(gtod, 2, &tv, 0);
 
 	if (ret == 0) {

-- 
2.55.0

