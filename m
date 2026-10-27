Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082987;
	b=g/lcez/mjpuVPnM0ZFH52mZD+7Ci8Tv5xadBqaYFtQs2gelwneH5afs4rjt9oQ86dFw9
	 dtRkOuh2iTKrpO5O8DB7JrQxwiS2I9iaIqMTIP0eAUi40ENDyXgEUT0MoL6PttGqaEPHd
	 JhT/9s0yMFbmWSBGKsoKXRrx3vQ0S8FYvnSntKXfc49Sik/DftfRc4sVG0CBGMlyAasTf
	 fZis7QSszCd2HG0OscxPmSA7i5jQe1NfIu2EhFa6XJiPPdIQPtRksHPz7o/fpc1sUwaX2
	 VkTxR2D63+591qS1Nb+aGEkThRKiXPbMSfbQs7ylc36xs5ZXaQ42UHJmmWpzNruBu0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
	b=CjUytUmUwAEAvAxXg7G+Gh7w7g/YTaQ2z81ozvGyPxiEHDaoYMZU+jiZ6jPVErnqK4O5
	 InXQO7pv/XwrNbOKGWohQ8ZV+iBWsfKlh+/huhLZi7VL6KzAazPQ6moODd+DOQ6h3+oab
	 qOAriltFSKg30DtE/jW+MyMMHRPkf6r3VBFTZqTGu70uZNLEYC79VJZ82B/MW23QAuyu2
	 lK9TFau1C7Ld4Tqe/5HJ1Be0U+vp607pqEaN8qQ6wkTXZYvU5EwOYealUekhgdAgcJ5Cz
	 X0MOQ4y7Aqrttnd+VSOLjCyanTel09I4tQr/vUMlU0HGMP3/bcGhRadAhsgclZ3QD7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=A18XSYRR;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A1606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 06:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=A18XSYRR
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8b20a899fso23737845ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082987; x=1793687787; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
        b=A18XSYRRAxSuAWoSFewKd3fToOwP31OZQcX8t96ooeQ0af1YK4YGm0a0Mh+VR4Ds3o
         KKXgJL7g9xHxAyYHn75yn3/px3xvE1TgYAHBlEqBP5CKh3xWxNqIP6X9Lo4mtgJNKz2j
         ka1lAlUYD/xQECFuOO9WSinqPf3RjRE1sqS5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082987; x=1793687787;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
        b=jMTcTfKeNF0l5kggNO4A58zA0iZuynyatKenQR2lnjMkpPWttBfvvVEvA0rSjOgU7y
         WT0N8rUWKfs9/g+Vs620Yr9g5KINU06C2peweOGAtTJZD54ez81ah2DfLiGFhz2bM+29
         B0FN8ljByLpZ4xsOofRpYXIqEaBWocOVn0u94Xp/ZdJtWLE3POnc4M1tZgW2Iu7vYscO
         Bm2TG4f1UG4wCnk2rilsZtltFK64edw7cS4xHGo462wSo92p+quiaPx1qAFqCJ7H+eSx
         s27eVgGOOhSVsNcvzrB7+fDB2HwhVLmP1e+lvql0sJ1pZ/rKdrnaWC0ldubjRsUxmo+u
         emXA==
X-Forwarded-Encrypted: i=1; AKwUvBwdWZBnQ97ATmoKBTuXHVgcn+a/MjdWlFkJDmVjvS/5kgphFa9VN9z3NdcNIwTLnDHqBeRuiF39CpSw9J+iVs4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ656mXiuyTV9pZKddt+b3zpyOHrFzW4kCB91VT4TRWay+UOIT7
	Mk+YgS2R6wsKJJdanNk9caTDnmhRjBkmAX1cPFIplXt+9B7XMV07dZbHJ5+Iw2VY87c=
