Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC68A3CEB9E
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394995; cv=none; b=TGFNiPdjchPAxm/J/UiTn9+6YKH6oC7EeQWh3nngnEtvYFP+o5lexTckJhZD7wumYvRh0vavHwMpxKJ6UHli1uOty2zw71cBUjeeBziLYalo18N5bd43hKeflAouCTBvaxcDmH1KQLhrTIW16xRrZTKO+LBZlyakCBwxg1r7sFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394995; c=relaxed/simple;
	bh=GdEPdC8O6mnioehfbWdEulDzTJWl+wOu+nz32bJ1yZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxbVsDiIHLWX2JvW9Kd6h5rjSBWSIGwtQFggbeDAwenTkYQCyTExB5710GMdFPOb/c5QhWnsbckAlx6Zlcbx8uGRr3Z1KgaWnMptdoGYs7JE7JMcc5FIaBPXsSjSn6Do31LZzh5NSUj+RUdPK5RBT2gxlKGCdSj9DBiiFCZmYbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkmpkoR/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkmpkoR/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fe59255beso1342351f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780394992; x=1780999792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hLX9Bb+0vsl3gqtKqEOJsR8jG1pZJXh/fm/ACRLNz4I=;
        b=qkmpkoR/cfnzoUU4RWowuNZiUOZaNVdURr6Lj+b2XoOFVBytfV33vGqappvl2kV73W
         jpbB0jH2zUXRNlbGyAV3RTwgfDAatRbMW4v/gm3y4SbrCX/SZ+pDkchX9MBEQA5ptWhO
         Pxy4IPqvl1ecuOHmYvnn7/iARZITwhYrWP+rssfUAdf2+uKDkOAmzsOLsic81rJedv8c
         iHtKmAL4mCIPWWpto7l6sl6mI7v6Ag+cI5S5TcN07Dt2UC1Sujqh9lsJErkBIt5AX2g7
         c+t5nXoBSIwk5TewclUfAgn5xkfJ7p5t3csWJIi1DyRG3TnKksbWZ8T3vZrgEvd4piAZ
         s9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394992; x=1780999792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLX9Bb+0vsl3gqtKqEOJsR8jG1pZJXh/fm/ACRLNz4I=;
        b=i5f3FXr0xTtPOGXQu5L8JZZYTWYj9IzAu9VzUVpLhAlr+GiHiPxNW769BT4t272s/l
         MzNDJo5E23hUbXO92gDUWcf163/WkVLIA9vxSMQva4E9R5bacGHS8t5NEKqobzNUO6Xr
         MsACISuDUeTP8P6aivDWbZnDy2EgyPTP3BaFtauQm62FJShoJ+GPI5IBSIm57ltai+6B
         AKBRCR1zknC8ggjyk9vMYDE4serixQ1fypC/6RKFzwjXn2xuJvsMzJVILghiuazQrDa8
         hm63YJpPhJ9EhJ5TmMMvGKeDkBmeAZYNiEKIQDkck/qlj+k3o4fFhQLR+eJBm8hPwwKY
         XIuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Nqcdv/yGPWE6/hi9WEhZqs6/8uvS6G9Td2NQfVzP2vlXEEKr5pGmS4hR+VCoGaIZgETW2pZNm7iOEXQWi1GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygC2Srs7OnaPr4OVEdPyQgpPNrT9Uj8PbFiOWQrZ1m/gBr6B3q
	7rO2j3JMVlanQSiJalheyQohcnwuB89/ud/eS/8Q+bbmexUZ1oPGHu+1
X-Gm-Gg: Acq92OEC9Fj4lQo7eYkq5mk3KI1+Gm9py//KCs1QtEKJ3y++Qj7InnlpIN+wORwK+p6
	NDCggfq/N+LywT2upPFrOyVEJe5b6qiW9yKvc/6mQoVQlPA6oHFmYC23Hy+YLK2d/Vk+FB5JaWM
	W0TM7z2oxolFiUYTQGd/a8YBEcFLCmf07XweFfQmjrVzErK4BiHYTrXFwktGhaR9tkpRfGXKBFt
	HqazJQ7XnLDav/zVz0ejx3q9jkHMIrgnO/bob1ZHMOYOqg+xkUjxv2aD5GsrkmMWpnz/m5qRTRD
	ly6xH7P8gNdaub0nDMd1iJxcJmq4gx8SDBCW1e18gS6rwzeLqXVcq57rtkk7IXHAsqa9Eztot+0
	R/16NyuMVuvF1xEq+6DbxiiRpFqoq+8eH6HiHS8qEfvXFR+Nvt2Y+LFOA0LTxHcn15VhcAP1hJu
	6dPx8UE6Z0lD/A5wtMP4BhacmmwO7goR7+FLigfLqdMZPSHg==
