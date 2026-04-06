Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CEE384238;
	Mon,  6 Apr 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485355; cv=none; b=MWSaLbVGDFLe8Pws2KLXZH2BPEw7lxIGdf6yppP9P20SBkgDjDWw7MiIZmMGJ5ecyhSnm2rzMMjIaSpBlSY6BYJnHQivdSB3ubnNlZyPU7SUpzynCB2nM3g8Oy87S7udjGsXVMR2ff1S/JLc0P6ira+hgkFrvs80cJZ039GBlxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485355; c=relaxed/simple;
	bh=c9lUlZ2MxGuh/r9cAcf/coqCUPJYBUQSQ+lZzu+qpn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivBHec+wvXAgTVrcVgcUwERsA3Ql27aZX0kzOs9fv3LDSY8/w44L3Zq9s7181ROUC8506JJJXWA8eXXNEnGsDDO5GArIk29A5vZcfcghGyqESbPAPXzo6LLKEwK8jPAmpOtZ43eLUbcIOPluT45axE4zTYFzXHFm4g1hCdRUH2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEsblsUH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEsblsUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0CAC4CEF7;
	Mon,  6 Apr 2026 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485355;
	bh=c9lUlZ2MxGuh/r9cAcf/coqCUPJYBUQSQ+lZzu+qpn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cEsblsUH9azMAcK080g7t0QSFUTGfc0iQBF1lE3jnkjzFQa/DMnrgcwQUtQO+SuN1
	 kBF7m5lf6V37cqCz7rpVEBp6W9JgYWkZvFXO+rFlGze9jJ7t5TJU8Qm9LnhqkmiBcC
	 ntTHXQm9+5JJ4Pnw2gK/n4QZO2kzXv4Zyo4qbxciumi9G/NBYvvvjIQkWprEUEpMOF
	 Np4dS/XumqPG/6xZCq2IP6I+W/V1FkNHXRAzah/r+CTsqZZNsWUda5kZ4NWb1iXdW7
	 ufqCernM6yxBTGLRLK9YW+EGR/GSww82H5huWVykgk7zjoUYssPv7J0y58xkeMfq1K
	 zF5S++tOYandQ==
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
Subject: [PATCH 50/53] selftests/mm: va_high_addr_switch: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:32 +0300
Message-ID: <20260406141735.2179309-51-rppt@kernel.org>
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

va_high_addr_switch skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/va_high_addr_switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
index d42ad50eb2d3..4a764589f553 100644
--- a/tools/testing/selftests/mm/va_high_addr_switch.c
+++ b/tools/testing/selftests/mm/va_high_addr_switch.c
@@ -323,7 +323,7 @@ int main(int argc, char **argv)
 	if (!supported_arch())
 		ksft_exit_skip("Architecture not supported\n");
 
-	if (argc == 2 && !strcmp(argv[1], "--run-hugetlb"))
+	if (hugetlb_setup_default(6))
 		run_hugetlb = true;
 
 	testcases_init();
-- 
2.53.0

