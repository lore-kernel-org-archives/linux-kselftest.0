Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D062F3C9439
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286748; cv=none; b=isC/04glpKzkCvUugd4ntc1SBjs3+8tXk9XEwmcEQQucnCMIXrIZRQB8a77LoSEnOMjsT/kFS6n/CxgIeqBI4g5Pa8e6Neg3sYWUtPyrrmv/RYkiRgrLKKhQFOONkKTVP8pOT0rQChxlekZ8eu5YSebO6WXQmLiVEzM+kGxSxQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286748; c=relaxed/simple;
	bh=Vb1zqZZDcPSmNYKZywOXTmBgHYJOa04VcbDUF/lQWGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5YkVX0pcft9Hrh+8sBFHD6TQ2LRQtND030jcjMh7iLz5xxsZuEHzblLCz+pdYG8MN0PH2fxc4bji85YjVDOcmlumN5KdoSuiMaTcHxaRo7PmrSeD994U+o15hXppqxjoK9e9JUN9ahv+HItzjh0gdVYOk+HXw/1l2HLIiXqobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OnDJWAxn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yv7Bk9xE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OnDJWAxn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yv7Bk9xE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zIp/d5/hztf4MB9KAZJz0xahQcJa2jv/x4ruis54xg=;
	b=OnDJWAxnQupS61vYjzak46WOFZYB6DYIZxvZlWfZv92Aj4jd6Dor1FWphNKe9a1jzhC7GN
	T5ywBb4zD4K29L+WmZWEdd/hLUC5oJ0CT9V2XwO+1yF7MmGlPiHXx58E3TcSyxaCfcMoI8
	oW/oz190zylhJZDDcVMVpWsO0Ekcg6M=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-6fY1bWqCOUKNvqNvoPzVyw-1; Mon, 23 Mar 2026 13:25:43 -0400
X-MC-Unique: 6fY1bWqCOUKNvqNvoPzVyw-1
X-Mimecast-MFC-AGG-ID: 6fY1bWqCOUKNvqNvoPzVyw_1774286743
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so327315751cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 10:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286743; x=1774891543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zIp/d5/hztf4MB9KAZJz0xahQcJa2jv/x4ruis54xg=;
        b=Yv7Bk9xE+vh6J1CPof8eXfFa0UBNlgfNMoqq+EctFsa9fzOFmC1+mO/EVVYnlPk7Sl
         g+yy+kcIuI49ljzL7yuJOtUkwnse6NqpevUG5kydgWmOQxCaehG+p7HRoQEsVC9vgoqH
         j57yVXsZftqMMJ32PMbvyxrHDkiy36JtfkDO16esDAGhtFa/UvI4An/51KJNQVoF3b7/
         UQiRCHIzCACF5dhPJ+oaWERySDC9dCr3Bx0XraXm4UmpMwlqAn+e6M4vNj4/EjkdqfF0
         eNqcB+lvtKNQzkCDVYxBZFMc+z8S554Ppg0+vgSpM/NmsP2f2vNVyh9kJHjQUkEEftcc
         2Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286743; x=1774891543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3zIp/d5/hztf4MB9KAZJz0xahQcJa2jv/x4ruis54xg=;
        b=VFQUSTLhnicRosgoW2i97qt79RjlqFBSljIRds4s5oZHG0WPEZO+djbaWkKFwTeGOx
         hNYEQlU6zcz8IooePRyIrXqzLw85g3KsNGfJpvQWlI+pYzT6830CBmUVf6fDZlzpU7sh
         ShAAEAoeg/c6ApOIRdYZKf7AeMoJM8T7Ptm/Qi0tmdNWKc+235WEH6LqwZ8n/+/E2i3B
         PoN3Sr0v+zXvYakLcu7tUcLveioLPRg78X37zCmSL1J0sfFJnxvFkBrnfTEcyV/lHzJF
         sAiPR8zjgSEBBu7KNrjUdxjMzctuhF+0ukF/qf/SnO0u0D8VLqjSpdYZk/ifaWnX7hpf
         56Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVzTh5K90WODVa/dsm7v8JZbL5IRgagU/qY0MO4VQ5GMTAR6Z/AytNBWg5VlI3ndoqBKzBozNs/lMI/be0mjH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxevCJPwAqN2RmemZaTRBUf7atNRrd8rZFgxiEWuVKFixzR5aLE
	VZt6H6SqgzbNtjHvok0AYc/gqXyyC5Y/EDghLw7krvgzZ1p8OEZZngLMUdvZXNFeIscRkKrxDQu
	sPJzC1w29gnMV8XoRxKNpNY+kLN1bs24P0l9YNvOUMxXTsHbDiumcElAUDUwDWK8GOmXISskMUa
	jeLg==
