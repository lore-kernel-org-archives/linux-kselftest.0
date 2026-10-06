Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529363B2D38;
	Tue,  6 Oct 2026 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278751; cv=none; b=RNgoYEqU0+R9zUYey6saeyQYaMegIxwRk47Tn/I8FD8YHwbP3BPIvE7zTX4txjD8SJnfEoqtIEMNPp861NhY8gNrz8hNFSBBgA+T3S0/Js604QWAJU1wVl+930n/wTBGLN0RgQd6rmXROuYen1xeqYKNNdJVJ9jRYVxtMvBrkt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278751; c=relaxed/simple;
	bh=OolFXI5b6+V9IEt20PEAQ7kIeCNm1VJ/qc/YBSWvXiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRaJoQj77W/dYqNu2XmNi1b0HI7zi6gbd0pV1FUw4PmWcReZg1P9nfa8sj+Cu+mReSFjK6uZN1FifyE8XKWcTtmpx4vFQeebfe2oyWMOh01LBwQ0T8dcBc/kpY4cccupWteTeqvXICxkhYcRWdTzAqW+waix1CtULMiw4Y1UBSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EDh2KI2S; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EDh2KI2S"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 391D01477;
	Tue,  6 Oct 2026 02:25:46 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D22D3F763;
	Tue,  6 Oct 2026 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278749; bh=OolFXI5b6+V9IEt20PEAQ7kIeCNm1VJ/qc/YBSWvXiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EDh2KI2SzR/LKPdePGNyU26dIpRXbMZWkA6BKKpmjHL4USo1QLLvzerD7DrJ83McK
	 8F8EYKnHqrkAPqnuFr52pd8p4rEG8FkELCcrNQcvBZQYxcYQK9Pm40w01kAdncQps/
	 qH0mWl9UgE1dcOxT134lR+ONDnZ/0ZDK1ZdVTHR4=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	jhubbard@nvidia.com,
	kaleshsingh@google.com,
	anshuman.khandual@arm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v2 05/12] selftests/mm: mremap_test: skip test when userfaultfd is unavailable
Date: Tue,  6 Oct 2026 14:55:04 +0530
Message-ID: <20261006092511.145776-6-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006092511.145776-1-sarthak.sharma@arm.com>
References: <20261006092511.145776-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The userfaultfd syscall can return ENOSYS even when __NR_userfaultfd is
defined by the architecture headers, for example when the kernel is
built without CONFIG_USERFAULTFD. The test currently skips for EPERM
when the caller lacks permission to use userfaultfd but treats
ENOSYS as a failure.

Handle ENOSYS like EPERM and skip the mremap_move_multi_invalid_vmas()
test when userfaultfd syscall is not implemented.

Fixes: 742d3663a577 ("selftests/mm: add test for invalid multi VMA operations")
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index e17edbc23325..0be47348ecd0 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -711,7 +711,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 
 	uffd = syscall(__NR_userfaultfd, O_NONBLOCK);
 	if (uffd == -1) {
-		if (errno == EPERM) {
+		if (errno == EPERM || errno == ENOSYS) {
 			ksft_test_result_skip("%s - missing uffd\n", test_name);
 			return;
 		}
-- 
2.53.0

