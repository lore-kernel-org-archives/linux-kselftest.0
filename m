Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559046;
	b=vzcaIYb/smb6SIeDRuTn6URKiiqNEReYjn9cipcInqVntp4PoUylTYIsnKs5HjpGBiMx
	 1rgkL9gUUDrEYnePUCjq7z8bQ9kJNIvBoOmEV4ukqpnFDMePAzdjkkOpG7H3Uhliw3L/Y
	 YOwlGxBA7WCYpuNv7TbAIZMkNNgqlI/7aOAw0vSqO+v/ZpGJL+nYrs1SMstkbe6Lz3gHB
	 dxhQ4tbx42cczcpzQQYL+8MYDgx0cC2X+0ncwbdjsMjGoNNqpgGvAyKDnuSg7gh1NWdH7
	 R0HW1UGlDb9sYR7QvFwiFeaWcZjo/F/KsnbMm88mD5VNP8GHT7PsLjd5ugNfuzLG6iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=;
	b=uRqtk3aqt7BW8XcrLUJItPEJ6FWEyw+7KdbuHf/QDEmPAlRqhmM0/Pc4WO5iE1k5cJPa
	 oY09Wme8mwv1lo7YcWApMRfu7A88Com4hq1KZyE6ro+xOpSVglxQkC4P4ZHwxp5cGHpnK
	 v2Q30s5SnjFyLwjNhOvnJPYVD/ZfZTmbSW0qdd4fOUuYTR7DresRxCJvtayDXMx5wVM5s
	 nsfflj0sH4S6gQd1zvR6qh2f/2CDSpI2EYbgRI/z8Op3BQ6F7o2v3CFMBwOS4+mWVNjqq
	 lBQt3zZdQU9Ow8uQKANZ+zU4dFBD+wBHHqK3yO19FnCOR/WxdeOHhXUfz4lQXDWfwPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=gJQ3Lj2p;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC160A380D
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FC160A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=gJQ3Lj2p
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1265939a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559045; x=1795163845; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=;
        b=gJQ3Lj2pJkf6fs6vXad059bYGTkbJD9HJFhX71S0XIKPeqJoam0O+rViwVVtsZaaiS
         qHGJnzL2VEDJe6j2JGNYg5NhIepzQ6zcxpn8mm5jaCQTQTPnfqOfewa98DOIUlIKZ0y0
         XcM7lJe0W/ZRyFQmLWh3VyttnxS6N+34dX0vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559045; x=1795163845;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=;
        b=1tgie0ppA1zgf6RCa6ruA6gUhywqIccmJHbrEdxQA14oO5KHMFSa33pZSnVKnsovi0
         BehcB7fvPG4RmfAi7ggcZtvZwFGU52Yq+ylUVljlvqOuiAzX0mMA3qNa/aR2V4a6TtTH
         FrHVDjV3zYiv68n+mI02O6JWS/vakPHVVJBLsmaRXfWh1egDtlWyVtKFIveIERcfG0wv
         Gi9tGrOX6A1EBec9qfKZUxDLKUQxQ/jathnht4aBFoJz7kScWQ3vF+KsmoQrI8KxpbOp
         J8945EjYQyoGXIOI+6zrSEhqJj+qWI4MvPkv8iLDmtcdVdA0PUgl4CWHCVWvChLGGNGc
         lCSA==
X-Forwarded-Encrypted: i=1; AL+hErExts9iqz6ERTyLOFhIzqynvirk+MhANKzbKOfzvtmVgNk1vRQasNcOKAKBD/upK0gxZcIQ6CVy4YSm/GgU4LM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A8vnB9gJ9U/bMtdMojk73NdNqE8N1zWu0+uR/2Ql7nHznVu7b
	iTyXOG3n7LA8TqgkLzzfvI9gqNicS3KA4p1PEI2/GcgPG0uGRflZQ3NQZCI877rAzg4=
X-Gm-Gg: AYBFou1x2kKasPpl5mCyQeo5/SOz0Nq48v9xFVlQQ1S5CX+Nai/rGuibYJLOidZAzWs
	KmvzQUeiJcoGY0KnixN58Z6UdZ7V8XD4AmBD9J5UZoaqGNjl/kyuNM4Ehm8juyKwaFfB0aIyOul
	2sLz/UoviLRBXWHdnbxBZrG+CaG3EFtwvpmt+k/FA7ATz6wjS/aJDEbg7c8tYFxoWr+pq2ecx90
	vKxBpvm7n7k9mssdhrz8VoYTV/aWIuzk+0yVkB25uNzgLRv3ywuzVi/fHWZXT7bZClkWlFp0Ayt
	j6QLZAwslYxZhyH8cS8FXp4Kr+T14MtBMZ+R5GMW1SQh9hH1CDWAPMxUigHfqyc1yYhI9y2Hh9o
	7OiACaL0Gs1RsQW7qoxbWMfxBxCVncAL0uz4md//9WguZZXCHbASkcb14ReOxLZcMZH1OCYyHiv
	wudHyPOyNClbPVG1TtUxjoNy68vji0eOTK/e0TCUH7Df3CmUDYYoY+0kxZhkVpkcKEr88c8kkHF
	6Y1R4lUZJD2aLH37Sni71WDo1mlhBWyuG2NOavlPjJ5mDHn8v3nE+7U41ZZ7lO0dn/9b/jHCqsP
	PdQrDTe1vWvwgtqgD+po1NMjhNoJvoH3SberhoYJIYxodlu3RB5hkr2mBAikNIQYc5PQsQEiBkU
	1vvzREKi/VXUhbp2hd/leX/QDfQoWy9XM2nhVJ26M7bUjCFkAfqgzkkBEnyUoLzFD3PYZMuVC5R
	z1toV/FV9oVZkfJ19RrmJBu4NIJ5B18lxAUtfsp7xnIgUXmKawQ85rCAh9VFs=
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr1673991a91.1.1794559044956;
        Fri, 13 Nov 2026 00:37:24 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm1085683a91.4.2026.11.13.00.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:23 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:21 -0800
Message-ID: <95e5cba24df5d646f1baff74016a1a224f92aa13.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 2/3] sched/core: Add sched_stack_end_check= boot parameter
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

CONFIG_SCHED_STACK_END_CHECK makes schedule_debug() check the magic at
the end of the outgoing task's stack and panic if it has been
overwritten.

Right now this can only be configured by setting the Kconfig option at
build time. At Meta we have it on for some hosts and off for others,
since it is helpful but adds cost on context switching. That means today
we have to build separate kernels for each, which is less than ideal.

Make this configurable at boot time with sched_stack_end_check=, and
keep the Kconfig option as its default. In benchmarking sched pipe and
sched messaging performance is unaffected.

The other callers of task_stack_end_corrupted() are left as they are.
They have never depended on CONFIG_SCHED_STACK_END_CHECK, and they only
look at the magic once an oops or a might_sleep() report is already
being printed, or when the stack tracer records a new maximum.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..c106f744b5a4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6825,6 +6825,14 @@ Kernel parameters
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
index 175b52a7ea79..9e5b3c62c697 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6144,18 +6144,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
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
+		return 1;
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
 
-	if (task_scs_end_corrupted(prev))
-		panic("corrupted shadow stack detected inside scheduler\n");
-#endif
+		if (task_scs_end_corrupted(prev))
+			panic("corrupted shadow stack detected inside scheduler\n");
+	}
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	if (!preempt && READ_ONCE(prev->__state) && prev->non_block_count) {
-- 
2.56.1

