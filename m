Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4B3A4F23;
	Mon, 11 May 2026 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517100; cv=none; b=LjJkthDCpxB+ZNCO59PdNTHo78v2DVF7A1p7y6RQuKggoAA+N+hK0L77aJMoe5zTtuvTb869/nO1zep46GFbo8WZqxe3UHiW8kn/sOoEbc5zWDowU9A9dvlbo5mtkNW9WmTxj+lk0zf7+c3hbOAoe0kCBN/K+GFEO+mVvIwFbBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517100; c=relaxed/simple;
	bh=pXMsXnfWgM/h8m4iqvonRVvJ3etoKtdEnVR62w9G5c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiNVBSd8bmqjOILm4tLmqda1AqeEPdEyIMX6t6J54ju+e/Ol9n7wb+jLXry+6pfLBe7Zzlk8lRgX8CzrrhQjOFbVXPcfTFRAMlZ+UCBNcP2hv05thQsjM+lWfmYAMWVha4GsQfa6pXSleFaiue4HgyMOTmherdT1JoimXj1qmDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjYNyoLN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjYNyoLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037D9C2BCC9;
	Mon, 11 May 2026 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517100;
	bh=pXMsXnfWgM/h8m4iqvonRVvJ3etoKtdEnVR62w9G5c0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PjYNyoLND5Zg6UaBYPSQw5v0x/Vy47GLwb8zx8AoTqLfjseDimzGA4KpTXjS3f2aR
	 eqQQkOAi4IRYToUe/txG4NTBGHFBHnPUfw+YpCedkz3v9DiTnWoqQjGxKxV78vGz/z
	 toWzuQMu11kE2aQIMJlCN2XiathLHZT+WzDbWvVlI8rG8MhGQG+6pR0GG0RJj8Gybm
	 SPavGf8DuhNvqj8mJCE3U6LlWmaOheL6Wfj8FZaMp468PEPt7j82qlI25sxLwX/4qh
	 pg/HyWd+zlqO34m5UrZTg6tHA1s/SS+QLBUDoTGfF2jQWKHHLziIh7laJJzVkad1cn
	 AbEN6ZLFklXnw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Li Wang <li.wang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v4 26/55] selftests/mm: hugepage_settings: add APIs to get and set nr_hugepages
Date: Mon, 11 May 2026 19:28:10 +0300
Message-ID: <20260511162840.375890-27-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Add APIs that allow reading and writing of

/sys/kernel/mm/hugepages/hugepages-NkB/nr_hugepages

to detect and change the amount of HugeTLB pages of different sizes.

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.c  | 25 +++++++++++++++++++
 .../testing/selftests/mm/hugepage_settings.h  | 23 +++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index fa635667aabb..99402cfccb6d 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -463,3 +463,28 @@ unsigned long get_free_hugepages(void)
 	fclose(f);
 	return fhp;
 }
+
+static void hugetlb_sysfs_path(char *buf, size_t buflen,
+			       unsigned long size, const char *attr)
+{
+	snprintf(buf, buflen, "/sys/kernel/mm/hugepages/hugepages-%lukB/%s",
+		 size / 1024, attr);
+}
+
+unsigned long hugetlb_nr_pages(unsigned long size)
+{
+	char path[PATH_MAX];
+
+	hugetlb_sysfs_path(path, sizeof(path), size, "nr_hugepages");
+
+	return read_num(path);
+}
+
+void hugetlb_set_nr_pages(unsigned long size, unsigned long nr)
+{
+	char path[PATH_MAX];
+
+	hugetlb_sysfs_path(path, sizeof(path), size, "nr_hugepages");
+
+	write_num(path, nr);
+}
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index f49bd7fba512..e66302926377 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -94,4 +94,27 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max);
 unsigned long default_huge_page_size(void);
 unsigned long get_free_hugepages(void);
 
+unsigned long hugetlb_nr_pages(unsigned long size);
+void hugetlb_set_nr_pages(unsigned long size, unsigned long nr);
+
+static inline unsigned long hugetlb_nr_default_pages(void)
+{
+	unsigned long size = default_huge_page_size();
+
+	if (!size)
+		return 0;
+
+	return hugetlb_nr_pages(size);
+}
+
+static inline void hugetlb_set_nr_default_pages(unsigned long nr)
+{
+	unsigned long size = default_huge_page_size();
+
+	if (!size)
+		return;
+
+	hugetlb_set_nr_pages(size, nr);
+}
+
 #endif /* __HUGEPAGE_SETTINGS_H__ */
-- 
2.53.0

