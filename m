Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25C3AD52F
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602287; cv=none; b=C4y3TyfFhSsiNeDDnZXe9d2U6saDRuwMCNwHG67wwm0FNK3r1MOqtllTWLW/ts7jIsiypIqwVlQ/OXIA2mh838Nq3nipyzFLeAh5hXD062HjRqIxQlxntUMC4MeSRDauE8tv09YE6NxCLcq7uLWJaPHh6eH9wgA4pc1ivkinHwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602287; c=relaxed/simple;
	bh=W9h2vOBocmHv8yyrIINbKPNLrEdNr/MHz6FXnnLhIHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n4xJZ7v7jUsvBFG3MMiBnk0PTIt8TwnlG4Q5+gWnOnxdIZTcMOUvGIFqERWx4q+28hkwAwxVeGxIdWfhBJ+ALIU7Ex4m4x1s2VIy0+1HdYv0GybQyeYJwSMRYbFMk13s/Ltl4qeq8LEh8EPdRJWjTuZ2kyT60pEgGGRXMfb8d0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPZGHktG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPZGHktG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf125989f2so31386235ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781602285; x=1782207085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ub/HkQc7hVDHHCyEiXac763qR/8PT/efz8C9QeD8xAU=;
        b=VPZGHktG+D3GfGjxuEa5dEoeuKRF90HZPl7OlmzuAZCfBLnfslBYLWtY9Vh2RWitgP
         pY2hWCVyajpytDVM1BUjN+iqc4R9Ngh9dDX7D7I/uWIaNoBW77JWuBJIeZE5SjW6xrPj
         BYx9qWM9CHd3C/iSXNmmWjWxvAc8W5wkrryDFfK6IztIjyHMZi7Oi7JwZDbwauu62B5M
         iq3Uo7JqGVGqMK1k9mC0567m+Hvqfb/UssKX4GmZXu4AK3q2wInqx+dnyXXV3BlSDxuv
         r6WEXqUGvDIZIW5K1WEZPViCyRXwOEDEvOAHdPD5LHkctmJlaiXIYTGJYX77MnHyB8Zu
         awRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781602285; x=1782207085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ub/HkQc7hVDHHCyEiXac763qR/8PT/efz8C9QeD8xAU=;
        b=S5aL4GzYwp166lvycCdpKq7Cx9TyUk4M1RGPSVwUpYhZDvmlSTZjtHQ2e3OA8htFvj
         CM9Z5ZNtEkkKgw+r7d0c0fSLgC+71eUv+NpDSU2JC8XDlbpaI5p+/62ox3Osxe4nOv2p
         1uVXhsG2ChElF+49mINkSYPD+akJzVFmlsiahaCKo7iRWakhwM8WUaaAj7RAvOydrL92
         42Pq3+kz6SQXtAL2CjvE60KoSQ6figwvudgv21D64WQYZrCbjM9v0ZQgoegF1TZuqjiI
         Onrjk4j/UANK329fCKmcgUD3oZgugFR9uwzlEeiIcXIzWN+i0orBDTuoGIQznWWE9LGb
         Fy9w==
X-Forwarded-Encrypted: i=1; AFNElJ/nHvhiUUa0hNNzepZciogc7i0ZQME1RokX0nVFhwOBd4UMEGDXVieoHoVSVC8euxZ2wwpExnlNppCk1ycCQ+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6u2q25l0ml4BQNQ8hE1YiewVKr+KFiNACZdyGBQbCME+uQZl
	GGXBvwyFvXt1qOTm0MU0MLP/fXZwlIms9hUGWvzmcP52aHEnVAonwcot
X-Gm-Gg: Acq92OHXhmTpAkClqPGUae4cKUqSglBKTY59seG4IrcO9hIQ89AyHaa9foojBTuBVrg
	o70btUzDi4SU4dCq2Ae78UFhW90UJUcbUlkR+PjkTJtHvXHpnMyCBkKs8TX+TMkTRrrz2Koik8+
	S/Pw18sJgj8N8RcORdktbEDCAvi5OnvMKbNZWZMdPryGVI8KnZI2t4GVB7J2z+V2Gbn833VP0Xz
	UNJeXZ++yn9JLdTFOZeKn/eIaBJWOoHtp7VcN563lQD2mGGo0gbDNSFoY+PjkvpZG3IJl6XLp61
	sS6jiuScI8iDGYF0JxEuZ9ggosGq1eAfuYvoNOCmoBZ4nTWz5Ea+r/vkmvwBRH3NULMN86VaIGl
	VLLAuIV83KDSegwPLZCCzamMggG4osihqgtDyY7ZRgMfH4+2mCoGiwhmS+LhqVLpHOUpjZTjLaa
	kGcVJ85wpbrncwg2216T8K9YeyXGcw9pixdhr/HMF1e+6S1uxtAgiMkvJ6sTksBYM=
