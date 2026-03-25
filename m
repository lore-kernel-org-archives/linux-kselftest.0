Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2128123B612
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429799; cv=none; b=nsn9XshvJ7Q0wVUkVhg3TV5MYYhFNBdjWNbXlyQO9W102mpbLs31FWBNsebV/inkd+IwIVSJH6BpsPI5qqHC3Mf19APnhSE33twPILXuDSLOTgCDIfJcKXZQTg7Ev5Llcy2w2t9/JRAkX8uAtAP22oYjGZe9kaK8iDb38yCOkVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429799; c=relaxed/simple;
	bh=0fAmdldKanTfynKcGbwbLRGSY5kHdMz+uttHRTgpIhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRQz1R05zQCh5pSkfptGAJWNl0+8Xevt+A/8Urlt1FV/Meo/6eL4Icg9aVqmt9tlJ70iY/256+ypWks0Xes42J2bvbJ6M8aZUM3IZLhwHBsZc34Ujqx1qlyPFlqjqOeS8SG18pbJnK8mbRC1HSxpMspUePUggVlcpDFZXjBI9NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gp837kIh; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gp837kIh"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so4096848eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429797; x=1775034597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVkhe/sbAiDJEUQYidI2AeK8GB4BwtQurPArQfvZeuc=;
        b=gp837kIhLNPhp9yBYtHdkUjG3fbpq7aJ3S7VRFx74GlqRiKToAFpQS4WP/hoQqkyW0
         vPCW3S3TYcutpoP8l8D9cDvtr+I4AhvlStVMbkvU844ljJWUhpP13wBD8pNVPNJ89VZQ
         OgGuprhsgv9wZDdp6DPhYhcjgz5TXa/d9BpS/vT/ulCdxYS7Nm56yWn9jvGncqVuPYhQ
         /0rXQ9FkXE/OwZDqqoZQUh50GeA9LFfbdDxByX0N9NiaqP3lbt1odfPrEiFUYYW/MhEa
         Sk8j6q5RDGc3oco6OOnfPPhy0JU468vxhReox0o5gcgsfmHUUJB2fviSDUs6BUAVmhZM
         gOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429797; x=1775034597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UVkhe/sbAiDJEUQYidI2AeK8GB4BwtQurPArQfvZeuc=;
        b=BsWGbBw7cNPwXXAhgz7YkOFQoVwUk+QkNtS7+4ce5D8Knk7xPMHB/qfbf9NJ2AJEF9
         HqXb9+qZc0j+jyr5rd88QEuvE+ymAbseveVBia3TSjF3pvgy4MDua2IX3Nqh6xHOB6a2
         jHLF8Zr3vTfqSNPklKY09AsjctWZmsIUQ3AWMb2RLaDC4O3Ay5OwgZsUUNEqNzAU+1El
         niydXOlZJnKz48Bt7MRCM8gM4Ny0atSHzn3R9LQdQS9orjclI9G2VUI0WFztKf2GheZ0
         MJQHvzkcnlcRoIHStcs4fHPOPdcSPd+YStoocD+NjGnKN/gGT5jiNcuEczcj4Md+ZRvU
         No0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNWq/YAThVKagaRtuIOJls9LslzVytqrG47CKZAjtjd2KuoeHGeKTwX3r178sIu/hF4+XPTLKU2u3nEBQvfdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYAIHRYCaVnUUBOgYLNi+JmhTVcyWcOpNC4xG6mDFWesr4hSn
	aBsxR2ey0oemFviexR6Hyk+Yzv7WREBlsL7fO94bdF8HW5Dp2dFtlY9u
X-Gm-Gg: ATEYQzwMKSM8aPwOfFf1bhJ1Bfr2LGMKxzeHa/0iZKwACXeYlNsd7LRdloKv1vtvUML
	4qXMUe857gLTrzssH5LW1hi0aF5NXE25BEHNnjnpT+CmbJRydb9x5V6/VgCgCs/57I2iNifucDe
	4q4/H7pG2OIAGqgpmIU/A7muI8bx71x1YE7rLAvh1Q1YfuJJTApW3cxe3/Mclbud9n72geq0EMU
	Fj6aEpkojvdjFuUOfbVnpm+Kymj7EbUI6w/YxYAXM5P/2V6BefCqNhcKsemwYv5jSG2RblRDtbx
	SQHDaxwPtEKIbqCExA17v3LK3B/GX5nLHegTnreJMBG6XJuBS8yfV5OQfosCpUeayrUjfR2zv0E
	fVSMWtN9xVqQWI86Xiv9cEHeMZ1miwkHzY8sCI6nYsxORAd5qUM86f8oBCkdPj7gvIqdYKMQvZP
	7cU2Ir45NUmx1hvs1i2zqZIsSW7hw=
