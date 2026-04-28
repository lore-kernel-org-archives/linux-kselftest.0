Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF5B3E1D16
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370485; cv=none; b=so4nOonIfCO/2sPfZ0fKFx9V5ypnGGvj7maIvChkD1kr/CXhz7oErgxiwzPIjIetG6QVmtX1DeZPcBz3e77Dhm5200l9J1W1QhBphwpQvk/3X2dCWBEpkszJDRhRAudIV/EofZBrAB7Wm3hWqIcSVdOtyusuP+HUZJQpxy+Wzgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370485; c=relaxed/simple;
	bh=xCeDgVV3DFEdDcHU0rf/MdkWPmIsrxa06kKdteRqfa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdFsWym8fIaCLfVjYHXLt6UMZix74cWN33dyakDNtywZY3LTbSMfO6C1gVcjYGHcbGljcJsx2NkJB3F5lxvLJWWzUnBb/yrFlp32MEqnBzcM33viwkyBN07I2ebj2FdW90vKzcgAHpDsYZdDvZKgikoSeQuX7KSild2/ACsEyuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUqz2da3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUqz2da3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b23fcf90b2so107058665ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777370483; x=1777975283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QQkVdRIZwiZco7V8KN8H23FWv9G8K8ad5vKyiX7w88=;
        b=iUqz2da3p8oxGvDla4xoGzlFAByaoJp+IGVJuVBKWi3WGCVK87c6Vv28E3JG4OyP4z
         PLpUFsw4EN3b4afCeYX4VPEZNr9c5a9GdNwBkUVHHvZgvrdTHRsxaq6O1XDkYkcEMMwU
         6meviduTS/aW/+kC5Ehjbcmv1VL1zEAy9GcQ7vDqsrbpL0ZsxM90caKNqvsrJsgGtSuU
         DADV0viNKsmi0s4erwWdDIZLdxrdgCGOMzC5UYMxhaDyYtZvvmxHgqTSZfzsqI2rRyaI
         gAgEw98CwWtoriA7t8DGRGDe5fBKM3I1MyBmOtmsWzW+ygHNv50NiKxrAN/SzM2rno4I
         aEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777370483; x=1777975283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6QQkVdRIZwiZco7V8KN8H23FWv9G8K8ad5vKyiX7w88=;
        b=B9rqnUzKxbKbykAfjhLNIoiRWdAryxHZ4lNNSCp5pjturNzWBKNq8VV+11tO4xgeJ+
         B9MugSkgeGIjvt4lsBUAJfHO62NjDYUZb9TJb0MaT7oNdPGP8D3JgUjXJQ19v6wX5+SP
         I2ZWiRdQv8MODDmFVA0IqAeGr/HQzUVilD4OG40qyHW14SJt7v9yCIQ8tPTYmHmOblT9
         WMTXMVkq+sqzSDJPxBDrB6nUNA03ZRW+1T7OgsJuyGyoYI4SBbFm5a2tbnmtVU2yRc8T
         ZIXNrasY+UdzQEt63NcYCT/OEpPTaTEavAO6Bna0CobI2JFgUvKUXq47V3Udaauru8WW
         VzwA==
X-Forwarded-Encrypted: i=1; AFNElJ8eEHZjw17RHbbUufFtvN08dRnef1Etx2uflWRU3dz9pE3t5U78606/3IzIfAyNSllSRJAq9SWPKRZ9cr7XDi0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg88EjiArehW+lsndvJLpty/2o8R7jnEHCO7FYJtUKdnJtpHtW
	3J48kslcvPrS1izhxmU0DaUC75Ivbo0axuSgauo2xC6ejf5op02Mi1dT
X-Gm-Gg: AeBDiev2nOvTjQPnxQZ8seqAxDi7duWPrdCz9mytMseyVkdFukoEjI/9ZxvEfCbqKsU
	DsCjaf3L/REBXVSzGvfUl+USWm38U/A6wWEMzK0/9OQU2zhN8js+QsPMXy8hq0Iv7U3nP2sUH/q
	YCk3K4HT9cOBl9OQ880eY4SLde758kS4MKh0nAfjUBsCSBdKiFd3/z3T1B9JV4YAiJlLsMHKniu
	n64+yvfNTjBRbUZFDrpmlxVh735CkobvRe/cVYG5AqbxeCbGqpNLqRE6ZKAxiXeeO9FaLj9GD3C
	e+kgeDde+fug8wVR+E/R71WIcWx//gUjsvifK7zQNTi/0mGYxOyKo4RgD0DuKXOfES6+8A2uThv
	J7zoMCbTkv1bPp7KpGnz7lN/zjeG56UnvZdGmxr5srSh1/RH0Mw/oYl8N06I6PwIz28jQCY3D5R
	/LspQQ1mklnFT89ePKtG0O/J8RCF8WTss+PaHlp1FW
X-Received: by 2002:a17:903:1904:b0:2b2:4fcc:2687 with SMTP id d9443c01a7336-2b97c47e638mr27098785ad.31.1777370482430;
        Tue, 28 Apr 2026 03:01:22 -0700 (PDT)
Received: from vini ([2401:4900:8fca:e7b6:f223:6319:a79e:7616])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aaafc9asm21801265ad.34.2026.04.28.03.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 03:01:21 -0700 (PDT)
From: Vineet Agarwal <agarwal.vineet2006@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>
Subject: [PATCH v3] selftests/mm: khugepaged: initialize file contents via mmap
Date: Tue, 28 Apr 2026 15:30:58 +0530
Message-ID: <20260428100058.62554-1-agarwal.vineet2006@gmail.com>
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

Instead of copying data through write(), resize the file with
ftruncate(), map it directly with MAP_SHARED, and initialize the
mapped area in place.

This simplifies the setup path and avoids the need for explicit
partial write handling.

Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
---
 tools/testing/selftests/mm/khugepaged.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 3fe7ef04ac62..57ca4224bd5a 100644
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
@@ -381,11 +380,21 @@ static void *file_setup_area(int nr_hpages)
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
 	munmap(p, size);
+	close(fd);
 	success("OK");
 
 	printf("Opening %s read only for collapse...", finfo.path);
-- 
2.54.0

