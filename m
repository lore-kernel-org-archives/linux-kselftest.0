Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7A55616D5;
	Wed, 23 Sep 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177412; cv=none; b=f3I5QQoh8Zd7xB+6+fyrZjUTW3VrYo9bN6DK/e4XE815zuyxxy6bX+0ofCBUlzq9es1enQqyw2AnibcfRuImpRiEKXgyLIpa0WYE8LtLARbJzsl+RZP0ajYSLZEGfmg0jsnkQtrMSPsQ7HoZ5eLP04NjfJtF9e1ZEgZmSpspAcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177412; c=relaxed/simple;
	bh=pIh12rnr/ckKT4a1lDC4z/x0jaw3aErYrMx1KjdCexA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKM6omPDGB1W5wYg4xZ8F/eubrLYAUKnd1ZR8htVqPtKarDYcdKDxS9I3n03Lz//zwzUbjnP0Fl49ky5yy1DZLtSkfI1JS+2gyM6LQSnILrPwLb7ayJRzGAWkjy48JcouIskVs4HVP/VOzdNP7gnP8PKgLMqbhmuJ28nrX8dxt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WMGU16mr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WMGU16mr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2FE1576;
	Wed, 23 Sep 2026 08:29:58 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 921953F86F;
	Wed, 23 Sep 2026 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790177401; bh=pIh12rnr/ckKT4a1lDC4z/x0jaw3aErYrMx1KjdCexA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WMGU16mr7jLNRHpkFcYQo2v89xd8hIf4Y5wEbe1MmX6kpBsNK4uZGLLUKj1tk2Ru0
	 kcf5bj3yAQDI4uqDIOnnK5Jnv4tZUnbtzwE2wl937ccgJ2QAqzcrnJaWUWuCSIZgVo
	 ojVST03iCdqh3wLEyOnfYLVkkPv7ttykOwRjlyE4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 23 Sep 2026 16:29:51 +0100
Subject: [PATCH v3 1/2] kselftest: mm: return fail when child test result
 is fail in khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-fix_khugepagd_fail-v3-1-b387e92fe1a9@arm.com>
References: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
In-Reply-To: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3420; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=pIh12rnr/ckKT4a1lDC4z/x0jaw3aErYrMx1KjdCexA=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqs/ByJm0UJBg1OcjxXEu0FPW/W9n0wXsrir4m5
 i3KrjLTtS2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarPwcgAKCRBt1cPRWsUx
 M/PgC/wLuFeWfUHYMoDjP+xiQ7jWCBT6B8SaFKYmvq39ggXdaPUl3cBbOqLa6ywtGWxsLXKkYFP
 k5kw0u3iXrFZK0Z+RI6/cP8YYjpprR/N9n03XKUIMy2nY7o7weRI0+zxMbIva65YOIZ4/sfRn93
 vxNcPACJ7BTT6TRQqPHtRaaJjoqEPE5wL9x0VDmFuR79iY+w1X09Ta75/IdF5XdOB5s0BGMwCHG
 B3TopvF4xJnnC6kFNqv596Vak9R8qfa1tt9Q4+kiJE+F9QySoaLPjVS6EpWqC4uLURFPoxcDg2R
 2z4Ii/DuKL+7Tm9954R66NxPpifge2nxoacGq/nNBQQTCes9SAWzsSefUvjR/bqEKt+tQ2YeEWh
 Ak8lQjWERBrSq/JnG55DtSthrpQ4UDjTBb1YeDvMNF/l4CrOqDTUkXVO4wlReemb+k2boCqRHOR
 mLZygUoJaa6iTkrB2C6l4Y+r31qN9yndBNQsPU4+CchQj8mfB3MHDl+MQ9zaPV5KplMnI=
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

