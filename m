Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49263F0AB6
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 03:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457350; cv=none; b=K2b6PsrPls03pbsgxGz/ORJEKt9mfqgQgNHYVLyrBtkAm4UodQwKPnf5VRSJqCpJGDO4lNK6y2B2vc9Hrn8oBUuHe8CGIGlN9ftuQrq1VV7sxKgwUFuqvNXDNG9RQGk4TJB8Ucq2780HQi9pa5RzOpkoGl2VriJYnxg3q7/szLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457350; c=relaxed/simple;
	bh=4eqNP3XoePVXzwv3BCh7E9Y7MGv7TTYrbKrgAOH3xww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=W6UBPylrUg8Y9ifiL7VfyTOWIMb6qcqy8TA/tTXNLl5asZqI882xGs8nN+UEAntZDu4PzSnMAM1X4mYWGoTsYZvBhPC/NByREmoYgaiWT6f2a5vnudpMx8kXfzTofNAKcnmVLDNt8lx/0x2N9YSTelt7FTlSaYtLyHrL5mzDM3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=E696315j; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="E696315j"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8cceaa6f75bso77387246d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 20:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457347; x=1781062147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4+c0fQ4LYrHNLHZUplyns5z+KGYVI4xj+rLgvLL9F4=;
        b=E696315jW/n+q05CVbFIqsLaoXWuwP6nug+3hc2iWe5GQkaz5hxaA54RMEUD8LmqNA
         YTT3zvRLJWEanUb9YGBcvhGa65XwVUjB8ASrUiCDvU3bIRJQ5w+Sbn8C6DQmev6l6Tnk
         YpmJluwhJFDzgX9EOZP16r5Rq/9aUyIjy89ij0caByoIEsiHrqDhLSI6xYZA+iw21dAp
         gf0HoGNwNfKebPhx2/Y2MkgF+xWw5Hg6b5ma0FgUkzxG0HDRaL0idd1xECwBGxJWoH1X
         z9GK6eZTZrdDKovuPZGpZjk+/gl6JzrDHk90YbAwnoFkcbMw9rxOMTix92NYruIWYfXC
         EdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457347; x=1781062147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4+c0fQ4LYrHNLHZUplyns5z+KGYVI4xj+rLgvLL9F4=;
        b=GTCogL+VVbl8tupyaXZRoigyatIBNv3WCH89Q/LtkcMaIBE9yGojx9nnFaPCYcL5+J
         fjFt8kKnaDjHq316JLb//1RRh800Ca2/Smc99Zz1NoWmVnVPHs/wIsd78uNOGlmNJ8ET
         pgyuq4Qlx3OlTR97uoXETFrNj+v6t8wkB9C+qGySSHDR06VqbAUdKPo3OcdhuJDEzS5S
         RJx9zVtjppxQinPw7P+un5C/zNCBC4rVuUGp6/AESmJTpfWX2XfzT7f9nht+cT992xbD
         l53PgTajKGfSabeH9YnfKmd/brr0X0mThp/w2yfiPgHu/3gj4H8Z9CrLFoFqVmOFBSTv
         DSzA==
X-Gm-Message-State: AOJu0YxTmMIQKyjDvPL3kOvIEg1a+T7GxxTvRC4swYlB/OLxHE8zVN4Y
	sjyoK++PWTXbEPPKbzYV75Y0EYhBiVHS73v8nRGPS8mjzXnlUtKrcA++VzQTx7kkO6+Dy93Tp+s
	HNTex
X-Gm-Gg: Acq92OGqWM7NzxKrx+3s1NO0YdARmb3GYRElxQa2wGT/McgWRwbgnBzt+GiSF5crbZn
	Ehw3cxzE7ZYj3HFNg0/31mgY4VzAXw1oVm/nB2DYVPWsJEeuzZCHyOuL5XD3GmacSMBzRWtHk3J
	pWfgfRdAeNhIX3qZtA3qOgfcvbs6oHx5vs2fJ8/Lu56A1+XJDl4RrKsuHVyQZSKDuKFzT1Xw+aB
	xDgLMXaqfBP6ha24bJrQ9plDq/m7hTINgGQvoDCp8IjnZ3ZCCz+uAXLE+R8qo2PQa+joo8vflZh
	d5hxtEvgHBHtDq9Lvg7SN+e3n1hLJw1dDVHIiZhL087wbDhkVG9wa0RBfQ7kuT1M0AUqw9LVAgl
	jg1jQaHhZ9DMgG3Tdl7+MpfwPz42QwoM1G2o4k0NMq8IIvo/SjiMFhNtojC5dOCD3MepuUxaLJD
	LT9hncyiWzEybAqTK0MzCU+fIrcwXDz3UqxweRvDbb7GMUW3OoLgnDJvy0OnkHdg==
