Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DB037F30C
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792186946; cv=none; b=GLPKNnZd3QbOmSXrJbGZpGYMjtKgom0sz46mzyImMOIO2YnR+F5mIccg+XjM0dCyjNLOR2biQJFUgB+C863IdN6M8kvqOabEwRi9Up5cYb2F5l3d0SL2Rv0FKn2jYGJd637JiNfo6FwMEAV/MMvV31jzNd92bcpQmdSbQrO0wnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792186946; c=relaxed/simple;
	bh=62QewY8KkfyjdPNNnQBNYJvt2p5rQ2ylV0efsEeoc9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4qMf6UDJV89/VRkwe2nnmwT2ZYt9SFgyzRPY8EAH4vsCfIIQCMTE4yU5mK4K5qD5jkwBbJ3K/I2IoXXomhiRtTmZCcberaFQmH9fMOwbZN0acgdkesHGfi4H3MuCAYDWRukeBplHRARK3g5SRhJuBaJ5va7vJCuf+ddsaWOSWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Wl2J2jC3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Wl2J2jC3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so5075035e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792186942; x=1792791742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBnYf4wt1Qj8g48kRKmfziM0ACqZw9/m994SOb4UJnU=;
        b=Wl2J2jC3MR89eD6z64m5FVmY5gtFPWEjdp5uGjsNsyRFl7oC25Gvt17g7+ZuiaLnYS
         kJwCaG1aK7WTTGeNKfKHz6I+/VpYzYJi/wi/2XU3VtLiiLYz4lN3RU7TlvPoHZWlvy0H
         AmQdhqoDXfB05yoo5elqENjlQe4McrTef3+bz2Es/VGgc4phKfbDE96zoTLbmIHCkI3w
         v7q2V4mbw+3tskcywZhZwoj/gspfWeAfM8d9Fpfk1pks8OJvJZmMkMDeMUUncj30G28H
         ZaORms6QFaMHz/JQ+ge1Lih7l/HkxcP5SRMuqMVdgwVuj49U1jftoIvbdFP5ZY2k7Vm1
         wxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792186942; x=1792791742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBnYf4wt1Qj8g48kRKmfziM0ACqZw9/m994SOb4UJnU=;
        b=RJVG7wZ5fRl+aEDU5OJofWgwt5kPzEwUH1B9UPcFwZnPzB0omrMSFH9+CjfXVYWW/t
         Qm5MdAPQPtgU8E2EvKqE48lNOAFYOVWzDJlnK3h+CSRhU7bN9rflfvTz4/Zl8/XcFAk1
         EnKy7BkyYRtYwkn25474gnIEbylbOtREFZwPJlSytNaZ7Cqlc+PZwTb34AdUjv1AjiMb
         2Iu+OawksZjOTgMlvj6ZYbF8fAuBjgQKtPL5wDJiIbCZudrGvLRbkse8dMn6AKClVjDZ
         egQmHTl9usBhqivy+Iwan9SDTIKO/f80XzEAv8/4zvMc2OHmwxcD6r0yBcqqSGZMrl/B
         ez4g==
X-Forwarded-Encrypted: i=1; AKwUvBz8X9/RI/qA7XVK/Jlf8gJXjJZsVHsg38Cujs/ini9g1cgvW/MctP5TeobmujSB7IW5x1Oc9LKD3ycRwZESOGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXBuFzMndmJtwohNFxdBIiABLizjdSY18w1tjerlVG8Y0idZe+
	mpPJae9WBtg58RxPnvl9afxFaQy40xFtZtcYa6two0TTyWo655mphZr4oGPIrOYhw6Q=
