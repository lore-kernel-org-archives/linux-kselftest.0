Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFB1C84BC;
	Tue, 28 Apr 2026 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409182; cv=none; b=Z4f84IGiZ07fFZpgrkbkYj0pEW3pNu19xHknoVBplmg8piej+rJbCoGsZCOhzlaxPZRmMPPUNa/mi0yuz97a2Ahpdli3SGcj/37SEnFmjU0GuWw1BVwxxXBhw0bQQSqOmIsQXErG77UE3kTc9HIFgZEit6anFVUc4j3xZ9nFV8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409182; c=relaxed/simple;
	bh=+OvcjE79uMeuRExtXX4z8n9tjto6YL9x88apIU5Xm3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGjNpBW0rerhzqLpanhR5Gzi+kFtwtrirbTYNh01Ltek5VzAMYJQhad4WkTyN6alzD7QVepzweU8M3Q73SABd5FKhY9c6XLCDNX1sdW05vI9jHcHQwsBNaAbTmMuT404nJ5BYUZrYdHx3aLcTv1dY8g1bck1E3X0tZ/s7b/808E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZqr0eLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZqr0eLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AD0C2BCB3;
	Tue, 28 Apr 2026 20:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409182;
	bh=+OvcjE79uMeuRExtXX4z8n9tjto6YL9x88apIU5Xm3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TZqr0eLxhEfqMiZsaMVHWOG+AucVJcmqXOKoenveGucYc/fzs4gVFRV5G7wVa5GK4
	 OROazvxv4pdeMLn0lY91hU4Quqp6lB5WxBbTPvVC0ReBBQSTq+zN0Y/Xmc+r40OKJs
	 FAuZOYgIzij5EmMXivP+r8pGWuhx68Qv4j0XRpHUPk1iSS2m1c1x+rRsUmGsnjJR3D
	 iKAVc6PtW4qhsoUSUop8ttE4zeV6+NyaWlsg3slI1241DqcEaqRkplVMFcRpnE3/n+
	 vBoLSds6+Yp3MNFKBLOhaNmd7xLy2yktHRFyR4piFz0lhFdWx7/FSLbzb9pOOx2oSt
	 gqnrzutgv+pvQ==
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
Subject: [PATCH v3 32/54] selftests/mm: gup_longterm: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:18 +0300
Message-ID: <20260428204240.1924129-33-rppt@kernel.org>
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

gup_longterm tests skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/gup_longterm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index ab4eaf4feb7c..6e1de12bf28c 100644
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

