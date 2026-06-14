Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727783093D3
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781441452; cv=none; b=ug5brD5lUHit85IuetFT1pMdTypOahwXBl9O+r0V1GOjI3CnNGedXiCRCnhOOhrAdNhpbzEeizS4FOC5FF5SbuTezHsVGfRFIoAhO0VxNr5Q/foSiyb92vWRRPhWOGildB9jCNSFvI6z+i8oll2HbXT41UhNRyHZhCLBRRFlpzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781441452; c=relaxed/simple;
	bh=8jTjcDONL9Ws6TojySmIKq8/hZWXiq56bptw0EUxcys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wdng9VHS3LIOoZewYJadi1bagbXw759uLw/UpuqasHj4E8k2Gsv7x7CI52aXk1ddXFCX3yUOqRyYOU6W+c5vjZ9UlE+n4ifgSGtL+3E3pnyPo/HeGSKV+wWzf4NMFjq9zgNGblMOPt3S3jyyYFnQcrltrysNy/XaCFsRvbqicQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUB1lt2h; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUB1lt2h"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so1428498a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 05:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781441451; x=1782046251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fZ/GAUqPZxA1/VxNOCsN1bGv1N3xpQH3MfYqi3/FtI=;
        b=AUB1lt2hUuDXSFVB1GyCJ0o8Hwj3SrcjWs+pe6mXSYAw2xNo9SGbJeI1ZV8hk6qWmL
         ak50vhPim7nQdG9KNQ4V7LdymIxZVTUfSdzzsGl7eklRP4O7C0W3aJuk2jzTDRakMJqk
         vs5qSsNJ+t+nv9dHNCy5/3NLZhnE10LVyltU2+QxdAFlrZcawgcMzyrdu97fmOlolxKb
         DzRdji04KXVx8yHIQuM41L0HltGkTd0d679weNUtxEs4Aj6stOje5AKdp8cYb3F1gjNI
         sXO0zgl6eBZSVPg6IHE6ve3SD+gmAzuUQktQr4oj2KwAR6DYrEAXaGtNqtt5cKXa11Np
         W+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441451; x=1782046251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6fZ/GAUqPZxA1/VxNOCsN1bGv1N3xpQH3MfYqi3/FtI=;
        b=ouaiZVzvJwd+ksFTM1CPRNFwwrUfi4yepOUpDtK6Yujnfjzb9v3o/F6sDwqFhYW8sf
         g8ATACTsz7qNfcm62o18/90YfCaX0yH+HAdCShpDeJt6TFDI7u1NMEuaEXz8nVyV+5I/
         /i1rRsAzzBEXh/Pj2HRI4hw8x5PlrHMBnQeOCIWbxOo/Q4z6A+DliRYN5v2MjnExZVXX
         /O2zlv+CqFgZOEAb8fXWTs1/fIRjVaSQ9DelRT4diUozVobWtpk5J+7mHojIJYV6FGMN
         BobL6/rmICI3mftAtdAfAA7HTO40MQf96Ia5Sg+iZbtuwp7U7HNFFXkcEGnCKdDbgorH
         OQDw==
X-Forwarded-Encrypted: i=1; AFNElJ+rPuIxqEEjt/8kiHqBBknL0WZa8TY6qtRPZ629Mn39O/LR/xHVOJ+MINRJa4CpvYz1KvBiSUxgqbHcHuzsE8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+bNGtpiSpCVAqeEnioluZ+aIiCrnJdIuwiYOsTz0fYb0UzYiD
	HJQLAejnAMbPoppNOuM095I1+9ueKqBstGmhmVVpuquiDhfFhovNinBr
