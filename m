Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1CA3B7B7E
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215792; cv=none; b=QnQ6ujIxSkz5r7FJD4i4giZY8skCgApSjhNlhiy73CU1yVfv7Iq+zCtgpLtmfbQ5zSxdqzR6yxdFE31Ny10nLUNEOo5eqkVTqmAvbIAis95ndQJ3nqqr5B80FQ+4krS9xRAZCLHuJoSlWD1kEtt5rUhr6/aidPEM2JPoDWq/Lww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215792; c=relaxed/simple;
	bh=FDmpie23sScGP+OdflWzKGb+2xENXEuu2nCfUaQR7H8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HVD5x8IjLl7FBj4QjMmTvqcEpAwalopu4ru/AlnptqUunhNVIZua9jC9p5G1eRahlPilNT7qPtBfDrkYZEn2PwyCiuAhWAYliT0pW3fZh1DaZMjMTTk7HAmmeZWxERI/KJ+uJqNfCUZrJbVbwAyhiCF+hfyeIB+PCJErStoQAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ep5ux/fP; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ep5ux/fP"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4171ff4cb2cso1991655fac.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 00:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215787; x=1773820587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DRAOu3vndgNWWBgUC2jVEJ5hsRD9mDPq+B8T4vBDYFI=;
        b=Ep5ux/fPJChFYDWKlpLfuOO1GEiWepqX5YSftIEKjejsYgGZEgeFdk7VC2EWhb8sjw
         yZnAWSme2lhdMgJGZLPGlkWY87JyXHwKw4yrx4cKfk23r8vUdUGfRNsGcr3wepcvvpnX
         +ZBiNo36lnBHhItUD6h+wVdvz4jzLaBKAlOq1ct3IXYo96QCzlMTTcFLlSNkm0Gy/73m
         dbxk/35kkRGr+emMCJkLKVbfK+YxTXvDUZ1LCaE3Y2UvyHgKdd2b9BZSFfc8E3U8nK5s
         GoY5MNQo7LXXV+p5HCmzioTWpk5jhKPwayapprzlHQmD1/h79E7bvS/tQtw1ERPogvQg
         3hUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215787; x=1773820587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRAOu3vndgNWWBgUC2jVEJ5hsRD9mDPq+B8T4vBDYFI=;
        b=gYjAMm4gac61BTpuRL+Ql3NrSP9XvYV+zOKUYnyMkBhRkWRGhni84rgyhZIdd+uk80
         IGT4B0Oc4WOvcNRQ8mnmGS3OE/j3Fr2stJRim3w0i9Yqyx3MjA8WIoEFIFTkuNXtHr2S
         wexGddCHfMS5LpTzwSPw+hAZ+QGwN80yew+UklTzLmxpjSNeKPnBbVyz38QIFyjmdvKn
         iWHl5AHsId4bF52oKwFCKhEyxXsHgphBEtr0SwpOg0vRMANbj5l19z7zN5yTwpOm+Sk1
         KcBMK6GVlbTduImL/HusCTiYD1MvvrxdE+3OSisD6obBAJA6WuSWYtksuevAZklgxegb
         koSA==
X-Forwarded-Encrypted: i=1; AJvYcCVnyuRSPLx4kPAHxH66r2JI6AjRjQfe+cYuYm9LPgWjMfzO1ZDXdxhq608XNThfJx3pfdnel/kLhSBAeXfWgE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9XiuWLT2atkkZi9FYSXFVXUqXYwnKkLlaomPRknCXL7H51aC0
	lobepYAOcaulw7L3mskarop/D3vKSCjwplcIzf2FreRPNN2u4zSooq7R
