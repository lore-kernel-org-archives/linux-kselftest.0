Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF762472F66;
	Tue, 15 Sep 2026 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464119; cv=none; b=r2iJlRD+r4kJ4HipfnpaM3kpk21JgLP6JrnxqykCDQ/p8DKfVF+DDW6CeLfRQJAjk5B6vCWD49AIqdXE14IrSo8ZResWZvM3JDJ+8TmKSUdXI8Mg/ASKWo1hZqhLs9nUU6KgT6NREQilI52J4KhmmIs/+DODYS3jgv/Tspwh7wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464119; c=relaxed/simple;
	bh=yxQR2EiRSnlOGVI9wDjEBOU2jCM7zzSGFANR8dJ9rAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WymIqiFVfL1TD2lfSWgWQQgEbFmmcRIrolmt3sVu5JTM9JQ94utRDkn/aoAj79F51azci9SidT1JGljNzr3PJAKd7aDfzfraQt2+slAg18AfGba4CDEQDVF5QkMEXe+OJ684MlznhS3z6Bo0gIbW1w4bzPqr1sQUVAYDAsfbo8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J+kAJGL2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J+kAJGL2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9B1716F3;
	Tue, 15 Sep 2026 02:21:52 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52A473F86F;
	Tue, 15 Sep 2026 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789464116; bh=yxQR2EiRSnlOGVI9wDjEBOU2jCM7zzSGFANR8dJ9rAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J+kAJGL2BjHbdj6nYrlMZsL3L9Lj2PjwDM80cYWXHd1Vp1lOWJjcq7Q2Qm/j5XnHw
	 OjgNB6wv7FOdPdyIcamVigwYNKsdDZGFctCFK0J3gYwPRK/VObjoS9MkLMoYsaBWd+
	 iOZ73SrYMpRizoPmYiqkSnm4/uZLMV/BOtsF+YYY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 15 Sep 2026 10:21:37 +0100
Subject: [PATCH 2/2] kselftest: mm: fix intermittent failure khugepaged
 test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-fix_khugepagd_fail-v1-2-bb6f04c8759f@arm.com>
References: <20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com>
In-Reply-To: <20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com>
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
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4423; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=yxQR2EiRSnlOGVI9wDjEBOU2jCM7zzSGFANR8dJ9rAs=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqqQ4qQATMvvJEK3ZYgcRPUbjS+53++Tk8Ysis4
 XDYAEUYOq6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqkOKgAKCRBt1cPRWsUx
 M78uC/9CIAfRf6zmk9YykwQpH7GNfMsVHT0Grsqco4DCwk9jbC2K1EPyUOVkW0gj+SOVAz1/CO0
 mYO/mSYIKo6ElFDUjk1tg/UIANN7l2em3oLht51OtL6Mvj6Bb5ZYfWi1dTBpW+gp+0NTNBW1zER
 ejI7obz8sZUIuzHc5osND5TB9ClnKht4UKAcIYHSvtstrRj5Fpd5gejXxDVmiUkjCY/SVh0PVbw
 tX/4G46b+FvLKW5Z6XYUxTwpJGZXhdZUWZw6jj0GygVml0ZgEXG4kN+7Uj60v2C5+FG6Fe+yPxH
 mdZ62oyYjMykd6NiUqitvlkKtE64uhCNF+q18Jz72OWlv1/ZutO7xi0qkSrzHxBtUAnQ4TLjQJ2
 4VTylKZKrAw4Dk74VkTlgui5x47mZW3zuRBYevCgvbOutVIppYF8XbIlb/C+ykVM2nOgWlcb4T1
 RRWqJCj2bpT9Fn6qeA1coHIsV37cXOjbs0uI3u3zI7L15ZxPHBo1JWaSVDXUkyrEJDcm0=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There are intermittent failures in collapse_max_ptes_swap() and
collapse_max_ptes_shared() when using the khugepaged_context:

  // while running ./khugepaged -s 2

  # Run test: collapse_max_ptes_shared (khugepaged:anon)
  # Allocate huge page... OK
  # Share huge page over fork()... OK
  # Trigger CoW on page 1023 of 2048... OK
  # Maybe collapse with max_ptes_shared exceeded.... OK
  # Trigger CoW on page 1024 of 2048... Fail
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 23)
  # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0

  # Run test: collapse_max_ptes_swap (khugepaged:anon)
  # Swapout 257 of 2048 pages... OK
  # Maybe collapse with max_ptes_swap exceeded.... OK
  # Swapout 256 of 2048 pages... OK
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 17)
  # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0

This happens because khugepaged may collapse the pages before wait_for_scan()
is called, causing a sanity check that expects uncollapsed pages to fail.

For example, in collapse_max_ptes_swap(), after faulting the pages back in
and paging out up to max_ptes_swap pages, khugepaged may collapse them again
before c->collapse() is called.

To prevent this, change the khugepaged setting from ALWAYS to MADVICE for
the affected tests, and mark the VMA with MADV_NOHUGEPAGE after it has been
collapsed by wait_for_scan(). This prevents khugepaged from collapsing it
again before c->collapse() is called.

This failure was observed on NVIDIA Spark with 16KB page.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/khugepaged.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index c32244b565658..83e9386bbc842 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -578,6 +578,8 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		usleep(TICK);
 	}
 
+	madvise(p, len, MADV_NOHUGEPAGE);
+
 	return timeout == -1;
 }
 
@@ -839,6 +841,7 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
 
 static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *ops)
 {
+	struct thp_settings settings = *thp_current_settings();
 	int max_ptes_swap = thp_read_num("khugepaged/max_ptes_swap");
 	void *p;
 
@@ -860,6 +863,9 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 	validate_memory(p, 0, hpage_pmd_size);
 
 	if (c->enforce_pte_scan_limits) {
+		settings.hugepages[collapse_order].enabled = THP_MADVISE;
+		thp_push_settings(&settings);
+
 		ops->fault(p, 0, hpage_pmd_size);
 		ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap,
 		       hpage_pmd_nr);
@@ -869,12 +875,15 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 			success("OK");
 		} else {
 			fail("Fail");
+			thp_pop_settings();
 			goto out;
 		}
 
 		c->collapse("Collapse with max_ptes_swap pages swapped out", p,
 			    1, ops, true);
 		validate_memory(p, 0, hpage_pmd_size);
+
+		thp_pop_settings();
 	}
 out:
 	ops->cleanup_area(p, hpage_pmd_size);
@@ -1075,6 +1084,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 
 static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops *ops)
 {
+	struct thp_settings settings = *thp_current_settings();
 	int max_ptes_shared = thp_read_num("khugepaged/max_ptes_shared");
 	int wstatus;
 	void *p;
@@ -1100,6 +1110,9 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 			    1, ops, !c->enforce_pte_scan_limits);
 
 		if (c->enforce_pte_scan_limits) {
+			settings.hugepages[collapse_order].enabled = THP_MADVISE;
+			thp_push_settings(&settings);
+
 			ksft_print_msg("Trigger CoW on page %d of %d...",
 			       hpage_pmd_nr - max_ptes_shared, hpage_pmd_nr);
 			ops->fault(p, 0, (hpage_pmd_nr - max_ptes_shared) *
@@ -1111,6 +1124,8 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 
 			c->collapse("Collapse with max_ptes_shared PTEs shared",
 				    p, 1, ops, true);
+
+			thp_pop_settings();
 		}
 
 		validate_memory(p, 0, hpage_pmd_size);

-- 
2.43.0

