Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559EA3C7E0C
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286749; cv=none; b=FbeH8RrnKdP/V8zV/62wNciwJhO+rW+9iMgMRTUxVxcj8tEnDWQUbg3Brq4oMsZ3OHR3Z24xtjDws5kvbBOe3x3ZAcekO4wuySPkIp8HCDGH84Yo+t7XjSGXuIq3X/pcMemJota7Bb9e8F6YpV5Iu7XnPjiAZ9QurX3/orLLU2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286749; c=relaxed/simple;
	bh=3Wx9iN4TAJNUNIOuDPx1ojQxxrOnjyC9d13DLRzCvF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QB3Fa4BNZiM9MoTtrBDonskN9d5lV3VsoYbW5b8x5BFBLqS389e+kW24VxOqyz4cVd/8nA1iJRuY7iWa7akMNmb/oBTraY8PQ+nF1Pn1wq2HJTqusrAvpQXeq5oQv0HilEiViEyOexX+MD03wRIKSqCgfsnUk8x6pxoWmK7aPXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=en1Un64j; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RmqBa7PJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="en1Un64j";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RmqBa7PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TbzwY54CQAGeSGXdTg/v3Czq6hzBLavF0xp2Hme/bBk=;
	b=en1Un64jm5kejIY6m1SyW01X7cMznHtl2HhN1l5HFIGqjj+OjnwF2VsdlCcCHbQXy4b48S
	eUdq+a3BjFDiq2fdmoTo0ZJXNdri/EcWlTiHjkCvWWuRHFr31EVbp7JjK+z6sqGO/A1TYU
	tK0ymMuuEBxlT7H5T5y/b69a34vZNUI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-E1C5TsioNnmOYORxHbY4Vg-1; Mon, 23 Mar 2026 13:25:45 -0400
X-MC-Unique: E1C5TsioNnmOYORxHbY4Vg-1
X-Mimecast-MFC-AGG-ID: E1C5TsioNnmOYORxHbY4Vg_1774286744
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so327316811cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 10:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286744; x=1774891544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbzwY54CQAGeSGXdTg/v3Czq6hzBLavF0xp2Hme/bBk=;
        b=RmqBa7PJcGF0JQhh46jzqbvX5iVkNNO+CqsKYI4zyCXl2OHD+x5oQbTflRTcgMtruH
         c48gsKTJ0tRlgqF1CrPKbpi+wV+B8zItONA5xwPsXeeNF2tN5v9AwTmPuNnIPl2FeQlg
         tW0PUU3PPSweHQT3wN5ruxq4Kk3oujKb2zswHbxJoAS4Rb8q2MaUlHL3c5PbRKX2RCZs
         6KhEQ40aV+AJpxX8oDD2v2JSShdbSLBG8OsY8e+gQIxgAt+H8lBszaKIVE+8JoN7n5qx
         mUfvX+9we8KMdlkxhhz3O4IPeEMwvd81+4szDyCflTeE6S36esYmrRPwfZmBS4NUWwaL
         Rqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286744; x=1774891544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TbzwY54CQAGeSGXdTg/v3Czq6hzBLavF0xp2Hme/bBk=;
        b=HcXUfv1Eb//AaQsGZ3zmodBDJdhyHELCSh2tCPiNQ4MMiP8CT3QgA3OruGv1SlMKNF
         9yMuZF//mOprvgbbPUfUbGZjBSiuMOSFqERky08EWUiKvHKpex4N/H6rR6LlGR0zXBz+
         Q7eu+13QiJHEYyXWW4QZDd8EJzQcYeOSntpUsewBarg2Nj4m9ux+cq1uLMEPgt/g3yei
         aClR/NbUMCa0n/vru5R4ONw4kld93i1oIyRtN8NBxzGIYmGZ3dwabumVvyit6y+zTxd6
         bfTqW+oySSyEOofSIvSWzX7209AW4ceBMnjbFfjNdJsHlFSqC8BAxQNbiM1kOzAqn1eD
         SQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJnRmK0ncCDj0nFXu9vcQabTdtOeOOuNwE5EAokDYRflPyuVeohh9C6+nOeqx6rXmgfjDmPv/yG1BbLpkiqp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5J+kzJrPXmMGxGCbKmWCw5W4FGSR0t1aTEHdhh7TyiBbaqthy
	Dec1VLQABB26QKigZ3cNGO2tndGgekdwKJQYU845ajwfUk+VUTeBKYAkI3cOcPOxc8/D5Fk6P8E
	aialtjSyC7UB4b/iSnZl3OpvaJTZ+PY+5eJSJNgcOZyoll+aczO/gudEEGdXTWW5SYUAvfBFwBx
	HlJw==
