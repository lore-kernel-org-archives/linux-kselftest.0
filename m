Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0812BEC52;
	Sat, 19 Sep 2026 00:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777526; cv=none; b=hR2tMshy/VtyzozImWUeK23SRWyEnm8TjgYtB3Bn5K5DysReww9zvvgsYRpXcZoGv6fyb8HBOsjz1SUEiiI/sr+Cq1rqsgDpYNgPuChBceuM4DGC9ldIX4YDTUaOsPnwNZk9lv91BFrAHHnxzXsFS0jM498pdt31vNwql6XIdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777526; c=relaxed/simple;
	bh=FZ7JYHr9B27l0som+TzXQpfAEkfbSgB2zVnAfudAYF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5ZKabsrAO3ScmTwl+iqSIH2tNsIbKkNiDK4gU8hSQrFdEg34XCkRWAtKoNvUEj0hHQG8MKWx7w9lCzwLFDsm7RuZSS7BaYWfWVWSaWlKh+/g1yjpn/Sjo3CBljLDvw4Z7jM4FUmQEy/prpLSxiC8+OwnKWBLyxUc1nQhNCZ0lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=lGdJN3Lv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aJZIMws/; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="lGdJN3Lv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aJZIMws/"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id F28FCEC01A0;
	Fri, 18 Sep 2026 20:25:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 18 Sep 2026 20:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777522; x=
	1789863922; bh=0/Oan2MDRATB6LmyEXW7puKyqnDvdR8Sq8s2qi8OMjE=; b=l
	GdJN3LvcN6YCf/+td4HtMK8L6vLlg7tykEPUtc/Jz11g2qWaRMTHxVAj6W7do3qa
	orvG+af0TMuKUZPt0nMNBki5voZkEJ4esRr9NjoTxwMZZ6AwMJD/XRS2bP9XfLSL
	WuCDNvAvVyu/ixzOgmfQ+zUGkl6P7Zx//YI4Tt4aJK1bPe3RgZjZSnZwvO/8O0AK
	I+tIkcAI/iR12/c8++UKWMq3nxczWJxopTPq5/He/fTmpir0O6wj/EX3XcNFKGZa
	xpoZnVm+o/cBWcHlNmjECyjkHp+jFoG018A1prhazbRQaoCRqfck7/IQJsanAva1
	383bDE68ZMiY0f2inpj1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777522; x=1789863922; bh=0
	/Oan2MDRATB6LmyEXW7puKyqnDvdR8Sq8s2qi8OMjE=; b=aJZIMws/7LmqoRQbP
	wR7FcaM7n8zR1gvmSRIQfvpv/p35HCyC5FyGwrcjXR9TmGRGQJ9nAfaFrTJjLdf3
	w+vftGBnjUeFUluONZf+LUANCBNvg4N94MVMLtdK/KzKWYKur0GdJdqRiv23afo8
	zDQE+Qhoe+rfQjkcNBAkYCv2Sbm7ipSe4SrfZdr3eTHqTCpoYSJIs54gIW324FF9
	W8AHuOveBp+7frsG9PXOmqYGsHwnL/g1bNLENb9RZiIaJ2e+vMiQqy5SaNHJBKpm
	C3i8iM+YF4C5F7YXkKQzrU/fqL1eOQi2hU3wfgyRMwQqT2QHSQwcy6qlhWr+A6y7
	y8klg==
X-ME-Sender: <xms:ctataqzYhZWPagttuou6jx8QH0dW-tC-5xj1WbS35Be9rLvYbvVoLQ>
    <xme:ctatauphfDtkv3Xcw9fqvNs-Y3DuseBPDeUpzcL3XU_liak9HC2s9jzZZh5ay1pE5
    UT75amqujm5sCPzALKcc5429yq0sUwjD0NcnwNoz7e5AQ5-6HP5b2gc>
