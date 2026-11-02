Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650444;
	b=1115WpnKkfgP6/WJox2ZOmU+GL+I+x9f8sF8+qT8TNDPZ0ZCaVtDct7h2jfw6o93Uqwr
	 mhiZkECIhnIjyJhGel9FgIbH/Y4gizFNZ0v98Qq6pn0WhVBAjkPNjuev/79mNWo+bzyVt
	 F0GvfV9CX83kKgSSPzOgis9wbShgIyx32MT78yybTo8deLa2+gTXFZk2opom98pX/62hR
	 k+GFfJa1dmtQbjLBz+ZP59KfoPhcwvXykMr8M9afaQlHpflwWPFWwGa4zfFZVE6Ak2tCS
	 McfAcn0AA5PQ8vRjCQB00Ci+UFlUbLIXConl1OE2PYC6a1OmyeF7y+U4UHbgFvc7fyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tGanUMfayq3PdyLOv1Doxlx1VPFFMeHl/eaWWctPQ0U=;
	b=bSlH6CR3Lk8QYCs7uCJtvN6WnrcWkB83wPi7W2JlWclR5sbo8B0s3O3eXI91G79MHdgt
	 TVQpNkoNR5lDBSsTFwB/dkY6Q4RahCCtsUnFHa3Mj00JvhUM4oiDNvQ56gLNZgPijDm3T
	 NfhUPycIOOAMpXldh6PvRQt1U3mV4KjVDk0mUseaaV4ED3fdpeAQvTLYs/VxRJRf4w9Ln
	 uR0HRENUVXkssBJEGow81mkkCatf/38LJv92nD/O+Q5rVoYAuuC8ws8KYhS3se7pcQmEI
	 BOgLEeNXnjWqBDnybPO4l/7L3JPs+oeXMKTZTuM43zop+aut6OLWqFt+u+2ThFHtCTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zixO318e;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744E606A327
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0744E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zixO318e
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso34613365e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650442; x=1794255242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGanUMfayq3PdyLOv1Doxlx1VPFFMeHl/eaWWctPQ0U=;
        b=zixO318eJYLfhb+XNiTcj4Wd8KTuj8oKOfOp7Fqp8NvJFc/1JZBHI6keegIn+u7btr
         CKKm0WeJ7v4EhvVDWDguBbTah0n7jssE4aJOXj/5z27tjK+6U5lClhma48jfdLpNYWJp
         Wi2T5jaYdn/ArobqwxviNhfr4U0CAmYzvuhyX+4yYNYUCwhmQ05bBgyI6F6aICXxcz75
         +4VHeU7duOBeddPuirmFB5z8bWKFF21FZEDwXEGu0ADxleF3gJboUmDE/aGw2unc33L4
         MvNohpwynI346AQ0mB/RMr0S98P5cuSOcOranZBcOrgxmz0XnaSWkLTNSoHMOvZosjWI
         g3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650442; x=1794255242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGanUMfayq3PdyLOv1Doxlx1VPFFMeHl/eaWWctPQ0U=;
        b=b6Oi6qoM0yFEr3zG3F34/72NIVUQHOnFJ30DKPSMch0HPnH67400iJiVtxwLpPFyFT
         OypviPNLatR+YcrjTRV1UiKhuiCLVfnX0c8Thfd+yl2ZKlUkdVDnIuhdF6ElL9c5N7A3
         golJqly9cJVvfAULnJ9bVw6RuZcHaf782MgNlO2yW9HDvcIuWdAu0vo0/EGQNw7qlTH0
         WJS/0U/OvXUWtniPiyc67srAeCCEHdoY0cKD68R+1Ba1yVi+kPqB3zlvGAGOSpqajcvP
         TQwR9hkWhccGPZNILmn1ojWOL29l8kFiDzDzs1xZbqWRtj+Gf03GBtLRf6tP+0M3LQbq
         7tVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXVps21y6rbB/Qy3gq79kWTbRNgY1QflrrJdU0SSFO0sm3/Luui1uXqkeI9FqcPtaBK8i59NtI2WbhpzhKMlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMae+ZhPC49pfusz6hZab1bNN4ISnVWf2WKlIGBe354oVZ7RbI
	9xYy0oIhDQ8z2CGm7Be+ebF5lSk6bkuOYh6YvZTkR3tZOeRS8/JzeZ/S
