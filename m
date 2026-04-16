Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB233FE15
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776365722; cv=none; b=B/e45e4m7I4WeeYwnvqlm7uqY74XZu/6/yMO2004sJ9R2pOCZP8FGneccRsipJL6eKS9dGD0+J6slT0vsWnY+6eCxQqBLSrp3HWMYPazOVguz9uZfxAb5wz4hHvVDn9eFcu8VqWwNU3wC4pNJvorvq9SbwfSmEa5T5z2XEpLNBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776365722; c=relaxed/simple;
	bh=5Qo+eAz3SBKadm4Z8gZJ/qNzFApy6MaZ8rec1M7Tiz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qe7dKDAV/R1vDEgn3D4rSkUWBSMmlttAIIqcodvu13cYctuQkMuHiVQHI5lfP1rqTJX1K9H9XZYgQRK/A8z3drN8JYOjU2e8j8PP0mpWrEL0qFM6pTPqnYSP+QPAUay45i0JPgVnMRI3L1r5S16UnPn8V/qzvAFswvU3iCAmWhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuO7+Ed5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuO7+Ed5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso2839413b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776365720; x=1776970520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gfLwe6MOspavv7FeIUqnxHqxQUhY4jmj4V6sVwADv8=;
        b=SuO7+Ed5Sd0p20+BRsOtBzQ+T1aToNSRcjWm7m0TTFsW4XhcT5FptzPWmErtqOYXIU
         Ihezea1JehizNfTw4F1zpVZk6c2WrLZivRfCkqLP7YpyUpM2lCHM8jYkTf3fRMo/8GHR
         OOwsUu8H0bgJBGeF0+2WjLMexeM4mVM/AmqH6Uns93nLHJEKZ+8ZgFXU5EWbSfi+5Zo+
         qd6pqlQ4RH+OJwaGf8z3S1GPw6XppToX9I4jU1YNDf+oFInCU85OJ7xMzARmdxcKa8sG
         XQHWcs8+GYR/7TTPAMK4nDGa38qQCZX6/+SG5LiXDz8Ws0mGti3OOJ1H9cYHMY4QX/rc
         8G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776365720; x=1776970520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/gfLwe6MOspavv7FeIUqnxHqxQUhY4jmj4V6sVwADv8=;
        b=Eosl4kMa3XIiGhZqZGdVD1WXYo6ajC00WwuBFRqZ7YfelNwKuQGF+IG9e37a63uZo+
         bg2+fmfvftl+AXFlLhqodKPWDPOLlaSsWbhQbKI2a6rp6X1FlSszJcUfx7tTLCh1H6qr
         R55xl7mCvKQj+EVSns43zDcIDKxW0l0Ru8sCHwXHngQU0iLpAhcvQw1cUjoofoMK9meI
         eD0tT9+1FkWO17vujAiIaZx1gwFv87F+e4vLxX+h0q02p7/9YaAslNVrGHIkD+AVf3XH
         PxZJGKtVFbZ5DXurssNrGkY8r5w+jAGZK7ky6/6jTDH9h2e+ZYxN7r14+4B5T8YQji10
         QOOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9W/SQMfouw0h4n40IeJ9UPj1ctRUhL6uesorW+WwGyMYlMjx6EgjtmE0plgf6vVA1HPlnrxZwvyPvBCN/aCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzFwY7df93hX8DIj9kaIounSfjrwQ/vqFxSee9oMgIn7cTfhTK
	GxVEuKsefhvF2bo1+AF0L1dEsaZ6/nszo6GrOn5EHbnRh90kPZsdtexC
X-Gm-Gg: AeBDievIIbRog3Q0OREgSdeaDDXgQtrW56CCX8FP153OtjyQU4I1VxyWO0vYQucRVJ4
	5Tvt1IviNjdw4axeCgxkDAnpFWrZCLIChmwjHXaMA/vMV5YAm/dbwyQ8VWvEhs8uAsIR8XZK7vE
	5tRrq7UQF98fIJMw6grkanIy4XSqEtZ+KMBquDyOLhU/K45aJrWAan8VKPS2eTiNj3LSyhmhrCt
	4Dmu3gJ5oEEQGRVKba6PS+f4YMeQvntAFAbdG4hosBEsCE1Va6xHz57AGGvzVoqwIxG4jUxFyA/
	tN812GLYt9gwPjb0KhqxTaE8cZrE8CADU8+v/Q7R3pi5upklGdNwu/GyMGNvsy7fwVsQBA1dSE/
	83pmaydhWx6E0A4KLd3QcYaqteYv9mVi7frnAgY8H59gszTCr1KJ0Ceg5+zAcV+ly/LwuBbnaOa
	AmjanjDor5uNoaTadRi2uAnvJ/YyKdWjYPbTv5ltzVDXGCd1qlgX5Dc6ytipJGjjscHzbShBGZR
	w3bIyfSZO3cj0gDh1hB2apxBd9psTH5+Q==
