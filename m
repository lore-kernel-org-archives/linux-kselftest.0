Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343CB470EA8
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099136; cv=none; b=QqQfG2aJTNDd1JHkxVDr+xUnJg9ivQbj2yxknB8uw3Zilm0BWNhl36NxIfcY//joH/C/JJsaaAkAH/30Mh5YBk7y91/FpWV33HkwVkXJ/vAIXglwwzKUskqq11FbJJ85Mlp2nGrPqr26vSg8z7Z80Dap/lRwyrRmx/6SUhfXmB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099136; c=relaxed/simple;
	bh=+2/vvKbWoAbvspskcU3rN/lCGQ9o1XB7p6MUcTKEXB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COP/a2JTGb49fey7Oog350iKK3r/7TVWKxLWftk043eoSRlVMHgFYqRaHyzMIA9VZzx7Zs9d3DG964hyMFqN4XFWRbeolsMfesbP3B8zi2iNAhRkX/4jR1i2K6AnHhWc9KeUW1SFpd3ra2FJcdTxDT/3xVZq6XW28suwJ9vyomY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=rfNQSCcb; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="rfNQSCcb"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so1375105c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792099131; x=1792703931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOV9lrbQ6U/ePh3qjqflN4zmHKmWIEXGerAj9rmp8aE=;
        b=rfNQSCcb5z27dmPF15x0VQMKjmG68hDj2PYynDPbdSgEMhfpI8mfrPkoFuX54WcJKZ
         YELtMqlI1YxKaXpNrZX3zPepZ04MzPkMdujnD5qK78bLGfNGvvP61ok37lQXavAeWcRU
         g89fWnilEPtjM20QXWTVjUhvZE1s4dCTH/gwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099131; x=1792703931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOV9lrbQ6U/ePh3qjqflN4zmHKmWIEXGerAj9rmp8aE=;
        b=ZDGLckdrJ9IbcDJA4OUFTYoL1LWDYlpZdTM2NUxw0K9hP2qiRPEKYSx/YKPMXZtL+s
         GFeCqYxXTd3Tdb6hln7bZKv4t39bJhfxubWK3SFJXSuMFIwbp8sHcL4UfRkvjbxDTVS5
         xCCvFkbxtkFYpViHDxRb50WZ2sYuoYUlouwphvUVQdz2/z6L0sCZBDzI9Ltp4bQTDbZi
         pS1OiM1FEWM8SU17MVSeLh8ezn0m80K2GG8xGzHt2pT262Q6Z4UHIZAiWwxhhq3qGeMb
         p8zR6QG7ZHq9GtaGHjtaLFidzNIN70CLqZ7yO+b/9sGZSvmr/zfflZrJOF92ZrojIo44
         L4tg==
X-Forwarded-Encrypted: i=1; AKwUvBzVWHbgoj2SwtzX9xYWfEvhXza9MzVk+Y87TKbYxGi9Mp0B1M9fSWmm+vnDawZlLWeLImtLN4o8tve/Pk63IKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0SHdRWmfae0X017/PN2HzJ4fvQQBXwMQDeahiYJGP4Rxs5rdD
	SMfdxZs1Ie+K7YxjwjxeG6QUf/tqRbGI9QLd+BdwheLtFCx/Trcfsm/l0fde0m/jLCSR0ogTtj1
	mZsE=
X-Gm-Gg: AYBFou2aOz4jLzo+A4gU6UScWD3ieaGhyGa/FiChC/ijKTVZ1zx017u1Xv7QUIDg+0C
	tyQFze/FCYSCLe7XBRgPthJtX4dJYVZN0kIrBFutYvttU3XrXHN3w7QRoq8KIFG4wLgeOkxUtTW
	aKat8aF+toOR2WJXSVtxn/+ueaw1qUyOq6npgEsJrZNtYJ65oyO6fFnmtJ2uqDpEn69rYY8T75k
	//FndUhWpE2e5+fdQ5i/o8S6q2q+sHkOcbEsIzJUfg9COtFc28tQkX/i0vWstOZJjEepKap8c3h
	GgY9xKQt99taUZ+jm3BrJtsSig+E3odn6ay5EGVjlo/KxvoU/n33WM72wfcPQ9Vrq4KI+jpN5W2
	oFbxem04o1kE4NDDhUCIjV0y2+OhsOKicHjcmL/fV+48AdEVpa+wkbMFL7CJsyCRt7NQ9ducJTT
	eV6hSCcxLBJ43eyecvemLjyKr/BtMrTDE6V7T1+ntPXeGjdsfNCEPcimOrk0EbFErmB/7uWZRuh
	Dn2dA==
