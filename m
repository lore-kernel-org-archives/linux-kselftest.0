Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524B407567
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379352; cv=none; b=BSHLYGg7q98ej0crP6pYRGFHpt8v3r+IIbLOBhXsGK4i9e/2wLdgGMOhKV1Ej8W+4GUFCfb2UUXn/5fyIMtyzbkLsgcQ4inEWHgQmhd8eg+5DfpRCEKxN5p0IRSTChAUX6FArYKXZ7hkcg3bkcrn4cYdsqr2TIDpGKmAt170KRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379352; c=relaxed/simple;
	bh=M4bOzB5KSiFxm7wQ90xnzZcpu1jf7AoTVdb4p95KygY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMYZtzQKfKFposb/7x1bsMg4oRkigb8tKsuDfFXCVaEtn18pZcuG0HyISumT7zryMEnitD7YogNSRlO2HGHDqb/1dqvAODKo9/R4jDc+J4oVip5RrNPbw6b4w/pHbzGVEPZkvx/0EFBaIKG6u8WfTmKfYZdKl+pM0Q8yQs3OvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEX2wNFL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEX2wNFL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso98274015e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777379342; x=1777984142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TXcCY471zeTwyfOocDx7ieLgk3K5M2DX9c2HV3C7GKs=;
        b=cEX2wNFLfVLFKOBtjV7alXDKvlYDFxVXRnXEg1Xw+9l0hlmpDCkqgsoUhAmtj/LSBd
         Y/3nI5yuNrK877m3QWSBdD6Q4gstZEliyfQTog2i8+MAkM8LzCAXCRrQJPrWnqNztev4
         S2dZ57bV56g5gT1qR82IHAGdIx+Tyk7ZAzEoGPW765mqSffFWalapfm8ooXuQq43msfm
         yMM4WhGC2Pb0S+YuWzv6GmvtpNsBpU1aAMeXCW4DCP1s0pKpryRMkMmIFjFC951tz92l
         o5uZ/qywGPjldtyRzGEiXbQd5GETVe3B6BOBEBqsw8e6dV/7UPWFtC4GjGzhM9mpS1bc
         3qOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379342; x=1777984142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXcCY471zeTwyfOocDx7ieLgk3K5M2DX9c2HV3C7GKs=;
        b=Rcc+MtHJ23YcYOId2/tUpxbfGamvFh8Z04Tcivs/S5sM4qC2pTqzY5HBHsKuq8T0BT
         ge8QC19qZKi4p2+xDpXsOeKltTivxVPSB1tKqlTabmCjX02t7MD1BczqVjGdQicSCX0J
         72TDfGbIfyzLBEHV/Lh6pD6DTWk6VZABJctakhFQvQ6zO6f1wsVrBcFyQq18kvEKyiMY
         mWeVxBE0dhWHzl6C9jOnus0F4vcKxS+jD7f1SnqPxtFhkq0l/HehayBJ+OGETdOKBbFC
         q/qU0KsAatEGkF2k/U/fy/YuoK7Qq4NDV+Vo5KPAjjx+R38hpSN+ZOv3SumgScB+ayKm
         rDOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Us1eK0H8aR0J5hvB//0qiqdTuH6DvflWbWVLtHrmi0TncoPvAkaX8zYTVt/jdEdgktTDp2hPyVaQUOOp6VJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHhTKEq0ZbsuSrwQa30wDA2bCNl1HI+GbdXxK2vzHxNjak+6l
	mozNIUDMmx1YRwfwutI7SBoVX1pApARfHIbIHYtUAW0ZMWSNW/HnczFS
