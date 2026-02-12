Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAC117D2
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770858112; cv=none; b=RV2nYB/sQLMsDOwaeVu4aY1m1bgNNH1xNB7BQuZ2gnir/o0GKOalKLUSQVY8olBmKsEc+GXB8+6bXu8SZfUhAafHIv9UtnOcp42XFQePj6MjU5t3kGzspi1v0yhuFIb/yj7wSpMH5cA0kLJ2IoJa98Jo1J4TLSA4sfyxGepu63w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770858112; c=relaxed/simple;
	bh=DhtLQdLk4//tf3IWa0sFbqjSiWxG7QTlVQuS6MoOfc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWt/oQXkK8p9PgMAZoQFm4Qm6i9S+tOgsVq1eGCZC6j9iAM2Qro/kRSZXVjabgcCRgHRm8sK9YAla/UISdb+ryUR3nrRy3dfHCYPvlubVdmXbXu7C1pVGdNL0oJLwLi1dlCgvAMNlWaERs7ZDd9ttiVUhiCTBGt3zq0ne6ElhRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DElgZIuR; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DElgZIuR"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79639c2d2b5so48151097b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 17:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770858109; x=1771462909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaO2rgLLeJsYAQ1JVqZj/x1A/K/JlZAmp0S9Yly7UAI=;
        b=DElgZIuRwrVqzcIquXrLXlvujcgifCyWFirZ2r7wQrvjBZyqVT2ZWd7S5Slcw1uxHg
         PK/E0bF7p4DYE/2cO3M3o4dZQhl0U2kwCv2i/VOyyp/9i3YMQawosLBeQz+9aBvHAiuk
         EhNrocWhmVn5khubTjAXqk58R8KKIFiuvmVTP9Gw8tg746VsBcTWW0/EvUjLEr7U2srV
         +/4hg+RKLtSE+5N/pqrvemAdpWhitKuQhFN/9tOOSoLFgJOZkYP1zaNtfsEZZ5oi8dM7
         E4KkJSwyo3lZ2erwJX4VoWrHdDGzVRm0ZOo/mfPh7G5j/IuGkIkHAAZPOVZljuXDb8mr
         HCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770858109; x=1771462909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HaO2rgLLeJsYAQ1JVqZj/x1A/K/JlZAmp0S9Yly7UAI=;
        b=FpwsEK06+0Pm93suH60FOWqWwayvymbDrZC6jIuSMNqlTRnA24QtaDWFh7wY7k5MXL
         RO7lw+YDi18DQr+qXsNXLHwibziZHpeCU9iCC90+EAg9A2VWX3hW3H6YBKttcfdap2Cv
         QdvoO/+wy/dqS3Mw16WueAFHRDbp+pqdRhMqIdTscYnQJzOSqbN3WFxQ5lD81OBr0lGI
         Q3Qu2T+5Jp9wLcvds4AP30bdm++tE5H2LqVpQSsXn2n+xg4LeaeW4N61v4paF70p9gq7
         7TTOhM4D/JwMDyglqcyklopi01eKHzSXv8pTS213T5EY7zruaOdm6LswcYmXw/o7xRju
         xOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhx3RtfoApyeW00+V4ecM+jcZDdu6cnyutHVIl2qXeWMxq2TOG+dk6sx+i20fzrBLk6Gh1tnvgGp1haDgPUFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5gJSKRUIIM5uoKFZAuSqWRQOSLwfptvC4DMONP74xHaAQVAPG
	goaI62eSbo72P1qi3NdyfkJ+5ekjMU3vGI63lwGr4dT9G8sMJcsRX9F6
X-Gm-Gg: AZuq6aJ20dDUewRaA2T5Xzi3YP8zgGR2KQ+MnmCcn0C+2Wdyr9pXHLsBqJHiycc2G0t
	yn2BQEZrEmRGA0ObL+J1RO0lWUL9mE5rwkd8/WH14jvVC/tDAT7fyjEXnbh4VEm3fN/0Mhv2ew6
	ghZOCAWWe0y7VmjQchWexntnLaVkUVJynxqG0rRXjpU9oSJ718r+0qqTgnbQze/h4YqrksKRdxR
	KLEwF+yb8Z4RIlAHDVhxHRYrSyFYC9p1Wok47hX7tdLgjrDhMMJAiVixLbF/S/CFkAOQRg+rFvG
	OtivKbDp1NNyI/Vy9O6RycXqsrPnAg/bU1gqshh2sVuYqJpI0BxTPr0aPZ9JFhQH/TEgL9Tldlu
	ackrjgnDLnm0RFBK0wl+tGGZRPFpoka8DCyKcD47TZAuoyz/p7xm+GeeNHdFDu20Ro7qYT7S6TF
	9I+ZZyMRvwd/Oxz+gVfDDP
X-Received: by 2002:a05:690c:829:b0:78f:a5c4:791f with SMTP id 00721157ae682-79737673ad3mr10749977b3.54.1770858109608;
        Wed, 11 Feb 2026 17:01:49 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c18b464sm33329567b3.13.2026.02.11.17.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:01:49 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 11 Feb 2026 17:00:42 -0800
Subject: [PATCH net 2/4] eth: fbnic: increase FBNIC_HDR_BYTES_MIN from 128
 to 256 bytes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-fbnic-tcp-hds-fixes-v1-2-55d050e6f606@meta.com>
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

Increase FBNIC_HDR_BYTES_MIN from 128 to 256 bytes. The previous minimum
was too small to guarantee that very long L2+L3+L4 headers always fit
within the header buffer. When EN_HDR_SPLIT is disabled and a packet
exceeds MAX_HEADER_BYTES, splitting occurs at that byte offset instead
of the header boundary, resulting in some of the header landing in the
payload page. The increased minimum ensures headers always fit with the
MAX_HEADER_BYTES cut off and land in the header page.

Fixes: 2b30fc01a6c7 ("eth: fbnic: Add support for HDS configuration")
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
Acked-by: Mohsin Bashir <mohsin.bashr@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
index 27776e844e29..51a98f27d5d9 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
@@ -66,7 +66,7 @@ struct fbnic_net;
 	(4096 - FBNIC_RX_HROOM - FBNIC_RX_TROOM - FBNIC_RX_PAD)
 #define FBNIC_HDS_THRESH_DEFAULT \
 	(1536 - FBNIC_RX_PAD)
-#define FBNIC_HDR_BYTES_MIN		128
+#define FBNIC_HDR_BYTES_MIN		256
 
 struct fbnic_pkt_buff {
 	struct xdp_buff buff;

-- 
2.47.3

