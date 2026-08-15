Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922221C84BB;
	Sat, 15 Aug 2026 01:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759152; cv=none; b=Lmtw1R1Hdw5JVQfN89T+ull3T4NKaLfJc5VwNXX0X3MYgu1wqJMU35Lacn0pSfaZvttUzXYJ+XDB0Lk3ixcPHj3rgcDYoAecakQs6bUpfZQOisdJvT8JMeGZivAMAudHBI6/jLYh58oE8O726f3S66xaksKpODJN//9HBmRj68A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759152; c=relaxed/simple;
	bh=yZPs9aFWHZjbXOkRvX67/dIHGI0NCldpZ6X6TIYwKhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbiFHsNHK0SiwBcmCqZUJxs2zuxDQvBIIbmgWYGbjRDyG5pR4h5WUbGjoUVJ9/saljMNqHoq0UwE95viWgw4l1mJA776SWKjwRru9LCD6yuNOaBWmO97V/cR/ZiO6e7iAOXBryA7M3SzhketwNCEx8lAuFzxOssSOMK2P76/Mbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ZgG47TsU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EOH9+raa; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ZgG47TsU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EOH9+raa"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9617F14000DB;
	Fri, 14 Aug 2026 21:59:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 14 Aug 2026 21:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759149; x=
	1786845549; bh=zex4bQI/K2jisTXcoQfqqVox+onfSYGfs1VVhpIHxHY=; b=Z
	gG47TsUXDc74J69BdsHiaAZ20D9iw7bshmUv1PeRXCFvYTNzdErF8Ps8KU+XK1ct
	qLY/zKY70LAQCU8YnvxCZzMaCO7wI4DyqiZYNfzm6D2yOQ/+tF1Wm9NPoyRoVZWc
	TERtXHpx/6wnE/S6A84QIerMPR4g47FL1SKYl8BE65Zn7cvlRWyOLlLaNsf9AC3K
	0pno4FyKRKyrHLjfexndPrF7HKYHUSfTkRcXu6Pfn753ecWpiOsrgbmPZaBly/mF
	03sXxGMhoy2Jlirnm7TS3y4hEtcGbDSOo3lt7ikRaEKj213yNAXEQMRx4FmdrX6F
	VnsCJUp1SyGp7x6mJRpLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759149; x=1786845549; bh=z
	ex4bQI/K2jisTXcoQfqqVox+onfSYGfs1VVhpIHxHY=; b=EOH9+raail+Gpppe3
	MTz5no349gPpJZHFYC02c+VJXQQlye/7oZHMjWtxwrTgyVJnhc4sQ5bAc3ESM5e0
	QxHWeT7xjmLnXk0dxtWCKGQb+TgGirMOT7Pih/UXQleMRLYAdyKMwDUegknPtJeb
	QP0tRMARucpNNOysGSRswuVN5zDxqgo6l4v6HiYP7rxqKOkJhixPKgg29Ao7Hrce
	B6bog9SZNzkLlJnrw7Vjtznr1Q35tA3AGyyAONl7Kvedb4FQzbtz4hkv+sIBhbwf
	cnpkT2pASLFbOcs6F9a3TJ3E+IGZ7TjLNF0Fpn8AnfSVFpE76QmkSqOCbCVP2bMb
	twauA==
X-ME-Sender: <xms:7Md_as2mStMxPg65qSKJFpOMRm-PtK_PB8J1T3HXJGV_DOhyu1KgjQ>
    <xme:7Md_arB6y2HOkqicze7GCE2eF-mp84FZBUKB-4C_o74yYbA9_li0ztBGScaJ4zljw
    6CzhQGvuRG2bMm9ZF1sN9_tRz8w0DpmK_zDJITzMV5lx9ktn1ZtABg>
X-ME-Received: <xmr:7Md_atac2nbYPOnql3I-MvKZIRziGRWPEZF5qbEqLTygkNE1y8IJ8SNnAcg>
X-ME-Proxy-Cause: dmFkZTEYpEQiBdLKlCaLp317TOYqYwO99jnuX4YrBujo3RuW+IIGXdYj4qE1ezcGRvbtOZ
    hc7RfnfkdlTehb5Dkvk4VZTcyRAqm2CcEjaldkIQshIttrB2HSeWyAKQfsR+ykmymFv8qO
    aC/+wh3joJiQccaWn5NjVrqLVVMYdoVO37A5ZL6SnR75seJlCquk1NTOiA0EvXHIVSJ25Q
    iFONSccd/wEzNfQZlOvvQQf5bCKiGIALXd0Rd37Vcnrh56q8DfWwmvEu2ZgBGSMa525iaP
    HkMF5MKO3LDiNiHXJVHjo5f/L4XJttiAOfdXhljkaHgZI649okv5M81/eeF8HfhCZr1Ucq
    SUpY4/UrUyKSVyvxdWdkzRcAxLXEajvkyHarmVKmBKmPh2QSdP0hn98URAdd5ulxcsE/oG
    HExvPs8wbd4/c1OD0GCTIQk37WW10K4nncE94L1KpyMGnmEpXO+avOn6/IhVBaxW9RvQIk
    /IEopIoH4a7oK/nS/pMUtNzIIK2N6EUUROvpKfw2YEamJAq1mzV1j85eudJuXLlCj1ymCl
    DfwOdwHrJDFbVLGOJX9Pbb/kjXnvRCmFZ0bK8vCEtFQTadr9Mdf2cu+dpzUjrEqRyPJWN5
    9kzVnnSKnSddmpbT6pvKRYBGeu90PJNZYVPIn+RtVt6DI1aCGz7rLsIxrSwA
X-ME-Proxy: <xmx:7Md_avYbIZ_tcTk791L9dCnJVB6dp6y2GJRsuDlBretg9eCNLBuTVQ>
    <xmx:7Md_amk-yGmxJaUnPN8QOBhwhHViq8ogEFcXbzK1OLFOPQkGRg-EiQ>
    <xmx:7Md_apT6aYiGB2yGN_W64WyfArJbxfbOsxLlxhtzN-wynyTFd_2s3w>
    <xmx:7Md_ajXPofTL4n0xHrKp79wH_R3Qctniveb46GcpAHKk_l2SIiV5zA>
    <xmx:7cd_avUNW6SHB1b65HYKyaCKTDcUi4N0ibrPhvjEtFGnHAxieyKALhWV>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:07 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	usama.anjum@arm.com,
	agordeev@linux.ibm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org
Subject: [PATCH v4 01/19] selftests/mm: raise the khugepaged test-case cap
Date: Sat, 15 Aug 2026 02:58:43 +0100
Message-ID: <20260815015901.1236937-2-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815015901.1236937-1-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

TEST() ends the run with "MAX_TEST_CASES is too small" when the table
fills, and the table holds 64.  A full invocation already registers 63, so
the next case added anywhere aborts the whole suite before a single test
runs.

Raise the cap to 256.  The table is a static array of small structs, so the
room costs nothing worth counting.

Assisted-by: Claude-Code:claude-opus-5
Acked-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index d3a53673e1f9..6cfec2b940ac 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1290,7 +1290,7 @@ struct test_case {
 	test_fn fn;
 };
 
-#define MAX_TEST_CASES 64
+#define MAX_TEST_CASES 256
 static struct test_case test_cases[MAX_TEST_CASES];
 static int nr_test_cases;
 
-- 
2.54.0