X-Gm-Gg: AYBFou3BN8dadTDpXAWxjm3GJd3HqwlS/b/t+QfP9O+OB5BBL2GRQhWmArxKDlRoSiw
	w0Dz9w58f3rPuQju4GNSGAn2ZNLoWjKVWkeC1Dfw6by57aJJb/TOQIFR+BAZtZa0JSlakqqMui6
	JFW2/hHto6CkPz2Ro6ew/DEbtDhj5Gky1vbfcF3KUlzOch/rvOMf8wwXp76vblEmvqCWMuV143B
	3tABVTBmuxiV2QmwVvA3Bfkm9/ROOJbDdk2tb2ZcHivCfJ3c/4hERr+vUsN+avDAbvHlvtN8x7z
	J1n0Ifw3LUOKUmG2dAHyl1HSRgn6g3xk0yuF3nfFobDVM+bAGpN1nBFVChDil6/OdiUJzGGm8Bl
	EE+OvIfQJ693tZ5tXcK51zStKyTwjshxsaJACOH5sJ7ftjZKdix0KN9oC0Ztc9dwqMgAItNgNuo
	RfC2fc1Ldx7/CXgb4bRTd6zE86s1mIfheYkRwlNv0Y/BBLlkgFy7jySsdTP+Wq6tJk7UGMR7kkM
	Y4wx9DPAsQbnqni4W4a+KVrNqq82wMlBjTpIrgPUpiQXmmdFnyO6lZTtM0uCg/cNQDe6/77ou/i
	vDyjVrZV6fDRa/P9o19pFh6aeerjnWIjHZtel1Py/D1x8FoIpTbQ59LDEUHwy8vknzNEeCPde++
	d
X-Received: by 2002:a05:600c:34d1:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ac183d136dmr250002875e9.24.1793650442391;
        Mon, 02 Nov 2026 12:14:02 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm21471805f8f.43.2026.11.02.12.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:14:01 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 0/5] libbpf: Support gen loader attach
Date: Mon,  2 Nov 2026 20:13:51 +0000
Message-ID: <20261102201356.5798-1-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hey,

I've been working on this in the context of Shirudo[^1]. The current
limitations we face is that gen_loader cannot attach the program it
loads so we still need a userspace component to be allowed to
BPF_LINK_CREATE and we'd like to gradually remove the allowed operations
done in userspace to solely rely on the signed program.

Note that there's no kernel modification in this series, it adds the
gen_attach options and code generation to libbpf and do the wiring from
bpftool. The kernel side was already allowed thanks to 'b1d18a7574d0
("bpf: Extend sys_bpf commands for bpf_syscall programs.")'.

Also note that I did some analyzis with Sashiko and it's been
complaining because I've followed the approach with the prog fds being
initialized to 0 (and not fixing the two fds to init to -1 sentinel
value), so maybe we should pre-patch this.

Lastly, I don't know much about bpftool so unsure if the way I've added
it is the most appropriate way for the lskel attach option.

v3 updates:
- rebased again because I had a debug commit in between master and my
  patches that somehow surprisingly conflicted... sorry for the spam!

v2 updates:
- rebased to includes changes from the 'libbpf: BPF program manual
  loading'[^2] patch series that conflicts with that series.

[^1]: https://lpc.events/event/20/contributions/2437/
[^2]: https://lore.kernel.org/bpf/20261029223348.3730738-1-andrey.grodzovsky@crowdstrike.com/

Mahe Tardy (5):
  libbpf: Count entry programs for bpf_gen__init()
  libbpf: Track generated loader link FDs
  libbpf: Emit BPF_LINK_CREATE calls in generated loaders
  bpftool: Add attach option for light skeleton generation
  selftests/bpf: Test gen loader attach

 .../bpf/bpftool/Documentation/bpftool-gen.rst |  11 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   2 +-
 tools/bpf/bpftool/gen.c                       |  67 +++--
 tools/lib/bpf/bpf_gen_internal.h              |   7 +
 tools/lib/bpf/gen_loader.c                    |  41 +++-
 tools/lib/bpf/libbpf.c                        |  55 ++++-
 tools/lib/bpf/libbpf.h                        |   3 +-
 tools/lib/bpf/skel_internal.h                 |   4 +
 .../bpf/prog_tests/gen_loader_attach.c        | 229 ++++++++++++++++++
 .../selftests/bpf/progs/gen_loader_attach.c   |  48 ++++
 10 files changed, 435 insertions(+), 32 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c
 create mode 100644 tools/testing/selftests/bpf/progs/gen_loader_attach.c

--
2.43.0

