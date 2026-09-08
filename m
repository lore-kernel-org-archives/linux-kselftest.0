Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEDD5437F7;
	Tue,  8 Sep 2026 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871885; cv=none; b=ZdZkjUfr5tJCgjSaeYlFJiSyPvX5qmsq1u7jiJy+ocR8cbDnmbeiERr4MQK/gdb4VW2e//LFOuJ66fCXGeLwP6++3iS7U3VCqNeK5wh4AAFTapvrnND9AjZuO9uNLO5esAVNKnINLQh7LjnMZNHWL/4rwbLp7C48PVmrQVeJxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871885; c=relaxed/simple;
	bh=G3NYtLn1ZFmHTazdJtjkQt78Q3z19clqXZu643CVfnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+ZeD5/h9slyLP3IaRprJkXH7Xj9YM7GszVuEhJuTVAUfT3ikVnzStgXXt7MNEzb8d6c0GAajVv8sRx1mduj/w6juxJke+huiCxOjfI3mQ7kp2EQ+RdMeJCCyFiKsdw72PmJdsq7vcZ4AHukxEKyS40vyaOT9ygESgYMLXTbux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=OHlOW9Fo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D+TmJw7y; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="OHlOW9Fo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D+TmJw7y"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3B58F14000A1;
	Tue,  8 Sep 2026 08:51:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 08 Sep 2026 08:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871883; x=
	1788958283; bh=2NXsxc1jX9htzyVHYrKvKVtGcWKt3qidVIHJ/7B4Lgg=; b=O
	HlOW9FoPmv5SmA7W/80F/F5LXr0PBqsP2hgc7nWPGmTkhwme5n9kcJQTZQWhGAZm
	NphFC0KfvpsskTgU3LcpKTc5yXy3eM5qUwvDIz93gMxS1ZptIKnlKt1r9nA+UqM9
	9PNfKTzCaNJIx5pamHDHEAixJiiIffpdsjf5zvZCC8elihH72G38TnenqmuNmE4e
	8fJxbTE+Y0iYRbWRXZPHV2NkzaRPNF4BaOahYyKILb8vCzC0ppFy/iWk2tEk34Dn
	Ka+JbhqPhHm+hxzy3vgSNfd2+stVMTbyGPC5UVck2SLW54nLToYS6tL3CUTfrrA3
	lSpEjketdIgfSeuQGa7VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871883; x=1788958283; bh=2
	NXsxc1jX9htzyVHYrKvKVtGcWKt3qidVIHJ/7B4Lgg=; b=D+TmJw7yA9/y4DV9N
	iA1tBh9DIBHlfyIXtkM3me0AMveeoaXnNqmsAs/9i/6Sfsvyx8T2jdcxP+Fk4v9o
	wg/ISd+LfEKf9bXtoumvY/iBBqQSx0ck2r3GUBIOQCFRYQXsqzcf1S8cesAWkQZg
	VbOeI1XcvwMKIVtw+BkcXfoDur/irHh8QG8sf008n9kh5QSKUIwGXp1lz2PNBzKR
	/CLYZV0tGV/rK3VgOS9qd1ZpMl4qrLzH7rq1Kd5ljsroKGG66IPq+81ub5/SJ1H/
	DGSfPDKw3phNrdPlhS7AKctzkjo8F0N5yRPJsBDWMLLdGZP8zub8XBNlkUXc7o1b
	sJ8FA==
X-ME-Sender: <xms:ywSgasvYORdrMqcnTkprEQe5UZXWVbhzcy6TlIsdoC5WFx1OKaY-mA>
    <xme:ywSgah1J0Cvl6SPnY0ubwW2kDCTR9ZNPriJtRlm-05ML5GxZd1tfpY_HSF-xAe18T
    TtyhqJ2BQWFObQ7FnbgCgmNth4AyfJWosp74e4cZKYh0EoTWNHifUHH>
