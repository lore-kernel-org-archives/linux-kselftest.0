Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDE235C1B0;
	Sat, 18 Apr 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509976; cv=none; b=oLgaZFXPPrcXv4CcSfTjQkV3vmrojwnt26GAKSS9S/aOroXyGn684wZeTMzDyFMXk5UGBOIb7h+23+yDduy/GxnU0Zk/lSgE68NRFD/70fn5N2YDASy1TUp5YCTa9OQcjJgMf6MPomGsDRD2QvDshmaGoR0F2DATiQmJDMHR+pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509976; c=relaxed/simple;
	bh=nlprzoVHw1LmFezPWbTzVMDcbCMocVKEurNVLRnJdhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0Y8vECFDLPORy1ZZU5rT/P5QusJaiTnKpoZVXqFSJyWMYTYAcsL5gr1eIU2krpG+lDVTB3xMTqlSPFhh/88QFtufdU+ns8dCuqe7uxS/rKhTdaAuAK/k5Z8rJtfsUols6h6rm7t5ObuG6xAhIu9bQlFWMGDjmYHhyPPysPV+JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2DTbIwr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2DTbIwr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A51C19424;
	Sat, 18 Apr 2026 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509976;
	bh=nlprzoVHw1LmFezPWbTzVMDcbCMocVKEurNVLRnJdhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j2DTbIwrrSa8Hts3VR6qfY1RNGaG6RknLFZcI1ZvFwC0lB0XYhXR4Reo2MvniGN6n
	 xFvPuudLgzqPjC4UwZ7OgqnA0dXtyIo62m7iwpdpGjJsr1fwmUsXfXPFJvSaVOPRsA
	 smLkx2xZ2wbR4WSlK8ebQREmRy0WQmjbaYN4AXOQTqwO4adnnhmhEoR54jv3J12nUK
	 j9pDULmHCpb5iMCF26LTlVlbtNs+ysvPptTaoFVDymklFNsQUJk5nUAP4En8jEv0Ig
	 lPONwHZoUYAg54kSqDXEFsbI0bHj2CPD87SGUBzdmYnWk08rLNRTTqndJjlJYE+BnC
	 eD6aVcNWGzPvg==
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
Subject: [PATCH v2 37/53] selftests/mm: hugetlb_madv_vs_map: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:22 +0300
Message-ID: <20260418105539.1261536-38-rppt@kernel.org>
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

