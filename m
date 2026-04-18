Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B606335F5E9;
	Sat, 18 Apr 2026 11:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510007; cv=none; b=F7Qvs9Maf2D39H0cw284jr3RksWLg0IUmwOTenlCAvDPn7lB37ZYePpY6xTHdwSkqwu7Rre75V5yBIWJUO4tzNJznd0/y7joyR1tO2udogL8iHGq9oCqiQdrIAQKbsedH8aOBivec+6CPPxlZQ6i4yE9WmLLHbA9G/KyUCfaeo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510007; c=relaxed/simple;
	bh=XUYa2AHXODnUwL+2gtS49wymmJEGg8QhpNWWbUz0fDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6B8aVedONOE5VQTkIK/Z9hAtfnyWImk+FvvGqs/q3V2PojRosn0KaHBXpFCFEDQ2GmrILAq4PPh7w40pImOFcBWbe1+voXQZ5Iyy4jZ7/wHUnUKrLaN430HYXrp1hbmNiKlEitGBX62oWm/XOLNxWktu58FdccTgtI7gDVG6Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a828fHzw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a828fHzw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323DAC2BCB3;
	Sat, 18 Apr 2026 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776510007;
	bh=XUYa2AHXODnUwL+2gtS49wymmJEGg8QhpNWWbUz0fDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a828fHzwlb5IeS7ppg9114zWrP/dPpKznsStLingEc6fRprm4rG3LZLICQ20GlPRS
	 krWXPvo3vgbpepoaKQNWlq2III3LfIT+8N0FJikQDlTaD2NV80CxoH9sJSUJHdABDZ
	 D+vkQxCNDe9xB5XpwL3D5iX2rK3tbykCyfCSIQTPR6E2efIMa8fnOPD1zzzKDWugNq
	 ikqBKUJfXafAtw/9tjjsrGqWXGHC0peW6wJAsdhVKDjqKXhTk72wGraMTDBwZ9KHUp
	 iA6NF+vAczkmCM5Froohi75GJHUl0i725VW990BHmnEpPoVhUctCjGNW+08RZdz5x0
	 6EZPY4D5PaZVA==
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
Subject: [PATCH v2 42/53] selftests/mm: hugetlb-vmemmap: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:27 +0300
Message-ID: <20260418105539.1261536-43-rppt@kernel.org>
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

hugetlb-vmemmap test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-vmemmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
index af5786bebfd1..507df78a158d 100644
--- a/tools/testing/selftests/mm/hugetlb-vmemmap.c
+++ b/tools/testing/selftests/mm/hugetlb-vmemmap.c
@@ -97,6 +97,9 @@ int main(int argc, char **argv)
 	ksft_print_header();
 	ksft_set_plan(1);
 
+	if (!hugetlb_setup_default(1))
+		ksft_exit_skip("Not enough free huge pages\n");
+
 	pagesize  = psize();
 	maplength = default_huge_page_size();
 	if (!maplength)
-- 
2.53.0

