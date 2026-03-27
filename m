Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADCB386540
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639961; cv=none; b=g+7Nhv4EQdFdTflZ/qlD2htneHF7peygb7Kw2m1UKrvw3M2y0Zdp9pHqGJr/EhFH2/poB7V5BS5jOtuih0y8VMn+IpvZb40tvptn4q876XQyFaLYHkJ3WLT3KmC9XHXLW2Lhqe9Slp8yCkMCN86mXR0oXdRmaNaASwlk9Ov4g9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639961; c=relaxed/simple;
	bh=gXVpbmRUrHdkNzhTN3R4KUVLypWKOnrMf6+semS15g4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dB81OPL0JzuqO4gyFqX2B9yLkq6joaRAz5194F6GAjHX4HwYP96oHaHbBif/cyIQFnYvROgjBYpcOk09jNEG9tOF80/8b7cXXXyRcdBvJLXSYTwe6JnqSPpf6wBpLZaG03qUXpdNJ0JWg3sNFO1Qk2SqAUuw5cvXPhTI856ulBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LsYBvlTJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t88oHAkl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LsYBvlTJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t88oHAkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ZgY4uNXXpUewj2oPb0h5vSVFwi5Pty+WBlLPC/6hjM=;
	b=LsYBvlTJgeUbxGWH3GqGpX/3cRrZgy2KirR7fed6k/8LqPly92AtnSjwcX6FXO+XDBDx2S
	+6RE1TjhwX/P5FeqnY1xxitbpI+rHgfS7DbHH6tA0Eqs0z7Ll8RsgTxhlxTln1OKKZJpLV
	sEbjytcDEj1BEL3zOb8XmbXcCScQqDw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-kN9TGbTaN7C5eNdGkopc7w-1; Fri, 27 Mar 2026 15:32:31 -0400
X-MC-Unique: kN9TGbTaN7C5eNdGkopc7w-1
X-Mimecast-MFC-AGG-ID: kN9TGbTaN7C5eNdGkopc7w_1774639951
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so17220121cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639951; x=1775244751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZgY4uNXXpUewj2oPb0h5vSVFwi5Pty+WBlLPC/6hjM=;
        b=t88oHAklaGjR7LGaJINPTvG0/dmb/SRFE+vcS7XTNbSdEXZN7MXsBfAPPDHzkWbrBs
         +Fd3fIWsHyaYQkDiR0ZIXWyiT+n3d8VR1L3ntjuhcKcbGQjCyySgeupEUAlh0oeWzxq3
         LHRs2iglLbclQQEmgZ8qfqBDE3eawQSkmtbPKjQuRhmjY4Q/0QkDFkznmK4Bp27Q4EMy
         g/IPAcUVejVwn4MSO56M0GSClx9B3AYsQAUbqnXaxt65NmMbrGujXmKq2yHSQw9O2ZsT
         KWRDTAgf2Ly8qQcOuGSPX6g839VuY1woZID6gGXpdOMqfv3j7ZU9jxmupBwOkJXZc/zV
         WJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639951; x=1775244751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ZgY4uNXXpUewj2oPb0h5vSVFwi5Pty+WBlLPC/6hjM=;
        b=PlHfSWcmFNB6G8yBc5pWYYFM8OH+gbJn29PlusEEgpPnzAtfcACEzMG49WgycUl9Na
         B0CMuSIzah2J+nT0zBjqZsV6Q59+XG9qXnwjEk+p8mVdUFrRMZ00f1xkL6MmVXJN1Utj
         XqUiRYCvK9pr3jzIqgCthkXk/ckh4RWEF4D0LEPnnQ9/LHqh56vUp0v+P9bAQ3VhshvW
         q6cncxUARlDE/8rIWxinzFQ+LC13OX2IBt0Br/hobGY+Zdm+4oEPrqQiHGUoP/O8hBL7
         OlxUOvCD/Rpw+z/HeT0XEMiajmjijIPwJvQc6bQbU6kJf6olCD3vnPj7BGyRpI7n0ROx
         OWKw==
X-Forwarded-Encrypted: i=1; AJvYcCX+sNuucxEP6CwCK/acWEWOYZv45o6lhOlxy5ZdoGF4OXrfvP01Uy93uFm4tm+qBQQa73XwBB2R7HykZ9IzR3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FwlWcfu6ca0D7l+CHvx5cWM/NY5b+6QVWna2P8JBvpUFaD1y
	8r4T8onol2rTB3/udTkedFeaUqVJJ5nU23fxgRquQaSalERPtBsgCwgvm0Aiszi4rOfBk5CCENI
	U28kMy+NbvHU8YfG8Uw1tFwB+ZnIFKksLt7uEG9fTmlSarleND6tEfQSy6FvBo7e6pjCvFInbnP
	WAoAaVZ8/KjTRhhIrVonOUirWIkAVl5G2MDPKbxGenF0EewKB9iyZN
X-Gm-Gg: ATEYQzyTDqRcRlYaa9EJ3M4mk/75AKLj5nB9lpV7wFaUsvbHN6i70LWhjgfBNwTbNrE
	LXAAS2N4C8hn3E02RQCi2lTnbZnu1GE3J7Yh1JjwW5bA6UUmuXuFxSrSWwj8bRDKKQWELs1WdFE
	j/DJ4mzRV0yKms0NPMv+65YpVGUPvRXdoSrqbqIKs51ILKX6Ra98MCwNcycT26wA58QAbtPm7l2
	gCpMugZCl+SaoKVGHRFxo71NHgLy+NwaB/DG3lGiKaK8wkA80mQh3oLYS2MPBa/3rgOdmpdxlLI
	yHXHNZj7HD1mAVSLryH5oxGYlRu0MPGec8UQrm7HJdsMN3cRy4xVqinqJCnelR3l753AZSwC+N9
	9Vypn7CNhjgIpyMe1kGNVI2uG1cSIZB73AHge0SpQTM5ycOeJz7+cPX/7UNZc
X-Received: by 2002:a05:622a:a13:b0:509:609:b2e5 with SMTP id d75a77b69052e-50ba3850a4dmr53544551cf.24.1774639951030;
        Fri, 27 Mar 2026 12:32:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a13:b0:509:609:b2e5 with SMTP id d75a77b69052e-50ba3850a4dmr53543941cf.24.1774639950336;
        Fri, 27 Mar 2026 12:32:30 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:32:01 -0400
Subject: [PATCH v8 6/8] clk: divider: enable optional support for v2 rate
 negotiation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-6-86cd0aba3c5f@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=gXVpbmRUrHdkNzhTN3R4KUVLypWKOnrMf6+semS15g4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3XaoFFYW9lDr0J64RWUVb4tm48O/K9dllm+aV51l6
 iI/zaGwo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIn0ZzD8lY1bbiRvx1pQfYGl
 ZwVrktyKEO5XbMop97eHZTvetU25wsjwor1gZ5qy8PaHurndx3xYXb88lXU4XD3fMO/0nWP7p95
 mBwA=
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

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 45e7ebde4a8b4d6572aa9d867a6f12f6caf8aae4..713f3c0baccb13bfb32581a5517da21720b34961 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -315,6 +315,21 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 		return bestdiv;
 	}
 
+	if (parent && clk_has_v2_rate_negotiation(parent->core)) {
+		unsigned long lcm_rate;
+
+		lcm_rate = clk_hw_get_children_lcm(parent, hw, rate);
+		if (lcm_rate > 0) {
+			/* Validate and use what the parent can actually provide */
+			lcm_rate = clk_hw_round_rate(parent, lcm_rate);
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

-- 
2.53.0