X-Gm-Gg: AeBDievpkA8HmgUZmc8nzsydwgDVSciAQBbzKbDEnTltKtHEEyaixJKq2vJrKB2MFJ5
	O4P/VQQZjCTxQ1aUMi0feS72s3y7Dr2m5e827m4RqmU7nslk+PfEyMDK2wM4LrqKvcgNwI8LpyW
	+JYbRXDbEsstOwK5ufSCu/KReoaQdmj4lncCkS9xF12IdsRHtClomByDzWCDrNjCLhWIsz9rDig
	cgkW/WujkQ84QDmW/DzcpY7FrviRiYRJNluhzIORehXX3jaXtNhG+EmfSU4SUAiShdy+LDR3t+t
	H/NYHNWFoqpxu/VjPsUp9WWf7fqFNjbYpYU53WLteWQ/ezDXuUMTae14eq2Eifb1zvSS5GHJcm+
	tU4PhAeOeF7rggwqTLerYBgCfuc23aI70KOvMg32nDDDdLmNUha50hTlMs30cvmraEL8FRsonuM
	C5O1FA0GtsBqFzkdprl7v+M37I9IhiHQ8pP6YOivwvfVulJNZkOqJGApQ1IF3X4RFIu4aLG/Zt2
	Q==
X-Received: by 2002:a05:600c:6304:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-48a77addb16mr46796805e9.2.1777379341448;
        Tue, 28 Apr 2026 05:29:01 -0700 (PDT)
Received: from localhost.localdomain (90-181-198-146.rco.o2.cz. [90.181.198.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77af1b86sm47479045e9.5.2026.04.28.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:29:00 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alban Crequy <alban.crequy@gmail.com>,
	Alban Crequy <albancrequy@microsoft.com>,
	Peter Xu <peterx@redhat.com>,
	Willy Tarreau <w@1wt.eu>,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Usama Arif <usama.arif@linux.dev>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v3 0/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Tue, 28 Apr 2026 14:28:24 +0200
Message-ID: <20260428122826.339550-1-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds two flags to process_vm_readv/writev:

- PROCESS_VM_PIDFD: refer to the remote process via PID file descriptor
  instead of PID.
- PROCESS_VM_NOWAIT: do not block on IO if the memory access causes a
  page fault.

v2: https://lore.kernel.org/lkml/20260408145436.843538-1-alban.crequy@gmail.com/
v1: https://lore.kernel.org/lkml/20251118132348.2415603-1-alban.crequy@gmail.com/
Sashiko review of v2: https://sashiko.dev/#/patchset/20260408145436.843538-1-alban.crequy@gmail.com

Changes since v2:
- Fix ERR_PTR handling for pidfd_get_task(): use IS_ERR()/PTR_ERR()
  for the pidfd path, matching process_madvise() (Usama Arif, Sashiko)
- Add selftest for invalid pidfd (David Hildenbrand)
- Add selftest for invalid pid
- Remove hardcoded __NR_pidfd_open fallback, use <sys/syscall.h> (Sashiko)
- SKIP pidfd tests on kernels without pidfd_open (ENOSYS) (Sashiko)
- SKIP userfaultfd tests when unprivileged userfaultfd is disabled (EPERM) (Sashiko)
- Fault in test_data before NOWAIT tests to ensure page is resident (Sashiko)
- Add ksft_process_vm_readv.sh wrapper and run_vmtests.sh entry
  so the test runs in CI
- Rebase onto v7.1-rc1

Not addressed:
- uffd handler timeout causing test hang: kselftest_harness forks each
  test with a 30-second timeout, so an infinite hang cannot occur (Sashiko)
- 64-bit process reading 32-bit process high addresses: pre-existing
  concern in the existing process_vm_readv code, not introduced by this
  patch (David Laight)

Alban Crequy (2):
  mm/process_vm_access: pidfd and nowait support for
    process_vm_readv/writev
  selftests/mm: add tests for process_vm_readv flags

 MAINTAINERS                                   |   1 +
 include/uapi/linux/process_vm.h               |   9 +
 mm/process_vm_access.c                        |  34 +-
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/ksft_process_vm_readv.sh     |   4 +
 tools/testing/selftests/mm/process_vm_readv.c | 421 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 7 files changed, 466 insertions(+), 9 deletions(-)
 create mode 100644 include/uapi/linux/process_vm.h
 create mode 100755 tools/testing/selftests/mm/ksft_process_vm_readv.sh
 create mode 100644 tools/testing/selftests/mm/process_vm_readv.c

-- 
2.45.0

