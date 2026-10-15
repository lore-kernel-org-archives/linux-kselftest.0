Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C36492E26
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099140; cv=none; b=BHd201uDAw33BrgextLkYhFarGcdNCV2Vx8uXtnSiFIKYLDqgESFSrjh/7Dsq2ULW4s/WVW4GDKgdto00wObADdpqMmT9HNjr5p4NkYcc1elLCcEzy3fD1Bau/FYPB5sJKYR+B0HdOYudCuaSCJIRp1me3RqfAgdutiPDRl0Hr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099140; c=relaxed/simple;
	bh=v6OFGwjMVRT3JAYlk2W/ew659qk+mF0oLje4ITbj2sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJDbcdkDmz3LXEdPuKgOk5d9HyJ8D8K4sooqmKGoG2tYC/WEpK7l9WOynhwNw2+Pqn4smOq6c0X348mCdjt54hOkbPf7cLyUZhVygXpIT56dSdBSoDhoP6zwuJGGapAUaMOlptq2RJylXw1C+z4vVL+9jIdZ8Ju+9mEWHO8RBZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=gNtJz5V6; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="gNtJz5V6"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-141395927feso11093770c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792099135; x=1792703935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSCUWR2pRGBK8cyXD6mH/N8CotOfV5OCmVFqY/ghAlg=;
        b=gNtJz5V6NbeJSIs0/pxmKHhsMO+aTSogxWtK8Z3NkqQE2iAvkdAXc8AjgZnICKh+45
         Qopo3QX6yzTuFXxpKttAPzs66DW6B4aH7mixDNZYORsBiznB6uh1mZfFUYzt82076lLd
         Aft4ntz5jPJKH4plJl/Ybf8fkdOMB6ifPgyls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099135; x=1792703935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSCUWR2pRGBK8cyXD6mH/N8CotOfV5OCmVFqY/ghAlg=;
        b=z0uRrau4PsrRrPPpnDa0FV36eeFGQY6L6OZyrBQx3JU2kV3U3aJgPO5Kglq1H4qHbQ
         SNNZzVherNwDNwav6hzwoti7sgqEvO52Y5QXzIUZf+/i26A7fRFVcBaezs+PwkjHC+WZ
         bZrv2PnYvws3ChAB0LAuntSDzN7D/3A21FS7QQrjoRR0zph7tLT7DUZnayZQQlqvLHvo
         lZcucWgbGr5ww6xEm8aIN+XJaNNtujjU0pxkdPGN6aJJwE8uV0na9PRSPr5h6xcXd34g
         3bevpMQtkPfZAJVtPBTS3B7jWboFcKbd0P0FZXEoRzwHjDLY+Nkc5d3Dkg5drYDhw4qC
         OG+w==
X-Forwarded-Encrypted: i=1; AKwUvBwAeUT64Gz2zWPomH1h6odLMK3sMxWjRujZ9I2X7TIN/HEkKtM0ON0gEZZZgNTei5XiGtVwmpmbmHYXYo8+6S8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh69MWUp0QQDIMsDGzOPggSxjUMuiaOAg6++Geor66ppbeYkyn
	DiId8ArrKtiBRxCQJBYr7KGdGoxaovr5STDmJcev+OJPa5PoewvmHy7NGcuZ3Dgv9g==
X-Gm-Gg: AYBFou3LiCEIqxCp5OQFkDad7e5dlfPM9bD/RTl8vJUdPQ04fa7cd3X0vvlkDojZo8n
	yCsiqc2F7nkF4037ZbbzjvXhD6DFqYiP2SSAZpCJvMV/lsukMAS216XWgoqPg6TqtENrOB7VRfP
	fIEK35WjxlieZOcoXDbLMvwesUJ9Zz++MtchgSFgCCFCwmFVjqgoa/4zj6D/rdaoas2kHkvsel1
	xKvDoPQcDc9Th8iAJ7Uvd4T9Jub3aI6pb0ZwlgeYy9+DPwZMPOb2lOb1/jaUPg/8eXKhNjnfmQm
	u/x9Zw7pyh2FBof9+gb3H/3y/x7FQkfguZmpn/mz4rTDYWe+62xYZ8jQHDXChWl8uZi+IdnPnAy
	tRR7V6blLenwzEqX4FHnRPcvRO2QIT0uVYq1xobSmaNqYc4sXYRGwG2JwAeMgs1Ce3cajHeZ/rt
	1sMzZH2D2sZTMxeXfduX+959Nsq3rbfaO1uQXUwiWQy7I8W0xzeZQUvZKbV8m4fpAy5Ttlz1mH9
	4rE
X-Received: by 2002:a05:7022:3b87:b0:14c:e31e:5dd4 with SMTP id a92af1059eb24-16a60ce6e71mr31865257c88.36.1792099135194;
        Thu, 15 Oct 2026 14:18:55 -0700 (PDT)
Received: from exu-caveira.tail33bf8.ts.net ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm216711c88.18.2026.10.15.14.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:18:54 -0700 (PDT)
From: Victor Nogueira <victor@mojatatu.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	netdev@vger.kernel.org
Cc: horms@kernel.org,
	sashiko-bot <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 2/3] net/sched: fq, fq_codel, fq_pie: skip empty rounds in the deficit-refill dequeue loop
Date: Thu, 15 Oct 2026 18:18:30 -0300
Message-ID: <QDISC-TIAE.v2.r0.20261015163454-2@mojatatu.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <QDISC-TIAE.v2.r0.20261015163454@mojatatu.com>
References: <QDISC-TIAE.v2.r0.20261015163454@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
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

The skip runs once per dequeue. If the flow it makes eligible is then
throttled (fq) or all its packets are dropped by the AQM (fq_codel,
fq_pie), the loop goes back to one quantum at a time. A setup built to
make that happen every time is as slow as before; normal ones are O(N).

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
Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
v1 -> v2:
- fq, fq_codel, fq_pie: skip empty rounds as in 1/3, empty flows
  credited as the old loop would.
 net/sched/sch_fq.c       | 81 +++++++++++++++++++++++++++++++++++++++-
 net/sched/sch_fq_codel.c | 74 +++++++++++++++++++++++++++++++++++-
 net/sched/sch_fq_pie.c   | 68 ++++++++++++++++++++++++++++++++-
 3 files changed, 218 insertions(+), 5 deletions(-)

diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
index a282812c192e..5c724ec04d90 100644
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
@@ -782,9 +788,76 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
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
 
@@ -796,6 +869,9 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
 		if (now + offload_horizon < time_next_packet) {
 			head->first = f->next;
 			f->time_next_packet = time_next_packet;
+			/* The round's first flow left; the next one takes over. */
+			if (f == first)
+				first = scanned ? NULL : head->first;
 			fq_flow_set_throttled(q, f);
 			goto begin;
 		}
@@ -814,6 +890,9 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
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
index e6c87a32950f..bc74690e2323 100644
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
@@ -298,6 +300,67 @@ static struct sk_buff *__fq_codel_dequeue(struct Qdisc *sch)
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
@@ -309,10 +372,17 @@ static struct sk_buff *__fq_codel_dequeue(struct Qdisc *sch)
 
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
index 5982847df8f8..55c88f4bbd7c 100644
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
@@ -254,6 +256,61 @@ static struct sk_buff *fq_pie_qdisc_dequeue(struct Qdisc *sch)
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
@@ -269,10 +326,17 @@ static struct sk_buff *fq_pie_qdisc_dequeue(struct Qdisc *sch)
 
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

