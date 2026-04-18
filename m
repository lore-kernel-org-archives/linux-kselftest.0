Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349F359A8C;
	Sat, 18 Apr 2026 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509896; cv=none; b=SIhUBmARHMUMXBy5DrALVRE8UfGVnVOO5MIgk2Tf+1EGw9tYf2lMZfCYJBfSs/P7g++qhiRhKqnDyluHAqAWcATrYepgohwQAhdpbGXlsbYc+ZoaXIaEOcO2q+2wTv8Wc0jAukvlZ9bCevdLQc/pVrNE/J1tTSGv4jbjgzTH+GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509896; c=relaxed/simple;
	bh=6tmwrYqrWIbuMw5GfhGQhH/MUUQ+JMHsDHml8bmka3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRGT362nKS6vUEpBoD6d91MUPJDRlbOevdFu24hS7KsGK8Aq125NYX1lieSC1yTr+WfWiJAEirwNizk99T2TF4Pxmrejz+zNhZl+b37aBcZiu0XfIEA0cVSoc1LGaFFzNAO82u5kzSQMnDSqF1QYZufi9E56bvH5hFi/JdKur3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGeA0rJG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGeA0rJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7C7C2BCB3;
	Sat, 18 Apr 2026 10:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509896;
	bh=6tmwrYqrWIbuMw5GfhGQhH/MUUQ+JMHsDHml8bmka3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGeA0rJGx3EWp9zaN0FaHGeJ9lm88kv7Bj7KXhkxuDxTaqqIzTlQsYOEk+jLaeFt8
	 FTyfJkn+83E5IkPSZyF/k1gHsjGb1COu3oaE0i7mUUxIauWfNI8s9ws0BaaB5ZKYq/
	 732rTBshW5d65zXNh87oPwri3SVXrEdZ60BlDqmB95Mn18DB1m+EAxoSAN8CY8bv3/
	 RbyenMAz6F7hQsyOCLvghFYFLYTiaFul8Bw1D4DWM7A7STNWFvg8i586c7KMh4w70l
	 A3J7RNJrd9Kxtd3kG4BFO3d+LvT8zaZIrQt4Fn4S93PGQ8/2UBxJMao4UlR8pkVfxm
	 AuR81iyjr58Kw==
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
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: [PATCH v2 24/53] selftests/mm: hugepage_settings: add APIs to get and set nr_hugepages
Date: Sat, 18 Apr 2026 13:55:09 +0300
Message-ID: <20260418105539.1261536-25-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
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

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.c  | 25 +++++++++++++++++++
 .../testing/selftests/mm/hugepage_settings.h  | 23 +++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index 8f563315b1fc..5961229b9931 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -464,3 +464,28 @@ unsigned long get_free_hugepages(void)
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
index 9357d07e6c1b..d6f41a45e8ee 100644
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
 #endif /* __THP_SETTINGS_H__ */
-- 
2.53.0

