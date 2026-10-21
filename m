Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792608894;
	b=JX1K3/tfVWD3868QCC06uFU2bjao0xnUGUL8qmb8Wgebdc30p7nNlcXTBmZ+EPxDQ23X
	 KVmc3iOcSdUgsetpNmed0hB5UK50TFXxtAFOBIlzPI72VR/Exeo1S9iazuNblFQbcI0aO
	 rCwuRB66sU43uuvCXifEovHhK2EWmcMNSa6iBRra2CmUSbqhMpJFTB4U82uRpaOs01IX8
	 czzs1YOrLC1R8pCgjq97qC+Yx3PqDhDqLIoJTNQxdcToR+HY9PqQlhdNLm41ZWuZmb9k8
	 ASgg8sfx/9HTfHFkoZFJilz0c5qYCMtd51vmw2jLrDImN2zrd9RTvmL4TGn3DQg5d5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792608894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=evqUTScwj7JpPtdxxI6LCeknumzP3zX6/O6PLFki9Bs=;
	b=BfF/cEmckl5hOCyP6FDEu9ECoTNFmE/uOleSLiBoovSjfWBUqQFKFLVo4rvf7fe6+NyJ
	 tD30nnYIzY06pugoAPwkMhHGhw2Jfq9g4ScxTYHJ2gLyWAwVR0/VJj9iP9EEmQFT/R+0M
	 Ta36GG+dFUtu1q34pRAOPaFIRr/KP/GR2yw/uB7etMwRRHm7R4fBCwzY9Cz+BgT2qS+ei
	 bQ/E+lZrMTpHPDKZGDAQYdH0YSfYY5rOFan6q2E/018t+cJe5iFDpZW3yQIkxBLfeWjAT
	 g5cTZOUtL0AkgTRVjtyZTBOCNofKJQ4EZVg/aO7+H29Br9OdJfVbakQqeCk6J7A8vWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=HQfAkshf;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A05606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 18:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=HQfAkshf
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so875699a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792608893; x=1793213693; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=evqUTScwj7JpPtdxxI6LCeknumzP3zX6/O6PLFki9Bs=;
        b=HQfAkshfGgmdgy51XuGn6kwypo+yJ/E7dkp5yOvzn5WI+LceHafBAoKcctg/LgQsEB
         Emcjd0v2LfH3BKPHGzUgUY3Pb8Xdu1sRHChu39gCU61h8K67pti+w95CZpXMdt7LPisr
         F4P2M3iTxQgAyAN6H9wM/sOGGL4K/HdwHq1EPgnPL20yawENY45UbVMo4xZjaaRdpy2c
         AJnHF0YFVlFx5CktIDQwdq0UYAIkwMEV2d+8/kwYA6JksV1n/OQ8zGe2/pPMJLXagyCP
         agPssGC3a4NC4b4qjhoDADSuJL+ih67eflesRpou5fRTM5EUULKqYml3r0S+BUNPKXuf
         /RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792608893; x=1793213693;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evqUTScwj7JpPtdxxI6LCeknumzP3zX6/O6PLFki9Bs=;
        b=yqx/jq75Tu1RA4u+TIPaNyv21yfMAoKZZCL/zW5V0UjGDquSMOd2WzHod0deJr6iiO
         pxVm1ynpqE6bPnFIAHc4D4KptQHYWTcojbK3THkWvMJgj7uwMr5A94hQ1V5kYrv8RzPu
         5XQfJvxEH+lYyqyIZlnJ1pk4mo2su6uoUpfxcMEbKYh6DSafeKUOG/vFGOub/+S5Xol9
         kjJMGM7mfD8OYziEyQPyZPyK3PHQct6wtu3pNP1vui+dOOdKR/wmFD82XVoVQS7+UMY5
         iun3GAtZ2c7ziJL7sZZIPc6B6zrVrj+7+sVw81I6RLouywVIVRFykFznWeqPifOw2WjL
         jXug==
X-Forwarded-Encrypted: i=1; AKwUvBysrbK1e7x/of3cBl+J1114olb72y4MtQppuYnG/1hu6Wb5UeGHjFcAUNAUXw87N3Wh+RnxACTHvj938rMPfDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5VffWhnWCq4o9It0SpfJdkyAZdEWvcpnTeoWA1gwSonQGQhgQ
	9OBi8OYhOCbe1hmUr2yPS2dBZqkoZWI/uXxuAXymcCy4Jvsy4asBdLxSGH1/nUil13IWz020/F7
	yhA==
X-Received: from pjhr18.prod.google.com ([2002:a17:90a:5012:b0:3a8:316e:fcac])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3912:b0:3ac:adce:60b5
 with SMTP id 98e67ed59e1d1-3ad86e97f66mr2385606a91.14.1792608892465; Wed, 21
 Oct 2026 11:54:52 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:54:45 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261021185447.2914274-1-tavip@google.com>
Subject: [PATCH net v3 0/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Octavian Purdila <tavip@google.com>
Content-Type: text/plain; charset="UTF-8"

This series fixes a bug discovered in production in tcp_wmem_schedule()
where a negative sk->sk_forward_alloc under TCP memory pressure causes
tcp_wmem_schedule() to return a negative copy length when
sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0].

sk->sk_forward_alloc can transiently become negative when tcp_collapse()
re-packs partially read or high payload-to-truesize SKBs in the receive
queue and charges newly allocated SKBs via sk_mem_charge() before
freeing the original SKBs. When a subsequent send hits memory pressure
in sk_wmem_schedule() with sk->sk_wmem_queued >= sysctl_tcp_wmem[0],
tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc) < 0.
Callers such as tcp_sendmsg_locked() then pass that negative copy length
to skb_copy_to_page_nocache() -> copy_from_iter_full() ->
check_copy_size(), triggering WARN_ON_ONCE(bytes > INT_MAX) in
production and returning -EFAULT instead of waiting for memory or
returning -EAGAIN.

Patch 1 clamps the return value of tcp_wmem_schedule() to [0, copy] so
a negative sk->sk_forward_alloc is treated as 0 available bytes.
Patch 2 adds a packetdrill selftest that reproduces the negative
sk->sk_forward_alloc condition via tcp_collapse() under memory pressure
and verifies that a non-blocking write fails with EAGAIN rather than
EFAULT.

Changes in v3:
- Fix packetdrill test failure in netdev CI (CONFIG_MAX_SKB_FRAGS=17):
  adjust segment sizes (35 KB) and buffer limits so the receive SKB
  truesize is identical across CONFIG_MAX_SKB_FRAGS=17 and 45, and
  tcp_collapse() deterministically drives sk_forward_alloc below -16 KB
  without invoking the memcg OOM killer.

Changes in v2:
- Include production warning trace in Patch 1 commit message.
- Skip the packetdrill test when PAGE_SIZE != 4096 via
  --define=REQUIRES_PAGESIZE="4096" in ksft_runner.sh.
- Collect Reviewed-by tags from Kuniyuki Iwashima and Eric Dumazet.

Octavian Purdila (2):
  tcp: clamp return value of tcp_wmem_schedule() to non-negative
  selftests: net: packetdrill: add test for negative sk_forward_alloc in
    tcp_wmem_schedule()

 net/ipv4/tcp.c                                |   2 +-
 .../testing/selftests/net/packetdrill/config  |   2 +
 .../selftests/net/packetdrill/ksft_runner.sh  |   6 +
 .../tcp_wmem_schedule_negative_fwd_alloc.pkt  | 108 ++++++++++++++++++
 4 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt

-- 
2.56.0.307.g5fe7bd680c-goog

