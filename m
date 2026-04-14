Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811824336D
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196962; cv=none; b=R3Iuehq7JZxQcvyQbRrjDOrfs178ZeOpgPYFQiniBRU90jyQBjxt4UHYyes2Xubz9NJC4HJIZGtooyPI0yC9N86Yytbd3dLKKl5jvbZZHfvP9k6U32lmvCw0TSPTrbJWXuSwKsTurJAsKoqnn8coRskMqkSd8WaqOMYpaxw0Wek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196962; c=relaxed/simple;
	bh=UqAD1DbvemQoLVYjvSM0OBTkRDjMzJ1cIpCr4raXcis=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=S/N073LsDWq2cHC1KCpzK1mOseCtVXsaFt2+zILnfGeow0XcN9AT4eLiSkMmLmn7tqYd0C18oKVST1B/Vdlvp+A6YNpWJJPAbUVeSgMEm7EbNbccuAgIZVMedRA3H0tkp1g5c9JveNAsCfQ9a7kTiWfbtKyJ/72CZ6vW5RwUwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=QKBAjEm5; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="QKBAjEm5"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6058a7dc4ebso1826110137.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 13:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776196960; x=1776801760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JKwITjeCygFFMWgjlHnhRhK9rZVbof5rkADvxp5LiY=;
        b=QKBAjEm5J4LZVqxS6y7sRcO4EnxkOhuAcpajw5kN4HU5r2OPUakPtX52e5uxg+++Mt
         yntkZ2Usm2whSxjlif0b9B23VOPFLGyZBz0ujFTduzg4Scbjv+yTKuAPu0bVq8/fYP3P
         qFJbLZm1Vow/MpvZYTfkC+T/+8O2RbkPAzia5uGpYXQuDPIKockOrJYmcmyZazHfuqyY
         sSwFjmSM334/ZDJVaxkWZXNLTWmLwv6+NC+Uvx1Umu+5+nQgfs0rLi3zd/lzpwYjX4Lx
         har/lEeVeaB2Dijg7of3wYl+31TvuxhUeWB/5kIKAkHtS7GZrmxe47+NpXslNv0i4xvD
         Bd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196960; x=1776801760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JKwITjeCygFFMWgjlHnhRhK9rZVbof5rkADvxp5LiY=;
        b=GhTLC+47kCkhccLFmSnw/JQwgP89hGLhP2ULwcKuaMhubnIcnrS3ijCRWfIZclh8xC
         RGRh4hLi+qjh6TeUD6Zjuaq/NnHFr3P6KhCoo/0BYhNFeAOdqoslccSS3iH/YAb/lOe1
         6xSFa1KZkafIlbUMw+gAdmKXLpVoamCInfPBD9zr5/MRw1q6rWxsKQ4Qs9H/WaZIQpzf
         uEC5EpggpqLvbvKC7/Lbar0l1iJ0+kbtkWDYqk83KZbF4oLm1zSM5FonE4LtZdrUp9wU
         wesMkwsuuuj0HJH4aSHkeZQz8N8ZTawr/deqnIbOq9/7O4HgSKP5zyO6lKx95o90yXGx
         xm4Q==
X-Gm-Message-State: AOJu0YxiQPiBRM301kdF2IPatc/8y0jouhDsZXDsY0zjZXpGab165sPp
	CP0t6Jmh5U12J1IiJWEZk3WIv1J/PBKgCCE90Tof0SbKXWAFDhJ897DlN96d7QB8Nz8BiY0YhHH
	pFAzq
X-Gm-Gg: AeBDiesR3Vz7LWiKCb1215Ppcx5+/+HBELE83a0x24ron+azpsZxnpBiBq1gYeUJpj3
	RD540jrTKwzx5Do+9UU/gd5/OtS9Cew78HryMICmpb7lOt8kA90sXgMIG9CiFgzUBPFDJqqgoSx
	iVRkcIN4urqklgwpbpufWmeJGsB8Iz/bW9C2uBneJprPADhux0rdZrUbr58xmcg5Q+7kuBkqfG5
	UCpzV1NKjtwzDz0DvxaRbFvgngJbEb2NSDUTpECGKPvb03uwBc7CwBBrodUmYcXjFuQEK+iKh4C
	bOWRtp4f6EeyurJKYSagWsgwKofXSxq/jcOiIwoAm8ZbaaR6Jnl3z6bUb56gzfHs/RG0x6BG2Cq
	41aqXqBR4la26+zdAo1YAZScjmah/LnQItspIdKiVKD9MJ0AJUbBKRfZ2r7vUYOBRWP1K+Vapmj
	VjUYkE1lqqYOpcKzPofiZEvz9KsetG3UPpuoXM+rwFJn7quVV3K0hxzsMpreWaLKJAaw==
X-Received: by 2002:a05:6102:1526:b0:5ff:2963:52dc with SMTP id ada2fe7eead31-609fe7a6ademr8406630137.4.1776196959613;
        Tue, 14 Apr 2026 13:02:39 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84a180a2sm132213656d6.15.2026.04.14.13.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 13:02:39 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH 0/5] liveupdate: Remove limits on the number of files and sessions
Date: Tue, 14 Apr 2026 20:02:32 +0000
Message-ID: <20260414200237.444170-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the fixed limits on the number of files that can
be preserved within a single session, and the total number of sessions
managed by the Live Update Orchestrator.

The core of the change is a transition from single contiguous memory
blocks for metadata serialization to a chain of linked blocks. This
allows LUO to scale dynamically.

1.  ABI Evolution:
    - Introduced linked-block headers for both file and session
      serialization.
    - Bumped session ABI version to v4.

2.  Memory Management & Security:
    - Implemented a dynamic block allocation and reuse strategy. Blocks
      are allocated only when existing ones are exhausted and are reused
      during session/file removal cycles.
    - Introduced LUO_MAX_BLOCKS (10000) as a safeguard against stupid
      excessive allocations or corrupted cyclic lists during restore.

3.  Expanded Selftests:
    - Added new kexec-based tests verifying preservation of
      2000 sessions and 500 files per session.
    - Added self-tests for many sessions and many files management.

Pasha Tatashin (5):
  liveupdate: Remove limit on the number of sessions
  liveupdate: Remove limit on the number of files per session
  selftests/liveupdate: Test session and file limit removal
  selftests/liveupdate: Add stress-sessions kexec test
  selftests/liveupdate: Add stress-files kexec test

 include/linux/kho/abi/luo.h                   |  52 +++-
 kernel/liveupdate/luo_file.c                  | 226 +++++++++++------
 kernel/liveupdate/luo_internal.h              |  29 ++-
 kernel/liveupdate/luo_session.c               | 237 +++++++++++++-----
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  99 ++++++++
 .../selftests/liveupdate/luo_stress_files.c   |  98 ++++++++
 .../liveupdate/luo_stress_sessions.c          |  98 ++++++++
 .../selftests/liveupdate/luo_test_utils.c     |  25 ++
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 10 files changed, 709 insertions(+), 159 deletions(-)
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c

-- 
2.43.0

