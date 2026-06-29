Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AD837DAAA
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 19:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760837; cv=none; b=slNkXTC2UnmEW4evyfnqhPfFF0y/umQXzlRjMSijaR639CbKxDKsSky1NX2riIFfJCIXFgJcfSg2scg7NgbV5sqxQbcQVFxVllDHnkjV4BZCSYH62r8DIHoudrgMQdH6hOxmPQzwmlxehQqJhRyJ0yiEGk3wCBnHVi7HpLnn6Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760837; c=relaxed/simple;
	bh=jJAUvERCBWJyLyHVf75IIN3+hRb/+x4SCNyciPSZI0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=INRIDuksakI0aW1c47zho34Kf6VOha6yDFsrNNcexC+tSzdtMPlbz0e0AHYFfoiL7jEyJXhghfT6ADeG3bB/jyR9Rn8+DCscDHoGfh90F25ymkyraHGemycsRdZ7pfmTK2YGUMsgJzf5oFzv3VR8GL+/m6efnbvoL+izOHnxEAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tanshuhao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BG/uMnA8; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanshuhao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BG/uMnA8"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-30c011c7cb9so9644702eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782760835; x=1783365635; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpinYq+HYvghk8YdIRt9bOuD2hk4FEWzgEV2yDIPBj0=;
        b=BG/uMnA8fDQ4tFzwR8EJOy5BAxkADJz7T5fIqDHdrJFYsFMF43ZO6qlT5g2SpG8brZ
         TncHteXAzPkWITsiByDU1AuMSYZBhmq9m83vyibilWcks59FNPuvAVqU9xB5oh/vp+aO
         bHNLfzfX/PMGvPWszr+v35Y9KmnQXUxBtXeeccnrFndJdW5mONYocsWbJjcNTfPPHyQP
         +7YEWBzeFExCY4lF4gKZXc9KIBe5yKWOT9ZvSEIqv6XBl5ridc8M7zxt9hHufWeC9ZW4
         fVVRuKFZnlC33S1M2mGLuGDklpM6QBoWUw+msRTuTN0R1bZGYqsg6OKPjFDGnFtf9HP1
         JN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760835; x=1783365635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpinYq+HYvghk8YdIRt9bOuD2hk4FEWzgEV2yDIPBj0=;
        b=YqR5fA4mPV149k8J4G7kp5dkje0HOgXG+++dm6gEnaDMnNJXRKZk1gYiUv5bfJaCAv
         gDXZJfuvUNY0DTqwfqWd2yNkLETvVM0JF2RwMq3WRuesIBjdXNKEJnNVPCHPJ2N+RU6D
         jl1z7N/6yt6ZWSstC5pERR+lLEbKmLi9kFOcJX+cem9nIrNYUWBQJAtRcJ8Hy0XTDiwF
         zdA6POhT/0ker/d4U6ybb38lr38MaDreH+mGo+DCYaQRLNZQRGYPL2Z50diL1P36BOin
         b13IPUw1rzmpo3PynvJIpWsObVo439EyBkXDBDk4AXnie8yo0lOu6OHmNplKZlX1JSuY
         8RAg==
X-Forwarded-Encrypted: i=1; AFNElJ9+/eQe37yB5XZjvlkUzrYdoBUXrhWmlvGKW0U9bLghZUzdWebDqqK3oobDka7G34NuMzKEE5Q0kVJPukzpW90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw13tSO9P2cR1wQJCydPAoy2lNTYoIc41ggyTUaJlI8LZkDDzed
	F2kzZQ9PrJbypTQ3+h0S+nDNw579aGOnXLNpk5ujuZr7Wone+eJ95Se7Q21Hi13DWU7gCFq/cgh
	MQHfJobemA+WMKTel6A==
