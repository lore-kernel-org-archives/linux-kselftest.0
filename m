Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41D545D9D;
	Tue,  8 Sep 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871900; cv=none; b=hh9/lT811BfLlIfsSjuldpH5VnmZASBH4SnebqQnf3aZofGqLusfotgxJEYck31imMk4x6UYYmSRmZDtsu5I9OCfmLBnbwUooZYIguPxm2s/RglRhID+UfjWsmbmiFqGEHCrgsEWceBIZ5BIvJznZxsU9P9K4SzGH0CoN2A4Ams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871900; c=relaxed/simple;
	bh=r9+Cf6caTI9Hz6eRErUCNLkEAdlGwaftdQQcpJytWO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdpKdWHe7cAyKB2bCpoIA7j/r+hIRH1ViLZfZA2ZCnQwWaO33zQ6VEC5R4moCz4elG5WtHZ99H2W0NnRfPp0x8y2go+mTJv/TdgPxmWyNPOjUyhHZkfIjzoPbWUcWcVsj/HGWJw8cAOke+oT1Yx4NKGfN01bJz9JkY52ilpYrfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=PfewFF21; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M0SqDjHV; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="PfewFF21";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M0SqDjHV"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 0DFEBEC006A;
	Tue,  8 Sep 2026 08:51:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 08 Sep 2026 08:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871897; x=
	1788958297; bh=qldUBMROz+IaFvGXCDPIVYq1t0GWR0yhYtHQ48mvYkw=; b=P
	fewFF21Tpf2j/Miajfmjpz0sAc3frA2GCSQ8SBkZkCfL4InJR3UtpnFeI1OGcGOX
	Xn/W+sc9HEqxKdKTLSJonoR+uH3C6YU5EuDiqtNWBPYKo3c3JtZCT+cvpYItHnUx
	h8iq7/JK2bBSi1O3T1YtFMgS1nPRna0vENIUe82IajkdZCW0HTrwPmJCMpz3Gr2I
	HTAT2U2cRCz3W1wIXh21wd+5SmwZMnkMeB6Mj2LNGrs17w14Doja3JY9e1kYPJTl
	ePn9tBF27MBovGztsLjIkY8SiluJ/XNdaBveqy6sDC1vr943wbxguoinZMfjqRxR
	oYPpQpi5WiYsnbYAYUARw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871897; x=1788958297; bh=q
	ldUBMROz+IaFvGXCDPIVYq1t0GWR0yhYtHQ48mvYkw=; b=M0SqDjHV7lLSHZh9v
	C3dB6okQNFvKDATjcGpgwrN5hc0+/0TB1T64huXrxaqcxZw+74uGQ21cFqdXy6Ir
	4L1DNXkAcnaLxv6EVoXF2YtLRXPKt/r7GtzgrF6r3vyWYb4MGTteZLZQEMtMIPuf
	z8ZWF+ZT/m2bnbG4gZHsLfPJiyCWBr4VP7beRD95nibP3ouB4S/lup6yQs6KiECB
	NBiQc7RDWMAfRWY2FrbSIvx4cJ9hbw8ityxCIuLrTetNCAF6Hd6U1orauPjRrgXQ
	BDXB9Cm3aXZ2tktSQizqhSdRf6LFGP4eBB9GARtdjlSe8KDQoL3f+1cyG/C4UBRr
	DwW7A==
X-ME-Sender: <xms:2ASgauNcDaYNEPQDs9eYB6PLAn2Tt582npWzJLaPzmWOMlkb4IevDA>
    <xme:2ASgau3WLFsQNGuizpzE4tGUqlUAxURxRdZWl6Y6SQhXwPmJc_00cSBWRVPxLHMIN
    yylCGoQQwDLDeJxef4pu363lyzzmY8SXuIP_jrtwR9H0ff1K1j8nM0P>
X-ME-Received: <xmr:2ASgaqaiCrXC3vqctyln3ZJFWJskeSPHMGqqNBuvsTosfYsg8bmfrVZjj9k>
X-ME-Proxy-Cause: dmFkZTEqhwhdybusskt0pvIfnDHaUnU8VDm23OZYXtTM+3VchiC9Aeb+sVxnsk6fYrSw+D
    ThqYkrS5/6/vxmtuBdFXmhYIhVzzMwKM2h/EuTd0ioKo/SR7JG6qiZdpwqyCgxSw3ap0C4
    BwVCwTZ6/NsCbeDdXy9FE5B58Xto5VjC3MUnB3djmw4ijxWpRXgLZG/TTGkjuz6Wl73hCN
    DLujar0Luemoo2GGzStZ/AivOKYRI2J4riPLZz79qeImA1Ygm/BltYdUhOJX4iOWEiQXMZ
    R5ImdiLN0us354rUC8gTNq0PrK6J11WLhxFnA56Lf/FdfG/G6OPaoDYxKnsgAlbq4sHOi6
    NvIbZOZEtiTeN/4yfCgIFcF+icU6YDIkjvjC7OzGF+dL3TObMZpwcq+9T1R4rMNvBcFFpW
    x6W2dA1MI1YePYX1GtDkVZ8RJKRjEFkXioma/ZMRUkJfs3jpt7OjI8S2c4tuhCMGoRav+D
    g2C2IZzaXd2WUOJATJ9JqgPY2CFu9qIu/JcmY7z+lFnu7SLI22fokcG8gC3ROeCoIfgf/8
    9bXixF2v/IqACwPBfA/ngV84kuZYItqVUSDdYj3wCgFoTwujGtLtfuyEBaKLx4YD+Wdho5
    ZZycM+hQSOG7Kr94EpSdZxGBpCS0OY50DXxG1ah89t9I3dC7ospaINBNnfnA
