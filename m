Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04A3378D68
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 05:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775021153; cv=none; b=MqnTQmHVEm4NyQqDdyPnl1G8Knx/kecoZypGG7ynwnC/XsU2qyEWv9W6RkiEmhHj9GhQD4hBT2WtfVgK8ngmiZkstW89H+JY+clHT/CVTRYHh85Qd3IBxgTVKWh222MTab1KlMBhfa9sncd8+5NQvVQ/17F/rhhmRDWSwkf4NrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775021153; c=relaxed/simple;
	bh=aNdm2JhbZ2WiyTXpxHfBjGRYE95Qs7+KjgpedcL33mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ub3ik0tSyNT0BJyuCstP38wAZcqM2snDTqSQgc7Xnnjx5ACNcur3B2UGwlJ/QzoEdPjHDscv0bSYwocxk18WT+qkl0jYoltlQoEQa66R6bPPKTVHEVK5h71ik5BIwf5TcsMO8Nhyj0S+dC0UkVeIi+OiafCpJ0QlFZHCGeEbi4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vb6Gc/AG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vb6Gc/AG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so7434045e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 22:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775021150; x=1775625950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHmLJsO+aYO4OQ8UwW+JtSR4CppEo4yH/ZY1lD4kj34=;
        b=Vb6Gc/AGeLdX7sAetGiWj7etDlrg6aRG8albk6oj7y3bRmtUmYmrw2kb6DDh0Utz0n
         zHN3c0KQZ3FCo3HVKau00qNd+2l+rbHyxCcZJIEDe44V5wTflY+8Yc1V6hKw2WAFwES3
         QKemGBwAhRFMfISK/q9uAjxJkvT59KpWzyECfkTdqgbqPhJyeGRNsxCWv0adZzDZor7j
         KghspI97HdTQPtW473itEEbPUPUY0xXe0H9YQizFvXtBBe31IVJfmX5hckxxRdLvGXT3
         GVRcSko2GFXEzal+gIPtgYiuZsw3gu2+uEiOepN1Y74YhJp48fKK6HLM34QxCBD8VfXC
         70Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775021150; x=1775625950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHmLJsO+aYO4OQ8UwW+JtSR4CppEo4yH/ZY1lD4kj34=;
        b=BNeYYXLoqe69sJaYyn4HMykUxxyEF0pvwtiinnMwC944gCyfPA+wDXqcR84WeMcpgA
         JZThZRHUNGshvLslSRxi8pD8h9Z3ZCH4wHkeTBn7brYaabX1KihoTAlENjgAz6xcmg0I
         l/1mt9qpt7sH6t+bynZ1aG/RgG9cXJKSQNdqO4HS6fWgdsK3kKF1krEZIa1bm2QfHA4Q
         1eOtYF6uoHbRT2jH+zoPdisLlhpZWB94rVsVZ5AVNDs+LhlvdCWJxeYM1oZeb0YofTXS
         Gy7BLK+pe5x4+E3m8eyQfAKzUYwD6k/+ZPcjZa3v2vv3DT2eFpc3EUIjju8PfCUhci4/
         gzSA==
X-Forwarded-Encrypted: i=1; AJvYcCXJdBMkK/l0C+UbowWgAGs8lb2YvkxkAseiJLv8ZBPYyp8Mj7tsd2mvkzIOER4HMG38OA2Sxclc1dflO38O7DI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEWXA7bVgTAR8bVeUoayKrr31jKEk5ntfJIlFjZfovej8RF+F7
	fqGsjJ/CmjcSPvJ+VsWTldYreDEFdT0UXfATCmLSUSzGQvAQ7WkTGS9EHmVfkJ9cybg=
X-Gm-Gg: ATEYQzzICDmt0X7UbC/2dJY+Y3+qjptJOaC5W9W+2iZfVB+x7Ksa3AK6IzyHE84SvnD
	qzyEScQVI4MqaoZAtB4+YVaehy7MDYhZufcelEvCmc7IbpsdAgIwlJA0KvV94uDgfBMstunGuCF
	vquWGDnFswAq0YSONSXHTSCIvf0NqTaQfmEx2c31G8U2R6Z3V0aYNQL414EgjTa1pe0C4VbRGAP
	INXvdHrqGcB+VWBwt+74zqb9jSZhm44Gqzp0wZRgFK+PvOD1RoQ0ivwkQdwxUvIZe4KrcSPjmAe
	wZjN+8S1XuIB8/zQ0GWCSb78iiARRN0LANyAvVDX7hiocfpztpBAN1HLSV2qv43VVr52qQFWCUw
	j009pg6vj3z3sxYbvV5PlB01oNMFla3ZXG45dqv7ia2t5bvraPCXF6fylo+Y3n0WhtuF3BiKga2
	bnp1q3l3HZP5tDMPSY8jFQFh+kgBOskvwEBNLHUslTHMYmT1/8ECpauQaV+d3urNUK120FLPir
X-Received: by 2002:a05:600c:8b61:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-488835888b5mr33183185e9.13.1775021150180;
        Tue, 31 Mar 2026 22:25:50 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b818sm15308214b3a.6.2026.03.31.22.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 22:25:49 -0700 (PDT)
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
Subject: [PATCH bpf-next v5 0/2] libbpf: clarify raw-address single kprobe attach behavior
Date: Wed,  1 Apr 2026 14:25:09 +0900
Message-ID: <20260401052544.100968-1-hoyeon.lee@suse.com>
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

This patchset clarifies this behavior. The first commit adds kprobe API
comments for the raw-address form and rejects it explicitly for legacy
tracefs/debugfs kprobes. The second commit adds PERF and LINK selftests
for the raw-address form, and checks that LEGACY rejects it.

---
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

Hoyeon Lee (2):
  libbpf: clarify raw-address single kprobe attach behavior
  selftests/bpf: add test for raw-address single kprobe attach

 tools/lib/bpf/libbpf.c                        | 16 ++--
 tools/lib/bpf/libbpf.h                        | 29 ++++++-
 .../selftests/bpf/prog_tests/attach_probe.c   | 82 +++++++++++++++++++
 3 files changed, 119 insertions(+), 8 deletions(-)

-- 
2.52.0
