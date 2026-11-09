Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208249;
	b=Xuw+3rYAYoc8OjFJgDZ/yrXAI5UiH1A1qpUOqWqXIfkjZAwcbqUDh6Ce9Z0FPD8d9A4D
	 ejmRVPiBuSWtqn1R7KXaqAxcAvJ71ajM/wxYNHeHBExwwqWG18D4vq9ODnKoB3QLj3DrH
	 qgvKuV1gExulrxx3Qy4l4OKhwKdhpf2nd8RuhVBje193bxpXuNnuqx1oEjZ0N1H8a+7lh
	 mDAS7ntv1oURGUCKCx17sHwGgukzMRB6E/ZYRjUh0V/7QlIvSET93brAB3NZk5mMMPi/I
	 0Iihz+h24aGw57G9KsoXF4qX3cpjgm7PoEi/Hd8Nz2ULbJ5AsLaiqpOLqRYVVeXqxJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GS/mJj08Rc3NXrACJw8MkLnqyZ1jMTdN85GRwUjehtI=;
	b=yFzo+RK64JH+KNbTbQ+ONWrKQKiOvqkrpDczLOpWl+QZQMuMRRGjwjYuz1PAf+wnLGsA
	 n5HZ/k1T9fZN56WjnpLSJOUguHidi5mWTNChz9RqDKr1F9og9bTDpzfpLHLcgno3py5/T
	 cv7qNLT3L1dqj01TCoGf253vXMVTkXsnibZRihV20CLitkW+jmscwW3MmMi9e1zCXY/+k
	 r3rgjMFRsC/pFYfR/aCeG9o0/FqKqbbohTU75D3qqbRiSHB+InycgRDEs2Gf4jPgWgH7T
	 LNYgsON82vNPc1Q04c0Re+bO9DxhdV2AFlvuQxNRE6NQ6iaYcPh5OuvxPLYiZousAKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=utXlC+B9;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C40A606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 07:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C40A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=utXlC+B9
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1095200eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 23:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208249; x=1794813049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS/mJj08Rc3NXrACJw8MkLnqyZ1jMTdN85GRwUjehtI=;
        b=utXlC+B9lNVmec7vDnfUP+LG62IC1L9WwmdukL75G4GSyXOzmby/YQLeyBqGxuWX+z
         TE0HJEMm3MxVBN0MWaqFLz2Ci0v478VtHrHthpGj9ZhpljpkIDzh1hmquchmVLZ7OPfN
         MBzwhzXhgg6An6mCR8Iq9mH9ogHfXnt7BSr9innTaE5S2RLp+B/bdVoxxS4xv2KEHESK
         9j53AeZz4fnsukaWHXkf2jTYt5CEvB4FT+/i9FZWcnEOcDyKM9S5hJY9id3NVmNvFOHD
         UKmznvPJ76wXz/cF0qyBA80ofZr9JMyMVvQ1ocXjcSPS83YvukZxxCy0X7RSXeKmDSQ+
         HguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208249; x=1794813049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GS/mJj08Rc3NXrACJw8MkLnqyZ1jMTdN85GRwUjehtI=;
        b=ygxvIhkwmrhgQqCoz4889zLghtEHSm/i4lZ3r4AdbRAfaWDSMhTYp2CJY8PmSQBPLW
         DdjKnxtxHepkgaiQTor/zEnG0OAjGHs5gDprvY3DXQ7nwN8QWGrcwYTxv6wS930YzIwC
         vJzJQdRhZjrgxoYB27dV/jyHmqaJSIfXGXJw5tfo52Y6oseuiN0DADUbfUl/j9kGVFUF
         W6rSQdPnboKzvJsuoC9xdkYxF8JxFCm/bOcNDuiG57yx3FYqm70T6RrW7sdjyxEocy4f
         byjjPXK3eTmpjUrWHgudljWDZz3Zpkx4VZ/vNfE7Md3i4pWXvrRawSjSKiHmholUAFn8
         2AuA==