X-Gm-Gg: ATEYQzwc9QJ5xIai+ezq0/C3xVe7+itld2yZoRJf/gMjpEd2EuciZBktHy/KS3lGYF+
	HVg/JigYw/CNoUN0At9i+WJQcD15B+v9yuUZw9VsWwWy1nt340zVw+z9wNY2rzTJXojBjrCTTim
	7cCjYVx4BAfNfm634CAwRfzPD3nVG1roEr/eEI/BBhnVZ9wrX39KHUiSreCU1fPyfwpFQJZ7iZa
	sQUlDSLXzHdmUrk8+ZPBagoWJX1Nr2/Dzjs6oWaVICvAIQQ/dQbUAuwEAr46e4a4tXCG27hOPNb
	XJxLQfhQs9IpzdIDOT0uen69Tuzj/EF5dcfMtnperqX4I6/fnHvzPxJchi4v85fwkPFV/N/8o4z
	UhVouOEoO1BwkHfZzPVWNGWjTOn8dy6hF5KHpFm0M1UqftOc6kRF6pBEN3UUH
X-Received: by 2002:ac8:7e8d:0:b0:50b:37ff:727e with SMTP id d75a77b69052e-50b37ff7412mr200892761cf.44.1774286744549;
        Mon, 23 Mar 2026 10:25:44 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:50b:37ff:727e with SMTP id d75a77b69052e-50b37ff7412mr200892241cf.44.1774286743960;
        Mon, 23 Mar 2026 10:25:43 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:57 -0400
Subject: [PATCH v7 6/8] clk: divider: enable optional support for v2 rate
 negotiation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-6-8e7193dc9405@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3Wx9iN4TAJNUNIOuDPx1ojQxxrOnjyC9d13DLRzCvF0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlnc2mp0yKew7Z+kpW3Xf98Cp0+9W6V38r2ooWx34/
 d1RTqugjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbyOJORYUotY9/V398dTFZX
 7vviuN8r0smdyW7fSg01l3ezPh/zOsPIMId99Yp9O7b+lS+bUBc6S39t9a5tch33WqQK42xOPk1
 K4QUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

If the v2 rate negotiation logic is enabled in this portion of the clk
subtree, then use the Lowest Common Multiple (LCM) of all of the child
rates to determine what the parent rate should be. Make this change
for clk_divider_bestdiv (used by clk_divider_determine_rate), and
divider_ro_determine_rate.

Note that the v2 rate negotiation logic is disabled by default, unless
a clk in this portion of the subtree has the flag
CLK_V2_RATE_NEGOTIATION.

This change was tested on a Thinkpad x13s laptop. Some clks used
this new code, however this needs to be tested on more real systems.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 45e7ebde4a8b4d6572aa9d867a6f12f6caf8aae4..17646a06420e099b5fa3ec99d92175356c65afa0 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -315,6 +315,19 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 		return bestdiv;
 	}
 
+	if (clk_has_v2_rate_negotiation(parent->core)) {
+		unsigned long lcm_rate;
+
+		lcm_rate = clk_hw_get_children_lcm(parent, hw, rate);
+		if (lcm_rate > 0) {
+			*best_parent_rate = lcm_rate;
+			bestdiv = _div_round(table, lcm_rate, rate, flags);
+			bestdiv = bestdiv == 0 ? 1 : bestdiv;
+			bestdiv = bestdiv > maxdiv ? maxdiv : bestdiv;
+			return bestdiv;
+		}
+	}
+
 	/*
 	 * The maximum divider we can use without overflowing
 	 * unsigned long in rate * i below
@@ -377,8 +390,19 @@ int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 		if (!req->best_parent_hw)
 			return -EINVAL;
 
-		req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
-							  req->rate * div);
+		if (clk_has_v2_rate_negotiation(req->best_parent_hw->core)) {
+			unsigned long lcm_rate;
+
+			lcm_rate = clk_hw_get_children_lcm(req->best_parent_hw, hw, req->rate);
+			if (lcm_rate > 0)
+				req->best_parent_rate = lcm_rate;
+			else
+				req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+									  req->rate * div);
+		} else {
+			req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+								  req->rate * div);
+		}
 	}
 
 	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);

-- 
2.53.0

