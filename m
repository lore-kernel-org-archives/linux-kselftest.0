Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559042;
	b=ygIS2hDqpFB+hSD89vCmceQL+bMdb3M3W2mbD/H1ccxcfSh5H4ToC9jSEYvOPD/brEDZ
	 cHaI+kC22FFyxtCOznNSxgRyp6sISWESB0L7CP6Xkzr0OYu06TrEu5vwbFvaj0nwZRDQi
	 K58XTHlxIXbsYlM5TFfynM2sANRSHsHvgj8xW7qLRyddrfms3PdxbvuiIu81MMEYKgSil
	 UnQj5+vDTOoIgWOzI43fYTBTKmmGuX5zu7573qZBbsUAjTzLwjGQ4GZZgms8b8FxwmHCe
	 UUcM+S7wTnrS3d0NtLa4zxbXk4oxkX6FoPwfV0hxDp39quIeYCowZA0Gj54Xgr7SfTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
	b=Z+rlrDOkT6P/FJdgwWvePmLY1yDg/Rn476PHqfIM0n0bE52ZBsb0o57I8x66POzCC1MP
	 +Nhspcbh/+i8ROFTD04hKaC2UFtKT9UKK/MRnrTaftrMNh4Re6UKXaS/5SoZrHettkeyX
	 M3oNClLBCny5oSO/iDp3JNCArbvzFSEbgFSwLZ+w/0G6FtSY+mslL9dUm8+6dN7PEG6su
	 7Hnn/aKkskbj1MhEAcqaI75gfMcM5EndpFhSqTcOc8rjoISx/7DJKARy28N9op1Dkm8Cs
	 /pKah9dgfaZjnQV+rlObyAUrrkZ2hKzQII3NNJb4CIXfilM/sHGfgy5BMOzyWFxFNCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ami1KE7P;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7785A606B1CF
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7785A606B1CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ami1KE7P
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so552351a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559042; x=1795163842; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
        b=ami1KE7P5QavEDOGMp60eQrXNRJgwmjS0vs05yvlrW1EqIwdZckNLm5O1zXxO5j2nP
         F451yYIFwPl+eEzS408uV3WZLxSDOjKVtEiD7hphLYbylW4kSeGGadDd2Afkyns7ZdgU
         eaVXAs8bUQ6ydMKgNm4qbha32qqeFrsDoNXrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559042; x=1795163842;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
        b=yH01CKfAZH518uUi/YaWXuXV3RcWTW/FvxsQICuo5wmnHZrqocUaZZKTjsAJb3XcsH
         xr2Hu0OiBK0nWw1Zgc6397GvdhEkBAcYzztNkixLxcDMjepoSTyWtCsaMgAu6zlJdt0R
         J41zzjSpQn2gZOEY0m4kiO7os2iBqJN+rP00qWqEdxbCiRm0sI6hYv0ekFhmVLqncNXn
         q02/D1KtfA1gXcHomA1RzcG7q9323ouiZnXqgeC+Jth3DTcB4sG+8TiYGWVSy3EUJzxB
         lpiiwXCOMeTnz3KwBb2rmWjo1dj6rsv6nrizodf6nHyTr+Huz+rn5w1352vwTi4kDEM/
         glNQ==
X-Forwarded-Encrypted: i=1; AL+hErG/D7D8rqqvIAl3Eey7FvNE32/lDaqj8M2fubwPeGOZI/rNLGjz0rfxelbPAMKyB55F9btMFZgI0FtUdhSSSlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GAw5MCnl+zq5moQLFkz+svOgY2wCvJ94gCkE1UDL1UAuTc2SF
	3SDx1D2t/+E0vuPlbK6m9oXrYej24fzICWGMpF5m1L/yF3lskAW3f78ru8nYfUobbGI=
X-Gm-Gg: AYBFou20/At0SWlx6ZbX9M1mvDO/AYk2qpdrEaf9V4XF+RQyi9cHU1xwMDgvCyHtlnp
	nPPKDVxuy+uoniD/Z66q1cgULnbqpEWy+7Tr29C2kQh7/jMq10kX1QdqEnBWYoZyiMgIwDIproJ
	1kJDQNx0Y8Y0tVuKWUAyAU6d+rcXjDjAG83LGp+EmBeRBcWfNS+M6/FLTMDGZN637Ys/8V9dSQI
	uupoXp/LJcUH43UCn/lfGNaHDzTnZcy0RlYvm29Yo5t7ItWbVdvh7+pldlYvVb7fKVvcuJ5SMwX
	b8rH5QZZe2Srn9KKYIZ+0JiqFegR9lAp86f1xXLhEZKwYIJRfuuuXoipQC+VkF9UjhWcF9vmDHJ
	5RbdMg9s1wQH1eXPB4TQ+XAMz1zKjiI8DXjeExK9iaI6NUH/5U9LT9V52/wqId+f/JeNDwJxkGv
	NTdDzPZavbPgjFoLQU9WUF3OcTkGTP2M0MGjY/15WHhGOzVr6bbjiN3YLBfAcVzPJPL/3x1CRHA
	IOMvrrjPmA+n3AKMhAb/lBiV/pq6xSS5aVARqtaUV+oaah+eYXktZ8dVQqeh2JqyUUc9w72digD
	VWrTmQkSDO+Oy1LLOcFqGGXxsqj/6sIpBp9yCsuI1yuFTKMNGAoxSToWtIUPXdDACk8oo4JKW8Z
	LmHqgBz+V/b34C69Cmm65Yb905HW4ZUpbe5+jzHmZVm4tQiox6P+1x0WBXN6EPyiXnswXp09AaM
	WQLH/TrpnfDa4nXSq8uHjyT5wJ1HRaxPn0Nx8OJfU/o2CKvaRHMB9BzIDitns=
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr1404120a91.24.1794559041771;
        Fri, 13 Nov 2026 00:37:21 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm8749569a91.10.2026.11.13.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:21 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:18 -0800
Message-ID: <35b84656fe82fe1cff0ba3bc55ddc72dde70b089.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 1/3] scs: Skip the shadow stack end check when SCS is
 disabled
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

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

Make task_scs_end_corrupted() check scs_is_enabled() itself. It is a
static branch, and it folds to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 include/linux/scs.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/linux/scs.h b/include/linux/scs.h
index 4ab5bdc898cf..29ec2b8cf7bf 100644
--- a/include/linux/scs.h
+++ b/include/linux/scs.h
@@ -45,14 +45,6 @@ static inline unsigned long *__scs_magic(void *s)
 	return (unsigned long *)(s + SCS_SIZE) - 1;
 }
 
-static inline bool task_scs_end_corrupted(struct task_struct *tsk)
-{
-	unsigned long *magic = __scs_magic(task_scs(tsk));
-	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
-
-	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
-}
-
 DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
 
 static inline bool scs_is_dynamic(void)
@@ -69,6 +61,17 @@ static inline bool scs_is_enabled(void)
 	return scs_is_dynamic();
 }
 
+static inline bool task_scs_end_corrupted(struct task_struct *tsk)
+{
+	unsigned long *magic = __scs_magic(task_scs(tsk));
+	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
+
+	if (!scs_is_enabled())
+		return false;
+
+	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
+}
+
 #else /* CONFIG_SHADOW_CALL_STACK */
 
 static inline void *scs_alloc(int node) { return NULL; }
-- 
2.56.1

