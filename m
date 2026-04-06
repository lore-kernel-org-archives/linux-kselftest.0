Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB33803E9;
	Mon,  6 Apr 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485269; cv=none; b=vGrNFvaZlQYNHB0IyTNJ2hvZ652GTfe6Go4HMilGrVxDtVxZpMDAd4Fo/IM1iPA0JZN/5iqfq9oVuASPknSze7n2V5Ld7M8wj/iyCMdR1VPSTISj7YE1M/5jWCLxl40kb2Ugvujl8VyYX0xYx8sXBXbm7kWSQs67KV++VRkN6EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485269; c=relaxed/simple;
	bh=ib9LXsJztlT6AS3f5wMdXHDwOYMXkAdeN957x1qT4BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyyhnS6j1Q8eKtxcwhEO/WD12Meu+FGM18JsgPwUbL3Pice8krDvKLLjqp5lg26BDsbkd7QJbLOCwX0FyTodvHz2BI1S8aQxbhefbIQJWEKTRDVUpRR6p00IlreUvTaHvgvHlyzlblNvJvJ/MGzf6QW8Vl1yKueuZEaffhcb0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrhCPB/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrhCPB/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40E3C2BC9E;
	Mon,  6 Apr 2026 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485269;
	bh=ib9LXsJztlT6AS3f5wMdXHDwOYMXkAdeN957x1qT4BE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrhCPB/FE7s2ugmzDIClFZRLbmXSI3xuwtYWqEPSGSVk1TtwGU/zlHwfAvweZA5Nu
	 +Q2X2k2WPj3tP/z1wLJB3WZUSueCYfsscrlR429FKIgjD9RKyfK4T6CqLa8zr73Uis
	 JK6agm4Zu12BfZeghE6aGlt3hRZNZmPYdsKbLNKP+VokL/8wx2W7MzcG4W4raVH+sP
	 KpYP8Y2kgkaH99ILDISZc6VKbre0IKaEeuZ3vQanXV1v7wC4ubCwj6Ukccvruzdkih
	 CLVUrwnWtuFZBIPaztH3vJ/b1Pk+KAPzLqZQeKdpn8NXboMhiavOOFJSW7VuwIQT1E
	 A194Z+beJpUpA==
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
Subject: [PATCH 35/53] selftests/mm: hugetlb_fault_after_madv: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:17 +0300
Message-ID: <20260406141735.2179309-36-rppt@kernel.org>
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

hugetlb_fault_after_madv test skips testing if there are no free huge
pages prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb_fault_after_madv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
index c718dd065d53..481863cc5fda 100644
--- a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
+++ b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
@@ -54,7 +54,6 @@ void *madv(void *unused)
 
 int main(void)
 {
-	unsigned long free_hugepages;
 	pthread_t thread1, thread2;
 	/*
 	 * On kernel 6.4, we are able to reproduce the problem with ~1000
@@ -78,10 +77,9 @@ int main(void)
 	ksft_print_msg("[INFO] detected default hugetlb page size: %zu KiB\n",
 		       huge_page_size / 1024);
 
-	free_hugepages = hugetlb_free_default_pages();
-	if (free_hugepages != 1) {
+	if (!hugetlb_setup_default(1)) {
 		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
-			       free_hugepages);
+			       hugetlb_free_default_pages());
 	}
 
 	while (max--) {
-- 
2.53.0

