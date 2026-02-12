Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B283045948
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 01:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770858111; cv=none; b=hrLdQlkWrPkTgyenDD45KiVGH0D3/rXFU6Ne9GSxk6aXQeSYpfbrtVq0Iw2LEFiDSLVWh6O/ZaDSC41aSY7ercUYbYDhqqm+i1dSaC17Xf4BjxmaBfWSfxqgfwvy0RTe+SeS7p2ljnX9+Hb3PJXbh//05L7pky9COVm/YbD0Yq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770858111; c=relaxed/simple;
	bh=Mjn2rwH82IJpmlJxfXR9v1Sk/LuhHoeUzV8gbCAibkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLXHFx3UgSE/lGP/nVGNsEJEuyI2Oh1TwyIPw06XuuyCQ0RLf4Vxo2+ZE+6VxJZq1jyje2mhdk+PPBREGalhvmFga1iMwwX9KHw8LqCst5CNl1PzKDwa0CnAJtirFQ8yo0M3pkGPhHxwLzsgUyfbI5sBoYFgmdKBL89xrjkSTN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7dU3k2W; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7dU3k2W"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-796d68083cdso12102927b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 17:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770858109; x=1771462909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1R06yw6EKxaPJEYAiD/GC4GWXLKfIpFl/ud9jyPw8/Y=;
        b=X7dU3k2WcYUkgJLhVzbY2udeBLv97xg/YP0NtrmwUiGb/GSwVtIiF1i7+jzabHjnHw
         Bttk9SO1BRd6sH6f2SymOjJhnRQpkNBwrVbL/1HyNDTpRR1jWTYmZn3Xe6iHaAeJT1eQ
         LlC3crS47iWNwNcdRNtcVo/ecPtWgPfCawpoWLZXohUETlt4H89WGIedm7y6wNdxnY6x
         EelmpMLNWuk3g6Tm4HH2of0Brk6UL6tlPxIUOCqgT81ezlKG+eer/hg9IrfPi/fzEEx3
         NJIFnEmwDaB57ixctX84JKPDD1ebKaC2r4qSlc1CUF3cfVzMHT9HJfiWjELr/VV1gym2
         EouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770858109; x=1771462909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1R06yw6EKxaPJEYAiD/GC4GWXLKfIpFl/ud9jyPw8/Y=;
        b=Vcoff03CLHNBVcmEAiksNie2dKWQADa1JGO6NgZvgiZ4lv0VnjcnO+s9Yf0Hduejgx
         bs3oqC+6Ap1OUFBYQHABlglgOoN65qw0cuvpy2BrLu8TN+9ri5JfR79k1CQbK/F/gHrK
         1qIewxdv9u2h3TS97oPzHY163Sgmw0Auvra7ELYlCZAQdIQ8MD/mSj9HKkaPBPVKCqoQ
         LrDfkpNcoOvvnUYzA23fx0kQTYJhKlW0H+YNHI0sJKlWb5QPMyh9uY8N4y6OAzjqK6wv
         oZaAsRdiUpyp0emsxySQTI4iMwRFSWJVoupMakY1sDg9G29efs4l77Nm98PJ8NjlteW7
         oPQw==
X-Forwarded-Encrypted: i=1; AJvYcCVOnFg1Q+oBahFF9af18bnvX6KBl05RD8GT4auDeyMjYVsTuurhc3+V1SqEOL/sPU7Ctg74F1mHuojpAgmHxY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDz4LxySYtV2WGOLzvcDG/IDni7kTKp2uGDttlebHD85xsUT4r
	uUi+yLvyNcv7iN2/ae6wgBlwQISAAHbUnWOEIvFZpmotNNzQj8sayeak
X-Gm-Gg: AZuq6aIlVNmPNa7JbRm9kSEWSnDoKDLvYVhvU9dBCGzXMhuiETXIcB6+b4L9UcUazYz
	FK/nVcoOOgXPA4Z+9ddPHknVx3hocCBCPh7TSZAk90H9+rjrgizoHCPdp1dW/R22TMC/7uBfqbr
	birsmvTNMbC/3dbqLhr2rM/CJ5FmCzUV63kfDInzv6sH4eLikzxH4b2mJWnPCeG6+Mena61cnqa
	+zLtIch35vCkg/CfKXjwxmo+g7AcJmpCQXCU/UK+DEA4sJe9rnQ0J43JyaQzVdO1vE/7Yw2Ysu9
	QUEs7aE3eDiFK1gOjc+th5CXE0pihaDfsnpC+LmlhCrsh8Wnmt5NQF/0dEkUBABHO3SRX3J3lAm
	KMTwt4GHcvuSUo7tWZz16yIN24rIq/xIQ/1BW1q3OW5IT8ZDGbcO6ZN7SRfaGggTJJ7my/OfhMQ
	+JpgriZJ3J2/J1YIKu6w4RfFLa01l4xAIs
