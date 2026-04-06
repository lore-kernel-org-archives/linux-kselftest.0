Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722883859CD;
	Mon,  6 Apr 2026 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485309; cv=none; b=KDcsJr7iXIcWMXg7SbsdxYaYmYunJ7FCY7xcQL5zmaRG/mUzwoEnVpWI2pzMztxRSDTpTANQWHq6Z+EVo/fv4JZMGBzhuhWXRSaTMjLmH9AFXo7d4Dy1y5G4haiA9BN+mAT653ghQcIEIJNcarnr4bTVNe+9M4daSl0MfH6Oe30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485309; c=relaxed/simple;
	bh=XUYa2AHXODnUwL+2gtS49wymmJEGg8QhpNWWbUz0fDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Blx70Bra15Gln0B6Jo2rczdPtsMRpKerX9zGnlXjp+CfRudPm5GFYC8EILMJjubA7DDa/xf366h3FLwgbHKRbl7LPALWy24nBRYkqxLM75dU5USJkfePBsb41KdpnoEkaI5vDHMsSbu8HHceeK3vjlilrnLLg6L85qL77f16T70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCdMMrXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCdMMrXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A5FC4CEF7;
	Mon,  6 Apr 2026 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485309;
	bh=XUYa2AHXODnUwL+2gtS49wymmJEGg8QhpNWWbUz0fDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mCdMMrXMCaE63glUC3PQoRjNenlzBJV1SZ2AIQVxmR8JJiom0kW//1iJtNFKUfSbR
	 WL9hfkjDzD1qJeWKlddwetkCAD0dw3ZmORaDZA8t6KPTitUQ3BLlJIAOsAv/smIcI6
	 lchB/kbjP8e+9dkLeEmbcCAIfSE88BKFokS6mis0RfUaSZ49YcRpyTFAEbtrTKkurd
	 88GWj3eoxU/kQSkipFkAC0qR1lEiM8QV8Mh/UPimQRatYTdnJk0c5sSbsyUiMOLEUL
	 VaFy4JtAUPncOEQ5+Y/bMuE25B+6f9ca2M1eBVmmjDJU1u+EVzvqRuSNsrwgGgNy7Q
	 3cwi415eJxxuA==
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
Subject: [PATCH 42/53] selftests/mm: hugetlb-vmemmap: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:24 +0300
Message-ID: <20260406141735.2179309-43-rppt@kernel.org>
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