X-ME-Proxy: <xmx:2ASgau7NgdL3CAjRfPGXpqDx7fa99gVUAU-GLi7jhqCalxY_nOit6w>
    <xmx:2ASgapjhv78hh1MBELrYBAsWiQ0W7fyuVeXJS4jM87nHrTx-T1xp7A>
    <xmx:2ASgasJHc3UUcuD2VWKwpoY79YVbl5FDVCL9AV7KrSXiFR8EzFgyWQ>
    <xmx:2ASgajoxXa9VauiYMdyR2BCLNSqbUVywUPgHeyT7W9TTdKdANPB43Q>
    <xmx:2QSgaja09JdN7BsqunBqKPb632zn5HcPVJUfG_aZXgSEEqr0cfr1Nql3>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:36 -0400 (EDT)
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
Subject: [PATCH v5 13/19] selftests/mm: cover a shared-source collapse write race
Date: Tue,  8 Sep 2026 13:50:59 +0100
Message-ID: <20260908125105.1510704-14-kirill@shutemov.name>
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

collapse_fork() checks that a fork-shared range collapses in the child
while the parent keeps its own pages, but the parent sits still while
that happens.  Nothing checks that CoW isolation survives a collapse
racing with writes to the shared source.

Add a case where the parent writes to the shared range throughout the
child's collapse.  CoW has to keep the two apart: the child must see the
content from before the fork, and the parent only its own writes.

The parent unshares one page every 10ms, starting only once the child
says it is about to collapse.  Writing the range in a burst would break
CoW on all of it before the collapse begins, leaving the child to collapse
pages that are already exclusive to it.

Preparation for changing how collapse handles fork-shared sources.

Assisted-by: LLM
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 100 ++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index b15cd07fc0b3..f5d4847c50cd 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1164,6 +1164,103 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
 
+/*
+ * The parent writes to the fork-shared range throughout the child's
+ * collapse.  CoW must keep the two apart: the child sees the pre-fork
+ * content, the parent only its own writes.
+ */
+static void collapse_fork_cow_race(struct collapse_context *c, struct mem_ops *ops)
+{
+	const int stride = page_size / sizeof(int);
+	int wstatus, child_status, i, n;
+	unsigned long shared;
+	volatile int *ip;
+	pid_t child;
+	int sync[2];
+	char go = 1;
+	void *p;
+
+	/* At a page per 10 ms, 64 pages spread the writes across the collapse */
+	n = 64;
+	shared = n * page_size;
+
+	p = ops->setup_area(1);
+	/* Shared prefix, with the pre-fork pattern */
+	ops->fault(p, 0, shared);
+	if (pipe(sync))
+		ksft_exit_fail_perror("pipe()");
+
+	/* A volatile pointer so the stores are not merged or dropped */
+	ip = p;
+
+	ksft_print_msg("Fork, collapse in the child while the parent rewrites...");
+	child = fork();
+	if (!child) {
+		int collapse_status;
+
+		close(sync[0]);
+		/* Private remainder */
+		ops->fault(p, shared, hpage_pmd_size);
+		/* Start the parent unsharing, and give it a head start */
+		if (write(sync[1], &go, 1) != 1)
+			_exit(KSFT_FAIL);
+		usleep(5000);
+		c->collapse("Collapse a range the parent is writing to",
+			    p, 1, ops, true);
+		collapse_status = exit_status;
+		for (i = 0; i < n; i++)
+			if (ip[i * stride] != i + 0xdead0000)
+				break;
+		if (i == n)
+			success("OK");
+		else
+			fail("Fail: child content");
+		/* The content check must not bury a failed collapse */
+		if (exit_status != KSFT_FAIL)
+			exit_status = collapse_status;
+		ops->cleanup_area(p, hpage_pmd_size);
+		_exit(exit_status);
+	}
+
+	close(sync[1]);
+	if (read(sync[0], &go, 1) != 1)
+		ksft_exit_fail_msg("child never reached the collapse\n");
+
+	/*
+	 * Unshare one page at a time: a burst would break CoW on the whole
+	 * range before the collapse starts, leaving nothing shared to collapse.
+	 */
+	i = 0;
+	for (;;) {
+		if (i < n)
+			ip[i * stride] = i + 0xbeef0000;
+		i++;
+		usleep(10 * 1000);
+		if (waitpid(child, &wstatus, WNOHANG))
+			break;
+	}
+
+	/* Finish whatever the paced sweep did not reach */
+	for (; i < n; i++)
+		ip[i * stride] = i + 0xbeef0000;
+	/* A child that died reading the racing pages is a failure, not a zero */
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
+	/* The parent's check must not bury the child's verdict */
+	if (exit_status != KSFT_FAIL)
+		exit_status = child_status;
+	ksft_test_result_report(exit_status, "%s\n", __func__);
+}
+
 static void madvise_collapse_existing_thps(struct collapse_context *c,
 					   struct mem_ops *ops)
 {
@@ -1695,6 +1792,9 @@ int main(int argc, char **argv)
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