X-Received: by 2002:a05:690c:802:b0:796:3e25:3e95 with SMTP id 00721157ae682-7977171b436mr6476207b3.18.1770858108692;
        Wed, 11 Feb 2026 17:01:48 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:4a::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c254d1esm32678167b3.41.2026.02.11.17.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:01:48 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 11 Feb 2026 17:00:41 -0800
Subject: [PATCH net 1/4] eth: fbnic: set FBNIC_QUEUE_RDE_CTL0_EN_HDR_SPLIT
 on RDE_CTL0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-fbnic-tcp-hds-fixes-v1-1-55d050e6f606@meta.com>
References: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
In-Reply-To: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Mohsin Bashir <mohsin.bashr@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Fix EN_HDR_SPLIT configuration by writing the field to RDE_CTL0 instead
of RDE_CTL1.

Because drop mode configuration and header splitting enablement both use
RDE_CTL0, we consolidate these configurations into the single function
fbnic_config_drop_mode.

Fixes: 2b30fc01a6c7 ("eth: fbnic: Add support for HDS configuration")
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
Acked-by: Mohsin Bashir <mohsin.bashr@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 13d508ce637f..e119526fce14 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -2575,7 +2575,8 @@ static void fbnic_enable_bdq(struct fbnic_ring *hpq, struct fbnic_ring *ppq)
 }
 
 static void fbnic_config_drop_mode_rcq(struct fbnic_napi_vector *nv,
-				       struct fbnic_ring *rcq, bool tx_pause)
+				       struct fbnic_ring *rcq, bool tx_pause,
+				       bool hdr_split)
 {
 	struct fbnic_net *fbn = netdev_priv(nv->napi.dev);
 	u32 drop_mode, rcq_ctl;
@@ -2588,22 +2589,26 @@ static void fbnic_config_drop_mode_rcq(struct fbnic_napi_vector *nv,
 	/* Specify packet layout */
 	rcq_ctl = FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_DROP_MODE_MASK, drop_mode) |
 	    FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_HROOM_MASK, FBNIC_RX_HROOM) |
-	    FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_TROOM_MASK, FBNIC_RX_TROOM);
+	    FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_TROOM_MASK, FBNIC_RX_TROOM) |
+	    FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_EN_HDR_SPLIT, hdr_split);
 
 	fbnic_ring_wr32(rcq, FBNIC_QUEUE_RDE_CTL0, rcq_ctl);
 }
 
-void fbnic_config_drop_mode(struct fbnic_net *fbn, bool tx_pause)
+void fbnic_config_drop_mode(struct fbnic_net *fbn, bool txp)
 {
+	bool hds;
 	int i, t;
 
+	hds = fbn->hds_thresh < FBNIC_HDR_BYTES_MIN;
+
 	for (i = 0; i < fbn->num_napi; i++) {
 		struct fbnic_napi_vector *nv = fbn->napi[i];
 
 		for (t = 0; t < nv->rxt_count; t++) {
 			struct fbnic_q_triad *qt = &nv->qt[nv->txt_count + t];
 
-			fbnic_config_drop_mode_rcq(nv, &qt->cmpl, tx_pause);
+			fbnic_config_drop_mode_rcq(nv, &qt->cmpl, txp, hds);
 		}
 	}
 }
@@ -2654,20 +2659,18 @@ static void fbnic_enable_rcq(struct fbnic_napi_vector *nv,
 {
 	struct fbnic_net *fbn = netdev_priv(nv->napi.dev);
 	u32 log_size = fls(rcq->size_mask);
-	u32 hds_thresh = fbn->hds_thresh;
 	u32 rcq_ctl = 0;
-
-	fbnic_config_drop_mode_rcq(nv, rcq, fbn->tx_pause);
+	bool hdr_split;
+	u32 hds_thresh;
 
 	/* Force lower bound on MAX_HEADER_BYTES. Below this, all frames should
 	 * be split at L4. It would also result in the frames being split at
 	 * L2/L3 depending on the frame size.
 	 */
-	if (fbn->hds_thresh < FBNIC_HDR_BYTES_MIN) {
-		rcq_ctl = FBNIC_QUEUE_RDE_CTL0_EN_HDR_SPLIT;
-		hds_thresh = FBNIC_HDR_BYTES_MIN;
-	}
+	hdr_split = fbn->hds_thresh < FBNIC_HDR_BYTES_MIN;
+	fbnic_config_drop_mode_rcq(nv, rcq, fbn->tx_pause, hdr_split);
 
+	hds_thresh = max(fbn->hds_thresh, FBNIC_HDR_BYTES_MIN);
 	rcq_ctl |= FIELD_PREP(FBNIC_QUEUE_RDE_CTL1_PADLEN_MASK, FBNIC_RX_PAD) |
 		   FIELD_PREP(FBNIC_QUEUE_RDE_CTL1_MAX_HDR_MASK, hds_thresh) |
 		   FIELD_PREP(FBNIC_QUEUE_RDE_CTL1_PAYLD_OFF_MASK,

-- 
2.47.3

