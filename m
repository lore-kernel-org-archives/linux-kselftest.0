Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC047277C;
	Fri,  7 Aug 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102645; cv=none; b=dI/xOIC20d255VX7yQ2qygxB93KTNu3lI4uopy5nhh+n8EPHkFFEb+h1neIt0SCdm560Yts7aQkmmUYx4QLPF6RNNzAq7zruPItMwoCfNl3N0qw64wbb2PG/VD8Pr9aRXEwh1ZVcZA7G039mrvQ403ekB4zxVEu7zO6vdxF8seY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102645; c=relaxed/simple;
	bh=fQMu5pxtI/bJpziVuI0v74HoxYFXAO5iWBBgu6Q5DIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOei/m4fbxr8H50JN2C9Z2voODDcucDnhBuSPcjV5zIv3DSmeh8aJE5kAFNJlYneSIcvkeJqIiEUKBhKEdp1qhTG+ieMP22N12PZT/EfwubGPeTf00p/hxZqDUrfQ9J9xq/MKgh1f+/GSA9DsgHjze4jq/TPsMHfkZByv098TYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=u0KIY31K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JmtyROkD; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="u0KIY31K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JmtyROkD"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 1031D1D00082;
	Fri,  7 Aug 2026 07:37:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 07 Aug 2026 07:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102638; x=
	1786189038; bh=AJEIXCOdsK1VdJ+vTB/+b5PTVsVX+FRzDaAsHSTP7IA=; b=u
	0KIY31KUUaa8liCCu9KTgWbh9RLdB7yGDqhdRba/oqA6EqTFBxivp+GvevkcPGp0
	R7V96Ts6E2FSICBk9yItN3plLUxEtbnEYAszGtb28aIN3a4KRsbNKey4OyOrzrtT
	ghye5sOpszFtcxAcAbtiS6IvNp4WR/JlkaEbDJE3vSfnP93AXAZZ4GdVs7oegEF8
	wMxw+4ThCksvj/qsuB5XTEcuMWxYwswDltDOgReov9DVWCKuC/7wzU7yg+7vKi0n
	IZZrh+TXpx0aYbgG9toGyGeh6XLRXAnyPFFXUkr+e1G1NiSot07Ul4p1lf9m1GeG
	XULBL17L3EzhN2w+bMk5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102638; x=1786189038; bh=A
	JEIXCOdsK1VdJ+vTB/+b5PTVsVX+FRzDaAsHSTP7IA=; b=JmtyROkD4PTSKr6Ym
	7sg+dQQSTmcCqEp4Ml+Q8hQb8UgYCm9848RuqaVbWsV7UUih68O//+dnchC1G9zO
	Gjyd6YDThoDcmz1PmrMtCOC1aTJ7zUQUyjbBM23kvrKKgrIZgVfRFLAhn0Fz1zHP
	i+dvA9zf3sa+wRbMWwEG0wiQvY1iigRzyidsVG+zmFC346d35R7ZyaFmFrOREJfe
	KPa3+ug4bZGLhNEAjRHj80VoD4TbcvGRd1TeiqU8ctCD7nbuP/9xC1Pz91ogmMsO
	PjRGeeg5UQ1UlXemhAIft2rK4WNo5BeH3CuzR8tDDsS2nIpurNcfvSiX4yCNTgZl
	f3OrQ==
X-ME-Sender: <xms:bsN1am83wwEFRjVyBKWTOj5i83ZwvQmJrGTeQaRDb7DWHMLCjWQUOQ>
    <xme:bsN1aqqbak4K5CB0mnmpOnc-1N_12a8z-Ekju24FikTYtAU6XDf-oUlcTwYEg0ONh
    sNBlzzfWxH_72bkj8ksNYNf9UMS8MZR5ALmLq9dOguwhb1Mjcydtvg>
X-ME-Received: <xmr:bsN1akhDtGA4SZLvB7pI7swGBrpVhF1_n6aLeWcPBgrRmzSuH4MzBcrg9pM>
X-ME-Proxy-Cause: dmFkZTEfW3x2Qrq7ELqxlr/x69vk0aYaa/E/2AWrFAl7yu0Vg+jIGlS0mjOCk5J5e5/NJH
    T3J+l8M+cQ15gxg/u6FQhwxKudsrf7tN5cWcEThveGDS0KcOU0uMrzGx0YBmylEV4PfT2X
    SbTqClZY3SINVohR/2NzYRxeOu5tU+SgKqY1sS5oM8U15+ky277S+G1Ww7YAUM5Z6EK46p
    TQK1COWwyEQl/dhwe51H5lWCLFzTj8K9hkk/JBO/DvOgEgoe5sMihzFP04eKTIrZCF8dte
    tQwhoNU+zszgTlPncqprVsvTwAgpjyPciGBDZXKQScTz4u1orAuTZg8Fi2VomZsbF2qQLb
    zIB6vfCNv4v0dcseiUkN3H0nffdrzRAjDXnr/zcE4pHIWwhQSIJcHpNKfPSSatE5vtlSwn
    DtWUIKhvp1jGXwuxT4icZJ7eqOMoDp9O3eN/sGEFk1QcUkAUefbMoY+f6cBb/eCJOZp5Fv
    w3A5qOkKNQDIKdjK3fDOPysd5GAuUjiWQZW+5CYr0Pg9TIHi8EHfQKgk6Ip7WUVR5HqKPp
    DudH9yV/0Ag4i+mp5KiXkaccnRZFhzimORXQyyVo6QHCrlCjus7skssIHkNSCl2guqkiYo
    UOZv3k9Fp2gNbtDp0Cw80/IB3MeBJb4AXGUJW88X/CQw/EcsEbAANNWBqb5Q
