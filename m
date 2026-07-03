Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3B2F25F0;
	Fri,  3 Jul 2026 03:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783048888; cv=none; b=j8XcJ3gIRLt40LKiL3i+q5hIxLINwfbgSMHeY7cd5MjseC+8swenszdrBI3tG9nFzr4ZeRcv1v5YJcatNiMuMDBtPC2ZQJ1Hi82bXP4J1W37TLbe9/1bI0LtZrwuxTNrdhR0EXiSL8/D5MFmpRO1Lwe7who2BkFMeCQwdoTN9S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783048888; c=relaxed/simple;
	bh=z1aiODlCJTWrC3r96M/DsfMTds42Y7a9IYcewvnNb90=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=upvCqzb71DgucOcZiRCHc97f/og4RcLzQXxEW/UgKrcsZb+EsyuAJ1tE3BNc0QknaywTKpvy2NYkPnGdz6IOGPtaYqZS2o8DAm+a6hnCCr37RhEu2InhMIcO1hUs0qPg3IF8F5+/R6qVFGMx8r3TXA91Uwxlct9dvpBk0LkaRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jHfpcWQ1; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jHfpcWQ1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783048875; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=WEOsts3c13KaA8+x+S7vVXD7qF6TrRDshtuimpWdLko=;
	b=jHfpcWQ1OQ0f/THJkqQMhOIMTb6EjNa4G672vZY5DU+NklbKdILIAv6vA3BsFPOFD9pL5f1QqinhWsuKstb0czqm8dN88LISXkFkbI8Ti1Bl9haJz45mowDhrypcl6Ek8ObPSRJQmICLMr4T9CVPNU4hlVxGMgVztomPDdEK+iI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X6Hd1CW_1783048874;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X6Hd1CW_1783048874 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 03 Jul 2026 11:21:14 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	andrealmeid@igalia.com,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH] selftests/futex_requeue: Increase futex timeout to cover slow hardware
Date: Fri,  3 Jul 2026 11:21:13 +0800
Message-Id: <20260703032113.535-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running  mixed stress tests (stess-ng, kernel selftests etc.)
on a slow machine, futex 'requeue_multiple' case failed randomly,
with message:
"
    waiter failed errno 110
    not ok 2 futex_requeue many returned: 0 Success
    not ok 3 futex_requeue many returned: 0 Success
    # Planned tests != run tests (2 != 3)
    # Totals: pass:1 fail:2 xfail:0 xpass:0 skip:0 error:0
"

The process of 'requeue_multiple' case will:
* create 10 pthreads with futex (timeout 30 ms)
* wait 10 ms
* start 'futex_cmp_requeue' case

So there is an assumption that the 10 threads can be created in 20 ms,
which is safe enough for normal platforms, while for slow platforms
with stress workload, the creation could take more than 20 ms, and
some futex will timeout and cause the case to fail.

Increasing the timeout to 100 ms to cover slow platforms, which doesn't
hurt normal platforms much.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 tools/testing/selftests/futex/functional/futex_requeue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index dcf0d5f2f312..2df9e8dfb04c 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -11,7 +11,7 @@
 #include "futextest.h"
 #include "kselftest_harness.h"
 
-#define timeout_ns  30000000
+#define timeout_ns  100000000
 #define WAKE_WAIT_US 10000
 
 volatile futex_t *f1;
-- 
2.43.5

