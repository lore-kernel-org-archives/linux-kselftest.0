Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0B379989;
	Tue, 28 Apr 2026 20:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409301; cv=none; b=HaycHIfqzJPheoiDboSo0NAyeSvSmRMJmvKtF/z5nxQLbYuNEe7I+zyO/FcpTzGB3roJpMXHzImQXOwu1AnN7BUmGwWi45ivQD2ab4Fn/mU246zVvoI9EO0ga6Q+FYfDSvxTbNXRz3wCZrd11nGPPd/5fT47RCySHuPVPAPKa3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409301; c=relaxed/simple;
	bh=HtpaUkBbB7ijuw6rctcgEdxPGwj4VxmBP6AvOyp0uHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBGBXlkjCnl+jVz8pTFFzjccDWPL7MxwZHbvtg5GI1xiLVFH2B2EOQ4uLXyRf9usRxtGKWadRXbwb3Et/xagFhDfl/SXF82DCi/hO2W/dyhjmlKX/Q1efYxXwieNO0NlNcoHm0EnWVWfp+rXfvbx0TTji1RE/grwKE/D9ACDTbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrBgAN7v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrBgAN7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78506C2BCAF;
	Tue, 28 Apr 2026 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409300;
	bh=HtpaUkBbB7ijuw6rctcgEdxPGwj4VxmBP6AvOyp0uHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MrBgAN7v0Gg/6OxNrbQotAn9rKocS0ALXFItaZnMWNG1OLuQmgJy7qdzFHSbrC5QP
	 zBQ5eDY7h59KZ3h81uYkJvJBierPcozQ7O7/7jo2eRoBfbscSY3a7+Frbk772e23k6
	 1xgrJx8QYXesKBPb7sy/GNogVChQtwZSsIf9nV6dNOA3wrA3BtrUVGP3hrME5j/5Hr
	 aWU51BXDfiNs7kbgjz+C5lKiW6hJFWmE4n/J4M2drZoiOhfQMCOI49Aj+eVojI956S
	 MvZ1g4qUF6KPNuZnHXpXa5Rqb0DksAHwCigbZI6LCPDyQTrHEcp5NbVyGbz/0pKi+E
	 bN9Ax4BP1jjTg==
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
Subject: [PATCH v3 50/54] selftests/mm: uffd-wp-mremap: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:36 +0300
Message-ID: <20260428204240.1924129-51-rppt@kernel.org>
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

uffd-wp-remap skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-wp-mremap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index 9d67b11c2f28..f63fe02f404f 100644
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
 
 	/* If THP is supported, save THP settings and initially disable THP. */
 	if (nr_thpsizes) {
-		thp_save_settings();
 		thp_read_settings(&settings);
 		for (i = 0; i < NR_ORDERS; i++) {
 			settings.hugepages[i].enabled = THP_NEVER;
-- 
2.53.0

