Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082994;
	b=Cuigfgwq83dnkzGyUFhW9zls8BeIfZVUjHZjTD/qWjWiRGVHjvTFVdfry0obHpCHp1l2
	 2HHVvz96NoQn0AtMguNaQcLptCuAkvYn2KyOUoNhlZk8LcuN8v4sz4cdRVJpJsUsesS41
	 4ydmJD2Dc+O6VVxKLSzZaw+2sBpsin3deqACPWd40C+bPSkj5gC7SGO0fX8gAe/uKpVRX
	 DJiHEWZ5dmopGhmKT+S7hgCXtEnPRUQU2CR3ma/Nx9L0B0htjYfHLK0ac6vOvowmlWwH3
	 +PQT9hmC6OADFc1379GYn07iW1a+cIaOTcUaY14rl72Sw0aDQ322ys5Vq9QHftrvQMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
	b=Zpe/GWK+I3Nwo1u/OutnDaloFbrd+03q2A1LQgxO6dA6FJdveXbS8uqvs9noFl7bs0lC
	 eapryUh8n4z8tEYPvlYXs4gJudFza80yL/DEwM2r9HNcjcxgX4G/zITV3O9cVcuALD8Qv
	 NblSzJEGuNiKX3oFf4cYYMXuQ3ydYTylUEB1qSN/Vj932IMKYE7d2FdFRcMuBR/UEGC7n
	 XpgpdOUUU/WXVrEu8NIazr9rp4cLSMD4siy7c2AnWPI7ASIu+HDrsL/aHEkwW0+nGgOwL
	 mONSsEoGvSnUyo6ATxn0kTV71T61LInz92S49Cw6GmnZdV9w29yau5cj96D1bjyQ1Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=CSpdWQ5s;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583DE606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 06:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=CSpdWQ5s
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so731442a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082993; x=1793687793; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=CSpdWQ5sW1tM9TEYi7fzC1hlNCiQyd5Sxmr/vYfmVU2KSb+XVcPTsiehoQ5jknIMuF
         JTP6RgKoJAV/cshortkM393JqA4eFHgzst3osKjj6xSzVB93VoeGsdI/7zR6ZwdlpbNv
         ccNchm+EY8fwa76i84kMtlSxGKBXE2C6bXW24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082993; x=1793687793;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=c8VYqK+Xry0uG5evD8rBwhUm0aQ9tAtE/Oc8/HYWCKcyZ+8rCKZxYaoMIA2aq/0Egk
         EAtl+l7ZWlJc05x+oO2oMs8pSbRj6o8ijYB69y4kmt8VQhQkdiG7L0K76l7gdD3Xd9jh
         7WePxzQ2vboTHMNsGSPn6PRYafL6p+3kRxqR0x9gO8k4PviccbqZk8/J14xEKY128HR2
         s6G1Ena68drlDpgkbkH74OGsXdnHWCxKw9/YVVlIE7nm4c0UySZBv569punZL6KID9XE
         C8pMuHR8V+/eabbS34F5ZzZ9pVrVvtN61uTX7oLMUnv7N0PgqXHBn+yjM7ojJUywNBF+
         MxiA==
X-Forwarded-Encrypted: i=1; AKwUvBwZR7fKox2n8gIDwedouRoBTpLN9a9x8tx6PbeaW3/ToVhp/6fhHEGe6IlP5IPuA4BtFwTkwjItpCjE84hr6xI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlOXzeoskB5I3fhZ0D8vnp8ekQxNdpcVTMmth1fy+XaCUSY4we
	Py0Jz7N1WvsbA4lZAjPsU6kLBpE/F6vMwXnc7dOJQfjO79amLW2ji/Xr3U+W33+0j00=
X-Gm-Gg: AYBFou3mWfV3ntk6T0G+KpMG2U3CiA84PxUfOfzSW3XbSk+cefnqkuROSLx7uR6u+s7
	oUgX/tjJRKxiAEDVOGiMTbqBFiBUZIJOx56TL5i71uu+46AA2h0cIWk6PWTxvojs5DELnAe4+pv
	7vQbDJXgy+At2C2a/8TMWNuGyenhuzHyvkjlOiMeJfN0tnIswrdS3J09YNS/K/kjgPCtwb2ia90
	3Eb3cdJ4JAsRQ0GFUIqxT+2LyUmpqxVfXZ8TQZFsWha56fwzBtYRvUA4XHPsazUQ5HeFe8455/E
	xe7gXJBkRhGzli32xmu0ezIDIi5174PCPmRuCHdXDQkKC4TD6EEbZ+wcSc0OSQdRkiSH6lvGKcf
	h/FDGdHQVGyLKfUmXhtcYtWOxWIRHHPeGF9ROUqLU3Xx/7M9OdDq9/R+uraZD1TKj4SeJAmO9/b
	vKwRz0PKqMS1O7blJev0HXml3mn1m8nUq4Zk21G15FH/I8z4VUgb3e6PkQdIF8eUJoYaLxBH5G+
	ndhxDjHiIyZM+Ob/MOuDPF1tErgDJFiV84OFC8SUeKZHONkUGabUX2/AAzPnxZeBTz4ZKcOW1Kq
	WhoVYA0SJRvKyfMM0ldwRogOO3K6Mji1gVKsizXFD0vDraOgex+3AK+Ey1PUezlhe9JOZudHnxj
	T+NWBaityv8Xk9kKNHB+Xp/4=
X-Received: by 2002:a17:90b:3ec2:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3adeae6d30bmr6210081a91.18.1793082993200;
        Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40456f65sm2331529a91.13.2026.10.26.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:28 +0800
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
Subject: [PATCH 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler
 stack end check
Message-ID: <7c4627a57202b505bc03837680f6b43c2683bc07.1793082868.git.chris@chrisdown.name>
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

There's no existing test for this, so let's add one.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 3eca2ef64aff..929a60db00d6 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -215,6 +215,26 @@ static noinline void lkdtm_CORRUPT_STACK_STRONG(void)
 	__lkdtm_CORRUPT_STACK((void *)&data);
 }
 
+static void lkdtm_CORRUPT_STACK_END(void)
+{
+	unsigned long *stack_end = end_of_stack(current);
+
+	if (READ_ONCE(*stack_end) != STACK_END_MAGIC) {
+		pr_err("FAIL: stack end magic is already corrupted\n");
+		return;
+	}
+
+	pr_info("Corrupting stack end magic and calling schedule() ...\n");
+	WRITE_ONCE(*stack_end, ~STACK_END_MAGIC);
+	schedule_timeout_uninterruptible(1);
+
+	/* Still alive, so let's restore the magic so nothing else trips over it. */
+	WRITE_ONCE(*stack_end, STACK_END_MAGIC);
+	pr_err("FAIL: corrupted stack end was not detected by the scheduler\n");
+	pr_expected_config_param(CONFIG_SCHED_STACK_END_CHECK,
+				 "sched_stack_end_check");
+}
+
 static pid_t stack_pid;
 static unsigned long stack_addr;
 
@@ -854,6 +874,7 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(EXHAUST_STACK),
 	CRASHTYPE(CORRUPT_STACK),
 	CRASHTYPE(CORRUPT_STACK_STRONG),
+	CRASHTYPE(CORRUPT_STACK_END),
 	CRASHTYPE(REPORT_STACK),
 	CRASHTYPE(REPORT_STACK_CANARY),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..2d856ed77a64 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -10,6 +10,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+#CORRUPT_STACK_END Crashes entire system on success
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
-- 
2.54.0

