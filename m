Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B64A35;
	Tue, 28 Apr 2026 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409241; cv=none; b=DIXsT7FAQp/jM7gBe84O1PCC3psQO/lM1xm9WIHa7gc+LIXZbDbvj/gbMmjYdx8DuxOg5gUFhZ4r6l4mDGDI98jezh7FPCEhWLWoMgu7BH2iSgvKuSO8u0sl6jw09PRh15K3qkPEqT+SU+8VOi69WrZqz4YIchdyIu/lnquFnig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409241; c=relaxed/simple;
	bh=V9dhOZl4qkCAKpS16UITNdHC3hzDFxj10poJSetGe5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYQjnJL625gt6RKp7QZK3W9qn/ufNx12GDXLKrMF3WNy+DuHzFh25RiaJo2QL9xKQUOqdFwdgypwJJpcEcR9u65BopmRz9zNal/L80ziRCyFu4xyd9MYnMNtbrZPPHTqElFT34Fiq2GgK49LOqYXHxunepW3361/KWfGWqYHL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMV9bb2z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMV9bb2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6A9C2BCC4;
	Tue, 28 Apr 2026 20:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409241;
	bh=V9dhOZl4qkCAKpS16UITNdHC3hzDFxj10poJSetGe5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DMV9bb2zu8GSXHA7ukg/OlvB5BQkbNZuTTEBICiE7WqAdpr/W9GQW1X6W/Q8iMxG5
	 Iq8bqnlt/UNTLPSvDHk5hMP3i5vF8kLy93Y1rKY46Vmmh9ALvtbkT3VQ3q+1yutp2T
	 y/dOziXrr3AlbCwSzOlKMdkqYAVZRWOJWXopEBpdgK25NZmC94qVPMb/tY2uc70R9D
	 SMw2NJaOy6nRiUKbIpnBbHbB5OdIauJNYcgUS3v1Q9wEWLXBXZkjEZbi40uQTE390i
	 9bo+M2uolmyGuMCQOsLX7QF6anNDNywpN2xNgEbcS20hmo/INUx8E8alTDo67TtDEo
	 /SDmsdNw/Nsmg==
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
Subject: [PATCH v3 41/54] selftests/mm: hugetlb-shm: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:27 +0300
Message-ID: <20260428204240.1924129-42-rppt@kernel.org>
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

hugetlb-shm test fails if there are no free huge pages prepared by a
wrapper script and shm liimts in proc are too low.

Add setup of HugeTLB pages and shm limits to the test and make sure that
the original settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-shm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-shm.c b/tools/testing/selftests/mm/hugetlb-shm.c
index 0f70b1a50b6b..7b5a5cefe458 100644
--- a/tools/testing/selftests/mm/hugetlb-shm.c
+++ b/tools/testing/selftests/mm/hugetlb-shm.c
@@ -29,9 +29,24 @@
 #include <sys/mman.h>
 
 #include "vm_util.h"
+#include "hugepage_settings.h"
 
 #define LENGTH (256UL*1024*1024)
 
+static void prepare(void)
+{
+	unsigned long length, hugepage_size, nr;
+
+	hugepage_size = default_huge_page_size();
+	length = (LENGTH + hugepage_size) & ~(hugepage_size - 1);
+	nr = length / hugepage_size;
+
+	if (!hugetlb_setup_default(nr))
+		ksft_exit_skip("Not enough free huge pages\n");
+
+	shm_limits_prepare(length);
+}
+
 int main(void)
 {
 	int shmid;
@@ -41,6 +56,8 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(1);
 
+	prepare();
+
 	shmid = shmget(2, LENGTH, SHM_HUGETLB | IPC_CREAT | SHM_R | SHM_W);
 	if (shmid < 0)
 		ksft_exit_fail_perror("shmget");
@@ -78,3 +95,5 @@ int main(void)
 	ksft_test_result_pass("hugepage using SysV shmget/shmat\n");
 	ksft_finished();
 }
+
+SHM_LIMITS_RESTORE()
-- 
2.53.0

