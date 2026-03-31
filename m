Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B15405AA0
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970721; cv=none; b=pS9gjv4S0o+R16odxm3vKynZJfOTSCWWjA8QPMs0ZKhv6lqQ7Sy2FuXzHcmepISDdes/ZMpM0JYDSjcbQ1KGgMRZENEJnonEOWpkYa8mB4j3iuia8hfVicVC8RAoPmZdn2cdhN8VewOTvGW+QZ7FCBUkNcnIlR0uwrjVsOhiKuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970721; c=relaxed/simple;
	bh=mdj+JZHtkLBhk+fcPzmcDizZkZVrlPDkUqbVOyoytxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZNtH+lKUAE2VgLqHnYtzj5Hr0g+pjulDe+VvUY8tz9iPxckWHeAV0DTFJf1XKLRi4DufdBEyd6djIKhQNNWj7WI+oB4Zksyy0w2/0gnDVZE0bvbbagmNJWe60kMywgZnRkDr7HNE+5Eit8ls8S9u7iMjJFCbLFNB8uTLushbLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TNDazeUQ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TNDazeUQ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so7809613a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774970715; x=1775575515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ro62eebBDFoVJdcd3sYnIMKDqKbb3O6Im7sU1GaKrA=;
        b=TNDazeUQ/rTX/qyE2C7OACicq2evhj4gvT7V3j00yWf0zX1YT9JlmLpYSp0iPWij3F
         Ay0vSjHyzrRmYMrBcsla2OftrpcP+J27bNbBbeZ+ytHAXmNtnBJEwOQmWZh4M0MmydgB
         8pWXj4tfVkSF83hOqgbtyg4o2Ej2JDO2/0j81x+E2lghwhKm748QODOCt6XteZYlcbjz
         BxWs6rrlDWfSpln4GGPXkZT9aAc2cM7qCmnb4n2EFBFq/3Q8UlDL1u0aF+/gyld3g264
         ISPCURl6H6CvOvOrJn5nneODXZp2yrOb7Zz54gzt15GZnb2OajTpCwJKh0eBNaz7U4DQ
         qpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970715; x=1775575515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ro62eebBDFoVJdcd3sYnIMKDqKbb3O6Im7sU1GaKrA=;
        b=eerwwLoAGZ5ZYdKdTBGDd9bPNB+4S4XI1sjy0yO2lEQsrnbaxijI8+rn1ml7ntKRsZ
         xOSdRS/XtPUTqicCuDKvGwxAKhXVMPGHjMnuPGpv1rXlYcDpUL74M0f/H6+hbDGAFfzJ
         Q1GPaO+TPvpb8SnktNgxYbivKS5UPUp/QUkgzZrO+OPRitBTpnDkL4vIvkEzl7VC1N08
         aV2UR7xXN3KHsX9ycPh21RGsOr5sC8sTLtAunf9PBSxkLL6MSxul4mM1eK8SQrrfZaV3
         wXuGC/ybdEHllWU8zsEIY6YY+JQkDzr3qrVY3s8BZOcE8ePi4iT43Mdzb694d83HW/1D
         bQOw==
X-Forwarded-Encrypted: i=1; AJvYcCVLWga2TnKHYoOhe07I5BEVj5uw9tunM1J65qfhPa5Z8w9rZ57saI88kKcU6vanNwKxvGtb5052JHQdZcsU6kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJ6su6KDF306r7DhHNJlNswDas1SEWpRrDhzYz6g7BW4EQytI
	vLHJNTi3z9Qp0YqR5cF5Cg7wZPptRL5tGWcdCDnkNbCFaQUTJRfuvpdeYeCiGKY8zwc=
X-Gm-Gg: ATEYQzyJ7InxY4BYw1IOPTtYFgH+rg0M3S2qpm2lL921q+WLsJTPsD8qcZ7oPYQghcN
	y58X9c/TcM2+mIFxR2D1dlIiRQ6NjD97iXfQWghCNvVM8PLMsweOFQA6j+cFNFRqXcX+a6yPVEO
	XTglFseaoWViFRiO4lUlS3SyKc0KYKGtS5vcm2J5pKvz8ARCKhrvVU+D9rfFCor7H1BJg17P3n0
	SExjczyqIqTl13zcGgYfNejVl0rxSI64Ed88BrgQLQkZ+QzCrD7eZPUCKR15EjRfynGjcmFsfEs
	tLqJ2uscYvfr7nwh0MfFFpIKaPxnTtcBWUJvRkx9a3LBfzpz2PdatJ5RxOF2iUeBx3P3MdRluFC
	QNb+hu2YPvqrjYR4BMpxnh4mt8GEgEdI0SXKorZGYiSGS0H5xyhEVGvMN7HTc/1nz7OS15/F5l6
	x8od3qq+UbfdJTmZyIcz/vvT4Dq1YaXm8ai99U/nryrdg3btgpOsKlncpblJ6MJg==
X-Received: by 2002:a05:6402:50c8:b0:66c:36a2:73be with SMTP id 4fb4d7f45d1cf-66c36a2742dmr1829709a12.8.1774970715241;
        Tue, 31 Mar 2026 08:25:15 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba558226sm1264003a91.2.2026.03.31.08.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:25:14 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v4 0/2] libbpf: clarify raw-address single kprobe attach behavior
Date: Wed,  1 Apr 2026 00:24:34 +0900
Message-ID: <20260331152509.70468-1-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today libbpf documents single-kprobe attach through func_name, with an
optional offset. For the PMU-based non-legacy path, func_name = NULL
with an absolute address in offset already works as well, but that is
not described in the API.

This patchset clarifies this behavior. The first commit clarifies that,
for the PMU-based path, callers can use func_name = NULL with an
absolute address in offset for raw-address attach, and makes legacy
tracefs/debugfs kprobes reject that form. The second commit adds PERF
and LINK selftests for the raw-address form, and checks that LEGACY
rejects it.

---
Changes in v4:
- Inline raw-address error formatting and remove the probe_target buffer

Changes in v3:
- Drop bpf_kprobe_opts.addr and reuse offset when func_name is NULL
- Make legacy tracefs/debugfs kprobes reject the raw-address form
- Update selftests to cover PERF/LINK raw-address attach and LEGACY reject

Changes in v2:
- Fix line wrapping and indentation

Hoyeon Lee (2):
  libbpf: clarify raw-address single kprobe attach behavior
  selftests/bpf: add test for raw-address single kprobe attach

 tools/lib/bpf/libbpf.c                        | 21 +++--
 tools/lib/bpf/libbpf.h                        |  3 +-
 .../selftests/bpf/prog_tests/attach_probe.c   | 82 +++++++++++++++++++
 3 files changed, 96 insertions(+), 10 deletions(-)

-- 
2.52.0
