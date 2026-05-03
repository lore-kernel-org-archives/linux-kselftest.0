Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16823A6B6E
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843393; cv=none; b=MhI0G1viQPT5r+UDcwVVp7ujsY3fp/CaHzvZmycDOd+eWYAOqaELEbNOv7n7+3vSujs0tCq77Lz+PHfYFw+h11xiWqq6mDhGRtJjwMXu1qZICAwnoNY/Q8TFjdRoUut2R8jyz+rrqJ7sP9DwtNEAdXe/v3LnAHXCPwpjMA5EKj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843393; c=relaxed/simple;
	bh=S3gGEckI/DSlIcvU2HtcMqtoB7rDjBnUKRH/p6HcwkI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pNhFe6392wyiDZsByA/WybPcJO+1kRtrHw62JZLaLKsr7zWLn7Yjly0BH/W6oCjDm90ujNscq9yeVnA4PfMszQM+zFOcKYbP+TUtIWiXxXlWL81WhCmp0YxLNKfnsTxFg6K70omeyJHm36i3iPWvGtGQo72+X80f9/zVbBQesgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ua+P1Kg+; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ua+P1Kg+"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ef37c3f773so1637209eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 14:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777843391; x=1778448191; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hgNY4cuzop2SCxhAontHgj2zQ9qMym81XhTapVgV6M=;
        b=ua+P1Kg+UQ+TSPH11It2cNq9T0kW5VlmFjiRhpNBshZkRKOgIxqsiaJNI57Iuv+eBR
         b7uAYv0Thu/cat7fVZdzjoJ7BxML45nr6cy7axJXLLc24/ndSUI+VyABmocsVy2OWtOv
         kJpKKKOc1NAyX/+DmWDL8A21o17i0pNoHrDeYvbYrFm1mdGbTwx0b6OIXIpmfM0I9/Ft
         2RdnPoFuO/JCzjJ15P7gHRtOJ2iFGwGeEegs+vwbeZwpFyN+GNF4r1xzqdIx0xoi9rFd
         zXw47W8QYxw/7Hpy3TIuq/qWdSVLiQOpOyAlPzORmybx5u1SyCM7BiCOYg59r5AuTR3V
         0CHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843391; x=1778448191;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hgNY4cuzop2SCxhAontHgj2zQ9qMym81XhTapVgV6M=;
        b=D/zsdROeyL9VGwK/VuoIrDYqvRwVUZ6vDw7CTI+lupiL7fEZl2ypoRo6cow0nWamqi
         W0IpHCPY6jBAvm2qhtTwkqL5f1kcnMnqKw5tZrE56mNbePQSFL5rrbwEejOf1YBY3U1I
         Li4wnpjSspF14AMmINJ2mB2Mo47Aa3LxE8fKyOso31JovgLkB8b2Df0whZzySjejOrpr
         HCUHYw5khVYkbbzQFHJPer1JLJ6oW6B6baaclRJuoTlZTLuOASBAZ8Rdip8soo9v6Qti
         d9SSCg4t3QmEk1Dd39mgt9cbW6o+oXLG1hS/MWjHeC0fuUi5MyMHjKb1qXM+DVe+zfsX
         He/g==
X-Forwarded-Encrypted: i=1; AFNElJ/V1b0l0ptLDkevGJxjwFTMtffS/edMpskezE7IBvK+KkxOel77WLzKaq2mryvuR3J+thz8fTgGZ47dy0jEkug=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrmiigta5YCRj3SSgSO2DcBbHTHqrg0QDv9G3WVFp3/K/0tDlT
	lOVoVDDew/kwnNg0CTlKXLzt/KJA1UHm7QBI2KOqfWgY7TF7EmIypyc+G5YSZzlac6leKXh9egK
	tYI/ws5yFamCkQWz2boFpH0cdGtPNvj51UA==
X-Received: from dybrp17.prod.google.com ([2002:a05:7301:4611:b0:2d9:e328:e0db])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:9f06:b0:2ef:2878:7ade with SMTP id 5a478bee46e88-2efb85b7e58mr3381155eec.15.1777843390801;
 Sun, 03 May 2026 14:23:10 -0700 (PDT)
Date: Sun,  3 May 2026 21:22:04 +0000
In-Reply-To: <20260503212205.3714217-1-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260503212205.3714217-1-aniketgattani@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260503212205.3714217-3-aniketgattani@google.com>
Subject: [PATCH v3 2/3] sched/membarrier: Modernize membarrier_global_expedited
 with cleanup guards
From: Aniket Gattani <aniketgattani@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Aniket Gattani <aniketgattani@google.com>
Content-Type: text/plain; charset="UTF-8"

Replace explicit lock/unlock and free calls with scoped guards and
automatic cleanup constructs.

Signed-off-by: Aniket Gattani <aniketgattani@google.com>
---
 kernel/sched/membarrier.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 3d88e900a17f..12b68a77630a 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -267,23 +267,19 @@ void membarrier_update_current_mm(struct mm_struct *next_mm)
 
 static int membarrier_global_expedited(void)
 {
+	cpumask_var_t __free(free_cpumask_var) tmpmask = CPUMASK_VAR_NULL;
 	int cpu;
-	cpumask_var_t tmpmask;
 
 	if (num_online_cpus() == 1)
 		return 0;
 
-	/*
-	 * Matches memory barriers after rq->curr modification in
-	 * scheduler.
-	 */
-	smp_mb();	/* system call entry is not a mb. */
-
 	if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
 		return -ENOMEM;
 
+	guard(mb)();
 	SERIALIZE_IPI();
-	cpus_read_lock();
+	guard(cpus_read_lock)();
+
 	rcu_read_lock();
 	for_each_online_cpu(cpu) {
 		struct task_struct *p;
@@ -319,15 +315,6 @@ static int membarrier_global_expedited(void)
 	smp_call_function_many(tmpmask, ipi_mb, NULL, 1);
 	preempt_enable();
 
-	free_cpumask_var(tmpmask);
-	cpus_read_unlock();
-
-	/*
-	 * Memory barrier on the caller thread _after_ we finished
-	 * waiting for the last IPI. Matches memory barriers before
-	 * rq->curr modification in scheduler.
-	 */
-	smp_mb();	/* exit from system call is not a mb */
 	return 0;
 }
 
-- 
2.54.0.545.g6539524ca2-goog

