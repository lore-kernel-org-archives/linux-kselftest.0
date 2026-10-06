Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22323B7B70;
	Tue,  6 Oct 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278762; cv=none; b=hlfNoR6pMFXx5TFt2zR8nxpJztM59rSaf7/yvLNRzAYCIWhk35dtX8GOnKEZVjJ5dN1A5BSLT69cxSXl9SSfslT1GNYP2VbI5R/oVc/1W1O3tJwEAVO2+HRoHCgWKto+6+bqTD/Z1sDMLvaUVsLj31MIKrsgKr158z6xU/yNYkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278762; c=relaxed/simple;
	bh=TqLTLymmXqYCd3I/aSuR0jmggCPMmQLFXTRnUZ8RzAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgR1aqLpZL4WemR71sp5IQWSEmcP/4HUTERpV5LLx8i5Ovdj4DovC1QatAd2Asvss3gtzJMDgLfbldgQZSCAr75L8TgD94G1fhAs4CUMST0XqR3vr4UdjxbeZAR1sKG8NrgIvKM/aa3dbi4375iUIM9d2/OwXz7zbDIk3kYo4Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q+5nLD2+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q+5nLD2+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D83F71477;
	Tue,  6 Oct 2026 02:25:55 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9E133F763;
	Tue,  6 Oct 2026 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278759; bh=TqLTLymmXqYCd3I/aSuR0jmggCPMmQLFXTRnUZ8RzAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q+5nLD2+CaHswKy8Q0jkFjHFatSH5ixPnA4F+mduwMe3/DMzDMxUK09CHotGG+eaE
	 ewhENlYHW2Wx7lnSVWEYiZYH9hcCaqM7tRcLJEUixUylaW/XXtN0GAHoV3JBrVxv+g
	 zqig60IaUN9quG0EYc92SFWhRPhHVDhHu/SLpO8k=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	jhubbard@nvidia.com,
	kaleshsingh@google.com,
	anshuman.khandual@arm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v2 07/12] selftests/mm: mremap_test: fail on data corruption
Date: Tue,  6 Oct 2026 14:55:06 +0530
Message-ID: <20261006092511.145776-8-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006092511.145776-1-sarthak.sharma@arm.com>
References: <20261006092511.145776-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mremap_move_multiple_vmas_split(), if data is corrupted
after mremap, the control jumps to cleanup without marking
the test as failed.

Set success to false before moving to cleanup.

Fixes: 7d6597dfef11 ("tools/testing/selftests: explicitly test split multi VMA mremap move")
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 1baf6374ec67..833efa85e5c6 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -682,6 +682,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 			if (chr != buf[j]) {
 				ksft_print_msg("page %d offset %d corrupted, expected %d got %d\n",
 					       i, j, chr, buf[j]);
+				success = false;
 				goto out_unmap;
 			}
 		}
-- 
2.53.0

