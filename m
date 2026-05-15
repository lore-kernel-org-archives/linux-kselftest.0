Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F953B19A1;
	Fri, 15 May 2026 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834939; cv=none; b=QM3omm5S2MWhTlRd2++BMYBlNXRM3MI4qiZ1jE1AqKfe3EZJJK/EYklSf+WnlBD4eujHTtWAdXTKXpP1qofbrxxEZBReMMxS/tgU45u3nj/NXjWgLPSXt5kr/XNPmosTmGEmUtUWOXLmOaGGCT65jX3wXaKHeye44U3Fl3k316A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834939; c=relaxed/simple;
	bh=RTcF/U1Y6oPMyTlW+ZZLgcOOyaQjN+u//4XIQ6K34CA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bvktKJO25ijpCdsqsnLMctL3BdOFbjTRukqNPDUQLIdQEcDzig+4cZAaDE6V4JXECydC/OuqqByzx4KQ/ycFytwTniQd4Zx3a3hVfm2EYQ/srKLQICsIStMChl67vmpvDNYjJlZ9R9olb0bw1mB7wHuAtjxzp39HCHiVMcr+4B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OmiQSeHT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OmiQSeHT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E77F22FC;
	Fri, 15 May 2026 01:48:49 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F42343F7B4;
	Fri, 15 May 2026 01:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778834934; bh=RTcF/U1Y6oPMyTlW+ZZLgcOOyaQjN+u//4XIQ6K34CA=;
	h=From:To:Cc:Subject:Date:From;
	b=OmiQSeHTvLPuSauwrwISTdCnc5In9VBNO9NrxaUkG432UuGauw2O2R0ebPuHl/HfU
	 tyxNGWuK4jzDgGEK/k+h8U+bNBPTCmjA8cOzipcGg0/FZVuzTdov6iNm7aiC0SdECp
	 sNc7l02WggEELdYDQNIsgiSavjHAnFfmdNJtUZu8=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH 0/2] selftests/mm: separate GUP benchmarking from functional testing
Date: Fri, 15 May 2026 14:18:38 +0530
Message-ID: <20260515084840.174652-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gup_test.c currently serves two distinct purposes: microbenchmarking 
(GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK, PIN_LONGTERM_BENCHMARK) and 
functional correctness testing (GUP_BASIC_TEST, PIN_BASIC_TEST, 
DUMP_USER_PAGES_TEST). Mixing these in a single binary means functional 
tests cannot be run or reported individually, and run_vmtests.sh has to 
invoke the binary multiple times with different flag combinations to cover 
all configurations.

Patch 1 adds tools/mm/gup_bench, a standalone benchmark tool that does
not depend on the kselftest infrastructure and can be used independently
of the selftest suite.

Patch 2 rewrites gup_test.c using kselftest_harness to produce clean
TAP output with per-variant test reporting, and simplifies run_vmtests.sh
to a single unconditional invocation of ./gup_test.

---
These patches apply on top of mm/mm-new.


Sarthak Sharma (2):
  tools/mm: add a standalone GUP microbenchmark
  selftests/mm: rewrite gup_test as a standalone harness-based selftest

 MAINTAINERS                               |   1 +
 tools/mm/.gitignore                       |   2 +
 tools/mm/Makefile                         |   6 +-
 tools/mm/gup_bench.c                      | 491 ++++++++++++++++++++++
 tools/testing/selftests/mm/gup_test.c     | 404 ++++++++----------
 tools/testing/selftests/mm/run_vmtests.sh |  37 +-
 6 files changed, 679 insertions(+), 262 deletions(-)
 create mode 100644 tools/mm/gup_bench.c


base-commit: 2c3f468717231305523ddcd94d91c0d5e4a72419
-- 
2.39.5

