Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5983D3318;
	Mon, 11 May 2026 16:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517171; cv=none; b=WASROnKImvnd9GHrxeJwgQq7ZVlyIsswoqwP9FOM67lBPsrDOWsG1LowKJSvtGtaaJHAPdjNTmy0nOY0tWSsn2FPTGgjAjdchOXcmBWwX1JdRbDcJ6V4KpM8+IDyzZSvUI2MiI2Tu5bso72yfoT12QyiVNO1uTVK3+pwEZrVqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517171; c=relaxed/simple;
	bh=oVx6caxujs0GJm4PzOdNxdItHvCSRDnJxA7+su/xLqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lz0og9RDG0/30e4zkF9s205+5HtjqVzjL9Ib7fsIYQYBivmIP33s2424gLc7gn4U2K96MrIg1bpPJn+J3PyMhXPYeKYJyY184rBQuFAS+7f78cGc1DElBHPWZoB5JU1VX4i8rzOFoe3QrR9PYzotCKJ542oedrabcyjZja7nqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NORjY/Q3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NORjY/Q3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EFCC2BCC9;
	Mon, 11 May 2026 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517171;
	bh=oVx6caxujs0GJm4PzOdNxdItHvCSRDnJxA7+su/xLqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NORjY/Q3jZtVtWoKKLRQSytsUZMG+fZhPSKqMQZfxmzwgTDZj78TcAmXNYsmeZkCF
	 Q83S80IsISqzjkewq6Ym6dKdnaoJR6fLThQrJj+MfEar5Dye2fgLxYgfKVxrGXnz+R
	 ctTYWKe0Sha2ssJRMWbRFS0/K0Ob49+jk2L2SsQUvuWHftNc1fEjFh5kGxTXG158cY
	 qT/yZilUN0qIunR0cPbI84P9HtOe59sEswxejzkn5SR6MT67EoC+cBLJURbxlMksMj
	 t+aSeMyf4qvmvbOLtabGeHdrnfrtD3hq2Qr+sFYMqZ2MVqc+WBjm5Uiu+Ft9qV3Z7c
	 4FsmWCHSCHb5g==
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
	Li Wang <li.wang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
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
Subject: [PATCH v4 37/55] selftests/mm: hugetlb_fault_after_madv: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:21 +0300
Message-ID: <20260511162840.375890-38-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
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

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb_fault_after_madv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
index c718dd065d53..2dc158054f66 100644
--- a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
+++ b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
@@ -54,7 +54,6 @@ void *madv(void *unused)
 
 int main(void)
 {
-	unsigned long free_hugepages;
 	pthread_t thread1, thread2;
 	/*
 	 * On kernel 6.4, we are able to reproduce the problem with ~1000
@@ -78,11 +77,8 @@ int main(void)
 	ksft_print_msg("[INFO] detected default hugetlb page size: %zu KiB\n",
 		       huge_page_size / 1024);
 
-	free_hugepages = hugetlb_free_default_pages();
-	if (free_hugepages != 1) {
-		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
-			       free_hugepages);
-	}
+	if (!hugetlb_setup_default(1))
+		ksft_exit_skip("Not enough HugeTLB pages\n");
 
 	while (max--) {
 		huge_ptr = mmap(NULL, huge_page_size, PROT_READ | PROT_WRITE,
-- 
2.53.0

