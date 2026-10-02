Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E34AF168
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946725; cv=none; b=o7zZu4KJvqO3Qq7htFoW0Idy6ewHskrWjq3jSTZWmIrUwlKie6r/4G1Yrf6ZehNCL/ZEfCu3wABAWTa/g2VPwpvSAFbPfz310WVU47JF4eXHFJ6+ABM2iGYjkG2WHM3witnK74fSEeibxIxaxVdz75BfZpAhRZzZo9QXiTvhDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946725; c=relaxed/simple;
	bh=jkf3NIV6i5WK+xvvDgj01dYKgr6AdTZFc9y2z4i9lrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFdgD6jb9Z4uDxWhL/3VugcUhKANQYSvDL8UmO6g312YUOEDcl/W5/f5tHEDrXkzO6phH+keI9ySjnO3f7qAAqVLGaYpt357uPicFz8C3C7cL4jU8dgkm5ml/MhVVHhJlrYgmK3ebmfzNflWqfjl5/pGpJFyg2exS1xdsKELskI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1DvETWa; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1DvETWa"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so7054666eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946723; x=1791551523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppJ2lJlxiBbwCIcEtdAIsNmyh5ErNbBhGmGmQubrIQE=;
        b=H1DvETWaymNt52kDXwme9GAQC0MQF9B86vtm7HejOeFPAd4ZJhN0I/4814zT3UfhBS
         tninhfbduuT5jS06qpzoiJtQi4XxB1AU9QIqel0v5SA/45t4TH1WZ64tsG3gCuBqrpUM
         /mY/4317ntXEaT5l0WOsRawII74vWXNq/kZ3BxkHgkxmdKXum7Ab7oGf82yrnj87Ya4k
         rqenRlNQZwlYikLYQ3/8+QmKy/wqmHcSZcKT71XpKQ3D9+I8KrmnP0/oOidHXvY86Vcu
         zUFPZt1i6Vdt5pYVp4/dACN3hTtosLzHs7TI9OXzgBR9oiXW4q67VCbOJ4gaIaVhOj7u
         7PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946723; x=1791551523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppJ2lJlxiBbwCIcEtdAIsNmyh5ErNbBhGmGmQubrIQE=;
        b=FnV78ycuucfUyHQSCq8XcfHQzivy5HNE52vjBe6dEfppdorRvha82r6KGcAuejvklB
         o8WhzmySkPrRlLj/xjgC1HA9DXM93PlSfoMEH743Sk+g3wLk9paXp6iTipoB5y3GVSHo
         QPj4AV3eTINESqsACHaIDeCBl8G1/kcwFhMSdgXYGaz6wVeWcgMAMw5f+fyf3B878XLA
         6U06BdY9S+126mrJaJmY9xMwndSd/gcMu2o48ldoMe4tyeNXC9KgsH6hPXwTY6SVjCxw
         w7nu7bpe23wxpBrxrHt7SBXe5mcEwl6osyq95hkmX/a0VXWyBC3UnU5vscO/akPR/JU+
         uknw==
X-Forwarded-Encrypted: i=1; AKwUvBy5yDQ4ES9d7ixwr8Eb5iZYp700qNKNdYYRhSeaJkW5Q1Ynrk6vV0MmkUUnK9x0wLPVcjOXHgojESK6ZU7wfyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOm2foNiyMZlu5u7Mmtd7FXqWx0OAyUOMPRzgabpe9TxwMTQbp
	413VYMn5LmCInWpYn2KGcJvgbZmIXmwRrUkuJcgL2iOvfLRNZjobiVS0
X-Gm-Gg: AYBFou36XP33BCkFqnJMBvxNM3i49iutH0A9jrJUYZVzfsyqNmC6tum5iX6PQYlUVFz
	OXtzlr4pJetC5aITXbw4aoWZ6sOlW/V6skiE8Js3mTdp6PjWImNPH85IB8iUmYBbirIkqLICy1y
	8P0u61enGBkmqa+InHeDn/tbA7h/p8vQPSrZWthUOZe0fSrjr7pR59359hkyacT31FdETBq0uHf
	zD/d/lGbp8S67o75Tz5Wt0gPKIGHBkd4Y7nbXMHCtrBn96HsNrGcF2cjIyEn6N/NcAcTKNkQ9iv
	ScR0mAU3JFxWpIZTRUFKc7ce+s+nx7hWn/3oEvcHW/8r0tm0GSLiB42AVPzJiThrrqKnaupa+mU
	I7i5YWjITJ9YMlNeD4ECRbl1VN4jU7QAb6bkRb0stE9le6xaL+rDRmBiwwjhrJU/aFHIZVOvOD7
	kLqv2OEaZ2lNsZ+AROJ37pjrAfCFSEWT+LHcFVUX66W5rD80BRavjUoPtBkSQj44EC
X-Received: by 2002:a05:7301:182f:b0:34b:68eb:fc04 with SMTP id 5a478bee46e88-34f15091e7emr2922189eec.11.1790946722396;
        Fri, 02 Oct 2026 06:12:02 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c739sm7309347eec.3.2026.10.02.06.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:12:02 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 02 Oct 2026 21:10:31 +0800
Subject: [PATCH v5 11/12] docs: cgroup-v2: Document kernel-noise isolation
 via isolated partitions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-wujing-dhm-v5-11-78a6996d87ad@gmail.com>
References: <20261002-wujing-dhm-v5-0-78a6996d87ad@gmail.com>
In-Reply-To: <20261002-wujing-dhm-v5-0-78a6996d87ad@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Tejun Heo <tj@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Document that creating a cpuset isolated partition updates the
kernel-noise housekeeping masks (HK_TYPE_KERNEL_NOISE and
HK_TYPE_MANAGED_IRQ) in addition to the sched-domain mask, and
that destroying it restores the boot configuration.

No boot-time kernel parameters such as nohz_full= or rcu_nocbs=
are required; writing "isolated" to cpuset.cpus.partition is the
only mechanism needed.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 86a2a0099178e..611c6f7ca4efe 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2784,6 +2784,23 @@ Cpuset Interface Files
 	kernel boot command line option.  If those CPUs are to be put
 	into a partition, they have to be used in an isolated partition.
 
+	When an isolated partition is created or destroyed, the kernel
+	automatically drives runtime updates of the housekeeping masks
+	for kernel-noise types (nohz_full, RCU NOCB, managed IRQ
+	interrupts).  This extends isolation beyond scheduler domains:
+	the tick is stopped on isolated CPUs, RCU callbacks are
+	offloaded to housekeeping cores, and managed interrupts are
+	migrated away.  No boot-time kernel parameters such as
+	``nohz_full=`` or ``rcu_nocbs=`` are required; writing
+	``isolated`` to ``cpuset.cpus.partition`` is the only mechanism
+	needed.  No additional cgroupfs files are required.
+
+	CPUs with hotplug disabled (typically the boot CPU, CPU 0, on
+	x86-64) cannot be cycled offline for kernel-noise isolation.
+	The kernel emits a one-time warning and keeps those CPUs in
+	the tick and RCU-NOCB housekeeping set, even when they appear
+	in an isolated partition.
+
 
 Device controller
 -----------------

-- 
2.43.0

