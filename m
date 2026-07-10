Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D3369985
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704067; cv=none; b=chb0XtLxXRxL5eY+shKLq1s8cQXCAH6Me7Mgsh9cEi31GXhr/iq52PS+Ghfn3QEsaFDhQJxF9WYZ/tWg7uOYCi3mqKYbw9+BP15oFnd5teB78qlwFSTXoM+KoKXsVeZ/XJHbAP+96/jMry/eiOZ44TpFYF1jSvg3szxnvBiNqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704067; c=relaxed/simple;
	bh=NOSfu68wef1au6lAMYSZT5vdGcfs9ogu0Ekucts07Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FsFGoUMThByJU40P90uKm68mX0BQo1gJ+CjK7ToYgidtNYlfZLQETpv+4w0lShTmKHd+IXZZx7xFX0xEy7IzRF4MY5GKLEOs3WJ1WOBKcQ3OmquzfcllRsQn/+8GgWBb/A71+4A0AKHgONu29ztmuTSXtsuyMg+2R9XnfKZLMUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=oDsqfnha; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="oDsqfnha"
X-KPN-MessageId: b79766a2-7c83-11f1-bfba-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id b79766a2-7c83-11f1-bfba-00505699b430;
	Fri, 10 Jul 2026 19:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=mime-version:message-id:date:subject:to:from;
	bh=VbGbRDvoZ4rB9GN0rA3MG11S+bIjGNg5eO9yb2r5wA8=;
	b=oDsqfnhawp5ORyvTjOuPck582kUtt58QRMAiH+KI37APK5SjA4X+y8ySTxJBE9W+8lvQKGO/mKKf/
	 mkWWT3eoVFuWovlPsDKsNqXbLOIe7lqNvC9YDS2tfMNi77MOPalsbUv+Kv0slZnbjeoUZK1QT+sVio
	 iwvZyLZs4jOe8DpMxAETfNjS/x1kBjJ3LOfKj2DNoqOq5FXwKn90MkLRxd/q5brrPofEC5pxych76R
	 AiLFcKozbN1rImnHRdvv+UfAv/Dcve2c1eBvIkS3EqqZPSXnydl61eigmSkiQZS0LFmz+9wd2X+e+x
	 KgKnZ8t6tH2FBaymrluyiEvl92t1yMQ==
X-KPN-MID: 33|6OhWFuOT5PK0r04S+LCoj72Z1CoPDk8UjPfyJVjdjg0OrDX6XeWt+OqAUJklZnM
 BT8WnEndhxuIfly7wm6A6rzU+piVqjs21cA81jFXYyQc=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|kgZ5CtghPLeL1CKHMNi/ZOf8zf1m65aat3UMRcZYMMwKdFMJ+yZ7g7whPRLCKk0
 KBlsVpWylSQFQVWDGUbWzlg==
Received: from daedalus.home (unknown [178.229.235.145])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id b3b6ac26-7c83-11f1-807d-005056998788;
	Fri, 10 Jul 2026 19:20:58 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	Wei Yang <richard.weiyang@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] selftest: fix headers in fclog.c
Date: Fri, 10 Jul 2026 19:17:35 +0200
Message-ID: <20260710171741.837308-1-jkoolstra@xs4all.nl>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fclog.c does not compile because it is missing fcntl.h, needed for
O_RDONLY etc.

There are also some redundant includes that are also in
kselftest_harness.h.

Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>
---
 tools/testing/selftests/filesystems/fclog.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fclog.c b/tools/testing/selftests/filesystems/fclog.c
index 551c4a0f395a..593a5136e991 100644
--- a/tools/testing/selftests/filesystems/fclog.c
+++ b/tools/testing/selftests/filesystems/fclog.c
@@ -6,10 +6,8 @@
 
 #include <assert.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <sched.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
 #include <unistd.h>
 #include <sys/mount.h>
 
-- 
2.55.0

