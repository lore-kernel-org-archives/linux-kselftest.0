Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D847ECD7;
	Wed, 22 Jul 2026 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711443; cv=none; b=f4LyowF931XDaQ67zwZYclVpSh8yTp6UV5flNzYCFj1id4pXhoIjkPmhwpB5EYst5b4t6r6XNnapRiV3qMgnHk/v24oRnFEfRp0hRb1jSUIVs3p1x2ybBOsETbpyCvAVj0zWQzR3GJe2+pywFzbYGgeb7Hm/pkPMh7XJktFbV6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711443; c=relaxed/simple;
	bh=HtRRQ7FvUvFUqrNqKU6qaN0koHzhkGJVahBmFnXPI0E=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=jZb8r8vdns1hCLB0UgFJUNIB/3vDpHFXfOC8kfi++XSSLY5no2z/OaVJD0E4/RS9tasIdnBOdpe4emYui1in1ExF+R2es16j85Tt+fq2QSE+SyZgTsMd9rbVOPEoLYGm8XHxt9MSmgGKQxqXXWyfHepoxKKBGvQ5O2Zrb+yx+sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=pass smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=DxxkqMg+; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyyself.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="DxxkqMg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784711436; bh=15c3lDh4VOZgnc1cxDbEs540nVC466TqGoV/PidAeLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DxxkqMg+FCTsD0K3UGdNsE/tgJtj1TqsEX5KrTJEDr1YNDf2jFnKnKzRlGABKUfGL
	 EgNmPyrn4a3F1VoznRUqwX5kOtZkQMmuDJ4/ohv+ADkTX8SWJtyu9crxm38MHSH5Ku
	 JXjHLi4BC3WtlAq27iQNtTIha5r8IX759cgNd0JY=
Received: from localhost.localdomain ([240e:37c:2242:cf00:5054:a3ff:fe89:345b])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 2A18FC86; Wed, 22 Jul 2026 17:10:33 +0800
X-QQ-mid: xmsmtpt1784711433t0k849hic
Message-ID: <tencent_B5D58EF5B89C3121214B8D377CA4822EDA08@qq.com>
X-QQ-XMAILINFO: OATpkVjS499u0vvGgzUsiACipxHsREnOxfr5ZTGpVur0HETK5BlTd3aSVcQyXd
	 w6jhJaSjgl8iiQ1g/qO7qjasL43Por9ofY9tOr8o2HBMUvt5uK2iTAVc7hTA4XzJBzXx9NffxhA2
	 dr9EtoEOLZ/GLQjWTNaQ/eBeMO4fXpVA9viU8YBzkWMHCSn6EyacSPONq6vBXYUL/o+aSKSZT20a
	 ZAyvcKAkIyG59ph+Yf0MPHzSLz0QDqkkgd6vc/3rnhi9rviYhKa+d9L8lGDmyCS289gJwZsAXN63
	 UQ8IW3opAsYMJgBBFS5it0JHDnpQJC0CJzYjatyzbN06esD+Xpwt2HfbqLppl7XjKf+yWuDajh6c
	 vegWFh665rjlxq+ZPRre+R4W5XEUItrh6Hn4ERYsFQYHe3Mr9EPyoc98OrspFRoktiGTvj/P67kB
	 jRLNUD3t/mc6MkqKErDAdxUDbom4gUtnWFDlynCC7Suqox3Dh+d1uHci57iHk7lVrJEEWXzgTV53
	 DqLb1LguiffhYPe6XjWwdpmBBZR/31iIFo3Pnwf00RLYOaBW7+APiVLeklDw2pq5DqYc5+yGIkd2
	 6OMQy2CM3HGUvuvnEp0o2BUGcckCP2Ltr7bBXjlzXlQkm43N9kAg3HSOYHNGgVDGZ+8sEDg/f+a8
	 UEca/yfz+AYVuWPblAtZzyTwy2RrQE0mNanyOjmc4ogi/k93iXBDSC0jQui0oO9aOVUSYCZqAaaZ
	 kECEtEG4TPaOxmemjHNiHxQnRUc+I7+nKwtVGEcK996m6ZwGmFKzCOKp9H8KuLlaU766Kw91yLEn
	 W1gALMB95U/4i1VKx5ENAy6xmmSbYETRlZtru7PM9dnUqJJJjvQfNBiEnkdtbbAb8aFCtix2z9X4
	 MSdQaTjkKizJIwGjsuENPuOoLIi55LC82saXV2tV5RB0p71ZdXiRgE8V7SLVmvHriJNbBul/a/Kr
	 m/3Fyx0JsMtD9oUyzwKqVAOfJ0vmFnDG4397Z/PRjt8ZeoBshprNNlO4coizouIttrhIGhuG4WeF
	 veUr6PUEENrjaoHPeyDpQHoBKx1B04zvHcTN9vy59nXqXLWSD5iZ83OicmaRJbgKxeGgcMYWNpMz
	 Fz9pOHaH3TYloCCl6iebDdEhm08pyPf9tKp8esKTj4rlSOU5I=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yangyu Chen <cyy@cyyself.name>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yangyu Chen <yangyu.chen@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 4/4] docs/scheduler: Document cache aware scheduling controls
Date: Wed, 22 Jul 2026 17:10:32 +0800
X-OQ-MSGID: <20260722091032.1595192-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
References: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache aware scheduling gained a debugfs control surface when it was
merged and now also a per-process prctl (PR_SCHED_CACHE), but neither
is documented. Add Documentation/scheduler/sched-cache.rst describing
what the feature does and when aggregation is skipped, the
/sys/kernel/debug/sched/llc_balancing/ knobs including the split
aggr_tolerance_nr/aggr_tolerance_size tolerances, the prctl
attributes with their ranges and the GET/SET calling convention, and
the inheritance semantics across fork() and execve() with a
numactl-like launcher example.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/scheduler/index.rst       |   1 +
 Documentation/scheduler/sched-cache.rst | 125 ++++++++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/scheduler/sched-cache.rst

diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 17ce8d76befc..8c6e633d4d79 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -10,6 +10,7 @@ Scheduler
     membarrier
     sched-arch
     sched-bwc
+    sched-cache
     sched-deadline
     sched-design-CFS
     sched-eevdf
diff --git a/Documentation/scheduler/sched-cache.rst b/Documentation/scheduler/sched-cache.rst
new file mode 100644
index 000000000000..8bd92c7c7d3d
--- /dev/null
+++ b/Documentation/scheduler/sched-cache.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+Cache Aware Scheduling
+======================
+
+Cache aware scheduling (``CONFIG_SCHED_CACHE``) aggregates the threads
+of a process on a preferred last level cache (LLC) domain when that is
+expected to improve cache locality: the scheduler samples the per-LLC
+CPU occupancy of every multi-threaded process and biases load balance
+towards the LLC the process already uses the most.
+
+Aggregation is skipped for processes that would not benefit from it:
+single-threaded processes, processes with more active threads than the
+LLC has cores, and processes whose memory footprint exceeds the LLC
+size (footprint tracking requires ``CONFIG_NUMA_BALANCING``).
+
+Global control (debugfs)
+========================
+
+The feature is controlled globally through
+``/sys/kernel/debug/sched/llc_balancing/``:
+
+``enabled``
+	Boolean. When on (the default), every process participates
+	unless it opted out via ``prctl(PR_SCHED_CACHE)``; when off,
+	the feature is inactive for every process.
+
+``aggr_tolerance_nr``
+	Scales the number of cores of an LLC before it is compared to
+	the process's number of active threads. 0 disables aggregation
+	through this gate, 1 is the strict default, values of 100 or
+	more disable the thread count check entirely.
+
+``aggr_tolerance_size``
+	Scales the LLC size (by 256 per step) before it is compared to
+	the process's memory footprint. Same 0/1/100 semantics as
+	``aggr_tolerance_nr``. Only effective with
+	``CONFIG_NUMA_BALANCING``.
+
+``overaggr_pct``
+	The LLC utilization threshold, in percent of the LLC capacity,
+	below which the LLC is considered idle enough to aggregate more
+	tasks into it (default 50).
+
+``imb_pct``
+	Utilization imbalance hysteresis, in percent, used when
+	comparing two LLCs (default 20).
+
+``epoch_period``, ``epoch_affinity_timeout``
+	Occupancy sampling period (jiffies) and the number of epochs
+	after which a process's LLC preference expires.
+
+Per-process control (prctl)
+===========================
+
+``prctl(PR_SCHED_CACHE)`` overrides the global knobs for one process.
+The attributes live on the process's address space (``mm_struct``):
+they are shared by all threads of the process, and a single prctl
+command implements both directions::
+
+	prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET, attr, value, 0);
+	prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_GET, attr, &value, 0);
+
+``PR_SCHED_CACHE_GET`` stores the raw attribute value into the ``int``
+pointed to by the fourth argument and returns 0. A value attribute
+that was never set reads back as -1 (== ``PR_SCHED_CACHE_DEFAULT``),
+meaning "follow the global default"; the ``PR_SCHED_CACHE_INHERIT``
+mask reads back as the mask itself (default 0). Setting an attribute
+to ``PR_SCHED_CACHE_DEFAULT`` resets it (for the inherit mask this
+clears all bits).
+
+Attributes:
+
+``PR_SCHED_CACHE_ENABLE``
+	0 or 1. A process can opt out of the globally enabled feature
+	with 0; 1 (like the default) participates. It cannot activate
+	the feature when the global knob is off or the hardware has a
+	single LLC.
+
+``PR_SCHED_CACHE_AGGR_TOLERANCE_NR``
+	0..100. Per-process version of ``aggr_tolerance_nr``.
+
+``PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE``
+	0..100. Per-process version of ``aggr_tolerance_size``.
+
+``PR_SCHED_CACHE_OVERAGGR_PCT``
+	0..1000. Per-process version of ``overaggr_pct``. It applies
+	where a task's own migration is admitted; group-level load
+	balance statistics keep using the global value, because they
+	aggregate tasks of many processes.
+
+``PR_SCHED_CACHE_INHERIT``
+	A bitmask selecting which attributes a new address space
+	created by execve() keeps: ``PR_SCHED_CACHE_INHERIT_ENABLE``,
+	``..._AGGR_TOLERANCE_NR``, ``..._AGGR_TOLERANCE_SIZE`` and
+	``..._OVERAGGR_PCT``. The mask is per thread and is itself kept
+	across fork() and execve().
+
+Inheritance
+===========
+
+fork() always copies all attributes to the child, like other process
+properties. execve() resets attributes to the default unless the
+corresponding ``PR_SCHED_CACHE_INHERIT`` bit is set in the calling
+thread.
+
+This allows a numactl-like launcher to configure a workload::
+
+	prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET,
+	      PR_SCHED_CACHE_AGGR_TOLERANCE_NR, 100, 0);
+	prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET,
+	      PR_SCHED_CACHE_INHERIT,
+	      PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR, 0);
+	execve(workload, ...);
+
+Errors
+======
+
+``EINVAL``
+	Unknown sub-command or attribute, value out of range, nonzero
+	unused argument, calling task has no mm, or the kernel was
+	built without ``CONFIG_SCHED_CACHE``.
+``EFAULT``
+	Invalid pointer passed to ``PR_SCHED_CACHE_GET``.
-- 
2.47.3

