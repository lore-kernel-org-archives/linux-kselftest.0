Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334711;
	b=hN3pUM5gn618gdRZPDfykPEoHhSBs9i/ZHt95Kos8R3T3QxZ+Wp5bUoG2XH8gpXu9o3k
	 uSeY80Z0wJVSUNDNOKXtV8cpIhWO7DHc2zUy/Uu7BnIcIgEseMkVps2jo0xMs0FtOTE1q
	 A/y75MxEZZiUXFGpS82SrhUrtchjJJD7WK01O15PYkCsdhFMIVqZH+UljRG/r8Vymr7ah
	 ybAP1waU1q8G56f+NCyhesMfdQwJwLv0xLfcSCSNCy8txDFG2gkNosEKD3u+Q2c/66XdR
	 M1aWc5S2TvymGIcyYPqQGPV/K+CGR6bX7jJb4u2vwOfUumV2dRiiXhR08rLCQ2RlObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=io8JORXoJvhQnQrjoZCgz8Xcl3owpfnw9TmdubvOgOw=;
	b=hXsjFepl77z2ZhiteELs5b/9yVlyF6OzASn7adBLqSHpKgCEsh4scjHi6okac/kGKsXx
	 l7tYesmcOBRs4bJwNHCwU8PAR+VEDXp+o0I3Mz5L3ZFSF+9OxEyrcq92H/uFl2p09AGJl
	 CqrVI7x/UH9yxoUuL/N2Kq65Huhknh1zep2POB/jz2f6Gjk15FnY3BeuYZotTomol9YbI
	 LgHXhEPr+JuAZqBtKKVYfbQbD2fHduh4vFly3VTZAMInUGq3CTbqJkM5p7GO5CaeIE5Qg
	 IQNfOsACHdbOQEnRsRwLiC99i304QKiQ/v5h7j1RazbYvISC+G/aeC9fbzIZou7i51A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CowTEKHI;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E60606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CowTEKHI
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so412591b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 21:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793334710; x=1793939510; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io8JORXoJvhQnQrjoZCgz8Xcl3owpfnw9TmdubvOgOw=;
        b=CowTEKHI5sIJmXyky4r4dCX5ALZx+ZPyS2q31kY/7bqpb4J9Zz7Ughg5k72s0+J36w
         Cq11T3mUm2547HQfWuIYeoKdMgvfsqLj1loT02IERNVfLsOvlUyEIGJPoSjLtz/JRX7N
         astphQmvFEQ0DSlB4U5k1bB6sdv9PVwkREyxWZNWOzlHc+UdD2vOZDyrNwFlLKwx9hZH
         2JN3wc9IU0MbqWs2Uni+n5f1Vz8q2hLiD3s0ysUdMMADtkES2SSsgeNXDH/t6SY4jKEY
         XAXOF/1EV+LIQc1v5AHXwY7osxiEnRLSEFpHsTrgP7713lPIn/kCUcarlS6d/lwx/U2b
         HZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334710; x=1793939510;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=io8JORXoJvhQnQrjoZCgz8Xcl3owpfnw9TmdubvOgOw=;
        b=kMGCqakdwatcmA9w0AqMp/06Id4glAnhQjpAyLYU+RuxqvBYUTTyq1sa5IMWqRAEAG
         R+Ggd06C6W0UJDsPQH6RYPCGSj2SzIIUN3SPAq+Xbg+kfXl3TMynW7bTG9bB+Tpibm+g
         8jaVwhNTqWtqRFVGMRLIFN8qnZgG3cJoy16GuPt2q7ZUYQ9lmtcHolSrm5SX0EUw1Cgo
         x9O5io8g3LoEwYUMfHtic/c0794KCnNxzLM29F9TC9YWY5pOygAPM2XYA4Mdwx2fv+jv
         T56c8NtLbmZPxYIio7a4edpu/9ao9RQRGoEFpxAAAQJiBeIHwrK7FRyFP4uSWAYkbuTo
         ptqA==
X-Forwarded-Encrypted: i=1; AKwUvByUKyzKH+oSgjt4cB8nt+9xHBG08Zk6RWZNSsoSs4gSwYC3IPGBMJ9VYhEObdoM53SArObrx1B/B1Fw75eext8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg0JN5RZPbP2ZJVqvWvwMS5LVEyw/FYiWdYvuDkco6IQGWhKPY
	x33kPUF/DPM8t0hJYSnzu6G43hgf4tni4brL1bcbHeXcJQbBNZI60YAvEriL9mcJh2EEcIUsrvq
	EjX2mXQ==
X-Received: from pfbdr6.prod.google.com ([2002:a05:6a00:4a86:b0:8a6:c8f0:ec6d])
 (user=weiwan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2388:b0:899:13ee:1bd7
 with SMTP id d2e1a72fcca58-8a9bf04faecmr1031284b3a.35.1793334709539; Thu, 29
 Oct 2026 21:31:49 -0700 (PDT)
Date: Fri, 30 Oct 2026 04:31:43 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030043145.2185700-1-weiwan@google.com>
Subject: [PATCH net v2 0/2] net: psp: preserve SKB_EXT_PSP across packet scrubbing
From: Wei Wang <weiwan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Wei Wang <weiwan@google.com>
Content-Type: text/plain; charset="UTF-8"

When a virtual interface such as netkit is associated with a PSP device
in another network namespace via PSP_CMD_DEV_ASSOC, incoming PSP packets
decapsulated on the physical device lose their SKB_EXT_PSP extension
when scrubbed during redirection (e.g. skb_do_redirect() or
netkit_xmit() calling skb_scrub_packet()). As a result,
__psp_sk_rx_policy_check() rejects incoming PSP-encrypted TCP data
segments at the socket layer.

This gap slipped through the existing psp.py selftests because both
_data_basic_send() and _data_basic_send_netkit_psp_assoc() only sent a
unidirectional data stream from the test socket to psp_responder; the
returning pure TCP ACKs had SKB_EXT_PSP stripped by skb_scrub_packet(),
but were still accepted by __psp_sk_rx_policy_check() while peer_tx was
unset.

Patch 1 (originally from Jakub Sitnicki's BPF skb extension series [1])
introduces skb_ext_scrub() to selectively preserve SKB_EXT_PSP during
skb_scrub_packet().

Patch 2 updates the psp.py selftests to exercise bidirectional PSP data
transfer using psp_responder's "data echo" command in both direct and
netkit dev-assoc test cases.

Changes in v2:
- Patch 1: Replace the skb_ext_del() loop in skb_ext_scrub() with
  skb_ext_reset() + skb_ext_add() (and a fast path when SKB_EXT_PSP is
  the only extension in the skb_ext buffer) so shared skb_ext buffers
  with refcounted extensions (SKB_EXT_SEC_PATH / SKB_EXT_MCTP) are not
  left half-deleted; clear skb->decrypted if skb_ext_add() fails.
- Patch 1: Make skb_ext_scrub() static in net/core/skbuff.c and drop
  EXPORT_SYMBOL() / public header prototype.

Link: https://lore.kernel.org/netdev/20260910-bpf-meta-inside-skb-ext-v2-3-0b21e42180b0@cloudflare.com/ [1]

Wei Wang (2):
  net: Make PSP skb extension survive packet scrubbing
  selftests/net: psp: test bidirectional data transfer

 net/core/skbuff.c                          | 31 ++++++++++++++++++++--
 tools/testing/selftests/drivers/net/psp.py |  8 ++++++
 2 files changed, 37 insertions(+), 2 deletions(-)

-- 
2.56.0.317.g454f8302e1-goog

