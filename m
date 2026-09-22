Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0543498C
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110811; cv=none; b=H19mOhQ32Gi+yodyupmdS2nNU5tO1CdOpERlCrTPLIkdfsBJ4FA6jLVuv77/SEWVd5UqK/b+mmWIT9nJ5q/VMVgmUTadktn6acKpF0S112B4gbQhCLrmri9L85DXkll1K1UzokhbKl98qHcIx7kcwSgUi6cwNe5ZYPFak5GE8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110811; c=relaxed/simple;
	bh=WeijqWAwv9BserVdyqI954+yAH2UJjKhpmnxyXRFO80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lrzJs4p7fqvXV6WCz4EoWDU0SXw0Z6kBWSIz+ivGgXlkVhgV2pEbH2DHrtyFqpzxmeO4MhKLaIJq3EbxDCFegQoaMyWRP7v1vZjdM9y/xBKa/4AJcwqTUol7PaivPLiRDWZS1mS8G79LP4xZ5shoB3YxhVQblPGinQrnlCdyIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdNdgzF9; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdNdgzF9"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso299230eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790110792; x=1790715592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xV0AvwkeiiBqPhm2MrCjRMYdzfQvhw3JDcu+V/HPB0=;
        b=QdNdgzF98t8XC7LTxrhd3uv6zbOCWwhCiG/j89oW8JCR29HKOA876eTzgK1Y+0IFtM
         lq0UIcMMTnQ3MgEd1QpfkqmvQZSH53590bLlk+jjvM/JtI1SQW/QN/ZaaU2R86TNgpPj
         A/S6fK6g/1LTOcc/IiON6g8BAkGtOzQodSlggJZv2YAqXlxnkGjHOKEiAl5xqRiseCdD
         vxgsTxHVp4OXS0NHAlfJPv8fUXeQn6/Lxlm6DUC1CuaZbMjUxb21gu5EQskwWeWlEJQL
         BcxchcIzfenOCbmAkDtc9DWovNWYrLyeY5Fnmx5ay2zgDHuv1abigO/f79M8Ow/bh+wy
         96iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110792; x=1790715592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xV0AvwkeiiBqPhm2MrCjRMYdzfQvhw3JDcu+V/HPB0=;
        b=q2E/0YCCZ+Amv19zs8PGOIPZ+88BUAX8dl9a08G4nHA2v7UR5rMCOjEZgt4ngLlYzn
         J5CEV24VIrHZuvmt3VYLN2mNee1oqDZglODQHnxFfIUoHjrjFVoUXuzXjkbxV2N0WrQ7
         aFka27//j8eJpgyr1DIkKbtLd2MdKSTUeVloxarJjAvoGjycN/51jZ9vWEbQsnE0ee3+
         fXZHHXoJsGtGzG+tzXxlGBrz90Qa30NhaAbtgYjxC9agVfrJV6urKrazPSW7eR9GUG0V
         wZnoE6KRkrAR5SLKxL7WrOaDgNdlltA2fnzVdUbQ4PxFcXChKidUouj6nDUGVpARVJBe
         hTLw==
X-Forwarded-Encrypted: i=1; AKwUvBzidQs9VgzBZYrKry6+pOKrhx+M8Noql+NYh2mdhxaqn91bA2Wj2Z9aTBIA+1SoJFyZsM3t4mZOzyk+QpMbPEA=@vger.kernel.org
X-Gm-Message-State: AFuF++lcrDu6sG8BCMJd843Jmc4oKXeGG0wR5jm/U3L1tePkAPPnFYqv
	mK/YAFa4nVnYylL8w3jiRIRw7SUGHy1mYA43616Ol/5JmWelTtgoA5nz
