Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C234F479
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429886; cv=none; b=LFwdKHuGwACVA5v3s9HIlQVjY8lzudQ7MGh+zuySICcEVBqGVQXSW+OZxGvwGTkteUeNycCn2R+CqY+81CHrFWcNjKvjQzhK9Me1CKYWptZNGXFKt+vVjXIWbXP1kkhcPNxNbKkGLRs/xgrrth00sQnejTqQ9BLrTRln339jod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429886; c=relaxed/simple;
	bh=f7O9UMgeqrl0r9w3zlKNvRPg+oNFv2EqHzEVcBEVPEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWC9wwZDGCQ/Z2i/KPa3gbZh+brHwWYeABIBn7ZNhQlyhIAcFG8QDfDDjuHm4iq++7VNxVZlGqGyJ8gLfaXHqet9YP7Nq7e/YbrzL0oJG7QGfaUjppZ7T1BdojBQcKw7W8sYOr8s/iwpVKuTyyFOLTOWZNzI+EI78rPDKfXJy8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7SAw6kz; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7SAw6kz"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c1092cc08cso2897799eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429884; x=1775034684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scmgWcS5GsqDyCs8R5zf+G8RGx6zlEEWGauepG1UF1o=;
        b=f7SAw6kz5cKyzfzptXjE6xketXSyTYWYPeHAkXxFM/H6W/aWSVDEweYdp9SHeJtZ7i
         Lyg/FuDdUlNKsCu7Os3L7XFdvVzcNPrnpGYirQUEF5dV85/WEwIJgcWRRVzAo9JNutVe
         MoyzAQQCNChd0Vaor3W5j76lWlMVijZZ2Vv0CZtxZUd6AtLgUNnIjYfMKawJvpdIkYmo
         sm6OgStWtKRHBXkuz4hQWH4oC4YkX494+sm8VUat8GEPZBrfe/F0r3UA2EgvFSpBXXj5
         K01+3d0obkZKW+Jw/V/zALpIhGGm2YkrY/d1UbsoGx6bIzpKO+ga/sP0ZS5v5VlrveYL
         yuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429884; x=1775034684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=scmgWcS5GsqDyCs8R5zf+G8RGx6zlEEWGauepG1UF1o=;
        b=KQFA2lX8NZzcoFY9S3QOhIm9FQ0zRLdoWPTzAdsWMFk1XiI4gAnzpiPgeoWZ1jqSQ8
         A8UFu5WsoxYVP82J/jDLCXWw8meX9u+nCh2SdUf7sdGjgPVpVIFDUNf12Z2SCvGF3aDY
         bMf8MA7I1OqeMbeU7Ev+m1QLBkS4fafyGBQQY98u6XgEdISGgeHUd4hRaC2GnQkxSXjK
         1dNFqvvbRILj32F1NG2VBtsEUE56FDfUUCnT9fKFgve/Jso6+A+Y7KSBO/eW2rOJyXOt
         7nh5Xyd3bTHBpbxIgx83pqSxQ3SGnPns2gFiZK+3F/zoWasrjV3O0hgM0e7sVIWY1m/6
         WrTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiOiwbQDVrq0YzNjteX+vqfVeric/MS6vgpdatWwVccLx+9tytqR9KHEv+vuOzj5iqE475q2ROo9NmWpe3rDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMlywLwiQwPXY4Jpn7lyljie02Y2d+PtnUtR8lxbwrXzS1tYJ
	EUyCw8y9z2v9hwG1SplL43dhJ5Y4kt1CAkOE/TzpIxtLcOL/WPCrr58F
X-Gm-Gg: ATEYQzx1o9O5K1H9lXjElhi9Yq+NTmDcc3xXTRXdm9Mx7b1/rUPzCjTVOd1b2KRQGto
	l8qAhnJvvct2no/Ak1+YSDttChgt2gYB4vZ/WtmXRlkW/vrI6bSpE79ILYllTZbAXGKwDDAowQF
	mJi4PvdhDgEczR1R6m7FwbdkHtRf4E80yz+M3cQGYWJclL/5z/jBTQwU2WlujNOlXTXdNjtkqSm
	AxKa9UIFiq0ydKPLsRe8gpk0F3UsinObgc/EpnDKraec/WgPpBlvLbJt0fgPwMQq4tQ8piuM6ps
	f3/jx/XUly+MVE930+FHO6IewYllS4a1WvAsYLhnT5RAi6HtbJDOlnPNJ7gkFa6UrDS93gux88R
	Umyy0h7vHGsbnaGRzjOBbUUvXyJeZNYD12CCXwBgPLcvPbYeX40aHEJfZSprRR67mTrXegQE12B
	wX5tR77pS4XdPHEQSy
