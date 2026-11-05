Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899085;
	b=oTyHKnoRe2etFgmnzjyvuL/L1UjVTsFtTEhm1fYWfs/dHxISK8t7Ao05qLZNs67R8LKS
	 UxEkHOqMI64WG0JQHEYk4Jto+4RIm4aSYMcn67xPyQH7awajQMUvHB2t0Ie+d+wcgJ/qe
	 PWZezGb8Hk86uDuQlkc9AE330Q3Ixnp64HlIsdBPjMB3vWgpoWRxkq8h9CJg1UmeNhYsD
	 lXczzTJX5TDT3j2Fb0O4SAjuXt9k6iGUcc2tILSSvIVcTya24eUz9kz6CMoNDmwRnAWpl
	 UDT8Rmk/CtrxPqbesV4X31FAryKLLhfwuWA1dnWIIsOYdqKyIn+zokXgqpk1VoBPLwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899085;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cnrI57QF8Fc5FVL2hKHHxcPlXuuT1mdxMhbpS4reWKA=;
	b=vHIeR7Cb7OLcmLXLPR9airt7lrN00H3ISMduK37FkeDtHHcOFOajm1edLwQtErUn/A9v
	 GauEWRdT9T1p24FFHcMjoKH9ujkfMNbSLDs9TJMPL49+yIifHQC5fww4s3bJkKbjgTbzQ
	 4LeXahAW/Yu+YkTfqGgR7mQALsQNkv7Z5Sm/SDZDXmH7AnCM/t8Ur9X27ZsMCuF4rDRMt
	 OJRpe2aQ2i4Nl+1kHXpOrgoV+LHNKndlFB05FKruGsH2x+ncyCVRpp9KdQgw0tWEbKOK/
	 PSLwkPVC+X3ZbHx7heQpGWxfOiAGp7s7fGIYGHGxiu24J8E3dHw5AX6dsa2PxVua6Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9O2G8Yz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2F760A6F4F;
	Thu,  5 Nov 2026 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9O2G8Yz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5681F00A16;
	Thu,  5 Nov 2026 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899084;
	bh=cnrI57QF8Fc5FVL2hKHHxcPlXuuT1mdxMhbpS4reWKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K9O2G8YzRnYSIuxoW620dpj0bwh2tsHqX6Q6mq9Aa9yqXIBDoh3pqyBDD1QhJyabn
	 uXNtwhGZHZge4HH2lwIJ0LEaxGiKbCcB/tPLNiPYmqMIYSOi9d65AVJA+SgWSvSuvx
	 WZ7tA4QXTnpROLoVyKInfLQi6NwI73FKb/m/SLwlyxEJ6EyJyZbzgShjvVH6CaTo2T
	 0ouR1dLrPKVvnya415WLSD7KYfGmQacuH2LC6Mz3WKRZ2Jmp420gYP/N3kHvmbLiaw
	 abMwxm+neuwWqd2RQ8aUdwdaanflIF4cdWPXeCJAYy63QbElg0aRm+RmUWfJobURT5
	 I708fgiz3cOFQ==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: add CONFIG_DEBUG_FS to the config fragment
Date: Thu,  5 Nov 2026 12:18:01 -0500
Message-ID: <20261105171801.2189772-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4B926B36-D797-4861-B6D6-27E8D7870287@nvidia.com>
References: <20261105030242.1241448-1-sashal@kernel.org> <4B926B36-D797-4861-B6D6-27E8D7870287@nvidia.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The split_huge_page and gup tests need debugfs, and CONFIG_GUP_TEST
depends on it. Add CONFIG_DEBUG_FS=y to the fragment.

Suggested-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Merged into an x86_64 tinyconfig, the fragment leaves CONFIG_DEBUG_FS
and CONFIG_GUP_TEST unset without this change and sets both with it.
x86_64_defconfig already has CONFIG_DEBUG_FS=y and is unaffected.

 tools/testing/selftests/mm/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/config b/tools/testing/selftests/mm/config
index 06f78bd232e2e..ff85b358d04cc 100644
--- a/tools/testing/selftests/mm/config
+++ b/tools/testing/selftests/mm/config
@@ -4,6 +4,7 @@ CONFIG_PTE_MARKER_UFFD_WP=y
 CONFIG_TEST_VMALLOC=m
 CONFIG_DEVICE_PRIVATE=y
 CONFIG_TEST_HMM=m
+CONFIG_DEBUG_FS=y
 CONFIG_GUP_TEST=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_MEM_SOFT_DIRTY=y

base-commit: dba8aba0a9a00ff781c03d82ae534fc6f8c2e263
-- 
2.53.0

