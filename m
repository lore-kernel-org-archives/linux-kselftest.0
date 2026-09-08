Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBA5156661;
	Tue,  8 Sep 2026 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871882; cv=none; b=YHAbns4AISzUM8kY3BsXUT1UbLmGNQeNo0a3Zpk+ngYiKEjZ1xFTEbyoqLKJ9BSztVEUIOPKEMRhSwM7rrVUtbQLUrTF2fTo9b6fv4/plKvvXj8SAZKCFMR+i6ZGZLa4iM8QPdm3mI16584sgiRm9LAXDXwI3FVzoFw1RR3GpHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871882; c=relaxed/simple;
	bh=OxdiUezQx+9PR59DBA9umo/VW0TtXHh39ptAloZpNIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odme6ouSWc5mRsiDm33xyy48EiEwV2zy48SrmewPsD86PSr0sRiWcmUMzzHjZPCSgjKg6UIfbi81hfEayYcZVfq+goe0kIGH9XK0XoTSmicTnq4nk6ylOumD+B1fflTco3iK03WJocGNyeeLTYz3XaI+fgWAHjjHGNoiCPAD7M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=l8YhARTz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MmQfNFUF; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="l8YhARTz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MmQfNFUF"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id CF38EEC013B;
	Tue,  8 Sep 2026 08:51:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 08 Sep 2026 08:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871879; x=
	1788958279; bh=Gl/sNwAk9MDF/uFMRp+A1/O8Ght2HDEnJQvn6SudLCk=; b=l
	8YhARTz/DRsSj+CrFAs1wJ/EXnlByExmElqF5uPaJHdOMAobrey2H0mACB6haNFU
	Xcq8HUlQUX6UZcrfJ1VtA9pv9u0upbIbCFAr4+T/mw1nZxchO/mIvu6IVGilpgsQ
	2qvcJ4BXvcJGH4i7RyrZbXeDqUVCrDBrDMMAedK97qDEYMA/ywP7e7imkL5NrT16
	0yvfz8hErw9lh9ZAfOcU0F9mmFBOKuzEI8lcoZztJO5XWqISXlJC0wOc1KnoZVYj
	WPu4rY8M9eZto7uU1dCkppOyu+5poxT/ZFo5sbwS1nWD16IvTSq7sN9TFJlRWUfl
	0nqkkX35wD2u6Dh6JK13g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871879; x=1788958279; bh=G
	l/sNwAk9MDF/uFMRp+A1/O8Ght2HDEnJQvn6SudLCk=; b=MmQfNFUFVG2JY22t8
	zHHX5aEyuUEqZYyracR+jrE5KqeB0O1/i4rwmNNH88JA4uzU7SbvBHalWRvpPoVb
	kmhgscquSUdD3EhSDuQ2utBMFoA+pqhcPmEQVD31AzDTWALWnBKoY8aIoWuIXl4W
	3NbpAw2c7DhvmlI7kIxkaAJdXE2O4ToT0etioHXmwvd9krxi8IYb+SN3y1UYGHxD
	ScbatNeOvRbXj0XgryP7b+8t3UK/AwRQTsHjnXoAZ34lm9LDrIuEd6JZ6KNg7LAG
	l5Xo93bU2npS/scy2XhysDS0w+YdhZKtEw4UAd1yC+CfW6afdlBDnDFBsICYPy8v
	xyT3A==
X-ME-Sender: <xms:xwSgalahzoe6lfgl-4cJL1ywb8M_oLYQtgR3JBahasrtiOJoxxXr4w>
    <xme:xwSgakyOejEzFRioPMLH6jQTrBve8_Klvuq3AcEfrMTtp-jIEXf3clnLbcgpbjfbq
    _ly7jxMxi23A-6Ukd138W7fBTpuiWOu4OF9HrBEzr1WIT-evfa7hgcu>
X-ME-Received: <xmr:xwSgaqI2220NSlWIqoRi5ZQSsAy3SjEYWX1f6s1B-X0ICSjtPVk-IGQJ_Lk>
X-ME-Proxy-Cause: dmFkZTFCT83ts3xpHDuUgDdlzQtELcoAknrXBpsFepmdcEBLccwduWOOVyAuau0VlYvm49
    objBvbnGefvuHsKXiB+MOl7qErn3M4/Q7Z72R+asBFni+WG6jRYqPjjJBv1F7ovmfnEZp3
    uEJcbLADGcdxsWcYxdWct2wwV9KQaoOTpGWM7Il7/oKOILrVOp7MvqHbWAXdA0mgRBniUZ
    2M+Su4Zoe9zFbzekNirjNltohahTSfzaLbYZTkGXD/hRQ+ajqkABo2HdEn2GJrc7g0w4Iu
    PhTUexE0AKZ4j2dsA7W9i19VnbZvZZgTTujH64lpg2nDW6KlKK63jDlRsrLETwVfJ8WCe2
    Ngz4DLrgyUxY05wMYj52j8IakMHZKjkcWHX6PYSVhe3AlZy4M1ACV5EBxH4kd0H1Kc9DiY
    g9mfroPvWHQrJqix2WbYkh+0yw3iGjq9SlphS1vxYbmdZEneTbyhqQei7aqhOWMyHLLFN8
    g+Puu43NWgy293fIhoqtx4EwnxenYlvaQCDmpdnFkZzd127+WZ5hnTIkuC0SWk6uwEYx7a
    FBkDe/N4MKWvuknNfVsRDKu5ZmgttCQMVyyugin78yj8cUpZ8YU80vnm0iDXsnJNB3Al5q
    Rw2Kn3tCM3rFQEhRtEi8tY31zTv8WWpjB8EBzKLVGQt5H6VCIXF+Hs+/E2RA
X-ME-Proxy: <xmx:xwSgarcAIoSCpjlcAlBMWEs2wD6H0XNZGU-0n5W71dvtfXLkhYaElA>
    <xmx:xwSgaishpHOJ3Wzrx5slR6QvCuJRqzrC05K09A85UWthm502SwuqOQ>
    <xmx:xwSgapEgYtQkBuIZedlTN1YyQpVUXDUYI_f5axKQnyMzTa_aqSdWxw>
    <xmx:xwSgasfNp_63oxU0PeMleyljsDXfKzHUpC6HXN1NdevUG8QTuIE9aA>
    <xmx:xwSgak7LwoTgAXby5oMmKSAOJH9wwTCV3dl4zjory5elr7rjPJsCOLmU>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:18 -0400 (EDT)
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
Subject: [PATCH v5 04/19] selftests/mm: skip khugepaged page cache cases without a PMD folio
Date: Tue,  8 Sep 2026 13:50:50 +0100
Message-ID: <20260908125105.1510704-5-kirill@shutemov.name>
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
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.h  |  9 +++++++++
 tools/testing/selftests/mm/khugepaged.c       | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index 726c73c43c05..a1d12e2ffd62 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
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
index 48e0040d53b4..73bf07c39145 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1353,6 +1353,25 @@ int main(int argc, char **argv)
 
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