X-Received: by 2002:a05:7301:19a8:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c15d479457mr1165933eec.26.1774429883454;
        Wed, 25 Mar 2026 02:11:23 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c159e25dc7sm2786389eec.27.2026.03.25.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:11:23 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Wed, 25 Mar 2026 17:09:44 +0800
Subject: [PATCH 13/15] sched/isolation: Implement sysfs interface for
 dynamic housekeeping
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-dhei-v12-final-v1-13-919cca23cadf@gmail.com>
References: <20260325-dhei-v12-final-v1-0-919cca23cadf@gmail.com>
In-Reply-To: <20260325-dhei-v12-final-v1-0-919cca23cadf@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

Subsystem housekeeping masks are currently static and can only be set
via boot-time parameters (isolcpus, nohz_full, etc.). There is no
userspace interface to reconfigure these boundaries at runtime.

Implement the DHEI sysfs interface under /sys/kernel/housekeeping.

This enables userspace to independently reconfigure different kernel
services' affinities without a reboot.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 kernel/sched/isolation.c | 89 ++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 685cc0df1bd9f..1c867784d155b 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -8,7 +8,12 @@
  *
  */
 #include <linux/sched/isolation.h>
+#include <linux/capability.h>
 #include <linux/mutex.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/slab.h>
+#include <linux/ctype.h>
 #include <linux/notifier.h>
 #include <linux/topology.h>
 #include "sched.h"
@@ -16,9 +21,17 @@
 enum hk_flags {
 	HK_FLAG_DOMAIN		= BIT(HK_TYPE_DOMAIN),
 	HK_FLAG_MANAGED_IRQ	= BIT(HK_TYPE_MANAGED_IRQ),
-	HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
+	HK_FLAG_TICK		= BIT(HK_TYPE_TICK),
+	HK_FLAG_TIMER		= BIT(HK_TYPE_TIMER),
+	HK_FLAG_RCU		= BIT(HK_TYPE_RCU),
+	HK_FLAG_MISC		= BIT(HK_TYPE_MISC),
+	HK_FLAG_WQ		= BIT(HK_TYPE_WQ),
+	HK_FLAG_KTHREAD		= BIT(HK_TYPE_KTHREAD),
 };
 
+#define HK_FLAG_KERNEL_NOISE (HK_FLAG_TICK | HK_FLAG_TIMER | HK_FLAG_RCU | \
+			      HK_FLAG_MISC | HK_FLAG_WQ | HK_FLAG_KTHREAD)
+
 static DEFINE_MUTEX(housekeeping_mutex);
 static BLOCKING_NOTIFIER_HEAD(housekeeping_notifier_list);
 DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