X-Gm-Gg: ATEYQzzEknwxnfYowyitL8C9RE71jpH+sGWAIznI40Up02k/2XZETKyPwzGP/C4PKpC
	yOv9WEPQ0FXemfd0TtXEEl/jXOjxGKsHszrGvhsiNYRT4YRRe+ek/tyh8st8ALbMQeGAYIyfM34
	l9xAoN7jkrQqKtojrKf7a8amXMS23fJQzNmwJ1pk2qvHwshgn7HugilDIoan1YGkSdBMkl98KpQ
	aEmRqwWritoYyb2Tze0ZrOaGz/Nua7uzNSJGLEVCAMGixT/HQplZDpLlqSx6aItvY+bUNLoOfZF
	54UgAgCWegwg3s70WnAKO2S3zl7Ydh4xZR1Ie9MR5yFSdBkSKdGxURVc6zmq7Xwcq3v/a4J0bHE
	mJokmDtv/LnMelEzgitSKye8gfY048LWJZuzfzBxssH6p8PJKr9JsfeYQFgug4bg9f4GcWy5gwv
	tpcXudlpNyury3wRn1j0D83IXv9sIIxnZiVaAH6iaP/vzWwLZL4kMXRy4FBMOC/iibUudn2ts8Q
	rlTUZzmTb39w2VkceWpj3XlkHiych2oqx3OZAlkY0z+zeuQ
X-Received: by 2002:a05:6871:8a5:b0:409:6862:aba5 with SMTP id 586e51a60fabf-4177ca9e65dmr1127232fac.25.1773215786910;
        Wed, 11 Mar 2026 00:56:26 -0700 (PDT)
Received: from localhost.localdomain (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm1568938fac.16.2026.03.11.00.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:56:25 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	ncardwell@google.com,
	dsahern@kernel.org,
	matttbe@kernel.org,
	martineau@kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev
Cc: kuniyu@google.com,
	horms@kernel.org,
	geliang@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	0x7f454c46@gmail.com,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	atwellwea@gmail.com
Subject: [PATCH net 0/7] tcp: preserve advertised rwnd accounting across receive-memory decisions
Date: Wed, 11 Mar 2026 01:55:53 -0600
Message-Id: <20260311075600.948413-1-atwellwea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series keeps sender-visible TCP receive-window accounting tied to the
scaling basis that was in force when the window was advertised.

Problem
-------

`tp->rcv_wnd` is an advertised promise to the sender, but later
receive-memory admission and clamping could reconstruct that promise
through the mutable live `scaling_ratio`. After ratio drift, the stack
could retain or advertise a receive window that no longer matched the
local hard rmem budget.

Fix
---

- store the advertise-time scaling basis alongside `tp->rcv_wnd`
- refresh that pair at the TCP and MPTCP receive-window write sites
- consume the snapshot in receive-memory admission, clamping, and the
  scaled-window quantization path
- preserve the snapshot across `TCP_REPAIR_WINDOW` restore when userspace
  provides it, and fall back safely when legacy userspace cannot
- expose the accounting in tracepoints and cover the ABI/runtime contract
  in selftests

Series layout
-------------

1. track the receive-window snapshot state and helpers
2. refresh the snapshot when TCP advertises or initializes windows
3. use the snapshot in receive-memory admission and clamping
4. extend `TCP_REPAIR_WINDOW` for exact restore plus legacy compatibility
5. refresh the TCP shadow window snapshot in MPTCP
6. expose rmem/backlog state in `rcvbuf_grow` tracepoints
7. cover legacy and extended repair-window layouts in selftests

Testing
-------

- `git diff --check origin/main..HEAD`
- `scripts/checkpatch.pl --strict --show-types` on patches 1-7
- `make -j8 headers`
- `make -j8 net/ipv4/tcp_input.o net/ipv4/tcp_output.o net/ipv4/tcp_minisocks.o net/ipv4/tcp.o`
- `make -j8 C=1 CF='-D__CHECK_ENDIAN__' W=1 net/ipv4/tcp_input.o net/ipv4/tcp_output.o net/ipv4/tcp_minisocks.o net/ipv4/tcp.o`
- `make SPHINXDIRS='networking/net_cachelines' htmldocs`
- `make -j8 vmlinux bzImage modules`
- `make -C tools/testing/selftests/net/tcp_ao -j8`
- `make -C tools/testing/selftests/net/mptcp -j8`
- `packetdrill --dry_run` for `tcp_rcv_toobig.pkt` and
  `tcp_rcv_toobig_default.pkt`
- `virtme-run` guest pass for both packetdrill tests
- feature-enabled guest pass for `restore_ipv4`, `self-connect_ipv4`, and
  `mptcp_sockopt.sh`

Thanks,
Wesley

---
base-commit: 908c344d5cfa0ee6efb3226d22ea661e078ebfa0
-- 
2.43.0

