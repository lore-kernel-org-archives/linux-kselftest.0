Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F5C3822AA
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874839; cv=none; b=InGSourV4vpLHwlxE6T9hF2NO79FwFIVjfMOeyCitsszJokmqaIdFyuPCj608Ut4ld/a9z9my6mPq9cnHQeynwfNj7uXTUnJi8PNO19eTD2VXr1sEyJ8W8WhX0WHsSa11NK63Yc3Q2FlBkjoXwZ7IbGpKZUgP6TnPgwKJI5SZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874839; c=relaxed/simple;
	bh=Hh1pW8TCbKrbRyYxSV+yEg7FM8rEKcdeMWZzSpi3Zls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psrJvpSV2Mbl8yPYgaGqe9eW9NVs/KzJ1bl62XQuBL0wuUdhmkw8PN8xiMl2GmUy+vvjf9skdVPKBs3wDW1A8oHgYAfPO1kqLtqutAILo//wdiO7MJzz2WsmqyldQg41mszN6vcYLCfmzoORTDuH4PzKXsgYRBwswjamX0dUSrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnjXIO92; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnjXIO92"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso3552261a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 09:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776874836; x=1777479636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7RXJ4fqCE+PSvOq7lwXbfz/521k66dE3TKDKqzl/LE=;
        b=YnjXIO92PE3jVdv4xTXtwIQ516Q61n+YY6VSHlKBSf2/odBU9WgloNEBJaeK9W+nE/
         g5Q+9fianYxp6YXE/mJAVrigMZ0vbBSjtwM1Snv4476LhlkVqn70s/0yZGnGLHIdl/D1
         0OXhG0c0+AY8Kn2UYsecd6+eZVX+GfgxZ+7+AlO0UdSq72cdn22IuIM+9TrnuwMCf+6m
         QeFHllfW6BDBuW/g6JaXS/dDYpCOOmQrN/Kwjlv1CaGZPKLz8T01ACLgPIjH8InS8AMa
         M/tCRuNS94B62q5X0bFTzxu+QIRF1yVnkdVRCpjSffovkW7KiBE9HdJZKDIaff35JHNO
         TZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874836; x=1777479636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7RXJ4fqCE+PSvOq7lwXbfz/521k66dE3TKDKqzl/LE=;
        b=RW6UikDxgnndK7JBRaJDvXJGPSfFwiyrMGRD40qfsF2BkQuEjQ/KZ5CcnHeWcMclSK
         YTPdowttBp+bkD6cTdg5o5b9m7rQKTtwrPexm01wkBQrAuT+RyqSquzEF1eVqvk41tuh
         cBvgYr0qNCbDCdgHjE5L4NLWgZR0fVDL4nTMLg3JY2TZa1MgrIJRTG59hZYTsuUV2XV9
         1smZ0W50PHBeTZB6DZFDxhNj0VTim+ExjSoFaSOSFl6ymS5xcoJ0nr4ZSKZ82L73NQNJ
         NE1aaqWaqk5HCNXDralB9A1kus5/7nKyVsYfJvdn3roJN6PPO+r1IvFH3HyA2YxlmFbk
         XgCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ugdV2vaWvifJGIDA2rAGk+wqCjsVUK+Di8ItLDxSMsf51LzmS3OzE0fS1PmoO4BHlIEDzUZb6LxI9dXCIPmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyon3IQVYnjjrCg1mfb+SjZQkK5Rign6f7LZfXjv6rBxA1ZIAXO
	jhCQQFYfF7uzJLukf2HReavkwX1VOqtvL0U4onzhswdQAvPmoXd2HMHp
X-Gm-Gg: AeBDievhyjY1Bnr8mllKBaG4GZsq6VMU96bVekNavtQWOMSRAHCe6Ur9Mq+9umkEopY
	kspYBzBeu4GpLdiY0tcGVoJHsXodc09YaAVDjkYS/cVrTRnJAfkQpPj982pYVGF2R40Y4r80f4c
	gWjl9t5YyWnMcfHFeEnzP3QsKF/YGoHE0K84CD+PQT3MP9DDb8bmIsjeGu33ENmEardFhAQJpk3
	5bXrfBtv1cwQw9i+0GzIfkFcxguM61ZLyCu4ARK+jbWob5J+BE7SbVpiK+Yat83SpUqNUFd2eXl
	dE9afJ0NChqdmdi6bZr3BxTT8Uw4K2AW3gG/7PNxjOaRR75lLBLeEUPSrYqqRI+UHJqUbTG6vB4
	fXlWeCpuRFFeI+9nSu6+DWNwO7cQAGvJmiKuL3H01K0AY6ptY/xYqo8XsC6JsERjuLWkCPoaXku
	dAH4RrRfgcMwxXwK7tdtzpAxgb+d0h34AGtvmd4naASXYw8CLbPQ6LUUkUh6aEK7cLS85gux7zQ
	Bw9h3bf6mRVGs7Nvrvr81w=
X-Received: by 2002:a17:90b:5865:b0:35e:27ec:dea with SMTP id 98e67ed59e1d1-36140493410mr25667475a91.23.1776874836157;
        Wed, 22 Apr 2026 09:20:36 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cdd1sm170335445ad.38.2026.04.22.09.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:20:35 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vladimir.oltean@nxp.com,
	shuah@kernel.org,
	xmei5@asu.edu,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net v5 1/2] net/sched: taprio: fix NULL pointer dereference in class dump
Date: Thu, 23 Apr 2026 00:19:58 +0800
Message-ID: <20260422161958.2517539-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422161958.2517539-2-bestswngs@gmail.com>
References: <20260422161958.2517539-2-bestswngs@gmail.com>
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

After this change *old can be a valid qdisc, NULL, or &noop_qdisc.
Only call qdisc_put(*old) in the first case to avoid decreasing
noop_qdisc's refcount, which was never increased.

Fixes: 665338b2a7a0 ("net/sched: taprio: dump class stats for the actual q->qdiscs[]")
Reported-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 net/sched/sch_taprio.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 8e37528119506..a7daf34593e07 100644
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
-		if (*old)
+		if (*old && *old != &noop_qdisc)
 			qdisc_put(*old);
 	}
 
 	q->qdiscs[cl - 1] = new;
-	if (new)
+	if (new != &noop_qdisc)
 		new->flags |= TCQ_F_ONETXQUEUE | TCQ_F_NOPARENT;
 
 	if (dev->flags & IFF_UP)
-- 
2.43.0

