Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163731A81C
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137569; cv=none; b=QmJ+sgCdkb5kcoXGa0pz72OrR6s20CCHw8odnKpcGTf8nAO7IZInqhSJgZBM3WuZdFPQ0jh229nmdowgV26rAuKoYSFBVQi86jspwEBXs7qJmlz2R8Ddo4Jqwk+4NSNEpnAsCO/0p9UVGERW5GEYEI+v2MtuEiaHzAlY4fbxCVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137569; c=relaxed/simple;
	bh=oNlS2ipPtlAv1d2IHi/GwK7MhjGEgwdXeSYzE9n1++Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2tVFqMBxQFY5rZmn3Y3l1if1tZdLAFTvTUpqVDdFYdjL1BovExNbjhhs74MJRPy2Je/ZTt9UAJ/3FGB2Zeq4QODvWKjb1yYfdztxuuG5C2Kn4SgRNkI8GFotgso/s+lHd8AC/qaLvaSxQD5FpF1EeuxZ9dLzeVpwxJOyv3I9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbS2Ljnr; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbS2Ljnr"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c8027e876fcso175200a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 00:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778137566; x=1778742366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpxYnGiHGEuaf9nPrBPtOYorQFvh157G8iKvHie2maQ=;
        b=rbS2LjnrI3vqyoirn2Vwaprt5ATCZKUENkX13voOfqAhzfB8G7FT29kv6TmhmkqDG0
         Ka8wnuXT7eOW1m0MDwPqgs+bM2+FVvs8BeRf3ZhnmQgGlIiJVi27kSZt/JhYak6RAldX
         vhhfU0WUYxP1cZtXGoGBx2nVYprYFoa6qZvTjKiKVBOq5wXaYccTvwXpqiZxmvcN1PLh
         EKhCO9cZeX0gjqOHhA4gg3aQzRT5YM3cpfcbZNi5gCXvJYkkldSm6y4rQNjC6KV7fiK4
         Iru9Bk26b9VE1TeW3Vbv0azbAsLracUIZ5t3Pad92OXaQgeuPIm8pSNWFef3asuzbEcR
         G2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137566; x=1778742366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpxYnGiHGEuaf9nPrBPtOYorQFvh157G8iKvHie2maQ=;
        b=LDFFIPYwNkDPJDcJObB27yOcB94nHGWMDF/OO5eoqUKvS2uKc/SXO8ZSCibFm+Gs46
         jh3T3AQIBJOX1EKM6lgjA+YaUC9uaZKEvyu9L2tyhT2Qp+secBm0e8GrJKSM1L+TFowX
         hfbtMYrVHsxkLbJBuoTZg2MbROvIgQ7NLB3PfwIFVXlgexPXiulbxH/8M+0JDV5HU3aG
         UkoaJTfZvRcZXTuI9libGKjzuMLVIaEnpD4tgNwKpt/v3R+SdzkxL1usFKs/uODvC/JW
         RCwGEMvF0kC/yBSl37EqSHQD+cXFED8gES9+rFqm4Pb0N78S5QWLbpG5I9xscobTn74G
         bdZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qIolyzE9fU6sayKFJsfaeyyPnoKVobEwP146j77NTAzaRG/ODD82kaID0Qx0t6PEEPGR8x1H1tsIyvBa7Koo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uEUW1NE4RWGuC9WiFpG2dZMHVXbHQSUqByUTSmRgzuYOZp1D
	/3DZgkdwTUqq+bY9qXylQvYLIO6/9xQFeJa7NJbtvIuVfc0IogPH7NaP
X-Gm-Gg: AeBDietvTu7UohRfVubALbcimm7AMWsE5Amgv77yQ8nPKN6k1eIfUu7RclXbmJNF+Nc
	dRNVZjhppC9jmWnjGcrZNPIuMlxzApzz6Fl5feqN0n6Odg5WSQ0m1L0mBDR1slIvxrnRgx4H/4c
	9WpVKU5cth/GxF7zPDxWd8D1C0TcpnYOe7POaEQzCP1Z44PvUfAxd0uHAz+Lo6sBXdnS1cfruLy
	2YNEQEjKMG+JwXrXO4QOQt77bxKKRgdlk+mI7WdKHRNAYiALQFhXEGkRfYIbbKqC97RgAx5EGGM
	/vN+s5h97gr5lt9bRJxd88BkqVLEf93sYZ15TEBQLQWmg0QuNtZYxSRZglR0g40ApzVJwntGIc0
	TBjsz5Raq2vfBDBqwmCS/x9dXVfntKOoXGHIA/4GgB6fPSZvyUuogUmCmJMDXGI1yUYa21r+m3g
	y3fdnxMZNhVxSGtr/Hni6BSGnm3tKmiS3QgtUPaExCtHBB69BV
X-Received: by 2002:a05:6a21:99a9:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3aa5ab7170amr7433224637.35.1778137566009;
        Thu, 07 May 2026 00:06:06 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c825379099bsm1200164a12.14.2026.05.07.00.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:06:05 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org,
	zokeefe@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] mm/khugepaged: fix sub-PMD MADV_COLLAPSE range handling
Date: Thu,  7 May 2026 15:05:56 +0800
Message-ID: <20260507070558.3064142-1-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

madvise_collapse() computes a THP-aligned window from the caller's range:

  hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
  hend   =  end   &  HPAGE_PMD_MASK                    /* round down */

When the caller's range is smaller than one PMD (2 MiB) and/or not
PMD-aligned, hstart can end up greater than hend.  In that case the
collapsing loop is correctly skipped, but the return value was computed
as ((hend - hstart) >> HPAGE_PMD_SHIFT): with hstart > hend the
subtraction wraps unsigned, producing a huge value, the comparison
"thps != 0" fires, and -EINVAL is returned instead of 0.

A concrete example:

  /* both cover less than one THP; both should return 0 */
  madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);             /* OK, returns 0 */
  madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE); /* returns -EINVAL */

The fix moves the hstart/hend calculation before kmalloc_obj() and
returns 0 early when hstart >= hend.  This also avoids the kmalloc,
mmgrab(), and lru_add_drain_all() calls for ranges that trivially
contain no PMD window.  The same effect could be achieved by only
guarding the final return expression, but early-return keeps the
no-op path free of the allocator and drain overhead.

Patch 1 fixes the kernel bug.
Patch 2 adds a selftest with two cases covering the hstart == hend
(aligned, was already correct) and hstart > hend (unaligned, was
broken) scenarios.

Chen Wandun (2):
  mm/khugepaged: fix spurious -EINVAL from sub-PMD MADV_COLLAPSE range
  selftests/mm: add MADV_COLLAPSE sub-PMD range tests

 mm/khugepaged.c                               |   9 +-
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/ksft_madv_collapse.sh        |   4 +
 .../selftests/mm/madv_collapse_range.c        | 141 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   5 +
 6 files changed, 159 insertions(+), 3 deletions(-)
 create mode 100755 tools/testing/selftests/mm/ksft_madv_collapse.sh
 create mode 100644 tools/testing/selftests/mm/madv_collapse_range.c

-- 
2.43.0