X-Received: by 2002:a05:6214:493:b0:8a1:8b0a:6678 with SMTP id 6a1803df08f44-8cece03811amr23330036d6.31.1780457346835;
        Tue, 02 Jun 2026 20:29:06 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:06 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v6 00/13] liveupdate: Remove limits on sessions and files
Date: Wed,  3 Jun 2026 03:28:51 +0000
Message-ID: <20260603032905.344462-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series removes the fixed limits on the number of files that can
be preserved within a single session, and the total number of sessions
managed by the Live Update Orchestrator (LUO).

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
    - Introduced KHO_MAX_BLOCKS (10000) as a safeguard against stupid
      excessive allocations or corrupted cyclic lists during restore.

3.  Expanded Selftests:
    - Added new kexec-based tests verifying preservation of
      2000 sessions and 500 files per session.
    - Added self-tests for many sessions and many files management.

Tree: git.kernel.org/pub/scm/linux/kernel/git/tatashin/linux.git
Branch: luo-remove-max-files-sessions-limits/v6

Changes v6:
- Addressed comments from Mike and Pratyush:
- Simplified kho_block_set_destroy() to only free successfully tracked blocks
- Enabled dynamic entry count tracking in kho_block_set_it_reserve_entry()
  to automatically update the count field in block headers on every reserve.
- Removed the error kho_block_set_it_finalize().
- Renamed various kho_block_* APIs to kho_block_set_* (e.g. kho_block_set_grow,
  kho_block_set_shrink, struct kho_block_set_it, etc.).

Changes v5:
- Addressed comments from Pratyush:
  - Renamed kho_block_restore -> kho_block_set_restore, kho_block_destroy -> kho_block_set_destroy.
  - Renamed block iterator next/read functions to reserve_entry/read_entry.
  - Added public helpers kho_block_set_head_pa() and kho_block_set_is_empty().
  - Added validation to treat zero-count blocks as errors during restoration.
  - Simplified block iterator reading loop from a while to an if statement.
  - Changed standard WARN_ON macros to WARN_ON_ONCE on iterator allocation checks, and added warning details.
  - Simplified session serialization by removing a redundant NULL check on sessions_pa.

Please review.

Thanks,
Pasha

Pasha Tatashin (13):
  liveupdate: change file_set->count type to u64 for type safety
  liveupdate: avoid mixing cleanup guards with goto in
    luo_session_retrieve_fd
  liveupdate: centralize state management into struct luo_ser
  liveupdate: register luo_ser as KHO subtree
  liveupdate: Extract luo_file_deserialize_one helper
  liveupdate: Extract luo_session_deserialize_one helper
  kho: add support for linked-block serialization
  liveupdate: defer session block allocation and physical address
    setting
  liveupdate: Remove limit on the number of sessions
  liveupdate: Remove limit on the number of files per session
  selftests/liveupdate: Test session and file limit removal
  selftests/liveupdate: Add stress-sessions kexec test
  selftests/liveupdate: Add stress-files kexec test

 Documentation/core-api/kho/abi.rst            |   5 +
 Documentation/core-api/kho/index.rst          |  11 +
 MAINTAINERS                                   |   1 +
 include/linux/kho/abi/block.h                 |  56 +++
 include/linux/kho/abi/luo.h                   | 149 ++-----
 include/linux/kho_block.h                     | 106 +++++
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/kho_block.c                 | 411 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  99 ++---
 kernel/liveupdate/luo_file.c                  | 205 ++++-----
 kernel/liveupdate/luo_flb.c                   |  60 +--
 kernel/liveupdate/luo_internal.h              |  16 +-
 kernel/liveupdate/luo_session.c               | 219 +++++-----
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   |  97 +++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 +
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 19 files changed, 1196 insertions(+), 445 deletions(-)
 create mode 100644 include/linux/kho/abi/block.h
 create mode 100644 include/linux/kho_block.h
 create mode 100644 kernel/liveupdate/kho_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 2935777b418d2bfcbfe96705bb2c0fa6c0d94e18
-- 
2.53.0

