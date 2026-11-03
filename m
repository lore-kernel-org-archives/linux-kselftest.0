Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749922;
	b=dJ6Uh2CKROCwO89mj7p1Dc3DfeDJDZ6fdW+RL7OgfcHLkQCwveSkhDF30uB+NJPLfAJ5
	 FjUGcwyLagTmU1zPbTEgunoBBCUS+EsVYsNHrBh7G88CgWc6Wr/8jAW+wQytUkoF72x2h
	 Cj+7jG3tLFToLRt0KgJcUk7hr6FEOfz5GJEia3UvbZub50bHBoQJ+edbcL75Xm5208CWo
	 TNQ2OMgRcq72+Tw2v480EcF7WO//wH+tSylxTMABZen/kaFgWlDUwe/YsaSpOZxiJNgek
	 IIDWCEizouq50wAUMEkyhP5Lqq0nKnaplRNwv+hEpUxJfOiKSjznf+H3qfz48yv5l4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ISoGhcCNNYayXnvzELOl+oJCyXpnYMCHuTL7kvKeTX4=;
	b=TLbweFVPTP9Dk3z1GbsKYMg2Hb15eSmQBsKr6YvcXFqJx56dPaXxaOQj8ddJj37LXAPS
	 VBbeIw3rZs+j51EAeLpFA7A9RAAIM7DUdrYtQMJ1rfgpgDx7/SaNdnhjM5jKaZyF6Vxnc
	 apLvAVuTq164M2nXSM6Ce3T7xrk+ytp9IO4CE9PYfnJ9quC/xVG+8i1T1S3+oIy8IIABv
	 B9jbYxAZVbtdOt1licJgnSlW5Bdwnq6xSiH58EkChwodYi0C49MUWCCoFJ7A4pXZz+ssU
	 4F2BuoRFa84rfoAk1haCygtIK9kUuVgzpTRWdYjqSv0gISjbaOtupYyKxoBuqQre18A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDIPQIU+;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5301606EE83
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5301606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDIPQIU+
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-1379d236149so45505c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749921; x=1794354721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISoGhcCNNYayXnvzELOl+oJCyXpnYMCHuTL7kvKeTX4=;
        b=TDIPQIU+eEgw4o0cUbF8C3770HMTkrQOKM6qhMk5pKVPQTT+BVDahHBjq2+/twmgQV
         S0+gn/+TrWmsEL/xPSlFBScJefiABWlsaNNaX7D4IVGe9KSSvTWTChod9uWXMl93Ko8s
         x5nJQb+8/MmBnrLV8avr78N6hIi988DNFRP0e5g1mMBGsaUCbmtN7+sUdFkYR3ek8rO6
         PdvIk5zy4l/gzb2qLKlL3C6XpYOkLBD+1JL/ffRT/p5yd7/QrW17ZlaM0HO1djW1uGoE
         POxVNfVuC6HArG4Yo+AU1KAwBPlRjQ26micKU9FQK1KK5UWqojZq7BB1ZMMOtrX4MFRZ
         OX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749921; x=1794354721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ISoGhcCNNYayXnvzELOl+oJCyXpnYMCHuTL7kvKeTX4=;
        b=VJwOeJ769Lhs0xK3/CAxnChvT2KA+KKFzT+uabtMj4hRkhMMPJOalbz0kHgojMhe1D
         gQdnGU4ZgFyRjbAizkQzyVRiWVTB97Np+oDoxQHb3iqO/5SJynXP5najjfyX7GRQqSNc
         TjFfNXZxIc0JqPwO00WdFkPIw/NRrusN9YduKt5E9jyxg3I6w9Z7rR9utCpKqA4FnPWE
         nc4YYMXu4ajI4FNoRve6Iajg0/OTm6y5sbh9/UkHcw9CUe57hVBfjmmUgOadMRrEhsbT
         eQ9K0ayAPMDJLZjWJrNfY73NQm2Vjb9CulsDWlcN05jCMOACFatRfJDdRxiYSOlvzzZx
         VWNw==
