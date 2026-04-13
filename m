Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1779E397E88
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 07:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066278; cv=none; b=UHfricFtuKaSPLVF5I8Z+sliRvkwI6rwtQ7nJSeqKsCgZRachK+gtmDmrCCySObPfgk8KAIPCbZ8ztcAMdwahz4cm74AGoiEEYdD/QxZoJmqkmdqUiFL4BYBKaz3lvZ8aqiEqsdwMZSKRXOEgZ3q+BVclEJaGj7cpSQeJlKV3Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066278; c=relaxed/simple;
	bh=fwh11Z5Rw9aSnpZTME81tDT+ucj23bt65tyOS18FZ6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anjECvR0Q5KTP4P1YoM51hQ4KRKTM5gVc5FqBIL+e1sXNdwx2p0me7yJPneQfQGi3xHhB+3PdkAgaRdeH8sdHxHYfll62YH5DUb6wLl4SiFvl/d4caS15cKh1KiM5gYXtRWsG245s0kbCtVnb1u2Tg6AQsv/Ya8CHqVSsiLD6TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uu5CiQUF; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu5CiQUF"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c1a170a50so3667986c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 00:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066276; x=1776671076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWLi6Bh6Nz5J4yZhvIk8yyG7xG2dO9eEtzSyvnHXfpA=;
        b=Uu5CiQUFgwT9Tvcyp1y19u4pKgl6VHALdbdGT+LYNFMG2dSQ30/UlRH2NsohD3TBVH
         t5/6gTTTUNbYW4Ysza1zsf+c+FRxo5qXfaANKR+s/HW3YmREBqfWo7Q5Yn1KlYqpWCtg
         lvuRvG6lo5hFbrJUW4bjFnWSSzwogvvIODmQHj2pA8cNO9OaNBw1lK/LzhxMojpf4m6Z
         K94b9zXWN6e84oiq0nSflOVeFcCEDXqaO7Hjo5GwzK62iBvMZ7qtYbkqKbjA3QY2v8Xc
         Kvs0r8BvzkZoLXpiNIqurD4uPxN6MvdYF9YAGYMgdXDvom5ob34Q1NuWtDsO4Gr2JxpK
         N99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066276; x=1776671076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gWLi6Bh6Nz5J4yZhvIk8yyG7xG2dO9eEtzSyvnHXfpA=;
        b=K+ayd7KZiMeuhkIwAXLIThXf6ky4wiyRKgHrmTf9sYK9FYlutnD/wEJLGr1C7KXRnt
         1FMyPOSt20xqFL7xT9Ns8knI8LcIWOPpM8TCeDQUWZfV2xUrWarzmTYD+9nx6T/Jo2Rn
         gwL0KY3dhXSmkRODFuPaK74FL+3dk1n+lyu1iau0eyIBF22EULCSIVkwAYXn07FBsMnO
         1TBRdh1PyvhQxXYpgQ0audCTu9x1B4fD2uLVjTepr646SsG//IBDMcBYURlk1gjc3ZyU
         +4IE+EEcmV1cZ3gANrt5PPpeFsrzxHt3Zs7ejK7jgEjkPOuM71QFptoMHaWBZVClVajK
         TExg==
X-Forwarded-Encrypted: i=1; AFNElJ8B+xavEJVI5sDBMNf9fcqV3aIKPUD+j5xHZtwTVGwB2ExTwriF117BpCPKkyM5pNE29c+yxvLfzo5nW0xApzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgq0jQYJBODq4MouG7VCiInSKhQNr3/N3hjXDNJlnllFdSM/79
	cg/rISXzCRh7/VgyT8xAAmWpS8RJSbfnO6dlqh6JmgtpcolN8eTj6NeZ
X-Gm-Gg: AeBDieu4QrYy0v4sI/1sMzvxcfOd9LgnU1JF6Y2tpY6e3g1judktM3ggIxKz54/aJ4A
	1T71eAko1XMPKOl61tNHpkZuT33ZK4mXF8bHHKlwDHXhen99OaBIplxFzEGc7Gal1/eMvobWkR7
	ULpe7ikdNSxG23nzNHYo3MgS4UFwiD1nyZCzkdNh3GqLlmcLmE1vPQnyQxz3e+eYHyVrYPPvqd7
	x0C1pfvEtDN8o/5GTWLSr/2AiHeF9dSF2jb9h8cOR/zveVUZHMXiXjao+t87nnNxv7Ol96o0D9G
	PGoUr2mQqi5pMVd1YOXJE9pC7VBrK2yl4L1SXbJG4UP4xGztA+4eYDdWNIEkVH7YQCj6Iz/+H3G
	q//bi3R8WlGwnmSofcvjGChDTkFncyXrj4DF13DCA2SpVuNiIVdhuVGtPtZOzc0tJk9wkasMaqr
	iJ28MtTCvZiC2Ns4C1
X-Received: by 2002:a05:7022:6725:b0:128:d23d:81a7 with SMTP id a92af1059eb24-12c34e68fe3mr6219069c88.6.1776066276106;
        Mon, 13 Apr 2026 00:44:36 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm12884610c88.15.2026.04.13.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:35 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Mon, 13 Apr 2026 15:43:13 +0800
Subject: [PATCH v2 07/12] sched/core: Dynamically update scheduler domain
 housekeeping mask
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-wujing-dhm-v2-7-06df21caba5d@gmail.com>
References: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
In-Reply-To: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
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
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Waiman Long <longman@redhat.com>, Chen Ridong <chenridong@huaweicloud.com>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

Scheduler domains rely on HK_TYPE_DOMAIN to identify which CPUs are
isolated from general load balancing. Currently, these boundaries are
static and determined only during boot-time domain initialization.

Trigger a scheduler domain rebuild when the HK_TYPE_DOMAIN mask changes.

This ensures that scheduler isolation boundaries can be reconfigured
at runtime via the DHEI sysfs or cpuset interface.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 kernel/sched/core.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 496dff740dcaf..b71c433bbc420 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -39,6 +39,7 @@
 #include <linux/sched/nohz.h>
 #include <linux/sched/rseq_api.h>
 #include <linux/sched/rt.h>
+#include <linux/sched/topology.h>
 
 #include <linux/blkdev.h>
 #include <linux/context_tracking.h>
@@ -10959,3 +10960,25 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		p->sched_class->prio_changed(rq, p, ctx->prio);
 	}
 }
+
+static int sched_housekeeping_update(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	struct housekeeping_update *update = data;
+
+	if (action == HK_UPDATE_MASK && update->type == HK_TYPE_DOMAIN)
+		rebuild_sched_domains();
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block sched_housekeeping_nb = {
+	.notifier_call = sched_housekeeping_update,
+};
+
+static int __init sched_housekeeping_init(void)
+{
+	housekeeping_register_notifier(&sched_housekeeping_nb);
+	return 0;
+}
+late_initcall(sched_housekeeping_init);

-- 
2.43.0

