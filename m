Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D363FD96B
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134195; cv=none; b=L6oqprFMUMczyo8Xhyl8QmotajAfmkHHfXgAxWrKTZ9DURsJZRpptndrFICKSgHBWa6ETGt/AZyTCVU7DjVW35GFKi4jIofD29mBaynVeDfhu28zOBhTy0OE4tz4EBSvI2CZcdmYvynoigbbmK1vOXp8tIXiyddoj3NuwC0qXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134195; c=relaxed/simple;
	bh=XNKPCkkjrU+/+BYOooemdbVwzf8j/SyM1aIVVoHZeHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVMCBuSyOmLJ0GsJCt7b/ycFCojgKWIYHR/MLkr0w0IBjahy3fmjQo3F/XaIfCJ8Ivnkouki3NP4TQBg1BNzFoFo0tfGBBhfsZWXkmGzxd+dTYx5jK0q4kSoZH6sPz4DhTnndOIik4DfXTyTjckzCc8OOa7TBhDqYZ9a/SzZ6As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=vR/skz6V; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="vR/skz6V"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e227422e3so155673066b.3
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134190; x=1791738990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJENsM5l+I7saOqNZzmQBdbyBOSHIfwstpe+vUaV7wA=;
        b=vR/skz6Viza0lpJS8v/Xu4JeO814BU5D7aUlMwvPGfCOSVZTuwmklRV8arFAkjlh/3
         mCv/r4y15Ig9+wPkBCc0X37g/F812X+IRMNiNuZapPlkHT9D6pcrM6UQU4pk5yEwnEWf
         7POTHVTkNQk3s6RViCnvHjscjOcCcg0hyfD7mts3/kKI/Vq9HuPR1nu3SVcSBphgFVoj
         z2kCNbT2I8pQtJAwKBMQQIRpUGo4tJZeEoXjcocYgOoeVD+G1qkADMOZeNY5Q731SPfK
         pUbAb6mNlxLH2KS5GXjmR8QKPkjRCMZQc9/7HoEjow2ZIP+eDDfyfsD9Q4IMoPS67wAT
         WqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134190; x=1791738990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJENsM5l+I7saOqNZzmQBdbyBOSHIfwstpe+vUaV7wA=;
        b=CftonXZEOWzSBvH/yLCD+CWgJqqGuWVSWyTFFkf+r786HA+1IlZuWM03+Jqmf9I1J5
         Gqtrcmm+pFJ/DHtp6MsVvcmPYKxqkjUf//7NwBKKc45G767sk9RRrZcxIptgq5pD/hNx
         u1lwSta5aYVR4NHK6M/SoBdMPeCYFQ/CAZDjVJGT6jV/qiFppQF0sDebb9mnUCZH2m/P
         MBMAVev0rK3oK9Zsp3/loyt/1DGGQxvRFPzMR5tCG7ZpP4Ml+LilS0d8rL+ZTjperzbl
         zbquKGJVhpemRC/IGDR1wHtJ5rxnmiFZkNbl7kwryp/29Qz+Xb74B8dclKz7qtCLAPcb
         Bfeg==
X-Forwarded-Encrypted: i=1; AKwUvBw9t0Eph5zKHKY0NqbGf5LtZufAKH74R1aYpyo4VJPljYsd6Su73Z8nFdhFnVs+cvpODXPm92GO4Uz9QRWAbqk=@vger.kernel.org
X-Gm-Message-State: AFuF++lAtJRP9FGec9HCNxvH1ApjKMWzlY2H85thAB2MqjXRLO+S1eKP
	G0RNv1oNMEAQVFleEyeOWhnyTW//N2esn+81ZiNiA94hr9yRr+DRKHMR7Az9nWxuYQ==
