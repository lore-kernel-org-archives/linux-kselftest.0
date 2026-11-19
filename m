Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099379;
	b=IqVTyWHA+ZV5RdvtC1PwXIDBiX9ljbvuXzYFISWeQZKCG5eQm+fk6spv105h84YIqvGz
	 40JTYJjkyW1+851Pw9kM5s3tgxVa1SfvGonZPb9FTcOGTwZvyeD9yKv7BRPjtRmFdijou
	 PJ7mXXMGaFBWqybMfa7VdCZCqIwniattrEm90+YMrtCQ3OsxpI4Bgexwy3gwhxhu7MRV9
	 6Q6ZwH6NCwo/0euWmyGDLcC1WPVWBXCqMyjSnQbdSSH4P5Wv3K5Qr6Y69kNRgMggjj/8k
	 cJ/BtqSgkIailCbAXE8ft9dmvWo1uS6PX4buMHUakDwPca/vSvlhspcHLnU8YmuNDaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
	b=mpXhf2Bwve4kf7I3owUVrdEp4p6WMbQCV+jFvVA73nIDCCN8CuZG5dCkJP+hy1u/V8Tt
	 59HGPRhH91AhR3xmT/SjOobjtsM3tziUEwel4BFwqEhPZvcqf7Rt07wpGWmijCNEkW3i0
	 AYGe+YZkE4d7o59e0+KRmOmRmMxs4x2Esb1HvQ3uEgd8ZTKNK1b63kdE1WU/d8BnfpU5q
	 AYUZVUelR2VnQdatDTTj+qFlSdZu1LBmpo7K7GBuZGVHJHdSR0ElyOiiTFNgIdJSwuq4l
	 9RwzxzNGOZAlS0cpp1ZhNeLTh6FvZTBUCdiKGJG35JcN8C9j5F9Zq0x+GEdY9NvWO3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfBrjJsg;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3560A2613
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 14:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C3560A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfBrjJsg
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so6311469eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099379; x=1795704179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
        b=SfBrjJsgaM3SfnXmFkL//WeotaIyiccErOHnwP8Op/+jtmiZhZt6O/HPsaaXcSFv58
         XxhWTZrcYmWyzJ/G2dJ+bGuC/UAhDwuUWst8aT1V7pLd83JCfkGHLGLgPwXRWFTZtqaq
         yEntDwwWtY0r0BUaD5jcTHiuAO3+nfvr29+V6Ar++8T+/I8Wl/FrpMeva3Hz8rnj/c6Y
         IfaVNb41jSu276kHot/6XCbZVDNqJPRKTm7GNItXWAtih3Hy+fz5flJhnJVSTzrWFg8H
         oC96LLfAymtcgUYh42f5EPApHu9KXz5H1NumNZkj9BuIan//sKREg+/jXBGm+f+cr3e9
         QkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099379; x=1795704179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
        b=nEVvuiGfafuto4Uh911WHJdfsDq82FY9tidDW0MScdEkKJ7NLzGd0RSU0znnegJLam
         yuYmPd68v6oMsnGmkV0gqsadwLPsBiNdrvqH+vlJMWwEotQSYU8BZR7Oub5Xs2n8w3oY
         phWGdkaQtKDPZkuEo6YUckIcHD8e44o76g67cBOQJ1h+xoUAJFosybJNL6rPMmbCorfI
         SX9ZDKOrucMr1Mg3DxVVUJHDr8YUmwkJ/aO13rGzukwF2tfXzC3c2uWAegOXTknwZjjA
         zuoVd4SoHACPNv/m45GalECZCFCg0Hd52xo9wfWbkV3P2awyjxfYwQmZFmATe7u8O3Hp
         +mjQ==
X-Forwarded-Encrypted: i=1; AL+hErEFqW6DglQ6FUikSimxEjuTe4BwXFSzHuBljpM8CdgCOidItkv1GeShHx8tFHbBVAmv1obs7qMEWLlNNM1M8ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DJB3uIzTFWxAElzUoNI3rNva9zso9dVynkg3xod3Ds8xjbXtg
	y6fzwPccdEcbIbT4jtsekv6wMi0GzK/a6uF9BJ8SFuD0hnb20jJN49bS
X-Gm-Gg: AZFdTZdot+4cvr5UI7fpvAZPDS3kHtC8pnKFkBtycNvCdEWxu1XB/js58PD7ch668wP
	eMQg6yXrQlAUJhqwRjKSLgER9HVJ9NHmIgsmnoudGF5nykKXB5GZBb51ozdsiAZCR6u43v1wYCu
	fUEYJn3vSbUySnghXhAH+lvkIoRSh9FljUO0aKhvFnBPFkDAA/59W5DvFeWpLbQQ1IfBGLS/BUR
	d33W699HUrgkYA5Oom32o52affGvCLwn3udwBVFgQeAFlqn0G7+ZxjaRnx9QqmGeIPE1mqUTJGj
	YLJAC4ZKrAlqwE1XwqXI5VaiZed6P9yFBJhRWx/SNJpWgbbolDq87np0RzInQGJ/lv6ZWHcOk4C
	vy3s9RI+y7c13UUidNwnNn6JMzSemLqisLa7TcMEU+1J6Q5wytBEMKLS3wBOxqXOpoNRknSov3q
	VjyWIK42RrIaFXIZxpImmluNNSO6+6vb+UbZHAmmmWdAQOKnI6jCT2IbrQFxMc+tAfV0xiP4bQu
	wm4RWxUkRQag1iO2m6Rfy3mFw8XdEjtGAOe5oq4JUV5fjEbCXMm3BENvjRwpdxwZgcMSA4xdVip
	4m3FWhsO0zPYgJ2w2/xu6QNFaAKYs90rapyBJMWdYzpQl1CnLPUESeG2NDgMgy7a/BvYF3k=
X-Received: by 2002:a05:7301:5f87:b0:381:9593:9984 with SMTP id 5a478bee46e88-38281626937mr5510080eec.37.1795099378702;
        Thu, 19 Nov 2026 06:42:58 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:58 -0800 (PST)
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
Subject: [PATCH net v3 2/4] tap: clamp zero-copy copylen to remaining payload length
Date: Thu, 19 Nov 2026 23:42:37 +0900
Message-ID: <20261119144241.360238-3-graypanda.inzag@gmail.com>
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

tap_get_user() chooses GOODCOPY_LEN when the virtio hdr_len is zero,
without limiting it to the payload remaining after the virtio header.
A 246-byte padded header and a 14-byte Ethernet frame give vhost-net a
260-byte TX descriptor, above its 256-byte zero-copy threshold. The
128-byte skb head then contains only 14 copied bytes; the rest can be
transmitted as stale kernel heap contents.

The original macvtap zero-copy support introduced the copylen choice.
Commit bab632d69ee4 ("vhost: vhost TX zero-copy support") connected
the in-tree vhost-net caller, so this case predates the v6.15 header
validation regression.

Clamp copylen to the remaining payload before allocating the skb. This
also covers cases where the entire frame fits in the skb's linear area.

An AI-assisted code review found this issue. An x86-64 QEMU/vhost-net
reproducer observed a 128-byte frame from 14 input bytes, including a
114-byte uncopied tail. The patched kernel delivered 14 bytes in the
same test and in 400 repeated short-frame sends.

Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..f25c58d6e986 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		struct iov_iter i;
 
 		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
+		/* The remaining payload may be shorter than copylen. */
+		copylen = min_t(unsigned long, copylen, len);
 		linear = copylen;
 		i = *from;
 		iov_iter_advance(&i, copylen);
-- 
2.43.0

