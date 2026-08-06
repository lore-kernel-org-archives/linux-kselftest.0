Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF158145A1F
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 03:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785985796; cv=none; b=BbJx1OcUFqSnPkVZrIFZWankAR83F8kmAKBe9MdPG1wCn/MtGCNg//1iUs80neLIOJczbOvRN+izVS2Tv8DCozQuE9FkkbE2zEHmYJGP+nFI1cMtJ5cfmg0HX2rrVpGwvLncePytXnNfInqjmkR7fPbtrmor2tsi/uIcQp5WYto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785985796; c=relaxed/simple;
	bh=f1TzuK0iW0UPmJurwNMLkYETRAMu4U4AbMHSY9BBDXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eb4+ya9VUqz/inv5lmPHIjjEf7h+A/c9GK3luom1aRUFA0I+FMoe6c+C/ZVfqI/+27KfK6Zgfk9pa0e2z8RiV3G/I5ax0QOuVE7dGZstnCp4KK87yJx8XGavxWUnwLGBpJsvIxWnK9LNOACfDR5AZsrVY9FUSr/W6SrbCc8pKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I/t9pXER; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I/t9pXER"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785985792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KGF1XPlazMbD3fvAciVTTzQZg9aiCV40zzqkVikGAHY=;
	b=I/t9pXEROiekKx0lic6IfCmHNEMBjjof0TTv8RrvmVQZu8aw6ShxuroG5xT8jonEecTmAo
	plzq+OxAoiSzQtU7suOUncS8ZeGvVvsndDzw0Ru+mf2+x9B3eL5DZ063/zBnYXTxXI3bb2
	Yoy8yMK102BXhT2gcUqlX3M7+j2u9eo=
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v2] selftests/mm: Drop duplicate test_seal_mprotect_two_vma_with_gap() call
Date: Thu,  6 Aug 2026 11:08:50 +0800
Message-ID: <20260806030850.76077-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hongfu Li <lihongfu@kylinos.cn>

mseal_test main() invokes test_seal_mprotect_two_vma_with_gap() twice.
The second run repeats all assertions with no benefit. Drop the
duplicate call.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v2:
- update ksft_set_plan(88) to 87 to match the actual number of tests
  after removing the duplicate call.
- Add Reviewed-by and Acked-by tags.
---
 tools/testing/selftests/mm/mseal_test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
index 93c2e13094d4..1a05e6921fed 100644
--- a/tools/testing/selftests/mm/mseal_test.c
+++ b/tools/testing/selftests/mm/mseal_test.c
@@ -1876,7 +1876,7 @@ int main(void)
 	if (!pkey_supported())
 		ksft_print_msg("PKEY not supported\n");
 
-	ksft_set_plan(88);
+	ksft_set_plan(87);
 
 	test_seal_addseal();
 	test_seal_unmapped_start();
@@ -1913,7 +1913,6 @@ int main(void)
 	test_seal_mprotect_partial_mprotect(false);
 	test_seal_mprotect_partial_mprotect(true);
 
-	test_seal_mprotect_two_vma_with_gap();
 	test_seal_mprotect_two_vma_with_gap();
 
 	test_seal_mprotect_merge(false);
-- 
2.54.0

