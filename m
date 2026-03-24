Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22223AC0C6
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332267; cv=none; b=jnw2riLd7fFLC2h/a+/qfcYP9fhtLUDxwE9xlMF9YUgOrKbnqMTsrH2yvGky8Z/bgh1A/zArXtg1/YF7t1WfQJjpKTQcYmd9GyJpK54aK+E0Gs8nBpAWcuSwrGRgrwBJ2Gk8jUdqJ7kCZweqhAheVPuPzVPKawwvoUg8DHw4Sw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332267; c=relaxed/simple;
	bh=26i1VlGHPVJPO2ACFKcL2SsSaS2lRM1qcERjVWdSklM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aoOmugpuhbYP+vNgQDLmIQhaB99iVDUApO41q09O/1InUX+6ZnbShlpj93Uwbqon4l685GBFtAjGO43prlX7TcSu9iXC6ptzjZn3pppWoCQdyCctr/SiHfpytHdFpIW++y8OntFS80/7UYYm3mW/PlWAf1UmammJ/pH21PUMmvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNUZPI81; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNUZPI81"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d751ef36ccso1824156a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 23:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774332263; x=1774937063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXxXF6JthqgVazDRt0dSHWifir8Ryp7bwwT8LqL/1Pc=;
        b=DNUZPI814vvOqSP6oHM1c6Vdxeze9ClyuecM/lPFExXJd9zWf9rfEdsFFFJ/zEU4ti
         woWF0QP24I+KGCXk9A/H7k7cIQ6TzceEsw2qs7hTyNQQkriIkjX5a7zugceNF7d3s3W3
         t4hbJPxSAV1d6KO0gC4WOuk70ROmjlsAA5PL47GTT7qCS1KtKDId1C8pa+wZpJsiF71s
         4Ih3swUYSA9hk+tIlQaCvl0ZwjWxQ0XNrPMp+3iEhHyFQp2u+Gr0vLOsP6mWVymO+5tV
         Hjyx/l6d/vjak84Nt0nNneH8wKlZUTp58XywtNbueSd956U8tq6+X30g9Nuq2W+lXuPL
         GQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774332263; x=1774937063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXxXF6JthqgVazDRt0dSHWifir8Ryp7bwwT8LqL/1Pc=;
        b=cOoed2W5CLLW5EtLx36TOeawOuE8UrJgtKs8MeXcnybDYw7urdvLT1xer9r0JBVU3m
         y4iSdRS5hcpHY+Ifx135zXRpbET/voKaoEdgfiefA7HENLkRA2zHKwIMhdfZseoSIBgG
         KOxVQzmQbm+wUs38y1m5ijAbOs+3Fqj+njeS7pvN2FjqPydqQTfexEp5enz+ShKDZTHn
         8Sl2gfKxiK+ONh52uzAykTH5knBrw3DBHvmefOvhkIiy/wLftTi8aPBJD1+pRrzCFSao
         DdWjdjFhjQsIy2KIcHRdrTsf2/EUKPdYrhYMdzu2QD9EQbU0JSCprfkIS3H68HElP58B
         WdnA==
X-Gm-Message-State: AOJu0YxhD5/D7T7XFZL5Sk00J34HhKvJnBYS+rXOOVMjD0TwA84DD3GR
	bQMy195cJ8o8sv3641dD4Fn1uCLQpGTz7hCLlXnhqNxURxQXwT6/kM6t
X-Gm-Gg: ATEYQzyFrYXYTzAE/pPrQB2jOpdfUYREpNGBVWL9PtVSI9Kf+uEYSo/fp58asseLs35
	GsVJgIqCF1OIEynt1Y/KXgZkQEZxTjOAUzb7esZgT9n+YOdyXkgqFR1ijBkbgvBejxLl5RXbJqL
	HS2Q2MPE+wl6MEF5ekwf21HSD7a/cb8VOUqlyRY0O4jbz3OuaAIoP8FWc28YdgI9ifEuXahpwK5
	Gu+mJBtmCXbFHz1scZrpZSJOjJE1E/t2ojXtxWhC5jON4835OrOHa5/VyseOPM4SC/IaY/fO9YB
	LKkLe41wdWXPjkc9WOX+XS+oEUmN3fz3nFi7Y3CH/nTU5yE00NSDKV+A5RroXVt2ZXxt4iECfbf
	l/MK2BfvlIplYiEDSnZns6mDfkmlziK5JWyX/56XTYAgYjdPCh4+JcAR/XP1XuCKG9FWC3AY1Ag
	EnTO7OzMWsspNBq5e3vFtn84f2gY/KkfVs/b078qj5x8vuBC7xF21wWWThAmflHEiBOUeUs8vOw
	TbRJ4Scd7cZtzcgNcjvkx94R4h4CZY54rVCEw/62g==
