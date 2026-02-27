Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91423E9F83;
	Fri, 27 Feb 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174766; cv=none; b=Uohu5qv5z3JOi8RsNkZgWQcgvtgNrdV96YuR0uPlZ2ppr7d8iDevIWhShFmRY7dNEP4A83cdAZmVu5atpCeVs2JEi7YhhDBxWWOujLXl0taKxxPZCPhc7TXF96ByTxZgXAMjyeI6ayTj0tzltlIuVet3ZJyeA/PnaYxspdbvl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174766; c=relaxed/simple;
	bh=rfzm73bfkrptOgHpM8yLIrYhzp2cZHXl5ElMlQSXcRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JH4jqAs38fc8qwKY0WC19hIEyADG+lf0ee843JjoXhtLmZoWftBto2YK8ek2HF2nCHpOwK5AT6k+i86Q6QHW3TaaR0RT3GGzvZdgWV+8Sf/IVCnbmK0P659P1bhpODfgANfiiU+AYpFkHbMX3au2lIdPnq0AvIPZZAGV1ogwY54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dzUd0w7/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=38uj6lZC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dzUd0w7/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="38uj6lZC"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N3GsQdcdMBszNDuQPGFvk3xaLQW8ZKLNlkl6+18g9Aw=;
	b=dzUd0w7/fsSTOjGi+1D0f+kfH0ecPLl5gYjTWuf4Ay4KpEEUTQ993JfZFSv0Ry6JZZ95Om
	5DJBLccqDh3nFxY8gscHzNNj5kYzo+RnMmCkIRepxXXwH+1kn7nF/++ZPVUuoruJ01YpgN
	0bqfXGxKHn1tZMx4OGllCb4qF58Hs7xsEqif95tBYrnelp4Y0hOo4Z4a2lrCOIlH4Aos5w
	E0h4QD60bLA2DvurOhNwW+0YmJvEn+621S5zS/yR+kPUVsf0yOcGg6vii9x96C5vjQnjgC
	2fl/vCI/RvexS15M7t05aEGx7Miruwv6rh+VcFGqWkeBNGP1Cp2fa5lKcUKZxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N3GsQdcdMBszNDuQPGFvk3xaLQW8ZKLNlkl6+18g9Aw=;
	b=38uj6lZCKDyz/54knPtzhqNZ92NFxhz5b05H8gsqBRlh0VvcRSCzGJ1dz5mJIbLT6K2cvA
	3B9CbZ8P79fFEYDA==
Date: Fri, 27 Feb 2026 07:45:58 +0100
Subject: [PATCH v2 3/6] selftests: vDSO: vdso_test_correctness: Drop
 SYS_getcpu fallbacks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-selftest-cleanups-v2-3-d84830fa8beb@linutronix.de>
References: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
In-Reply-To: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174759; l=802;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=rfzm73bfkrptOgHpM8yLIrYhzp2cZHXl5ElMlQSXcRM=;
 b=leC8mEOxir/sxssHL0A7UODhQLtp2BC6v7u9nbJQ3OspD/86hF97ALx7L6CiWLV7EqmRmq6N1
 oQgi3jGySURBdllvnpIx+n9GTqis5o989I+gTbqyYXZWyT0BURiUyVa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

These fallbacks are only valid on x86 and unused in the first place.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_test_correctness.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 055af95aa552..2a2d9b01a938 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -25,14 +25,6 @@
 
 static const char **name;
 
-#ifndef SYS_getcpu
-# ifdef __x86_64__
-#  define SYS_getcpu 309
-# else
-#  define SYS_getcpu 318
-# endif
-#endif
-
 #ifndef __NR_clock_gettime64
 #define __NR_clock_gettime64	403
 #endif

-- 
2.53.0

