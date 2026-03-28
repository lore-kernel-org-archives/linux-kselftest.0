Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382C833D6D6
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712228; cv=none; b=Z0cWNnfKMA/g7yZ0dsBXDRC3gz616zeZnddIWcC1aUEM6jIJcQhHWLXsfDH2jBo4OEN0Hpu+2xCmALprCH1pJ8M3Nr2jPeaiHGbssWTE+mHsIstcX3hf9ThOz82BOow8mOyRxayjocfxxKsfq95ZCnshTNP9dIzWlLid1K1bAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712228; c=relaxed/simple;
	bh=RlOEpQFbLPEsoNk4ZVl9U5QrbBoIsEi83ZVcW6lMvc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQx0sjqGKUGDkDr2QEEOtoNShtIwg/cfXqTPKWESqdGBvTv6zh33no70iK4RxG/XHuQYqHd5cYPwcDHc9OvAQHbfCh9Nk7vkvNdzwUrdgg+WR2sVzn8lPdH9B2Q+uazeO5xQyhEkOSRSsySrrGkjoPkwat9gBIYeEx0c7/q8NJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jcion7CD; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jcion7CD"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38ad26e3992so24421191fa.1
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774712224; x=1775317024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z9nnBK0A0s0b0mb0vGDY9vi2MA+PChBVD8pdmgI/vI=;
        b=Jcion7CDmwT2W5fxvlZDqEDazD/igWnZRG3R3v04eI39Qe18mW31J9hsHbVcaPWmzK
         VbB5eMnREqATcAiP073ILmKZ1UjK5QkRex7kGaCOkH4/Ilshydlu1SjExJsNGqUN7JeW
         wmwdzh+tqLurOl6OpTQ/JmUDO/ptUs9pxr+RTLHOozukxvhRWYX5gXIWFpmWkMkwmkSm
         ecT29hc0pHDYh7rv+lh4lVN8phJJ48Zgjen48NnQ/lhR2+z3msIkNq0m0A0ZQoCmSxFn
         iakwoQ+n2j9WWrRBW0kq6fbFGkSgOU0hTxnWX7JP18AEv5FDQwoij84oKemhxWmMTBr6
         qpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712224; x=1775317024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Z9nnBK0A0s0b0mb0vGDY9vi2MA+PChBVD8pdmgI/vI=;
        b=d4mVgLIGV1XmyGAHVdo6HTxrHsYKgXSRQR9KfxW0Bzjr3HgXCPzrc6l4h6QDD6nnRh
         LYTOIWraNL4Ir+0wDgWkRU3I/jS0endjSdt0cYtRsDREYS4FIykstcs8MXqZGkKB7ySJ
         PWmAKbmn+bxCf4sBB9WuK9rqbCggIDnwcUal55p6SbYN/qX8lqjdB4HvS86A7wCPUJID
         zQ558eJn6NL7XlccJdj9lIJM8BttEMhVJllVHnqLLE0qsviCM2rZ4cEkGxftSXhx5dIF
         FJxkhLme4p1VEX/ue1vFUZhFGc2QIwQ3YWgcySaNpr2eZhPb6zgxyUJU8SVrnacEirr6
         qfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEC5RveECZ6WPd9Z8M59fpNtvVaqclOh72XWTr76TwV3VsbfGIW3KufQXwdoYXIpNw8BbA/kl+CvKtnzZKtJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXv+0UGQTBT/o1IeyllM6sXna7ktlsr7Re+epLVCrfgvSePSKC
	VYcR2/xIW39Q1axs9lvI45nOCQJlthAKJBv0wIrECgKCYW1zlI5H9rzmG7IFp7EhAIe8F8sovlB
	16rOjeTg=
X-Gm-Gg: ATEYQzxyK3qkABslKUzb1PuH5Spy+dSvNtMkoo9lclrpJ5xiWYY9cB3J0dvAJckZAYF
	HM4brc88hInE9swoxtu/hzKZ04m8Bbua4XWji8ASpBlMyZoI4V38+F6LIWPLL3CUupOFqbipUbD
	LmeG4ESN1HzkJLt8Z4PccJO2XvN+cRMB6pTbNuXIGE4xSr5x+PpLl35PuULekLc40RbTb+kINHY
	mi/MlGAbP1dV4ZKcEbLBIFgwrt8F6WO1T6wi7PZ48yVUcdC2PqimREi+yGScYUiNh277vUNGtMC
	dkqNuNQVE6OkohjzUhCTZU0PwjC+PjdPW6J/wVzHUzRQQqojlqgGofuVNytwBGL8kl9OdlvT+5i
	f7LV69vZXnt0n2pfieGxwB1oRUkCCrbTIefcaDlSDiRpnpJl5n1Be7IIqwlv5lnqcB/40IGGB49
	T32wnuddEymdQrYhq9Y+fsH+Jo2GYoCUw+lQagIPrFMhLkhkTsRE89AU+3EoIZEQ==
X-Received: by 2002:a05:600c:a06:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48727d59ce3mr112021525e9.4.1774708008727;
        Sat, 28 Mar 2026 07:26:48 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916da892sm1874017a12.14.2026.03.28.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 07:26:47 -0700 (PDT)
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
Subject: [PATCH bpf-next 0/2] libbpf: allow address-based single kprobe attach
Date: Sat, 28 Mar 2026 23:26:07 +0900
Message-ID: <20260328142643.627560-1-hoyeon.lee@suse.com>
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

Hoyeon Lee (2):
  libbpf: allow address-based single kprobe attach
  selftests/bpf: add test for address-based single kprobe attach

 tools/lib/bpf/libbpf.c                        | 77 +++++++++++++------
 tools/lib/bpf/libbpf.h                        |  5 +-
 .../selftests/bpf/prog_tests/attach_probe.c   | 49 ++++++++++++
 3 files changed, 106 insertions(+), 25 deletions(-)

-- 
2.52.0
