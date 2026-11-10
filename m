Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321044;
	b=ONarqle4zQsmb9fOsQgq8UYoeVlZ5ya3NUV7ZiqOVbznIegNkLP03sTfOjBP9irketBn
	 hOgn27Xdpx3ty83xVODFHm9JQtsPxmUgczedSjIpFDh4FlZ6rxfEeaocjbbYopxM03eI+
	 CjvdYRdZUCqdWRy+E0aCG4Sm4PzdGQuSqYRXu2rOgANBqQ/UTQX0wl6gzlkk+mp6hZp0X
	 bJHGEOGMbnoXJDPiUBSTMvrfLrrNgAYO21OsES0nfLQ8bfJFREv4RK6LKPjBnUnAqgBWO
	 jgkLxsOCoDJ+OVzWg/Tl5jg/uTdaIWfTWdOu0j44L6PGPAxayjlEPXhbyEbtVVIthNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3BB5WDO/WkA/vT+edqmzTsO0QDNYPpQH2jxIe7CVJGE=;
	b=LXWngqDfBfF6GtrxftHTYRjYHpY3D/SkQqtVP7OMuQd2SDyQy6+XjMm/OhhnLwRyksOG
	 owFcKXtcno0Va4DSLRSJBNcC1Fkwql/VPPsdyLlH4KEoXSAlIK1MMyipD+iEfzfHR1+fA
	 aId8YlgmRFaCXZSyiTG95crSLU9Q3i9RF12IrBdSigMJP0qyDKk965oUwROpzV43ytZaL
	 rDg+9bTGmDpat3W0bDN7d3vd0ciHnuV21mXCPD94plMLPqT62fOWiuqdm/8mdgSrTZato
	 kKKGpKx3JVh7BKZJ9vmCY2+37n/CJv2e4+VacOkKNCgB3aumo+SYXpnxTt4TYLWd3+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ZDd+RfxU;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD5606A335
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 14:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CD5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ZDd+RfxU
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b3a332105bso1644307b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794321042; x=1794925842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BB5WDO/WkA/vT+edqmzTsO0QDNYPpQH2jxIe7CVJGE=;
        b=ZDd+RfxUZRO+vgxA1m/cg1YLoKU4a95oU3btsVh3NLGVX6YLmthS52fyikYBePbWMZ
         dTTfDqtFwBBE+9RA6gLNXIQ3k0+JPGlIwYvNj+0+YQu3rS5RwFX9Iv6xYLOxytGgi01p
         MdCUv/iTX4nZx1Est+GT3X9XoFYRTcoNgsQtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321042; x=1794925842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BB5WDO/WkA/vT+edqmzTsO0QDNYPpQH2jxIe7CVJGE=;
        b=Yidx0eX4gvckWgPXbEJnPjgdcJmngFzWafxzRxdCDjGY1Ycj0m+L/G9Dq0lcInvkoV
         kZUtL3KUlv8fOjxP1oUbWAZR6lRmiT0YkzBT/N2K6WGD5k8lVuLjLHV0JDfmaCgTuaiu
         lyEOG7FHTFqHGbWI9Cx39rIsq7e7tuQmdOdKNYB1oQwVI1QwKiBuGOm8dGgTv0ptuKEj
         JP3O/40v+rQwgZIe2lbNMSFrdD3pHLDU3jSi4UYtUcsFaWRqzPZVAnkaj/e1JMp4JtMS
         FMNnHd9L74PB60ZOsEQPExeMLU1oYQatfoukmTsCKbzDOkUz1ha/jPbCowro+wOfUhfB
         SAWA==
X-Forwarded-Encrypted: i=1; AL+hErFQqik4BqNY7hGNh2CGKBT0nlj+9HW1kPFKEtr6oXYfIPfWthSrVYoVMBSjsv2DalNYQP+sg/QDaFQY8tQYQMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OBTdjryqpZblwAQJVM1QTvA1GjLY3r4JCi268reOrAGFn8B+U
	LZzpQZRdFspao30NzTVIM+O58U4prQJ/+VylTGcG8vuK1bH8svrV6YTLNu+TW6B7Dw==
