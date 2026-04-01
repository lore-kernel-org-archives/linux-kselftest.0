Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D214367F21
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027274; cv=none; b=H0jl9LGii8V/N6LvXprlK0l9Iyzt081XyQB5oj5cU6UnnRYW2jDBvBtXzdHAb1KQjJtObAMZx5vO+dCTDlHYWQHNjg1QCmes91lu9AYOxxkeQ+cGw587FBioK2c7SWBXFy3MqIz9pvN7jnLoBhih2KiV2h1z0nhO09aI3isIwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027274; c=relaxed/simple;
	bh=ARJth2pjCQlJeXMOXnHHMJU6DiAGOB8W+kVtGKy57EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KWCDEed6bwlxw9W51P9gtzivOcw4ZAeCRxyjfOn3wMf2j73ZMMjgmLj9kPTsZbEPhdD85Ws0c1EHx/SukKhzpTg9gt6z5U8LEAYT3EpsX7im59UxTecRUCuIBEGn7RxBG1La5uNTzRxJmNw52Jp4QOutlrLjOxBURsTlaSqCik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SBcic21k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SBcic21k"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso67146495e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775027271; x=1775632071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NS41J+/f6Vz7WCv2ARKA/Hb3yrSpGQX+eQMfkJUzbbg=;
        b=SBcic21kPID/TR8BrpDO8CElsW915ZQYL6GMSNw+O/uJpgTq/rZFcFd2Xk1E4lD9xh
         N6ViKvag9+XbJqfxZ6bhEeXbZqDVdm/58BPP4BJvBoWHHxSuVQWUoBOhewsbRFqRRcjv
         M38Og1nMHUQgFbajTTxgwAZ//MpTndcm8NdECya4G8a2jQLAMJn2o+n1PMkwT7ib8wF0
         9gujX8VGLjYmv4/k1Qm1gn1eIS9ryZS2oDEIy3J8z/C1cKlYgjoRRiUT/DsWBGOqOLnq
         caiOqwFh62re9suzxpMOGUMz8aT9ee5qyhKIokxSHj6fePGqF5YU0PCTcuhtPtT+wzQ0
         +9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775027271; x=1775632071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NS41J+/f6Vz7WCv2ARKA/Hb3yrSpGQX+eQMfkJUzbbg=;
        b=Ocxgzx+elV87hiG2IIAAtNJ/d+Tdvh0nn4M0aEY87H+MPApTlXKTvjn7uNqbfH3Ras
         EYqH7qqzGBk3Y0BD/Gest9jXPqCuQEyAGu389GreCEjmw9s4haulynHo4v9tXzaDbRZa
         VKihC1WG3X3WtL2r5NyGv6gsSgRFG2fT4si5Wft/4C8VWfj4MnX3MyisFSTbGmpPY6nU
         YRWysABhi1+Y4EVHoKr5RQvnmbwyJyH9LCH3GkgtdbgHB6UFlQY8zbuqSG3yf54OKcm0
         3dHWNv/HjnHHXmOsFhAIPBSLxlXFjWtbfD0D7hM7mxIK1IFDRV8PqsEmaWqnpPbkEd/z
         NhkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq2uoxDl9aiR3tJvrfMRhkUgNIpj4t5i3VYzw9u221Zi8ogwruZIPyl1aK/iAQ9m3su2AxzMzFAAM3kiemNbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyycRCpYxpG2Fr+qdgbOoyXiprVXBu2ZksAaCAEC4IT2fkUUTBx
	lcLoLEEEpF5OiQYtBHcdoe/hTgVP1EbyB/B+83H8bmdqpgGjvGZlcmAXffCUYDAOZls=
X-Gm-Gg: ATEYQzxHGaCYwJSiTfuxA9EZanz2wx5NQfbSO7aQlyGc9wh5bsE17p2Fx4gCmyzJLkp
	QYmmDjagV6EYJhtrPL5USjGHCofldQGRxV2K3zKXvH91gcGPmAgmKMdF4lstt54tbNxqojpVgwA
	ZNK4eE2dGf4nsZXUcd2nBkpTQJnol6LSEgsltHXsmq25hUOPXVWNOZlDromd3JknrcrODo1iRMz
	2yW3iJchQPdJXBcBydmXS8iuJ0cIIQfNMYxAH74NHPbGO7c33qL12s7XPqMG5XFYo5am02MrJf/
	j+hSmq8hI4A5DABzWHK7yul8nw//w++1sZby+2HSn5WeyHzqLd9dBm2VGPYTsUW2zgBZVTE4cUm
	zZhAWUbIWUVL2IQA3ttcppsnLk5GAR3jjOeRLRpStplwEgkQtwRF5Vu061KZBvAduRVABxHksBa
	1FJTWJ5TKHdjD84S8Dyzdhpjx6qB1+FvzhWd9ifXv6LJR8jVrTI/WsJQRm
X-Received: by 2002:a05:600c:630f:b0:487:288:1198 with SMTP id 5b1f17b1804b1-4888359da58mr31459045e9.22.1775027271355;
        Wed, 01 Apr 2026 00:07:51 -0700 (PDT)
Received: from f16.suse.cz ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a887e3sm15355778e0c.18.2026.04.01.00.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:07:49 -0700 (PDT)
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
Subject: [PATCH bpf-next v6 0/3] libbpf: clarify raw-address single kprobe attach behavior
Date: Wed,  1 Apr 2026 16:05:01 +0900
Message-ID: <20260401070738.122709-1-hoyeon.lee@suse.com>
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

 tools/lib/bpf/libbpf.c                        | 18 ++--
 tools/lib/bpf/libbpf.h                        | 27 +++++-
 .../selftests/bpf/prog_tests/attach_probe.c   | 82 +++++++++++++++++++
 3 files changed, 118 insertions(+), 9 deletions(-)

-- 
2.52.0
