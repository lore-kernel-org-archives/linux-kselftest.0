Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985286;
	b=g7zAqVQ2Lgngruac+uA58eowDJXIvz+K3YLif7D4U6yBZuld32jhdjyAUtLJxZBUb6Bi
	 QSZPcSWEzXjUDbOeNo6zZDbRwchM5MAAG28U3J2Z4A72/GRin8iWSMuR2BeMwd0UftnO9
	 mgcWnVo2dhwUfmqZBAHzHV/Aq+HOdOBWwOos0KPg5EEPE+fx7slFNInJAOrXQSeo3/yiR
	 Cyefzt685DtL9HFwphF3yx9+SAJtPLNBEUAy8kaXQMaAgXSx4SvnvTx2/iKZANWhMPjsW
	 ghOftdIAuOKjipMIiFcKuPOwiENrzC1OaoixYC6/fxnWIBN2JVriNZMY1TjJLmAm8/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gFMNpPgUqxIZwuBYx5VHNDYSqSG4TYjNvTKYc8aY2So=;
	b=abX72N+4jib27CZEOATF7YGJpbgxKTRitAIOjm72ngM5yBFB0S9RuGurgxVi5lKfb2ff
	 Ys3L1gqBUvt4Fjoyu5pczGsUd6mPKVUtKKYIt+qubXB3qDNT3tLUHImwo4mYL2gVY43li
	 NFh9fQany4ZIRdS4SuaaueRCJMXnNDbw/NmPfXatewtZp5v2P1Git2/57Ue3xNIzH9Zqd
	 bVYH7iSLlczEiQEdWS1iIC02gL0tsN1tnJmIdvk0bK5dH+xpiIoxTYM5cE/cUdsRrH/UH
	 Gt3kW0gzWfcuDfwpXP2wj03HLHBedGCnwkOB1qhjUROqGl1msNdfffyQDoC8TuCvd5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3qjFtiv;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F297606A329
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 17:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F297606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3qjFtiv
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7848935e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 09:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985284; x=1794590084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gFMNpPgUqxIZwuBYx5VHNDYSqSG4TYjNvTKYc8aY2So=;
        b=C3qjFtivHTMqEpliOCOxxhF3ZCmOfyL04GUMc2el0XChisOndRclY0s4aMkvcrDWyI
         kPwgN4eUdVa374BsKE1zgaukiYia5UH7uePCYZjv2O6G8Gsi1epwGY64np2/ZquImhLE
         XVwomB8LtcMWnRbJHU2+L4eVPpIiI8g26WX/E3TgUinuWNK5HyUP4GFXTIJZDDQ9LhLx
         6Q8Q2XaM3PF7Xk/Wj2LrNKzCZrAf8OOQRciKrcnbXyGUV37SkBAHaprRDt4Or6dwPwGA
         28vfQbxjxdhaKLGSDLJKEsi9r9IQrCJ0cRk8kZTLt0vyEUabmVsPBcdGGxWkScwMyDfu
         oG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985284; x=1794590084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFMNpPgUqxIZwuBYx5VHNDYSqSG4TYjNvTKYc8aY2So=;
        b=OC6pWhRvEVtghUKzCEeoidlkjLfdgElwNmw/O16bFD7+TkxOhaXugJKlya2bHQvjZb
         NlwEIfjNUQ9kLM+BBhiC7EQX6NwTKadu18NjTj7QpJYMy/sZwJ2GiKxf8ElMuMXQoOn9
         gtNDWwwAyBoNBXH2XkELcFazIp803RnqltK3+S6+4+81cI/HIUEXUq+vjgiMOnosss2f
         hNVHv+n3r+MSBz6U2FEuayozdfXmwxjvzzRWFj8lh6ynsFMdfNVt1nWpxZlAAHnukTfi
         Khsbey0xCqBgPPnGLXcS5S23jd4rJMvXH+Co1+OcKyhWRs5BTruAvqp4nKhkf6+FGlYY
         fPtg==
X-Forwarded-Encrypted: i=1; AKwUvBxCClk9erLvY0I4jvWifTWOPGyhuWJkAaoQKtPXwHrLRAIImNQxrmJ4K3wi9PaQShg4342l18roHOVoUnf1b/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7qBkXOhD0ztZbwU01oLI/jRFdlyPez2ps0daQ4qRG/kagGRaS
	ud+/hPrAfPyQKx8HHTwMN3IE+tcXORt9DeLv01mahrVCjGSsioLVUyzt
