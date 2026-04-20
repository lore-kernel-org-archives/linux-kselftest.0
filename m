Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBCB28000F
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692815; cv=none; b=BzOAG52+youilPfF5aMZAgoDQy+KSpsDTCKKDMOvN818IMRx+B8f/mXYX1e7wQind7N5fhX0c/yOdHKDgDGzPZhLlyHpLuqbGdKQK/lihcFzpZ4lptpTY82Js1qcuWH+3i8SSpCllfFYuYdUt9NZSA0jnvh6FYGeKLxnT287Q5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692815; c=relaxed/simple;
	bh=7e3Jv1hIBDXr8+1tQjy6HqPVRAwUWQkas33WNmF25rU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LuNOdCqkD49puWqlb8UWVZi0xH2sGmMcWbxnm7rFETd+NR2xOnt/QifQfLUrHk2rMnkAcpSQZZr2AFyyOqZEpWokshLP66os5yN7ziq3++TKFqrSUpm/QxOiTGsf+5WRPgRaHhmQ2HV8VuIPOeY7XYmzfNNZflKxxIhUFko5ads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gmg/2BdQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gmg/2BdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776692812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WSlaPufJUm31B5UrUIPJHDj4SD8uuuIu+HPiYK3Sn6o=;
	b=Gmg/2BdQE/6mpZv3wkdkkmc5H1G06m5+QxNV2/jfkZNXVZz+9YHL3C4/jWpCsF4w/qQMRS
	BgDml8+DpottuLBCHHb++d/huxKhG0Jp7lXgeJTYS/AguUfxIECJmX7a5iWd7zgu6XpcNy
	eurcKVicQwsi9mF6ghp2yvcodeQsGkk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-372-e2TyLXTRM9-8PWHrrVAy-Q-1; Mon,
 20 Apr 2026 09:46:49 -0400
X-MC-Unique: e2TyLXTRM9-8PWHrrVAy-Q-1
X-Mimecast-MFC-AGG-ID: e2TyLXTRM9-8PWHrrVAy-Q_1776692805
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C82601956067;
	Mon, 20 Apr 2026 13:46:44 +0000 (UTC)
Received: from fedora (unknown [10.44.49.212])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D886C3000C15;
	Mon, 20 Apr 2026 13:46:38 +0000 (UTC)
Received: by fedora (sSMTP sendmail emulation); Mon, 20 Apr 2026 15:46:37 +0200
From: "Jerome Marchand" <jmarchan@redhat.com>
To: bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Jerome Marchand <jmarchan@redhat.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/bpf: Page out as late a possible in file_reader
Date: Mon, 20 Apr 2026 15:46:37 +0200
Message-ID: <20260420134637.2513867-1-jmarchan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The file_reader/on_open_expect_fault fails consistently on my system.
It expects a page fault on first dynptr read of some range the exe
file of the current process because it has paged out that page range
earlier. However a lot can happen to that range (which depending on
the actual memory layout could contain text section, data section,
sections )related to dynamic linking...) between the moment it was
paged out and the moment the bpf program expected to hit a pagefault
actually run.

A bit of instrumentation with mincore() shows that pages from that
range were accessed several times before the program is run. In
particular the call of file_reader__load() seems to fault all the
range in.

Move the call to madvise(MADV_PAGEOUT) to just before attaching the
program to minimize the risk of having those page pulled back in from
under our feet.

Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
---
 .../selftests/bpf/prog_tests/file_reader.c    | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/file_reader.c b/tools/testing/selftests/bpf/prog_tests/file_reader.c
index 5cde32b35da44..48aae7ea0e4bb 100644
--- a/tools/testing/selftests/bpf/prog_tests/file_reader.c
+++ b/tools/testing/selftests/bpf/prog_tests/file_reader.c
@@ -10,6 +10,7 @@
 
 const char *user_ptr = "hello world";
 char file_contents[256000];
+void *addr;
 
 void *get_executable_base_addr(void)
 {
@@ -26,8 +27,7 @@ void *get_executable_base_addr(void)
 static int initialize_file_contents(void)
 {
 	int fd, page_sz = sysconf(_SC_PAGESIZE);
-	ssize_t n = 0, cur, off;
-	void *addr;
+	ssize_t n = 0, cur;
 
 	fd = open("/proc/self/exe", O_RDONLY);
 	if (!ASSERT_OK_FD(fd, "Open /proc/self/exe\n"))
@@ -52,16 +52,6 @@ static int initialize_file_contents(void)
 	/* page-align base file address */
 	addr = (void *)((unsigned long)addr & ~(page_sz - 1));
 
-	/*
-	 * Page out range 0..512K, use 0..256K for positive tests and
-	 * 256K..512K for negative tests expecting page faults
-	 */
-	for (off = 0; off < sizeof(file_contents) * 2; off += page_sz) {
-		if (!ASSERT_OK(madvise(addr + off, page_sz, MADV_PAGEOUT),
-			       "madvise pageout"))
-			return errno;
-	}
-
 	return 0;
 }
 
@@ -90,6 +80,14 @@ static void run_test(const char *prog_name)
 	if (!ASSERT_OK(err, "file_reader__load"))
 		goto cleanup;
 
+	/*
+	 * Page out range 0..512K, use 0..256K for positive tests and
+	 * 256K..512K for negative tests expecting page faults
+	 */
+	if (!ASSERT_OK(madvise(addr, sizeof(file_contents) * 2, MADV_PAGEOUT),
+		       "madvise pageout"))
+		goto cleanup;
+
 	err = file_reader__attach(skel);
 	if (!ASSERT_OK(err, "file_reader__attach"))
 		goto cleanup;
-- 
2.53.0

