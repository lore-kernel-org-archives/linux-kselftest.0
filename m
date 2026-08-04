Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973B3E49F5
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 06:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785824707; cv=none; b=YFKphWm6O+UbQjfzCflB3J+G9s8n+Sp6Q1dKdLSmqwW7CbYaIjRoFLnJcBWU1fc1uushQsxqZ4AgiC/tXsNdIEmS1NenfBFg1ltYzfDcjFPQM046T1YgeokT3lTJenmeC8V2mZKtAva5IAzzUa3mY2ZFiyD84jv8kOFTecN4+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785824707; c=relaxed/simple;
	bh=TUf08lhG+3MtPTREPf29aRbGI+iz6NojS1y472zudwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SalMgpWly6kXVjwGAbpbo0ifIGUW4pJUr0itM3YPDtRTaCWFAnpM+OF0XF02ynE2zjumkPbGY5RlYr8194QHQxqelQzKbCBP1pVsDu85DfGuGa5JRnHVITzhNd5j1zVQz4eJ1IWWUA3XOXpqboztiPGbjTT9NCreP/fPCf8X8Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W+rLSiNR; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W+rLSiNR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785824703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kg+L1a3DM5SlstyUAqkKEApUbY0lInbikPsf+R2gm0c=;
	b=W+rLSiNRsJ0iTsrYNYa7qqUtKkG0KeJRF/g3Xidjtx2peGr8+mn7/9/feAT3Lgp7esr+MQ
	w8SPRucO8iMVENPzs+r+mL4yR0Sf91yyotI5MhdYgUZ/M7HynIIE8V3Y+n4CmwJarLkxtf
	PcSI4ZHGH60pSfnoyd04UcrrwRowH7A=
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
Subject: [PATCH] selftests/mm: Drop duplicate test_seal_mprotect_two_vma_with_gap() call
Date: Tue,  4 Aug 2026 14:24:40 +0800
Message-ID: <20260804062440.58666-1-hongfu.li@linux.dev>
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
---
 tools/testing/selftests/mm/mseal_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
index 93c2e13094d4..babc217d9dc9 100644
--- a/tools/testing/selftests/mm/mseal_test.c
+++ b/tools/testing/selftests/mm/mseal_test.c
@@ -1913,7 +1913,6 @@ int main(void)
 	test_seal_mprotect_partial_mprotect(false);
 	test_seal_mprotect_partial_mprotect(true);
 
-	test_seal_mprotect_two_vma_with_gap();
 	test_seal_mprotect_two_vma_with_gap();
 
 	test_seal_mprotect_merge(false);
-- 
2.54.0