X-Forwarded-Encrypted: i=1; AL+hErG49/TOEVqEaVR9aPi1EARSiK4Z5+mIvQQ/B6PsKnmGBGq2e704OnOAbc/GNZPHDIgeM6Solap1kr4RXsQVPR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XRnsfaK4lUEK5FK5FIAt+CmYvCJd/7lyozcjOXKwyADHEm0bR
	kXseruXVBG1aY9yGJ+pzR9zkhWvECSDpiWT3LV2yCADHLiOUAzFF0Ckp
X-Gm-Gg: AYBFou0pmQEfzfxyusc91X3YifZ/Rl4VyNnQdWiKe5Bqg5gIH9BlGDuqRRXf/gTPQje
	eRpvWSKyHIPGdycH2z9vl/ocgtmmzRKpX9C/lnoZUKLV1jnPm0Gc+eAqmtwiJ+jFNxlgNdNJ6YG
	uuaUx0GYeRTzYuxNS8JIcuuNEnpfUgTJYjNfoEqcS3c0R7+T5WRIkRSRKNu3xtMKjlp6bGjbW1Q
	N03GievuB9t/hb+sVuUeu8ShgrRfw01+fhC80sbYQxCN2Oa12GbSwGQCo2onC2gMBoe1NgFkdvL
	yXSy4SWPgGy6SD1GuQPSdJi250piePNJ7dJTUkyyJuNQXu67r9y4xZOwaaZ671snLj5hkBq8G04
	sSL0hoQapCKAKgGM2heQuheYvsK/4clvTPPv0wU+ELd7Ttm9D2YxLCUQfraGJkzmxmSEE3tLzpN
	fYAgJlAo5RaPeB7lECfiU+7EVwqyCZIHZ6u3hiRNKz7ZT6Lacpskq5fEuTEuWr3vs2WMYbhEEFW
	3Q7psR7/JESqDDBWeSnOdDRsz25Uw6fBeC66tN1LtIrZNyMqobBla7bz9Gg/erPJZpeC22+hreR
	8Nv0XbyOyApTnhrJEeu1UE31B1j3vH9UmgmXyNPQZT3I5GnBTSMPvUIhwx+zG6AfoVRyh16gIwH
	mP7PsUvCaTrzBmRXiaShJo8zftMN4
X-Received: by 2002:a05:7022:1709:b0:184:992:c9ec with SMTP id a92af1059eb24-1b39fecbba5mr4577720c88.38.1794208248293;
        Sun, 08 Nov 2026 23:10:48 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:10:47 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	ast@fiberby.net,
	toke@redhat.com,
	liuhangbin@kylinos.cn,
	j.koeppeler@tu-berlin.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v10 1/4] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Mon,  9 Nov 2026 12:40:14 +0530
Message-Id: <20261109071017.438478-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109071017.438478-1-hemendranaik@gmail.com>
References: <20261109071017.438478-1-hemendranaik@gmail.com>
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

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 17 +++++++
 net/sched/sch_fq_pie.c         | 88 +++++++++++++++++++++++++++++++++-
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 490efd288526..fef848eaaab2 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -953,6 +953,21 @@ enum {
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
 struct tc_fq_pie_xstats {
 	__u32 packets_in;	/* total number of packets enqueued */
 	__u32 dropped;		/* packets dropped due to fq_pie_action */
@@ -963,6 +978,8 @@ struct tc_fq_pie_xstats {
 	__u32 new_flows_len;	/* count of flows in new list */
 	__u32 old_flows_len;	/* count of flows in old list */
 	__u32 memory_usage;	/* total memory across all queues */
+	__u32 type;
+	struct tc_fq_pie_cl_stats class_stats;
 };
 
 /* CBS */
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f8..c834c8f45898 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -511,7 +511,11 @@ static int fq_pie_dump(struct Qdisc *sch, struct sk_buff *skb)
 static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
 {
 	struct fq_pie_sched_data *q = qdisc_priv(sch);
-	struct tc_fq_pie_xstats st = { 0 };
+
+	struct tc_fq_pie_xstats st = {
+		.type	= TCA_FQ_PIE_XSTATS_QDISC,
+	};
+
 	struct list_head *pos;
 
 	sch_tree_lock(sch);
@@ -563,7 +567,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
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

