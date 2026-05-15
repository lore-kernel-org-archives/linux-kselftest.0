Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7763539B94F
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855651; cv=none; b=IAXVHs91xxYkFAxfCqYoFRiu7DsM3Mnhbfp+veEuSINfv96VUnO6Krm8bDYjpGRPXm1UYnGWmvoENMo1zDQYzlJvumzZaOUnJFs3XBt6EfR/5Wgp14dyiQL/PUYuoIP3aq6rX0AM2icrncWmtQqoE6UtXjGgdBaNfVNhKoO6yfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855651; c=relaxed/simple;
	bh=dGe165LlDhGxbf+f51V7B9eH/680RgMjD+HVgtewrrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6TdYyilyFaF8APa2+l2c15l2O4q1HGgnAGqTcNhINMyuanCRAr8kuDXvri0xgeusXvVz3RUo0mJMSZMqFFozpruglf0UYwerIp36aXfGs2tNiMlw0COr7T4B+QSEe1DzmQrUpil5Zy8YTrFT8IWTI+ZlN1glK69niftMBQDM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUIR3ihh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUIR3ihh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe608cb92so5836964f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778855649; x=1779460449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CP8Tr7a6FXYhK3WWrIhZ9hJMiS8gxETtFl9vBtd1V4k=;
        b=rUIR3ihhAekF/RKPprFUB33IKYbh+NZn3Glm2Qf+wIm9Ox8p+29u9AQutlWb/sOjAW
         izDXnk1UuUhkztIhs5srGvjaR87UHS7nBiUPLm9W2s+F8zeZ87GwBXovI+wQtAhf40pK
         uuwqgoVtMnDTnrX9T3gn0odC75UoVWircZoOxUPzCI5N3tGoUn0rI+QsQ7JBjqWqHb8e
         uGOmC2VCOIRm8NO8x4mftTdgHEw0UD2d3QrWotTquelC0l9lnBh6LCJDWbceN8e3ZTVj
         GU+1MelBE1ZVVJSki3QYY52nNTOovPTsykuicHrhFSMNt/k4nKcoS5TK/zPR0tpIm0ad
         9Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855649; x=1779460449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP8Tr7a6FXYhK3WWrIhZ9hJMiS8gxETtFl9vBtd1V4k=;
        b=MUac4GXt2LgtuGRbFtJgRf4uTTreP4wZs9UEW/X4DT62QQXdRVgWZnCk9M+nmHO6QY
         icDdOF2fop9Ry66k0PZn6N8wJCW68BwS21hLPc559BdN3137/jjfmN6nWK8tQ4LmgK/e
         OO2PokbF6N/vNyOKwz93vKNQDHgeajIhZNcd3ArVy3B8hRqbgIPIebNs6TrTaXfhM0lV
         KTpdYIVtj70N0QWS/Bcgl+r/3HeUgHU2Wwm99Dr/HRiGWrHDZl0FFV7AUpeFsnCgy5Z6
         I1Wp5iu6Nf7yl5tjfGMXKYwcJaK3Z80Sgrt4IMrYVoigh1tdD03IUcRGByIfMqvg5LpA
         nurQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hhULBmR0/+0P/+Akj5kg9QZLmio3GK5+49AZxBoP/4+Tj3o1N6DJ/UQepryXuL7TgkvNLbajLkRRrwzkHFJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUKzycNrOtc+VbXxUtNqqQpnlcCJ+XFWnOd1sGx64IrvNj77f1
	d3puUYGo5zJPBMNwNqEaYdmMk+QoBUI/3LFqkXgXCSFrEY4yGQ3+7obn
X-Gm-Gg: Acq92OEOOUSlapfnuDE+8NznPC+ToHqStkRI+f8vmUAxa/L1emca9/NMwvVst4HM1bM
	aySKxZcW4MF9G4yFkJGxHORhCG2ibzw7ruMHOW9yXPjw7tMX2LtP0LBlF1mmkcz4s9RjMIBbkcc
	fN1WQietuhGQXQTAMn4lISaAQXJa7PHBNbn8HAm+lg+csz8ENp+NTYegLdw2nFJANuOVmiTQDaa
	CRIqDFB+lidPW+HP8GCUf4gfvE5H4S8ExYGI587t+MGeCuwQJgJHm6PtKYXt2RZUiHISRlyUw86
	/i/BcRF2ApCZhiSs6A8OwvfQk1GnBNanEURRdaqhiFcVKK224po67GYYXWYQcctHZQsePSOwkO+
	r/Wt5O6brQH72njBJ9EggBPnSa+iH1rWJ80uGzCocVulhMqSpmjcvJXpMfriTt0R0X6cV9vFNo3
	1UOxEA/jBjvYYO8sWvt61cIyFr
X-Received: by 2002:a05:6000:290f:b0:45a:1b61:9f9a with SMTP id ffacd0b85a97d-45e5c57d2e6mr5872473f8f.1.1778855648499;
        Fri, 15 May 2026 07:34:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::bc35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d16sm15773464f8f.6.2026.05.15.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:34:07 -0700 (PDT)
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
Subject: [PATCH v4 0/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Fri, 15 May 2026 16:33:33 +0200
Message-ID: <20260515143335.739511-1-alban.crequy@gmail.com>
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

v3: https://lore.kernel.org/lkml/20260428122826.339550-1-alban.crequy@gmail.com/
v2: https://lore.kernel.org/lkml/20260408145436.843538-1-alban.crequy@gmail.com/
v1: https://lore.kernel.org/lkml/20251118132348.2415603-1-alban.crequy@gmail.com/
Sashiko review of v3: https://sashiko.dev/#/patchset/20260428122826.339550-1-alban.crequy@gmail.com
Sashiko review of v2: https://sashiko.dev/#/patchset/20260408145436.843538-1-alban.crequy@gmail.com

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
- uffd handler timeout causing test hang: kselftest_harness forks each
  test with a 30-second timeout, so an infinite hang cannot occur (Sashiko)
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
- volatile uint64_t cast on uint8_t test_data for page fault-in:
  alignment is not a concern in userspace programs (Sashiko)

Alban Crequy (2):
  mm/process_vm_access: pidfd and nowait support for
    process_vm_readv/writev
  selftests/mm: add tests for process_vm_readv flags

 MAINTAINERS                                   |   1 +
 include/uapi/linux/process_vm_access.h        |   9 +
 mm/process_vm_access.c                        |  34 +-
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/ksft_process_vm_readv.sh     |   4 +
 tools/testing/selftests/mm/process_vm_readv.c | 573 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 7 files changed, 618 insertions(+), 9 deletions(-)
 create mode 100644 include/uapi/linux/process_vm_access.h
 create mode 100755 tools/testing/selftests/mm/ksft_process_vm_readv.sh
 create mode 100644 tools/testing/selftests/mm/process_vm_readv.c

-- 
2.45.0

