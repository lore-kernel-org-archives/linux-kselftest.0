Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED83C7DE0
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286743; cv=none; b=Sc6gJFluZ9cEoLqFZrqbM1GWUnvQF/h/5d+GMcZH4l8OG+78kkHj9MTnAmvQb/58NDUZtLgkZI5RnuGVzG9VdDxCz911FFiOMLQpsDJTro6NMJYT8O/P78PLuj9MlvPHPGIHCdTCfkiLOmghfvi3Qj3VaK6ic2wfn+CHf3FLt58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286743; c=relaxed/simple;
	bh=6Hn+W3p9K8hX9s8hBstWGFWtJdnC5xLfXEUhWSlPJkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QVTU0qi7YLuSqyGGjLLRHrUfcxgNKb1bTgUXzWsOQcQlFgNczZ8ZFTiiOMSCu3UBSI4TkDVtESzbtJjhtmEYTP7s5+guLXZc0HgggKOv+wWz6FBrUGANU++kTVhglNKhlCDCU1C3Zy27+El0SwvetqrCz2SXPII0UZxifkItNlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QPZAqhbq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aYUzyoX1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QPZAqhbq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aYUzyoX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wEqBpiQa/bVt9oxxXdYY2tbaf0jiNQNtHenrP9Zr9A=;
	b=QPZAqhbqVOBODbTWbgdouTfyC1q+v4qD9z6dU14KbkAAVsoR2mmz3niqKEKZToqHoPmsgq
	IEwnOb/la/gUWDYLbnJm7HipIbQYSZ/ILwbRh7836Y3OXub122Ct0zTWsoKTUEINY6blXm
	FFm684zW+y/roJr5umO4khVFg99k7n0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-ctTYeuN4PR-KtyHWHtc91A-1; Mon, 23 Mar 2026 13:25:40 -0400
X-MC-Unique: ctTYeuN4PR-KtyHWHtc91A-1
X-Mimecast-MFC-AGG-ID: ctTYeuN4PR-KtyHWHtc91A_1774286739
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so222949681cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286739; x=1774891539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wEqBpiQa/bVt9oxxXdYY2tbaf0jiNQNtHenrP9Zr9A=;
        b=aYUzyoX1qWlNV1ol7cISTdcqCdcj9Zp2wO/JUYBok20IIpgi3Dudx0rqIfZPeFpcqV
         KfgIAF5+ueVZLLxh4aX+3kJn5Y46VBpQqkmOF1+eXpuQSP8fbmWVXg6OGuo8RfUfz69Z
         bn1ne7u5Us5YRYs1gTNQJsNldCmLBQ6VL1eQTdqc+1Xp4N28HDTl9A50KSO4geNDLbHG
         cF5tmRdM5A3g0KgjzLbRIqhbQwEaOl920doRJ8DF8zrwk0QwiZ+5byoszr/MXF2GDuiw
         qxx9WoRcCyEPQ/B/cSHfCUexDFgP3MH2rT/dqa0P8oeD6b8QtXeei5ls9+RALXDndc7u
         c7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286739; x=1774891539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0wEqBpiQa/bVt9oxxXdYY2tbaf0jiNQNtHenrP9Zr9A=;
        b=V79Gub5EMbryheZgyBc0A4uXdmIROWaj9dszACzEPa8N/M6lNjYtRJq7QU3E+m4Wuw
         ro3adInNFZD8053mIcviEu0Y/fHi2Y+vZ1dhRkZPAaSXakZRhEPJ4zqEceY/oyhRk1o4
         6QREr/HSq2O3Wf1h+Sc6Xk5GrJJYLUHMlFL9PF0DTz/km6cFxzgY9eaADg/O/6NsvedC
         rYzcOY2210gveK/xY3GaJLb9v2Iw+1BT7qSImBISC7nAAJ1UyjWY58TkhJW3T8b1+wi6
         Mc5uMC40MGjuTKz8wdw8ZF6ketRZdOnVprxTEUD1d1ShvWNDdNTXhW1DmpUCXfmDQTfS
         TraQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE/Y8z4M+nOn95CI6DOrGVqLsEF/0m85l5kijxdK7OfKEddOUh8SGjMdETgN+SdrqtVbJMOIGzDfYMGnvNUk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMic/JUfUc4sl6vnKwokuA3lgeRpfiqzY9M0lM4qIgA+rx3kN5
	N/zEhRIhS5y+rFyW+K8tsejeBEZd9xw4EV21vPftlKhGTG+je6pUR8lgDzy7QR0Y52S5TKy8MkT
	pib8MlPh+Bp52+Ds7JTmoY6YNMO71R7qr9hz7FhHwg7ubXIGYI0ytHQwQ1NgLGs8fj81E/Q==
