Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148D0477988;
	Mon, 21 Sep 2026 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986926; cv=none; b=O4kOsf1ua96hjGqt0gxXE20vl2Y3IKC31uTaYVVn4IxY1hTqbpEjMF8A7grdkIrkYDBYhZ1q6nnfJSlVBY3xAKpbLLPcv/y7Xpjn+JiTLAwioJjqPUpd0lREz6wKPm2Fh7xROEw8xePW/L2hElIYxlYWCZWw9psLOqJVSLn247Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986926; c=relaxed/simple;
	bh=D8etrFh5PGy5HLvPhwqGM1Wl5RU8d5sdnQrtvxeo55k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2yL6GKl6ET2bsDc/N9Hbpsr9bWt4I2/yBvoIpUh/zo2M2hjKkPBP5e7xBUbYdBKrR2pM2BjIsyFmbqTod5JIFLOYA6SPrhVvF9ofM7D2MDjNyUSriYuMKtXecu31PAqe6+BLujWOli8oLzzJe8Ww0KsoE6Ps70o9RxTkYYrZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=euyfizuu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="euyfizuu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F05721CE0;
	Mon, 21 Sep 2026 03:35:20 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79A0D3F86C;
	Mon, 21 Sep 2026 03:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789986924; bh=D8etrFh5PGy5HLvPhwqGM1Wl5RU8d5sdnQrtvxeo55k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=euyfizuu/5QY080phLSCtFAVG7Fg2gRbfgcZviqYV0drqYHwEq1oalA5OTqMKzy0i
	 AZ+Keq9wAbPgZnGVWNt07LprqQMgTwvFoJID6HemD/W4kE8RfvCqO0rKLf0uCcVhWT
	 fyEqxvhLgAbPo2B9HxZeK3pee9ec0XGUdxpcorbM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:35:01 +0100
Subject: [PATCH v2 1/2] kselftest: mm: return fail when child test result
 is fail in khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-fix_khugepagd_fail-v2-1-3c2877beef61@arm.com>
References: <20260921-fix_khugepagd_fail-v2-0-3c2877beef61@arm.com>
In-Reply-To: <20260921-fix_khugepagd_fail-v2-0-3c2877beef61@arm.com>
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
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQhlwV78WbJb7q4RVD8y5LKAdXtv1aAi8JrPW
 rL3T0NHYm2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarEIZQAKCRBt1cPRWsUx
 M3GBDAC4MNdpWxzYWNr351pgIvQuXKa3KGIz3ZEgRYMpoHVlHcwwB5g71QmxxG6TDWB77nAFBUV
 YLsiJv9z3urIQUe1ZZPfaMiF6wxk8bhue1l2a1ehLzIOdn1nSmaY2IdNmQ7k8Tbp8C45Vx3TCjG
 KMP4Z7F/FPz0RlfzHNOb0EthjIKXZvmoIX6TXKnk5yzySwiWknxOD5H+2pKZiyaYPX+KP1nv9tO
 C5419ZLD+3uW+nUXVR5KM6RRHHqdJ5H4UDvQddisWQeo36WrIGvkb9RMdgqm/hwJXiqUggB9HL+
 X48OitPGXzMxtPXjK0k6SSlVy5Eeo3r3XjBNR2xhgnjA3Q4Xrl3SDa1Yx5ERGSQ+CbPBheeTlN6
 96iL4WJeXB0WepyvAF2TBIJUA6uL5ZXHlHxbc43VJTUbf5TBAMv+MB/uyx4P7TUibh8Cy80HaaG
 cjZddcuqTa9uHzp5mxOlUdwNjEJcPrXjk3/aguJfPklr8Q7mFr8Gb7tcoeXX0GQWIjoDI=
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