X-Received: by 2002:a05:6830:4118:b0:7d9:ad99:9ff0 with SMTP id 46e09a7af769-7d9ad99a072mr6395542a34.30.1774332262611;
        Mon, 23 Mar 2026 23:04:22 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eadcb757sm11429957a34.15.2026.03.23.23.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:04:22 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	gmbnomis@gmail.com,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next v2 0/3] tcp: fix scaled no-shrink rwnd quantization slack
Date: Tue, 24 Mar 2026 00:04:07 -0600
Message-ID: <20260324060410.1137199-1-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this v2 addresses the review on the earlier quantization series.

Simon was right that the original 3/3 only showed the explicit
rcv_ssthresh-limited ALIGN-up behavior. For v2, 3/3 is replaced with an
OOO-memory-based reproducer that first grows rcv_ssthresh with in-order
data and then drives raw backed free_space below rcv_ssthresh without
advancing rcv_nxt. In the instrumented old-behavior run that shaped this
test, the critical ACK reached free_space=86190, rcv_ssthresh=86286,
and still advertised 87040 (85 << 10). With 2/3 applied, the same ACK
stays at 84.

That follow-up also clarified why the broader 2/3 change is required.
A narrower variant that preserved the old rcv_ssthresh-limited ALIGN-up
behavior was not sufficient: earlier ACKs still stored 85 in tp->rcv_wnd,
and tcp_select_window() later preserved that extra unit because shrinking
was disallowed. Keeping tp->rcv_wnd representable across the scaled
no-shrink path is what lets later ACKs settle at the correct
wire-visible edge.

Problem
=======

In the scaled no-shrink path, __tcp_select_window() rounds free_space up
to the receive-window scale quantum:

  window = ALIGN(free_space, 1 << tp->rx_opt.rcv_wscale);

When raw backed free_space sits just below the next quantum, that can
expose fresh sender-visible credit that is not actually backed by the
current receive-memory state.

Approach
========

This repost keeps only the part with a clear fail-before/pass-after
story today:

  - relax one unrelated packetdrill test which was pinning an
    incidental advertised window
  - keep tp->rcv_wnd representable in scaled units by rounding larger
    windows down to the scale quantum
  - preserve only the small non-zero case that would otherwise scale
    away to zero; changing that longstanding non-zero-to-zero behavior
    would be a separate change from the bug proven here
  - prove the actual raw-free_space case with a packetdrill sequence
    that reaches free_space < rcv_ssthresh without changing SO_RCVBUF
    after the handshake

Tests
=====

Local validation:
- git diff --check
- checkpatch on the touched diff
- local vmksft targeted run of
  net/packetdrill:tcp_rcv_quantization_credit.pkt passes with this
  series applied for ipv4, ipv6, and ipv4-mapped-ipv6
- the same packetdrill fails on HEAD without 2/3 with:

    expected: win 84
      actual: win 85

Changes in v2
=============

- leave 1/3 unchanged
- rename gran to granularity in 2/3
- clarify in 2/3 why representable tp->rcv_wnd state is required across
  later no-shrink transitions
- clarify in 2/3 that the smaller longstanding non-zero case remains
  intentionally unchanged in this series
- replace 3/3 with the proven OOO-memory reproducer for the raw
  free_space case
- drop the IPv4-only restriction in 3/3 after validating the test on
  the default packetdrill protocol set

Series layout
=============

  1/3 selftests: packetdrill: stop pinning rwnd in tcp_ooo_rcv_mss
  2/3 tcp: keep scaled no-shrink window representable
  3/3 selftests: packetdrill: cover scaled rwnd quantization slack

Thanks,
Wesley Atwell

---
 net/ipv4/tcp_output.c                              | 16 +++++++++++-----
 .../selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt |  8 +++++---
 .../packetdrill/tcp_rcv_quantization_credit.pkt   | 62 ++++++++++++++++++++++
 3 files changed, 78 insertions(+), 8 deletions(-)

-- 
2.43.0
