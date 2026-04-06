Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3D3822AF;
	Mon,  6 Apr 2026 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485280; cv=none; b=aydrH2ePTy+fGR0yOjmtrp0lrXvr+5RwOp3CvF5F/6pY50Qnr/nM9og6vcIh+y1So6qqDrlB0AoQcEMfDH0Ek8/YUMx36b3HaFIinW77n6xd2bQxI8+lgoL5yjjVTMkf2qRJTnAmXCIYjxyfkp10mXwrO7Ep5l+VfT60a9rf3e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485280; c=relaxed/simple;
	bh=nlprzoVHw1LmFezPWbTzVMDcbCMocVKEurNVLRnJdhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhuTKHPB7UYVfJhNuie+XEPm7cl2zg54KU+rYSQHWrMjs/di1qsWEunVmTRgEB4oOEdmNoENaYCcWaoEA5jFNLWOeKpYb9cPt48e7jLUoZiY9LMtlLesqMw8B24xePfETcOKIbr2bkoA/LXY+3OdFTjGHIhtISO01c1OGX5T4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agTROMm5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agTROMm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4163DC2BC9E;
	Mon,  6 Apr 2026 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485280;
	bh=nlprzoVHw1LmFezPWbTzVMDcbCMocVKEurNVLRnJdhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agTROMm5+/L8PA1PIQV1DOjILhrJF9lyrFuWSR9Agki1LfX/O7YJ+Wt/YZzCklDnA
	 b5G65oUCYtqzd8uRbHvsRvXd2xOQZsstAZ39uwds7uqJgd/AmanlNN67uxcQQb+0pe
	 MXdbivHX+Vi+Udi+aeK5w2FnWf2M1jA1HQwny+3a5s3UfAVTOTxamd9nchmpZTzKoE
	 3LGGwveUGotGzyOsFUZqX5BQZMAU26x2kuxoh1g2IX0+ubDe4ef0Zcwoz0h74wf7tk
	 y2zGFwbfWWtaFz28ZAxj+SEgJru4P2bJXx8ufTwZh6Fw3yd0hcsNlX7E7Tp3esAFYi
	 8vDfQweFV7ZwQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
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
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 37/53] selftests/mm: hugetlb_madv_vs_map: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:19 +0300
Message-ID: <20260406141735.2179309-38-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406141735.2179309-1-rppt@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hugetlb_madv_vs_map test skips testing if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb_madv_vs_map.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index dfbd71a7f709..6c95dd23ca81 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -77,7 +77,6 @@ void *map_extra(void *unused)
 int main(void)
 {
 	pthread_t thread1, thread2, thread3;
-	unsigned long free_hugepages;
 	void *ret;
 
 	/*
@@ -89,11 +88,9 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(1);
 
-	free_hugepages = hugetlb_free_default_pages();
-
-	if (free_hugepages != 1)
+	if (!hugetlb_setup_default(1))
 		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
-			       free_hugepages);
+			       hugetlb_free_default_pages());
 
 	mmap_size = default_huge_page_size();
 
-- 
2.53.0

