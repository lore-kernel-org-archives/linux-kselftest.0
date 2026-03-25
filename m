Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8366F366061
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 20:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469519; cv=none; b=EC0oEAyUenHHSXoA3wuizUz3T8WRnWpRhklW5UhI7poMxxiqY9493/McyDH42tb25Xq/lXpDv1cUywHKWA3kJCJqLk3/4nM1t3t6s6VQ4c2dPYKkvOx2VED4m/aIeLF6mqTkgH17lhLGoQOCrC9cMqkm6b1o42St9PMC5GL2MCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469519; c=relaxed/simple;
	bh=AMSE7Bs/MZKuLM6hrnKnX+2i7bncB0wloo9AGDyWfUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2qf86O3+CcOG0sTSp4jO/LSljI/gFZXb26O88gK1/+D4BqiJwtM2/0SAZbXO4loy3S9ZXB70/VVfMzdzl6dW5CCJ2oif17UR9ewFSV1Izn6DTD8qDm58dYduUWXtQigRoX4k5QYVNmhwA6MeaOlMNP36tFLNeP4m1ozMUcRidI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=LKnSy6Yt; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="LKnSy6Yt"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d8b2703f37so182487a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 13:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1774469516; x=1775074316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqHZwYBZ42AZ2CSQh5u+QvxE5CToH719GXie9Td1RjA=;
        b=LKnSy6YtzsxvjgOg4Bm5JREE98sq5NRvIlyBjxVbNklC5YK/3eQeDuMcs/KyuXk1Yn
         RAADCWLm3chd25MOc9fTIopW3jIbqPXNgQMd40qEQ0eQaJFY5vx11EcdjdZP+0BxlBUd
         g95I0hK+yNh+xQSB74O90o9/qmr1Qm80EyiJ2sUe5iY9MS7Y0SumcRJfyWXxe0p1SAkt
         44lFzJx27QO8cLMn5U3Rq3h0y3cliz1LNAvuK1HVeJuDbIp0Yc7wBRvmT7M7fudeawd1
         4wLsUh9psq7mMnvwkE28rtK9REQd9JNzMsK1BS1SXP9Kcq7FDUCrkDYxVWcCuHci37QW
         9/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469516; x=1775074316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqHZwYBZ42AZ2CSQh5u+QvxE5CToH719GXie9Td1RjA=;
        b=qIB7EsHhOgKYwETWOx5kgxX8UyDsUoufXJu6HWzVWp/5EQ4xi35Thy4QGczSWxORME
         NVP7ZSedepahW+A8ur43XNUEzXT4/AlWKCTlbVyOby5yAHNsuSGSc9KObAS96zxGkOr8
         zyrprgTizpGtYBNQReGyX1LbQ0wNWJicuL/Kt4UjeSBt44bdM/fBRfOwDqjHkPDEd++q
         cqd8xq2gKBlftVV4NlOsAo98HMNMYZmTAVP1oK8uEaOulXJqK8Sc/xZnyib5OXsbt+Hz
         9j7mEaF7/eT/RmjOfOFSseUJ11CTmVggE5DQdSY1wJH6mk6UUPOLzjvfdRD3r3sOe1zA
         HxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7UVKvi5vIe0Sqj1PD1/Qyxo7BSj5gJ4FC+VUspwOfRYJVEQElHqjlAfY02NQ6bLp/G/nCnHl73kApAayvkPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8YjfIYR1h+fCKzD62S4j3ZFM5iRJAEvNiiJODblAqHKTnQEj
	VBiPyCEF7j+ov5uekoOHLCxraV/ylOz0L7E6POyZwhHebS3jVfH+iONmMyE1guO7Vvg=
X-Gm-Gg: ATEYQzxm+9N06d30N+HiFmbiWlYr+nPv3hIsraWfolbs/7TXqYbGpFHn5sEvCTh+8rl
	E2blCsobPkQGJXlZTG94DZJASgUKLT5oc0WgZwR43DvMzbw3bj9KQNDUlZpwLKhdi3PNc/hLphg
	3hV96mPJBhd/gp7hObJ4tGTSZTHFhgmZAmVTWOKb9OZbQojR2ZVrAWGPXEeNSAavBVvBZjqDLLz
	qLRL8TlmYyABVjkeQxzN9PyBuqkRfy5Vjo7ifackBEAvVGV/8k8fQ9535ze6Lc/FksRy+/BWp0u
	LpnK2gblajgXNa6AQbBOgdX+8lYaEjZMfzYVrb2wceNd2qsmFgDS2n5fMJoLNCdxYtL3K2ew3tQ
	igNBC13KgvmOkbCvTpAwNrISWybWfqFF4EAUoYlmy28Q4Ke5TGtqkOsYXqfAjNPKd2wuhIo6x+F
	HqC7D6tWfuMPhIfHhJoTbrDw8=
X-Received: by 2002:a05:6820:1506:b0:67c:e09f:39dc with SMTP id 006d021491bc7-67dff24ef04mr2529701eaf.0.1774469516464;
        Wed, 25 Mar 2026 13:11:56 -0700 (PDT)
Received: from 20HS2G4.aus01.local ([2a09:bac6:bf21:2632::3ce:1a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e0ab274c7sm549764eaf.13.2026.03.25.13.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:11:56 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
To: netdev@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	davem@davemloft.net,
	joe@dama.to,
	gospo@broadcom.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com
Cc: andrew+netdev@lunn.ch,
	horms@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	Chris J Arges <carges@cloudflare.com>
Subject: [PATCH net-next v5 4/6] bnxt_en: Implement XDP RSS hash metadata extraction for V3_CMP
Date: Wed, 25 Mar 2026 15:09:50 -0500
Message-ID: <20260325201139.2501937-5-carges@cloudflare.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325201139.2501937-1-carges@cloudflare.com>
References: <20260325201139.2501937-1-carges@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds another conditional when cmp_type is CMP_TYPE_RX_L2_V3_CMP for
drivers that support this completion format.

This re-uses bnxt_rss_ext_op to provide similar functionality. One
limitation is for L4 hash-types, protocol-specific bits can't be
determined.

Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
v5: no changes
---
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
index 1f920464b426..babcd463e50e 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
@@ -514,6 +514,16 @@ int bnxt_xdp_rx_hash(const struct xdp_md *ctx, u32 *hash,
 		default:
 			break;
 		}
+	} else if (xdp->cmp_type == CMP_TYPE_RX_L2_V3_CMP) {
+		struct bnxt *bp = netdev_priv(xdp->xdp.rxq->dev);
+
+		if (rxcmp1->rx_cmp_flags2 & cpu_to_le32(RX_CMP_FLAGS2_IP_TYPE))
+			hash_type |= XDP_RSS_TYPE_L3_IPV6;
+		else
+			hash_type |= XDP_RSS_TYPE_L3_IPV4;
+
+		if (bnxt_rss_ext_op(bp, rxcmp) == PKT_HASH_TYPE_L4)
+			hash_type |= XDP_RSS_L4;
 	}
 
 	*rss_type = hash_type;
-- 
2.43.0

