Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B97C3672BA
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 03:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654131; cv=none; b=a1nF2/zttyGMNlKsxF31+7mX9y7bdBlGZQJJGoc3m+EcZUW0gl+Yar/9Wj264cyoo+nrg4dgd1pUH3UHhZkOmzEO4bVpLxlGknPnlQxM7mJLMLzjIJ3fgbJiRVcmBUsGcYSEI5ZumcLRoDjj3RqOr7Ho5YnL9XBM7SUJkl/Bu2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654131; c=relaxed/simple;
	bh=DSH1dsD7ufyJUSitPhujJbKPkynswivD0Ay115xuL8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVdCfaVjJEn/hjXUutltUNfykxa8XonPWtHrxniYIR5sw4R9/FOU03hOGqOYD7BQ1CmhaBJYnzNdh3mYQae+r3SPU+hNQwJgdfBrY+CQ6xtc0lx9XSIeNI9CBX0UwjNbCsc+Zc0hRIxMbuwfWpotm6kFiC+6pXUva7360lDkzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOqZeRep; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOqZeRep"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so21460515ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 20:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783654130; x=1784258930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OHQR36SH5DHkwv4ahYjdM9a+G5jG41FdFMZ2BcZsNM=;
        b=TOqZeRep6oegsbqogMXnoxA1Rl9xdeE5wTH4F3P1nrrQZoy03wVa7K5pG04W8Je6N6
         iYxhrF4ccDJjIVym2aNTT6Pf4ElV2wq6jDKLnoVG5X49+Y5/+e9WeRxIG5KjHM7UM+S7
         pNa9ryubNJodOkwUmNDEbOYJl+JOnZznJAPznk9MmvXxk+1E/YUfxSJ1+teWOatFBujw
         U4DyC85XyO0CgHkS1GO8DQHlxXOkmAHNIpHbqEu4ZnxFBgE2eF3cipGp4QbWKlA/EW7k
         KIwSgYtL2cP9/itQ/izW2ZTrJ0hZph4+HRXDuXMwc6EmBhj6V4wX6QzHzyGLvoX2gEdf
         kpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654130; x=1784258930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OHQR36SH5DHkwv4ahYjdM9a+G5jG41FdFMZ2BcZsNM=;
        b=CG5Ek4ZkylncmxXD/4MKkCAhGbEZx0HgSYYRdMre5Id1PTLboNEU8HVQeyCCiD4xSd
         KM5nDd+aAZMVNWq5d6hofcHcRKRrVTvrTBUO2d40/V32M8+9AKrBqmsIh1e3Oy+L64SW
         Zx+YBWE44MiNaYuOs1tCuM3l2I34LRV1ayH5BIOPxWmGmaDNWpDMatELA+9jaqeU+24Y
         ILpRgys9jEj8kFD/QsP8+VLzAbbh9ZxL6dDvl+hYnNHw7HHLsRdgFMo4IFNC9Ft59R0q
         +pIaYO75yC94DwR6RowlT47YSGV/end8X/OyDVZIWl6+DD7fTciQbzHTZHQgH2/RskBw
         8PQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOiLWagogQpIRbsl6+gj8ku7x98EPlQ3NgOs9itGJH/5K1X5KpmBEbnp4ioD2l4hGSCj6pi+2h+RaAOwYGzQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Grw5URKMLzh2pQBL+r2OdkIukwELuhSJQp3SWEqrRPV4yztK
	j1DureVuu1WIlLsThj4oRH0sawOuFCmG8CR8+kG7EUja3h5kkWKOAukn
