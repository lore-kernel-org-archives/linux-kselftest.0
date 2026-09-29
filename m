Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F87E50B8D9;
	Tue, 29 Sep 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678049; cv=none; b=KHxF+WeVGDiUeKSZOGeZDWwr1TL4DxVSo+yOmsvP7i3SgdmdMC7eMwMl/NEDu/OReL1gIyS8XWbK2WXofMSJKOpoGhdNW0jwxXZkhspAz/VG+yQKf+GXgy9EXFEhGoLhtRXnaBogGhoSca9Q1iS/kVmmfhKUj+LW0JxeIK4+m7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678049; c=relaxed/simple;
	bh=WSTvNRWQyuaddIQjTCFjPpl7RHLGjlTjbhV5ffZ1XtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdXS68p6ZMDx0OWybuvtKAgdb+W6Vtv5L8qnRpzLjovtgzEAXegFZPPfsKqkDPFYB1LZXkPEuatepZFd/6YvhEv2r81VOsrQujzs08WicT40fpARC9DJGMYLTp1ngiAPRkC/0ItW8zjoRqpT6S+e1GB0j6Ff7fVXDCC5ae4ZIxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uwm464og; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uwm464og"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F3631595;
	Tue, 29 Sep 2026 03:33:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC3353F86F;
	Tue, 29 Sep 2026 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790678031; bh=WSTvNRWQyuaddIQjTCFjPpl7RHLGjlTjbhV5ffZ1XtQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uwm464ogtKMndLYwzgIDwjup1cl9OhVkcWS/AV/r4tMFqkVcQKYYsK1JLHE62Nfga
	 woVvJ2SuDQMbqrmGlOj2aZG3uNEHXdYIf1jUKHXwFg6x8UN5wMlllz3YIdwD343+z+
	 51hvEFcT09Mrc6l1DEtzV3l5CyFzIpWNDlmose+0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 29 Sep 2026 11:33:18 +0100
Subject: [PATCH v4 1/2] kselftest: mm: return fail when child test result
 is fail in khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-fix_khugepagd_fail-v4-1-2169c18f2576@arm.com>
References: <20260929-fix_khugepagd_fail-v4-0-2169c18f2576@arm.com>
In-Reply-To: <20260929-fix_khugepagd_fail-v4-0-2169c18f2576@arm.com>
To: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 "Gregory Price (Meta)" <gourry@gourry.net>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3582; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=WSTvNRWQyuaddIQjTCFjPpl7RHLGjlTjbhV5ffZ1XtQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu5QHB2PFMwVWosw3cvFc7rbAWFvMN8pv0sQXO
 w6V5S2hzeOJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaruUBwAKCRBt1cPRWsUx
 M3uHDADQCD6tIH0Z1Qgk9WT4zJ+C8dK/TsckskhZrs5M525zQlBloSYPjeLtgbwzVZhSTsJkkFq
 /7XMO4L8EDiD77HjkDh4uylcHX8FvUI/FaUEM0uSxy/gFSY5c1Yt4vlD5Ur+NfvB3dNCQx04lwq
 FiLHZJM7c7gGlHzfO2OiLqg3H/JCKnM0VazHdgQlzD+gURWnkN8WJpfB9ICokm7VEhv4mqHu2A8
 4JKVv47iplg5rSSWVsvaEge0nYJO+U6OeQFH+bHcCT/Ho11kbml4qO5yeSn3jJqAWhoXJ3M6hp7
 C0ReJ7U37THHBz/njC2BPdmvzJiz3ArcMqeelkq2OdT/Ug18Ku5G1lA9WyEIzefWPBKhBfq28/F
 bNDeVtOm+K4/bfnUqzQsSEHurFe0xwPC03opCvnW7uk356r5R5bnc37X6Dm9hOssfJGUOyFJAjr
 b6lwT3py/C3fZPEJ+rEnufp9TtH7Es6ovmFJoPKQynNnARZScdQ5JhMkBxRaeCd1Iykxc=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Although the child process in collapse_fork*() or collapse_max_ptes_shared()
reports `KSFT_FAIL`, the result is ignored because the test only checks
whether the parent’s page was collapsed into a huge page.

As a result, the test is considered successful whenever the parent’s page
is a huge page, even if the child test fails, as shown below:

  #
  # Run test: collapse_max_ptes_shared (khugepaged:anon)
  # Allocate huge page... OK
  # Share huge page over fork()... OK
  # Trigger CoW on page 1023 of 2048... OK
  # Maybe collapse with max_ptes_shared exceeded.... OK
  # Trigger CoW on page 1024 of 2048... Fail
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 23)
  # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0  // child failed.
  # Check if parent still has huge page... OK              // parent hpage success
  ok 24 collapse_max_ptes_shared                           // considered as success
  ...
  # Totals: pass:26 fail:0 xfail:0 xpass:0 skip:0 error:0

To address this, propagate the child’s failure and skip the subsequent
check in the parent.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/khugepaged.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index a2ac3b3ca5de..2aa7c9197158 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1053,6 +1053,8 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 
 	wait(&wstatus);
 	exit_status = WEXITSTATUS(wstatus);
+	if (exit_status == KSFT_FAIL)
+		goto out;
 
 	ksft_print_msg("Check if parent still has small page...");
 	if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
@@ -1060,6 +1062,7 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 	else
 		fail("Fail");
 	validate_memory(p, 0, page_size);
+out:
 	ops->cleanup_area(p, hpage_pmd_size);
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
@@ -1100,6 +1103,8 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 
 	wait(&wstatus);
 	exit_status = WEXITSTATUS(wstatus);
+	if (exit_status == KSFT_FAIL)
+		goto out;
 
 	ksft_print_msg("Check if parent still has huge page...");
 	if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
@@ -1107,6 +1112,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 	else
 		fail("Fail");
 	validate_memory(p, 0, hpage_pmd_size);
+out:
 	ops->cleanup_area(p, hpage_pmd_size);
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
@@ -1158,6 +1164,8 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 
 	wait(&wstatus);
 	exit_status = WEXITSTATUS(wstatus);
+	if (exit_status == KSFT_FAIL)
+		goto out;
 
 	ksft_print_msg("Check if parent still has huge page...");
 	if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
@@ -1165,6 +1173,7 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 	else
 		fail("Fail");
 	validate_memory(p, 0, hpage_pmd_size);
+out:
 	ops->cleanup_area(p, hpage_pmd_size);
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }

-- 
2.43.0