X-ME-Received: <xmr:ywSgap-H34DLJTODeTo3yRjo2eselhRizeZF6AxAMsNbky2q08n7hWqW29I>
X-ME-Proxy-Cause: dmFkZTGuvEMc9jYu2f0uyTmUF7l0J7NybVdULRlrJFmokmmiolg4yH1+7h97U05D2w+OYm
    AZhWoHmMPT2EsIB4AC7PxRFoqN+CF4x8etMK41ayTMd5Tw55ZxqvSYpb69cNUy0p/dfOGv
    05P0JRk7g5kt5eTL1k2cO9e1oUb7lrROdNyUSbigYjG7Zs/tNKx+L8+9HHw+CSw5cJpWIQ
    j2DrX13NeCZvnLN36sWkEk/U0EX1Q1izKAtzdjMuXhus4PGMhEw3kJKafKZkgCRsnWRxXR
    Wv8osDa5aTh9mnjCTFnYcP83hQ8y7tmPYrDENim+Q79mFJR5sJUGN5QsCu80CUB5y6e4FH
    2bU7+Z1C/ZBs95vtrfpBNs3fYgoa7TxgB+J4T7MnHULHrY3HKy5QG/NyXdQGKctluDNtCm
    eUSUl24PKe5TOi4Wa1oA5GZOBNaqq1b2z6QzlJFEwTl91ijbDGpXvkkxpFJrcPnfTBVpYW
    vpt2cD2n1OIRqQX2pWGGJvnOGq0XehYPEkvO5cytepuAkFC8GzVmHHsqDR4n6jxIbiOSas
    P8shOONYnFFmhKFTvYk0yuitB8jX1e3akpUlI7nPOk8xH2k9LKejsDXNuk55xKtVw3PPpF
    j2m99WZGHOkyNmkBh5fGqyj4Blnx9BI5f988Vuyw1L+IHdDSNxVej40fvDFg
X-ME-Proxy: <xmx:ywSganDK94xyQxDZLTrtveqKO_Ktl67yQur5yvXbolXkz-VxUEDr8A>
    <xmx:ywSgavA6c64D7xzaJJuZmc0aF8oxsJxWCFCxpYQc_evdNfV5zrpzgg>
    <xmx:ywSganIXU4ezER-BV3D8iXAN-C45pQ8RVEvc0V5sCmceftvIOIwbKQ>
    <xmx:ywSgapQRe2IKIT-GY17GywJPdjUv5oVu3xOFWoIzrSbjUizmRMtOEw>
    <xmx:ywSgatcOGnuYHwQ0lpHlwd9TF5wDeUgwV3H4sjNIoFZnY0OFVQfhCVTq>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:22 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	rppt@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	usama.anjum@arm.com,
	usama.arif@linux.dev,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ziy@nvidia.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	agordeev@linux.ibm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v5 06/19] selftests/mm: stop khugepaged during the MADV_COLLAPSE cases
Date: Tue,  8 Sep 2026 13:50:52 +0100
Message-ID: <20260908125105.1510704-7-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908125105.1510704-1-kirill@shutemov.name>
References: <20260908125105.1510704-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

__madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
It clears the global controls only, which is no longer enough.  A per-order
control overrides them, and -s, which makes the cases fault in folios of
one order, leaves that order's control at "always".  khugepaged then
collapses the very range the case is working on, and the case fails on a
collapse that was interfered with rather than refused.

Clear the per-order controls too, setting them to "inherit" rather than
"never": khugepaged honours the global never and stays out, while
MADV_COLLAPSE on shmem still finds an order to build.

Fixes: 9f0704eae8a4 ("selftests/mm/khugepaged: enlighten for multi-size THP")
Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 398430c33872..e9bc8fe8a1f8 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -533,8 +533,8 @@ static bool is_anon(struct mem_ops *ops)
 static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
 			       struct mem_ops *ops, bool expect)
 {
-	int ret;
 	struct thp_settings settings = *thp_current_settings();
+	int ret, i;
 
 	ksft_print_msg("%s...", msg);
 
@@ -547,9 +547,16 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
 	/*
 	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
 	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
+	 *
+	 * "inherit" rather than "never" so that MADV_COLLAPSE on shmem still
+	 * finds an order to build.
 	 */
 	settings.thp_enabled = THP_NEVER;
 	settings.shmem_enabled = SHMEM_NEVER;
+	for (i = 0; i < NR_ORDERS; i++) {
+		settings.hugepages[i].enabled = THP_INHERIT;
+		settings.shmem_hugepages[i].enabled = SHMEM_INHERIT;
+	}
 	thp_push_settings(&settings);
 
 	/* Clear VM_NOHUGEPAGE */
-- 
2.54.0

