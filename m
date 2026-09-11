Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215083E8338
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 02:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095070; cv=none; b=YDW9uImrAuzjtQrnP/lvaXkZY/U6YFwQBFnGePzkJoLQEdufSDDpk6qubawDCVUyTmy+mDSLA7ik/QTJkx5vD62T/wCdM+dqIOY+yIJweARNcin/C3eB5kZXWHMcdyB028JLDr5W+jehM1mHyEyrN+hXs0xTSJ4d0y+513jdCD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095070; c=relaxed/simple;
	bh=/1qRY3m/FPGd4V86Exhepsjs1cVobk91A0esgwxfHOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnXLUhcuSvvO2nmnuS7+QYnIiIsxZqMECmpMJFScMDHFS3/v1KHt6rmTsCWp4cL04C0XTxWoMBMpuNgQyS9J4kzHY1v1yM9YjyUxq2VI1wxDf+xc/ddSBxhQRh3OrQN95xdpWSSPfEomLn03fUHxA+4F8PUAXTlGPruYG+fuEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHQ2ldoZ; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHQ2ldoZ"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38de693676dso249596a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095067; x=1789699867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLGO9CaahpWipcWtrC1IVp16amqxGQHf0ZihHnYfAkI=;
        b=aHQ2ldoZNq1zO4R2j0MxVYyDlj5trLpZxh5Uw7TsuiC3rCJbXAWgik4S7BG89ngMy0
         2UFNqgTQaQnmAQSSP9YaeHTJCy4+5wTGVBWLXcJG3kGRYh/eiFENPiGitCkHhCMTK8BL
         xBKPYWOq58BsaurGIj+SMt/W/laVI2etpzB8I9pM4yfMZMJtpG4+KgDI88Khsk5m5Uvs
         7VVPREhfPqkmfTKS/W6A+2/kcxhX33xuqTU0DUXu2F8guSebcYseuc9K+K5kyX39UPKf
         fg6ch7AI9Ffy/Pxuu0mG5LBaxHBN9XIdLrbrfPnB7F8g/sEcFldQWdpx5uqeBQw0dGd6
         reMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095067; x=1789699867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLGO9CaahpWipcWtrC1IVp16amqxGQHf0ZihHnYfAkI=;
        b=OPhDlKia54x8Y8ny+eaHaBqanI/IWmWuk4dGRaXWhOIvib6y9r/bnv09uw5d8i4kdr
         lKrWZFLoqLLWZnBEj1NLao+QAbCs3hh4qNUmL7CVv51EGfFYb8YykoHcuMSYF7UZGdMw
         17p9ng2cbMXQP0UwWZ5UTvGz/xOe5nBc4YoqlirCUjlewwfr48GlSrrX0J4js7qYlqBr
         c2o94+3W6BZYJ0iWdk/iWxwuFelhK43DdR0NA/W7cWcve4hmy5ZmRgW1wN0EUnrfUPTq
         gM1Mq4L0UTODjoFyKxbGYQwSme0MmvUz+eJALai3K9GwfXkeWol+Iamfof9julI3n0ar
         DlPg==
X-Forwarded-Encrypted: i=1; AKwUvByQdmcNfs1SfzWgFV3fnX/kW00e+jjEfrvdExd+HaGMmsU7BxvZOWmdiNegsSQJhWNvbgXWlKw+8Xdm8r5B05c=@vger.kernel.org
X-Gm-Message-State: AFuF++mF/4S1+3r8VFZmJknkJ20pFXYgOq/iOHIjivZ9SJx3Nc+5OJOa
	MlqtAq9uAdz1EEQt9MFb8J2JQppkYAVGa3CDA4FRpvzPmHfVYtXInuYA
X-Gm-Gg: AYBFou1IXZGPOTvdGcnX8LVjij6csmAEEhLPHH8XGjjsl+xZ/g3H0cp1nCZovq4ZJgO
	Eo8v6rXQT7g6+aUudD5x3Xm2KOBwDG1n7+prVQB1SJ4nrXcGykPQZhDyd3UJGkGvrkV2PHdQp5M
	VqzOmgyKcFUEKWTdvVy+2fYWhyzjVb90t47c1+sA9JZQP6MDEQ5eV+WOjhws52sqx3YvNYFKbhJ
	EF/DA1LEnGlrCSDi2QdQQznR7JNicD/UOBhVJsm4KEOLYN4VSBdo9mJnWAhU5qIEdi5eWG+7kXD
	smI4up0u/q8r7q/TYeaOVh8ukFT+FRjJwraMAIwmypUHduntwEPOEN0OSVbUkEyv8Z5Qh+p4Ter
	MrASC8gilp+ZN1n2a7Y+Saov9T9zKQrwGcE4bRxx6CgAQLkuUYBDNbjXop7pPukr+8C2gm20qXt
	BelJd4M52eapE6gGGb2EYRu1JexJhxkaoJakqEvBgK/92+oYjhDAniChdU+KowtfJympgJnwFH0
	uo=
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr3396866a91.1.1789095066655;
        Thu, 10 Sep 2026 19:51:06 -0700 (PDT)
Received: from 192.168.5.7 ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95095946sm2363350a91.5.2026.09.10.19.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:51:06 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v4 0/2] bpftool: Add recursive map dumping
Date: Fri, 11 Sep 2026 10:50:58 +0800
Message-ID: <20260911025100.190706-1-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add -r/--recursive to dump the contents of referenced inner maps after
the selected roots, with deduplication and bounded descriptor use.
The second patch covers output formats, shared and empty maps,
unsupported lookups, and operation under a low descriptor limit.

Changes in v4:
- Clarify that the map-of-maps helper returns whether the map is outer.
- Return -1 consistently after reporting failure to track a root map.
- Explain the descriptor bound and deferred ID lookup in the commit
  description.
- Rebase onto current bpf-next and use Assisted-by: LLM.

The earlier functional review changes, including closing each discovered
inner-map FD after dumping it, are retained.

v3: https://lore.kernel.org/r/178874362960.1415955.17339804697296063298.recursive-v3-1@tychen.cc
Request: https://github.com/libbpf/bpftool/issues/58

The previous version's CI PR expired after repeated "Patch is empty"
reports. The revised series applies cleanly to the current tree and is
sent as a new thread using git format-patch and git send-email.

Validation:
- Built bpftool and its manual pages, and built the focused selftest
  runner with LLVM 20.
- All 12 bpftool_map_dump subtests passed with no skips or failures
  in an x86-64 KVM guest running Linux 7.3.0-rc2 from current bpf/master.
- The four bpftool series were tested together: all 69 subtests passed.
  The cpumask suite (36 subtests) and test_maps also passed with no skips.
- Bash syntax and the existing bpftool synchronization checks passed.

This was a focused run; unrelated selftests requiring unavailable kernel
features were excluded from the build with PERMISSIVE=1.

Tianyi Chen (2):
  bpftool: Add recursive map dumping
  selftests/bpf: Cover recursive bpftool map dumps

 .../bpf/bpftool/Documentation/bpftool-map.rst |  22 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   2 +-
 tools/bpf/bpftool/main.c                      |   7 +-
 tools/bpf/bpftool/main.h                      |   1 +
 tools/bpf/bpftool/map.c                       | 131 ++++-
 .../bpf/prog_tests/bpftool_map_dump.c         | 465 ++++++++++++++++++
 6 files changed, 617 insertions(+), 11 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c


base-commit: af0b84a9215d951d16f26b7ee34353b970cf5d4e
-- 
2.55.0