X-Gm-Gg: AYBFou1fQFUp1ADJmvNoeMQF2/8NKFVZYMDh4cfu/MxIlCYnNeevQaEzREo3ZgNtEBb
	C/adZV4MeeWs5jMbjs0+i447Di7NhUTvm5+ulmbuIK/GMWcnzSd79VyVZF73PlRKRlyETjaRS1W
	/63GC44g3vTf24B6CrCMUCI4Den0DvxjgI6Hb+GpHoczvhVT4AUxp4aZHWYbHkSfzvX7JC24RC2
	aANBLWjfEBCejLCwoc0C0axrlpGS11AxdB5VlYFlW9+b8Hz651ai5etxAwqAOLKC7SqO6yhdasw
	jUzn0KU2YAQ/sfxwzKQkdztiVjcuKwWr5I/j7WHmExEQUgfoG0jbK4Fzpq+vFyEICgBqyFiYhyf
	/kpHycDYbdYcrAasOFbI4GhfE3x/xuZHHoshKOdnmDs2yOBNjzt8XuFNi/JkUsAfIjBh/lOMdMN
	cAodBIpssjzCJ3Ui81ajgH90/rw47QUQUB3c9vHM8jXQ8fQXYmE5mBBynrZHa9IGtAftLMvvrV2
	98Tv2SfeVCdpkCAhefHrdtp9a8pg3z17a9PPBKRDdEM2ASo9CpHedLBeyk1tWnwg5tLYPjSMoiS
	JJpKC+TdDHKU
X-Received: by 2002:a05:690c:660a:b0:8b3:38f3:8650 with SMTP id 00721157ae682-8b3925e8f59mr16637957b3.8.1794321042453;
        Tue, 10 Nov 2026 06:30:42 -0800 (PST)
Received: from exu-caveira ([2804:14d:5c54:4d67::1c9d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393479120sm20091647b3.45.2026.11.10.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:30:41 -0800 (PST)
From: Victor Nogueira <victor@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	sashiko-bot <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 2/3] net/sched: fq, fq_codel, fq_pie: skip empty rounds in the deficit-refill dequeue loop
Date: Tue, 10 Nov 2026 11:30:24 -0300
Message-ID: <QDISC-TIAE.v3.r0.20261109173518-2@mojatatu.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <QDISC-TIAE.v3.r0.20261109173518@mojatatu.com>
References: <QDISC-TIAE.v3.r0.20261109173518@mojatatu.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issue: fq, fq_codel and fq_pie refill the head flow one quantum per
iteration until it has credit. With a size table that inflates the packet
length to 1 MiB and a quantum of 256 that is ~4096 iterations per packet,
so a dequeue over N flows can spin N * 4096 times under the qdisc lock
with BH disabled.

The Fix: apply the same skip-ahead as the previous patch for DRR. After a
full round in which no flow could dequeue, add the quanta for the
remaining rounds to every flow at once. An empty flow that the one-quantum
loop would have removed during those rounds is credited the same amount
and removed in the same pass, so credits and list order match the old
loop.

The skip is repeated after every bulk refill, so a flow that changes
state (throttled in fq, dropped by the AQM in fq_codel and fq_pie, or a
new packet at the head) does not leave the loop on the one-quantum path
for the rest of the dequeue. A setup built to change state on every
refill is still as slow as before; normal ones are O(N).

Conditions to recreate:
- root: stab mtu 2048 tsize 0 overhead 1048576 tbf rate 100kbit
  burst 2mb limit 1000000 (stab must be on the root)
- child: fq_codel or fq_pie, flows 65536 quantum 256, target and
  interval 100s so the AQM never drops
- one packet in each of 8192 flows (SO_PRIORITY = 0x10:<i> or a distinct
  destination per packet so the flow hash separates them), then raise the
  tbf rate to release them
- the last dequeue takes 65-70 ms (fq_codel) / 74-75 ms (fq_pie)
  before this change and under 0.4 ms after
- fq hits the same loop when a band holds only empty flows while
  packets wait in another band or in throttled flows

Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/netdev/179182028153.434549.4854377793269282267@kernel.org/
Link: https://lore.kernel.org/netdev/3ab59725-e34c-4243-bc72-d93f837bcad1@redhat.com/
Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
v2 -> v3:
- fq, fq_codel, fq_pie: the skip is repeated after a bulk refill instead
  of running once per dequeue.
v1 -> v2:
- fq, fq_codel, fq_pie: skip empty rounds as in 1/3, empty flows
  credited as the old loop would.
 net/sched/sch_fq.c       | 87 +++++++++++++++++++++++++++++++++++++++-
 net/sched/sch_fq_codel.c | 80 +++++++++++++++++++++++++++++++++++-
 net/sched/sch_fq_pie.c   | 74 +++++++++++++++++++++++++++++++++-
 3 files changed, 236 insertions(+), 5 deletions(-)

diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
index a282812c192e..4229065e4809 100644
--- a/net/sched/sch_fq.c
+++ b/net/sched/sch_fq.c
@@ -737,8 +737,10 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
 	struct fq_sched_data *q = qdisc_priv(sch);
 	u64 offload_horizon = fq_offload_horizon(sch, q);
 	struct fq_perband_flows *pband;
+	struct fq_flow *first = NULL;
 	struct fq_flow_head *head;
 	u64 time_next_packet = 0;
+	bool scanned = false;
 	struct sk_buff *skb;
 	struct fq_flow *f;
 	unsigned long rate;
@@ -769,8 +771,12 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
 			pband = &q->band_flows[q->band_nr];
 			pband->credit = min(pband->credit + pband->quantum,
 					    pband->quantum);
-			if (pband->credit > 0)
+			if (pband->credit > 0) {
+				/* New band: start a new round. */
+				first = NULL;
+				scanned = false;
 				goto begin;
+			}
 			retry = 0;
 		}
 		if (q->time_next_delayed_flow != ~0ULL)
