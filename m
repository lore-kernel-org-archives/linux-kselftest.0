Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905A388395
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639963; cv=none; b=RrynngdWr8U/GQXvmSmcfIO/fPZ4fjMIQejxpPLNvkHXd7rMGxxbOanfXAvImYDjCm1gv+YGCWkRWHPUNEUVr5Js6tafs3uKM6B0c7ABB+UEs4wWxtZyGdxAK3vF/uCkavlfzJMh5WMgH/XEFxRRlvj6Mg0HTVzciHrCngDXOII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639963; c=relaxed/simple;
	bh=zZuXuYzRXV1Ky5Xhgp7rZ3YFui3eWbaiq3f7MTmQQc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbRJJSZVvYD3HYwPdC6GSAq6fLb3/iQXxaoASKogvXWZFU65dgghTVzP5HT1LpYifzMMg56lQXtNjx9oAXlQm6jhPuFM8dps0kkUDGthYoVGfOtCzCLw+832wV3BlF82WLw6oIA7nCHRSWKQsy+j9IwZ6nyTDSIVQDMD3kHZk+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFIGZCXV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qtkjBXwl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFIGZCXV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qtkjBXwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bICn27k7AW7Sds/NN557RWHAZWLa14lZ1eS5gR80gvU=;
	b=aFIGZCXVKi/ML24ITX8uN4e3ewWuzKxvTEwShimsqHAxBccwGDIHfhK4JcExaS+SiIcvKk
	qL1gs34XSFUBTE13Hoia+JNSQIllkdLDdloX8cptFS2nxP7X/UaOsEazSrssjah3ZiNjVh
	qYj7/YtmBeYjaN13x91zLUbN+KRFCFI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-4G_pFUpCNOOmvhTmG5HbuA-1; Fri, 27 Mar 2026 15:32:26 -0400
X-MC-Unique: 4G_pFUpCNOOmvhTmG5HbuA-1
X-Mimecast-MFC-AGG-ID: 4G_pFUpCNOOmvhTmG5HbuA_1774639946
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso25771731cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639946; x=1775244746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bICn27k7AW7Sds/NN557RWHAZWLa14lZ1eS5gR80gvU=;
        b=qtkjBXwlCOhngMrBb74Kem324OblelTOyyb3TvYWoTDE+Tg4YhF29QYQcZuFGLBxSH
         VYeGsZSvGDSCfS5yr0pxgPEwoSKb/b2sV9/bOX5jUAEbl0LzitAOXyf3HbCaM/NoccAp
         DT3wmY99KfQCDcXTFZvm0nb8tND2h1NNfViGnTJhVwwTycZr2y4cxfSAVRhSbE1U9ZP6
         Pn8XXO48U1NrcvJLDlO/4se0xR+OdDxm/bUG1pE0HSbWQ+UJTAn5o/O7Nnv+uKoDzwvV
         Ii97l/vV08zooh+LLg1x0saDojKbT3mfPuPvIhm03bMrVPPz7Kb4shcu9gPEeoagWvrm
         39cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639946; x=1775244746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bICn27k7AW7Sds/NN557RWHAZWLa14lZ1eS5gR80gvU=;
        b=Fh28mCownCYGUXc47/n/Esxobl/8xsAit/alkhsuiXrinXMSIxUgI8WVJPLRox/A8I
         bkUwgAr5aHlfIR19CASfKSuHcym+FeNnlhgSBDU0tf/T/DP5s+Hmogz+uIqD6aiPDp3B
         k2nHeNs9QPDtbdPRXVRwLkOydQlKd86q0bTs8+aCEElLjUj4iOsfKPYeYIcMBwuK0xi5
         lysx3BtXVg3A8wuQCY5nEc+cZs4eBCSFNn5mNQ7TPQnT0VmVDc3sTQBqqN43PlvYClxe
         c6FojlQAc/gox1pB2vjMuXO3J3EwCLtLskplJELBkw0gHBD/9PxQr2XKU9SmCbcnpVdI
         SCBA==
X-Forwarded-Encrypted: i=1; AJvYcCUp0k3YDqPDcHN43DwGQDl9HpKBF1IqODEyRvf8zgOqs53cWT6zaHmIwHiUWJD4Ll5ulzXXBrm6sNxxARF2nng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3sQgdMVI2/3iqam/MYMpY73bdjvgYel0iBC/5h/I/AwG7aTrC
	HVdl198AnWge55YhyJbXTUSktXyQiteRiNv6uOSFDsjnW3Dt/7sFifngu1FJuzQ0ggOl8gPq7Zj
	0BLZJFpZmjeOwclZZz7kW7qjibhsJtAunL2bx5gyMvu2wS3aUDle3ZGnX0jzcRDE48yS1q29r7Y
	72p0lRs0wQp1YKJaoQJNi4e2AGg6Ltgl+zEyIEnsca/c3rmmPNYDjd
X-Gm-Gg: ATEYQzzLb/eRg5t3FFVTXqMlT1W/pSZLieQIRbO3GG+P8a+jflncK6uib9y/KDjdwfL
	JURJc6lbUz1RUwvaB3bXYeORgb3isjxksfLYN1Oo7a250q77v+UV4u66RZuvxiCYsCFpGWHz13S
	OjK6jilvMmNiJnwEv2WgLQbQ0EWm/dC7LKqcmVhMfPcuyuHbS+MZD/69TLkCSEQSmt8az/Zu9fg
	2qrTUoG0SafOCfS94Gb3pruoI1hoLayrnm0wsD4XqOYw/JYYcAUFPNW2fozm8A4Mi+67eiDKr1+
	l6TvBCUmd2ty0DxLU7DNS9rwDfJI3/XgPXLw8GVlauUP95ofOLvWYcvLg7IP7jJX54yXDkuQdFg
	wscmte5uwUz1KeBToUHgnaOx3ODSnmtuE9jjqrjfp/ji5c+vQgrbtO8eihNSv
X-Received: by 2002:ac8:7f12:0:b0:509:320:2de6 with SMTP id d75a77b69052e-50ba386455dmr52408701cf.25.1774639946261;
        Fri, 27 Mar 2026 12:32:26 -0700 (PDT)
X-Received: by 2002:ac8:7f12:0:b0:509:320:2de6 with SMTP id d75a77b69052e-50ba386455dmr52408081cf.25.1774639945637;
        Fri, 27 Mar 2026 12:32:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:31:58 -0400
Subject: [PATCH v8 3/8] clk: introduce new helper clk_hw_get_children_lcm()
 to calculate LCM of all child rates
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-3-86cd0aba3c5f@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
In-Reply-To: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3927; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zZuXuYzRXV1Ky5Xhgp7rZ3YFui3eWbaiq3f7MTmQQc0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3bYrWtjNd2nJh47cbSui93pPnLazdunJyznJv31rX
 0YJ9ZZP7yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiS1wZ/gpd7dWOydvk5Se5
 YcfCjZuLHGRkvM9wu63qfSrF6O4mdp7hr3DMgYVaKzXVH0e1Fa/ac26Sikxc8q75qc/sIy0XpK3
 NZAIA
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
 drivers/clk/clk.c            | 54 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 56 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..bb602c07df9a2b523a72e1e05cc3a27956e7198b 100644
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
@@ -838,6 +839,59 @@ void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
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
+	lockdep_assert_held(&prepare_lock);
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
+		if (child_rate == 0)
+			continue;
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

