Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2E718AFE
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 03:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370241; cv=none; b=hVulHUjWOKS+DM4ejfYyY8+ZSTRjsioXhViHrfszJox4ISpftIkU2AuFD3aiL5tZZam4DB7S+1LnZV12m3CULZ/ZU481qGGeb5gTdBOFw7am9zGWHFMvxNOIHnqGhpIKsNcJ+2dsJnwb6q/nmrqi5ADP4t29VBSj7t2AeYPbDqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370241; c=relaxed/simple;
	bh=UFlTWNbUvzwCLymITQWsd2wQWBNsij3IqqVuiYdePpk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=h+22FatyTxsGof1K3CWBoB6dIoWARm1WczN3C1ihcPgDqeIwV9CraFFpKFbg/9trWLe5Twd1QpywguTcWOZrR0qdZx80o+wjNy0TL+Htc4dzAiqOzuyJks57jQgK2vgVW4ClnTeAXM6I4zoOHyG9bXzw8cV9ZQ2kIXb6RLpitF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=CEenTv2r; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="CEenTv2r"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5174a1f2d45so10951581cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 20:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370239; x=1780975039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1YZ6pkpMukmY0PpCar7lQ0cU7Gg/pAjVgGHiG98i3c=;
        b=CEenTv2rNnmtcJLtT5AupTwi7SsWz2GJNVhOFuf6rbh9YROnzSmaKeMgRb6luESEBl
         YXyIAGx/CYXfeKo7AEUbiUMNk8//dYriqPu9KpoaxpM+M9Rrum6aWUny36NZyKvACv5V
         pX39y1wU2x7K1Dm3lEviZTOioKwBlSYyRF5+Pi5eChVqNjsBMOkcnGRVEtFU2v1h4Gom
         WKjmYHF/O1QBxI+ZN94tX0RuOtuBHCUpJMnUwbvNfoKtpPDdmgUdh6YTE7GkcxlDZmoi
         wCMEThwgD2zr/NXu73aDcxcLy3Bb0jGKsl1QXNbRgGKDobSA6ZZV7X7qEjngYbbMbuSq
         JTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370239; x=1780975039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1YZ6pkpMukmY0PpCar7lQ0cU7Gg/pAjVgGHiG98i3c=;
        b=lssIa9rHCChofeCY/BNE4EM99qbmzuEDwm8xq7OJw9YD4mdnSlYv+jX1RDGfIImTyL
         sv3VU5SBmAdGkcuaMERKF7HkkXK3V4w737PzuotDI7wKdMOb5ngDF0aB4+Le+gAT/fZA
         ABuYcorjw1PBniei5jWCJXt68VLrkHUmyQ6aOTT5Ek7JxYtz2l20UsdjkB1ExbE51Pjz
         nb3GodCzgWgFhpON0877fPA6nvLPfRSvlNiRqxecAJB1CJEsMEoHrNXY3YFnFaLh1Equ
         QatlqvNfewGHwWJvvuvRBosQek2CvKEGXmQGbQfh7dMZ0X2ZmqSTwYDd3S1LgSKwGMAL
         sFUw==
X-Gm-Message-State: AOJu0YyFQXn2crHEZ1RF0T6WbjzrZrp+HxIVvqaQ7XLK6Dzc0bYQ3B+o
	5gG2Qm0BtehrTozhqcD9l61N0JuwuPtLkwVSGVp+k3FDpTpRYa9/AiucPxGstY7gbYMDTY/Xoae
	QR9DD
X-Gm-Gg: Acq92OEZ2z0YHZ85Ub9dXsTt4Gq8tF/yqg0Cf/JnYWKCkvHXV0HRsWohPK2k4JUT2ZS
	AMXnlm53jN3sZ/i5/1pjKT1G7uP4h8SLDLptvSskXWc9bNB892Vlql1yY3+wpWqjpsainZJPGlY
	1mZDg2kqwkW6cPaYkE59tLivhIfuvlrexgyNByEp78QAvz2mQQYxMyMi9P3t1iheilNoKpQ8bfR
	16wl1rAQdlYtfPiKNtvIXCZBpxoK5z74cE5MCKAEbHWN+vLmkSUqXDcoR9XemKYZojXMVAsrI/V
	03/NYAxJc327sXWAlcSyPe6TNJMFLdCElNxD3HfOOpl9i+f6Y4xS7oGKuPTS5uhp3L0GjUl1Sj0
	MkHU4Fpt3wf/71jzNUe3NjJHiARtgSWdakP28aXkou0dnGzjCgddn3A/juHQ+D1n9zc0XHOFQdQ
	XFPEnlxJMFWQyhuYuw7GrbJAAAvyypuq7zoNr84X3WbbHncPKho4QOrCb3RBxXWNSWEUglnz5K
X-Received: by 2002:a05:622a:a9c9:20b0:50f:f0be:dc7b with SMTP id d75a77b69052e-5173a7fe8aemr158846631cf.39.1780370239332;
        Mon, 01 Jun 2026 20:17:19 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:18 -0700 (PDT)
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
Subject: [PATCH v5 00/13] liveupdate: Remove limits on sessions and files
Date: Tue,  2 Jun 2026 03:17:04 +0000
Message-ID: <20260602031717.197696-1-pasha.tatashin@soleen.com>
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
Branch: luo-remove-max-files-sessions-limits/v5

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
  liveupdate: defer session block allocation and PA setting
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
 include/linux/kho_block.h                     | 101 +++++
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/kho_block.c                 | 390 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  99 ++---
 kernel/liveupdate/luo_file.c                  | 206 ++++-----
 kernel/liveupdate/luo_flb.c                   |  65 +--
 kernel/liveupdate/luo_internal.h              |  16 +-
 kernel/liveupdate/luo_session.c               | 241 +++++------
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   |  97 +++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 ++
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 19 files changed, 1184 insertions(+), 459 deletions(-)
 create mode 100644 include/linux/kho/abi/block.h
 create mode 100644 include/linux/kho_block.h
 create mode 100644 kernel/liveupdate/kho_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 2935777b418d2bfcbfe96705bb2c0fa6c0d94e18
-- 
2.53.0

