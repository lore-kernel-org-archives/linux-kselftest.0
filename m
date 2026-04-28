Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90463D9030
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369460; cv=none; b=EZnr8w1XTkTp9vbFoAPXvO4wnXqclh+uJu/UWNVW6TdcrW/uRttfx5k5lDUOtYY9JTYNzllED5dP+7/6W1gcZ/hZxs0kicR/hyjdZW9z95JjOU08luhtb1bduawZd5BQi4jQ3r5J62w/Rfc98cbgNjMGVNcae9qlIA7ZgMCgFEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369460; c=relaxed/simple;
	bh=DeWJxjbLIolKMcSrmMuJw9zc9LM8Faz8SK7Ib6yqngs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIooOb8W/uutNpI4e9KN1NUiXzHkzPDT5CMCgGoBIk40ZCW7JP3akcofZDnYcp6rh/oCXzEQ96o/uZyCZloiPVvknXXwOs4inuLf/NWdDFw3lXV47c4xsWB0P+S30RBXybI0LA8EsPurdCNxqduZoL9uDZNrex9jsmWXAs5yjOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avLSWovu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avLSWovu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b788a98557so56676735ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369458; x=1777974258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0tY05QQvlWHs+V2WEHsXr/YdchRNZ2bEMNFCy2QVF8=;
        b=avLSWovuhT8vFpFEBCz2J58Ike2129ElpzKGECEcZxsVhlWEBPWur2ZEd8NOeGqqgR
         /vEn5pc9xYXC8+MiBcV5dgEf7OO1rxRBg82uuberIByj4VQBYrNVsnHDK2lcCGURKkmF
         sZ+nDNgLHBMb2NDgp2u7NueVzYCVIoYtbqzKN1Bndz32MBnDoqDHZzLRx3h73IpAdK5m
         3Kzo/qmEi8MOc4NMmxaW/MRGDBwg3SQYHPlWlpV3Nu+iLitUvF+eMPXdFOOuOLwD7lh7
         nZuAfQt/ThzkV/gDZ5Xmd7700JhX2AZI1ldb1vxKlb3K0u5WAGmqzLIEPUr8Rp02C5VD
         suyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369458; x=1777974258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0tY05QQvlWHs+V2WEHsXr/YdchRNZ2bEMNFCy2QVF8=;
        b=XyvUKrYRtO6S3aDRi6q0t4d1Ln5/3ecf14Md6Pg/oS4vqm0nXcwCmTrJitN2R3F/hV
         cZS/6JtZpRAcGDc/ekBJeq+QeudastjwD9wWjkIcfuOPlHkbdXE09gjHvs1macIRxpjF
         OPwWoF82t9UiL5xhdnqRxD5vXTWA3m8BQC/cEB1iMZNRrMwoBTX3Nrun5mMXfQUjl8DD
         sNX+7xfltXw56VJmQdR9UVF5Wh9gN0wn4QtKcDyOCl+7u715uMPW2rY2Lq1KUCJ1Koa8
         U69ONdRnFY7e7dQD8vp8UdTQD7xNeZJNXfpQpMNuOiAnTf4LZ2a5AvR1CmaGK2vKutBa
         N45g==
X-Forwarded-Encrypted: i=1; AFNElJ/skUV9NoAr9JSuwYfTYJ4nI011vtAeWpXbhN4PaZiVAiOxMIKGtfXkLnuFyMXbZ72p1laMvPpm5Aju20t/GbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK953k9F7m6i+2LshVUoCKsCgGjbzHF6yY0lAb5g9FdXLSZJvp
	+/ZqnxDt9FuEdmkHZEeQecfdYFdA3fiBL3b+VLEdA1CpVedKXIL2jm3E
X-Gm-Gg: AeBDieuMZXD54XZSG/1Fr1nTLl224FIQK2fuQ0B2cpSrNcH2J+qA3ojMEmqECPIcDUC
	pcRiPbKznwror2Kj8eO5qiQlunWLZF+RcOq238+As8JP13Lu/aA+GJpoad6GC5gg95YPKzPp90/
	od2UIAraF680oVzQVqdhkJoNCVEpiVS7TJSHdgPQVji5GkNm7seuuM9Q16RfeuSVOgFQdYs6B8n
	aExRVZ2s2mU3r3n05EsB56Rw3W1tlkH03t3l9PXFcBD+OO2QZtuv2tVR0GVaacBWpvpBaSn24sS
	nBX9PJiJxl6/2lMjS+imueI3F95uMSdYe/UwRVoAZGZ3uLuygxBkcC/1UlO2JohfwZf8aR0M0nC
	5if5CwvVHDD5X1pPTQ2QlRV4MXoIzkE7NBvI5pH2NnL1RxSkMudvOaqDFCbYLsc3y6+PJtJRR9F
	exIAemhBtntrlSOBwSu0l+8c4V1E6CFOlhMVxk5cdp
X-Received: by 2002:a17:903:c48:b0:2b0:b41e:c5c3 with SMTP id d9443c01a7336-2b97c47b448mr18768865ad.29.1777369457950;
        Tue, 28 Apr 2026 02:44:17 -0700 (PDT)
Received: from vini ([2401:4900:8fca:e7b6:f223:6319:a79e:7616])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa9f410sm20403125ad.25.2026.04.28.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:44:17 -0700 (PDT)
From: Vineet Agarwal <agarwal.vineet2006@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>
Subject: [PATCH v2] selftests/mm: khugepaged: initialize file contents via mmap
Date: Tue, 28 Apr 2026 15:13:56 +0530
Message-ID: <20260428094356.60415-1-agarwal.vineet2006@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3abf09d8-a98e-4f1b-b8d9-77879a8a2733@kernel.org>
References: <3abf09d8-a98e-4f1b-b8d9-77879a8a2733@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

file_setup_area() currently allocates anonymous memory, fills it,
and writes it into the backing file used for collapse testing.

Instead of copying data through write(), map the file directly with
MAP_SHARED after resizing it with ftruncate(), initialize the mapped
area in place, and sync it with msync().

This simplifies the setup path and avoids the need for explicit
partial write handling.

Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 3fe7ef04ac62..f6e171e1da4f 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -369,7 +369,6 @@ static void *file_setup_area(int nr_hpages)
 	int fd;
 	void *p;
 	unsigned long size;
-
 	unlink(finfo.path);  /* Cleanup from previous failed tests */
 	printf("Creating %s for collapse%s...", finfo.path,
 	       finfo.type == VMA_SHMEM ? " (tmpfs)" : "");
@@ -381,11 +380,29 @@ static void *file_setup_area(int nr_hpages)
 	}
 
 	size = nr_hpages * hpage_pmd_size;
-	p = alloc_mapping(nr_hpages);
+	if (ftruncate(fd, size)) {
+		perror("ftruncate()");
+		close(fd);
+		exit(EXIT_FAILURE);
+	}
+	p = mmap(BASE_ADDR, size, PROT_READ | PROT_WRITE,
+		MAP_SHARED, fd, 0);
+	if (p == MAP_FAILED || p != BASE_ADDR) {
+		perror("mmap()");
+		close(fd);
+		exit(EXIT_FAILURE);
+	}
 	fill_memory(p, 0, size);
-	write(fd, p, size);
-	close(fd);
+
+	if (msync(p, size, MS_SYNC)) {
+		perror("msync()");
+		munmap(p, size);
+		close(fd);
+		exit(EXIT_FAILURE);
+	}
+
 	munmap(p, size);
+	close(fd);
 	success("OK");
 
 	printf("Opening %s read only for collapse...", finfo.path);
-- 
2.54.0

