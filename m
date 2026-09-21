Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5171475344;
	Mon, 21 Sep 2026 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986930; cv=none; b=dh/LAKoXakqPiIXMGzmOezW6tISJIESgXnzw9CC0UHb3xX0OZb5E4jXTWh/yxm4HNTiCa4iTrIZu5gQYaPsXFGiA1MjV0wwy0ZGNm7b/9jntdvimZjXelUUk7OoEjgHGXDdQd1vCMaLyvo9gtDmhhVk4h74UCwBK3RsY+8Og9dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986930; c=relaxed/simple;
	bh=OXUOnvVGrm07rx45bJyXJlQdfRIainiGV7w2eQXNIIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uU77/j3Jm4B1lo48xn2TFoFjWIf42W1SmEsNnQix/RXOTWIQLGQ9MZjOCwv72GlwRtTGjFMIdmbmnLhslXlslOeBKzkJTvdORmO+lVw///nVMEjVclLjXUSKAlKLgDQ1dL7REplqdmS+qGksuhMbAkQ8mwYr7MvxWGTCsja705Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Bi+r4Pzf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Bi+r4Pzf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 556E41D13;
	Mon, 21 Sep 2026 03:35:24 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF6633F86C;
	Mon, 21 Sep 2026 03:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789986927; bh=OXUOnvVGrm07rx45bJyXJlQdfRIainiGV7w2eQXNIIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bi+r4Pzfu7LK1IDnv1iAnU1CxKUeRaP2t8oMyIAxvDICfZ0gntJ9AhAc+ehwKLvIL
	 10newgqW4Nh2YwMUpdV4D6yl2+D9Tms20DiVJzHray3RtuuCLjmDAUochKDNDE4uug
	 bHMBe9G3TQdEoYw9jtIY/e9y41s5KMDZqHszJ3oI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:35:02 +0100
Subject: [PATCH v2 2/2] kselftest: mm: fix intermittent failure khugepaged
 test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-fix_khugepagd_fail-v2-2-3c2877beef61@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2118; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=OXUOnvVGrm07rx45bJyXJlQdfRIainiGV7w2eQXNIIc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQhlJdHPWa4jn/M+z47EH8fWexmgZDgXPjOo2
 GS9NJ+vTPuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarEIZQAKCRBt1cPRWsUx
 Mz0BDAC2VYxF9NnES1vwyT52W2QO7fnSf6o/iaq6vfit/DpNCWSGOVc47Lb34VolWmo8310yt/J
 2pYlXQlQIED2Halizd24uKh3dHF95WMrw8PlsjSUf99mKNCPnDPPLotxk75qPcpwcYyIgnOKGjr
 P8cc8s3UfWhJTjGWnT/56WeHXNQ0FoIHnoZ0idwApn5NcchHQMNZ856JUDplrGHG3FbV9pfjFKS
 hBqvLskYzTxz3TEy7w697RkDQYKzBUydOLUMW8847RYyamo5J0LwpyfAliI5RptnvbWJF9vVUH7
 lXAyIKA82Y4JecyrvgkEin6ob9PSN++tW3AU3bidPXG3fYNQ7MJx2Y7BOMmWez3gYHinCUBG6FO
 3Sz3xZF74VFrJ3aqwPheG81wvBJ9ZPm8I/H8I1NgpP+1U4BeibW20VsNhhQGvU5VZA3GkFbNwNu
 y42m1pII2ThSUxUUXlyRIwnbFH9fHVv83jDSCwBCFTcKnQoqZwZNsgVbpi+fwQWSb8A2M=
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

To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
collapsed by wait_for_scan() for anon. This prevents khugepaged from
collapsing it again before c->collapse() is called.

This failure was observed on NVIDIA Spark with 16KB page.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/khugepaged.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index c32244b565658..1aad4bb427ece 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -578,6 +578,9 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		usleep(TICK);
 	}
 
+	if (!strncmp(ops->name, "anon", 4))
+		madvise(p, len, MADV_NOHUGEPAGE);
+
 	return timeout == -1;
 }
 

-- 
2.43.0

