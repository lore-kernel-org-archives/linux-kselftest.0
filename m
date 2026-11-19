Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099384;
	b=QrKOUGrYAZfE/YxvDhob1SDSgfIeAHFLUzgdeDEAe2RHMsJB4gjqeKpCsCkUafWut7HD
	 YIFLeQlYIVRyLo+KNO1nrfmnrteMuNa6z+e32Nvy7zAk2Jiyl+Hl29x0KC4oSI1qIT6nE
	 Q8qD74EIUYnp97wtKG6dKrkpd2QUkh3F+cZB010gLt+uLhdBGtuYh20jN6z54PY79brUc
	 j4+ycT7J4QBo/fhXFPvz2uoRmkmirlh4zmaRviS05YdO59fbEQv9MEb7VUyYaD+qKQSPf
	 cUd6JPcHK2ZAVtYMbOpDf2K/RoljTZb1UA32AFlAgDpIP3bR1gOgM4HAgomG3OExzAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
	b=Mnd63vdCfhXm+7gcv2OohmSOi+vUxlohGjyQJFvtcHDO3LxtBU4TsUaCXWux/1+huz1D
	 Xn7D8wxm+M6fKQ/CUnCxq1IkLlQQchcqveXWZt7vbwSim818sCyAgACTNqzgIFQmgUqFy
	 spdEIT8HoO6aMYPteb8XQ9/yu8/Ll3KB//ump5gvbCwTXUC4rm1PaIqUB+jnyavn3orPW
	 EIg/18JWpGCBUof/dsmwRDDdRJjxqirHB2V+umhLk1ENeNQ5XZnnt6ophAGYrYUK00MZi
	 ChzbUUaoeKAZwRhqwq0Eakla1i7UgGc4ZuG3blTlNiXziAqUUlvpq9kF3m6x/5dyYmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvLP2+8Y;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8627606A337
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 14:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8627606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvLP2+8Y
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40319bdso3319291eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099383; x=1795704183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
        b=cvLP2+8YSQPyvgyp72ru7K5jomnG3ckow53vlYIopcr1w8uivHenFD5EQkKokdAiOe
         M2PCTTJaxuckK5644Q3s9KKxruSHxV/63pQmXLhv5AWtnvzJn8dWUi9xyIXL0ocRakwg
         NCRXPscmKacvufThd9DoLwTEG8Z7+Zx7mtoMWA1Q9ftXkUCHVXTvWYuAwily2x2PNub+
         IjgilAoZj8X+SuMWG0s4CQTFA+McmPArwRlrCC6erNxHnS7IypnzGPEhbIe85lEkNCyx
         t+q7GMLcYHYr4WLaq8e0dmXFKGqYQPusYU5uipHES82vnlYQv3BEaRAMQ193t2S7eqCI
         5Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099383; x=1795704183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
        b=oTwmTJ2dGdJzF+/W7aCK+nhuHMVe9quhMDLSfT66O3r2X1dkw//bOOfRLsC9MiRSJZ
         w6QRVNVVpzDBJAfc6I9j3+dkOvjO8F/Y6cG+PwGVO7H93LUHv9aTVdexnoR65GHTMacE
         YL7vC/qPP2me0mjO5oK3esuNI0D7YNp+CacKodNwxV762syrJwtrwKCTJc7xJKuHZ2Ex
         LeLze93p0jgW3Dv3qz+fULv1NiPzAAwbeK7NuMMswcj4+p0itKd0OHZBvF1NR9w5Rhrr
         sBEGP0s6zTQS/Ip5REDmXuUJKjfAdtNDeNDehkXAsG1NgsKbFDkYWqunCxcfyqcef0v3
         A9hw==
X-Forwarded-Encrypted: i=1; AL+hErE0QF92bULaNjBJAltJnod2pKPw+/eHge1jE1u2VmmNeGhZbCaBntkrRJdR+WKKEbQ5DfRpADyn8eZ1PPUiQX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ku1CLAATlIhWvVauhWFpD2Rshs9w2IeVx+Uiyo/SCWwnw8Qra
	d8aWpJ8ns2WE+59k63GOKKwUXalJJb+txa0ibLV19CLux4Rs9pkaIV/r
X-Gm-Gg: AZFdTZdNzKpkpUaAXZxesbwCmiDiWKokPRJHJU3iR2am0GNhq/gwPaUdH8eGgFR5/Z7
	eJUyvohD4hLOlNcbwN7ShiLpJU5dp6vySG2WXKd5Hzscs87N9SO8l1lO7FnVKk4vhqTCykjPjNn
	hm48LhEvrSDDTR6+84KW/MUuzNEWTtWm8W8Z1Ju33I+eNNqoUGvxmSRBiNiGv3GNGjMMHVXzNUg
	rHZvExU4cte8zYy/5YbCMdIp2oUnnqlZ+mNbSl8Tdh/gBD3y7dMyH3J9XwNj58w6JAgt9z1lkD1
	VcojJNhxzvrJUb4QpvlqrK2sFK4eePFO4u/1r9xGVp+9STSxT83h8Jyk05V3wfhZwtsd3Cgb7Mv
	TUrLeWFnq+LlaEIT/Zr93Zefi0ujru97csqdXN/E8FDrlRf2ZywVAg9CsNIEG+DjpmQ+Q7rK+QH
	Shddnjyy1cc6j1plpHu9MuSfTqat9oQH4fDd0pIV/Ug776Ou1EsxcNc5RZOnyPLjCV95sLmOkSZ
	mJMbnHHZLGzXVqCGToubTZD3aHMa4FP02uuWFn+JjqUbhH/WjDzx9OUJ5ZvKLz+xaUP7S9S22Z5
	WBg0mU24UkPs/tDH4/7m+ZxN0adGPZ7ovQKAQsZjUzI2OYOSJw==
X-Received: by 2002:a05:7300:7314:b0:375:c5e1:931d with SMTP id 5a478bee46e88-38280c2e5fbmr7589924eec.25.1795099382820;
        Thu, 19 Nov 2026 06:43:02 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:43:02 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 3/4] tun: clamp zero-copy copylen to remaining payload length
Date: Thu, 19 Nov 2026 23:42:38 +0900
Message-ID: <20261119144241.360238-4-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

tun_get_user() also derives copylen from hdr_len or GOODCOPY_LEN
without bounding it to len after removing the virtio header. A
padded header can make a short frame cross vhost-net's zero-copy
threshold. tun_alloc_skb() then reserves more linear packet data than
zerocopy_sg_from_iter() copies, and the uncopied tail can be delivered
to the network stack.

Limit copylen to len before the NAPI fragments and skb allocation
branches. The requested copy length then cannot exceed the supplied
payload. The normal skb-building path is unchanged.

This matching tun issue was noted during review of the tap zero-copy
fix. An AI coding assistant helped prepare the /dev/net/tun
reproducer. In x86-64 QEMU/vhost-net, a 14-byte input produced a
128-byte frame with a nonzero uncopied tail. The patched kernel
delivered 14 bytes, completed 300 repeated short sends, and still
selected zero-copy for a later 400-byte frame.

Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Fixes: 0690899b4d45 ("tun: experimental zero copy tx support")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tun.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e601..76486cde21e4 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1850,6 +1850,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		 * The rest of the buffer is mapped from userspace.
 		 */
 		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
+		copylen = min_t(size_t, copylen, len);
 		linear = copylen;
 		iov_iter_advance(&i, copylen);
 		if (iov_iter_npages(&i, INT_MAX) <= MAX_SKB_FRAGS)
-- 
2.43.0

