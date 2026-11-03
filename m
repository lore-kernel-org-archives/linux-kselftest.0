Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736054;
	b=FoAUGaneqy+hOp5U+uKoM61FGeF3zMuoy0UJCoy/hExic6D725ocAr6oA97cBEkV0Utr
	 1uLyaK+9X6AAi0jZCDxXs4Bk/qd7+jCErMtxcIG7L/3MJ2onbNraXD8njzaw0Z4D5WKyw
	 uGu/a3TeZynS/4Bk2QZNRqlT+tMR/8s8r80fwC5V41w0XRJrXAOoJ3jIE/FQB/vLb9LLo
	 FDwr2PVX95aioN3CG+l7KgXbHGXpjvegpog4IGjD5lKRNlNmEZ47FgmrioPgANjF02/Vp
	 3b0nP0vhNlpL2cavALCB6qfBjvI2ffRLWMd+HCOz0V/zGi8sHLjmRuJUP3r7nRaONDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PwIPxynn/Ts+hRyBLxahwIuYBf8HIZ9im3ZAloF6OKU=;
	b=ngilBHH48fqs+zRQNMrTSWytkNo16CifW9Irf+gOBCKt+M5PBoPG0bXjrpfsEo1ldpMQ
	 BhgFdkvKdChZ9bdd0SKaJNddTCD9cOYxH7ewgCczh6BjDvFE1My2Avl2Fym3Sglmk//s0
	 gDJYiOj++XfCWiUX79wQil26QIZNFXBAxJc9JnJN8b06hrsGKSC8ZiUDgfGxNvVJXCqEr
	 hKPphQpTaxZlB/J7UeAqLlbONOWclLf5V7vV1HfsfyzZsagGnwbIbJcGWxQj6ueIonxA/
	 4Ywi7EqlL0D7e8lWF0ob+e2rLoOV+PZUNI52lviVTfg0GXyJ2sh+FhFdBIUIgsBvYUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=TvQA4Pri;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8EC606A329
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 20:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8EC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=TvQA4Pri
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so7878493a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 12:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793736052; x=1794340852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PwIPxynn/Ts+hRyBLxahwIuYBf8HIZ9im3ZAloF6OKU=;
        b=TvQA4PriTmn+nz4DaXS/V9tkl72XSKiTidZx9tK4/+l4YXO7Z6CJDGxU1X4jxIgZeC
         PPzjjCrW2dZ5+K78SwTMxcKOXaxQ+2ZIyL+3LtQcWWGMcyxt955QX4NFsjj9t7LTW3tj
         usr9957QCwSh2azAzuYVIY+Skh3Df/rPIj2X4Eo/Ht6tfmxeCBE2t0PHpTBhiaP0sGE2
         ixvjcR/xCJzJ7T4S7ClYyFkZtGn9Q3h1lOAvcHdlKJx8PyKfUdf+6lMJiCI68pVpnD68
         8DNX+KAErrKy9Z/NT4JGp4tfR3XVfWQcbfjGoBipTZR1C0xBprQasEUFHJ57KtGMSLtA
         bdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736052; x=1794340852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwIPxynn/Ts+hRyBLxahwIuYBf8HIZ9im3ZAloF6OKU=;
        b=wW7XdrVituc1lkNeuHdeCZeTU98L/z6G906BPnJCnRotuwBMgSRiITxFTpBJJyS8J7
         b9hiC0vXjyYvMFqjH24Xrvru+p0hsRGVOd3s4ft7vr1JTosT+bH6ALoZTWBQMqEn0V7C
         2elDp6DfuIWHvzcC1E0UmULAwCAjfd/ozG27zuN8tUie/WGQ7z2TxtMi/XIgz8d41y2w
         dCzNPJvn88Xj8OE9w15Tqm2mBJ2hUpjScc6E31L5+10VIlAOuzrZ3eft8Jeu6oHZn1nl
         hz0jq93nJtEMWqYZHivxpN5yS2QV+TEs8GqRZXFTEoLtzYxhZ76AUmQXqjJOU2VB3bkQ
         T3Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzvBE/Ot6Dq0mQbFnMnls/SN8v5jRQjlOKj2IJQ0PHF15+80bFbql5JUrk44EzBpQeam7C8O8np0JHNfom8L8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ilMUj47D0onbBt4WhAPlxFEqSfF/e4l9QQHTap+coaNn0oAmS
	exvWZkFZckiXJ4QbBWOGDzEIPmMAFJV9u8cNKrIwGsAApCPQAu6XMD3sePF4fZfFuyo=