X-Gm-Gg: AYBFou2TQ9M5hX3nk5yfL/Jj4AlhCfDp9i90DgvP1l4LNWJ05r01H7/Diw16sz/uvkh
	7Hv7lpkPnZRgpEbWxNChxQCkr2IyrKajXmc+TCl1mFmDWQmnc2vRGd9wwsMoCrSCvLFRCxQ1mGz
	nTT8pUDJsm4tpBL2SuMRezmdSnLSeuAd9PiZdv9LaMrVKLkOIu/Qz3eCjSyL4Xdg+KaWEE/irpB
	2rEYG9+bN7hiLdYdAJqisy8BtmEUK0F0fDVT5WK7VGJO610rOw1EOy8WYdoNLd3NUzybyfk9Whw
	CaAziHl3YcgyAW5gonNj+cUN9RgvCc6YcsfaVocqi5SkRRRfeHn/+HLZKFLwU54eDlWT1FSG/n4
	l8FolPf1fj1iKnV94a1313U/49f/TSfh3YrpaUn9wkqHR6tXx/IHlzM14dcr2FnBwXIaIxlv2pa
	EVvXeV7HaNcw+Mh2Q1n2QUOAH8mJMgUwFOLdz2kZ3Rlo//Vh6hIhC1PoSLIuZwTg0Li9xdEyGT3
	uYIUeuww11SYAP7a47KJF8B1ipVkQ3yQX+U+XY0cUBuZfvua1ULClzpcSQH/7ThOtacCjcEJKIQ
	udhnSOFmxTADnTrmPaXmPXjUuXC2TNN6H49F5bKfwK66Zh+dgprWTJFRQtCUxPquMRN3iwOXiO7
	pPD15Wl7cvU+/UyW6MH8uVS1Xqapow5hoNhuuHK5d2yb9T6qZw1zQzDeI1tF4+DLoeptSC+JCIb
	c3BMIu/NTvg0ySHUOKQy+3P//PXVXmEcG360tFx/C+TmIOVmnh8sFesW6KQXr9mA==
X-Received: by 2002:a05:600c:5391:b0:4b1:4da2:ca99 with SMTP id 5b1f17b1804b1-4b6dd82a9aamr53584665e9.10.1793985284502;
        Fri, 06 Nov 2026 09:14:44 -0800 (PST)
Received: from localhost.localdomain ([90.95.39.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46489sm148071985e9.3.2026.11.06.09.14.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 09:14:44 -0800 (PST)
From: Florin Badita-Nistor <baditaflorin@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 0/2] tcp: fix false exhaustion of odd-sized bind port ranges
Date: Fri,  6 Nov 2026 19:14:40 +0200
Message-ID: <20261106171442.31811-1-baditaflorin@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Fix false bind() exhaustion when an odd-sized local port range still
contains an eligible free port. The wrap can flip parity in odd-sized
ranges; even-sized scan sequences are unchanged. The namespace-wide
connect() allocator is not changed by this series.

Earlier x86-64 KVM validation of this unchanged allocator/test code:
- Regression test: four failures before, zero after (eight cases).
- Full port-range suite: four failures before, zero after (80 cases);
  two existing SCTP XPASS results unchanged.
- Go net.Listen, 100 attempts per IP version: 100 failures before,
  zero after; explicit free-port controls succeed in both kernels.

Changes in v2:
- Target net-next and drop the stable Cc, as requested by Eric.
- Document parity changes on odd wraps and scope the fix to bind().
- Shorten the cover letter.

v1: https://lore.kernel.org/netdev/CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com/

Florin Badita-Nistor (2):
  tcp: avoid false bind exhaustion with odd-sized port ranges
  selftests/net: cover odd-sized local port ranges with one free port

 net/ipv4/inet_connection_sock.c               |  2 -
 .../selftests/net/ip_local_port_range.c       | 67 ++++++++++++++++++-
 2 files changed, 64 insertions(+), 5 deletions(-)


base-commit: bb67589c87249c9bc2415ab11a754d6e303774e3
-- 
2.51.0

