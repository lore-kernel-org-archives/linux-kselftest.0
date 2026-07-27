Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6A311C35
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170502; cv=none; b=MYglbns3k/jZrtx7lYseWBdR2tx2/ziTlnBiuoLWexOCZJOO2qFgQgZJXwG8C19PA8MdYBTXzLmNFlvXbAPdNZ9rlNf15k23xQN+nXaTxTVnhNisWP+YhjXaX9MBdgfaVeGW07bqXuXux6eWofIytM6kcWpQ/9g7qSvdWYRExZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170502; c=relaxed/simple;
	bh=7Olw2VpzNxumnxvps3bTOgK+DaldeqW9R9CuFGmgkFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F3dZce5jJyVsynXuk9nb1alm+YovoAOcFQ8bBgXN4dFaLEpVyfBYvbT6wwUjBg3GGrD44MOVbNqB6zkR+VzMFj16pa+6NTf0rPa2UWYFpyovbifMvmCjnOijfvYHRR7cgxKUqKYcG13YkliZNZUhNblx+r/j6A158EyXvbhrI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HL8pDoRm; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HL8pDoRm"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2973048b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785170500; x=1785775300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mzVcfXhcLHXf4+uerMaKPHn1e02BBbY1+oZqd8o1Pb8=;
        b=HL8pDoRmagUwU1ahg0GSGf7toKKBskeH9TvYV8D8xwNtT2kpp12LRrZhRJ8vt0Sdo3
         E9Fn0rq0n8nO17vSnGKYD/wPl3uyVPlScsxKpitOr8xkN8rmvttaeWFZWcPLkwS2kyjg
         gVJXiCDv9itmSXpL/jbfcSjmgGnDXFwjZ93Buvvq7h5Kzw0CzXXuD+KcNDa0N5rYvzt1
         vdb75bouN47cxDtZ/IMPWQAHDZyfCuj8B8p2vQF0aSxK1qWI4pGX2BeD2w9zVf5V1ISD
         05hLlNz/OTdgMV/8C/FRslN8csXUhE4+fb189GBfW0E0uX0oddrp1gDaTuEKHAqcSWuw
         ua3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170500; x=1785775300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mzVcfXhcLHXf4+uerMaKPHn1e02BBbY1+oZqd8o1Pb8=;
        b=XF4wywhcnETPCQOAofxFGg2fujsIG6vgey41H4O6SdoPBBMSJ1i+YUNszCmObez35F
         RpU6py6jamTqMyd4R9G+5s1na+PePMvi595K64pS6yb0weVbn/mUniqJWCmspXt6b5Ta
         zrlBuOZgZ9vutaHcKs2+4m0j9KVi2T2rRCQpYI5RsACYVtjB0a9uf48xa4v4P3N5So/2
         IdR77OredGO/s/rZzIlEtlovCX21ACOA3awiwkrofHaHzG/3vnjoe7sXBH3py5wZiwcV
         ztjIalNV+o0U3oNwhjLMfZ45ITsyKuOMM5389padJ/3cyxSdMjNh2vql+zmWiaEHj0+O
         cvsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpym2AcZaebV460h0vb8QGBCyR0nv2PAPXOQ0rKBa2ho1j4X/zEhfFgUtAm/WcVTBKonLmK8Ddv91pQXm/FOmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/GqNFnOhHYxUxzkN9tk0po/k0ojuhT8yUXOXFjP2XerYevH9U
	y9xyhxu3Vqh6osKruzLB4K12uS36aPhI+ux3NEGenD6P4nTNNlyboiAe
X-Gm-Gg: AR+sD11Vz7QaWmT6CDsdYLQ5Z0GLBFD0YkyyXAVGJ6+9FowPAlKZuQ7A2G94mN2VnIS
	Co0c0R1xoyB862122G+wpSWK+hznS7lbgLUEVuTwTi/obrem4jpce2Df+h3M0FWQHfn4io6LQk5
	aouzUemnWI3IEhuPD50aJb1rI5HEcfpRW9ayYI93LTgWieRV4rfWH5pQg43/gN9yEzZr4jad+3v
	ubi88y+737HLqsLwBCkhz3PrhMpDqFQuj5Dr9YblEz7DiHSPtqVsM9dqDb1SLcIb4iDUnvREh6B
	gDz7GLjs1iIvewLy6cNdPLkD2Ibta8uKCVC/4EY2aMAk2C+nIs+z+8nPbh/3MdHShI8FXW/L8i8
	5Jzli3URjoir2WKa1AS5azBLCxAenWxOx7WRD+V4ETWtVlqjhmCFrI0wvMnyi/1znysg7BHLo+M
	zYM+4i0WGvS5DVdoZwoLUgUz/wtn2OuEU7VImdymWp6bFLwqqCH5XHFca1c48ilek0rN6xwnXaj
	nvwwsF7MNejeCeLWA==
X-Received: by 2002:a05:6a21:7d06:b0:3c1:c6e:9360 with SMTP id adf61e73a8af0-3c67dab4b26mr9160106637.32.1785170500216;
        Mon, 27 Jul 2026 09:41:40 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:8b84:a60e:2cad:e760])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm33227566eec.26.2026.07.27.09.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:41:39 -0700 (PDT)
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
Subject: [PATCH net-next v4 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Mon, 27 Jul 2026 22:10:54 +0530
Message-Id: <20260727164056.106203-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727164056.106203-1-hemendranaik@gmail.com>
References: <20260727164056.106203-1-hemendranaik@gmail.com>
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
  dq_rate_estimating flag indicating whether avg_dq_rate
		     is being calculated

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h |  25 ++++++++
 net/sched/sch_fq_pie.c         | 109 ++++++++++++++++++++++++++++++++-
 2 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 490efd288526..9a86fa4d6846 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
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
+	__s32 deficit;			/* number of remaining byte credits */
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
index 72f48fa4010b..664fef18568b 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
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
@@ -561,7 +563,112 @@ static void fq_pie_destroy(struct Qdisc *sch)
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
+		xstats.class_stats.prob =
+			READ_ONCE(flow->vars.prob) << BITS_PER_BYTE;
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
+	.cl_ops		= &fq_pie_class_ops,
 	.id		= "fq_pie",
 	.priv_size	= sizeof(struct fq_pie_sched_data),
 	.enqueue	= fq_pie_qdisc_enqueue,
--
2.34.1

