Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514335;
	b=lqPv+vGFcJJXWyNyhMYbS05HKx1S2b0sFc1NkMXwgUiXVuz8mFEPNp3dpGNl8hlSHnbR
	 mpy+28wJWzB66cqDqEKG0Hx5wDTyXua2/+sBiJCzwxMdYKNC1rWP41rcGml432M+cR+gc
	 BH6HTrZRhEMTG86eC3451GoHgILOvcoT32VsPABktLqb8rDTSOyn3LRJN9zEJVhVAZ/Ku
	 WxA2cW96acTULN1O3uXngH35pJnwHaGo75ynaLFCWFD5L90ahlJwsUwEPwBxuqPy0KAHT
	 BC9RnZpdYUhcVH7D3NfWuIH+HXywJ1jIsWRFkxbBrOVAs6S8XLzbEqE080xCfFU8uXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=sDjon1YkUVWurgE5DJMJ6q2wA36HR6BPkBAGDJ72h40=;
	b=fxwQcYVpPk6qna6RrmV9IknUR74HsxZelv/9Cn0WDpG0/u0hEYHWhRGJIQ/cp6ct7HLn
	 U8htgQocgOfnfd+UzWT6ZaltfOcHm+zKGI9msVWHiMjzRW29IUsiN1VJJ/GdyRDEtDvuh
	 1TDcBNIUdbC3nOJ62QXfaLlQ/FhLFf3uYcwj+DT0ZgmK6MLdqUWpauKjXdOwm9F9GJBZZ
	 uOVi/f6eRuEIYxEglAgPGfXR5lhW9N2wBOUKnDIHlp6naA47undJ6llQvrALKKetQY2hg
	 UiNCr2kFghmpENL+CQbsL4NQcLuzbgWggUsOmo6z0Rq5LZlZqwigcFlq9Zud8oOQI8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I7Tntm94;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF60606A329
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 16:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF60606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I7Tntm94
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so2001171a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 09:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514334; x=1793119134; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDjon1YkUVWurgE5DJMJ6q2wA36HR6BPkBAGDJ72h40=;
        b=I7Tntm94j8c0Q8gLG41FPMx2WyEWKyt0E38yxMVI41VjSu+z9qns+7msJUMbUNkFd9
         xB41viVNbbE+4C4uAPx5QY2yO7GSnumcFJUnD/83oMAWIeR1wK1IggzSnGFvbNe12Ukh
         cM1v+21hIQYVrtA0cRZCIWRJF4UlqpRn/5I2BjgmYxOEe3B283eGoDohwDHfZR0/2yGq
         UxmGWAdCuiKsBXicVDk2G8E5YhnoNGNmnyxSdRH2d8R+jzy4RbSPy27x0a4WEuARY382
         Gwkr1gCAC4dXSa0sP+OPwfxSIAwc7tryCKogk7BiOaElq+TuRFYXDOslNl1IUW/ZvMS4
         /7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514334; x=1793119134;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDjon1YkUVWurgE5DJMJ6q2wA36HR6BPkBAGDJ72h40=;
        b=N69xxsrU8FE2bJSDSbTMH6Uwz9ATadZPmKZPXHtXBt2Pwn5+qevfjNY26iqiPPy7kI
         1TbKRdtHk9bJSHqvRaHFTBwy/Hk2ebfe8NLSSiY9UJp5oomHthd6vpZW0IqsLnq48u80
         /Qafm65ivpK3XF8LqIJ77/30aF8RbKjlh4Y2RFTEtOp1os25j9D7XkCLgB/Md+5a5IQc
         PQvPWuOyyTixxNYmHokMuqgWMFYeLWGML53DStOmoDRCEBKq62M0jcCkfSQOC4WrFu37
         82Begqi2EAanDLbk/J39YVsI6ONH6HNr4I+2CDgJ7ozXqEw7QqF3MgKTXGBEVe8oOL+0
         ILoA==
X-Forwarded-Encrypted: i=1; AKwUvBzCRWt20WhGhVEaIqxc6SszYAB/hbruq9/bbNXKLlNMiekaAh7aAVbVZpb/gCWJpv6Atkm+4Pw2x9VI21LDdLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLScQ+OM4ivM/eZ4smYlWkc56bI7IReeWVcSxwXORWBnVhy60NP
	eaxRnk7OOzU5bNj4jONCj3KDopaxpFnYTszFWZkKMusOfbSiRXfwsxdRW0+zKm1lvlyxYJsX0vS
	TWA==
X-Received: from pfbhb21.prod.google.com ([2002:a05:6a00:8595:b0:89f:4790:689a])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:ce4a:b0:3e2:1f0b:5987
 with SMTP id adf61e73a8af0-3e2260d724cmr8507365637.86.1792514334035; Tue, 20
 Oct 2026 09:38:54 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:38:33 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163835.4076594-1-tavip@google.com>
Subject: [PATCH net v2 0/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
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
 .../testing/selftests/net/packetdrill/config  |   1 +
 .../selftests/net/packetdrill/ksft_runner.sh  |   6 +
 .../tcp_wmem_schedule_negative_fwd_alloc.pkt  | 117 ++++++++++++++++++
 4 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt

-- 
2.56.0.212.g129ede20d9-goog