X-Forwarded-Encrypted: i=1; AKwUvBwa+BXdjREY9hPjbodmsSvhWUwB4E3Ybo9VA1znN5IUyuaCpaUjr3EGdDcJDw01HnFi9HeWWlvHaM/iRB6uEag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m8KECkQrRysWf7v6sxiLxx5jCLMQTiJ+PswNsV0g4UQIcvFVK
	3bb6CJMH6brT5GKsiZ3Umla+NP08OmMC7hNLtsvZHynoZeu2zPlx/0/o
X-Gm-Gg: AYBFou23i1RqylMyxn4kMDf+woJQ8jOHJf5kKUyFpnN+YBPeJ6JbiO9MIjVZ7UWE5T6
	nzIhDBtnPBNN3x9lnV4EuQOaH1BjzhCg0o0ZQyTN542/xOfP11W0DEx2jxKhoMzEBgmmHnilQCX
	BTqbJtJrDdPM+UlU0bIaB7VcxSuJSPBTymxQ01h5B2GKx4PTcbdZa61c/eQIDXdb7AYfoBNsHlA
	lPTaavC4ZngtbRK/8bxoR/yNJ5sDRk06YpQnzZDtrhvUo9yO1Z0bMzmLt9KqHPmct4MHYhDszBV
	WO79IKylM6rE9845n4RY44jiTkTNHw6kXCFtycQqcUb9lGy4aaHG+2wdpTx1UlI9395JzDxFafA
	Qi6Tgy9APvl0WV1lfj363XKysbOf+eKiBT15zwW0DTrVpH9SqEdXb50bOWAfaNY1Ho4L5/AXpFo
	QcXPAZwPcl/KMfAKsBAu/JOsAg3i+53RtNI4R7P+uXO45xYrInSthwItsxdTQKYTHYQxX4BxoRS
	TmS4gdFoHuhIBuBv7ULN/EAKZpGylJkSCWVMXWBASq/C9PWBDbXVHR/pP7oi0FV2GAti5kqTM00
	JOzOPR/Nh78Iulz2cv4HLI0=
X-Received: by 2002:a05:7022:3f0b:b0:1b1:f02b:232c with SMTP id a92af1059eb24-1b1f03a6a35mr12004352c88.29.1793749920767;
        Tue, 03 Nov 2026 15:52:00 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2855464c88.15.2026.11.03.15.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:52:00 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 5/7] bnxt_en: limit netmem TX frags to 32KB
Date: Tue,  3 Nov 2026 15:51:50 -0800
Message-ID: <20261103235152.1904727-6-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

The TX BD length field is 16 bits wide. Limit netmem TX frags to the
largest power of 2 which fits, which keeps 4K aligned frags 4K aligned.

With 64K pages this already applies to PAGE_SIZE net_iovs, whose 64KB
frags would otherwise wrap the BD length to 0 with BIG TCP.

Tested on a 50Gb/s NIC: devmem TX from a 2MB hugepage-backed udmabuf
runs at line rate with 2-3 frags per 64KB skb, none above 32KB.

kperf output (sender side, 1 flow):

  client: == Source <sender>
  client:   Tx 46.358 Gbps (174483046400 bytes in 30110590 usec)
  client:   Rx  0.000 Gbps (0 bytes in 30110590 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:           729   153 599     48    0 13893632 3147
  client:   net CPU 71: usr: 0.03% sys: 0.06% idle:67.62% iow: 0.00% irq: 1.12% sirq:31.14%
  client:   app CPU 72: usr: 0.16% sys: 6.01% idle:90.66% iow: 0.00% irq: 0.83% sirq: 2.32%

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Acked-by: Mina Almasry <almasrymina@google.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e7a4190a8c78..c8a887facc20 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -17439,6 +17439,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (BNXT_SUPPORTS_QUEUE_API(bp))
 		dev->queue_mgmt_ops = &bnxt_queue_mgmt_ops;
 	dev->netmem_tx = NETMEM_TX_DMA;
+	dev->netmem_tx_max_frag_size = SZ_32K;
 
 	rc = register_netdev(dev);
 	if (rc)
-- 
2.53.0-Meta