@@ -782,9 +788,82 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
 	f = head->first;
 	retry = 0;
 	if (f->credit <= 0) {
+		/* No flow could dequeue in the last full round. Add the
+		 * quanta for the rounds still needed in one pass.
+		 */
+		if (!scanned && f == first) {
+			unsigned int rounds = UINT_MAX;
+			struct fq_flow *iter, *prev;
+			bool skip = true;
+
+			scanned = true;
+			/* new_flows is empty after a full round. */
+			for (iter = pband->old_flows.first; iter;
+			     iter = iter->next) {
+				/* Empty flows don't limit the rounds. */
+				if (!fq_peek(iter))
+					continue;
+				if (iter->credit > 0) {
+					skip = false;
+					break;
+				}
+				rounds = min(rounds,
+					     DIV_ROUND_UP(1 - iter->credit,
+							  q->quantum));
+			}
+			if (skip) {
+				prev = NULL;
+				for (iter = pband->old_flows.first; iter;
+				     iter = iter->next) {
+					unsigned int k = 0;
+
+					/* An empty flow leaves the list after
+					 * k more refills. If that falls within
+					 * the skipped rounds, remove it now.
+					 * fq keeps the credit if the flow comes
+					 * back, so give it exactly k quanta.
+					 */
+					if (fq_peek(iter)) {
+						iter->credit += rounds * q->quantum;
+						prev = iter;
+						continue;
+					}
+					if (iter->credit <= 0)
+						k = DIV_ROUND_UP(1 - iter->credit,
+								 q->quantum);
+					if (k >= rounds) {
+						iter->credit += rounds * q->quantum;
+						prev = iter;
+						continue;
+					}
+					iter->credit += k * q->quantum;
+					if (prev)
+						prev->next = iter->next;
+					else
+						pband->old_flows.first = iter->next;
+					if (pband->old_flows.last == iter)
+						pband->old_flows.last = prev;
+					fq_flow_set_detached(iter);
+				}
+				/* A flow may show a non-empty queue, a new
+				 * packet or a throttled one now; scan again if
+				 * the loop still cannot dequeue.
+				 */
+				first = NULL;
+				scanned = false;
+				goto begin;
+			}
+		}
+
+		/* Remember which flow started this round. */
+		if (!first)
+			first = f;
 		f->credit += q->quantum;
 		head->first = f->next;
 		fq_flow_add_tail(q, f, OLD_FLOW);
+		/* f may have moved to another band's list. */
+		if (f == first && f->band != q->band_nr)
+			first = NULL;
 		goto begin;
 	}
 
