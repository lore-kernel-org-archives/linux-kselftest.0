Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78317453A36;
	Wed, 12 Aug 2026 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541022; cv=none; b=tMMaEwUFB7tW/5L6FYJjUkbzg0z/Idh4mu/Gg3901XIRTw27k3Ell5N6oQU8vtd7htNE/ynWBR/Jyig4AcZ+Zw717rRyuSBEWOpmBT0BOpFOqNa0ZzJv1XYJxDk7yvyWxTdmuHbOB8fB0SMNDgRkvdS8Xv0bpxS50116mtVehss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541022; c=relaxed/simple;
	bh=l+FhFkhBEBhzqVzwYB7BWQprhxPOlLsgkwz6Fi6bk2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0rsgyt/KwmQ2J1sLy0SqxVq8WeEjERv2hNAMTNewnNw9Ua3VX5Ifxnb64OnSmONfTA2ys8TzDnXuTfoSxEoRGEKieAXNJkkMccQ7TcQ+LYRDksSxySOuxnGzZ8rpqOcY5e54Pn4u9+2mlDaCiSWM1qhCIrweh1vdgEh1n6Bz3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=uhASvvD7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BLzgpCa1; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="uhASvvD7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BLzgpCa1"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2E3357A0176;
	Wed, 12 Aug 2026 09:23:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 12 Aug 2026 09:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786541020; x=
	1786627420; bh=yE9UcmZWN8CYeDypZM4ijLjNlZ/odamXd7gxHiGqY8Q=; b=u
	hASvvD7GOICdfoUSDkwvcr6MX9Vjo+PMCAx2KtGmcxRqgEpZKxMd/eKMLzP+HmC4
	hzCd44Fns4gIdUZ+IsBC8SBRewsa36m01xE2pw/QzoIfRLnASyENuLC1zR/82e5B
	HgtkAcfrxQ+22/4ZWHmal45bbi4M5kiXpAudHDhGhVVKtiQVOC8xM2NNJuK1kiRJ
	EHIkxrXgMiGF8RpP7Zx+Hc73ADIoKjzqi9ZesA1X+jOjeDu0wVnOkXZnDWGybX7G
	LDYvUmFIt1mJy36cmrxHK+SmmE4XKxckQEur71fzrqQD8gStL3Ar+BCj5eYZsRgg
	+7O6wa562NK1IWPzenO4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786541020; x=1786627420; bh=y
	E9UcmZWN8CYeDypZM4ijLjNlZ/odamXd7gxHiGqY8Q=; b=BLzgpCa1S2kn7xZeV
	2LeFbPCgkhGmw+Hw0U6ntUMsMrg9Oe1xF5IyYAikp7vZpH6WlJlRjNrFjcEaaE4M
	P8zAjw0mYsuqXchpvtcDC5CoImsX8lQ7EU0YwhPWZ3bMSJG/zgSPt9rsCu5l3CJW
	yEZxFzh1wEBoCBXb1FYvqE5/fx8fC1GDNGgIpVf41yZ54p+vNs7VBRNaII+wNxxZ
	TZrp+39ejrWWNapiL48k5xqaS3aQaDSsbk4ujlDI7ZQLIHJCpJlF4wh6d769v0nl
	pxinCaIpmwvELQXCeJ5g6/OG5TQc9D+FlLbRS+X0LTpfdGTTRCXlHP1JSX6KIXJL
	EBxsQ==
X-ME-Sender: <xms:23N8aoY8-jGmFjNrfkpCSq7wjP_Xdu-tJ7WaGJuPiWEaL0lq-DKhuQ>
    <xme:23N8anVwnueuqhCpQom-tQxs5R2ar8C4Wxt7iU1ecBiNYQHQmMUmbzAbSPhCeytsx
    2ayXkpfcNvjuAjHf_VyLvE0ADSD-rtAkrmMhkhhS0f57Vo-wLDG75pI>
X-ME-Received: <xmr:23N8arc_GGIqpzaHKTaU5gtPiIyCdzkRaiOdTPY_ZueBetSqD2lZVIApL_c>
X-ME-Proxy-Cause: dmFkZTEJjeAG5mPidrlxx5WYeorxbJVgJIKvTA5wXegfbw/cux8oxcUciNIpDIuTJE+lqf
    6MvKMtIYnfrpE9CE9brIFiUghXXeSu7acy7yTiQzGdGRUaVwSNB0Wtfy8GXhxbblHF9PD0
    zPXwLCOAHUDQMRV+OGFoRd51Bfw/8mHZFt6NMjCskGz8KRys5NyppP3tQz3pg+1FIu5GBp
    PJQAWgZTF13VhomE3d+3g7Xo8LQtMXvrRUSh5YzlZkIRUVCw4Olhx0/o/iEmltBto/jcsB
    4mCen6EwKCCQNN9U1Ldmtp3E1EMhPbaX1d9tgEecmRx82uYLegpVLGl6lWthe5rRIcaIdx
    /lwSL5gwXuq3E4Lw/HBc9fXact2cFi1yiSHQEFhRz3naFma7cY/dEuMeG761JoaF7Uof1w
    yNYdpA0Vx0SkMA85H6uqkKj9m0fa07KOU7GdORi9GqP018gPW4vRu1GctHkp9pcAKQr9VY
    V6xLlZDxU4h1joU2gZbKO9mvfcFNQ3VDN5H8Abq4XpZHcYQlGaJC3eev6f8qvLelEul0qw
    MWLochdmzlZ5pPWIk+kn8fAx8gPJfBacUdqwsMyz2EcS75QJjh7GVkvlKwhnSVI9gZPKn5
    B0l+LcBLnsBrLvRbM/n1z5H6gofPVqbnt06qPATKf9PLHA1qbXOIxeQ6u2OA
X-ME-Proxy: <xmx:23N8asObIW7XLdxBlMTI2wczTo9N0LKECiBO6z5jgKl2PW2_c68GXw>
    <xmx:23N8arLWzJZESbUxovY-v-MyZXt5KqMONASiINnr0qy1k0du4YAJ8A>
    <xmx:23N8aqlnfIURKb5KhpWU-M_MkqeN-5LUYteu_igVqmGTp_Rfj4E3YQ>
    <xmx:23N8aiYf1whinKFWw6Yyajg6MFpUTMueX9rLglGvM1Z3N_Bq9_VAKg>
    <xmx:3HN8aj55Fu0D0P2gcJZoE0hByFuIlzdqUH76NoCO1sLpYlPZqQMk9F9A>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:39 -0400 (EDT)
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
Subject: [PATCH v3 12/18] selftests/mm: cover a shared-source collapse write race
Date: Wed, 12 Aug 2026 14:22:58 +0100
Message-ID: <20260812132304.199287-13-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812132304.199287-1-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
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
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 69 +++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 3099e7b720d9..9c8830fed0a2 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1207,6 +1207,72 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
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
@@ -1770,6 +1836,9 @@ int main(int argc, char **argv)
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

