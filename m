Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0A7381AF5;
	Mon,  6 Apr 2026 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485246; cv=none; b=jCVoGxnr0LT2zAhW9g4H9jMSXWiPUKA7Ky9Vz6B2xmM+VBLMCbiYnYDwb+PGXg8eGNniIsziVcX+0XQ/AiP1pQO+TRvZX4CT0Wkh0xjyTH0mAPolcJbcqARMCIyAOzgMtkS67b9bKiO+RCyKFSIRK/X/K43Z1fjBxrn8kRYz5Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485246; c=relaxed/simple;
	bh=+OvcjE79uMeuRExtXX4z8n9tjto6YL9x88apIU5Xm3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVSJtFZfM/bDBVZjXb3HuspkoeVFw8ywZGtN4A0fMenHlv/VS3Rh1hKW9A0uahLLS/zS2dVTCbDr+wRO1r2uCleTQ/1JO+KiT5Ud+f+9Ea9jsL5z+ZJDVCeFQtdfRMbkpVJ9PW7IppoDnR7mCjONvdaw64BdJ1k09wmT+bFAs38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kh7lIewu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kh7lIewu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923BCC4AF09;
	Mon,  6 Apr 2026 14:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485245;
	bh=+OvcjE79uMeuRExtXX4z8n9tjto6YL9x88apIU5Xm3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kh7lIewuH7ZxH4vwRNILWRsv9NlJNHTXsSnYUpgq2l/WNuuBZx0XliHgIKHhoYFf+
	 zxnyKYkPWlwCii3h0SZ9QYJOaKSitw9nRxTalEYvs2su8PELBIRwZk5tYW8ZlfbhUt
	 yKwZE0bym6znEQ9B6U75eQZ0n8MtRJffTYkb0GMEUQ0Cgwt40MXOj9ETOgnnxh48Ny
	 OBBCxTEjn7SgnLDZF+EFbk/NXFxn0UvOtyCm4p3NVW2PnsyQs9lmLv6glrww1IlPMZ
	 ToHU9uQ+9VFbbZuEzqL0rCT+1+d3xv6oEz1h45p1TfF+uah4oFgDBe1xY3YE/5qT3Y
	 961td+QDP21dQ==
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
Subject: [PATCH 31/53] selftests/mm: gup_longterm: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:13 +0300
Message-ID: <20260406141735.2179309-32-rppt@kernel.org>
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