X-Gm-Gg: Acq92OGA71eaV7gCzqsgweQ3VTQmKte4UYDRCbVzYchfZmkt+WpNKgeEwPDPk1gCsp4
	OI6QEZB3BqFrjqaP6EZUuGTDkURDE30F3WHHo0VvEBZN4Lq0SSuAULr3UEH6bsqmedJRLGehPXE
	kilEHxdNA+KJvnVtxMMb+lECrpsOmiFc19Q4+kXtd0qg7+ot+TtMvAJ0fzMlLmTa1O74AARzmsk
	D98sH4bwWLS7qgRPThUHGtN9P+lbjykdr540dDINaMKP/9Y1MpPRGOvZ1llIcYemlLsvCYyPbAF
	6iGgxMbwurgVmA4SzzQ/9DlazVhZj0s0rmwIbHQmnPDUY4t/LyeGsP4Qj6PP7fnlmPruQzKsAjf
	adEy7Ew41UnzP3zMQvfc9CnViEFSVjCGXrGj4RFK6ds+q3fTG4rGnMiQODoz1mDn9K0y93tgWS1
	0HvIF5ek0GiLQFizQxXKiyUW66P75Z406NB7E6vco=
X-Received: by 2002:a17:902:d48f:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c6641e28f9mr79637055ad.21.1781441450766;
        Sun, 14 Jun 2026 05:50:50 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:90b2:9957:66e9:8cb4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm66426825ad.45.2026.06.14.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:50:50 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v2 1/2]     net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Sun, 14 Jun 2026 18:19:59 +0530
Message-Id: <20260614125000.6058-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614125000.6058-1-hemendranaik@gmail.com>
References: <20260614125000.6058-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  FQ-PIE schedules independent PIE controllers per flow but exposes no
  per-flow AQM state. Without class-level statistics there is no way to
  observe the per-flow drop probability, queue delay, deficit or
  dequeue rate from userspace.

  Extend tc_fq_pie_xstats to support both qdisc and class-level
  extended statistics.

  - Add enum with QDISC and CLASS type discriminators.
  - Add struct tc_fq_pie_cl_stats for per-flow metrics (prob,
    delay, deficit, avg_dq_rate, dq_rate_estimating).
  - Add empty struct tc_fq_pie_xqd_stats placeholder.

  Wire up fq_pie_class_ops (.walk, .dump, .dump_stats) so that
  'tc -s class show' against an fq_pie qdisc reports per-flow state:

    prob               per-flow PIE drop probability
    delay              per-flow queue sojourn time (microseconds)
    deficit            remaining DRR byte credits (signed integer)
    avg_dq_rate        dequeue rate estimate in bytes/second
                        (dq_rate_estimator mode only)
    dq_rate_estimating flag indicating active delay estimation mode

  Fix the 'delay' field comment in struct tc_pie_xstats from "in ms" to
  "in microseconds" to match the kernel's
  PSCHED_TICKS2NS / NSEC_PER_USEC conversion.

  Also correct the avg_dq_rate comment in tc_pie_xstats from
  "bits/pie_time" to "bytes/second" to match the actual kernel
  conversion (avg_dq_rate * PSCHED_TICKS_PER_SEC >> PIE_SCALE).

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 Changelog:
  v2: Addressed ABI backward compatibility issue for tc_fq_pie_xstats.
  
  v1: https://lore.kernel.org/netdev/20260531125314.22492-2-hemendranaik@gmail.com