@@ -44,6 +57,9 @@ static ssize_t smt_aware_store(struct kobject *kobj,
 {
 	bool val;
 
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
 	if (kstrtobool(buf, &val))
 		return -EINVAL;
 
@@ -53,7 +69,7 @@ static ssize_t smt_aware_store(struct kobject *kobj,
 }
 
 static struct kobj_attribute smt_aware_attr =
-	__ATTR(smt_aware_mode, 0644, smt_aware_show, smt_aware_store);
+	__ATTR(smt_aware_mode, 0600, smt_aware_show, smt_aware_store);
 
 bool housekeeping_enabled(enum hk_type type)
 {
@@ -171,6 +187,9 @@ static ssize_t housekeeping_store(struct kobject *kobject,
 	cpumask_var_t new_mask;
 	int err;
 
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
 	if (!alloc_cpumask_var(&new_mask, GFP_KERNEL))
 		return -ENOMEM;
 
@@ -178,42 +197,26 @@ static ssize_t housekeeping_store(struct kobject *kobject,
 	if (err)
 		goto out_free;
 
-	/* Safety check: must have at least one online CPU for housekeeping */
-	if (!cpumask_intersects(new_mask, cpu_online_mask)) {
+	if (cpumask_empty(new_mask) ||
+	    !cpumask_intersects(new_mask, cpu_online_mask)) {
 		err = -EINVAL;
 		goto out_free;
 	}
 
-	if (housekeeping_smt_aware) {
-		int cpu, sibling;
-		cpumask_var_t tmp_mask;
+	mutex_lock(&housekeeping_mutex);
 
-		if (!alloc_cpumask_var(&tmp_mask, GFP_KERNEL)) {
-			err = -ENOMEM;
-			goto out_free;
-		}
+	if (housekeeping_smt_aware) {
+		int cpu;
 
-		cpumask_copy(tmp_mask, new_mask);
-		for_each_cpu(cpu, tmp_mask) {
-			for_each_cpu(sibling, topology_sibling_cpumask(cpu)) {
-				if (!cpumask_test_cpu(sibling, tmp_mask)) {
-					/* SMT sibling should stay grouped */
-					cpumask_clear_cpu(cpu, new_mask);
-					break;
-				}
+		for_each_cpu(cpu, new_mask) {
+			if (!cpumask_subset(topology_sibling_cpumask(cpu),
+					    new_mask)) {
+				err = -EINVAL;
+				goto out_unlock;
 			}
 		}
-		free_cpumask_var(tmp_mask);
-
-		/* Re-check after SMT sync */
-		if (!cpumask_intersects(new_mask, cpu_online_mask)) {
-			err = -EINVAL;
-			goto out_free;
-		}
 	}
 
-	mutex_lock(&housekeeping_mutex);
-
 	if (!housekeeping.cpumasks[type]) {
 		if (!alloc_cpumask_var(&housekeeping.cpumasks[type], GFP_KERNEL)) {
 			err = -ENOMEM;
@@ -242,7 +245,7 @@ static ssize_t housekeeping_store(struct kobject *kobject,
 }
 
 static struct hk_attribute housekeeping_attrs[HK_TYPE_MAX];
-static struct attribute *housekeeping_attr_ptr[HK_TYPE_MAX + 1];
+static struct attribute *housekeeping_attr_ptr[HK_TYPE_MAX + 2];
 
 static const struct attribute_group housekeeping_attr_group = {
 	.attrs = housekeeping_attr_ptr,
@@ -265,28 +268,22 @@ static int __init housekeeping_sysfs_init(void)
 		housekeeping_attrs[i].type = i;
 		sysfs_attr_init(&housekeeping_attrs[i].kattr.attr);
 		housekeeping_attrs[i].kattr.attr.name = hk_type_names[i];
-		housekeeping_attrs[i].kattr.attr.mode = 0644;
+		housekeeping_attrs[i].kattr.attr.mode = 0600;
 		housekeeping_attrs[i].kattr.show = housekeeping_show;
 		housekeeping_attrs[i].kattr.store = housekeeping_store;
 		housekeeping_attr_ptr[j++] = &housekeeping_attrs[i].kattr.attr;
 	}
+
+	housekeeping_attr_ptr[j++] = &smt_aware_attr.attr;
 	housekeeping_attr_ptr[j] = NULL;
 
 	ret = sysfs_create_group(housekeeping_kobj, &housekeeping_attr_group);
-	if (ret)
-		goto err_group;
-
-	ret = sysfs_create_file(housekeeping_kobj, &smt_aware_attr.attr);
-	if (ret)
-		goto err_file;
+	if (ret) {
+		kobject_put(housekeeping_kobj);
+		return ret;
+	}
 
 	return 0;
-
-err_file:
-	sysfs_remove_group(housekeeping_kobj, &housekeeping_attr_group);
-err_group:
-	kobject_put(housekeeping_kobj);
-	return ret;
 }
 late_initcall(housekeeping_sysfs_init);
 
@@ -313,8 +310,12 @@ static void __init housekeeping_setup_type(enum hk_type type,
 	if (!slab_is_available())
 		gfp = GFP_NOWAIT;
 
-	if (!housekeeping.cpumasks[type])
-		alloc_cpumask_var(&housekeeping.cpumasks[type], gfp);
+	if (!housekeeping.cpumasks[type]) {
+		if (!alloc_cpumask_var(&housekeeping.cpumasks[type], gfp)) {
+			pr_err("housekeeping: failed to allocate cpumask for type %d\n", type);
+			return;
+		}
+	}
 
 	cpumask_copy(housekeeping.cpumasks[type],
 		     housekeeping_staging);

-- 
2.43.0

