Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6293A44062C
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 15:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559940; cv=none; b=lVCakAI+TwqCbJBpFCXvxOTpAymIcLny26rN8gJih8Y7jDbchVo/oSEGrhlSDH8sjEOB+o6KUWxAmpU2snjn1q6EJNeZ1+IP4Sho1Y0xhYqtlIXXxW7AJBYWClH2Z8/fN9WfEsPcyhMAAMKfsaaVr/s5W8VZxO5o5SznBuH0DIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559940; c=relaxed/simple;
	bh=aN06lza12BkjUCxSt1YCAEpD4/EDAaGcSM6aQTrH8G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmTIRVf0VJiNG5Na9xOgr1iuHcwCSKRS53K0zewzn10TOZUx0GCXHsZWoCP3O5Og3iXQw9hSXFR13DH2QkGi2KIZCkbzvBHAHxV24n17MxvFmRMTm7tNCtJDNRowl/AzRSjH1WV1awy474SBzEWN9iL6uTxw9e5zGqtE5xK3hVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=H4pucHHJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=veOOZ6++; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="H4pucHHJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="veOOZ6++"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7BCD61400147
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 11:32:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 09 Oct 2026 11:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791559937; x=
	1791646337; bh=+bgswPNL65MGSFGW11p2LCgIfbz/AxZV0vuCj5wexO4=; b=H
	4pucHHJPHV+yJoef3QLQtrBLub+mhFKyW+KLFu1R5tVRdr3THPpoOAIGbih2FCuQ
	ae6n87IT8DG6gcdXtzK8g6zzvISCyusLd76sUbsOyY2FlY//eUQbkrCLSfNckVIR
	wRf561U65SnUMkE9+BtYgRD9W31CYqCsRAv8HEfYWA3ZAEX/dH2rgTmfQYRJkRLQ
	I4ruJ8hJyueFBtsogGH3YQ9u1O1b6XKQWBTu+17xPD1aispmE1FPUzmXFH3nGYRn
	cYuBwOxO0tOnr4FTH5ZoXV73D4nuog8BsXdS9yZYuHz+cfPxw+8aK/Z8kLA5FnE3
	Kr/e4byZp2Hn3SuyWxG2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791559937; x=1791646337; bh=+
	bgswPNL65MGSFGW11p2LCgIfbz/AxZV0vuCj5wexO4=; b=veOOZ6++DlJbU5zYz
	5KFpJ4MzK7WOhm662nbWJCxjrtrBBuLOuwr0MGHJOQ9/DiwAGxuWEjlpEK/Ph9ES
	/nnJPj4gj9QVPng1dhdY7mPdT99giTwbn9vAvmElZRHqJkPgl9JS42ZU/iQTIqVQ
	KA1XJqUsHsBt1agdG0reEnx1JMcBo8dyzPgNzQgcazn53Fed2JHXpqHU+Ja8IQpe
	Wgtb8lnXKFGUTmD6F/FIBWAg9YwX1zNyTuMRIgk2FHWykte2dqUmUMO6dVgPSV9F
	zHNNXWftTUoCR+xT04mPhVKJgL2Oi9IEJPu2RjXaUOrAsnK2PkXDdfJdgd/F7RCz
	fiTkg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791559937; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:CU0TpBJg97f+20dzGrYF4fUs/puiSKRfR12C4p+/vrBa7bT
	gRwg9ApjvcjsnG5U3uPV9O2ot1Sc870iqvylPbQrpmYrNMcwohZf/pg2km64DB1Y
	EebgEFpLvI0oGdbOZ8YNglVlHkbwrtyTpQZzewzZTCtiuIlTI02SzJn480vOY6Ma
	2e4lUXiAvNJUq7Mymte4kWXsvXOhPj4LnEeXm3Kj4LqxYw4jaaoRtCryhV0P5d/y
	MpVu94QQPx+gTI7RG5jnvVffp4V+Fm7MMk0HY3kWtiP6O8QtLXrVJ2mW4d4NAaUJ
	s9cg+leSs4W5ujZWHmRXYHgizKWwZsDgHf0avlQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2EekE1/ihigsD9cpT1zjckYuZWhHwzubHH7Yq0Fu3mo=:aN06lza12BkjUCxSt1YCAEpD4/EDAaGcSM6aQTrH8G4=;
X-ME-Sender: <xms:AQnJagjwdlVd8z7gCtdVBR6HbPTSyQBkPcWa1eqcfO-C-hNSlZU9Vw>
    <xme:AQnJaqpqdIwZo3hkp9EkmO06fCZ4T1MNFWVncVWFn-uO3hTYfMJOa_k4Jtj7XmYEg
    76S-hO067lYJLyOvKfmKqx0d0S43_98lBvEMG0ho_5oC30CCd5D4Bff>
