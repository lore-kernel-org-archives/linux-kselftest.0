Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD784A482B
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946671; cv=none; b=oDKTVPir7adA22lGVhGZ6rP7FoKr1YeBNy/i3w96wAM9bUNXw3b7xXUbSI1pwsACPNL+83kj0RqkDyCx/G5v6+/DAspocvqB3lf2UBtzCmMnZ8wXaKGoSe+VNTc07OJRkZGaqGyicXTMrnbgcstlDu+j9iKaoiFlC7bJ54+hH+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946671; c=relaxed/simple;
	bh=1/MWaWl7SHGLfFRyKiE4w3OttUIDPIFsx2PJUmpRrwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyUOWDpFAR+cbslpZiyXb4zwwSAB/wj9sDO/R/gAP2QOGHMpncW251JYiH5j1Oc1PZ6/m5iqBYr4rmXisTTKVurHs2M+sPgzgy324f5XmgvNsVv1Ysr3wQiZQgYxzTwGWG9rrOv5kbU8Izx8Y3P1nRnxcwBeCiYZrJzC5q+EeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkmJEB8u; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkmJEB8u"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-34e0b5014e8so1324332eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946664; x=1791551464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X6o0ty3ov2C8lJybFtCY8aJEJkERYawSQ48Y+HPmwLI=;
        b=EkmJEB8u0o8F7k88Il3uegfWkej2h5FG5Uv5Uy6LOVKhkjp5E1V2ItLqSiXXND8XNU
         iJQ6GSHEaHiq2kh+7M4dIPvKpHOri1wOUa4qqTUZ8J+Ao8fEuzhW5Aa8QP16kKpTrdZ6
         a+NjNLDrRKAdd1PatsvWeHK45dWvJhk7wwsjvV9YufIPuWkDy72+NqvvNa0zgDecqWi3
         d4CCAW8aSAS3CUBYQLgGH6IVDVt6JzDMD3S6PlYnoa6r0H1pLhzlejnHaE/UkuuSxs3B
         r6vA1RkFk55zhzUKdJ4dWMSLJ6qT84JsCfbrmzCTbibdXgPcSM9bBa+fmrcN+WisdpXg
         sdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946664; x=1791551464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6o0ty3ov2C8lJybFtCY8aJEJkERYawSQ48Y+HPmwLI=;
        b=wiESC08HSUYUlEinDUb6QaLefXSBfbzz5oX59xXT12bELOXJJ4Ftdln1kaTIHJi4ah
         DiyMlfTR2+RzABExW8VNX4A/HK/225HHkV12S/mPOsp3h+0hHIK/vpbq0plN8REm0WWH
         8U5zcaNKMtxDM1wKmWmAhxukfTEQp5lP06vQl+OiVXea/Xf/3zngCBj7tRsokt4m8xub
         1E3EnnhpayfRaQMmzAC3RRcFoZuhYdgBPgRmDBGjzaquP6FbMpRbU310BuXIM0ld1CNc
         aLfFBwQN6sdLAAt3XrqUG2T/j1NGbbozvdEfecdI0DrwgdaLk8igYvX+3JB3W2AsRNrO
         0dRg==
X-Forwarded-Encrypted: i=1; AKwUvBymsedaOgbxylcGkcuZRQDY9KbOjbUVMncYF7ch7y8HmWqPcEtHWYh3WenwdhkJIWeqMI5xJi1oxlJzuUy0B8A=@vger.kernel.org
X-Gm-Message-State: AFuF++mVQ+GR8grqPDent3eDwx8lS4reAP/wdZgLei0xpWAvipj3qs18
	enei7fmMNrHwbVBq1npvJ8VrtFzFcQhMfztAkr4NWTkLzabrsLi+xvVz