X-Gm-Gg: AfdE7ck9QrZiixSMuCjUPzQ4v64ZkjPvwLiAx6RtnC/kAKEfmuanyESDQfGfIlql7a3
	1OwCSkiN5sDtRMobt4j6ui6yyr9FstfvJ+680db3y4bflUtOj29cMdQRYxN5Ht4U5otngMxsVlK
	kFXMQfp16ItwfKYb0z+gUZj07QgkXMA4UO8XvONoH8J7S80nOOEmvLwanbGfIYAuTFdznKvz/0w
	TYWpErUuK9XYUySU/qjUlzJ8bHxTjrwGKeaBYW7DNSduYIL6baGL2hjRMr6oHXcaBiNRr4anq4e
	0bD3Mlgy6dqSdpCF+uXRMOhL5i/2zt/+riYrTGjwBi6bL9iF55TauB5/xnojeR9BRJOztvyIss+
	SgOAOoQYMxMHcUJXolqvdjFCMV1zt0bFwKqarJBA8Hk3WgdOeCWiWeVsvvNIBIXsyIZRs28Tm/K
	zNFcunBUPHfBA=
X-Received: by 2002:a17:902:d2c7:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2ce8298a501mr18775855ad.30.1783654129682;
        Thu, 09 Jul 2026 20:28:49 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm53436465ad.15.2026.07.09.20.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 20:28:49 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Fri, 10 Jul 2026 11:28:14 +0800
Subject: [PATCH v4 03/11] cgroup/cpuset: Drive kernel-noise housekeeping
 updates from isolated partitions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-wujing-dhm-v4-3-2e912e5d9645@gmail.com>
References: <20260710-wujing-dhm-v4-0-2e912e5d9645@gmail.com>
In-Reply-To: <20260710-wujing-dhm-v4-0-2e912e5d9645@gmail.com>
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
 linux-kselftest@vger.kernel.org, Jing Wu <realwujing@gmail.com>, 
 Qiliang Yuan <yuanql9@chinatelecom.cn>
X-Mailer: b4 0.13.0

An isolated cpuset partition already updates the HK_TYPE_DOMAIN
housekeeping mask.  Extend it to also update the kernel-noise masks
(HK_TYPE_KERNEL_NOISE and HK_TYPE_MANAGED_IRQ) so that creating or
destroying an isolated partition reconfigures the full set of
housekeeping cpumasks.

The sched domain mask is updated first because the workqueue flush and
timer migration paths depend on it; the kernel-noise masks are updated
afterwards via housekeeping_update_types().

housekeeping_update() and housekeeping_update_types() are called after
dropping cpus_read_lock and cpuset_mutex, with only cpuset_top_mutex held
for mutual exclusion.

Co-developed-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Signed-off-by: Jing Wu <realwujing@gmail.com>
---
 kernel/cgroup/cpuset.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 5c33ab20cc208..80f43a24d3c8a 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1347,17 +1347,36 @@ static void cpuset_update_sd_hk_unlock(void)
 		rebuild_sched_domains_locked();
 
 	if (update_housekeeping) {
+		static const unsigned long noise_types =
+			BIT(HK_TYPE_KERNEL_NOISE) | BIT(HK_TYPE_MANAGED_IRQ);
+
 		update_housekeeping = false;
 		cpumask_copy(isolated_hk_cpus, isolated_cpus);
 
+		mutex_unlock(&cpuset_mutex);
+		cpus_read_unlock();
+
 		/*
 		 * housekeeping_update() is now called without holding
 		 * cpus_read_lock and cpuset_mutex. Only cpuset_top_mutex
 		 * is still being held for mutual exclusion.
 		 */
-		mutex_unlock(&cpuset_mutex);
-		cpus_read_unlock();
+
+		/*
+		 * Update the sched domain mask first; it must succeed
+		 * before the kernel-noise types because workqueue flush
+		 * and timer migration depend on the sched domain mask.
+		 */
 		WARN_ON_ONCE(housekeeping_update(isolated_hk_cpus));
+
+		/*
+		 * Update the kernel-noise housekeeping masks
+		 * (HK_TYPE_KERNEL_NOISE and HK_TYPE_MANAGED_IRQ).  The tick,
+		 * RCU and managed-interrupt state is reconfigured as the
+		 * affected CPUs are cycled through the CPU hotplug machinery.
+		 */
+		WARN_ON_ONCE(housekeeping_update_types(noise_types,
+						       isolated_hk_cpus));
 		mutex_unlock(&cpuset_top_mutex);
 	} else {
 		cpuset_full_unlock();

-- 
2.43.0

