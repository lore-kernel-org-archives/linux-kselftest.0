Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320342DFF1;
	Mon, 11 May 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517146; cv=none; b=o+ySPfRucGXKAaqZJLSh/nWf/mNCHiM226GgtaH2/NK8SQHmGhe3Ish6ul5mrdVf6FrL8OsqodzUi9fBgaCKHY5L/6wrj++pwQyDrl0SWlJnntRqia2B/UoCKR1GY03Gh2MieSpSuzeo984GgsneKWYjyvSbRMQLe9od09mw0zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517146; c=relaxed/simple;
	bh=lA3bDepyp/KwvwswSh+ZEnsgnt+UniCEkPXwbD7q5uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cb66Z/2R0yQpcYXxF8eMNbt0b7S1SoOfhFJsgwhBOhKzU4HAxRrspobY5zXcxofqJjDbzptPjt8pyAyC0JUN0jnhgQnc6HoGhFThlcI/3SszBUd+LXmQc8oLYZFNLCFFvtTJMw3H+EndoVQCIdLyR2QLtE1Cm8U30o2T40JaSqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9kUymH/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9kUymH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2ECC2BCB0;
	Mon, 11 May 2026 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517145;
	bh=lA3bDepyp/KwvwswSh+ZEnsgnt+UniCEkPXwbD7q5uk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e9kUymH/p70j9GGaBVXch80X7FOdrlg68SCppYlJo3m3mXNbvnCArzXhbuOo7t2h2
	 EKsMQiD8F+uwMFZWpfs4Djtuklt790IpQsjhkb90AXp4k8pFDjJRVI4cf5b+3x+sl5
	 w+zahcfQYi5CKy0BD8nS2fkYCYQ0HwN7WpjMCr2rgO92oLsDDQdB9mSgzX90BsX2BV
	 2RSOARreDsvUTgWiHaDoaYLCm/HOSI9+5lXFvhzi+Nu2saajYli2wuVgPMFgwgxGYS
	 YSiU+TKOYvLIGDnwISBdSeRPbrFnWqxo45ZR0nuAVuVEeYKaorLRZTggepWhhHAi7X
	 xAAIdtXkZ2jzQ==
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
Subject: [PATCH v4 33/55] selftests/mm: gup_longterm: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:17 +0300
Message-ID: <20260511162840.375890-34-rppt@kernel.org>
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

gup_longterm tests skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/gup_longterm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index 96dae0acd11a..eb8963e9d98f 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -510,7 +510,7 @@ int main(int argc, char **argv)
 	int i;
 
 	pagesize = getpagesize();
-	nr_hugetlbsizes = detect_hugetlb_page_sizes(hugetlbsizes,
+	nr_hugetlbsizes = hugetlb_setup(2, hugetlbsizes,
 						    ARRAY_SIZE(hugetlbsizes));
 
 	ksft_print_header();
-- 
2.53.0

