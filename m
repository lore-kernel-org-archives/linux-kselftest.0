Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A573F33F589;
	Mon, 11 May 2026 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517263; cv=none; b=Q/nfCNbPuCBw9Xg0nYjDWhFOksC1XWRAUJG/ZPLCcaSQ8KOlkbSiZbRziccf0c+lwLF+QiD4HE7nmD/FSLtReCI5nhwVjatI00qgCQuGpdz281sY2eXGTyyUm0X54narDResgZSL/aVHjzVjc0pZTU38hcihL6TjTAVyY3fphik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517263; c=relaxed/simple;
	bh=E1oIrYUogHJ+9UAiYDAHUarJog8LSuDN15FTDfeEGR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1gI+2HDnPkAGbjpWo+cdG758/pA4yeriiYlGrzI134OVe1uzsETFd9LSmI3UW9dHg7YzNxmIXHabmJnHwj+N7JyhvBnsNXLv5sFPmLiFIeXz5/mh814POSJ4CzoB76G6W4i1dSsKTboquxWwHEDlekL9lr6FfkMJQFBHoKHF00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NX0zFW2U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NX0zFW2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78793C2BCB0;
	Mon, 11 May 2026 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517263;
	bh=E1oIrYUogHJ+9UAiYDAHUarJog8LSuDN15FTDfeEGR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NX0zFW2UfIDNSCCKAcpcryW6i4H4VNcwtdlTPYPmGbcuQ0G6vcAZlRRj7zgTtj0DD
	 k96xD2L+hXv0r5kFZ3f91QIePWzacy7/4f350zd/QnmE4kXFq8iRJ4kKdt0dj2Hq0o
	 bbI/0MHSG0kVOjMZ6cEw+UvluUZS/+8icRpD5enKI/5OZ8IWagFSJesrx4qk7WfuJG
	 sWNtcWcpigP+60hIEWMs85TLl7syz1DanAQIP3dsBebrEDabh/fLgELQMDThfJAP3U
	 EDm7RBVgMsIDTctz7V0zAzuJdgARkcvOX1+u0kfzehEJ5eyPFw7CRP3XTHuDyXUkPT
	 ExR4u9gZ9k7kQ==
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
Subject: [PATCH v4 51/55] selftests/mm: uffd-wp-mremap: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:35 +0300
Message-ID: <20260511162840.375890-52-rppt@kernel.org>
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

uffd-wp-remap skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-wp-mremap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index b44e02840a5e..90ac410c6c6f 100644
--- a/tools/testing/selftests/mm/uffd-wp-mremap.c
+++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -336,14 +336,14 @@ int main(int argc, char **argv)
 	struct thp_settings settings;
 	int i, j, plan = 0;
 
+	hugepage_save_settings(true, true);
+
 	pagesize = getpagesize();
 	nr_thpsizes = detect_thp_sizes(thpsizes, ARRAY_SIZE(thpsizes));
-	nr_hugetlbsizes = detect_hugetlb_page_sizes(hugetlbsizes,
-						    ARRAY_SIZE(hugetlbsizes));
+	nr_hugetlbsizes = hugetlb_setup(1, hugetlbsizes, ARRAY_SIZE(hugetlbsizes));
 
-	/* If THP is supported, save THP settings and initially disable THP. */
+	/* If THP is supported, initially disable THP. */
 	if (nr_thpsizes) {
-		thp_save_settings();
 		thp_read_settings(&settings);
 		for (i = 0; i < NR_ORDERS; i++) {
 			settings.hugepages[i].enabled = THP_NEVER;
-- 
2.53.0

