Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9494745628F
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074840; cv=none; b=W0rsyV9iMew2RZ1NQKpuv84zklfUPvE7gYHQdrI4o3MPXSJbmxGhBf+7cTSjyVnzZtmghWfrV4gfqltAYBbc9aB3lpMuOh3VdlFsHlJ+knud7S+NgBdyn/4ZOsMGdZycR6guCEisJTAYg6MpKSZ28a7j87kitLenRfDFcEdq0gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074840; c=relaxed/simple;
	bh=7kF2ZLd5xnjPr3uj8LRikUsTpF/3ktf/GA8q0jXo8Ns=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QqlQlolTl2GQMccNHSXleK7tQRkdWd26jIRJMj2xZ37+4adpQAyHuQy2VtJuM2Tv3WS0wgMSsHCNc0+i1FwK9eLBLW0degetol5ywLXLqOV8+07AMkcdT3QBuutBwH/JnDq2q7Fo8h/VfufT9qK7JFoW4mGG2OviXhaJ4S6Jw78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EaG8uaxD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EaG8uaxD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC1491576;
	Tue, 22 Sep 2026 04:00:30 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE1423F632;
	Tue, 22 Sep 2026 04:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790074834; bh=7kF2ZLd5xnjPr3uj8LRikUsTpF/3ktf/GA8q0jXo8Ns=;
	h=From:To:Cc:Subject:Date:From;
	b=EaG8uaxDBEz3fqXa4znd9kUOM0Mk27eYi5Z1lSJwxludkr8fTVzQtdkHvMsN/MGBQ
	 mvfwGII/uK+MzpsO4aUjBBomCumKwq6Q3TkMnd/gwV79WfrCaxANUJpD1Jqg7UojZz
	 XV+GDc0ZlMZrlUFBGKDgcjzGH/AA/Y3DB9iKF+9U=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-kselftest@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org,
	broonie@kernel.org,
	usama.anjum@arm.com,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [PATCH 0/2] kselftest: Make MTE memory access robust
Date: Tue, 22 Sep 2026 11:59:57 +0100
Message-Id: <20260922105959.129380-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently MTE selftests assume that they can skip (expected) MTE
faults by advancing the PC by 4 in mte_default_handler(), but this is
not generally safe, as the faults are triggered from arbitrary library
functions (e.g. memset() and memcpy()). For instance, memset() could
be implemented as simple as:

      mov   x3, x0       // copy pointer
      add   x4, x0, x2   // calculate end
    loop:
      strb  w1, [x3], #1 // faulting access
      cmp   x3, x4
      b.ne  loop
      ret

which leads to an infinite loop since X3 could not be updated.

Or, it could be having advanced implementation (FEAT_MOPS):

      mov   x3, x0         // copy pointer
      setp  [x3]!, x2!, x1 // prologue
      setm  [x3]!, x2!, x1 // main
      sete  [x3]!, x2!, x1 // epilogue
      ret

with faulting access at prologue advancing PC to main could lead to
infinite loop due to main could be triggering unaligned access fault
which kernel fixing up by advancing PC back to prologue.

Address this by introducing memory access helpers with predictable
behavior, allowing faults to be safely handled, and switch the MTE
selftests over to them.

Vladimir Murzin (2):
  kselftest/arm64/mte: Introduce MTE safe memory accessors
  kselftest/arm64/mte: Use MTE safe memory accessors

 .../selftests/arm64/mte/check_buffer_fill.c   | 10 ++---
 .../selftests/arm64/mte/check_child_memory.c  |  6 +--
 .../arm64/mte/check_hugetlb_options.c         |  4 +-
 .../selftests/arm64/mte/check_mmap_options.c  | 10 ++---
 .../arm64/mte/check_tags_inclusion.c          |  4 +-
 .../selftests/arm64/mte/mte_common_util.h     |  4 ++
 .../testing/selftests/arm64/mte/mte_helper.S  | 44 +++++++++++++++++++
 7 files changed, 65 insertions(+), 17 deletions(-)

-- 
2.34.1

