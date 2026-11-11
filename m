Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437266;
	b=zmDo3X4I6bBVV1RJFOpkSU0ZC7p8CkjfTR/bSeR5xZgars+vhdtTR4wrI3696tP6ROgX
	 jmjuziIDW8tnHi67Vc9+bnqBsDHNnsg+7MWLo+feliCbGK4zzhhI6qgRxAPbDj9Iys7As
	 B0D3170+WPhnwDVTWIBshSjOyUK0XJc+pGkGuoonNc/Bui9g+XIlMV/yMfrrFKViRwtCI
	 EtLCoB0hP4W+t7q+S5V8eiuRRLbuh8McwkaTMoEOnOxBmkfWDTx2OrKgWRq+nyf8+kyAg
	 lDdRDe1PAGQ7KnNP1/mv9udA9M83SI9dGYVfAuhI23YkV0RJLrbZUXUFg+VFaBB6HiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tp4FwDBE4d49Hi9WrTjNIMNYb2nVWF+rLrH6T68Pxk4=;
	b=Nc/mxhcZbLYE9p5zRT0aMeKiSh3HUx3lwPCFqkdQ/K2UfHhbPbHEaZpm8lWCaOu0L7Xg
	 WWwX+aGQBE3X65TDfwc7CdOsPGb6OLM/hDCrwJAhgvTwkmnhbBaDKQjbOUeg+VNCW/i/t
	 62Oo25zfXapY9eW6MBD3X7scBIE8RfgVQmDTUxheROw+rF2SkTSxNKx3771X9MWnBsw5r
	 YEryoJd6aI78pNY9OyOu5BfmNmTwwqHK8VDP4BnBVinnAAvbFJGYIQO27vL7hxPso04gS
	 JWaTg59r3BxvNE9ibEST8aRvS5KOKbw94mHWIOx1Pc+4c4F1RO/0r+O1VUiXPN568YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LLuo6V/7";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77907606E2B9
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77907606E2B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLuo6V/7
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso2239887eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437266; x=1795042066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp4FwDBE4d49Hi9WrTjNIMNYb2nVWF+rLrH6T68Pxk4=;
        b=LLuo6V/7kIsfNKiTCG734leNRhC9dyI/J8vOcEIJ7nHklg/FevWrQTnrhiRgp0MDf4
         ljL2KVoCzseQ2GNnAwyATO9XCS4ckFDZ0RbEx6EwB4IWqje5bupXLy1wqgqrYhCyz/Kr
         kg1K35thVoKr6zz0wLAzm0MA0hTwUGGICCp1EBVVZhvmNbD8gkt1yTckU3hCP9O6GiLE
         6P0IfwW/i6lEmzLVUTNYvfnqFMSvzMEUKGqa0qIVQQgZJCNjA4xwVkoznQyjVYzcpfBx
         ocjjzHxI3A2PkgiLRQ3K73ZT/cJVVeaAsrgfw3DCP/+xNXD22ctrZYrh5wLNPJZtq7Yr
         Hbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437266; x=1795042066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tp4FwDBE4d49Hi9WrTjNIMNYb2nVWF+rLrH6T68Pxk4=;
        b=0rL73YdNI/HeOaLeVd0dgJVSsTpdLJbTIVS4zNqBrIbkxdfz5gKHEH8arxpPvIp3zO
         +uZypjnWc5OQ7v1OVulMiFJ1UP/craTzim4seLm2W7edB5ZbDB6n/IPKi7i/5Aym+A3Z
         KTjU6k54WG5gv5LAckhrzT8VujRZ8oTIKbl0+BLZyiYxkFMVZ3eHvAvA71EMj8PyOBkD
         i8oz6Bb3iV/FO/TGWWfirHd3unqNfahLqRE6J66REulV60wp7xu/8S2kW110rTTkMi/e
         o9cV3dIOGgTZd6nGDgc0S6XaXnptEzM9KcAL/qelRIP0q/wFwUiQDRQ2FaQjmceL8OfE
         VySg==
X-Forwarded-Encrypted: i=1; AL+hErFErdFglhn79Bzw8JwZ0NpCWSQ8maqUqLTQhhRGfgnjk0gDh2xdLdgpOC+CPyx76x0+9gNpK7epiWzMQvu35T0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xHShBBzZ8hu56CSqFMO2e4PnTROuB9F1T4Z9UH/T0hVQ2jTKG
	wNXat2COA5Om8cdd7L9ctS0zYwukH6Iu5qM+mTi3W61b8s6Im35GvxJT
X-Gm-Gg: AYBFou18uImVEYJ3Llw89dp4cd7NqKxSCiNkOteaAlnT0o1Q++S8+/u//f1C+uF1i8y
	08Jl3Fr9MGyQDooRpWG72KDWyK7Gjma0wRcUHkqQw6Ozidt4RNzHovzNPlKOQYtuCnrNybzd0YN
	nVEbwldSL4b5JyyjO1P51sWP28LYVuyuWjF0/O7VNT7TEOFzMVGZXOtkVbM/LKQ1KwuSdpyCIjD
	TZX74wUMnNTe1C8Ioi/DczR4FU/9yNqJNwWz81ku26lfvmUDN6s/GBe8sPBZL5gFokIj8iafSpF
	by1ogeETxbLzbfp+vbwoHGt7EEE0a6q3OTWVjsq7a1Ie4aHOvB5Xqm3fsa0PhTOY1XOrE5doU4/
	70TPGfTa1GWPKUxFWi/WO4FzLPmxLpaiy2VMObl6itgv5RtAi7jaFdDw9mr+ubrc8niCTClr5xb
	DXA/U457Y4U9+LSttOp/kAr2bx0pCfnWkMzOmbkaNkkCBNrPvJMk5OYrqJGR1lDWPQKIp05vtOf
	+LaKlI5m2CIklsL4uFi9DFU6sSO0IaKsE8dE85Cpv3uk+qstTJA6ibRHWwCvThl2KpXy/eU5Pzh
	PQ3svV4z5JbYEEUEv5CV89I=
X-Received: by 2002:a05:701b:2610:b0:199:e38c:29a0 with SMTP id a92af1059eb24-1b3c03390c1mr3026458c88.31.1794437265699;
        Wed, 11 Nov 2026 14:47:45 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:61::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm19170807c88.2.2026.11.11.14.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:45 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	almasrymina@google.com,
	sdf@fomichev.me,
	leitao@debian.org,
	dtatulea@nvidia.com,
	asml.silence@gmail.com,
	bobbyeshleman@meta.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 3/5] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Wed, 11 Nov 2026 14:47:38 -0800
Message-ID: <20261111224740.2744522-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
References: <20261111224740.2744522-1-sdf@fomichev.me>
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

TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
Derive the index and offset from binding->niov_shift instead, so TX
bindings can use larger net_iovs. No functional change, TX bindings are
still created with PAGE_SHIFT.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/devmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 5c7d9640e9d1..c6868f39261a 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -581,13 +581,15 @@ struct net_iov *
 net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 		       size_t virt_addr, size_t *off, size_t *size)
 {
+	size_t niov_size = 1UL << binding->niov_shift;
+
 	if (virt_addr >= binding->dmabuf->size)
 		return NULL;
 
-	*off = virt_addr % PAGE_SIZE;
-	*size = PAGE_SIZE - *off;
+	*off = virt_addr & (niov_size - 1);
+	*size = niov_size - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->tx_vec[virt_addr >> binding->niov_shift];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
-- 
2.53.0-Meta

