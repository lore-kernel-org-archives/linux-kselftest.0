Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8E381AE9;
	Mon,  6 Apr 2026 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485240; cv=none; b=kzxSFDGRiCNF/mmaTmRNEvtv4m34D4s7C38xGOik6fluZcTKcxQlgLspmJ0F5M8CnWFG43uxuRIKxucDQXOQEEXpzDgw+EaMII5L2lFDXyx498WEIt5D2nAqb4FwBJ/B0efSK5EXLeD2BC9/o4w3ql7sdN83k1RCDG2xWPM+eHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485240; c=relaxed/simple;
	bh=1/ugYRnvvCSRn7Fw/zm14SmACzlAtT74uoyJWfVmAG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R262eNlkNAqxKgvD9NwRPCRXASS5kLtu+IPt6n1FihASdf2xjCWU6k53uZOoHh7pfSY3nKKIXe1Z6SyWQw1yX5XXqRYB1aFA2GAf4MANOyl7OCj0pqDC1kbQmdQfP+8sJLpslP8DnHWE9RsAgmAGE9FK7QpQONMAmj1Wff6Ji4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMrtrC0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMrtrC0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFA8C4CEF7;
	Mon,  6 Apr 2026 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485240;
	bh=1/ugYRnvvCSRn7Fw/zm14SmACzlAtT74uoyJWfVmAG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SMrtrC0Fb0vXUxWdcq2IeM9vlYHdik0CVDmSy+BNmVRULOd6Yits0G5VhY3e4fU+o
	 gRFKKG+lufn0l583rAWj1+Br5n3N/rcFo3k+9BaajBuw+Qn/djN3OlVNkqe+381Eew
	 EjPSXCG1l2TB9Tk8TL2Jvqenuku/XeYZ49HvN8KZpdIJ+XcdTn7Exy7KvSKaFCZFZv
	 BktJ84OHoMyO/anyVfyIgRRLv6MSPil9iq3gBfHlNI+FEYzbrd8SMQAWLeO8J/fiZ9
	 lagWs3GdjznjlJOgMmpmIjm0i+fHhyH5ZfcLyzjXgO7LXrKU1eC1NvmUaNA2qfUQv6
	 lfwIqXgI9hxMQ==
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
Subject: [PATCH 30/53] selftests/mm: cow: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:12 +0300
Message-ID: <20260406141735.2179309-31-rppt@kernel.org>
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

cow tests skips HugeTLB tests if there are no free huge pages prepared
by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/cow.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 4321f4208fe3..1df513bf362d 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -1881,21 +1881,21 @@ int main(int argc, char **argv)
 
 	ksft_print_header();
 
+	hugepage_save_settings(true, true);
+
 	pagesize = getpagesize();
 	pmdsize = read_pmd_pagesize();
 	if (pmdsize) {
 		/* Only if THP is supported. */
 		thp_read_settings(&default_settings);
 		default_settings.hugepages[sz2ord(pmdsize, pagesize)].enabled = THP_INHERIT;
-		thp_save_settings();
 		thp_push_settings(&default_settings);
 
 		ksft_print_msg("[INFO] detected PMD size: %zu KiB\n",
 			       pmdsize / 1024);
 		nr_thpsizes = detect_thp_sizes(thpsizes, ARRAY_SIZE(thpsizes));
 	}
-	nr_hugetlbsizes = detect_hugetlb_page_sizes(hugetlbsizes,
-						    ARRAY_SIZE(hugetlbsizes));
+	nr_hugetlbsizes = hugetlb_setup(2, hugetlbsizes, ARRAY_SIZE(hugetlbsizes));
 	has_huge_zeropage = detect_huge_zeropage();
 
 	ksft_set_plan(ARRAY_SIZE(anon_test_cases) * tests_per_anon_test_case() +
-- 
2.53.0

