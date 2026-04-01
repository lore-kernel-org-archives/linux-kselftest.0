Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B74188713
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775053884; cv=none; b=lV4cwMfXt0SNYJeKffAQcP0jSBkDaRUM8Ttspaym5Q4jKzNr83HKRrPL2VadbOyqeYgav/+PQ9BI9/IdUUiIa19kRWa7tavQ6PS6p8F5/vFcF2mhxgX/ZhImSv1MyuC3p73+P0SxTeRzIskJsbwIQeaZMtDIgnZoHlUT1NejJj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775053884; c=relaxed/simple;
	bh=lH9eKSW2yYhKqeRTFuyuIorjmr3ody7md9WA8FOkB9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rktZFYKN8lS5nP6iUMYtfcHJtTWI4lB7nGHIrdfNZ0FwYxKxiRSZfq1R6Xl/kCXqvhIgKfPQYGYF/9lUjeYDwVJT5pG4QLQRdAOJFeoazMsqvSnIcs5QxGfUpX1vlF+yRJdQBNhAU/Tn2Xlu0k1NxJiFVxRSUIJV0koPnd6aiYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W5xuqMKR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W5xuqMKR"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so6913036a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775053882; x=1775658682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9Y5HSn8qHxvvJdhLmXjNMhQ+Dpvj4nqUmRgXhpDfws=;
        b=W5xuqMKRZi6AEM1f2fspPvPf7QhKMVYzgDvdRDdd2chZ1SN7QKcOpsEHi+mLYUujVU
         sfvMcJuppr3BPYdIB+DqJ/f+xeyoEDabM61duEWflUu0Mfw3S4MV6Sz5luWPuAMEjHsJ
         VzDKMtV6J2ZFOw2cI690hVuD4BJN4iavS+iPmNefWgo5JCnqopR3aLtIZYFZNAr+FUtX
         Mbp1yp6r56DRn+31aEjtB4hKJFkumll/KwfX2WCI3m+p7sf37Z1lvR+jaAIWkCYHhKaY
         WKpQPLxPt51/2+B/31z3d3kRFBXy2gJvk39lJhdCVnJYg9uydvvvYrFvVtiHM8M7KKXb
         f14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053882; x=1775658682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9Y5HSn8qHxvvJdhLmXjNMhQ+Dpvj4nqUmRgXhpDfws=;
        b=PjYIq363MKhMKsVOIlsLljQqTnCDOQPk21HvEogtbZYj+pAJ+tik4CZ3bdre3ryQDp
         jy0l5Yd8dzVLCIujsOcKtzgjR/xzMAUNSAkf2L6oipTUlXz7v/ypRsPAzdh6x50eVcNQ
         0g2g6vsF6ZL7bNp1CxP6ApJd8nGoPyW2uCUg5S5gjb06ZyYBwWMXSvBgfdGb+ZUgIufb
         cNyKQ1RfxGXXcgnBCSXyqhlmXQEpNMHt5ysjpTGPMBxohLwOxvFMbH4ay4yRPL6sQ+QB
         YuuDR1nMPbQ9Xa222AAHYAQCrbFUb+rUBQXKVHLXn6wsjtz5/37g/id2Ugf+oWccsdNB
         aAHw==
X-Forwarded-Encrypted: i=1; AJvYcCUVmG+C2vBBo9jjZDaOJp6m1fP3OrwtYvhaen8AzwYDGKhtx8bFGOHu0PAFyYb2QA1/Ri4mFBbQLKVRxIcQ0+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZzSFtMjjy+iKsPT/OpHP+R/zV85h0xnNFnGEw6v92sJF/uzv
	gsWNdTXEIVoJzGrSczARnaEt2FuLVixRs+rHmi+WtA1shhFaEYYeiU8YLNjqEeMoe8g=
X-Gm-Gg: ATEYQzwcX79yb7h9rqBtWrUS6rSVVRmYkPDwVQQsaSVAoNFFBCP9zvFmgptg2jf5Z8/
	XFIgurgqW5VhhdqhrPoNPIqo37d/KZHqwV63GTiIeIG7X0GgZKB/tDyI93kP/UQ7pfmW3jJ/S+Y
	IAv/XFysB0TZMYbL/4xA8wIZsbrmz1vlX1aelZCJhA4IuiM9NZjQjcglRo1hc8eMgwBRV4i5WUv
	zI22bUiMw+EF70Oby1LuwsuIEGqpkjBJnH+eawzKAEnivUuTfTSR/K3kv7N9beoTcxGhRAddN0n
	y52WUdrBrx2DtHpLFce9ydt2UmThnceOTL7IXcjXfLCAfOEclZRKDWcZXhR9mHcuHGkT/EPKCca
	9OpxOpEFCnPN+1g33pWl/7QsCJ3LulwN3NHBsaHGqL9eUxglCfYkDcLrWIRB9B00GIRPfsmQZCv
	eMudDBpoH3nYDo36w60adWVJlBUyQ2Rc3NSFSOY+pzD+CT6VOuZhQrwXCktcgamg==
X-Received: by 2002:a17:907:d386:b0:b99:7697:76e5 with SMTP id a640c23a62f3a-b9c133b2eb2mr277582066b.0.1775053881478;
        Wed, 01 Apr 2026 07:31:21 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427658e4sm199047295ad.48.2026.04.01.07.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:31:20 -0700 (PDT)
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
Subject: [PATCH bpf-next v7 0/3] libbpf: clarify raw-address single kprobe attach behavior
Date: Wed,  1 Apr 2026 23:29:28 +0900
Message-ID: <20260401143116.185049-1-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today libbpf documents single-kprobe attach through func_name, with an
optional offset. For the PMU-based path, func_name = NULL with an
absolute address in offset already works as well, but that is not
described in the API.

This patchset clarifies this behavior. First commit fixes kprobe
and uprobe attach error handling to use direct error codes. Next adds
kprobe API comments for the raw-address form and rejects it explicitly
for legacy tracefs/debugfs kprobes. Last adds PERF and LINK selftests
for the raw-address form, and checks that LEGACY rejects it.

---
Changes in v7:
- Change selftest line wrapping and assertions

Changes in v6:
- Split the kprobe/uprobe direct error-code fix into a separate patch

Changes in v5:
- Add kprobe API docs, use -EOPNOTSUPP, and switch selftests to LIBBPF_OPTS

Changes in v4:
- Inline raw-address error formatting and remove the probe_target buffer

Changes in v3:
- Drop bpf_kprobe_opts.addr and reuse offset when func_name is NULL
- Make legacy tracefs/debugfs kprobes reject the raw-address form
- Update selftests to cover PERF/LINK raw-address attach and LEGACY reject

Changes in v2:
- Fix line wrapping and indentation

Hoyeon Lee (3):
  libbpf: use direct error codes for kprobe/uprobe attach
  libbpf: clarify raw-address single kprobe attach behavior
  selftests/bpf: add test for raw-address single kprobe attach

 tools/lib/bpf/libbpf.c                        | 18 +++--
 tools/lib/bpf/libbpf.h                        | 27 ++++++-
 .../selftests/bpf/prog_tests/attach_probe.c   | 80 +++++++++++++++++++
 3 files changed, 116 insertions(+), 9 deletions(-)

-- 
2.52.0