X-ME-Proxy: <xmx:bsN1aoBmbwnFl-v7J8Y3SvJmF_Iw9I-XYpA2aLheutpBEZUdKDYKdA>
    <xmx:bsN1aiv3TWe3FxxdVeJzjKDJX51ZMwZgn9Dt_WQTfJAQl6UdSUfthQ>
    <xmx:bsN1ai7xLy3fvaCW9ByTSM7DxuO5vQn44k37ZaXoV9DyV8RJiD1udQ>
    <xmx:bsN1ascqctpHOnl9y6vlp5EyiekHfp49MID7uFphqvHO1Nt2MFbhqQ>
    <xmx:bsN1ard8Ua1EsWgVSAxSLBr_UbQwYAS8EhFtLBuT4oNf5-Rn2im3xTf8>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:18 -0400 (EDT)
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
Subject: [PATCH v2 11/17] selftests/mm: cover a shared-source collapse write race
Date: Fri,  7 Aug 2026 12:36:41 +0100
Message-ID: <20260807113647.3744609-12-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807113647.3744609-1-kirill@shutemov.name>
References: <20260807113647.3744609-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_fork checks that a fork-shared range collapses in the process
that asks for it while the co-sharer keeps its own page, but the co-sharer
sits still while that happens.

Add a case where the co-sharer writes to the shared range throughout the
collapse.  CoW has to keep the two sides apart under those writes: the
collapsing child must see the content from before the fork, and the
writing parent must see only its own writes.

It passes on an unmodified kernel, so it pins down isolation that
khugepaged collapse already provides.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 69 +++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index d3ff1b196e09..a5683f08694f 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1225,6 +1225,72 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
 
+/*
+ * Content stays isolated while a co-sharer writes concurrently. A shared
+ * source is copied live (not frozen), relying on it being CoW - immutable
+ * for the duration of the copy; a co-sharer's write goes to a CoW copy. The
+ * collapsing child must see the pre-fork content, the writing parent only
+ * its own writes.
+ */
+static void collapse_fork_cow_race(struct collapse_context *c, struct mem_ops *ops)
+{
+	const unsigned long shared = 64 * page_size;
+	const int stride = page_size / sizeof(int);
+	int wstatus, child_status, i, n = shared / page_size;
+	/* volatile: the loop below must really store, on every iteration */
+	volatile int *ip;
+	void *p;
+
+	p = ops->setup_area(1);
+	ip = p;
+	ops->fault(p, 0, shared);		/* shared prefix, pre-fork pattern */
+
+	ksft_print_msg("Fork, collapse in the child while the parent rewrites...");
+	if (!fork()) {
+		int collapse_status;
+
+		ops->fault(p, shared, hpage_pmd_size);	/* private remainder */
+		c->collapse("Collapse a range shared with a writing co-sharer",
+			    p, 1, ops, true);
+		collapse_status = exit_status;
+		for (i = 0; i < n; i++)
+			if (ip[i * stride] != i + 0xdead0000)
+				break;
+		if (i == n)
+			success("OK");
+		else
+			fail("Fail: child content");
+		/* The content check must not bury a failed collapse. */
+		if (exit_status != KSFT_FAIL)
+			exit_status = collapse_status;
+		ops->cleanup_area(p, hpage_pmd_size);
+		_exit(exit_status);
+	}
+
+	/* Hammer the parent's own writes over the shared prefix. */
+	for (int it = 0; it < 200000; it++)
+		for (i = 0; i < n; i++)
+			ip[i * stride] = i + 0xbeef0000;
+
+	wait(&wstatus);
+	/* A child that died reading the racing pages is a failure, not a zero. */
+	child_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;
+
+	ksft_print_msg("Check the parent sees only its own writes...");
+	for (i = 0; i < n; i++)
+		if (ip[i * stride] != i + 0xbeef0000)
+			break;
+	if (i == n)
+		success("OK");
+	else
+		fail("Fail: parent content");
+	ops->cleanup_area(p, hpage_pmd_size);
+	/* Same again: our own check must not bury the child's verdict. */
+	if (exit_status != KSFT_FAIL)
+		exit_status = child_status;
+	ksft_test_result_report(exit_status, "%s\n", __func__);
+}
+
 static void madvise_collapse_existing_thps(struct collapse_context *c,
 					   struct mem_ops *ops)
 {
@@ -1778,6 +1844,9 @@ int main(int argc, char **argv)
 	TEST(collapse_max_ptes_shared, khugepaged_context, anon_ops);
 	TEST(collapse_max_ptes_shared, madvise_context, anon_ops);
 
+	TEST(collapse_fork_cow_race, khugepaged_context, anon_ops);
+	TEST(collapse_fork_cow_race, madvise_context, anon_ops);
+
 	TEST(madvise_collapse_existing_thps, madvise_context, anon_ops);
 	TEST(madvise_collapse_existing_thps, madvise_context, read_only_file_ops);
 	TEST(madvise_collapse_existing_thps, madvise_context, read_write_file_read_ops);
-- 
2.54.0