X-Gm-Gg: AYBFou0SZPa92SQpoaKq5rP2l6Gd91G8kuV7ah+8fmcZ61Au1C/BBvlHQQDQQI1tZde
	EqVQ1U7NYWA3I1rIDCjjp9qHb1fPpnUXqW730d0+CWNOrXMPZZJLyusdgBdmnhcF0058C34UimY
	eNKKkoIfz+7PuEpdjt6EOEUYHKAUM+NKu4VROiXcaUumWScTcS11nV++7czuTXicOWYqfyrdF5W
	hh44vltOFY4GrOvLTgJaqmACW3PSMSNT4UVJDTiiLejwJKVYm2eyryr4POnhY5ECpi9e6I0i4rz
	DzPlkExyP/TLRMP3+S1+dhyv2QrXUDgM4bHeGY00KPC9In1qJj4tJ0nRo8yXEW166+1svcn4a8I
	hikKtJFrdlX4B76zZoMhO11yHgiLgMdy0RvLAqcqgGHGdBSYWQuBwSJ5bS1EkGOxW8Gm1lAGAkC
	CN94cFf8+ub4BArD0jSIOCz42EO9ABU/yq3z0EqexItyF8cX5o/TvQpIuzBiVIURAtqk8=
X-Received: by 2002:a05:7301:1c1a:b0:34e:2150:e5a4 with SMTP id 5a478bee46e88-34e2150e886mr5581289eec.16.1790946663728;
        Fri, 02 Oct 2026 06:11:03 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c739sm7309347eec.3.2026.10.02.06.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:11:03 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 02 Oct 2026 21:10:24 +0800
Subject: [PATCH v5 04/12] cpuset: Drive kernel-noise housekeeping from
 isolated partitions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-wujing-dhm-v5-4-78a6996d87ad@gmail.com>
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

An isolated cpuset partition already updates the HK_TYPE_DOMAIN
housekeeping mask.  Extend it to also update the kernel-noise masks
(HK_TYPE_KERNEL_NOISE and HK_TYPE_MANAGED_IRQ) so that creating or
destroying an isolated partition reconfigures the full set of
housekeeping cpumasks.

HK_TYPE_KERNEL_NOISE must stay a subset of HK_TYPE_DOMAIN: a CPU with
the tick suppressed still needs to be excluded from the normal sched
domain, or scheduler load balancing can keep nominating it as a
target.  Update the sched domain mask first and only touch the
kernel-noise types when that update succeeds, so the two masks can
never diverge for the same isolation request.

housekeeping_update() and housekeeping_update_types() are called after
dropping cpus_read_lock and cpuset_mutex, with only cpuset_top_mutex held
for mutual exclusion.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/cgroup/cpuset.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3f52717c19654..8b3bb034adf62 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1431,17 +1431,43 @@ static void cpuset_update_sd_hk_unlock(void)
 		rebuild_sched_domains_locked();
 
 	if (update_housekeeping) {
+		static const unsigned long noise_types =
+			BIT(HK_TYPE_KERNEL_NOISE) | BIT(HK_TYPE_MANAGED_IRQ);
+		int ret;
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
-		WARN_ON_ONCE(housekeeping_update(isolated_hk_cpus));
+
+		/*
+		 * Update the sched domain mask first; it must succeed
+		 * before the kernel-noise types because workqueue flush
+		 * and timer migration depend on the sched domain mask.
+		 */
+		ret = housekeeping_update(isolated_hk_cpus);
+		WARN_ON_ONCE(ret);
+
+		/*
+		 * Only touch the kernel-noise housekeeping masks
+		 * (HK_TYPE_KERNEL_NOISE and HK_TYPE_MANAGED_IRQ) once the
+		 * sched domain update above actually succeeded: HK_TYPE_
+		 * KERNEL_NOISE must stay a subset of HK_TYPE_DOMAIN, so a CPU
+		 * can never end up tick-suppressed while still scheduled as
+		 * part of the normal (non-isolated) sched domain.  The tick,
+		 * RCU and managed-interrupt state is reconfigured as the
+		 * affected CPUs are cycled through the CPU hotplug machinery.
+		 */
+		if (!ret)
+			WARN_ON_ONCE(housekeeping_update_types(noise_types,
+							       isolated_hk_cpus));
 		mutex_unlock(&cpuset_top_mutex);
 	} else {
 		cpuset_full_unlock();

-- 
2.43.0