X-Gm-Gg: AYBFou0A8E/bOc8yjAa3/+dgWT9uBzLeLqL2uSNJk0kf6iQosFYaIdkRpf73/hnklCx
	ZiDXXjZ2Fnot8zt3JUJqcsoCkVmzne/6gcoGsfdkfZaHU/aorC1eVRxv5a1QqZ9pk2g01ArSBON
	iUohgR+whlseW1elPpvSI3OGgozalK7E8GYCAyosT3Ylp0Ihk1sJxWPPn2hUYweOx7z823eXjqk
	+kfoCmORP1WEP/00Zvhh8RY/3/mH2VyF61URyuQ3YjEu+UnDOttmiVJD/XpsF1JQq7giQJ26em0
	v5tDRkPykXAax95RTh5IzJUih1faiwJgN0D1CIzkFAvKp/h82ojiONY9APyX0Sq6FrGt6koHjHO
	SOcHoryQDK0pV7Y0dBNEMTKyT6q8z0btRyZ11k3g6v/ejioahn4Ebq++Xns4Q+Z/1ufudGgAoup
	xsNk6pZmObwiZduH+/PI4jfy/w6WGkZFVdOnY+sFWokdui792Bl5HpUvVnRPId9Vi9JHfB25rQ8
	Y028RaXcqofmYDfLHCsGEfiGGhv4O7Z916vEI+Vgtyl4MaeFZhFpLS3/5CEMHOcLH89RlDDUoET
	LxdPkkl5zNz9y3i1KXrgGyvWsqNXTjX5LMSElA4V1mgMFXnWBDjWLHiyluHHfsQR0dPfeQ1kYSV
	Vybczpfidee4Zc3scvnGUKMdHmkZ4vJjsB9/ic5wGhzMNQoGIxeu5O/GEMa5s7UdWNwcbbDQCCA
	Q28KqFH7e/gyncNEQcApNVgyI=
X-Received: by 2002:a17:906:ee8d:b0:c29:f5d5:5a9b with SMTP id a640c23a62f3a-c2e4b241d8amr667125966b.37.1791134189545;
        Sun, 04 Oct 2026 10:16:29 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf9ddbesm317345166b.69.2026.10.04.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:29 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	netfilter-devel@vger.kernel.org
Cc: kadlec@netfilter.org,
	fw@strlen.de,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	geldot@protonmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v2 0/4] netfilter: offload a TCP flow whose reply is never seen
Date: Sun,  4 Oct 2026 19:16:24 +0200
Message-ID: <20261004171628.3544978-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A router that sees only one direction of a TCP connection, because the
reply takes another path, cannot offload it: conntrack marks the
client's ACK after the SYN invalid, and the flowtable only takes assured
TCP connections. The setup this comes from is two subnets on one L2
segment, with the server answering over the shared segment.

The series adds no TCP state:
- patch 1 hands that ACK to the existing loose pickup in tcp_new(),
  gated by nf_conntrack_tcp_loose, as if the SYN had not been seen
- patch 2 keeps the reply direction of such a flow on the classic path
  until the connection is assured, as act_ct does for UDP
- patch 3 offloads the connection in the original direction and caps
  the timeout handed back to conntrack at UNACK, as
  nf_conntrack_tcp_packet() does
- patch 4 adds a selftest, which fails without patches 1 to 3

Pablo, on v1 you asked how TCP tracking copes without the reply
direction, and guessed right that the goal is flowtable offload. The
connection is tracked like a loose mid-stream pickup today: window
checks are off in both directions, and a FIN or RST still takes the
flow off the flowtable.

This series was written with the help of an AI coding assistant. I have
reviewed and tested it.

Changes in v2:
- patch 2: the XDP flowtable lookup does not return the held reply tuple
- patch 3: cap the conntrack timeout at UNACK while no reply was seen
- rebased onto nf-next

v1: https://lore.kernel.org/netfilter-devel/20260910090052.2034970-1-julius@bairaktaris.de/

Gary Dotzler (2):
  netfilter: conntrack: pick up a TCP flow whose SYN was never answered
  netfilter: nft_flow_offload: offload a TCP flow that has no reply

Julius Bairaktaris (2):
  netfilter: flowtable: promote a flow offloaded in one direction only
  selftests: netfilter: cover a TCP flow whose reply is never seen

 include/net/netfilter/nf_conntrack_l4proto.h  |  9 +++
 net/netfilter/nf_conntrack_proto_tcp.c        | 16 ++++
 net/netfilter/nf_flow_table_bpf.c             |  4 +
 net/netfilter/nf_flow_table_core.c            |  5 ++
 net/netfilter/nf_flow_table_ip.c              | 26 +++++++
 net/netfilter/nft_flow_offload.c              |  6 +-
 .../selftests/net/netfilter/nft_flowtable.sh  | 75 +++++++++++++++++++
 7 files changed, 139 insertions(+), 2 deletions(-)


base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
-- 
2.53.0