X-Gm-Gg: AYBFou2Dvzlpu9QVJjfkmLL2tpo8AiLz0Er3oSEILDWUcLt3hoCh9C6Kwg8u3npCSJ+
	0Cs0W9X62Ji4cAl33UKbC5DUBWDq9SzYoL54PPrg7cS8zmjLhKy/n8Lvdt1fGeG3+i2T93Ez5pp
	Sn0hSgbyoWQR+LAeGToAq8ajdq0JKQGRLqxtE1hWbQvxux+nS8H+N1424z+dpsvWPPmUsarh7jZ
	7odxRApBM8kSBu5kmOOhAkmPDcW3k6UYXIFyy96Vm/tFOGq3hcochWT63/z0O9eD4UbApOE9Lja
	jVG5lJln4QP6FeCNpNVA4qqOZy8dhsHWFcxC5Kf9Z1oYhk462chu7IDQ3fBsGMFjPISmNZIa98s
	+rQFWCuGY/VypqSSEvYYRt5q4FfxJTHVOXl3wax0amqA71LaYoWmAJzO4lbFwmjBM3b+a+JYNpb
	gm9zisxt7VKpHXaMGfgHzoCzjYMbWh0q7fbK5pE+q11aGggEv5G74zEwGj7thKlFIi2AsA09kvd
	7tQNd42BTZu5gp/gGZJSl6dkaJ/4K3z1ziUcNatWqelj4BSsx2AotZFHt0YmN76Qj/pI7fPy93J
	6kBpjhn2HsA4E0vPZM6YuxKKmvX2FQYy3Tkox7ry50N1s4GJhKppmetLoIROmviaa/61W92vp7B
	pMcVzRRVd7sB3rBygTCTlhmCWsS3WoyWBLop1B0AwCmM0+zMnArW5GWY1jZCW4yRkjBbz+9Ty
X-Received: by 2002:a17:903:3806:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2ea9c0f388fmr74433055ad.1.1793082986640;
        Mon, 26 Oct 2026 23:36:26 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm4180085ad.24.2026.10.26.23.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:21 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
Message-ID: <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

CONFIG_SCHED_STACK_END_CHECK makes schedule_debug() check the magic at
the end of the outgoing task's stack and panic if it has been
overwritten.

Right now this can only be configured by setting the Kconfig option at
build time. At Meta we have it on for some hosts and off for others,
since it is helpful but adds cost on context switching. That means today
we have to build separate kernels for each, which is less than ideal.

So let's make this configurable at boot time. In benchmarking sched pipe
and sched messaging performance is unaffected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fbee7b544903..95911d33c0fe 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6811,6 +6811,14 @@ Kernel parameters
 			core priority to both SMT siblings, so this option
 			does not favor either sibling.
 
+	sched_stack_end_check= [KNL]
+			Format: <bool>
+			Check the magic value at the end of the outgoing
+			task's stack (and its shadow call stack, if any) on
+			every call to schedule(), and panic if it has been
+			overwritten.
+			Default set by CONFIG_SCHED_STACK_END_CHECK.
+
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
 
 	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index fc269fd10192..c1fb86b813bb 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6143,18 +6143,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
 
+static DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_SCHED_STACK_END_CHECK, sched_stack_end_check);
+
+static int __init setup_sched_stack_end_check(char *str)
+{
+	bool enable;
+
+	if (kstrtobool(str, &enable)) {
+		pr_warn("Unable to parse sched_stack_end_check=\n");
+		return 0;
+	}
+
+	if (enable)
+		static_branch_enable(&sched_stack_end_check);
+	else
+		static_branch_disable(&sched_stack_end_check);
+
+	return 1;
+}
+__setup("sched_stack_end_check=", setup_sched_stack_end_check);
+
 /*
  * Various schedule()-time debugging checks and statistics:
  */
 static inline void schedule_debug(struct task_struct *prev, bool preempt)
 {
-#ifdef CONFIG_SCHED_STACK_END_CHECK
-	if (task_stack_end_corrupted(prev))
-		panic("corrupted stack end detected inside scheduler\n");
+	if (static_branch_maybe(CONFIG_SCHED_STACK_END_CHECK,
+				&sched_stack_end_check)) {
+		if (task_stack_end_corrupted(prev))
+			panic("corrupted stack end detected inside scheduler\n");
 
-	if (scs_is_enabled() && task_scs_end_corrupted(prev))
-		panic("corrupted shadow stack detected inside scheduler\n");
-#endif
+		if (scs_is_enabled() && task_scs_end_corrupted(prev))
+			panic("corrupted shadow stack detected inside scheduler\n");
+	}
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	if (!preempt && READ_ONCE(prev->__state) && prev->non_block_count) {
-- 
2.54.0

