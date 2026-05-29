Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DE736A351
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 03:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024870; cv=none; b=cVBUKF5DmOUgOATXucerMot+Wlht+z9mBwX7yppikS6EMz97DNp8MQF/j3XzhUdluPTc3l2jFoMeDmMRa8ort2/kEG/gkRIXYdDssp0RYaYG9WezOyKDJk7MCs2E5cAoSqWeHmVDMAY48Hx11B5TR3c8ANOVMjRZuSmUMXqfK1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024870; c=relaxed/simple;
	bh=+K36CKUUJJfYFairGEtPDYAa/fOj2p+J3bNArJT9bz4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=XgDExdYAt5YgH5+915+RSLsXBWw44TaUNCqoido0N5gRucZDa3WHniN0WamkfhuFByi+4f9rJ8onkD/9qaBWB6gpdoWyT1YEll5IZJ2VjzZQF38iqISP7r0R3bwEuJceIxcLXouTyqqR4XHf3sTONeDBpsN9upZ53zzaLSGSTqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Tfm1q1fY; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Tfm1q1fY"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8cccdf044e7so16621426d6.2
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 20:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024868; x=1780629668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWz/Ba0zwzmUZSFYwq/eHsbiY7hxxlyTIzOmzVE8aUU=;
        b=Tfm1q1fYuAZdmICata9Mt6B9GKN4zeSQf5hRHtpzOPOczqMyHnKm9tZVmnDKv0ZJkG
         aoy8sYZAUqjk8xDQn9IOtEY6tnZxs6+3c8euU9vLCeFrDVr83aBZQGBaVwBo4mdf6WAW
         aweUu5g0caI45zc0jHo/n31kS+t4N/NichqyQK/Cc9M1c88145W1n826csGmNLF1hW2A
         ouIFsifkmu7aQQyzI995v9h+LlZVQdc3MPlPUiw/ub4Z+oDhlY5wK8ylkztBXTkdbT5U
         +N+MfIbE5Iqus5ZUhdRs1vzxWJcj0EN3HbYX4GVZqOYqVTHc8s0SbcOL4rINMjiTzcKn
         pd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024868; x=1780629668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWz/Ba0zwzmUZSFYwq/eHsbiY7hxxlyTIzOmzVE8aUU=;
        b=kQZF/9lze7ClphZe2ES3+5XwQu/PoxqnUOYKbIRurasAFkjK1fuLDwanP/c757GuDj
         6823PnkjmGlTGNYuwk0ZBHuVDSNsDjia0PklT5q93UAcXOczEX/Me+pyRN+uullLuml5
         WF7UumIU/b6jsKBkg25di+uODpFpNGATpuY+tZWARXJXd3vof5fwHaRz29MI2Ji26tk3
         WPV9Mx/eQXXjLz6sOhIAOOQkvqKrZbYNEfJmmqa6DzVD/obruzTRIBmzM6wmgQz9WnoG
         a/2cc8acv7DRJNeZ0miXBPmDjzh08qYMtisX+MCB/K7n2+qNjHiFriHbX0+cRTK3UkNw
         EHDg==
X-Gm-Message-State: AOJu0Yxc5jSVviXRjf74C3SkAdUwOq4gf9qqGefX3Q/sucrC0D3yQqHj
	jdrLIkrmV8Iw4tCsCWeXQeWUOttK79puNsk9G69WVzVErVswVl0dANuY+pX5ciWgCZjcKI8FTFD
	jAy8l
X-Gm-Gg: Acq92OHZlV6996CW3+5d/CvRdq6BgaF4avWVWtmYRCBWafYFlzFMd/K5rba86J019MA
	tD99dl+G0KfgHTzaT8LB+bCU2K1MkhdmgyfBsJRUTSxKPToMrqC874d/8dApRnkFBY8QJCA6cqe
	oEi55OWOlEP8BR+MtUJ+Y1YKYu5UjtPr9UqldCCtnEyfCkJ14K4ra/bt/duhv+azRP73HITttmT
	N7qjxD1CrfVWUAx0JSbki+07uOO+DyBJw4lPDPOJdn1N/wMgaSHR5+VmtgA3c9Bhcp07w/5qNZN
	QC6ZfWAgSULTpOSRbv0Z14MuZjRresyAjOdyoVU2h9nMKq5odKF1XB4c+uGiqIKjlewsiQqUWvw
	zu97ptmZbFbUlixFkYQ7+NARRkF64ho3ccB+KIv6+0vnhH4EYYxQKomJawVca0sbbguwiCnPmNS
	pkktLBpfbN2XSpeC7JTsSiYW4nlwp85PETxLP638F5/HNdDQ3UgG1vAPMQAv2jVQ==
X-Received: by 2002:a05:6214:2f13:b0:8a0:d08c:a720 with SMTP id 6a1803df08f44-8cce8009ba3mr14944206d6.17.1780024868221;
        Thu, 28 May 2026 20:21:08 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:07 -0700 (PDT)
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
Subject: [PATCH v3 00/11] liveupdate: Remove limits on the number of files and sessions
Date: Fri, 29 May 2026 03:20:55 +0000
Message-ID: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Branch: luo-remove-max-files-sessions-limits/v3

Changes v3:
    - Moved the linked-block serialization infrastructure from LUO-specific
      (luo_block.c) to generic KHO helper infrastructure (kho_block.c,
      include/linux/kho_block.h, include/linux/kho/abi/block.h).
    - Registered luo_ser directly as a raw KHO subtree instead of wrapping
      it inside FDT.
    - Collected Acked-by tags from Mike Rapoport.

Pasha Tatashin (11):
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
 kernel/liveupdate/kho_block.c                 | 382 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  95 ++---
 kernel/liveupdate/luo_file.c                  | 209 +++++-----
 kernel/liveupdate/luo_flb.c                   |  65 +--
 kernel/liveupdate/luo_internal.h              |  14 +-
 kernel/liveupdate/luo_session.c               | 214 +++++-----
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   | 101 +++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 ++
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 19 files changed, 1142 insertions(+), 445 deletions(-)
 create mode 100644 include/linux/kho/abi/block.h
 create mode 100644 include/linux/kho_block.h
 create mode 100644 kernel/liveupdate/kho_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 5428435567cbe06c19914592fc22ca23c9ca1de5
-- 
2.53.0