---
 include/uapi/linux/pkt_sched.h       |  29 ++++++-
 net/sched/sch_fq_pie.c               | 118 +++++++++++++++++++++++++--
 tools/include/uapi/linux/pkt_sched.h |   4 +-
 3 files changed, 141 insertions(+), 10 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 66e8072f44df..fd4daad98abc 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -910,9 +910,9 @@ enum {
 
 struct tc_pie_xstats {
 	__u64 prob;			/* current probability */
-	__u32 delay;			/* current delay in ms */
+	__u32 delay;			/* current delay in microseconds */
 	__u32 avg_dq_rate;		/* current average dq_rate in
-					 * bits/pie_time
+					 * bytes/second
 					 */
 	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
 	__u32 packets_in;		/* total number of packets enqueued */
@@ -943,6 +943,25 @@ enum {
 };
 #define TCA_FQ_PIE_MAX   (__TCA_FQ_PIE_MAX - 1)
 
+enum {
+	TCA_FQ_PIE_XSTATS_QDISC,
+	TCA_FQ_PIE_XSTATS_CLASS,
+};
+
+struct tc_fq_pie_cl_stats {
+	__u64 prob;			/* current probability */
+	__u32 delay;			/* current delay in microseconds */
+	__s32 deficit;		/* number of remaining byte credits */
+	__u32 avg_dq_rate;		/* current average dq_rate in
+					 * bytes/second
+					 */
+	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
+};
+
+struct tc_fq_pie_xqd_stats {
+	/* placeholder for new qdisc-level stats */
+};
+
 struct tc_fq_pie_xstats {
 	__u32 packets_in;	/* total number of packets enqueued */
 	__u32 dropped;		/* packets dropped due to fq_pie_action */
@@ -953,6 +972,12 @@ struct tc_fq_pie_xstats {
 	__u32 new_flows_len;	/* count of flows in new list */
 	__u32 old_flows_len;	/* count of flows in old list */
 	__u32 memory_usage;	/* total memory across all queues */
+	__u32 type;
+	union {
+		struct tc_fq_pie_cl_stats class_stats;
+		struct tc_fq_pie_xqd_stats xqdisc_stats;
+	};
+
 };
 
 /* CBS */
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 7becbf5362b3..2778d3cda956 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -330,7 +330,7 @@ static int fq_pie_change(struct Qdisc *sch, struct nlattr *opt,
 	/* tupdate is in jiffies */
 	if (tb[TCA_FQ_PIE_TUPDATE])
 		WRITE_ONCE(q->p_params.tupdate,
-			usecs_to_jiffies(nla_get_u32(tb[TCA_FQ_PIE_TUPDATE])));
+			   usecs_to_jiffies(nla_get_u32(tb[TCA_FQ_PIE_TUPDATE])));
 
 	if (tb[TCA_FQ_PIE_ALPHA])
 		WRITE_ONCE(q->p_params.alpha,
@@ -509,7 +509,9 @@ static int fq_pie_dump(struct Qdisc *sch, struct sk_buff *skb)
 static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
 {
 	struct fq_pie_sched_data *q = qdisc_priv(sch);
-	struct tc_fq_pie_xstats st = { 0 };
+	struct tc_fq_pie_xstats st = {
+		.type	= TCA_FQ_PIE_XSTATS_QDISC,
+	};
 	struct list_head *pos;
 
 	sch_tree_lock(sch);
@@ -517,10 +519,10 @@ static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
 	st.packets_in	= q->stats.packets_in;
 	st.overlimit	= q->stats.overlimit;
 	st.overmemory	= q->overmemory;
-	st.dropped	= q->stats.dropped;
-	st.ecn_mark	= q->stats.ecn_mark;
-	st.new_flow_count = q->new_flow_count;
-	st.memory_usage   = q->memory_usage;
+	st.dropped		= q->stats.dropped;
+	st.ecn_mark		= q->stats.ecn_mark;
+	st.new_flow_count	= q->new_flow_count;
+	st.memory_usage	= q->memory_usage;
 
 	list_for_each(pos, &q->new_flows)
 		st.new_flows_len++;
@@ -561,7 +563,111 @@ static void fq_pie_destroy(struct Qdisc *sch)
 	kvfree(q->flows);
 }
 
+static struct Qdisc *fq_pie_leaf(struct Qdisc *sch, unsigned long arg)
+{
+	return NULL;
+}
+
+static unsigned long fq_pie_find(struct Qdisc *sch, u32 classid)
+{
+	return 0;
+}
+
+static unsigned long fq_pie_bind(struct Qdisc *sch, unsigned long parent,
+				 u32 classid)
+{
+	return 0;
+}
+
+static void fq_pie_unbind(struct Qdisc *q, unsigned long cl)
+{
+}
+
+static struct tcf_block *fq_pie_tcf_block(struct Qdisc *sch, unsigned long cl,
+					  struct netlink_ext_ack *extack)
+{
+	struct fq_pie_sched_data *q = qdisc_priv(sch);
+
+	if (cl)
+		return NULL;
+	return q->block;
+}
+
+static int fq_pie_dump_class(struct Qdisc *sch, unsigned long cl,
+			     struct sk_buff *skb, struct tcmsg *tcm)
+{
+	tcm->tcm_handle |= TC_H_MIN(cl);
+	return 0;
+}
+
+static int fq_pie_dump_class_stats(struct Qdisc *sch, unsigned long cl,
+				   struct gnet_dump *d)
+{
+	struct fq_pie_sched_data *q = qdisc_priv(sch);
+	struct gnet_stats_queue qs = { 0 };
+	struct tc_fq_pie_xstats xstats;
+	u32 idx = cl - 1;
+
+	if (idx < q->flows_cnt) {
+		const struct fq_pie_flow *flow = &q->flows[idx];
+
+		memset(&xstats, 0, sizeof(xstats));
+		xstats.type = TCA_FQ_PIE_XSTATS_CLASS;
+		xstats.class_stats.prob = READ_ONCE(flow->vars.prob) << BITS_PER_BYTE;
+		xstats.class_stats.delay =
+			((u32)PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay))) /
+			NSEC_PER_USEC;
+		xstats.class_stats.deficit = READ_ONCE(flow->deficit);
+		xstats.class_stats.dq_rate_estimating =
+			READ_ONCE(q->p_params.dq_rate_estimator);
+
+		if (xstats.class_stats.dq_rate_estimating) {
+			xstats.class_stats.avg_dq_rate =
+				READ_ONCE(flow->vars.avg_dq_rate) *
+				(PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
+		}
+
+		qs.qlen    = READ_ONCE(flow->qlen);
+		qs.backlog = READ_ONCE(flow->backlog);
+	}
+	if (gnet_stats_copy_queue(d, NULL, &qs, qs.qlen) < 0)
+		return -1;
+	if (idx < q->flows_cnt)
+		return gnet_stats_copy_app(d, &xstats, sizeof(xstats));
+	return 0;
+}
+
+static void fq_pie_walk(struct Qdisc *sch, struct qdisc_walker *arg)
+{
+	struct fq_pie_sched_data *q = qdisc_priv(sch);
+	unsigned int i;
+
+	if (arg->stop)
+		return;
+
+	for (i = 0; i < q->flows_cnt; i++) {
+		if (list_empty(&q->flows[i].flowchain)) {
+			arg->count++;
+			continue;
+		}
+		if (!tc_qdisc_stats_dump(sch, i + 1, arg))
+			break;
+	}
+}
+
+static const struct Qdisc_class_ops fq_pie_class_ops = {
+	.leaf		=	fq_pie_leaf,
+	.find		=	fq_pie_find,
+	.tcf_block	=	fq_pie_tcf_block,
+	.bind_tcf	=	fq_pie_bind,
+	.unbind_tcf	=	fq_pie_unbind,
+	.dump		=	fq_pie_dump_class,
+	.dump_stats	=	fq_pie_dump_class_stats,
+	.walk		=	fq_pie_walk,
+};
+
 static struct Qdisc_ops fq_pie_qdisc_ops __read_mostly = {
+	.cl_ops		=	&fq_pie_class_ops,
 	.id		= "fq_pie",
 	.priv_size	= sizeof(struct fq_pie_sched_data),
 	.enqueue	= fq_pie_qdisc_enqueue,
diff --git a/tools/include/uapi/linux/pkt_sched.h b/tools/include/uapi/linux/pkt_sched.h
index 587481a19433..45ea10026742 100644
--- a/tools/include/uapi/linux/pkt_sched.h
+++ b/tools/include/uapi/linux/pkt_sched.h
@@ -847,8 +847,8 @@ enum {
 
 struct tc_pie_xstats {
 	__u32 prob;             /* current probability */
-	__u32 delay;            /* current delay in ms */
-	__u32 avg_dq_rate;      /* current average dq_rate in bits/pie_time */
+	__u32 delay;            /* current delay in micoseconds */
+	__u32 avg_dq_rate;      /* current average dq_rate in bytes/second */
 	__u32 packets_in;       /* total number of packets enqueued */
 	__u32 dropped;          /* packets dropped due to pie_action */
 	__u32 overlimit;        /* dropped due to lack of space in queue */
-- 
2.34.1

