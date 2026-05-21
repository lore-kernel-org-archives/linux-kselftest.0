Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ED423D7E6
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 02:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779332372; cv=none; b=clF/wKLSDHXX1eYVxrKYHvWQzzCDn9FP0XX1tSAnGY6R/2KwTqE1OjWAumwWArwIcC46wXksXxHIvy/zdAbn+2s4I/b3FZqNsU7nC9SCMIfkcPZZ7Qmu78ugtGckFan+YDr4WjOgpF3jeFt4g4R6fE9E/yyt+xtizYFHjLpSHp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779332372; c=relaxed/simple;
	bh=SzXfkIfY5nT6XTJMo7kSDB18r4QbXHUNY3qQrByfAUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvUgW1jZC6pNpyiXrGMEKLZDUPqVxwobBaugV39Er3MIP9ofJAkmTSHuDBesNFEoSNQ9MdoGMQkVK96PvcEEnu2Hkz/oGVGI9ZvFY9Uq6i/KblA2IZfzCU6rs6a3GUux2JDXxKZznmI6E71QMXrepOV1r/T7ZUpYwYdSOK8omlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=cYe92JE9; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="cYe92JE9"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-651b71f5cffso636627d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 19:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1779332369; x=1779937169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPHH7NKYNQc2juIfrHQQIsBoYOBJaS924Jc2tnnxbtQ=;
        b=cYe92JE9oIgyilzRaXBYdeLKspUgroAO074kz6nT87uF39eYzYt8Rbgoc9xqHDDiCm
         8p35rh/O5qXzhfkzi4yoKMMn6mgRxWjy5Md/eTNd7aBSOhKfYTp0N7wBvUHm6tJS6cFe
         EVRbXE5uomiGkw9u7wJILnei/4MhkccwP+3VOf1KHAFr/RASx1o+cWGPLmr9jUNks08t
         BnqWNPthFGGdXlMbi85iLTkECxVMktnlhQaHPozC9PetrpuWM3twFI23i7WRmPWQQ6Iq
         i7XEeBAvT6f6WY4i2iAHzkQqrxLAsHABneslMEsH0iW3L8s1i6K8glTI88z3EyQ4p62f
         0uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779332369; x=1779937169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPHH7NKYNQc2juIfrHQQIsBoYOBJaS924Jc2tnnxbtQ=;
        b=C/n0HOZSfXlWXPMRuqgqaUfGZBP4RkFnBDc0c0QqnL4BpfsboEC0g3qqT44DLghqiu
         lFiDZrhpOkojeuIe8cb22zulJZ7O6Bx9Ge46yDheXLvgqtrhkhLSnIAKfardLi/H/0yE
         U/YwpyrWxRR79/L64l8NCBFJDqU4ur4vdDuLQLllwORBLZE1hUxlSUhCbT989a3FQJBU
         mqWz+kkEkp6UoJFWqv3XAx/y1yn/MJiT8cJcd7nZatUhRrINMQaNZ3pOU12U0pj7M7CH
         byZ9sndWNFClwqPUHUrQ3zqKp3XM1XEfjrVT8QeQwDj9NZyxo8TNixi1COnGzQguZii1
         i5qA==
X-Forwarded-Encrypted: i=1; AFNElJ90/+Zet5aod7BBcOfywtyDmi83sE2tVUfDzx74Ca7CuLrH3qRIwIlclsSSVWMElKIMpTIvhqoRtPc1PPG1ef4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3m7UszYuyFeAL4s+PuP69U+t2GrtJb4fCANgudJ3Q+qxpb4+
	xlt8f5IHTviVw+6Btkph6zVfjPTR3lkJYefn1i7Gj1e4P4U8E2RVzIfjj//n+vhOANjo
