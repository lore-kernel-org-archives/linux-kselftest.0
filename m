Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BD431B101;
	Mon,  8 Jun 2026 10:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914756; cv=none; b=TET/XY4qTDkuJtxXHEUg5M7EihVKy+/KuFrypdIsk0T2PeUgdEfehX7EoYIoKvFUQYopa0RQdS0lG0+pq6vw7DZG6HDQ3Q9LIr/7EbpR97yyGkEl48z1hT0BAaUILTntd2zvOWk4clgrp962/4pRL/BDXbkq+HtJqe1ndDE3wU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914756; c=relaxed/simple;
	bh=BHohjbZbGokKxuhzeEPMqgB3NmgFH0MxP3ZLy7lt3zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgt0WvsE5Jzpl3Z9MLFVngNLXkCfEPPxR/HxrJ+PHaUlSZlMw76SwMSLhYUmIFSxJPeiBK/87OJwunLMrKSK+EUHythx526Q8lUI8e8w+ZuRhHDhtrEGJqsU37jNNDyDSU2pep8OxWneMFjGT/2GYXLSbOcfPrPzCsOw/eZ2yMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qEFmRZ4S; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qEFmRZ4S"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A493C1F91;
	Mon,  8 Jun 2026 03:32:29 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 865823F62B;
	Mon,  8 Jun 2026 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780914754; bh=BHohjbZbGokKxuhzeEPMqgB3NmgFH0MxP3ZLy7lt3zk=;
	h=From:To:Cc:Subject:Date:From;
	b=qEFmRZ4SNoZLJslFZ60m9VmaAf7ydO83aqFlsu4ciNX1guMKLtLq3b8iGahi/iSXX
	 RwOG0PBCpTG+P+pEhn8FP3i8tcUAfvTvWiAy+c0HVnUpX4X0KMmOY8Tlg9Bk3BqQvO
	 4uRErH4c0Gx9fCkhZ1X0SZL9vJI40WBFK+9zKN7o=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Mark Brown <broonie@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH] selftests/mm: fix ksft_process_madv.sh test category
Date: Mon,  8 Jun 2026 16:02:24 +0530
Message-ID: <20260608103224.344101-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ksft_process_madv.sh currently runs run_vmtests.sh with the
mmap category. Update it to run the process_madv category,
since ksft_mmap.sh already runs the mmap category tests.

This avoids running mmap tests twice and ensures that process_madv
tests are run through the kselftest harness.

Fixes: 6ce964c02f1c ("selftests/mm: have the harness run each test category separately")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/ksft_process_madv.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/ksft_process_madv.sh b/tools/testing/selftests/mm/ksft_process_madv.sh
index 2c3137ae8bc8..edad2d2d888f 100755
--- a/tools/testing/selftests/mm/ksft_process_madv.sh
+++ b/tools/testing/selftests/mm/ksft_process_madv.sh
@@ -1,4 +1,4 @@
 #!/bin/sh -e
 # SPDX-License-Identifier: GPL-2.0
 
-./run_vmtests.sh -t mmap
+./run_vmtests.sh -t process_madv
-- 
2.39.5

