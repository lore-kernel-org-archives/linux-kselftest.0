Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF2279DC9
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179584; cv=none; b=LioYzjcsWgsrTNQTHJJP1WJrNCUJOK+O0XtHFfkXprKxF4AMHQwGcYaZGlVZOHwhZZk890JDgJFGb42Oo1lw7DbroVReClOPW2syh25WM3LnIQYt/WVMArFfDMFz9wNOggqv3nDSkD69OPA3lhTFm7sDkO7pNd9PeaV259JS2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179584; c=relaxed/simple;
	bh=9loOIylvqKy8l4oNQ0D0Nse0Yq2cB9nHrVbowE29lco=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=bSmgQ3QXegFKnyIWQU3EaXT65M9M6Q1z0YvhYf4CCkGXXDUrZLpsSobfp1ILB7eSCYOTDeo4bDwRj2s4sMltCQg25pxuqAbM1o1AgQk1Fye64DmsgIabiNF4ULOYZ6mMi/YDCGvvGk9+SYBLlae0iGJt85VicozM51B3dsTzHTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=boRTZkUE; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="boRTZkUE"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9154ca1aa1dso53033085a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179581; x=1780784381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Pvi4u9YaDjGAHaiBChsK2kBa75JO+Ko/uXGwG0BtI=;
        b=boRTZkUEFmCKBXnukhUyIuxvQyzc/Fuf25kl1S+YomK/Wj1DdNAbjmyYvrwdG3V2a3
         37KZhgYEe9CBNuZ8i8ehkCgvFT6GUbEMSqVFu3KXHfrQVeVTs0uM+GREgq7dGRlGZlyp
         3Bo/1NERmUAAoeuJ+++Sn1FoYmdBVGPu81PNW22jmNtnuRBathj1+VUjI58xtQ8Ol1IP
         4gr19ywqX4PaXIgmYFvqm/TYdLHCh+GrPxzWAsljMih0E6sJg1OzjN5MczOT6r8+7Z20
         0tNd8SXnHI1wnwahh03y+GahKvewbLi/rMzzmP91ULAoT8VqbwAfBpVNY1rcVm0NIA1U
         IoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179581; x=1780784381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0Pvi4u9YaDjGAHaiBChsK2kBa75JO+Ko/uXGwG0BtI=;
        b=DBAqT4lVOuWN6jnafJUq2xS8Hi1Qv+v7efsJGpEcRO7oXrC+yFuKDmhLWSZMxaMNeJ
         iVPznen0Hc/uYH1kRvZ84ONeMDtNqmdevwve3xz/qBwQF9zRitxmGNXwIrJ2dYrGLFbV
         3oxe5dkQS+2dMjuiHG1lrt0skaEJj2i3AlkCcdVevX13o7iJIaThejvUM2Vpxxha8ndv
         s951Iald+h9qLQcF2UdkVdDN9bkaijsD80H+QQUhP39ckEb9DriMJmXO52untHZcVD/H
         l80V3qrRmSnvujIpfS0A7JOziG8k9OHb0E0GcF9u57eRWi1mGSdq2Blz6nYbPnHBmDZu
         moaA==
X-Gm-Message-State: AOJu0YxR5z3SDhccZg2rGqDrf4DMGw6z4hVT+i/jeeOSeo++TQDzpioX
	cm8SNcINvthzB8M6YhBaZLqWQR0hIdd8sV5D6jAwTeQHIi3naCuzjoB6sdbs59NWruOu+GsyuoJ
	ga+p4
X-Gm-Gg: Acq92OG9U4qXrl+ntXE8lOE8XlruT63YcrxyyLB4AOOQFmtzWDtZDgE+qjhKZig2xfi
	jeEPGKtVBX8mGeBuEFafRWJareh7iGQLa4dFUFCWSUTdE7cP3amEycKqUgQAqvJ5BXIuFYQ1p4Q
	PMboFuYIJB+xQCj9eGOTdV+hQG8c1i2si5jiFPk0S4qXUdZcTnPHY6hQwgjmZ51OFl2MhypmzYL
	MYxbu7YfYTq7Ld6yvrq8rkRLm5SygEhjbs4XnVwTRSmh7w6TLsCqvUi+9jx+MrMovb2aY7RdLxh
	M2g2GoWv+246s1yv7k+H6N8wPoK/jIjVAtiAfbm8o/Qv8qrJXWDYZtzzvvzFP/H5+mNXDiljbk8
	HSqfCPe2tVyw/SZUhsbFe53OZvkqS87B7WTLua3QAGjyTfP4Jwcn6ZY5CqY+gOCHLhDzqghUffQ
	m3U2oPQP8D8PPorsS9QCdFa8eXwY51Q9cWwly0ZHojbrtLJMiCt0bXBB1LfD/gCw==
X-Received: by 2002:a05:620a:172a:b0:8cf:d80c:5ab0 with SMTP id af79cd13be357-9153e0a76dbmr564555385a.17.1780179581378;
        Sat, 30 May 2026 15:19:41 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:40 -0700 (PDT)
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
Subject: [PATCH v4 00/13] liveupdate: Remove limits on sessions and files
Date: Sat, 30 May 2026 22:19:25 +0000
Message-ID: <20260530221938.115978-1-pasha.tatashin@soleen.com>
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
Branch: luo-remove-max-files-sessions-limits/v4

Changes v4:
- Addressed comments from Sashiko:
  - Enforced file count mismatches during deserialization as a hard
    failure.
  - Reset bs->head_pa to 0 in kho_block_restore() on cyclic block
    detection.
  - Added two small fixes to pre-existing problems at the beginning of
    the series:
    - "liveupdate: change file_set->count type to u64 for type safety"
    - "liveupdate: avoid mixing cleanup guards with goto in
      luo_session_retrieve_fd"

Changes v3:
- Moved the linked-block serialization infrastructure from
  LUO-specific (luo_block.c) to generic KHO helper infrastructure
  (kho_block.c, include/linux/kho_block.h,
  include/linux/kho/abi/block.h).
- Registered luo_ser directly as a raw KHO subtree instead of
  wrapping it inside FDT.
- Collected Acked-by tags from Mike Rapoport.

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
 include/linux/kho_block.h                     |  79 ++++
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/kho_block.c                 | 384 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  99 ++---
 kernel/liveupdate/luo_file.c                  | 211 +++++-----
 kernel/liveupdate/luo_flb.c                   |  65 +--
 kernel/liveupdate/luo_internal.h              |  16 +-
 kernel/liveupdate/luo_session.c               | 242 +++++------
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   |  97 +++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 ++
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 19 files changed, 1161 insertions(+), 460 deletions(-)
 create mode 100644 include/linux/kho/abi/block.h
 create mode 100644 include/linux/kho_block.h
 create mode 100644 kernel/liveupdate/kho_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 5428435567cbe06c19914592fc22ca23c9ca1de5
-- 
2.53.0

