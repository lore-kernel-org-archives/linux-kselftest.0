Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1538A3D3CFF
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501449; cv=none; b=Etyl2jMI/uOzGTQDchQ0uH13POA5uK5DGvGTbW9MIPM70ian4LH2/9olhZcGnhWOqHWZEbbCqu/ERP08fXapWpfeKM0N5MAdgGgPGQQckfMvj5kBQVYzdj7EdGiP57RDJtnrG3GN9z6v8vQ9lYIHK0O/jM8hf7TP2JxpCZ0GXq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501449; c=relaxed/simple;
	bh=b2e1N3WNuvDqJwLy2iHEiZO66j92zWhizs+pziHMFdc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HCDYy/2hzdjPeFR9yF7ovY6qTwbC4uTUF1pc3j19tGQEbhKnq1/Im62o09ripzn4yHmYNtzcYeuFRaCWKG7T5A/AqPTb/2I1mT0a6V2jhjChRMKD5CTUy6vECEbzK8Lph0kR+bA6MCsjo68h9o2m10jpfuwpSgelN8J2NEnuz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WaSeCsuW; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WaSeCsuW"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5177945a279so10232551cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501447; x=1781106247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIUnOidiefXcspEuuyeBWqUN2o/RTn4ccvxerf6qmvg=;
        b=WaSeCsuWfZtJxbkwwOAUr4FJxov6LtJDrmTWkXloVPwomZRIAMT4UiY3S3qQkQOt5Q
         3/BuZ3We/zj0oC0Bx1jKW3ah3xwiI9vHNdqCOCU+xq7abCpxT/vI9sQ9mXF688rN4saa
         J0wzAj+d9QJ0yrcujJEVY4AMx3VeYhFK1AaVUjXKlM8ysHONQpQQVn1jJ0nQfm3WeUoC
         GNLm7aOL4OqJVfPyRm/XiMkalFSKQ/tb3pebgp5VQZoXgcTepsumETKe0Awvep4yfPtp
         odMYVELq9NKwzbf+oMM2iY45IEqPo8dJCMV1BJr/QDDyp39YD529897Pnv5H14HlKkKo
         kEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501447; x=1781106247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIUnOidiefXcspEuuyeBWqUN2o/RTn4ccvxerf6qmvg=;
        b=XRGzMI8OMA1FwtTgSSor28l4DFow7GFTKOt4a2YysAORUsIDlJFr42SAv/y98RIg5F
         w49SRT6PgyZhupMp1RzlAn8OWUQh2S+XrD0ugsOrh2XwBFnXT3eXsFdLU44IjdqDm3X4
         t9EsIjq0aod3aQf6sxON138Bh1oQ6mwzrE7a1+6M1gJkvFYNoTO9PGAufruv2UCpLaqk
         fDHzNpkIP0yTUCOeE0FbyKrZE8XsKKw6OLpafe9LwI9ctpVSpy2ZEIPdN/SIPrJf08ke
         GI17SwRIA0KzXC1DQX7Lsaccc4l5hbyJpVcNcZI4xCznZwjLUOVJwr2me4rlTXoR0whx
         eRBQ==
X-Gm-Message-State: AOJu0Yz1n1hPXRAE2aJhI1q0IlGCkh5mnyUWot/c+6HRx8tKX16MMYR8
	6hk08DF/V23yIxRGPnrTt36amJRNP6YphdfPQ5/v6fYGvzn2Z5yGQHjkQxKL4c4UMKMzykcVUol
	yM8i7
X-Gm-Gg: Acq92OGaVoVxtAJ+IIw5Q/ezWNM80/QEVnR+Nzk/wSexe11R5q6xlKF5ZqMMOhEnUpU
	rQmEJt9xgGgW5XiuT6nov/n/4RAsy+PpR9HMQXMA67KFA/qqLZ//+ExDUHr3RCCVXnuZCxmuiaW
	2+b4NQCFyCwanLqYhLQbGajOSk5gJfcNizshFMIclFkk9WoQ0kA0f9zxWSWdf7X6e0O09rvgRHS
	6azPz3jhPXjudZxoVc7ge6Z7PY/nlUdzfVJ/pYykYK8jLAe1YXTd85v94ulQEvOtRiNvGDEZ3FT
	72Pn6iAIjUMMve6d/1WOEIIBZ/X1Gqo9W8bb4SXrLLSEsAA1oBW+sNM8zeAaOFcku691H/uHxyz
	kil7i6qQwihJ5NnRFjt/57u9oJrDkYpXRmblOgI867eYaBsXuori+oSlwqkM16+Td97iNIUUops
	fnIH5Bfm1cBrYhVGCXLVHic0Nxs+V5GnYLRxqsneTZS0tyWrqhj1jyTZFJ63wJrA==
X-Received: by 2002:a05:622a:313:b0:516:508b:bf4d with SMTP id d75a77b69052e-51778789b11mr58906021cf.56.1780501444077;
        Wed, 03 Jun 2026 08:44:04 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm26996561cf.4.2026.06.03.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:44:03 -0700 (PDT)
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
Subject: [PATCH v7 00/13] liveupdate: Remove limits on sessions and files
Date: Wed,  3 Jun 2026 15:43:49 +0000
Message-ID: <20260603154402.468928-1-pasha.tatashin@soleen.com>
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

Changes v7:
- Addressed comments from Mike.
- For changes in kho_block.c, and updated to use gloval KHO compatability.
- Collected review-by's and acks.

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
 include/linux/kho/abi/block.h                 |  54 +++
 include/linux/kho/abi/kexec_handover.h        |   2 +-
 include/linux/kho/abi/luo.h                   | 148 ++-----
 include/linux/kho_block.h                     | 106 +++++
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/kho_block.c                 | 416 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  99 ++---
 kernel/liveupdate/luo_file.c                  | 205 ++++-----
 kernel/liveupdate/luo_flb.c                   |  60 +--
 kernel/liveupdate/luo_internal.h              |  16 +-
 kernel/liveupdate/luo_session.c               | 219 +++++----
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   |  97 ++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 +
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 20 files changed, 1199 insertions(+), 446 deletions(-)
 create mode 100644 include/linux/kho/abi/block.h
 create mode 100644 include/linux/kho_block.h
 create mode 100644 kernel/liveupdate/kho_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 2935777b418d2bfcbfe96705bb2c0fa6c0d94e18
-- 
2.53.0

