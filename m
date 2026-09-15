Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60AF39792B;
	Tue, 15 Sep 2026 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464116; cv=none; b=huTOOCAML/BZ/6KsQIzQObzDI4PG3/2paFRhl2ql/sGGtu6e8kOo1By30J3a5/Me8GKccBOnzoj+OKQ9RCBkVRPy7vbd8eYBF+4kR4Zu/nqpx+ZjNdAIfa284Owoa5TaIWQnwbKMQPZbFOX7d4+k1qYyd29Ooo+0jIYe0idgU9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464116; c=relaxed/simple;
	bh=D8etrFh5PGy5HLvPhwqGM1Wl5RU8d5sdnQrtvxeo55k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovE1s7GBV346eqNEbVAuiCD/skPpjgmBUtYwANEp4/n5XbTkrw6igRmZHfnLUp4gwNe4TW60ma27DuuxOL4qiskHrdWXPGhElndk1Kee35LRlH8ySGB8Ervm0pGtn44i8+kov8pW6PwJHlywbdi6lQBUfeF/6P740mp1BAEEA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p4rMo+IJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p4rMo+IJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63483169E;
	Tue, 15 Sep 2026 02:21:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F3F93F86F;
	Tue, 15 Sep 2026 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789464113; bh=D8etrFh5PGy5HLvPhwqGM1Wl5RU8d5sdnQrtvxeo55k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p4rMo+IJ/Gkhmw6l4doFJOhI3kq5Jsrz6oPJZQHc42wSQRksETR+uZr0N63rimdPT
	 TulTZLc1rZ7RX5Uo2fH7NNx47T6wNGRrtEkh4ryD1XR5bYqV0pzgpeiWYhM0iI144d
	 fz13VfZSG3KjlMxrf7pKTlhU4YDzO7wL/2D02w1I=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 15 Sep 2026 10:21:36 +0100
Subject: [PATCH 1/2] kselftest: mm: return fail when child test result is
 fail in khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260915-fix_khugepagd_fail-v1-1-bb6f04c8759f@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=D8etrFh5PGy5HLvPhwqGM1Wl5RU8d5sdnQrtvxeo55k=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqqQ4pqgL4yB1OOTyqBCX0ujLg4uw+AK27HNSUj
 klNmhjYVguJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqkOKQAKCRBt1cPRWsUx
 M9jODAC1p2pD+ImErVv4cHBblEws2o83F5MqG+kFAp3hq2sM3JAWDCTu/5rzPSZ96XYiCOJhGfQ
 Rz1CgascbrrgUX2lkNITzBJZxvDWiN3vHHkFSDHAq7vN0Nb1JX/FwmMDbUGU6sokZ/crr7W6B0E
 G6uz2lKxu5jE1uaNPROWId6JjXzJN8H2Tk3JQQFCPb/fwWOxZQ9lo1i07Xj4WiNkR/NhfeurO/m
 YhBJ4okasmpw3TKuufoFso92MjiKWPoZHJY89APsnRUuE808RM4W0m3+X2MPEdoHgJv87iNzuIp
 mlE7lt1w9eHwawcgv1VKEtNtN/BfFLuVSOoC/2IqrIvFwEoQr1A4MBCDO/moKVMRO82eYnFoX0j
 EX2FBnBXoIuILwFvQIDXGgCBC/hayweE+WrJL1J2iGBky7rP649fMnf9lsQZEwSatQDRw7ZfVaR
 AFpGz+ZgIS5jCcn7qJr2/3bbGw7p2VjhBZXC6ewfU63Kf22QhYcek+UTvZ0FuUZaIsKf4=
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

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/khugepaged.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index f82673f5f6b47..c32244b565658 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1009,6 +1009,8 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 
 	wait(&wstatus);
 	exit_status = WEXITSTATUS(wstatus);
+	if (exit_status == KSFT_FAIL)
+		goto out;
 
 	ksft_print_msg("Check if parent still has small page...");
 	if (ops->check_huge(p, hpage_pmd_size, 0, hpage_pmd_size))
@@ -1016,6 +1018,7 @@ static void collapse_fork(struct collapse_context *c, struct mem_ops *ops)
 	else
 		fail("Fail");
 	validate_memory(p, 0, page_size);
+out:
 	ops->cleanup_area(p, hpage_pmd_size);
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
@@ -1056,6 +1059,8 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 
 	wait(&wstatus);
 	exit_status = WEXITSTATUS(wstatus);
+	if (exit_status == KSFT_FAIL)
+		goto out;
 
 	ksft_print_msg("Check if parent still has huge page...");
 	if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
@@ -1063,6 +1068,7 @@ static void collapse_fork_compound(struct collapse_context *c, struct mem_ops *o
 	else
 		fail("Fail");
 	validate_memory(p, 0, hpage_pmd_size);
+out:
 	ops->cleanup_area(p, hpage_pmd_size);
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
@@ -1114,6 +1120,8 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 
 	wait(&wstatus);
 	exit_status = WEXITSTATUS(wstatus);
+	if (exit_status == KSFT_FAIL)
+		goto out;
 
 	ksft_print_msg("Check if parent still has huge page...");
 	if (ops->check_huge(p, hpage_pmd_size, 1, hpage_pmd_size))
@@ -1121,6 +1129,7 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 	else
 		fail("Fail");
 	validate_memory(p, 0, hpage_pmd_size);
+out:
 	ops->cleanup_area(p, hpage_pmd_size);
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }

-- 
2.43.0