X-ME-Received: <xmr:ctatauhEam5nB5YkQf10FX4dc_9Z2Cxe8qHVfF5TSj7Zp8rb3B1gRK73dNk>
X-ME-Proxy-Cause: dmFkZTEr5yKr4sxuQbXqh6mxNPhLx5TPKhba5+X7XnlS/zJ9vgRk2t0FxRNN7MLg+r6CPW
    Mu6PNIlmN7ZPoxynBFUAJAPtPIX+NuZRIFaOEVqo689ggMVwgiN48ZIazRbbn8524IbcBa
    VFaAXtPPhux2zoqYNSaL4fhjV7u8LwweVoGm0ycn2eaUICY9i4xSWPBSrUzWeffPDzxnz4
    WggCaU37X5tXMmNpoupzaGNfQ+amnYr5ymN7dEq2+UMtHRoF6bcIpmQfw03IlrWSCYa/Ho
    OSQdXdtFB8WyOz/pBd87oZ5qPprkCNYTXqaz9hCIAMLkvF6M+JOqCuEaEpX/p3iuKuZ/hO
    en0/iPchRVYImZYh/v36F1+B6+fXgakRSzQwPl1xwjwCbd3gtWuKH7++CyEgDstKecr+M+
    oOvhk2Dptz0AlsCiPvG7fiZP8z62zyxG8jSLUL9sXWyLcPt2AX7k4shelBUCi8HotjDa7H
    qlZHsArb+g+QFpcKaHAN2m/VsROOfblQS2zpLbwUgH0fjE4cxXatZa7elB0Xa8kJ/ib+76
    8TNlwWJDJDEmcJlADX3TvROWkKm8LxeMTItJRrUflc/tsbLAoGtKCBDywL2wKMPkIdsUZU
    JGdph8i5zQ0WJrt66UrpjxQScTg5BIDo8gP8DFHIqzuo3zJHaKtCwClXvQbA
X-ME-Proxy: <xmx:ctataoX4ZSRvsL_oAr1s39mPyrk8XD_AtS_iBfOOsuickK7o7OR9FA>
    <xmx:ctatauG3H9cFSDIjcxZnEirF_Xd8ST0JFGnqP4CsLPc0quOb2aOQOg>
    <xmx:ctatag_QMP1QZYQywGe3ir6gNEnBmaDHsBCZO6lW7qEwf0KCw8VaUg>
    <xmx:ctatam26exwhsIckHWjyHVhQ3vgAMTRzVqObQkfn9mGMbelkvbH3bA>
    <xmx:ctataja2tYCH4Pnja9jJtzAXMAhPaIHfKSyX1k9nv_avOMShkivNZr6C>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:22 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	"Nico Pache (Red Hat)" <nico.pache@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	kernel-team@meta.com
Subject: [PATCH v6 13/19] selftests/mm: cover a shared-source collapse write race
Date: Sat, 19 Sep 2026 01:24:43 +0100
Message-ID: <20260919002451.496763-14-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919002451.496763-1-kirill@shutemov.name>
References: <20260919002451.496763-1-kirill@shutemov.name>
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
 tools/testing/selftests/mm/khugepaged.c | 106 ++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 9d1c47bd5013..21ae258bd56e 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1166,6 +1166,109 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
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
+	close(sync[0]);
+
+	/*
+	 * Unshare one page at a time: a burst would break CoW on the whole
+	 * range before the collapse starts, leaving nothing shared to collapse.
+	 */
+	i = 0;
+	for (;;) {
+		pid_t ret;
+
+		if (i < n)
+			ip[i * stride] = i + 0xbeef0000;
+		i++;
+		usleep(10 * 1000);
+		ret = waitpid(child, &wstatus, WNOHANG);
+		if (ret == child)
+			break;
+		if (ret < 0)
+			ksft_exit_fail_perror("waitpid()");
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
@@ -1700,6 +1803,9 @@ int main(int argc, char **argv)
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

