Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48436215D
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786661624; cv=none; b=ljx4+hhVmF95mUfhlRAdpu4ESzD7UF7XjGyHibHfW0Z6Z0XAxK9e+39UnIQTOj9VwJ4usaiZv8PHCtU9+JdSGsVEVR9BeISWZP/i0xlNa97PTslDsrvQun+cVyE/ePoNC25kpLq7mIcwjLUajjmDUof3lzJRz9vJviW0I0Uwq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786661624; c=relaxed/simple;
	bh=TEkdEtWWelkeGOFWgyUwKKWPnFifo34zhVuv5pR/4NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V9ZpR5mXfPHzFR40sWXHmIPYh6LGcPmHDz9rwTedwwXJOxxOEKk5kOyzmuM4QVcFIyg0CWlt+czJc36UGErAvFkHzRtJ8sFNVxXWy2BRVoJrhWCE2Ff6OY6Pnc/1H1kCHXXoi1Z0YPf5ZB8QXKLheCUmjjKBusr++cjzxR0YYm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJ/WxpvL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJ/WxpvL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf52d15d88so4290225ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786661622; x=1787266422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QcZaXKSZ+vl5BQB5E9TRFwg6GdaSdB6v8ybUxPjYbic=;
        b=sJ/WxpvLmc7xDihGq+PUE94XPAnTVynvzMI7HxmU6x2lEzm7ChTCVlFYrm9h5y1wuj
         uiJseoJHx5mdDwb5GqFUP+iK86P7zyatrNYuFO0hLG4bWRZATxESi2YGeCiuvST2Ft6h
         CcbfpbLMdjx+0I/TCFA0oy8hm9h+wbV3Xqmy1V5a1XxaktszTJAtH+DC/2hw1Ithx9fE
         eu5xnLOzUfaxoTd6/IdSH+fjVxSPzIcMyLxNcRuiX/smEFE++iqnZ0H/1kqBO9XcAFRE
         OsZv8J2MxzoDCyLg+42oBdmvE5Z9BF5mHu2oupLSanvH15aAfMjohFtqzbXGkhXmRB3z
         oJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786661622; x=1787266422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcZaXKSZ+vl5BQB5E9TRFwg6GdaSdB6v8ybUxPjYbic=;
        b=AT1XfqVapa9vg1tFHnWuk5/3wbZdamP5RW8LAaTLwOosREKtrpzvDXuv6tQsIr63Xt
         8uW3U9lg3Ud9qu+Ubwv9r6uiQQ5sAk4+4B72wlLSmqol4Jqm4BRHI0mzd+SKv502j9dp
         TJiuK44PIEppk6fsXfhYz9Vu0QT8Bpb/gJRSlUOByihCMG06gvI3Ci1blioevHArtuET
         h/eDfrg6OWLS9+TPloZROUZv5jNTBCCStszPJoJ82QmKeakL0a4pSxMb5jPy293qf+Dh
         g3X8ovGJDq01M8EKatG1Xh2QYMA+d3Ilr0jjDWUcG+2dCTazpuYWwO5EJ770bOLknsAm
         GKBw==
X-Forwarded-Encrypted: i=1; AHgh+RpjRfYob4RrfYtYcSdZzJYcuI75igfCoCSwkbkOeFLNW5Eg/ZiyhKSxAuOp8mcPdJ4MISgvVRlgfek2Yn+mTRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHlpMgtZPYsWNPqYyqPA7j2YIT5tdn0es4wU7Oo2rV5iDpG+Z
	gKnLLEo5xklgz00VvokYMlTV2IuWnThZ0ijHkHha0G4hujjfMs3+ynsc
X-Gm-Gg: AR+sD12x0T8b/uMl+rhN13GpNr9XSs8DDtwExLZHajvsenliQtrlFKnZMoHfcA0CTum
	oZkfC92MAmV1Tc1U3Zj3z3LkL9r5xHTqxPL38A0JqzPKu7EYmauUSolOa01CNns8D9dKKvOMKnP
	hGtzFLaSifFD3GDb4E4xRDo6bOrlj0syrITSB8oI67aabgLoxwRfgWJpNKfEG/JwC2uw3pNV3mo
	VixK1Wb5/3Wtge4AiVdK7TJBDmuEN1QfU9uMIM5uYollAiF+4XqcIDJ5he+XFcIQwXp3l4tIHOo
	aKgwgprrPBi8YE+aLBWh6Cjsk74+4RAJ192beJNXoQaSbzYebJq93rACIedfz1HGtvbaB9fJ9vQ
	x7jXOa8wAkUDSIiyU0yecLSevCd409GzqJmMVNuk6+ahKYrViiQgxuIKMsxgT+p+6ENZ+93anRh
	Te/CADGhBm0csjHZwsE+pXFntRejqykWJMPzdT1Itq4XJ/It2cf5NTNYty0/c+fl3xB86+UtXg
