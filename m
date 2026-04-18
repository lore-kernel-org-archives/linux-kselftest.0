Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD23355F52;
	Sat, 18 Apr 2026 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509890; cv=none; b=INMt8xqCuZPxwOiWuVl887ji8+B787wPJDLI6odMrmSNKjlmo+uVel9Zpjgshut3dwZMA+bMfUDeBbwWrLlygdmKa/GGnTtCJJS2Grr00EsT17HcQRhxXMlYpJglhjLSPaT2XO6vzUCYVBYiGv81340pytuMvXQ++7S9LfIOml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509890; c=relaxed/simple;
	bh=/Wvi9uebpP/hGBuUfLX+2dm76zvxNiYlkCrT9K3LAcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sc+DpYqmjL8Qz2lH4zighfV+xKIBaWGgqkaUjb+Nn0YJebmY3FaXXk56E58nueK5ptg0WTyty6hBZhT5kijLOJX/BRBLPnk85+DQjhhVC3tNYbrgWF39do2+lR6Xt2FRVJfvXVlxKbzFvHrjriuNfdIU/5hqnbs57DcikUqOCc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkjbTYkY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkjbTYkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4C0C2BCB5;
	Sat, 18 Apr 2026 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509890;
	bh=/Wvi9uebpP/hGBuUfLX+2dm76zvxNiYlkCrT9K3LAcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fkjbTYkYLePMuP6Vg0cVPkgb2IQAYT5sZI3kf1fZ6eFAfzrQMovKouwxgDlzZpFXA
	 vulAonW+RmRzzCWG5+cCkt9++7Joj4U0jwB8A8EKFzu/cO/mc4qfMNbBesxNRBAMg+
	 vzKNYuCLzo6R0MVI4xKI0vyeaFsxQ/qlUzKUSuWer2BuURrZH00N5nprxu3oJk7uiq
	 S1uP9xasGb+ukX5HJCGrj6Ak2aLkwxQxOt3Mo0TIrP79g9QFTF4FwedTm5byXrKxQH
	 FSwhBVur6uTDtNIigIOYrW+u+l9j3vu4cN3ZNvH6C3wG8oix+62/HUdPjbkc8sKiGP
	 dPg1EN33GApqQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 23/53] selftests/mm: hugepage_settings: use unsigned long in detect_hugetlb_page_size
Date: Sat, 18 Apr 2026 13:55:08 +0300
Message-ID: <20260418105539.1261536-24-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

... instead of size_t to avoid type mismatch in 32 and 64 bit builds.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugepage_settings.c | 2 +-
 tools/testing/selftests/mm/hugepage_settings.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index ebaa621c45c6..8f563315b1fc 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -399,7 +399,7 @@ bool thp_is_enabled(void)
 	return mode == 1 || mode == 3;
 }
 
-int detect_hugetlb_page_sizes(size_t sizes[], int max)
+int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
 {
 	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
 	int count = 0;
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index 320b97e768e8..9357d07e6c1b 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -90,7 +90,7 @@ bool thp_is_enabled(void);
 
 /* HugeTLB */
 
-int detect_hugetlb_page_sizes(size_t sizes[], int max);
+int detect_hugetlb_page_sizes(unsigned long sizes[], int max);
 unsigned long default_huge_page_size(void);
 unsigned long get_free_hugepages(void);
 
-- 
2.53.0

