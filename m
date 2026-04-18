Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F13596F8;
	Sat, 18 Apr 2026 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509921; cv=none; b=BRXaCkCJRLoza9qk9BtU0kLraEyMz7YyP8eu/ph2HEOeH98k/GY8HoexDi1dKmlHpFnKU6+tOyeYhUspMDkP+Y5j0Qm1bCH0nHiUpuTpaojOHFhOS8RoOVyUjiCCz7VNOuvQzN9SwR75xJ72hPIsLQgVRg4BiRIrB94X/yILd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509921; c=relaxed/simple;
	bh=tO4w/saWs4TngI1dGJjVb/BDaQv7f0xtr7dZaOtNvYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAXwgUi22clJ9pSyRLr/ww9BfEDsH+/ELkqdt1Z9YYvAECFR9wknqDKQ7PXAXDYZTfekyoRRTeKP3FXjvDwe7SZIGTxamTezY1dzaM8D6I2zhIY05jUmZmPAJ8bs5UuYqRv+keM3KfxckNwJLmyKYc1eEA73cwRaxrThA4iuXT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6KSaXQZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6KSaXQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F9AC19424;
	Sat, 18 Apr 2026 10:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509920;
	bh=tO4w/saWs4TngI1dGJjVb/BDaQv7f0xtr7dZaOtNvYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N6KSaXQZaGAhrrP5EcrMULI1xIeSosu5JdbGWyBKBsyIj2G8+D16czUib5V1hugDO
	 kvUh6fNx/3oZReBNgCjX+Y8WpX6Su1MyhFviBLBbiQB2PEzmqNJRpiFcsmpXUaMmpL
	 avsWfPvrxXxK5zyRvV9ertZ0j5T0R4j8BIX/x6OzFjtwsd4VMoO5QbMpY56CA8MUjX
	 wxQfr9YksbgooACyHgtWmbpDE1zHr2gddjCTon3ck5mGkBhgJp/AMYxPmuRhBUYRpc
	 4a5GZw4Ni1XQGTUaODB2Dve8PR8ow5L/mCtOa7r9HZk5qXiAu7GvP+j77y8InVBX0y
	 DfQeO5QqnPXzQ==
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
Subject: [PATCH v2 28/53] selftests/mm: vm_util: add helpers to set and restore shm limits
Date: Sat, 18 Apr 2026 13:55:13 +0300
Message-ID: <20260418105539.1261536-29-rppt@kernel.org>
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

hugetlb-shm and thuge-gen tests require that limits defined by
/proc/sys/kernel/{shmmax,shmall} should be higher than certain values.

Add helpers that allow setting these limits and restoring their settings on
a test exit.

They will be used later in hugetlb-shm and thuge-gen.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 28 ++++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |  9 +++++++++
 2 files changed, 37 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 752566f75c0b..5a89c2d903be 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -761,3 +761,31 @@ void write_num(const char *path, unsigned long num)
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

