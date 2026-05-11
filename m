Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17A43DA3F;
	Mon, 11 May 2026 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517126; cv=none; b=Lzl2yg0jnMYkJ9vKb/BI/Xrm+fLsdWQpSQWgkpiBjRASqWsApaumiiVhplzm91TV6kp6H4NLvj6jL4oBYbnXcyeSpBQzMRBEbOBW76Cr9Rwt31ko2iAve4TIyOsdctEDBe+Qoxth48RXo2LwXuw04/DsRnNifL2CH+rU9U3dt/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517126; c=relaxed/simple;
	bh=z0JhOy+pHH/aI/Vimu7SOjVZzwdCPvl2MrL9FynQd78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMsR6A0KxQikkn3ZsSlosmnlMfmCbCyBtzcx3C0tbG7U8+HTDj1n1bBGsyuwsAOdCneFT2PtoCnwKqqW2xdTOZkqdqSher2fkkTNC8JRxVLVXJQ1sn3K+p3LWKiL3VxS1dxD4MrUlxnU7Xt6oSd+P8LfIMmfBZItYMMz8/Uui+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pa7utrSP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pa7utrSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D5DC2BCB0;
	Mon, 11 May 2026 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517126;
	bh=z0JhOy+pHH/aI/Vimu7SOjVZzwdCPvl2MrL9FynQd78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pa7utrSPXMPGNdz7bT41cMR+W0vj3TNLW7cbRM4lEY6I+HX4WtA6+BPt4o18iOvw7
	 AlIyzj4lOIQVm1ifNXdnYVZsryhRNNIPW0LaoFn7R15NwAtKm0B+k3GZ3cdDctIfSg
	 ADfOS3lRarImeNqPRshM7+B/J3lZ/cXhSX3axHtqk8R6Z0jmm6+flF1yU0+RP2Vu7F
	 Cd3SPW4aI9ZJOJxHQcuPrAsxrcOmtrMQUjmPsFXbR34uGBRrbBKSiwRTGinrRVsQ1W
	 yj4rp+jDJFWD6LdwoJEw/9lnMQlz0BvYcLeoAi+t7I1XULXNFQDFEY/oFrJoVscAhV
	 7nXoG4EEJxruA==
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
Subject: [PATCH v4 30/55] selftests/mm: vm_util: add helpers to set and restore shm limits
Date: Mon, 11 May 2026 19:28:14 +0300
Message-ID: <20260511162840.375890-31-rppt@kernel.org>
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

hugetlb-shm and thuge-gen tests require that limits defined by
/proc/sys/kernel/{shmmax,shmall} should be higher than certain values.

Add helpers that allow setting these limits and restoring their settings on
a test exit.

They will be used later in hugetlb-shm and thuge-gen.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 28 ++++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |  9 +++++++++
 2 files changed, 37 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 9256bbbe38ea..336a26751d3f 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -760,3 +760,31 @@ void write_num(const char *path, unsigned long num)
 	sprintf(buf, "%lu", num);
 	write_file(path, buf, strlen(buf) + 1);
 }
+
+static unsigned long shmall, shmmax;
+
+void __shm_limits_restore(void)
+{
+	if (shmmax)
+		write_num("/proc/sys/kernel/shmmax", shmmax);
+	if (shmall)
+		write_num("/proc/sys/kernel/shmall", shmall);
+}
+
+void shm_limits_prepare(unsigned long length)
+{
+	unsigned long nr = length / psize();
+	unsigned long val;
+
+	val = read_num("/proc/sys/kernel/shmmax");
+	if (val < length) {
+		write_num("/proc/sys/kernel/shmmax", length);
+		shmmax = val;
+	}
+
+	val = read_num("/proc/sys/kernel/shmall");
+	if (val < nr) {
+		write_num("/proc/sys/kernel/shmall", nr);
+		shmall = val;
+	}
+}
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 5fc9707f6b9a..ea8fc8fdf0eb 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -168,3 +168,12 @@ void write_file(const char *path, const char *buf, size_t buflen);
 int read_file(const char *path, char *buf, size_t buflen);
 unsigned long read_num(const char *path);
 void write_num(const char *path, unsigned long num);
+
+void shm_limits_prepare(unsigned long length);
+void __shm_limits_restore(void);
+
+#define SHM_LIMITS_RESTORE()						\
+static void __attribute__((destructor)) shm_limits_restore(void)	\
+{									\
+	__shm_limits_restore();						\
+}
-- 
2.53.0