X-Gm-Gg: AYBFou3kfuJpQ3yGWtXEXNB6QAz6CM+mzT2YBhBkHvjqedr5csVB5HpV76tX58/QzjU
	TDPZ45G3KEBvZ7KdOW/EIUeipadwauNNWghA7lGrOcKsrepvBhvbqafL4N/NRkFMqrBxKWN6FPf
	24noeBZ/8USi1YQMXjEO9oSfppoSGtbucL1gmA9PAKpJY+oKnnjsSF/WgCIBKOj42KA8k+5b5uh
	QCoqm6WttwygMivdDtTZeJGyQ58dNMhUkq0u1iZzreCL4znEiAzhcn+ZpXMMuhMmx/MuyMi8N9c
	UefMIfoJPsIZe4R+QCYAp/SwhC3p2R9tXI1hwIdbcmR6oykGdIXDV1vypXYr+tT440ECs7jqLoD
	EbL1uoqU9G6QQjP0i25oQWziDdt6uRC4jXJVGEI45K6JFmttFS5c8H28K7x8LQfn99bgwt5BMw0
	nqSmE1yKYwTLCuDdLoqiOsT10/IPR/b0tnmmHR17hjHgjV7lA1cauEZJkMSqBpV1A0Nu8XGyHaV
	3weM4zu7xzJW6GIhg==
X-Received: by 2002:a05:600c:1d10:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1d75ce2e7mr23926225e9.1.1792186942188;
        Fri, 16 Oct 2026 14:42:22 -0700 (PDT)
Received: from D90XRJJJNQ ([2a09:bac6:37af:ec8::179:190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bb6sm7975417f8f.34.2026.10.16.14.42.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 14:42:20 -0700 (PDT)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	horms@kernel.org,
	bpf@vger.kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	kernel-team@cloudflare.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	bochaolucky@gmail.com,
	toshiaki.makita1@gmail.com,
	lorenzo@kernel.org,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net 0/2] veth: schedule the peer's NAPI after XDP_TX when only GRO is enabled
Date: Fri, 16 Oct 2026 22:42:15 +0100
Message-ID: <20261016214217.16942-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an XDP program on a veth device returns XDP_TX and the peer has
GRO enabled but no XDP program, the frames are queued on the peer's
ring, but the peer's NAPI is never scheduled to process them. Once the
ring is full, every XDP_TX frame is dropped.

Commit 0e672f306a28 ("veth: check for NAPI instead of xdp_prog before
xmit of XDP frame") made such a peer work as an XDP_REDIRECT target,
where veth_xdp_xmit() both queues the frames and schedules the peer's
NAPI. XDP_TX queues its frames through the same function but schedules
the NAPI in veth_xdp_flush(), which still checks xdp_prog.

The usual workaround is to load a dummy XDP program on the peer [1].
That turns off TSO on the device, and every skb it sends then goes
through the peer's XDP path, where most of them are copied. In our
tests, TCP sent from a namespace dropped from 22.1 to 14.8 Gbit/s with
the dummy program. With this fix the program is no longer needed.

Patch 1 makes veth_xdp_flush() check the peer's napi pointer, as
veth_xdp_xmit() does. Patch 2 adds a test for this case to veth.sh.

[1] https://lore.kernel.org/all/fb2d324b-35fb-802d-2e1d-1ee1aa234c16@gmail.com/

---
Bochao Cao's migration of the XDP feature test [2] skips XDP_TX on veth
when the peer has no XDP program, which is the case patch 1 fixes.

[2] https://lore.kernel.org/netdev/20261010-xdp-v5-send-20261008-v5-0-de687cb67c40@gmail.com/

Tianyi Gao (2):
  veth: schedule the peer's NAPI after XDP_TX when only GRO is enabled
  selftests: net: veth: test XDP_TX to a peer with GRO enabled

 drivers/net/veth.c                            |  2 +-
 .../testing/selftests/net/lib/xdp_dummy.bpf.c |  6 +++++
 tools/testing/selftests/net/veth.sh           | 25 +++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)


base-commit: 513444cc62e231a11c9b15ea88de0890da9b2b4f
-- 
2.55.0