@@ -796,6 +875,9 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
 		if (now + offload_horizon < time_next_packet) {
 			head->first = f->next;
 			f->time_next_packet = time_next_packet;
+			/* The round's first flow left; the next one takes over. */
+			if (f == first)
+				first = scanned ? NULL : head->first;
 			fq_flow_set_throttled(q, f);
 			goto begin;
 		}
@@ -814,6 +896,9 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
 		if (head == &pband->new_flows) {
 			fq_flow_add_tail(q, f, OLD_FLOW);
 		} else {
+			/* The round's first flow left; the next one takes over. */
+			if (f == first)
+				first = scanned ? NULL : head->first;
 			fq_flow_set_detached(f);
 		}
 		goto begin;
diff --git a/net/sched/sch_fq_codel.c b/net/sched/sch_fq_codel.c
index e6c87a32950f..25d7bc9b6414 100644
--- a/net/sched/sch_fq_codel.c
+++ b/net/sched/sch_fq_codel.c
@@ -284,6 +284,8 @@ static void drop_func(struct sk_buff *skb, void *ctx)
 static struct sk_buff *__fq_codel_dequeue(struct Qdisc *sch)
 {
 	struct fq_codel_sched_data *q = qdisc_priv(sch);
+	struct fq_codel_flow *first = NULL;
+	bool scanned = false;
 	struct sk_buff *skb;
 	struct fq_codel_flow *flow;
 	struct list_head *head;
@@ -298,6 +300,73 @@ static struct sk_buff *__fq_codel_dequeue(struct Qdisc *sch)
 	flow = list_first_entry(head, struct fq_codel_flow, flowchain);
 
 	if (flow->deficit <= 0) {
+		/* No flow could dequeue in the last full round. Add the
+		 * quanta for the rounds still needed in one pass.
+		 */
+		if (!scanned && flow == first) {
+			unsigned int rounds = UINT_MAX;
+			struct fq_codel_flow *iter;
+			bool skip = true;
+
+			scanned = true;
+			/* new_flows is empty after a full round. */
+			list_for_each_entry(iter, &q->old_flows, flowchain) {
+				unsigned int r;
+
+				/* Empty flows don't limit the rounds. */
+				if (!iter->head)
+					continue;
+				if (iter->deficit > 0) {
+					skip = false;
+					break;
+				}
+				r = DIV_ROUND_UP(1 - iter->deficit, q->quantum);
+				rounds = min(rounds, r);
+			}
+			if (skip) {
+				struct fq_codel_flow *tmp;
+
+				list_for_each_entry_safe(iter, tmp, &q->old_flows,
+							 flowchain) {
+					unsigned int k = 0;
+
+					/* An empty flow leaves the list after
+					 * k more refills. If that falls within
+					 * the skipped rounds, remove it now.
+					 */
+					if (iter->head) {
+						WRITE_ONCE(iter->deficit,
+							   iter->deficit +
+							   rounds * q->quantum);
+						continue;
+					}
+					if (iter->deficit <= 0)
+						k = DIV_ROUND_UP(1 - iter->deficit,
+								 q->quantum);
+					if (k < rounds) {
+						WRITE_ONCE(iter->deficit,
+							   iter->deficit +
+							   k * q->quantum);
+						list_del_init(&iter->flowchain);
+						continue;
+					}
+					WRITE_ONCE(iter->deficit,
+						   iter->deficit +
+						   rounds * q->quantum);
+				}
+				/* A flow may show a non-empty queue or a
+				 * dropped packet now; scan again if the loop
+				 * still cannot dequeue.
+				 */
+				first = NULL;
+				scanned = false;
+				goto begin;
+			}
+		}
+
+		/* Remember which flow started this round. */
+		if (!first)
+			first = flow;
 		WRITE_ONCE(flow->deficit, flow->deficit + q->quantum);
 		list_move_tail(&flow->flowchain, &q->old_flows);
 		goto begin;
@@ -309,10 +378,17 @@ static struct sk_buff *__fq_codel_dequeue(struct Qdisc *sch)
 
 	if (!skb) {
 		/* force a pass through old_flows to prevent starvation */
-		if ((head == &q->new_flows) && !list_empty(&q->old_flows))
+		if (head == &q->new_flows && !list_empty(&q->old_flows)) {
 			list_move_tail(&flow->flowchain, &q->old_flows);
-		else
+		} else {
 			list_del_init(&flow->flowchain);
+			/* The round's first flow left; the next one takes over. */
+			if (flow == first)
+				first = scanned ? NULL :
+					list_first_entry_or_null(&q->old_flows,
+								 struct fq_codel_flow,
+								 flowchain);
+		}
 		goto begin;
 	}
 	qdisc_bstats_update(sch, skb);
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f8..15ae97710120 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -238,6 +238,8 @@ static inline struct sk_buff *dequeue_head(struct fq_pie_flow *flow)
 static struct sk_buff *fq_pie_qdisc_dequeue(struct Qdisc *sch)
 {
 	struct fq_pie_sched_data *q = qdisc_priv(sch);
+	struct fq_pie_flow *first = NULL;
+	bool scanned = false;
 	struct sk_buff *skb = NULL;
 	struct fq_pie_flow *flow;
 	struct list_head *head;
@@ -254,6 +256,67 @@ static struct sk_buff *fq_pie_qdisc_dequeue(struct Qdisc *sch)
 	flow = list_first_entry(head, struct fq_pie_flow, flowchain);
 	/* Flow has exhausted all its credits */
 	if (flow->deficit <= 0) {
+		/* No flow could dequeue in the last full round. Add the
+		 * quanta for the rounds still needed in one pass.
+		 */
+		if (!scanned && flow == first) {
+			unsigned int rounds = UINT_MAX;
+			struct fq_pie_flow *iter;
+			bool skip = true;
+
+			scanned = true;
+			/* new_flows is empty after a full round. */
+			list_for_each_entry(iter, &q->old_flows, flowchain) {
+				unsigned int r;
+
+				/* Empty flows don't limit the rounds. */
+				if (!iter->head)
+					continue;
+				if (iter->deficit > 0) {
+					skip = false;
+					break;
+				}
+				r = DIV_ROUND_UP(1 - iter->deficit, q->quantum);
+				rounds = min(rounds, r);
+			}
+			if (skip) {
+				struct fq_pie_flow *tmp;
+
+				list_for_each_entry_safe(iter, tmp, &q->old_flows,
+							 flowchain) {
+					unsigned int k = 0;
+
+					/* An empty flow leaves the list after
+					 * k more refills. If that falls within
+					 * the skipped rounds, remove it now.
+					 */
+					if (iter->head) {
+						iter->deficit += rounds * q->quantum;
+						continue;
+					}
+					if (iter->deficit <= 0)
+						k = DIV_ROUND_UP(1 - iter->deficit,
+								 q->quantum);
+					if (k < rounds) {
+						iter->deficit += k * q->quantum;
+						list_del_init(&iter->flowchain);
+						continue;
+					}
+					iter->deficit += rounds * q->quantum;
+				}
+				/* A flow may show a non-empty queue or a
+				 * dropped packet now; scan again if the loop
+				 * still cannot dequeue.
+				 */
+				first = NULL;
+				scanned = false;
+				goto begin;
+			}
+		}
+
+		/* Remember which flow started this round. */
+		if (!first)
+			first = flow;
 		flow->deficit += q->quantum;
 		list_move_tail(&flow->flowchain, &q->old_flows);
 		goto begin;
@@ -269,10 +332,17 @@ static struct sk_buff *fq_pie_qdisc_dequeue(struct Qdisc *sch)
 
 	if (!skb) {
 		/* force a pass through old_flows to prevent starvation */
-		if (head == &q->new_flows && !list_empty(&q->old_flows))
+		if (head == &q->new_flows && !list_empty(&q->old_flows)) {
 			list_move_tail(&flow->flowchain, &q->old_flows);
-		else
+		} else {
 			list_del_init(&flow->flowchain);
+			/* The round's first flow left; the next one takes over. */
+			if (flow == first)
+				first = scanned ? NULL :
+					list_first_entry_or_null(&q->old_flows,
+								 struct fq_pie_flow,
+								 flowchain);
+		}
 		goto begin;
 	}
 
-- 
2.43.0