X-Received: from dlbpj2.prod.google.com ([2002:a05:7022:3802:b0:139:fc9b:86dc])
 (user=tanshuhao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:fa0:b0:139:f094:7b35 with SMTP id a92af1059eb24-13b2a1dcbc1mr453997c88.37.1782760834544;
 Mon, 29 Jun 2026 12:20:34 -0700 (PDT)
Date: Mon, 29 Jun 2026 12:20:26 -0700
In-Reply-To: <20260629192029.4013794-1-tanshuhao@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260629192029.4013794-1-tanshuhao@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629192029.4013794-2-tanshuhao@google.com>
Subject: [PATCH net-next v1 1/2] net: Save kthread of threaded NAPI in
 napi_config and restore it when trying to create a new kthread.
From: Shuhao Tan <tanshuhao@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Shuhao Tan <tanshuhao@google.com>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a napi_thread_ctx struct that has a back pointer to napi_struct.

Make the NAPI kthread to use the thread_ctx as data pointer so that
it can poll on different NAPIs thoughout its lifetime.

Mirror the thread and thread_ctx in napi_config all the time.

Park the thread on napi_del instead of stopping if napi_config is
available.

Restore the thread and context when trying to create a new NAPI
kthread.

Signed-off-by: Shuhao Tan <tanshuhao@google.com>
---
 include/linux/netdevice.h |  12 +++++
 net/core/dev.c            | 106 +++++++++++++++++++++++++++++++-------
 2 files changed, 99 insertions(+), 19 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9981d637f8b5..05e430f10aba 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -63,6 +63,7 @@ struct dsa_port;
 struct ip_tunnel_parm_kern;
 struct macsec_context;
 struct macsec_ops;
+struct napi_struct;
 struct netdev_config;
 struct netdev_name_node;
 struct sd_flow_limit;
@@ -363,6 +364,10 @@ struct gro_node {
 	u32			cached_napi_id;
 };
 
+struct napi_thread_ctx {
+	struct napi_struct *napi;
+};
+
 /*
  * Structure for per-NAPI config
  */
@@ -371,6 +376,12 @@ struct napi_config {
 	u64 irq_suspend_timeout;
 	u32 defer_hard_irqs;
 	cpumask_t affinity_mask;
+	/* thread and thread_ctx mirrors fields of napi_struct when napi_struct
+	 * is alive. When the napi_struct gets destroyed, napi_config holds the
+	 * sole reference to the now parked kthread.
+	 */
+	struct task_struct *thread;
+	struct napi_thread_ctx *thread_ctx;
 	u8 threaded;
 	unsigned int napi_id;
 };
@@ -404,6 +415,7 @@ struct napi_struct {
 	struct hrtimer		timer;
 	/* all fields past this point are write-protected by netdev_lock */
 	struct task_struct	*thread;
+	struct napi_thread_ctx	*thread_ctx;
 	unsigned long		gro_flush_timeout;
 	unsigned long		irq_suspend_timeout;
 	u32			defer_hard_irqs;
diff --git a/net/core/dev.c b/net/core/dev.c
index 4b3d5cfdf6e0..c81992c929d9 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1647,20 +1647,45 @@ static int napi_threaded_poll(void *data);
 
 static int napi_kthread_create(struct napi_struct *n)
 {
+	struct napi_thread_ctx *thread_ctx = NULL;
 	int err = 0;
 
+	if (n->config && n->config->thread) {
+		n->thread_ctx = n->config->thread_ctx;
+		n->thread = n->config->thread;
+		WRITE_ONCE(n->thread_ctx->napi, n);
+		kthread_unpark(n->thread);
+		return 0;
+	}
+
+	thread_ctx = kvzalloc_obj(*thread_ctx);
+	if (!thread_ctx)
+		return -ENOMEM;
+
 	/* Create and wake up the kthread once to put it in
 	 * TASK_INTERRUPTIBLE mode to avoid the blocked task
 	 * warning and work with loadavg.
 	 */
-	n->thread = kthread_run(napi_threaded_poll, n, "napi/%s-%d",
+	thread_ctx->napi = n;
+	n->thread = kthread_run(napi_threaded_poll, thread_ctx, "napi/%s-%d",
 				n->dev->name, n->napi_id);
 	if (IS_ERR(n->thread)) {
 		err = PTR_ERR(n->thread);
 		pr_err("kthread_run failed with err %d\n", err);
 		n->thread = NULL;
+		goto free_thread_ctx;
+	}
+	n->thread_ctx = thread_ctx;
+	if (n->config) {
+		n->config->thread = n->thread;
+		n->config->thread_ctx = thread_ctx;
 	}
 
+	return 0;
+
+free_thread_ctx:
+	kvfree(thread_ctx);
+
 	return err;
 }
 
@@ -7183,7 +7208,13 @@ static void napi_stop_kthread(struct napi_struct *napi)
 	}
 
 	kthread_stop(napi->thread);
+	kvfree(napi->thread_ctx);
 	napi->thread = NULL;
+	napi->thread_ctx = NULL;
+	if (napi->config) {
+		napi->config->thread = NULL;
+		napi->config->thread_ctx = NULL;
+	}
 }
 
 static void napi_set_threaded_state(struct napi_struct *napi,
@@ -7199,13 +7230,11 @@ static void napi_set_threaded_state(struct napi_struct *napi,
 int napi_set_threaded(struct napi_struct *napi,
 		      enum netdev_napi_threaded threaded)
 {
-	if (threaded) {
-		if (!napi->thread) {
-			int err = napi_kthread_create(napi);
+	if (threaded && !napi->thread) {
+		int err = napi_kthread_create(napi);
 
-			if (err)
-				return err;
-		}
+		if (err)
+			return err;
 	}
 
 	if (napi->config)
@@ -7255,8 +7284,15 @@ int netif_set_threaded(struct net_device *dev,
 		WARN_ON_ONCE(napi_set_threaded(napi, threaded));
 
 	/* Override the config for all NAPIs even if currently not listed */
-	for (i = 0; i < dev->num_napi_configs; i++)
+	for (i = 0; i < dev->num_napi_configs; i++) {
 		dev->napi_config[i].threaded = threaded;
+		if (!threaded && dev->napi_config[i].thread) {
+			kthread_stop(dev->napi_config[i].thread);
+			kvfree(dev->napi_config[i].thread_ctx);
+			dev->napi_config[i].thread = NULL;
+			dev->napi_config[i].thread_ctx = NULL;
+		}
+	}
 
 	return err;
 }
@@ -7501,6 +7537,8 @@ static void napi_save_config(struct napi_struct *n)
 	n->config->defer_hard_irqs = n->defer_hard_irqs;
 	n->config->gro_flush_timeout = n->gro_flush_timeout;
 	n->config->irq_suspend_timeout = n->irq_suspend_timeout;
+	n->config->thread = n->thread;
+	n->config->thread_ctx = n->thread_ctx;
 	napi_hash_del(n);
 }
 
@@ -7695,6 +7733,21 @@ void __netif_napi_del_locked(struct napi_struct *napi)
 	if (test_and_clear_bit(NAPI_STATE_HAS_NOTIFIER, &napi->state))
 		irq_set_affinity_notifier(napi->irq, NULL);
 
+	if (napi->thread) {
+		if (napi->config) {
+			kthread_park(napi->thread);
+			/* napi->config holds the only reference to the thread
+			 * from now on.
+			 */
+			napi->thread_ctx->napi = NULL;
+		} else {
+			kthread_stop(napi->thread);
+			kvfree(napi->thread_ctx);
+		}
+		napi->thread = NULL;
+		napi->thread_ctx = NULL;
+	}
+
 	if (napi->config) {
 		napi->index = -1;
 		napi->config = NULL;
@@ -7704,11 +7757,6 @@ void __netif_napi_del_locked(struct napi_struct *napi)
 	napi_free_frags(napi);
 
 	gro_cleanup(&napi->gro);
-
-	if (napi->thread) {
-		kthread_stop(napi->thread);
-		napi->thread = NULL;
-	}
 }
 EXPORT_SYMBOL(__netif_napi_del_locked);
 
@@ -7804,11 +7852,18 @@ static int napi_poll(struct napi_struct *n, struct list_head *repoll)
 	return work;
 }
 
-static int napi_thread_wait(struct napi_struct *napi)
+static struct napi_struct *napi_thread_wait(struct napi_thread_ctx *thread_ctx)
 {
+	struct napi_struct *napi = READ_ONCE(thread_ctx->napi);
 	set_current_state(TASK_INTERRUPTIBLE);
 
 	while (!kthread_should_stop()) {
+		if (kthread_should_park()) {
+			kthread_parkme();
+			napi = READ_ONCE(thread_ctx->napi);
+			/* Might be awakened for stopping */
+			continue;
+		}
 		/* Testing SCHED_THREADED bit here to make sure the current
 		 * kthread owns this napi and could poll on this napi.
 		 * Testing SCHED bit is not enough because SCHED bit might be
@@ -7817,7 +7872,7 @@ static int napi_thread_wait(struct napi_struct *napi)
 		if (test_bit(NAPI_STATE_SCHED_THREADED, &napi->state)) {
 			WARN_ON(!list_empty(&napi->poll_list));
 			__set_current_state(TASK_RUNNING);
-			return 0;
+			return napi;
 		}
 
 		schedule();
@@ -7825,7 +7880,7 @@ static int napi_thread_wait(struct napi_struct *napi)
 	}
 	__set_current_state(TASK_RUNNING);
 
-	return -1;
+	return NULL;
 }
 
 static void napi_threaded_poll_loop(struct napi_struct *napi,
@@ -7882,13 +7937,18 @@ static void napi_threaded_poll_loop(struct napi_struct *napi,
 
 static int napi_threaded_poll(void *data)
 {
-	struct napi_struct *napi = data;
+	struct napi_thread_ctx *thread_ctx = data;
 	unsigned long last_qs = jiffies;
+	struct napi_struct *napi;
 	bool want_busy_poll;
 	bool in_busy_poll;
 	unsigned long val;
 
-	while (!napi_thread_wait(napi)) {
+	while (1) {
+		napi = napi_thread_wait(thread_ctx);
+		if (!napi)
+			break;
+
 		val = READ_ONCE(napi->state);
 
 		want_busy_poll = val & NAPIF_STATE_THREADED_BUSY_POLL;
@@ -12128,11 +12188,11 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 		goto free_all;
 	dev->cfg_pending = dev->cfg;
 
-	dev->num_napi_configs = maxqs;
 	napi_config_sz = array_size(maxqs, sizeof(*dev->napi_config));
 	dev->napi_config = kvzalloc(napi_config_sz, GFP_KERNEL_ACCOUNT);
 	if (!dev->napi_config)
 		goto free_all;
+	dev->num_napi_configs = maxqs;
 
 	strscpy(dev->name, name);
 	dev->name_assign_type = name_assign_type;
@@ -12160,6 +12220,8 @@ EXPORT_SYMBOL(alloc_netdev_mqs);
 
 static void netdev_napi_exit(struct net_device *dev)
 {
+	unsigned int i;
+
 	if (!list_empty(&dev->napi_list)) {
 		struct napi_struct *p, *n;
 
@@ -12171,6 +12233,12 @@ static void netdev_napi_exit(struct net_device *dev)
 		synchronize_net();
 	}
 
+	for (i = 0; i < dev->num_napi_configs; i++) {
+		if (dev->napi_config[i].thread) {
+			kthread_stop(dev->napi_config[i].thread);
+			kvfree(dev->napi_config[i].thread_ctx);
+		}
+	}
 	kvfree(dev->napi_config);
 }
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