X-Received: by 2002:a05:7300:a584:b0:2b7:1e86:3604 with SMTP id 5a478bee46e88-2c15d2b7001mr1621331eec.6.1774429797296;
        Wed, 25 Mar 2026 02:09:57 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c159e25dc7sm2786389eec.27.2026.03.25.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:09:57 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Wed, 25 Mar 2026 17:09:33 +0800
Subject: [PATCH 02/15] sched/isolation: Introduce housekeeping notifier
 infrastructure
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-dhei-v12-final-v1-2-919cca23cadf@gmail.com>
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

Subsystems currently rely on static housekeeping masks determined at
boot. Supporting runtime reconfiguration (DHEI) requires a mechanism
to broadcast mask changes to affected kernel components.

Implement a blocking notifier chain for housekeeping mask updates.

This infrastructure enables subsystems like genirq, workqueues, and RCU
to react dynamically to isolation changes.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 include/linux/sched/isolation.h | 21 +++++++++++++++++++++
 kernel/sched/isolation.c        | 24 ++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index d8501f4709b58..9df55237d3901 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -5,6 +5,7 @@
 #include <linux/cpuset.h>
 #include <linux/init.h>
 #include <linux/tick.h>
+#include <linux/notifier.h>
 
 enum hk_type {
 	HK_TYPE_DOMAIN,
@@ -24,6 +25,13 @@ enum hk_type {
 	HK_TYPE_KTHREAD = HK_TYPE_KERNEL_NOISE
 };
 
+struct housekeeping_update {
+	enum hk_type type;
+	const struct cpumask *new_mask;
+};
+
+#define HK_UPDATE_MASK	0x01
+
 #ifdef CONFIG_CPU_ISOLATION
 DECLARE_STATIC_KEY_FALSE(housekeeping_overridden);
 extern int housekeeping_any_cpu(enum hk_type type);
@@ -33,6 +41,9 @@ extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
 extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
 extern void __init housekeeping_init(void);
 
+extern int housekeeping_register_notifier(struct notifier_block *nb);
+extern int housekeeping_unregister_notifier(struct notifier_block *nb);
+
 #else
 
 static inline int housekeeping_any_cpu(enum hk_type type)
@@ -59,6 +70,16 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
 }
 
 static inline void housekeeping_init(void) { }
+
+static inline int housekeeping_register_notifier(struct notifier_block *nb)
+{
+	return 0;
+}
+
+static inline int housekeeping_unregister_notifier(struct notifier_block *nb)
+{
+	return 0;
+}
 #endif /* CONFIG_CPU_ISOLATION */
 
 static inline bool housekeeping_cpu(int cpu, enum hk_type type)
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 67a5ff273ea08..e7a21023726df 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -9,6 +9,7 @@
  */
 #include <linux/sched/isolation.h>
 #include <linux/mutex.h>
+#include <linux/notifier.h>
 #include "sched.h"
 
 enum hk_flags {
@@ -18,6 +19,7 @@ enum hk_flags {
 };
 
 static DEFINE_MUTEX(housekeeping_mutex);
+static BLOCKING_NOTIFIER_HEAD(housekeeping_notifier_list);
 DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
 EXPORT_SYMBOL_GPL(housekeeping_overridden);
 
@@ -86,6 +88,28 @@ bool housekeeping_test_cpu(int cpu, enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
 
+int housekeeping_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&housekeeping_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(housekeeping_register_notifier);
+
+int housekeeping_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&housekeeping_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(housekeeping_unregister_notifier);
+
+static int housekeeping_update_notify(enum hk_type type, const struct cpumask *new_mask)
+{
+	struct housekeeping_update update = {
+		.type = type,
+		.new_mask = new_mask,
+	};
+
+	return blocking_notifier_call_chain(&housekeeping_notifier_list, HK_UPDATE_MASK, &update);
+}
+
 void __init housekeeping_init(void)
 {
 	enum hk_type type;

-- 
2.43.0

