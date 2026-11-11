Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437266;
	b=bp5N1i9iXYsXy9LuKd3trZ7iHrhhE+cpjTdlHigE/zYQ9gO6eTKXcJq+Q/dZvq5tX88d
	 G7laEXwOrvWsaVkNEdhd5pMdHsXR+Ga3f6WMeHfaGY5HAKoltFaLBp8ehOyhYW9E5Lnqw
	 DK/FlMVSylgJ1yDEWOF62pi6k83YujcUOcD4WcBlPn3HeZ6ifFs2cccoXjbu6qcAxIAH2
	 tGFX8OfQDPF0IkLdtFFBwweJ3uT/OsjOZaLT5mjSUYP52GVYC66co97VMOfdvqQtfc+GD
	 PekxFjzzhjGn2DmsstLi1is4m6OSbAmzP9R2fbcyIEK/Ze3NBIGyntNIsKDjhmqr91A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Dq1hQpydi2wrIY3E+2+cBGacPDEy9liEsySwd8fpB94=;
	b=1s4tLa9gaBa9VRDnFfgUd8bJrlNkf/X14tD5RCR+YN+VVLoYjP4UFI4gqERqHF08EY1R
	 YswVKibKPgJLJlZN++s8wPqb/xcrwxMVHnZnlnoWzAJre4fzknungd80xQPA9zUTM0zC3
	 7tiwoxNUyWCjj99hLUXDddmrcikV/3FIKkUuWH5rbF7RERmB+OuLIekYMHT5uH7s7YMEM
	 y/jK/b3zKjA7vvwWBgUHHWAqD1kGWFZtClhPLsiWKVGwqonmQStEFmhrbWdyEWeTWG8xP
	 wStHcm3JIfpcKodPjCW5kxzDP7QphgxHZUBr8RRx8UZB2yRYzSEIXN26sEObGMmWqSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1c6NaCZ;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F803606B767
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F803606B767
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1c6NaCZ
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso2040022eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437264; x=1795042064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dq1hQpydi2wrIY3E+2+cBGacPDEy9liEsySwd8fpB94=;
        b=r1c6NaCZvim/rCQsAEPbradnxzOy1ENh0ovKNL3zF/UsFD9uYRuSyBeIFY8HpYnqlE
         SEzXoTF07pWhFs6Tx3qdY+80IQOWBpr4mtUvE3z2qQCm4zdofOf3cZL9LGQXlYlVnCNg
         wGwuiMKNq9KHXyJS5Fwe+6ug/NZa2Z8QNy9NQ/0/LL6eVrkIqyQuF9+pgtsA9n80p2Oy
         PnYMbNKpENvlhMdek218/PBzd5U9LzIb0EDn4DX/2GzQuxeqxKRrwvMIoaQq7m03LdSf
         JbL6I2F/T5lOKkwKvWj/nPOHwBCpJ6e/qFVH9o6X14X9rfQ3UomsZ8RINrnZqCr9mAdu
         xdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437264; x=1795042064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dq1hQpydi2wrIY3E+2+cBGacPDEy9liEsySwd8fpB94=;
        b=CTZ8IedEVi1zs3Z8FnOpTHzNXos9zj2UCPhInTvJhv6uezwWitZkGOFC9QtZCln1wW
         /SMvkvkgBr6VhvjzsmajsQLbiMc3txEGKjXiS9ilVBRRNysiLgihu2J2NVdH1xHb91ZP
         0amKoCVN7bxu/AZFVUlaib5QkpHOotLjWeQ5b5ItdI7eWD7lclXMaRUpEZC6PsnGLr77
         61Q5fdz01GT6lLJ4W867ZJtxVetXr0kTkm/IfgB5yFHgS5gqqKNl5yDqug62O/9buBd9
         Z01r5con4beWtJZ23bw7dQ3Sc1158mCO7xJPJqbiy75NMPtx86fVTF9tNMeyYDF/qktQ
         AO2Q==
X-Forwarded-Encrypted: i=1; AL+hErEItShIcHUEyzU8/Dxh+Ax/uCUdsPykCDcwB8m/QxEqOYEOt23ZYA4uRxb/Se3bZBw6yzHd+7XPCbLGDvGYZbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cYEDeGcP5F+s1IxQwyigUoqgi9+W19Y6chbARqfQExVeLo6rr
	N/iahoMqMjJ5Kj07+zYqLXAlv0/XY1KaLJ1qy8zoOnrm01YI5WJQL7Js
X-Gm-Gg: AYBFou1l63s1ChJtSU3ngubxkJVj/LET1Q0Re1gVOjwYl1e9OwXu5KdI9G7hXMcH+0e
	Hq/g0HrCuvoWmbuVFkZqyvYSP0O3wIhnNnMmv3T/4ZNM30y/COSyq/VNcYvgJJPfQbkJY746I78
	jBuQaBo1b9G00+ACbQzqHtNjvPIfjLz5rxrH8kWF7pnoFYuE89BL84vsTYGHqsg6TZYtRZ/Gn+2
	TX3jImpydg4hgFWz08FvWwEnshQNkRoIhgqJtykdNhtmYh/Lztt2Hj9mYr5UbbUFTqqwOAVWr17
	pYHN/yKJKFkvFKWeQ62szY0eNXnWjDAQhlW1l8aNhScVw7hTL56iFmhi5j13uIlkRMavAtomTZ5
	a6uHrgC+Woe4ZpzSEodDnCgIbydeJYL/TrkgjgSuGT8rcXdC8ULjGFEIUHCJQv8lsM3/Jf4nTiG
	+vtzCYzeNyLOYVjsyWq6LFSmfcTbkRsXqrRxdlV5rHm/P8E8M+CcPoV+k5ODZyEeA6TnaEzYitd
	iTCO0Zvhw5xThqOpnOtau8c9skvPZyOgwoWF4uqj7+stC89HOuV08u4pHGbvOmdU64PqTaQPbOL
	jTfKl9XQAStj1hCr1Rz+SiY=
X-Received: by 2002:a05:693c:65cd:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-37686176002mr4557181eec.20.1794437264329;
        Wed, 11 Nov 2026 14:47:44 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm20837742eec.27.2026.11.11.14.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:44 -0800 (PST)
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
Subject: [PATCH net-next v4 2/5] net: devmem: charge the frag length to TX skb truesize
Date: Wed, 11 Nov 2026 14:47:37 -0800
Message-ID: <20261111224740.2744522-3-sdf@fomichev.me>
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
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
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