X-Received: by 2002:a05:6a00:1d95:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-82f889133c7mr477950b3a.39.1776365720339;
        Thu, 16 Apr 2026 11:55:20 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744b350sm5668181b3a.54.2026.04.16.11.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:55:19 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: jhs@mojatatu.com,
	vinicius.gomes@intel.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: horms@kernel.org,
	vladimir.oltean@nxp.com,
	xmei5@asu.edu,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net v4 1/2] net/sched: taprio: fix NULL pointer dereference in class dump
Date: Fri, 17 Apr 2026 02:55:01 +0800
Message-ID: <20260416185501.647884-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416185501.647884-2-bestswngs@gmail.com>
References: <20260416185501.647884-2-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a TAPRIO child qdisc is deleted via RTM_DELQDISC, taprio_graft()
is called with new == NULL and stores NULL into q->qdiscs[cl - 1].
Subsequent RTM_GETTCLASS dump operations walk all classes via
taprio_walk() and call taprio_dump_class(), which calls taprio_leaf()
returning the NULL pointer, then dereferences it to read child->handle,
causing a kernel NULL pointer dereference.

The bug is reachable with namespace-scoped CAP_NET_ADMIN on any kernel
with CONFIG_NET_SCH_TAPRIO enabled. On systems with unprivileged user
namespaces enabled, an unprivileged local user can trigger a kernel
panic by creating a taprio qdisc inside a new network namespace,
grafting an explicit child qdisc, deleting it, and requesting a class
dump. The RTM_GETTCLASS dump itself requires no capability.

 Oops: general protection fault, probably for non-canonical address 0xdffffc0000000007: 0000 [#1] SMP KASAN NOPTI
 KASAN: null-ptr-deref in range [0x0000000000000038-0x000000000000003f]
 RIP: 0010:taprio_dump_class (net/sched/sch_taprio.c:2478)
 Call Trace:
  <TASK>
  tc_fill_tclass (net/sched/sch_api.c:1966)
  qdisc_class_dump (net/sched/sch_api.c:2326)
  taprio_walk (net/sched/sch_taprio.c:2514)
  tc_dump_tclass_qdisc (net/sched/sch_api.c:2352)
  tc_dump_tclass_root (net/sched/sch_api.c:2370)
  tc_dump_tclass (net/sched/sch_api.c:2431)
  rtnl_dumpit (net/core/rtnetlink.c:6864)
  netlink_dump (net/netlink/af_netlink.c:2325)
  rtnetlink_rcv_msg (net/core/rtnetlink.c:6959)
  netlink_rcv_skb (net/netlink/af_netlink.c:2550)
  </TASK>

Fix this by substituting &noop_qdisc when new is NULL in
taprio_graft(), a common pattern used by other qdiscs (e.g.,
multiq_graft()) to ensure the q->qdiscs[] slots are never NULL.
This makes control-plane dump paths safe without requiring individual
NULL checks.

Since the data-plane paths (taprio_enqueue and taprio_dequeue_from_txq)
previously had explicit NULL guards that would drop/skip the packet
cleanly, update those checks to test for &noop_qdisc instead. Without
this, packets would reach taprio_enqueue_one() which increments the root
qdisc's qlen and backlog before calling the child's enqueue; noop_qdisc
drops the packet but those counters are never rolled back, permanently
inflating the root qdisc's statistics.

Fixes: 665338b2a7a0 ("net/sched: taprio: dump class stats for the actual q->qdiscs[]")
Reported-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 net/sched/sch_taprio.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 8e37528119506..e866e5288c3e6 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -634,7 +634,7 @@ static int taprio_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	queue = skb_get_queue_mapping(skb);
 
 	child = q->qdiscs[queue];
-	if (unlikely(!child))
+	if (unlikely(child == &noop_qdisc))
 		return qdisc_drop(skb, sch, to_free);
 
 	if (taprio_skb_exceeds_queue_max_sdu(sch, skb)) {
@@ -717,7 +717,7 @@ static struct sk_buff *taprio_dequeue_from_txq(struct Qdisc *sch, int txq,
 	int len;
 	u8 tc;
 
-	if (unlikely(!child))
+	if (unlikely(child == &noop_qdisc))
 		return NULL;
 
 	if (TXTIME_ASSIST_IS_ENABLED(q->flags))
@@ -2183,6 +2183,9 @@ static int taprio_graft(struct Qdisc *sch, unsigned long cl,
 	if (!dev_queue)
 		return -EINVAL;
 
+	if (!new)
+		new = &noop_qdisc;
+
 	if (dev->flags & IFF_UP)
 		dev_deactivate(dev, false);
 
@@ -2196,14 +2199,14 @@ static int taprio_graft(struct Qdisc *sch, unsigned long cl,
 	*old = q->qdiscs[cl - 1];
 	if (FULL_OFFLOAD_IS_ENABLED(q->flags)) {
 		WARN_ON_ONCE(dev_graft_qdisc(dev_queue, new) != *old);
-		if (new)
+		if (new != &noop_qdisc)
 			qdisc_refcount_inc(new);
 		if (*old)
 			qdisc_put(*old);
 	}
 
 	q->qdiscs[cl - 1] = new;
-	if (new)
+	if (new != &noop_qdisc)
 		new->flags |= TCQ_F_ONETXQUEUE | TCQ_F_NOPARENT;
 
 	if (dev->flags & IFF_UP)
-- 
2.43.0

