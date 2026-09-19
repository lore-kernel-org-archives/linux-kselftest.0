Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544772BEC52;
	Sat, 19 Sep 2026 00:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777509; cv=none; b=n+ArE4CqEfP3FQ3WrmfT9EH71idK2/QEpdtY8rUq6RtaYMFqS+G+76jdPghc3BmDYV0vAJS8zE9n3ylA6qd4+4mk2JxWI8s2Ru95tyLWKQAL2eBJJpGFaj6Pe2mmIALG/geLNMtFNZUj5M+odieVuDGEYyiaHrLXot2tGjL9f70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777509; c=relaxed/simple;
	bh=r9KxW/pUOtDOKWAXtqy9E5Dqp/slGSIywK9qYd8Fz7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ndo4RIHZ9z7erYl1eQZyxHjazAtjg13ZJ7Ky/hsmvVZiwzQa0re04UL8PLSlMPXkmAbbdZyCwxccFwNI1+Q6vZYsquP7a9UE0MgBGD3b3IqLnVSQWv3EIWIuJLihKen/hEKvgDt/O61Sa06vLUQHFppYZwCJpB1GnGwFoBAgdyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=bmRjiuXt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Uwkym9r6; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="bmRjiuXt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Uwkym9r6"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 745F014000FE;
	Fri, 18 Sep 2026 20:25:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 18 Sep 2026 20:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777506; x=
	1789863906; bh=O8IAR5vD5SCVxu0A7qSyVndGraz+I6DqEP+PM8vYqhw=; b=b
	mRjiuXtVkQEoqqZ5x10ZX0KiN0ZIkJBVsZOqKr3gZCMjKugrjhF7jhdtDD31ygAs
	fiZpvJuDVkg7XLTCgSDmZ0JUaSqxLsKX6p8g/6XLvvLsJjcvgljiaCPMFHoprXHC
	aMtJw0MqxTDEGCN5TLTBDddtVIEeJ0DcWsOkmSYgQzfD2Byx4j4jE3XOPgnuVVOB
	/Bh3u59fFWE3HdN7s13Gsf/GyUj2LLtCaghHeoVfK6jvz3JhhhqJkJXs4JxppDxe
	uicz6l8k1s/W5XjVEakg+mUgq0foZuFRN3XrFc9wgRqnLBqKFgj0gewgYoimokVP
	ta2wmnrWuFYWizEK1BRMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777506; x=1789863906; bh=O
	8IAR5vD5SCVxu0A7qSyVndGraz+I6DqEP+PM8vYqhw=; b=Uwkym9r6sk6LSf5y3
	1OIZVjTH5YY64arTcBH5+3mB39tDcNEfwn/QbCBM2vAlTNi5NPEgzwmRLPTLNb2z
	IEJBUGRHxKwUD0IEIzfWUOczDGcndI6qjXytwx0wgJpEc7PGcaZTdOhcddn2Q6I0
	nR3DF0LA1ksKWffVvaTrzWl3W09oF/RPmWu0BWO5+HDrQrXEfeKI4pi9SENAQ2Pm
	uLier1DZNO9lg0EEDS24T5EwXgGDH206Dl4Z4Mt09qB6qUrQ/AB/N6jb62PHLJWO
	GzkqgKq45gGbfFLY82a4s/yDkBbZQdfidBX5VYXjJCe+KiXlGI4jG10jrtiI8uYN
	UI6LQ==
X-ME-Sender: <xms:YtatajWGPGPvNYMsWwnZqdpXql6S-ilkY7eXzxVmFAvLSxVN4K-lSA>
    <xme:Ytataj9bebqGChIloQUzACXlVR4GiwhoB24xS4vy7yK_JLOhIT6Go_FZrFp1AqdvE
    LBcQhdhIkwn8su7K9XvZW1eKxJXoM_h718fOfLtBu7MM4LPJbymppGZ>
X-ME-Received: <xmr:YtatahnMflhhqITmRiIw_PoELrTEPTNvcGfcLxyS4UlyYlDLczxs3DI7eYE>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMfx
    L1imsBc7GKPy3QB909e6AYlrfJuc9CCvY/TvwvN4F5Vf1wSeUPBayPkIcewsfuXZ//CXkK
    d5MzgPYuC6cU1zvr0k0SVhh5xDRsAj55w2AIO4FC+DCXwaZqtxhIKXhyU6Vth+RIi1lt1t
    b/LmP9emsC9mVyKTP7veK7dUgrf5UuOrk+nN78P77e3vnH5A71G4tACFpN33j9Bq0+wy9P
    k4L2UX9tA2sDKLLbhGYnKBZ4Vo4fkZZfoKw6CW2vEY+Bjlq+tCE2PL2skC15yAqD6v+IV1
    W7217gqf/GHG4JK0cB1fGe5Elqk3Bcb3vKSm5tnwX8hqTxBqQan3Wp4AsW5A