X-Received: by 2002:a17:902:c952:b0:2c2:dadd:940 with SMTP id d9443c01a7336-2c69a0d46dcmr28361895ad.2.1781602284852;
        Tue, 16 Jun 2026 02:31:24 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100::209f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c52sm127329545ad.22.2026.06.16.02.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:31:24 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	toke@redhat.com,
	lorenzo@kernel.org,
	paul.chaignon@gmail.com
Subject: [PATCH bpf v2 0/2] Fix partial copy of non-linear test_run output
Date: Tue, 16 Jun 2026 17:31:01 +0800
Message-ID: <20260616093103.471444-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When BPF_PROG_TEST_RUN returns non-linear output and userspace provides a
short data_out buffer, bpf_test_finish() can return -ENOSPC before copying
the packet prefix or updating data_size_out.

Fix this by deriving the linear copy length from the packet layout rather
than from the already-clamped copy_size. Add selftest coverage for both
non-linear skb and XDP frags paths.

---

Changes in v2:

* Fix the Fixes tag to point to the commit that introduced the shared
  non-linear copy-out logic.
* Drop skb-specific wording from the fix commit.
* Move the selftest from skb_load_bytes.c to prog_run_opts.c.
* Add XDP frags coverage in addition to non-linear skb coverage.

v1:
https://lore.kernel.org/bpf/20260615073856.152479-1-sun.jian.kdev@gmail.com/

Tested with:
  ./test_progs -t prog_run_opts -v
  ./test_progs -t skb_load_bytes -v
  ./test_progs -t xdp_pull_data -v

Sun Jian (2):
  bpf: Fix partial copy of non-linear test_run output
  selftests/bpf: Cover partial copy of non-linear test_run output

 net/bpf/test_run.c                            | 11 ++-
 .../selftests/bpf/prog_tests/prog_run_opts.c  | 72 +++++++++++++++++++
 .../selftests/bpf/progs/test_pkt_access.c     | 12 ++++
 3 files changed, 88 insertions(+), 7 deletions(-)

Range-diff:
1:  3691b07aa440 ! 1:  e5a0c426d4cb bpf: Fix partial copy of non-linear skb test_run output
    @@ Metadata
     Author: Sun Jian <sun.jian.kdev@gmail.com>
     
      ## Commit message ##
    -    bpf: Fix partial copy of non-linear skb test_run output
    +    bpf: Fix partial copy of non-linear test_run output
     
    -    For non-linear skbs, bpf_test_finish() derives the linear head copy
    -    length from copy_size - frag_size. This only matches the skb head length
    -    when copy_size is the full packet size.
    +    For non-linear test_run output, bpf_test_finish() derives the linear
    +    data copy length from copy_size - frag_size. This only matches the
    +    linear data length when copy_size is the full packet size.
     
         When userspace provides a short data_out buffer, copy_size is clamped to
         that buffer size. If copy_size is smaller than frag_size, the computed
         length becomes negative and bpf_test_finish() returns -ENOSPC before
         copying the packet prefix or updating data_size_out.
     
    -    Compute the linear head length from the skb layout instead, and clamp the
    -    head copy length to copy_size. This preserves the expected partial-copy
    -    semantics: return -ENOSPC, copy the packet prefix that fits in data_out,
    -    and report the full packet length through data_size_out.
    +    Compute the linear data length from the packet layout instead, and clamp
    +    the linear copy length to copy_size. This preserves the expected
    +    partial-copy semantics: return -ENOSPC, copy the packet prefix that fits
    +    in data_out, and report the full packet length through data_size_out.
     
    -    Fixes: 838baa351cee ("bpf: Craft non-linear skbs in BPF_PROG_TEST_RUN")
    +    Fixes: 7855e0db150ad ("bpf: test_run: add xdp_shared_info pointer in bpf_test_finish signature")
         Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
     
      ## net/bpf/test_run.c ##
2:  663847520f0b < -:  ------------ selftests/bpf: Cover partial copy of non-linear skb test_run output
-:  ------------ > 2:  680506532d97 selftests/bpf: Cover partial copy of non-linear test_run output
-- 
2.43.0

