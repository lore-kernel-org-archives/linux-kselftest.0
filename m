Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC59397685
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066216; cv=none; b=uyWEDV0Q88sdjFBzaRkiYZgB00/+aedMF3SAyYu3ASo3+LrTas6o8s0+XOVCN9Vg4tq9cXHGoOkBp2jcN+YhaxwLeFEXBpFEbjpF4EtE/tSrPd3zacm6M4b7jU2bnkwmNg5yqWIWg2CybXZTh1A7pCHyM0P5EmNtgPlNy7BNFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066216; c=relaxed/simple;
	bh=rTHf4UhK6kWkIWPvhrP0nC+nWJz71sfU6irjbkXjF94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdqoDAsjF2o3jhbp5Q8UF7o0mQkUNvi9P+K2YH3iCv/FE4Y4VkJhggrKAHuOS83MHcf6jfQPTGAehpZbvBT4Rb5Y1mEIfVZ2UZZAZKd54XgvZd3rbe8q4G24THczn3GoJ6qtX/0jUNp5b9WQZ4PVQTVQ9upT3Zx+lcJ1Xqg/xNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdsYd+sq; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdsYd+sq"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128b9b7e3edso5429810c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 00:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066215; x=1776671015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnF7VA67yV6q+bGidLmOjD6jCKMoavIh1c7OZfJv2nE=;
        b=MdsYd+sqDbrkF6hJRgJP+zfVWfsaWHt44qgzzHBORFCNt+0XS8wZT4yfbJf8gYcrH2
         Km1p+LGSup6E1GJ87DCRHisGxCe9SsH9M394SHZkDdhh62NWIEsGtVxQdGSnb57k85hh
         zMqgOYzeAGS300fAm7/VibRsxf59x76cmusCObNP+9Ggy8BNkDVZE6Jw6Y2JQeP3hagh
         ldY241t0cS5H1W4ToBdXPX1mmw12BpGZXA/WlTA0kHqmk3E922VWRoAsjIMv6PG79wY8
         UwX3jvIo/xMSvl2S2HeQ7yS57VCBuy/a3DO+rPTdEnqpVDyb17Sq7a9hYwQGLC8onNc9
         2Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066215; x=1776671015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XnF7VA67yV6q+bGidLmOjD6jCKMoavIh1c7OZfJv2nE=;
        b=aJsril81rVCVA0PnCnz91wRaBn/c4j2azLT8vZ9rpGFEbIt6zv3LcGxgfI+ENtS042
         cR2x+EMPQAjq2Hz/LBdBFSfC0AfQnW9h9O2cjFvlXgIpy/UpSxVWBFb5znUhl6o2Bbdf
         1B/aeJg5n/XLBNgLMXxgscG65wWuzvIJLwGFf0pNbTiFRBDn1e/kqlSZAIILGfoXgc4a
         Va+hcnoenGYxkmRHv0q/4wzGM4h4aS83i7PEu7Uaj8CKOr02pQti9I4m2ZIZKB5imFdW
         9Sr2M6CcEjxKW0ISUGnnOwTWP11PGm+UmhEGpdt/bVT9NBzHyc6iSTnV4IM3GRrz/w04
         EmWA==
X-Forwarded-Encrypted: i=1; AFNElJ8eaj9DpE43ch0fOZ3hrlMoumyKDQS1Gi1mOQvHeCqGameETjme6Knk1Qyc9H0uD05CBUW07RdmjOunJXoZPf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+nCO26B7f3fUbO/8r7oSuZj8fr3f0VeLkMfBOR3tA40BbxAK
	lZWzoXp/Y1wPKj1i/SEYr/CZD8w2nwGdLjZ0TUjRoR4x2qxr8FpYZI+V
X-Gm-Gg: AeBDietMa4UCnB8ijVoRGid3FT46unsh/LU76lABsPYln0+Nreuqq5uiE4rn+XxhLQA
	kSaNtVfAEr3QbfVQRUQ9TB48cK275uMpeNKAy6aOaDmXQGhaDh4kEczg8DUsKrOnsVI8uTBItVc
	RxbTOnG2s6wftTB60edzXJhid4N4a8c75E20kif7foPGRoBB6mtjyFx9FqTjCFwvLQLbI2Pw48B
	mi0Zeei9ECG/xbjflCTR4v4BeoNsjX6rYKPBaPbC7SAfAMPlolCFpWfFWwGMQBfuDKpi/RjE8XV
	fy6bkv4JO1s1BlTYKbOBs4vgvCWKW3DX51lTihsdU8IQR54Lv54HR8qxESsuOSSENPQdXP/nLoz
	kwUtDWyS8EXbAgo+AyxL0tiK8TD/mB2/iGlIFlGgV9LDyRM6X5bLt0Fv8l0XzEeW4JO3IOhTYAk
	85Vp9YynJMN9CxIr+hdcgdWHqsPFE=