X-Gm-Gg: ATEYQzx9Ykp9DTDeWHw5uzhGjjqtZpXlrvNKJhTLe8b+nrPYs4eMaqgXcmW+WhS7p+J
	aX/HhWZ371qt40T1InDgYHBiOeK9WuauILieCUWNBucRfY1FBeak2CwEMepjNq04zC4A/spmWfH
	xp4+JWZDsZVeSyy/r50kl/WAlFx/NnlEOTbi48Fcu7DJMBoPmpBV9FQQVFXo+o8XnnRmAQpohaz
	oydT1uN8S3aX72RWKxCcu5MF6MXnPyMQNS8AnG5w7tAoOyDs6WKhKsq5u7LLfNBjSbD0nSgxZNh
	xH7OpIJg21uywZ259dtcVi5Q3Lyl5aTR7fqaEiD+PLtSXTgailzqfWRFAxDJhUqTYaXzEo/3yh3
	fRY9r63wJMbacdss2/B+kucs4cF1/0ikEpT/+mJEwIh+7vvrnLnW/kzprLl++
X-Received: by 2002:a05:622a:1113:b0:50b:5276:ed6c with SMTP id d75a77b69052e-50b52770899mr103573461cf.68.1774286743076;
        Mon, 23 Mar 2026 10:25:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:50b:5276:ed6c with SMTP id d75a77b69052e-50b52770899mr103572851cf.68.1774286742392;
        Mon, 23 Mar 2026 10:25:42 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:56 -0400
Subject: [PATCH v7 5/8] clk: introduce new flag CLK_V2_RATE_NEGOTIATION for
 sensitive clocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-5-8e7193dc9405@redhat.com>
References: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
In-Reply-To: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7222; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Vb1zqZZDcPSmNYKZywOXTmBgHYJOa04VcbDUF/lQWGc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlnds2GVt/Uc628/nzqfmc7MuzvgXuvK+Vc66htaaG
 yw9ayQMOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIoQiG/55XU5ZL9d3qXzuz
 wdHFleOSbtJCy5bvMevZJbiWczZYyzP8ZrV4d3qFVuGvNc13ma9LTn1cWhQ5a37HHv23bi7lZxY
 J8wEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

As demonstrated by the kunit tests, clk_calc_subtree() in the clk core
can overwrite a sibling clk with the parent rate. Clocks that are used
for some subsystems like DRM and sound are particularly sensitive to
this issue.

I consider this to be a logic bug in the clk subsystem, however this
functionality has existed since the clk core was introduced with
commit b2476490ef11 ("clk: introduce the common clock framework"),
and some boards are unknowingly dependent on this behavior.

Let's add support for a v2 rate negotiation logic that addresses the
logic error. Clks can opt into this new behavior by adding the flag
CLK_V2_RATE_NEGOTIATION.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c            | 58 ++++++++++++++++++++++++++++++++++----------
 include/linux/clk-provider.h |  3 +++
 2 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f1afd6c93eba49b9fc6c5c0e1db11d46c79069e9..514f2e2eb62a09df4f797b0207aa9b1448ddaf3d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -887,6 +887,31 @@ unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesti
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
 