X-ME-Proxy: <xmx:YtatamKOxV8YpfemJT0Gsc8i847sJRz_AecNndmApwat59Y2GezLKQ>
    <xmx:YtatavoUM81yuE_fc9ulr6U8ksXVO5hXeRwB9vwjsZXk6Q4JIoTSuQ>
    <xmx:YtatarTpH6qBHC_yCjLbSqTymYy_NHKC6Zyog3UX2N_hdNgMOA_CGg>
    <xmx:Ytataq7jb0nimO5J6uMWJOzYwJ0iygLPKAsSckrOewcs6c0WXTOI3Q>
    <xmx:YtatapPtkY_VquIALI4VI6eS11VOqPNjesAanB9TWxPLH5pF_VHzURH0>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:05 -0400 (EDT)
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
Subject: [PATCH v6 04/19] selftests/mm: skip khugepaged page cache cases without a PMD folio
Date: Sat, 19 Sep 2026 01:24:34 +0100
Message-ID: <20260919002451.496763-5-kirill@shutemov.name>
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

The page cache caps folio order at MAX_PAGECACHE_ORDER, which is below the
PMD order on arm64 with 64K pages, where a PMD is 512M.  A PMD-sized page
cache folio is impossible there, so the kernel refuses these collapses:
MADV_COLLAPSE answers -EINVAL and khugepaged passes over the range.  Four
shmem cases ask for a PMD-sized folio anyway, fail, and the run bails out
in the middle.

Skip the shmem and file mem types where the cap is below the PMD order.

The cap is not shmem-specific: it applies to every file folio.  Add
thp_file_supported_orders() to read the orders the page cache allows.

Anonymous collapse is unaffected: its orders are not capped this way.

Assisted-by: LLM
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/lib/mm/hugepage_settings.h        |  9 +++++++++
 tools/testing/selftests/mm/khugepaged.c | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/lib/mm/hugepage_settings.h b/tools/lib/mm/hugepage_settings.h
index 548e9d288d1d..94d9fc747f49 100644
--- a/tools/lib/mm/hugepage_settings.h
+++ b/tools/lib/mm/hugepage_settings.h
@@ -87,6 +87,15 @@ void thp_set_read_ahead_path(char *path);
 unsigned long thp_supported_orders(void);
 unsigned long thp_shmem_supported_orders(void);
 
+/*
+ * The per-order shmem_enabled attribute is created for the orders the page
+ * cache can hold, not just for shmem, so it answers for regular files too.
+ */
+static inline unsigned long thp_file_supported_orders(void)
+{
+	return thp_shmem_supported_orders();
+}
+
 bool thp_available(void);
 bool thp_is_enabled(void);
 
diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 189cc4fee18f..5318f3cfc0d0 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1358,6 +1358,25 @@ int main(int argc, char **argv)
 
 	setbuf(stdout, NULL);
 
+	/*
+	 * Without a PMD-order page cache folio the kernel refuses these
+	 * collapses, so there is nothing to test.
+	 */
+	if (!(thp_file_supported_orders() & (1UL << hpage_pmd_order))) {
+		if (shmem_ops) {
+			ksft_print_msg("no PMD-order page cache folio: skipping shmem\n");
+			shmem_ops = NULL;
+		}
+		if (read_only_file_ops) {
+			ksft_print_msg("no PMD-order page cache folio: skipping file\n");
+			read_only_file_ops = NULL;
+			read_write_file_read_ops = NULL;
+			read_write_file_write_ops = NULL;
+		}
+		if (!anon_ops && !shmem_ops && !read_only_file_ops)
+			ksft_exit_skip("No mem_type left to run\n");
+	}
+
 	default_settings.khugepaged.max_ptes_none = hpage_pmd_nr - 1;
 	default_settings.khugepaged.max_ptes_swap = hpage_pmd_nr / 8;
 	default_settings.khugepaged.max_ptes_shared = hpage_pmd_nr / 2;
-- 
2.54.0

