Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749919;
	b=i3vx2xaPJNuV+oQg3oJFyTDryoEUkb/bf/CYmyLMiE7eDraDUObAbl2R7qJ0vClFNBvM
	 FLXYkh1VOYyr0R62mRRMbwA2GlycFe5hBZUtboHUCymODjgSvDUtzl4gigLZHNTtuhslP
	 Ou6Z8MQJjNuo7OyGwLiF9V+hETyXhE0zUZeFfY8VSnmPEU6zx/f7ZsssvJsI8lBjw8Ry2
	 /2sv65CC+rWer4AvTCLH9ZwPFRdpTbVioYFCJpu5MxBKBWBuP6g3KUKnzuK46JRhUiVcV
	 PEf6I1ff8v6MhTU/Updn92KA3c+LfoRCHF8u7xAIZoWJlMCMhoWa+VbywhGfbnZXMmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
	b=fqIXVRcajmEavd7z/t5IvsHgTVNhQpaxyfn2/J7wrRVUja0UibGAqm16wkPs1WDpE3gw
	 TqkhUpM8BZXkxzCEjTPHQCPTip+TNOIho9OzRxPDlSwiWaM6zx5n1My2qadTO+bwuMpOt
	 5dyqlWTDGOiBAZNmq6wvhP33Y4QjL6+TPS+Pq/pUCTAXMY8MAiv1RJKo0DX0KLkEWfaGD
	 XhVz4IQW3lh8DbLgvlL02J8pHeF4vBfFD7iCDTgWJhdcesHOb1aKkxyrrBjlaseU0bxNB
	 lNI7EIxHFbWeW8nokCmRH0fu02BIkHKG/jdn27a9mpu7C7ykp+66nxuVSGAeyHGR2Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWA6wz+g;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22287606D81C
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22287606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWA6wz+g
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36c9919c659so93549eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749917; x=1794354717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
        b=ZWA6wz+gpgHjh1WQ5eaQidrNz4Hzm3YQ8yeDFG++7giIdaEL6V0GQwJaQi1OskRj0k
         +zip9+d3WalbJESP2kwkC022l+JuQR654DJvkHmcsyNWZMTCvN0ElGkjE2tAcUQYah5/
         gSpizDmU3DsXOnWZpLiDpfqOmhZ8YQaP/9tWHA1qp5AhqlxO89TPz8gwG04DxQ8lgaan
         pOiYTu0jO990rh37d2ZAEwe0SqDrBe4tBitHRe7tiwWn0Dmk/K87zRQ2aeznObVW2CHt
         roz7IHwemorr2dqr8E+YfCKI4huU4b5tkmn1VJDT5U6JVMlV7QRteohMjbiWP3pu9S0p
         pU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749917; x=1794354717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
        b=AhYAd4tyVSvntJ6f8X2R4cWvW2XP44/9ORYljSknJV7oL/0o7DQ9RIJ8OoZaS+jZKg
         k6U586GU0T19kqFAfiHM8o41EJafSQVP99RcSLjfN0BYDFF3gHeHYUzkeLgN/DG9lgv1
         nrSwgSv3DcwmetD3I7locyImsY97CyJur27zxYoE6uGiDBUL+blj1h3TdjAUe0dBS8NU
         918/udppVDY5OrJL6XhzWXuRevjBdVbSz83b0BvpEUdfYz21jdGV2aim1BEtqxj0AIND
         yF2eLEDT76G5b8FyWZuzc8MGgzim5O909C8GvNIi/4PTWHmkA3vFezUhlKfQvatvx2on
         ucgA==
X-Forwarded-Encrypted: i=1; AKwUvBw+fBOO2p/1GPkaZEvfHT/0VG623QXSsRnwtIDfP3wOdT6/wm+opAsTc14ZedajJNuUQ6o7ZKu1eczy9AywjhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J3h042YeE5tKLKzGBZQToIuO0WeqYLNNVrbGdkCf30IkfxKbm
	uVi7RCHGbX2W/gIBzvK6DKrnJ7Pzhm8/JwPgy418Srwa4+CdOtK1yg6K
X-Gm-Gg: AYBFou0E+O1SuDySJidYptJDyFX8pDPow4RgKUZSJv/4d7fBrE/Girp8Ghs+1OMbGMC
	piqL30WvNDr/sOXgw5JFVF2qnuom6f3dpPN4NpkQUaSAPH6bAad+usx5rbb7oJICEWnZVmCpgXi
	LjpNQFtMjw7ELPf4aQP15hMT0/mSmfkNwJS3VQaWbGvHjjqMY4sJBusBN1/b+Xumx9Vp+3fjmx9
	CVWFq735HMV6wUK9YUMRT+5v2JcISirfXwYCDbPurdSsR2V8HPakgH7eTVnm8ehOi9ZCbKO4fT8
	Oi7qQy3MuToDaRYPfkXlI4nK0uwqJhbNmhaNUtVNqhQfvVjEaSvE+CyihBOFH3KRNMbUpqJRJlK
	KAmERmvhUOR3xwOXWphM0GLM+vfbiKt7FoH/lJlc0mA0C2OZTNY3V470mZ63NEyLvjqlpqZwe2N
	vOJzElRW0j0wLWfMyU5h0dOfX30dwlhLZ6frr5DbBzppHVr0hmhWoiTis394EcZYInl7BnspdRF
	G621Ah1X3PKjlZmeEp2PAtHE6HRJ4tsIhiw6lBI8q6HPDONF8MqohwQjjO9Mc6rk6czzF+kOVs6
	8Qvz3em+GfNN7SUNuqkbt+U=
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr23417013eec.34.1793749916956;
        Tue, 03 Nov 2026 15:51:56 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm1876335eec.27.2026.11.03.15.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:56 -0800 (PST)
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
Subject: [PATCH net-next v2 2/7] net: devmem: charge the frag length to TX skb truesize
Date: Tue,  3 Nov 2026 15:51:47 -0800
Message-ID: <20261103235152.1904727-3-sdf@fomichev.me>
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

Devmem TX charges each frag the net_iov size, PAGE_SIZE today:
zerocopy_fill_skb_from_devmem() adds PAGE_SIZE to skb->truesize per
frag and __zerocopy_sg_from_iter() charges it to sk_wmem_queued. TCP
uncharges in bytes as acked data is trimmed from the skb
(tcp_trim_head()) and uncharges the rest when the skb is freed. A frag
shorter than a page leaves the difference charged until then, which is
small with PAGE_SIZE net_iovs.

TX net_iovs are about to grow up to 2MB, while frags stay bounded by
the skb and many frags share a net_iov. Charging the net_iov size would
charge up to 2MB per frag: a 64KB skb with two frags would charge 4MB
and fill the default 4MB send buffer on its own.

Charge the frag length instead, which also matches what TCP uncharges.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/datagram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f8302..489d92fe6dae 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -737,7 +737,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 
 		netmem_inc_ref(net_iov_to_netmem(niov));
 		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
-				       size, PAGE_SIZE);
+				       size, size);
 		iov_iter_advance(from, size);
 		length -= size;
 		i++;
-- 
2.53.0-Meta

