Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014C3E49E2
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 02:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095099; cv=none; b=JIYow+OYZ5bsVyeN66BKctakQ+XZkyst/fropEEjnnfa2nD/LzTa/4sgRT1IFm6rHMgoq84H8cIbZozhj4fl2xCHSW+6rraNi98/lXDGVi0P37Y441vg9Mw1tJZquYixc9zfOmWRD7najKr4Z4JzdAfwoAH8g80P872F2BXQOzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095099; c=relaxed/simple;
	bh=8iIuQkT41WYMqXIRrn01O+1hE1izFOgxhyyJO9WShbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O74z5nCpYNwroqOt+rCWI/P9ksOdLKHpIHzqykNrpbH3D4oqzcJqIJK9ETVT2OV0sOtTw4OQpuq5F8q9wvzgqXqS+jq+DwWqnFn7TAPEi7EZYYIMtzQSJ+3qy8/AiZOG7XAGXC4nDOZILjIg39d2RrieXfrKQafAVv3Df33rzo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZtQaa6e; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZtQaa6e"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-39b456fc4cbso233666a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095098; x=1789699898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=krVO6YvSfAfVHJhNYiqMhbVXXObJYyBTmkKjVVuoWtU=;
        b=qZtQaa6edOF1sAbVtoLl4Grkoc+DkWxgltZR4u/Dt13pt1mLmt48s+LEZU52xZqJfg
         ZFoAwCZFYXykSHzilM3FC/kB8bmCQXrS3HqquxS+Hz4AfZNT4+PjF6OwWSDMR64Serfw
         AbHKowNLwuXjbNfLes5GTf3oSD/ACiJyoZM+NaQCdpzC6AiF81RCA2IQP41iZ6h7jB6n
         iCMgimfx+90zyvLHknPaTuWp/dcJdE6aEW9grSHm3Agn08F461LaZxeqOHbfUIMBShLT
         7vxcQ8q2ccI2BOL1tiSwdWu94gfAZCUBAY0vckVDbYYVE22GZmCB0VUiyBJSDHtZuvp6
         lnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095098; x=1789699898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krVO6YvSfAfVHJhNYiqMhbVXXObJYyBTmkKjVVuoWtU=;
        b=PTH1gDaqo3x+E8kmJhnBxJT9/3SC59ZoYfP0Y/pSWH6n9ueRvCjYDpQDo3J2xV6HKz
         pOGwzIJVH+s9K25gXVyTCdtReylC5tLJ+TiaLO6I+65JOuCmnv+NXcckoOpPVlR7AtCi
         WDpJBgHy7bhg1jl9qRKZ4nhqycgt0iA1O6qNc+KaeBXj2VPDQIZAdvoFud2DsN5hpHe5
         /krn0wupM/cMqNxflD9Xi8Hle/kYTWhnQQBn+6DjXGw4/FieKrnfoIyWWITUiZAnJdHN
         g6p0FaWDWxbNyamZ7/wwaqEJnfyIRhapxdwrqdJttmpwxJrBRTTJpLiwLTYD4rSN/uz7
         HXrg==
X-Forwarded-Encrypted: i=1; AKwUvBw7BnIvxgFl8dPGMTmlMhTPo3NKC2e9DCwnj3Hc2Uwovns/BO1p7dXaD3pbgTel+JThTZmv0ax9aQVpwJs9o+4=@vger.kernel.org
X-Gm-Message-State: AFuF++luQE5QUliYoOmELKmkSNjM0AQ01kkEJtrIZZn9vfWEEf4e1ZwD
	AYlai6OxYd0fKEKN8NExTC0wq9f/JFaN/E0jSwL8fQE8EgjxBkcyWdK6
X-Gm-Gg: AYBFou1UO3KtSz4P8lbB03tQ4hW1FJuOW4ce3VS/W2TDDBReTWIrQhKlnhsalSKySVk
	zclFy0U85YwLoueylBtmzXeagV3WQMEJGoIt8685ih5RRvMBy3NK8zfbjoe14p/OBPJ0cye4cSy
	4nPhOAQHuutrpBjRe0ctewVOwIx7Tk6osk48LT0VifBC/tCbgwqsiX1NqFA5/RgTUseuzM6Jl1Q
	qw/hYYmctdaGOEWFvCe3xo86g4fHxAGEwWno083EtZI4MfbBZMD/GGIqacscMJ96sqEHBu8W2NW
	vEafCQk95ERg+/3pKVQkw//16Sash8iXtOjS2BpUqj6MF6KReosOaeqAeQR6YbGlvDHDyjgWvVF
	I8LenWFUBxJq7syerRifEqD5VQN1KjHesYJA5VNt7mlyGo+/s7SnAUHmVEQ43TH7MY+xZd0lI6K
	aVjd7bW9T00BGgmS7xIVtEyQXJJBcN+FYL6O0DidFm4RD6FdUmfgk/J98yTR82nMgp
X-Received: by 2002:a17:90b:3c03:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39d9c1db154mr3473043a91.15.1789095097373;
        Thu, 10 Sep 2026 19:51:37 -0700 (PDT)
Received: from 192.168.5.7 ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cc978sm1888632a91.9.2026.09.10.19.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:51:36 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 0/2] bpftool: Batch bounded hash map dumps
Date: Fri, 11 Sep 2026 10:51:28 +0800
Message-ID: <20260911025130.191011-1-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use lookup batches for ordinary hash maps whose maximum key/value
storage fits within 4 MiB. The second patch checks complete output around
the batch boundary, short keys, odd-sized values and BTF formatting.

Changes in v3:
- Explain the batching benefit, conservative memory bound, and why
  ineligible maps retain the existing traversal in the commit message.
- Rebase onto current bpf-next and use Assisted-by: LLM.

The v2 implementation and tests are unchanged. Fatal batch diagnostics
remain on stderr so JSON element arrays contain only map entries.

v2: https://lore.kernel.org/r/178874362960.1415955.9584865244247659247.batch-v2-0@tychen.cc
Request: https://github.com/libbpf/bpftool/issues/63

The previous version's CI PR expired after repeated "Patch is empty"
reports. The revised series applies cleanly to the current tree and is
sent as a new thread using git format-patch and git send-email.

Validation:
- Built bpftool and its manual pages, and built the focused selftest
  runner with LLVM 20.
- All 11 bpftool_map_batch subtests passed with no skips or failures
  in an x86-64 KVM guest running Linux 7.3.0-rc2 from current bpf/master.
- The four bpftool series were tested together: all 69 subtests passed.
  The cpumask suite (36 subtests) and test_maps also passed with no skips.
- Bash syntax and the existing bpftool synchronization checks passed.

This was a focused run; unrelated selftests requiring unavailable kernel
features were excluded from the build with PERMISSIVE=1.

Tianyi Chen (2):
  bpftool: Use batch lookups for bounded hash map dumps
  selftests/bpf: Check bpftool batch map dump contents

 tools/bpf/bpftool/map.c                       | 116 ++++++++++-
 .../bpf/prog_tests/bpftool_map_batch.c        | 187 ++++++++++++++++++
 2 files changed, 295 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_batch.c


base-commit: af0b84a9215d951d16f26b7ee34353b970cf5d4e
-- 
2.55.0

