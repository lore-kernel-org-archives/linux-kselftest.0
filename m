Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB670449EB1;
	Mon, 11 May 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517120; cv=none; b=A2YlaA5pyfFOknkDSM20mqaIdKCtTcmw0JvJozeHZI8beUZEkejsEVx+W9gt3UaUJR7Sl7oUWquyJFvmOVmzldN9hZbD6oX1F3DjZMl02T0Y1h/degx7lB6MYDZgQ2xKJuQphTzN11FiMpnF/TWhXJwdJH7NTaGJ/pUBWbiDI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517120; c=relaxed/simple;
	bh=rmP5e2hdK4hiT4tsRu7QEXhstLJKWL/WS7omafjwqSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLJbyo041oCGA736GKMvAmaf1+T0Ai3lkt/wD50wNP6DOH+MUBF1giIPjkMyxi6cU9mG6zY7kDjeetEegSr8LOT/X4Ndk4NCs9jg5pZj5fRRQ4UE58NFke7yzQKkhxrNx+KojtnzT9iKU84drlYsiEQl5WtU7ecafbhFdURbnr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlFYrPwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlFYrPwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C47C2BCB0;
	Mon, 11 May 2026 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517119;
	bh=rmP5e2hdK4hiT4tsRu7QEXhstLJKWL/WS7omafjwqSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SlFYrPwMR6CMDzRKHDRgD1ICHWASJeFSJRYxma//rVMZoO5SYUjSc339zsmZcjewj
	 FO/8ofCvq/4fESWzoUkv5b40Ipnxnt/6zS01Zh2VjmCfky+ts/KfcVmYWk5ixoQIND
	 RvNvotFZxZpn9cpUSLh9Gotka63yEEB/4iJiRv4WRK4aHlOvSiJCmOMhRIJ03R0wEg
	 UcGfND29NPQPDIFK6cXzSNmdOGvoXlcKiqg3Z4EY204wZGWAYYwCeiel9nivwDn7eY
	 WUf0Qdo8qxSfJhkgsr67UtLCn2tnSP1e3VVOpAfaUEtFT8cmnj0fLeAugA5jGg9J6L
	 RKC9G06Q4XtZw==
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
Subject: [PATCH v4 29/55] selftests/mm: move read_file(), read_num() and write_num() to vm_util
Date: Mon, 11 May 2026 19:28:13 +0300
Message-ID: <20260511162840.375890-30-rppt@kernel.org>
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

These are useful helpers for writing and reading sysfs and proc files.

Make them available to the tests that don't use thp_settings.

While on it make write_num() use "%lu" instead of "%ld" to match
'unsigned long num' argument type.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.c  | 41 -------------------
 .../testing/selftests/mm/hugepage_settings.h  |  4 --
 tools/testing/selftests/mm/vm_util.c          | 39 ++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h          |  3 ++
 4 files changed, 42 insertions(+), 45 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index 01a557f372d1..2eab2110ac6a 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -48,47 +48,6 @@ static const char * const shmem_enabled_strings[] = {
 	NULL
 };
 
-int read_file(const char *path, char *buf, size_t buflen)
-{
-	int fd;
-	ssize_t numread;
-
-	fd = open(path, O_RDONLY);
-	if (fd == -1)
-		return 0;
-
-	numread = read(fd, buf, buflen - 1);
-	if (numread < 1) {
-		close(fd);
-		return 0;
-	}
-
-	buf[numread] = '\0';
-	close(fd);
-
-	return (unsigned int) numread;
-}
-
-unsigned long read_num(const char *path)
-{
-	char buf[21];
-
-	if (read_file(path, buf, sizeof(buf)) < 0) {
-		perror("read_file()");
-		exit(EXIT_FAILURE);
-	}
-
-	return strtoul(buf, NULL, 10);
-}
-
-void write_num(const char *path, unsigned long num)
-{
-	char buf[21];
-
-	sprintf(buf, "%ld", num);
-	write_file(path, buf, strlen(buf) + 1);
-}
-
 int thp_read_string(const char *name, const char * const strings[])
 {
 	char path[PATH_MAX];
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index c07722b7f102..726c73c43c05 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -66,10 +66,6 @@ struct thp_settings {
 	struct shmem_hugepages_settings shmem_hugepages[NR_ORDERS];
 };
 
-int read_file(const char *path, char *buf, size_t buflen);
-unsigned long read_num(const char *path);
-void write_num(const char *path, unsigned long num);
-
 int thp_read_string(const char *name, const char * const strings[]);
 void thp_write_string(const char *name, const char *val);
 unsigned long thp_read_num(const char *name);
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 412e980cce9a..9256bbbe38ea 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -698,6 +698,27 @@ int unpoison_memory(unsigned long pfn)
 	return ret > 0 ? 0 : -errno;
 }
 
+int read_file(const char *path, char *buf, size_t buflen)
+{
+	int fd;
+	ssize_t numread;
+
+	fd = open(path, O_RDONLY);
+	if (fd == -1)
+		return 0;
+
+	numread = read(fd, buf, buflen - 1);
+	if (numread < 1) {
+		close(fd);
+		return 0;
+	}
+
+	buf[numread] = '\0';
+	close(fd);
+
+	return (unsigned int) numread;
+}
+
 void write_file(const char *path, const char *buf, size_t buflen)
 {
 	int fd, saved_errno;
@@ -721,3 +742,21 @@ void write_file(const char *path, const char *buf, size_t buflen)
 		ksft_exit_fail_msg("%s write(%.*s) is truncated, expected %zu bytes, got %zd bytes\n",
 				path, (int)(buflen - 1), buf, buflen - 1, numwritten);
 }
+
+unsigned long read_num(const char *path)
+{
+	char buf[21];
+
+	if (read_file(path, buf, sizeof(buf)) < 0)
+		ksft_exit_fail_perror("read_file()");
+
+	return strtoul(buf, NULL, 10);
+}
+
+void write_num(const char *path, unsigned long num)
+{
+	char buf[21];
+
+	sprintf(buf, "%lu", num);
+	write_file(path, buf, strlen(buf) + 1);
+}
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 195bf2e26792..5fc9707f6b9a 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -165,3 +165,6 @@ int unpoison_memory(unsigned long pfn);
 #define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
 
 void write_file(const char *path, const char *buf, size_t buflen);
+int read_file(const char *path, char *buf, size_t buflen);
+unsigned long read_num(const char *path);
+void write_num(const char *path, unsigned long num);
-- 
2.53.0