X-Gm-Gg: AYBFou2+6vjRmTuq6oCtz8Aw50agihK+JMEAkkUE4jF4OFj6fkm92Vjf9CXz/pka47y
	MujSCnDeWewW2o36JDIG8uIfmZOh6121fNXO3BKTasMbumJp0qotr3ZjHUg07A3j/YPGzTVIUdf
	7coNu8cbmukfetNqrS1znz1pmEIsweUjckLP3MWxxRxA8p6yUs5iKlZQqCcf5Y9Xtrr1PC8Phaa
	gzHYrIt9011PUOq1lFG/wC6R3aZRiWFq1yPOOypmEEGJV8motZ0dQ8cXsqrs1Uuh4whxqfX5YXZ
	jozJmixdSVjlwLFSdDVErK+Q8rXGScic70NzsWVY62upfh7LNoyaiNbjUf5nqKIn0owcOu6BPHU
	ollaBgSA6yz6DN5jR6Rwq8ojNAjdZaJmbTNCAX7a1bNzT/Ax3Im+nL49sqZdJclOU5OhfKDTVV2
	jbOslSoXz3oVZ2AkXugUX5TzbM0otE5N3YupwmEL4Me262qeQmuYxZ0OQO8G+u4+jlypU6TfSWm
	+8pANrpaufSvqZBwsQIy9R0OULnYcKbCdpKJhUXry/ySiYfrETzEljWi+axDjwZHo/E2RLmXEg=
X-Received: by 2002:a05:7300:2414:b0:333:f186:8747 with SMTP id 5a478bee46e88-33e8d9cdb09mr440054eec.23.1790110792234;
        Tue, 22 Sep 2026 13:59:52 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm760952eec.25.2026.09.22.13.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:59:51 -0700 (PDT)
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
Subject: [PATCH net-next v8 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Wed, 23 Sep 2026 02:29:22 +0530
Message-Id: <20260922205924.32173-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922205924.32173-1-hemendranaik@gmail.com>
References: <20260922205924.32173-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE schedules independent PIE controllers per flow but exposes no
per-flow AQM state. Without class-level statistics there is no way to
observe the per-flow drop probability, queue delay, deficit or dequeue
rate from userspace.

Extend tc_fq_pie_xstats with a type discriminator and tc_fq_pie_cl_stats
for per-flow metrics. The nine existing __u32 counters keep their
offsets, type is appended at offset 36 and class_stats follows it,
growing the structure from 36 to 64 bytes.

Wire up fq_pie_class_ops with walk, dump, and dump_stats only so that
'tc -s class show' reports per-flow state (prob, delay, deficit,
avg_dq_rate, dq_rate_estimating). Filter attachment callbacks
(.tcf_block, .bind_tcf, .unbind_tcf) are omitted on purpose.

Derive delay with div_u64() from the full 64-bit nanosecond. 
Widen avg_dq_rate to u64 before scaling it by PSCHED_TICKS_PER_SEC.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 16 +++++++
 net/sched/sch_fq_pie.c         | 86 +++++++++++++++++++++++++++++++++-
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 490efd288526..9c0c9787f0c3 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -953,6 +953,20 @@ enum {
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
 struct tc_fq_pie_xstats {
 	__u32 packets_in;	/* total number of packets enqueued */
 	__u32 dropped;		/* packets dropped due to fq_pie_action */
@@ -963,6 +977,8 @@ struct tc_fq_pie_xstats {
 	__u32 new_flows_len;	/* count of flows in new list */
 	__u32 old_flows_len;	/* count of flows in old list */
 	__u32 memory_usage;	/* total memory across all queues */
+	__u32 type;
+	struct tc_fq_pie_cl_stats class_stats;
 };
 
 /* CBS */
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f8..3a3ef83f328b 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -511,7 +511,9 @@ static int fq_pie_dump(struct Qdisc *sch, struct sk_buff *skb)
 static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
 {
 	struct fq_pie_sched_data *q = qdisc_priv(sch);
-	struct tc_fq_pie_xstats st = { 0 };
+	struct tc_fq_pie_xstats st = {
+		.type	= TCA_FQ_PIE_XSTATS_QDISC,
+	};
 	struct list_head *pos;
 
 	sch_tree_lock(sch);
@@ -563,7 +565,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
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
+			div_u64(PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay)),
+				NSEC_PER_USEC);
+		xstats.class_stats.deficit = READ_ONCE(flow->deficit);
+		xstats.class_stats.dq_rate_estimating =
+			READ_ONCE(q->p_params.dq_rate_estimator);
+
+		if (xstats.class_stats.dq_rate_estimating) {
+			xstats.class_stats.avg_dq_rate =
+				((u64)READ_ONCE(flow->vars.avg_dq_rate)
+				* PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
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