X-Gm-Gg: ATEYQzw5yEeY95ZrF4IFnmcVhZ7KPgh44snhaOp0eoPJVg47ba8oYalhSEA4p4D1az/
	Jd+4tTmXoRJ1QaYhiDDgbF2vBl/yua2J1yJhFIB6xO09w5NTZ7uOcM403Tdkx3JXL9eqfhhOfNp
	ev6zkfHuDKsv8DIkuogmdKTuFQxlCIkj+pkrqITrch0sdj7Qyy70WuTwKNItfn0RSC7LgWT5j6u
	+DS75lQJrdxkoIKzDAY00XKqli0kn5kkEAiHm+iNBXDHMhv+L2h8bV8SkWsSCcNMd7/0+NYt+5W
	oIJTGl/FFrPR4cW2RMmb4Nbc1YA8OBYRemIr+RaVkS4Q4iaacIYMyk8N3gpe636bCPexuOF/Rb/
	8IB8Tu+d4v31oqjdMzC/I4bRWeMe5acddJjx5GFGUJ38qIo/poy8Qbkywg9Ol
X-Received: by 2002:a05:622a:454:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50b6ed78949mr6346481cf.14.1774286739526;
        Mon, 23 Mar 2026 10:25:39 -0700 (PDT)
X-Received: by 2002:a05:622a:454:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50b6ed78949mr6346071cf.14.1774286739079;
        Mon, 23 Mar 2026 10:25:39 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:54 -0400
Subject: [PATCH v7 3/8] clk: introduce new helper clk_hw_get_children_lcm()
 to calculate LCM of all child rates
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-3-8e7193dc9405@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3842; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6Hn+W3p9K8hX9s8hBstWGFWtJdnC5xLfXEUhWSlPJkw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlreX/JrC4KeS9/6MCM/inac2P1sbZpI55d2F9yK7c
 0ozj1x+1VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEVm9j+F942/BMvvSymsfa
 dtui2dasmLfu2LVaVbclBXfjp7u3LOdj+F+pefjTnOULv59paOMpTDzMICtx2fu1SNTnucsDqxo
 4ZvADAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce a new helper that recursively walks through all children and
their descendants, calculating the lowest common multiple (LCM) of their
rates. For the requesting child, it uses the requested rate; for other
enabled children, it uses their current rate. This is useful for
determining what parent rate can satisfy all children through simple
integer dividers.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c            | 49 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..f1afd6c93eba49b9fc6c5c0e1db11d46c79069e9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/hashtable.h>
 #include <linux/init.h>
+#include <linux/lcm.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -838,6 +839,54 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 }
 EXPORT_SYMBOL_GPL(clk_hw_set_rate_range);
 
+/**
+ * clk_hw_get_children_lcm - Calculate LCM of all children's rates recursively
+ * @hw: The parent clock hardware
+ * @requesting_hw: The child clock that is requesting a rate change (can be NULL)
+ * @requesting_rate: The target rate for the requesting clock
+ *
+ * This helper recursively walks through all children and their descendants,
+ * calculating the lowest common multiple (LCM) of their rates. For the
+ * requesting child, it uses the requested rate; for other enabled children, it
+ * uses their current rate. This is useful for determining what parent rate can
+ * satisfy all children through simple integer dividers.
+ *
+ * Returns: The LCM of all non-zero rates found in the subtree, or 0 if no valid rates.
+ */
+unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesting_hw,
+				      unsigned long requesting_rate)
+{
+	unsigned long lcm_rate = 0;
+	unsigned long child_rate;
+	struct clk_core *child;
+
+	hlist_for_each_entry(child, &hw->core->children, child_node) {
+		/* Use requesting rate for the requesting child, current rate for others */
+		if (child->hw == requesting_hw) {
+			child_rate = requesting_rate;
+		} else {
+			if (!clk_hw_is_enabled(child->hw))
+				continue;
+
+			child_rate = clk_hw_get_rate(child->hw);
+		}
+
+		if (lcm_rate == 0)
+			lcm_rate = child_rate;
+		else
+			lcm_rate = lcm(lcm_rate, child_rate);
+
+		/* Recursively get LCM of this child's children */
+		child_rate = clk_hw_get_children_lcm(child->hw, requesting_hw,
+						     requesting_rate);
+		if (child_rate > 0)
+			lcm_rate = lcm(lcm_rate, child_rate);
+	}
+
+	return lcm_rate;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
+
 /*
  * __clk_mux_determine_rate - clk_ops::determine_rate implementation for a mux type clk
  * @hw: mux type clk to determine rate on
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..2699b9759e13d0c1f0b54f4fa4f7f7bdd42e8dde 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1430,6 +1430,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesting_hw,
+				      unsigned long requesting_rate);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.53.0