X-Received: by 2002:a17:903:9cf:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2d3b0d1302amr15512025ad.14.1786661622331;
        Thu, 13 Aug 2026 15:53:42 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae804b32sm2657265ad.35.2026.08.13.15.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:53:40 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH] mm/secretmem: prevent uncharged mremap expansion after fork
Date: Fri, 14 Aug 2026 07:53:28 +0900
Message-ID: <20260813225328.2010303-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Secretmem mappings are charged against RLIMIT_MEMLOCK and marked
VM_LOCKED because their pages are unevictable and removed from the direct
map.

dup_mmap() clears VM_LOCKED on the child copy, but mremap() uses that
flag to decide whether an expansion needs a memlock limit check and
accounting. An unprivileged child can therefore expand an inherited
secretmem VMA past its limit and populate the added range.

Add a VMA open callback that marks secretmem copies without VM_LOCKED as
VM_DONTEXPAND. dup_mmap() invokes the callback after clearing VM_LOCKED,
while the original charged mapping retains its existing ability to grow
within the limit.

Add a selftest that verifies expansion of an inherited secretmem VMA is
rejected.

Fixes: 1507f51255c9 ("mm: introduce memfd_secret system call to create "secret" memory areas")
Cc: stable@vger.kernel.org
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 mm/secretmem.c                            | 11 +++++
 tools/testing/selftests/mm/memfd_secret.c | 58 ++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 4877c262cb1f6f..e5878ce91c768c 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -108,7 +108,18 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static void secretmem_open(struct vm_area_struct *vma)
+{
+	/*
+	 * dup_mmap() clears VM_LOCKED before calling ->open().  Prevent an
+	 * inherited, uncharged mapping from being expanded by mremap().
+	 */
+	if (!vma_test(vma, VMA_LOCKED_BIT))
+		vma_set_flags(vma, VMA_DONTEXPAND_BIT);
+}
+
 static const struct vm_operations_struct secretmem_vm_ops = {
+	.open = secretmem_open,
 	.fault = secretmem_fault,
 };
 
diff --git a/tools/testing/selftests/mm/memfd_secret.c b/tools/testing/selftests/mm/memfd_secret.c
index aac4f795c327bd..3d33487eaaccf3 100644
--- a/tools/testing/selftests/mm/memfd_secret.c
+++ b/tools/testing/selftests/mm/memfd_secret.c
@@ -84,6 +84,61 @@ static void test_mlock_limit(int fd)
 	pass("mlock limit is respected\n");
 }
 
+static void test_mremap_after_fork(void)
+{
+	void *mem, *remapped;
+	pid_t pid, waited;
+	int fd, status;
+
+	fd = memfd_secret(0);
+	if (fd < 0) {
+		fail("memfd_secret failed: %s\n", strerror(errno));
+		return;
+	}
+
+	if (ftruncate(fd, page_size * 2)) {
+		fail("ftruncate failed: %s\n", strerror(errno));
+		goto close_fd;
+	}
+
+	mem = mmap(NULL, page_size, prot, mode, fd, 0);
+	if (mem == MAP_FAILED) {
+		fail("unable to mmap secret memory: %s\n", strerror(errno));
+		goto close_fd;
+	}
+
+	pid = fork();
+	if (pid < 0) {
+		fail("fork failed: %s\n", strerror(errno));
+		goto unmap;
+	}
+
+	if (pid == 0) {
+		remapped = mremap(mem, page_size, page_size * 2,
+				  MREMAP_MAYMOVE);
+		if (remapped != MAP_FAILED) {
+			munmap(remapped, page_size * 2);
+			_exit(KSFT_FAIL);
+		}
+		_exit(errno == EFAULT ? KSFT_PASS : KSFT_FAIL);
+	}
+
+	do {
+		waited = waitpid(pid, &status, 0);
+	} while (waited < 0 && errno == EINTR);
+
+	if (waited == pid && WIFEXITED(status) &&
+	    WEXITSTATUS(status) == KSFT_PASS)
+		pass("mremap expansion after fork is blocked\n");
+	else
+		fail("mremap expansion after fork was not blocked\n");
+
+unmap:
+	munmap(mem, page_size);
+close_fd:
+	close(fd);
+}
+
 static void test_vmsplice(int fd, const char *desc)
 {
 	ssize_t transferred;
@@ -297,7 +352,7 @@ static void prepare(void)
 				   strerror(errno));
 }
 
-#define NUM_TESTS 6
+#define NUM_TESTS 7
 
 int main(int argc, char *argv[])
 {
@@ -320,6 +375,7 @@ int main(int argc, char *argv[])
 		ksft_exit_fail_msg("ftruncate failed: %s\n", strerror(errno));
 
 	test_mlock_limit(fd);
+	test_mremap_after_fork();
 	test_file_apis(fd);
 	/*
 	 * We have to run the first vmsplice test before any secretmem page was
-- 
2.54.0