+/**
+ * clk_has_v2_rate_negotiation - Check if a clk should use v2 rate negotiation
+ * @core: The clock core to check
+ *
+ * This function recursively checks if the clk or any of its descendants have
+ * the CLK_V2_RATE_NEGOTIATION flag set.
+ *
+ * Returns: true if the v2 logic should be used; false otherwise
+ */
+bool clk_has_v2_rate_negotiation(const struct clk_core *core)
+{
+	struct clk_core *child;
+
+	if (core->flags & CLK_V2_RATE_NEGOTIATION)
+		return true;
+
+	hlist_for_each_entry(child, &core->children, child_node) {
+		if (clk_has_v2_rate_negotiation(child))
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(clk_has_v2_rate_negotiation);
+
 /*
  * __clk_mux_determine_rate - clk_ops::determine_rate implementation for a mux type clk
  * @hw: mux type clk to determine rate on
@@ -2294,7 +2319,8 @@ static int __clk_speculate_rates(struct clk_core *core,
 }
 
 static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
-			     struct clk_core *new_parent, u8 p_index)
+			     struct clk_core *new_parent, u8 p_index,
+			     struct clk_core *initiating_clk)
 {
 	struct clk_core *child;
 
@@ -2307,8 +2333,12 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 		new_parent->new_child = core;
 
 	hlist_for_each_entry(child, &core->children, child_node) {
-		child->new_rate = clk_recalc(child, new_rate);
-		clk_calc_subtree(child, child->new_rate, NULL, 0);
+		if (child != initiating_clk && clk_has_v2_rate_negotiation(child))
+			child->new_rate = child->rate;
+		else
+			child->new_rate = clk_recalc(child, new_rate);
+
+		clk_calc_subtree(child, child->new_rate, NULL, 0, initiating_clk);
 	}
 }
 
@@ -2317,7 +2347,8 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
  * changed.
  */
 static struct clk_core *clk_calc_new_rates(struct clk_core *core,
-					   unsigned long rate)
+					   unsigned long rate,
+					   struct clk_core *initiating_clk)
 {
 	struct clk_core *top = core;
 	struct clk_core *old_parent, *parent;
@@ -2365,7 +2396,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		return NULL;
 	} else {
 		/* pass-through clock with adjustable parent */
-		top = clk_calc_new_rates(parent, rate);
+		top = clk_calc_new_rates(parent, rate, initiating_clk);
 		new_rate = parent->new_rate;
 		goto out;
 	}
@@ -2390,10 +2421,10 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 
 	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
 	    best_parent_rate != parent->rate)
-		top = clk_calc_new_rates(parent, best_parent_rate);
+		top = clk_calc_new_rates(parent, best_parent_rate, initiating_clk);
 
 out:
-	clk_calc_subtree(core, new_rate, parent, p_index);
+	clk_calc_subtree(core, new_rate, parent, p_index, initiating_clk);
 
 	return top;
 }
@@ -2441,7 +2472,7 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
  * walk down a subtree and set the new rates notifying the rate
  * change on the way
  */
-static void clk_change_rate(struct clk_core *core)
+static void clk_change_rate(struct clk_core *core, struct clk_core *initiating_clk)
 {
 	struct clk_core *child;
 	struct hlist_node *tmp;
@@ -2510,7 +2541,7 @@ static void clk_change_rate(struct clk_core *core)
 		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
 
 	if (core->flags & CLK_RECALC_NEW_RATES)
-		(void)clk_calc_new_rates(core, core->new_rate);
+		(void)clk_calc_new_rates(core, core->new_rate, initiating_clk);
 
 	/*
 	 * Use safe iteration, as change_rate can actually swap parents
@@ -2520,12 +2551,12 @@ static void clk_change_rate(struct clk_core *core)
 		/* Skip children who will be reparented to another clock */
 		if (child->new_parent && child->new_parent != core)
 			continue;
-		clk_change_rate(child);
+		clk_change_rate(child, initiating_clk);
 	}
 
 	/* handle the new child who might not be in core->children yet */
 	if (core->new_child)
-		clk_change_rate(core->new_child);
+		clk_change_rate(core->new_child, initiating_clk);
 
 	clk_pm_runtime_put(core);
 }
@@ -2581,7 +2612,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		return -EBUSY;
 
 	/* calculate new rates and get the topmost changed clock */
-	top = clk_calc_new_rates(core, req_rate);
+	top = clk_calc_new_rates(core, req_rate, core);
 	if (!top)
 		return -EINVAL;
 
@@ -2600,7 +2631,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	}
 
 	/* change the rates */
-	clk_change_rate(top);
+	clk_change_rate(top, core);
 
 	core->req_rate = req_rate;
 err:
@@ -3587,6 +3618,7 @@ static const struct {
 	ENTRY(CLK_IS_CRITICAL),
 	ENTRY(CLK_OPS_PARENT_ENABLE),
 	ENTRY(CLK_DUTY_CYCLE_PARENT),
+	ENTRY(CLK_V2_RATE_NEGOTIATION),
 #undef ENTRY
 };
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2699b9759e13d0c1f0b54f4fa4f7f7bdd42e8dde..e0fc0bd347e5920e999ac96dbed9fc247f9443fa 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* clock participates in v2 rate negotiation */
+#define CLK_V2_RATE_NEGOTIATION	BIT(14)
 
 struct clk;
 struct clk_hw;
@@ -1432,6 +1434,7 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesting_hw,
 				      unsigned long requesting_rate);
+bool clk_has_v2_rate_negotiation(const struct clk_core *core);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.53.0