X-Received: by 2002:a05:6000:25f6:b0:45e:fb69:f02b with SMTP id ffacd0b85a97d-45efb69f3afmr21424039f8f.1.1780394992164;
        Tue, 02 Jun 2026 03:09:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::d167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd87sm30636722f8f.24.2026.06.02.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:09:51 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
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
Subject: [PATCH v5 0/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Tue,  2 Jun 2026 12:09:15 +0200
Message-ID: <20260602100917.3641359-1-alban.crequy@gmail.com>
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

v4: https://lore.kernel.org/lkml/20260515143335.739511-1-alban.crequy@gmail.com/
v3: https://lore.kernel.org/lkml/20260428122826.339550-1-alban.crequy@gmail.com/
v2: https://lore.kernel.org/lkml/20260408145436.843538-1-alban.crequy@gmail.com/
v1: https://lore.kernel.org/lkml/20251118132348.2415603-1-alban.crequy@gmail.com/
Sashiko review of v4: https://sashiko.dev/#/patchset/20260515143335.739511-1-alban.crequy@gmail.com
Sashiko review of v3: https://sashiko.dev/#/patchset/20260428122826.339550-1-alban.crequy@gmail.com
Sashiko review of v2: https://sashiko.dev/#/patchset/20260408145436.843538-1-alban.crequy@gmail.com

Related man-pages fix (corrects pre-existing partial transfer documentation,
not the new flags proposed here):
https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=a0b1df86b0c951beb896d468f200be7fd44631e3

Changes since v4:
- Add process_vm_readv to .gitignore (Sashiko)
- Use ~0UL instead of 255 for invalid flags tests (Sashiko)
- Use volatile uint8_t instead of volatile uint64_t for page fault-in
  to avoid alignment issues on strict-alignment architectures (Sashiko)
- Use UFFDIO_UNREGISTER in uffd handler error path to safely unblock
  the main thread without double-close (Sashiko)
- Rebase onto v7.1-rc6

Changes since v3:
- Rename include/uapi/linux/process_vm.h to process_vm_access.h to
  match mm/process_vm_access.c (David Hildenbrand)
- Fix MAINTAINERS alphabetical sort order (David Hildenbrand)
- Document NOWAIT return value in commit message (David Hildenbrand)
- Document PIDFD EBADF error in commit message (David Hildenbrand)
- Add suggested man page update text in commit message
  (David Hildenbrand, Christian Brauner, Mike Rapoport)
- Keep (1UL << N) in UAPI header: BIT() is defined in vdso/bits.h
  which is not exported to userspace (David Hildenbrand)
- Add selftests for NOWAIT partial reads across resident and
  non-resident pages (single iovec and two iovecs)
- SKIP tests gracefully on kernels without flag support (Sashiko)
- Verify content of partial reads in selftests
- Rebase onto v7.1-rc3

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
- 64-bit process reading 32-bit process high addresses: pre-existing
  concern in the existing process_vm_readv code, not introduced by this
  patch (David Laight)
- EAGAIN instead of short read/EFAULT for non-resident pages: short-read
  semantics are more informative and consistent with O_NONBLOCK
  conventions; the profiler use case does not intend to retry (Sashiko)
- mmap_read_trylock with NOWAIT: would expand scope significantly and is
  not how other FOLL_NOWAIT users in the kernel work (Sashiko)
- GFP_NOWAIT for page array allocation: the allocation is small and
  rarely blocks; not on the data path (Sashiko)

Alban Crequy (2):
  mm/process_vm_access: pidfd and nowait support for
    process_vm_readv/writev
  selftests/mm: add tests for process_vm_readv flags

 MAINTAINERS                                   |   1 +
 include/uapi/linux/process_vm_access.h        |   9 +
 mm/process_vm_access.c                        |  34 +-
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/ksft_process_vm_readv.sh     |   4 +
 tools/testing/selftests/mm/process_vm_readv.c | 591 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 8 files changed, 637 insertions(+), 9 deletions(-)
 create mode 100644 include/uapi/linux/process_vm_access.h
 create mode 100755 tools/testing/selftests/mm/ksft_process_vm_readv.sh
 create mode 100644 tools/testing/selftests/mm/process_vm_readv.c

-- 
2.45.0