X-Received: by 2002:a05:7022:eac5:b0:128:d2b3:5df with SMTP id a92af1059eb24-12c34ecea05mr6569881c88.23.1776066214618;
        Mon, 13 Apr 2026 00:43:34 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm12884610c88.15.2026.04.13.00.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:43:34 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Mon, 13 Apr 2026 15:43:07 +0800
Subject: [PATCH v2 01/12] sched/isolation: Separate housekeeping types in
 enum hk_type
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-wujing-dhm-v2-1-06df21caba5d@gmail.com>
References: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
In-Reply-To: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Waiman Long <longman@redhat.com>, Chen Ridong <chenridong@huaweicloud.com>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

Most kernel noise types (TICK, TIMER, RCU, etc.) are currently aliased
to a single HK_TYPE_KERNEL_NOISE enum value. This prevents fine-grained
runtime isolation control as all masks are forced to be identical.

Un-alias service-specific housekeeping types in enum hk_type. This
separation provides the necessary granularity for DHM subsystems to
subscribe to and maintain independent affinity masks.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 include/linux/sched/isolation.h | 20 ++++++++------------
 kernel/sched/isolation.c        | 10 +++++++++-
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index dc3975ff1b2e1..b9a041247565c 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -17,21 +17,17 @@ enum hk_type {
 	/* Inverse of boot-time isolcpus=managed_irq argument */
 	HK_TYPE_MANAGED_IRQ,
 	/* Inverse of boot-time nohz_full= or isolcpus=nohz arguments */
-	HK_TYPE_KERNEL_NOISE,
+	HK_TYPE_TICK,
+	HK_TYPE_TIMER,
+	HK_TYPE_RCU,
+	HK_TYPE_MISC,
+	HK_TYPE_WQ,
+	HK_TYPE_KTHREAD,
 	HK_TYPE_MAX,
-
-	/*
-	 * The following housekeeping types are only set by the nohz_full
-	 * boot commandline option. So they can share the same value.
-	 */
-	HK_TYPE_TICK    = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_TIMER   = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_RCU     = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_MISC    = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_WQ      = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_KTHREAD = HK_TYPE_KERNEL_NOISE
 };
 
+#define HK_TYPE_KERNEL_NOISE HK_TYPE_TICK
+
 #ifdef CONFIG_CPU_ISOLATION
 DECLARE_STATIC_KEY_FALSE(housekeeping_overridden);
 extern int housekeeping_any_cpu(enum hk_type type);
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index ef152d401fe20..e05ed5118e651 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -15,9 +15,17 @@ enum hk_flags {
 	HK_FLAG_DOMAIN_BOOT	= BIT(HK_TYPE_DOMAIN_BOOT),
 	HK_FLAG_DOMAIN		= BIT(HK_TYPE_DOMAIN),
 	HK_FLAG_MANAGED_IRQ	= BIT(HK_TYPE_MANAGED_IRQ),
-	HK_FLAG_KERNEL_NOISE	= BIT(HK_TYPE_KERNEL_NOISE),
+	HK_FLAG_TICK		= BIT(HK_TYPE_TICK),
+	HK_FLAG_TIMER		= BIT(HK_TYPE_TIMER),
+	HK_FLAG_RCU		= BIT(HK_TYPE_RCU),
+	HK_FLAG_MISC		= BIT(HK_TYPE_MISC),
+	HK_FLAG_WQ		= BIT(HK_TYPE_WQ),
+	HK_FLAG_KTHREAD		= BIT(HK_TYPE_KTHREAD),
 };
 
+#define HK_FLAG_KERNEL_NOISE (HK_FLAG_TICK | HK_FLAG_TIMER | HK_FLAG_RCU | \
+			      HK_FLAG_MISC | HK_FLAG_WQ | HK_FLAG_KTHREAD)
+
 DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
 EXPORT_SYMBOL_GPL(housekeeping_overridden);
 

-- 
2.43.0

