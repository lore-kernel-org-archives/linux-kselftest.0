Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736056;
	b=HMHbnGh3TkcgiL7jii+08thceV8SHfatqtmUFsccSmrwV8ib8B2y0cd/8a2s1VcsG9PH
	 W1PU3X3TQ8+SJ/OOqaJoSBCYIeB2KqXhiUyv8A+PhowgIt+DJRGP/XAwsW9xxpN+rMHUw
	 j+2FnGRcq+uqo3F+y07b20AcaSMq0Kxe/xL3ATWjXRK9/2jByoVafR2cOhP5s72aeMNfB
	 MKHtiCdxK6cqr6ZPhxSA7kmIDHM76QRb4LRSIFzcV1ZjdFAFGr4IgSmt53e3dhQZn2XRj
	 PgbhKUjXhWftxmNRjflqFZpd98oj0LKo/UxJFE5Xn34tzcMdcGKqGSHKBtma0cFfW9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mlFelYWIRdulUJeu8Py+aDXguvFlkxFE6N66Qy/SxHg=;
	b=m2/lOXRgp1/DBngf9cDXwmE1aD4Iubi1X0tnqWjasM8g6nGWQ9nOqAd373RFWQjE483n
	 FWEx2t5dlKBWyuGjuMq5W84lKVvuaBbD4NGkajipdCZYFSbKZqudpvoUIVDy59PFNW605
	 DsVvcv4wQKGzMgWDA3J/VhhVZdWYw8XyOJaxiviGPc7FxafOMI1eG86Xn4oMVOYYLEPij
	 BusscC3NAXk7Z765fUrMp6xywIph64G0OOXTTJYS/denWfkMV1aMkeLBrkztI23srakvZ
	 OsDV0+olAvZ7HU6b3PZj48s5Ugc1qVClTuWVBw3qyEZPwCvm+l48HAad7D3+B37Nqnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=EsO0dbm1;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69402606A324
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 20:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69402606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=EsO0dbm1
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c315869241fso658802366b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 12:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793736055; x=1794340855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlFelYWIRdulUJeu8Py+aDXguvFlkxFE6N66Qy/SxHg=;
        b=EsO0dbm1bGfsye5KZ5OcUac1g8c2L+thR+EhdMijecI0VJbL7V5fkwDw8RfXnY/n9j
         UeLanVc2T54tOs+nDeuC5VCmfeHa4WWKilz+y+xDCR/CsADLAA7uv5EP0MpGPIvrCqGV
         OyhNt7WVn49m4AXx1OptwoM1YhTlkIUWvzC42rWfQ0pOrO7SNeKZCNMWVwjzKvgdSDfU
         1Y2uK9BZEBgRSwopY2C6/tsWaTJ2pTk+m6wt4d3uTXt3eXDJmqWV8LU+3c2tjzSYTDu6
         FG5hmQ2cYfIUWL9sxyFm85UV9UClkg/b3az+1/DEhRNKd7VOmKfvTcGTEKUpX085TPrT
         TYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736055; x=1794340855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlFelYWIRdulUJeu8Py+aDXguvFlkxFE6N66Qy/SxHg=;
        b=gaaaqou3h9qSctjVvOgJo1GFtuzMgxoDfqOkmaYvy/vHyaXNZemnLRFyxNq7dOgPlx
         FFiiCGGup2eeUZsKQr0tRkty4u+pM9DRyMdfaeAZRIaEGgQ7sXX9ZpBiJzVdJNCJceiZ
         Q2Tw9j+rcV9vhPtAS8XxuJqGUXneUv89QVFbkR6VgXbJUgF9pLkcaDLn2HD9vZjv0b9d
         SNJ/H+52FTVtAnX+j0g55M8vWWPE0jEs9CtKWtJneZXGa10piyF4C8DonV9EX0fPlHlW
         F98k7TD25utIzqUxdlpeAJKQ87cq6+Xmg1O7B/Hfj5Nc40gq/uUcuqcXwr20xD1fCI/B
         r3Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxAkXh9QBpcrgS/3F9gJnq+/wRzeBO8dgoRwNOzvMYyEW31hK0LgRGyLeePCXH/OJNcr7Iz1K8mBZuMMe5BViI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dd4MTfTVB6XBCfb5k7byUtd+wkAaLwNH7Ai+dUGF6Xd6KMSX3
	IzkdfjW19FTkux3AkwDIuZU96/qW7gpvWsTNM+NwvO+bimzfdKPfKkoNQhEm2VVV7v4=
