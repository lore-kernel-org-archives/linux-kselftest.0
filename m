Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265563DE451
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844654; cv=none; b=RmnUYvR35CEuAdgsvqQPEstNs9mIncpQBHLbf6TVwnwtcg9bU1OaUhCMf7Nvk2Fkc5YfI2wCRIPw6PABz8ivnqt6ANEQEmlIP7/JX4f1XbRoKZtpMlyp88UJqSuxDGcGyPHb1O57K8U2FhoSW9y0uLjv9aoQ9TrwRPb/pohwE9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844654; c=relaxed/simple;
	bh=OlpgjXEBUNeyYJUoP6V+RH6981BQeXUCPSeXrOTpHN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G8GX7cPyfN/81X+OsbtyyqLeCYt5AcqNSBxLD6fgLWsZ5MiF3awPRABpeKYUZ7j/G/zqgoH4o68KF/AtgDPEDMfQvlobQ1rps6Fsva/6ohVJKcPF8cre9qjpGgiGrChP58Dn0CP67TyOp/Bz/WqYBy3gjk6i2GDlwOI/wDrUUPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoVcxrj+; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoVcxrj+"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3078e0dcd67so8333712eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782844652; x=1783449452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTRCJYGUuctnwJydBugZaX4UOVy6FB1rphoQeUaPjJE=;
        b=BoVcxrj+CtSFcq6yG3E+wGFo4Fy6fI4TKxdaJUdkuXjuAH3P3aKwUOVhs6wTFcihbq
         DgMZL0kvERvNV6RNddTgVzYT7FH+DvxB5GeeGZR8xLQ9l0xn0DrqxCt8Qb9ybRtdXjBl
         B7Z6jR3oXxmVnzy5+7qDd/PFJp4d6hECci53qukuR+eccD6Jvh7NAVJjLmomw/QyWWOU
         W/8CxORQL3PN1qOew8Lkc/nVg9NrPkmfRv3tGZSiFQAMfQTORinHsw1cvrHF1NBXHl64
         eB/jSDfQ0Qh3OeGD+jaPIN4i6LdaAK0qMq4NTR6kZfRuKggUyRz8iB9HdT9/vIr7qzRE
         QDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782844652; x=1783449452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTRCJYGUuctnwJydBugZaX4UOVy6FB1rphoQeUaPjJE=;
        b=bMXxCJp5UllA66eI4KF8zk5+p7UfCFCo7iqs0VhlXHDunwOTyaIt3UwpjCPF9OzRqX
         Dj0UsrSPKujhBpTBV9gsvDjAbIi7VKG1/QePfy/M4f7an7Ftn4BtIJbWqCnIrkT0IkjI
         qN7A9hhOmqRK/0NdoAzk62uJM77AdcUtHp7hNNI0xe7X/1s/nqn5bXOeCz1wVP3k8Vun
         Yg+CtaveQZpOhTzN1ghVqAU9KDcCLpf4DU/Jq79qNXqrNN/41N6noKCXtapWUOQhGXHs
         MPVzsYkDWDisddJLYYlANRojpJrtO4zXhV80k5kzyuqG+bCNq3fQhY87eLDKEnvwz6aZ
         xTVg==
X-Forwarded-Encrypted: i=1; AHgh+RrB2xtM6Maq+OH+4aV1lnBzA242yXM7C1ZF2Gbq1cKjfUSZ1sdsNW6j4+65uCnSgciGey8xCMKCd0ccfVhNuik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/Gxvk8/NVzQxhYkGHS/kIR9IthFiyHoH2ZBCTnb6zSUvmUfj
	jExui5alGpl8M80MqO8LUdETeZQTi35tUq9zRLfMEG8guzXF4dysxzqLqwe329nI
X-Gm-Gg: AfdE7cmxz1k1npiC3g6P8Rs1xWq3a4LlQWWALC+cnUhvSKyiJJ7wqqE9qmzPB64kDXt
	zrpwohaztYymQgXZXBg1gFHn7iFvd4AQRIwCWcPQGZ8AtvnLcEEWdHowbgrGOngLWdpXqadGmvN
	mpY8JixkG4WhXvqxUsWIzq8n1U7L9wI/+MPCJWmqCfqnwmF5wFr+Pf2XFAeWVyra7sdXAhk7hcD
	JWYLQAq2GkMb+vNWv7rOZCN5RZ0HLsHiUtakOJbRmvdEXvThB9sXdOs5xKMgMEQm0YAMh8a9ddn
	hWy5r60KpOeAXbaK4tTq56J0dtceelLNGHi/hdql0ukePo9oXR3uKNrkLldaHB9f9U/iwj27pQm
	/f5GTm/yHCTHxnC3qxRQgUnK+rs+DmTuGwpd/Ho/31b934hJ//3q8IsTVeljvC+oiGpK36fPdfw
	dFS5A6HKlCP1+u+sZV0oL04CfkAzE=
X-Received: by 2002:a05:7300:cd90:b0:30c:ab4d:381d with SMTP id 5a478bee46e88-30ef0a5690bmr1402762eec.41.1782844652190;
        Tue, 30 Jun 2026 11:37:32 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:b5a1:965b:86fd:756])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3205993sm10888191eec.24.2026.06.30.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:37:31 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/2]     net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Wed,  1 Jul 2026 00:07:01 +0530
Message-Id: <20260630183702.170798-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630183702.170798-1-hemendranaik@gmail.com>
References: <20260630183702.170798-1-hemendranaik@gmail.com>
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

    v3: 
     - No changes since v2.
     - Resending as the previous submission was deferred when the net-next tree closed during review.
     - Corresponding iproute2 patch updated in response to review comments; no changes required for this patch.

    v2: 
     - Addressed ABI backward compatibility issue for tc_fq_pie_xstats. (https://lore.kernel.org/netdev/20260614125000.6058-2-hemendranaik@gmail.com/)

    v1:
     - https://lore.kernel.org/netdev/20260531125314.22492-2-hemendranaik@gmail.com
---
 include/uapi/linux/pkt_sched.h       |  29 ++++++-
 net/sched/sch_fq_pie.c               | 118 +++++++++++++++++++++++++--
 tools/include/uapi/linux/pkt_sched.h |   4 +-
 3 files changed, 141 insertions(+), 10 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 490efd288526..b18f274b2ec5 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -920,9 +920,9 @@ enum {
 
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
@@ -953,6 +953,25 @@ enum {
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
@@ -963,6 +982,12 @@ struct tc_fq_pie_xstats {
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
index 72f48fa4010b..60e85c002ae7 100644
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

