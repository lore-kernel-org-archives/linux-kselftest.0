Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE93036D9E9
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788279; cv=none; b=XgjeCD0xJnVheUouuTCzCwcda8pkHvvwUviDASIF06TbXTOLZKx03mb2OG3ZTIjyFGTLatuynRlAskXMYDDWDNf91pRQ0mmjjNTnKpMC5ncxa0oRwd1zAC7hG6cPyhxXNsKWxk7dzXZcTYxhg6qVsc8jf4X7U/i7j7tUrm4t0Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788279; c=relaxed/simple;
	bh=Rmh3Y+JrArpJE7iqH6JLEcKEfdpuVbpvkJS7lyIHjzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eDmDQ8KcK9j46I75b0GTtOadK7JJSgFKNIHjFpdzHoarahs1g0aCvPOUjryjytxEO4mFre8rjDHp+V58SA/3mkqy4vYNpU5SmUYI+FGATmKwVV73cfJ3rHi/CZAMSP21AwLTQkrNoOYKMGoe7IoV+PDSviQhwCWiLWJrEtfOY+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dnXMdCkV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dnXMdCkV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so47612845e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 05:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774788276; x=1775393076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMhuHeD7KIQLmawFhIk+JJPpQUf9loVrwxnFpBfk5n8=;
        b=dnXMdCkVm5madfRT6P0ezSg720NIs3rc3IdYHXtNSPo+e0ql0rLWCaDZUoR5zVWTnL
         wTvwDXSJaquyL6hIkrUAk1m910HuxsnB78WwnT7+StVl5MZsudbD/x9adkquCwQd8BPm
         XNDDurbSXXW9XOos05BJ/5Hv+gkEi3YwWujdsU0bLtR82tMc8D0ASfDhspiJmz6eiHHI
         pHyJXOQ7Q7fPIk1ZC+OhPvpKxxPojDyfbi64aTXesM8pzRyVsXTOr9k0/HawTcF2KXFH
         XDtLAG+hOeoQwt+Ac/GyN5+aAKMPAsix/EMT28zQC5G0sa3awuhh/zQ3nJQ40hK+XP9P
         qspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774788276; x=1775393076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMhuHeD7KIQLmawFhIk+JJPpQUf9loVrwxnFpBfk5n8=;
        b=mSF5kxxA05ROvPTR4h239V0cIUZFGI4sricFRnwdAEgjF24H+7WFGFwULN2YiIhbBL
         0YY0dWk13Bpy2XlDnYXrx4vRQHf7aV+tfv+JTvS8BNvRhlF9nkrBUjQq3PpdS14FyfT7
         eKmwBCeBo5UVNjFEbXng2ra3VLvrAa1+dPARe95s74JYXAISFkNitFFuYwdjtb4sXxn9
         obSD/jMCMIA9wek4MT/LRtNe2nb+cRwOrJY7FYLNaTRwDsfE4Iqkc5vcuSKLGkbRimzE
         wqKimCHCjvS1TL0XIPr3egRTRfpvn7NEZepDrQ4xw8xSnq9VFxfJhUAHL2RY+xc9rUKq
         njmw==
X-Forwarded-Encrypted: i=1; AJvYcCUwHaRtPOt/L6IhqISIV97Hcp1eN7OS4yVZr1ky8005wKTpsNKV0Eho+ILn+QQ2Mt00j9LxTbn8yYSHOxJuKdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBc7497SsBeZEKjl/7DNoi4mwxAXlv8HhsiR/hG7ls3DczUi3
	C27Kqwnx/1sbXqYqnb9w/6LSk/lkv+oKHZ8cVa7lPrvCn5Z+sFwF+2M5Chi8vdM5hnc=
X-Gm-Gg: ATEYQzwiG2c0pL668dAp8Ws6BWKk8VUh7t/l+GU9lxH1nBMC8Wq9/8vwSIPdAYB1v35
	PIX0lf36KGZGv3T78F44jP8nVioyNeAjaTzPPylei68vkdivec9aDToCH0Ow/SAgGUfAhQlFyc0
	zb3hjvx18dwGV/oNTtd1x6CznCkEF2W/EUc6uu9UYS3NsHDKCbXp4MM5BBdtadLKqeRZ/uuqKHz
	bR9qprlIInEc5sZRNJ/dh3tTeNqSjJmUf5G3pRQqg3EQ3uUJlqLWyGfow1LJ2kICM0CFAXyD5MI
	T9KcKwsnj9jMQ2dSpKf+V/telaWsD/n4YayQEmS5KQjUgPgqgt32zRKmpZh7pedeKaiqWPomZeS
	uStwOqfdbzlCwME2lvK2nY6k1fJymjqtfL+NCbIAu3fvw9YLrvJg/YlGZopZfqNLKlEpXJYaKC0
	zBHYBrs2RlQgXNVp2xWHYoQxjYAwnWiKzG91wyEIcP61K8t336kAP3LP4rNWGx1w==
X-Received: by 2002:a05:600c:524a:b0:486:f9a4:d487 with SMTP id 5b1f17b1804b1-48727c816e6mr142138465e9.0.1774788275973;
        Sun, 29 Mar 2026 05:44:35 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916da892sm3700321a12.14.2026.03.29.05.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:44:34 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 0/2] libbpf: allow address-based single kprobe attach
Date: Sun, 29 Mar 2026 21:43:37 +0900
Message-ID: <20260329124429.689912-1-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today libbpf can attach a single kprobe only by function name, with an
optional offset. But the kernel also supports attaching a single kprobe
directly by raw kernel address, through both legacy tracefs/debugfs
kprobes and PMU-based non-legacy kprobes. Since libbpf doesn't support
this yet, callers that already have a target IP still have to drop down
to perf_event_open() or direct tracefs writes.

This patchset adds address-based single-kprobe attach support to
bpf_program__attach_kprobe_opts() and covers it in selftests/bpf. The
first commit adds bpf_kprobe_opts.addr so that libbpf can attach single
kprobes by raw address through both legacy tracefs/debugfs and PMU-based
non-legacy paths. The second commit extends attach_probe selftests/bpf
with address-based kprobe attach subtests for these paths.

---
Changes in v2:
- Fix line wrapping and indentation

Hoyeon Lee (2):
  libbpf: allow address-based single kprobe attach
  selftests/bpf: add test for address-based single kprobe attach

 tools/lib/bpf/libbpf.c                        | 88 +++++++++++++------
 tools/lib/bpf/libbpf.h                        |  5 +-
 .../selftests/bpf/prog_tests/attach_probe.c   | 49 +++++++++++
 3 files changed, 114 insertions(+), 28 deletions(-)

-- 
2.52.0