X-Gm-Gg: Acq92OFbkjHoaYtBVQt3hbAbR0QNghcN+kjHMcqQv2nwYp7bkBGZ0kDx+HMExisL1Xf
	peSbXffgXbrobVmf5Ts5c9cb2P18UZY15RZPPlEYS48PGkPy7rsIWIcVqDRga+8OMDggCJy3PGz
	kgtZZZdpsTpy0R+Q8Fqb61aPgZiHpMFbQPos9gZi0L5W6Wn3Q/NEVb+YyE/iZRPtgVwjmgDfIPQ
	RIwYNte1THVqOTaxsjB/gIttOm484B3LrWcUDmrfhRA+4+Ss8hzcWUWYBnOpL4/AQ6Mkr0UL3QM
	Zy5mQcTLfFWVQ9R1B8eN+b3WmQ0Lva8bh1RkhtVeOKFGcvMHFk+YfMnTqR29GkcrOUknwQMvegW
	XwO+SmHL+SyiD8KWiryxXXHBa03uJdAOnVGgTxx7eQ5KqQ6ZHDMDU+pRz77dhZKJXcv3TAFtdKc
	7jKqy6Ji/Xb/oYY+7Qpo8K77DBqhtQnTF7afnlbe+AAdaTIG/YOavqO+J2epSggV5WQWHdMw7ad
	q1LWtrBr1np/LQoNfmIyzMPeg==
X-Received: by 2002:a05:690e:4144:b0:65c:27b5:414c with SMTP id 956f58d0204a3-65eae175db1mr577751d50.5.1779332368618;
        Wed, 20 May 2026 19:59:28 -0700 (PDT)
Received: from kelso.tail8e61da.ts.net (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d86c850sm10092743d50.1.2026.05.20.19.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 19:59:27 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] net: tls: fix async split record handling
Date: Wed, 20 May 2026 22:58:38 -0400
Message-ID: <20260521025840.976378-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When BPF sk_msg apply_bytes splits an open kTLS TX record and the
selected AEAD provider completes asynchronously, tls_push_record()
currently returns -EINPROGRESS before reattaching the split remainder.
The peer can receive a truncated stream and the detached tls_rec
remainder is leaked.

Patch 1 keeps the split remainder rooted before returning
-EINPROGRESS, continues the BPF verdict drain loop after queueing an
async record, and waits for already-queued async encryption if a later
verdict iteration must return a hard error. That last part addresses
the return-value masking issue reported by Sashiko on v1.

Patch 2 adds a selftest covering the sync and async providers for the
split-record path. v2 also checks the BPF program fd before attaching
the selftest program.

This report and patch were prepared with AI assistance. The generated
analysis was checked against the current source, the reproducer was run
against vulnerable and fixed kernels, and the fix was runtime-validated
on QEMU/KVM with a KASAN+LOCKDEP-instrumented kernel against net base
5db89c995. The pass-then-drop BPF probe that exercises Finding 1's
failure mode ran clean (no KASAN report, no lockdep splat).

v1:
https://lore.kernel.org/all/20260515151556.189841-1-clusk@northecho.dev/

Sashiko review:
https://sashiko.dev/#/patchset/20260515151556.189841-1-clusk@northecho.dev

John Fastabend reply on v1 (confirmed Sashiko's return-value masking
finding is a legitimate concern; this v2 is the response):
https://lore.kernel.org/all/huduxtn6parzgiaf5cyiyrrvjjvx6jsdedowvrd4nkwmuyeind@j6migjgofh2i/

Changes since v1:
- Preserve the later hard error from bpf_exec_tx_verdict() after waiting
  for any earlier async encryption queued in the same verdict drain loop.
- Flush completed async records after that local wait.
- Check bpf_program__fd() before bpf_prog_attach() in the selftest.
- Leave the __SK_REDIRECT socket-lock-drop finding out of this series;
  it appears pre-existing and should be handled separately if maintainers
  want to pursue it.

Christopher Lusk (2):
  net: tls: preserve split open record on async encrypt
  selftests: net: add kTLS async split record regression

 net/tls/tls_sw.c                              |  40 +-
 tools/testing/selftests/net/Makefile          |   5 +
 .../selftests/net/ktls_async_split.bpf.c      |  24 ++
 .../testing/selftests/net/ktls_async_split.c  | 393 ++++++++++++++++++
 4 files changed, 454 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/net/ktls_async_split.bpf.c
 create mode 100644 tools/testing/selftests/net/ktls_async_split.c

-- 
2.54.0