X-Received: by 2002:a05:701b:21c5:b0:143:3617:c5ae with SMTP id a92af1059eb24-16a554812f4mr27717450c88.2.1792099130997;
        Thu, 15 Oct 2026 14:18:50 -0700 (PDT)
Received: from exu-caveira.tail33bf8.ts.net ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm216711c88.18.2026.10.15.14.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:18:50 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/3] net/sched: drr, ets, sfq: skip empty rounds in the deficit-refill dequeue loop
Date: Thu, 15 Oct 2026 18:18:29 -0300
Message-ID: <QDISC-TIAE.v2.r0.20261015163454-1@mojatatu.com>
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

The issue: DRR and ETS refill the head class one quantum per iteration
until its packet fits the deficit. A size table that inflates the packet
length to QDISC_PKT_LEN_MAX (1 MiB) with a quantum of 256 makes that
~4096 iterations per packet, so one dequeue over N backlogged classes
can spin N * 4096 times under the qdisc lock with BH disabled. Draining
16384 DRR classes this way takes about a second.

The Fix: after a full round in which no class could dequeue, compute how
many more rounds it takes until one can and add that many quanta to every
class at once. Deficits and service order are the same as with the
one-quantum loop, and a dequeue costs O(N).

sfq has the same loop and is fixed the same way. ETS has at most 16
bands, so it was never that slow; it is changed to match DRR.

This follows commit 8f735d64382d ("net/sched: bound qdisc_pkt_len to
prevent qdisc soft lockup"). With 16384 DRR classes the drain goes from
~1.0s to ~0.12s.

Conditions to recreate:
- tc qdisc add dev veth0 root handle 1: stab mtu 2048 tsize 0 \
    overhead 1048576 drr
- 16384 classes with quantum 256, one packet in each (sent with
  SO_PRIORITY set to the classid), plus one catch-all u32 filter so ARP
  is not dropped
- CAP_NET_ADMIN (unshare -Urn is enough)

Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260819143213.57401-1-jhs@mojatatu.com
Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
Signed-off-by: Victor Nogueira <victor@mojatatu.com>
---
v1 -> v2:
- drr, ets, sfq: the dequeue loop skips the empty rounds in one bulk
  refill.
 net/sched/sch_drr.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 net/sched/sch_ets.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 net/sched/sch_sfq.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/net/sched/sch_drr.c b/net/sched/sch_drr.c
index 8621d057edd9..d6cb389a55f0 100644
--- a/net/sched/sch_drr.c
+++ b/net/sched/sch_drr.c
@@ -372,7 +372,8 @@ static int drr_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 static struct sk_buff *drr_dequeue(struct Qdisc *sch)
 {
 	struct drr_sched *q = qdisc_priv(sch);
-	struct drr_class *cl;
+	struct drr_class *cl, *first = NULL;
+	bool scanned = false;
 	struct sk_buff *skb;
 	unsigned int len;
 
@@ -402,6 +403,45 @@ static struct sk_buff *drr_dequeue(struct Qdisc *sch)
 			return skb;
 		}
 
+		/* No class could dequeue in the last full round. Add the
+		 * quanta for the rounds still needed in one pass.
+		 */
+		if (!scanned && cl == first) {
+			unsigned int rounds = UINT_MAX;
+			struct drr_class *iter;
+			bool skip = true;
+
+			scanned = true;
+			list_for_each_entry(iter, &q->active, alist) {
+				unsigned int pkt_len;
+				struct sk_buff *peek;
+
+				/* An empty child unlinks iter; stop here. */
+				peek = iter->qdisc->ops->peek(iter->qdisc);
+				if (!peek) {
+					skip = false;
+					break;
+				}
+				pkt_len = qdisc_pkt_len(peek);
+				if (pkt_len <= iter->deficit) {
+					skip = false;
+					break;
+				}
+				rounds = min(rounds,
+					     DIV_ROUND_UP(pkt_len - iter->deficit,
+							  READ_ONCE(iter->quantum)));
+			}
+			if (skip && rounds != UINT_MAX) {
+				list_for_each_entry(iter, &q->active, alist)
+					WRITE_ONCE(iter->deficit,
+						   iter->deficit + rounds *
+						   READ_ONCE(iter->quantum));
+				continue;
+			}
+		}
+
+		if (!first)
+			first = cl;
 		WRITE_ONCE(cl->deficit, cl->deficit + READ_ONCE(cl->quantum));
 		list_move_tail(&cl->alist, &q->active);
 	}