X-Gm-Gg: AYBFou2UD2XaeT4SLCHgcGzW9RQqB6BdBBR1iWSGqAHADigyE+4uayXhiOuk71BsM+Z
	KP0VRjzkfN5tvi8uIdD6PEiuINhFov/pCUG1jN+X3n/7CGZMLmkbeDqemRJk0Y/c6e9zskybSIR
	W74hVlk1NhxyiwPaogQ27EqZTXXStsyhQpNRxvGGWBQN2zB1IuuBqHAjojbkxpJ/zukrqyTgeRC
	INcig2ZvOfERLFETbiYd5p6ypovnSD+638b798Z/yo1sfRDFZi3N6MW6HOpC/rKeg02Cut64YVH
	wbSkyYLiFBykFPh9vmeJ1lA24syzjTn1TND5v8MWtoZUltoeJbzI7ATxEfjfd1MPfNcTwd1vbel
	6HBVk51utCsC1+1wdi0+k9jPYPjr9CZ23rbRRNCWRXlnJZMruNiIsdYC6RWg+k8HIuhISas8WMG
	YuPW/bfWu0athUxWdNxh6K+HS+bA+X9CrAkRcOxE2R32l4iAkksU+t1JS5rDxE7vzr/YUlNROc2
	jCgYfbTpZBClym3tfgBDMlwQmhQutSAWwlUf33YUohDipWElFybyI6IS4UIBUbzXxHg82vba7a2
	fzNWr9TWhDo+7agof1X4jsIXsZOGS3afu5Ai9b6LflLsFqw=
X-Received: by 2002:a05:6402:1d51:b0:6ab:7700:9371 with SMTP id 4fb4d7f45d1cf-6b4d468b63cmr9974496a12.25.1793736051901;
        Tue, 03 Nov 2026 12:00:51 -0800 (PST)
Received: from D90XRJJJNQ ([2a09:bac6:37af:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm4499801a12.0.2026.11.03.12.00.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 12:00:51 -0800 (PST)
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
Subject: [PATCH net 0/2] net: fix mac_len of skbs copied by generic XDP
Date: Tue,  3 Nov 2026 20:00:35 +0000
Message-ID: <20261103200036.65764-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
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

Generic XDP copies the skb before it runs a program with frags support.
The copy happens when the skb is cloned, nonlinear, or has less than 256
bytes of headroom. skb_pp_cow_data() makes the copy, but it does not
copy mac_len. After XDP, the skb has mac_len 0.

Two places after generic XDP move skb->data by mac_len:
- On XDP_REDIRECT to a cpumap, cpu_map_generic_redirect() pulls mac_len
  bytes, the length of the Ethernet header. Then it queues the skb to
  the target CPU. With mac_len 0, the IP layer on that CPU sees the
  Ethernet header and drops the packet.
- On XDP_PASS, the skb can go on to tc ingress with a BPF program
  attached (tcx, cls_bpf or act_bpf). Before it runs the program, tc
  pushes mac_len bytes, the length of the Ethernet header. With
  mac_len 0, skb->data stays at the IP header. Therefore, the program
  reads the IP header as the Ethernet header.

Patch 1 copies mac_len in skb_pp_cow_data(). Patch 2 adds a test to
drivers/net/ping.py. The test redirects packets to a cpumap in generic
XDP. On netdevsim, the test fails without patch 1.

---
Copying mac_len in __copy_skb_header() would cover every caller. But it
would also change skb_copy(), pskb_copy() and skb_copy_expand().
Commit 6001896f0098 ("bpf: Run generic devmap egress prog on private
skb") hit a similar problem. It copies mac_len right after skb_copy() in
dev_map_generic_redirect() [1]. We followed that approach.

The bug can be reproduced on veth, virtio_net and netdevsim. The fix was
tested on all three. Native XDP is not affected.

[1] https://lore.kernel.org/all/CABFUUZFQXxYVdi_QqhGG8WTTf=F1BqOmroYj50mv0w70Acf5Bw@mail.gmail.com/

Tianyi Gao (2):
  net: fix mac_len of skbs copied by generic XDP
  selftests: drv-net: ping: test generic XDP redirect to cpumap

 net/core/skbuff.c                             |  1 +
 tools/testing/selftests/drivers/net/ping.py   | 27 ++++++++++++++++---
 .../selftests/net/lib/xdp_cpumap.bpf.c        | 19 +++++++++++++
 3 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/net/lib/xdp_cpumap.bpf.c


base-commit: 647b81ddefc6364290e67bf33c89d54971f8995e
-- 
2.55.0