X-ME-Received: <xmr:AQnJasIL4IzGDOdZMa8vph0P1r6RnM_zaH-tbrYsacywPKS6wIyRBG8ulh0>
X-ME-Proxy-Cause: dmFkZTGIoGBLZMaAhgcaayk5wgp7rW9vayQkfonvs0TKGSEuuYzL1U5eWR8oX+vcbxv0ak
    vZ6V5Fk2n6N+IaumklX1qzBk7r0hEpcbcO59DsZzPQwz0SNLq5ubZVbwk/A0B0ImP1q9S/
    wvMCjtg/pGCexbzTYCAAsFMX+sI9bOrGKjIjV+CjlMDzV5ttTW2+3V5NxcPyUYh3hDVmY6
    5SaA7LVa7G47KypkYvo+NaxjJdB6S0C6Hb2KUpv2JaxJ1DNuAn/rjb2TmQMM/Oo0fomkKJ
    59473bNh2ppMgxEJkQDpXpn3GMfvTNgjovDF8A3Cgd0ETDAPdqWfdTSt6z83qaSG77WHP8
    E4WWrJXXsQ2prSH4+1DTNTm28udL3c4lzRGqwr+lm4HrCPdGDs+Qg1hs9wSN6t/rZAglOW
    hCxFh49dbPpj91VhuzQBsymuJR70MzKcnMX5mySqGuv+UgvWB3DU/XOYDVEAYxanagyVAe
    X49v0ytuoddIWVpRhSTGJHm0LeD6PVOg5oB0RKF0swxBTYUQMFz4rNbYoU2ESGpbB6u4f8
    krcEXW+jI3jdWaP+/YN7vNwcXI9leb+BgVNgSrqDB4Zw0xuK3Y6ZYxMsQjZcO5ry6Mb5ro
    Qx6Iqza9jJXjk22SJonaFwHTioFaiA21Ig6n+p+rqQVB3fYop6gloG8mrdjw
X-ME-Proxy: <xmx:AQnJanv03h7_v-57WjsLZOYrJZZGbpX4ri_MhBdbmW-4k2Akz_xgiw>
    <xmx:AQnJass28030c2MUlvAhqXDiuJ1Ltd4xWBMQqbDdce6MpE_bNu3o8w>
    <xmx:AQnJauWpPUOQr24Jz3GluKedtVDoVYTRaKjE5zTQ2TjROsCyuMomRg>
    <xmx:AQnJalUlLZVN2UWzA4gs67puE_dgEG175S_NpvYHklXAM2hStZED9Q>
    <xmx:AQnJarg7RUIubmank2IKctS2L_oP37LydzfO6W49o1W7mD6eonaOJs2b>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 11:32:16 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Shuah Khan <shuah@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 1/4] selftests/mm: open pagemap and kpageflags once for check_huge()
Date: Fri,  9 Oct 2026 16:32:05 +0100
Message-ID: <20261009153210.236517-2-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009153210.236517-1-kirill@shutemov.name>
References: <20261009153210.236517-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

check_huge_anon() and check_huge_file() open /proc/self/pagemap and
/proc/kpageflags on every call.  The khugepaged test calls them hundreds
of times.

Open both once and keep the descriptors.  A pagemap descriptor is tied
to the mm of the process that opened it, and the khugepaged fork() cases
call check_huge() from the child, so reopen it when getpid() changes.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 62 ++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 762c31f7dfab..09d9135f0ca8 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -22,6 +22,44 @@
 unsigned int __page_size;
 unsigned int __page_shift;
 
+/*
+ * A pagemap file reads the mm of the process that opened it, so a child
+ * inherits a descriptor that describes its parent.  Open a new one whenever
+ * the pid changed since the last open.
+ */
+static int pagemap_fd_get(void)
+{
+	static int fd = -1;
+	static pid_t pid;
+
+	if (fd >= 0 && pid == getpid())
+		return fd;
+
+	if (fd >= 0)
+		close(fd);
+
+	fd = open(PAGEMAP_PATH, O_RDONLY);
+	if (fd < 0)
+		ksft_exit_fail_msg("open pagemap fail\n");
+	pid = getpid();
+
+	return fd;
+}
+
+static int kpageflags_fd_get(void)
+{
+	static int fd = -1;
+
+	if (fd >= 0)
+		return fd;
+
+	fd = open(KPAGEFLAGS_PATH, O_RDONLY);
+	if (fd < 0)
+		ksft_exit_fail_msg("open kpageflags fail\n");
+
+	return fd;
+}
+
 uint64_t pagemap_get_entry(int fd, char *start)
 {
 	const unsigned long pfn = (unsigned long)start / getpagesize();
@@ -407,7 +445,6 @@ static bool check_huge_type(uint64_t categories, enum check_huge_type type)
 static bool __check_huge(void *addr, size_t len, int nr_hpages,
 		uint64_t hpage_size, enum check_huge_type type)
 {
-	bool ret = false;
 	int pagemap_fd, kpageflags_fd;
 	int nr_pmd_mappings = 0;
 	uint64_t pmd_pagesize, scan_mapping_size;
@@ -426,42 +463,33 @@ static bool __check_huge(void *addr, size_t len, int nr_hpages,
 	/* Some mTHP tests check a partially populated PMD-sized range. */
 	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
 
-	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
-	if (pagemap_fd < 0)
-		ksft_exit_fail_msg("open pagemap fail\n");
-
-	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
-	if (kpageflags_fd < 0)
-		ksft_exit_fail_msg("open kpageflags fail\n");
+	pagemap_fd = pagemap_fd_get();
+	kpageflags_fd = kpageflags_fd_get();
 
 	if (!check_pmd_mapping &&
 	    !check_large_folios(pagemap_fd, kpageflags_fd,
 				addr, len, nr_hpages, hpage_size))
-		goto out;
+		return false;
 
 	for (; start < end; start += scan_mapping_size) {
 		categories = pagemap_scan_get_categories(pagemap_fd, start);
 		pfn = pagemap_get_pfn(pagemap_fd, start);
 		if (pfn == -1UL) {
 			if (!allow_nonpresent)
-				goto out;
+				return false;
 			else
 				continue;
 		}
 		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
 			nr_pmd_mappings++;
 		if (!check_huge_type(categories, type))
-			goto out;
+			return false;
 	}
 
 	if (check_pmd_mapping && (nr_pmd_mappings != nr_hpages))
-		goto out;
-	ret = true;
+		return false;
 
-out:
-	close(pagemap_fd);
-	close(kpageflags_fd);
-	return ret;
+	return true;
 }
 
 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
-- 
2.54.0

