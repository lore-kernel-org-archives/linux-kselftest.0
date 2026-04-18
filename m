Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41547355F52;
	Sat, 18 Apr 2026 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509964; cv=none; b=NJuPLwrVdySs51/25aJgWItEcq3iBuaIDDHdrwIKE5YT5X2ruBLYQ4y/KjT3HdWQH+mH8yXAFO1bQz4WWV6bv9WtNVRPtSLkVRaH2OxSDEKvIzzFoSO+38naaCPocg/Gal3bD0C6L1g+StAUiyBmRNlwbeY2MJvESoANM1RtelA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509964; c=relaxed/simple;
	bh=ib9LXsJztlT6AS3f5wMdXHDwOYMXkAdeN957x1qT4BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOpcfaXrnxBs79wlaEszLkWe7XcVxb37hc++TYLPIsCYFiqUSuqdWYbScrz6LwkbkeF3SMVk83kzLz3JXMafI2hLwUXzdhNqtU9fh3eRBTcUiflzMinvn5INBnJQcdhMhbKLs6hQnxGKXS8QGzt7YY15GMXSvaqM0yOoFPkdqlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pavFNxq/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pavFNxq/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328BCC2BCB3;
	Sat, 18 Apr 2026 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509963;
	bh=ib9LXsJztlT6AS3f5wMdXHDwOYMXkAdeN957x1qT4BE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pavFNxq/2IwGOfwlXixJLLH3uA6ytRbiy37uSfffBDhjDHasiINfzv5MpmEfSxnap
	 9+3as8gDKrxlI5DWlTwJmR8gK1ZhWi4Tugz6mvyCUYyKCkqnSV9cLUOjgEp/RNu1r3
	 nrtXGxtarPpSJSQDss7K08tB1BSSc5vCSSasegK3ygq+8hxAWcqWJ3n7OgqriXxb15
	 niVWY/utkt8tvgIxBTAPKXH7zFSTPFxM3TTZaNk9WJ2Z6LyetPDAyghkTsP3j4kgWb
	 JCumNx+lX3p4Ne2CT4oLhWfVZd8CDZpeM5fxg36Nr1EUIyx7CnRnwhovOruJLZE+yJ
	 YgqksBz/TYhog==
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
Subject: [PATCH v2 35/53] selftests/mm: hugetlb_fault_after_madv: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:20 +0300
Message-ID: <20260418105539.1261536-36-rppt@kernel.org>
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

