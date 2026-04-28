Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BC937B00C;
	Tue, 28 Apr 2026 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409307; cv=none; b=g5NNfYf4Pjk3XhVQbsrZU8+fFmG4Aj6m18jaIgwKTo7ex14Z4FislrmHX/BJRdVHLgyIiW+1FQnKUdEVa5pj9jbuOOVfrB30kEOHudO5wAL2c+tXJ4zARxSj3HgZumReSQfdbbprHyPYbSJF8f2WW1ojpC+OpxaUMJAYHzY5A9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409307; c=relaxed/simple;
	bh=n+ynKYOhHHd3fYSwNPmEpGp3HvFkvJ4/6qKKQftdCu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbZKR3VVdFFhladX+hj8TsMo1e24Jd7JxvBGb8KINngwddbfbd7BkfbobogxJDwIa8KYgPX2t9z8KFRw3s3/mnuCFhfYVwwbeM9spQblTId7M20S6sH4o/ciESQ6xSAx/jqX5qX9xJ/ggcGmDspniTjo8fbIdwR5t4PTFuB7mV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fc5aWZvE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fc5aWZvE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF6EC2BCB3;
	Tue, 28 Apr 2026 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409307;
	bh=n+ynKYOhHHd3fYSwNPmEpGp3HvFkvJ4/6qKKQftdCu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fc5aWZvEBk/mFdR7Qscyfqp2MKP5O8O75phTbP6wzsYUc4XJeyPFoPeYDDJY/ovNH
	 PxNoUCf8AG/OD97MlUQ9Qapk2W8FXPKjrMh9ZzMHkdqfk6wXXgPLyvByH2iOViry4M
	 zuRKDV2hmkZuHCZE4CwaGcEcleWX79mzw/7xr+Fyj5MrOsL/X+VybscVk0ZiDeanov
	 smGHfx38WNEPVfxCj88X8E/SV3pbjUFLo/5upRBsIGwKMScqIdvSS+S6zugAFy+nl+
	 5ZnmcWMBoQVxOUhs62w+kdrXpWvJ04nm5MdbfBV38XBVB0LIHlVkJQ8h1keSX5xYxI
	 n7NVEV3L5oQ0w==
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
Subject: [PATCH v3 51/54] selftests/mm: va_high_addr_switch: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:37 +0300
Message-ID: <20260428204240.1924129-52-rppt@kernel.org>
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

va_high_addr_switch skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/va_high_addr_switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
index 0b69bd4b901d..e24d7ba00b44 100644
--- a/tools/testing/selftests/mm/va_high_addr_switch.c
+++ b/tools/testing/selftests/mm/va_high_addr_switch.c
@@ -325,7 +325,7 @@ int main(int argc, char **argv)
 	if (!supported_arch())
 		ksft_exit_skip("Architecture not supported\n");
 
-	if (argc == 2 && !strcmp(argv[1], "--run-hugetlb"))
+	if (hugetlb_setup_default(6))
 		run_hugetlb = true;
 
 	testcases_init();
-- 
2.53.0

