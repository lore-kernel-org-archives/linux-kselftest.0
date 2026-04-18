Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D4D35DA78;
	Sat, 18 Apr 2026 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510057; cv=none; b=bDIOIt0+MYDbl8M8GEOBPU+DwdEmUJf5w/1wVkdJrXYk7FvKmm+wPx7gg31pLTWRue+2Pv3qeIxf6kXDbx/io3xRlArPAmbbKm6FSQSzXqx4k2FHz445NFdz6wxvFT3BT1apM5Ck/38laCQ3LOsiKwYNQEUgDz5Th3dvn98N/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510057; c=relaxed/simple;
	bh=c9lUlZ2MxGuh/r9cAcf/coqCUPJYBUQSQ+lZzu+qpn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjEwLnm7MNVfkWyarVMl+u2AbuTGjLaUVcxpbC9vgwrhOhhOcVGjXiralnmBqTDSY4xYK2DL333yJeQrW5CTDgOnXVw7CBW4sLQXfiFGIgD5Tpe801y4eRyvZTivEY8BQSZfUo+Qg7HvX3IRspzCAHFzRAZA5w1qG/ozfLbzdcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUeH0vhQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUeH0vhQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E2DC2BCB3;
	Sat, 18 Apr 2026 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776510056;
	bh=c9lUlZ2MxGuh/r9cAcf/coqCUPJYBUQSQ+lZzu+qpn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WUeH0vhQ4wYCu+ObVSff+bmAECrRgoug8pM3MKV3tqp8eTn0Kx7G8Rcm6EmJlbrLh
	 XPSRHVm0MLAIdd7HUZ/PwrFAJAJGTngALMhyrSzNhwmrTmKgtx3AjYeFxdoik6+p0j
	 p0rcXf9P98z2pi/R0z/K6UhgexZada2bgYHp0G+BRQwy75BoGXWsemnu0xbcVFXsBz
	 SX9HCnfxD9PeJgX6oWilJIurP0m31yaMbYXDT4944ZyOhT3YtANKTGvSoNlwe8Rz3w
	 qqq4bALUH+OJRYdykeH9wKaV5rj5I9jwk6dtSN2wfBaILjOpYBizpggY9XGB1l1n53
	 wOB+ZDS11Z1VQ==
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
Subject: [PATCH v2 50/53] selftests/mm: va_high_addr_switch: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:35 +0300
Message-ID: <20260418105539.1261536-51-rppt@kernel.org>
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

