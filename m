Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB9D355F47;
	Thu, 24 Sep 2026 05:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226024; cv=none; b=bWkIZYu3dLui+iY5H1L0M3Cs+ql9slzPkKekhWQ38qRww5G0IxwgUqZcqTAkrdPK4NJXtWMm/N81V8PHKQtVmNIIXvto86iqxjY2XuMzEwSwITYZfOoxKaLtQjAs1iqx9bwSkNamTz8/VHSrgjnxhkqaial6tcMEv3KMlRKcCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226024; c=relaxed/simple;
	bh=tPX67aEPDEd7r2wDN9ioKFl2JR/762YH2SOtC7CbixY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFFli2NjdfLeQXemYLHm1+YrgRymf3Cqwn0WhcVJVdoRS7YyjKh+6pFAAsh+uPu3OYgoSzKvCc0VZv57Av/Ir5nRaj6uUp1A0MxLKVw2/ziBY/oTv57ITKWWaQOQ7s+m2TMv8hh45STE8lygFvPeGhm/acUa6iUlHtjNU//57Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KZ9h2msH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KZ9h2msH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 155201476;
	Wed, 23 Sep 2026 22:00:18 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0788D3F86C;
	Wed, 23 Sep 2026 22:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790226021; bh=tPX67aEPDEd7r2wDN9ioKFl2JR/762YH2SOtC7CbixY=;
	h=From:To:Cc:Subject:Date:From;
	b=KZ9h2msHFsblo3XmZ56AhcpauP3bjVNkKTEaa44vuMnD6DfHbc4cKP5fXAhq+NQF9
	 bt4FIAKOteDcjVkDrsQhMxuS47AC8Cer1r6EdBfg2fOWtD2QTp1uHQwtIbrdVcH+Pz
	 tXRpPf2BI/D2QBTCHeiGrh+OW0tj0DGKjKx3+2Mc=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Park Tae-sun <ts930@dgu.ac.kr>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH RESEND 0/9] selftests/mm: improve mremap_test
Date: Thu, 24 Sep 2026 10:30:00 +0530
Message-ID: <20260924050009.19974-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several correctness issues in mremap_test and
simplifies and strengthens its data validation.

Patch 1 converts the mremap_test to use kselftest helpers, removes
manual tracking of failed tests and corrects some spelling errors.

Patches 2 to 5 fix userfaultfd skipping, unexpected mremap success
handling, multi-VMA data validation and failure reporting when data
corruption is detected.

Patch 6 removes the randomization and uses a simple pattern based approach.

Patch 7 removes perf tests and timing infrastructure.

Patch 8 removes validation threshold and always validates complete mappings.

Patch 9 strengthens the multi VMA validation by also checking the
mapping state of holes after remapping.

---
Sarthak Sharma (9):
  selftests/mm: mremap_test: use kselftest helpers
  selftests/mm: mremap_test: skip test when userfaultfd is unavailable
  selftests/mm: mremap_test: fail unexpected mremap successes
  selftests/mm: mremap_test: correct multiple VMA range size
  selftests/mm: mremap_test: fail on data corruption
  selftests/mm: mremap_test: replace random data with deterministic
    pattern
  selftests/mm: mremap_test: remove perf tests and timing
  selftests/mm: mremap_test: remove validation threshold
  selftests/mm: mremap_test: strengthen multi VMA validation

 tools/testing/selftests/mm/mremap_test.c | 600 +++++++++--------------
 1 file changed, 220 insertions(+), 380 deletions(-)

-- 
2.53.0