diff --git a/net/sched/sch_ets.c b/net/sched/sch_ets.c
index 6cc902a03838..331c6d886fde 100644
--- a/net/sched/sch_ets.c
+++ b/net/sched/sch_ets.c
@@ -459,7 +459,8 @@ ets_qdisc_dequeue_skb(struct Qdisc *sch, struct sk_buff *skb)
 static struct sk_buff *ets_qdisc_dequeue(struct Qdisc *sch)
 {
 	struct ets_sched *q = qdisc_priv(sch);
-	struct ets_class *cl;
+	struct ets_class *cl, *first = NULL;
+	bool scanned = false;
 	struct sk_buff *skb;
 	unsigned int band;
 	unsigned int len;
@@ -493,6 +494,44 @@ static struct sk_buff *ets_qdisc_dequeue(struct Qdisc *sch)
 			return ets_qdisc_dequeue_skb(sch, skb);
 		}
 
+		/* No class could dequeue in the last full round. Add the
+		 * quanta for the rounds still needed in one pass.
+		 */
+		if (!scanned && cl == first) {
+			unsigned int rounds = UINT_MAX;
+			struct ets_class *iter;
+			bool skip = true;
+
+			scanned = true;
+			list_for_each_entry(iter, &q->active, alist) {
+				unsigned int pkt_len;
+				struct sk_buff *peek;
+
+				/* An empty child unlinks iter; stop here. */
+				peek = iter->qdisc->ops->peek(iter->qdisc);
+				if (!peek) {
+					skip = false;
+					break;
+				}
+				pkt_len = qdisc_pkt_len(peek);
+				if (pkt_len <= iter->deficit) {
+					skip = false;
+					break;
+				}
+				rounds = min(rounds,
+					     DIV_ROUND_UP(pkt_len - iter->deficit,
+							  READ_ONCE(iter->quantum)));
+			}
+			if (skip && rounds != UINT_MAX) {
+				list_for_each_entry(iter, &q->active, alist)
+					iter->deficit += rounds *
+							 READ_ONCE(iter->quantum);
+				continue;
+			}
+		}
+
+		if (!first)
+			first = cl;
 		cl->deficit += READ_ONCE(cl->quantum);
 		list_move_tail(&cl->alist, &q->active);
 	}
diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index 8bbcfc9e85d9..83a698af2d58 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -479,9 +479,11 @@ static struct sk_buff *
 sfq_dequeue(struct Qdisc *sch)
 {
 	struct sfq_sched_data *q = qdisc_priv(sch);
+	sfq_index first = SFQ_EMPTY_SLOT;
 	struct sk_buff *skb;
-	sfq_index a, next_a;
 	struct sfq_slot *slot;
+	bool scanned = false;
+	sfq_index a, next_a;
 
 	/* No active slots */
 	if (q->tail == NULL)
@@ -491,6 +493,43 @@ sfq_dequeue(struct Qdisc *sch)
 	a = q->tail->next;
 	slot = &q->slots[a];
 	if (slot->allot <= 0) {
+		/* No slot could dequeue in the last full round. Add the
+		 * quanta for the rounds still needed in one pass.
+		 */
+		if (!scanned && a == first) {
+			unsigned int rounds = UINT_MAX;
+			bool skip = true;
+			sfq_index i = a;
+
+			scanned = true;
+			do {
+				struct sfq_slot *s = &q->slots[i];
+				unsigned int r;
+
+				if (s->allot > 0) {
+					skip = false;
+					break;
+				}
+				r = DIV_ROUND_UP(1 - s->allot, q->quantum);
+				rounds = min(rounds, r);
+				i = s->next;
+			} while (i != a);
+			if (skip && rounds != UINT_MAX) {
+				i = a;
+				do {
+					struct sfq_slot *s = &q->slots[i];
+
+					WRITE_ONCE(s->allot,
+						   s->allot +
+						   rounds * q->quantum);
+					i = s->next;
+				} while (i != a);
+				goto next_slot;
+			}
+		}
+
+		if (first == SFQ_EMPTY_SLOT)
+			first = a;
 		q->tail = slot;
 		WRITE_ONCE(slot->allot, slot->allot + q->quantum);
 		goto next_slot;
-- 
2.43.0