X-Gm-Gg: AYBFou3ufKIYB3/Fk94v7CI8Odl9Upx2hvLChQd2gzikMNl3mwWkkrH/OUAqSFvo8D/
	ffcrmXLLe0QIbr7/LrFTdjpESlz1fskqmBhJ78vKN+PNhHxIL59mT2KA5DbJ7XEQp/OzEe+jiP9
	EntSxeqsk/UtRlYAnfXfDDx0hjFUPx7tlbsbwuOc/1hFNnlIQh52O1zNU5Lzg/6KEFEnOIt1+Rs
	0KJxQPFy2EYOhcSJOAqWIsg8shVGQHyqTz7y+vOStfEmGMFyT3skiPGdWGGtZC//4h7lAcf0CAp
	TEl0CznONSDtMK3kW+2FGv32vPem9TJpWTGtB6GsCRQSSyNiTaHlF3qKRxkohM+OGPKM+kldm+c
	dPpXiFZquahTuB9U9kv7QzO87W6wst3ErAa4cuVz7qsphk+E3uNCbqAwbwob7VqFqA5k/nTcOE9
	EPXKF9tY2FTVpSXVxAQ3ZzH1P1W5PHPp/pZB3g/SYoHyP4VlEakKLIHqEK1BC6x/lMeCDWiRl1G
	QBkDACtorNhGZAKqsLcmr7PovKc3j1jGMXlzN2OU7yyoH9BbtQBK6giKi0LYDJJ2ccvUD9I3mJH
	8ZZD80fhi2NkvUgPIO6JJBBYiM4tL5rLighe6AyHnCZ9nJygXAYF+vJwjy4cpfgyPJ/3
X-Received: by 2002:a17:907:9607:b0:c2e:2d8c:4585 with SMTP id a640c23a62f3a-c4ca7a9b17dmr1299809166b.36.1793736054809;
        Tue, 03 Nov 2026 12:00:54 -0800 (PST)
Received: from D90XRJJJNQ ([2a09:bac6:37af:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm4499801a12.0.2026.11.03.12.00.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 12:00:52 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Toke Hoiland-Jorgensen <toke@redhat.com>,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net 1/2] net: fix mac_len of skbs copied by generic XDP
Date: Tue,  3 Nov 2026 20:00:36 +0000
Message-ID: <20261103200036.65764-3-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103200036.65764-2-tianyi@cloudflare.com>
References: <20261103200036.65764-2-tianyi@cloudflare.com>
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

skb_pp_cow_data() copies the header fields of the old skb with
skb_copy_header(). skb_copy_header() does not copy mac_len.

Generic XDP uses skb_pp_cow_data() for programs with frags support.
After such a program, the skb can have mac_len 0.
cpu_map_generic_redirect() and tc ingress then get the position of the
Ethernet header wrong.

Copy mac_len in skb_pp_cow_data(), as dev_map_generic_redirect() does
after skb_copy().

Fixes: e6d5dbdd20aa ("xdp: add multi-buff support for xdp running in generic mode")
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 net/core/skbuff.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f676411724..aa0b11204708 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -967,6 +967,7 @@ int skb_pp_cow_data(struct page_pool *pool, struct sk_buff **pskb,
 
 	skb_reserve(nskb, headroom);
 	skb_copy_header(nskb, skb);
+	nskb->mac_len = skb->mac_len;
 	skb_mark_for_recycle(nskb);
 
 	err = skb_copy_bits(skb, 0, nskb->data, size);
-- 
2.55.0

