Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9A037F8DB;
	Tue, 28 Apr 2026 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409215; cv=none; b=qsMDdaCo/4Mygt08LMtw7oe91j6cuPQr2w41lb8bbLt1kRaw/+JxJEB9tUHTaMXFYDOK+aA1JjnMQ4yhH8N63TPHzWGZqhCQHQzZNTlUt9SnPrKWhw0xsS4Xf1Cef/sDjjhBkYXHW3gAfuTSuDWKZEmc92B+LmGF/ZTj/701bRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409215; c=relaxed/simple;
	bh=1E1PaJAheFq68IlA7LKJisHu/YP5aoXijmYjIj2LOcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L4G5T0ZymHF6CG0APoJjNOtnfS6oY3hQJGaCrSrKiBy6g8mB1ks8Fn2vLkuvZ4IFEMrBzqeJ22nJ+przhFhiNeKR8wH9xj9q5qih/CfbDfRbiHP/VC0JLJfmPvgi9w50L59F+mODnYu3fiW8RrghFw1Ee5cduO5h0nSYMmmv7L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfTZR8A5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfTZR8A5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF63C4AF09;
	Tue, 28 Apr 2026 20:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409214;
	bh=1E1PaJAheFq68IlA7LKJisHu/YP5aoXijmYjIj2LOcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RfTZR8A5NSaVcxV4oFGcISWB69/39YfEdkoN6L1MZWM+kttqU+LmX2bZHSnp0cWRa
	 dwWrhk4La8ShLvJv2Ji3jwOgArl4fxnmsZv2Uguy/wDmYCATYP/MrUlCByI0rYFmSi
	 iYlU6oNDU8Q3fV8whf1+Ll91KGJb6QpnSjR0urln9RbYBuEQwBhsa3ReYgrmJ48g4z
	 wNBHtqFcFB5/EMiEoDB3JDRsxbF69nXhyXU++Qs/Nu++cIO2iilaHSp5ccDNRY5ngm
	 sIDB6GzwRbOrbXw6DTIMzBKiDU057XAQF+6oHTVq/WiesNC1Ti+jzqQkv4bobaT70z
	 Urg8jyOsVksbw==
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
Subject: [PATCH v3 37/54] selftests/mm: hugetlb-madvise: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:23 +0300
Message-ID: <20260428204240.1924129-38-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hugetlb-madvise test skips testing if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-madvise.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index 3c08eb6db6a2..b20648d025e6 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -68,9 +68,9 @@ int main(int argc, char **argv)
 	if (!base_page_size)
 		ksft_exit_fail_msg("Unable to determine base page size\n");
 
+	if (!hugetlb_setup_default(MIN_FREE_PAGES))
+		ksft_exit_skip("Not enough free huge pages (have %lu, need %d)\n", hugetlb_free_default_pages(), MIN_FREE_PAGES);
 	free_hugepages = hugetlb_free_default_pages();
-	if (free_hugepages < MIN_FREE_PAGES)
-		ksft_exit_skip("Not enough free huge pages (have %lu, need %d)\n", free_hugepages, MIN_FREE_PAGES);
 
 	fd = memfd_create(argv[0], MFD_HUGETLB);
 	if (fd < 0)
-- 
2.53.0

