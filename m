Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613791;
	b=VsefhkoqlXVsoOeY1XMkB/sTKm7qcXrz2bDloTaryAIvx63agRD+J/Z8gU00kcbLsRVl
	 DcGVnBqnwFMnlPW/ZY82t4FlkIL5KE2R6hilFVp4GcS8cxfD2rmKGXtKNc1jzMbjixS+4
	 G1+KqiAuq2agoP9h6jSEVgar748c/y2iE7I0cE68FPUEFQ4CckcwtshC7Y4OT6girOTa6
	 4EtAHXIC1HjAEiHgb/gP2Ya9kRDxoAjulIbmfCIWgVwLcK/SD9YML3aMIfIn3cXJ12/wO
	 eTm0uYNzcAJBw9ldWZ4uAn8fYd/EtHEgAic540xKvHLMNc+BMq07v37AZyscC2u5rhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613791;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rLJl7tHYyqsVSgJSXnHYKfYb9YBDkTE3x4o0OFxJB80=;
	b=28lGysctDDrS0mDBTZ4ZhGBTnEhx+7EcRsxcmletI+9WjSJ+5rh8g5/OWOcSItpQFSXK
	 2r6v9l1Pcax0h2sjApL4OcPat1YQ1au4Tb/E7RxiBoVdjZukN7t2uLIuJSxBwSBvHU4LN
	 dXIrqfeXDwbiSxqOL3p+u+baOyqPS+VeYUBFkZ3uSL/yKV0hvO9Jj3MODA+9Zobq2Pn2C
	 1MniZ7nHPkTVe/KsgA1ISR2854PoA0WeJRpKS8kuvvhqmn7xeLzjR84VAMZhDym7lciiW
	 ieteeGgslp4C90eMFWW2iL50AeIhWvB3BjpwKjpTH6933ZM8ayPv1S6HdLBpWs0jS7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oggoNVE6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E28606A33A;
	Mon,  2 Nov 2026 10:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E28606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oggoNVE6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFD091595;
	Mon,  2 Nov 2026 02:03:06 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF27A3F59E;
	Mon,  2 Nov 2026 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613789; bh=Ttm1dj3xog/EvYXD/stjuLByL8Zq1uoI6O1kDGbtgtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oggoNVE6OH8ZVyjaORu56ojOIc7H2HalRvRCwF1lc/mszQIGr54aqpVWoafQK7Q64
	 qCbGMlcvoXcAhVVF5ag1kfEl4NmFfFErsUZQlDIO9q8ykht5ySflRmZ4I0n9Iuuy8T
	 q1YnX9BvChetLyjCE3qCAuRqhDQt40UM2pogpwOw=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Park Tae-sun <ts930@dgu.ac.kr>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH RESEND v2 05/12] selftests/mm: mremap_test: skip test when userfaultfd is unavailable
Date: Mon,  2 Nov 2026 15:32:04 +0530
Message-ID: <20261102100211.141831-6-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102100211.141831-1-sarthak.sharma@arm.com>
References: <20261102100211.141831-1-sarthak.sharma@arm.com>
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

The userfaultfd syscall can return ENOSYS even when __NR_userfaultfd is
defined by the architecture headers, for example when the kernel is
built without CONFIG_USERFAULTFD. The test currently skips for EPERM
when the caller lacks permission to use userfaultfd but treats
ENOSYS as a failure.

Handle ENOSYS like EPERM and skip the mremap_move_multi_invalid_vmas()
test when userfaultfd syscall is not implemented.

Fixes: 742d3663a577 ("selftests/mm: add test for invalid multi VMA operations")
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 453606b3154e..5b3ab12c2207 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -711,7 +711,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 
 	uffd = syscall(__NR_userfaultfd, O_NONBLOCK);
 	if (uffd == -1) {
-		if (errno == EPERM) {
+		if (errno == EPERM || errno == ENOSYS) {
 			ksft_test_result_skip("%s - missing uffd\n", test_name);
 			return;
 		}
-- 
2.53.0

