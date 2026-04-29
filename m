Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A33A3D2FE0
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463923; cv=none; b=EfMrzguQNfmYXSPH7tN3hh45IFB0W1N8WYQKVxbGNYGs1FeoJW4RNXyZVjD5GzeZbD1fdyYRvEV2lZhsbHgDcvzvRufR2OTjONjEuxg7PTVphfZicQsWnwAk/kB76RpnmUIU6hyWCKtFd1TLnq2JLiBMWMd5AMqZENxNgT701M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463923; c=relaxed/simple;
	bh=GSXMm9jwG+ccxFHhhjVSk6J077k7/E3YjYjpW/OcIp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrngIGYo/dNapcnoktYbVaKOJuNsT8SuBEuM0KqneEH84+J5xcETzpfq5XOA0xyO/1ulZ5eg1RbPnNPxY7Acq2j12i8BIooHJWYMCk/vywdqvn/Y8WLDbszPnhm8qGsgAUKW0ghDZk95aV+kMqW0BzHXODS2RaUEfZXBZj2E9KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCNXVyvc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCNXVyvc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-364ad762ef8so169872a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777463920; x=1778068720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/K/1IPCQokHXyXTe7v8JYd9y9SP0z7fbM7deDX4Omk=;
        b=qCNXVyvcnskhflSuJSShwbxDiiyAXVxXRovtYJkrnzQutYGSNBVtRxg19IQnVrfY2l
         T/qJusBmgcMLHikXyOuzw270C7EHUvqK1AxLH2kjoOqnmVSFe1M/MDo8kCJlwXcxCQ0V
         dEiEPugR5iv9KLFcf73zgqDlfix/MHQq934TVzMJzSKMRpa5htDyti55waw5v+bwYjJu
         yJ/yjg6jOHlYQVICWzY6MpI8ty8dhJWy0tDlkLUhhhlclZiXhEyIbdHOi+vXbTk7OFxi
         CTE9sqHyhR1nCNYu16d5zAR6t6+hn8slLO8/d7U8MteWSnoLCOwJMZjXJhWqqoshMT7C
         zGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463921; x=1778068721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/K/1IPCQokHXyXTe7v8JYd9y9SP0z7fbM7deDX4Omk=;
        b=OojCd4ISS/hN5BVGS+0KNuDJgmM/AjRzGkZo1TLMgJlPTX8SKQkE4rJSLQl5kbznrw
         co05Vy23JhExPxuemmO13XD59wdFAnOoXuIUTACCdzimH7ZX6iZToW4Np5x29mKKCmKs
         MgPPoc/6kjZVacMFvv+/rTBX5hBNLpvBzKr8vaApGfvx1FK7katLUE3806/Ghp++CFFg
         v0ypqhGBIRQh2eWx9O3eS1YkqqcQFwUcuUUzLo7jq0MeLGcZdU6D+cjwjbQ8RK8SQ/eE
         OBwFniAPT7qbdrOqI0npNopgs5vpPtnGma14PeRbA2UYb8KgrhUkq8BaMG1/G9YKhVJN
         RUkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cU0LLzZqdq1nEuJ7K9Dt2ftBgHl37B06B4vbYgcg3jLG5QRkyv4oxQI1rk3qRlkP4drx3HDZwWrkbpyjfWsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXnQQPLVaSbao8nbkR5DMlXCUfJDeokm5aVw4j/E69zPDiRZx
	xSI+WHsNExeoWfUwzSFnvWlu0Bb/JhmcPrZhQE8oF69+h7ehj7T5ampo
X-Gm-Gg: AeBDietLN/OqQlUzkNWUR9125ymhkCPgNf218n6/G8lC5hoSQ0l880jvoeTFJSuJuqf
	zgKs+BF+ZMfAJezD8LI0GjPIwzSvNMUkgaVxlDxa37IiH/HONt6aEzjsQADP5AgAIKdGoPa17Uy
	9eVQRiLEUY65Hs9p4+t9SMB2/Mls87H3wmFhfeGk9TPlUTXGboax6DknArKtMIoWlqepy/7KEah
	HctJIra68dCZo9ctPbhW646v/cu2VwUkVDl8u7pQEpKKQP9d5QkrBXNUYMbBlmsL8uuwnfVWkbM
	yVWWZh/CYwhGlKdMLJTUHg1XwGyZu+6KVA0aCGzrxooRSGglabQlrIpQ8kmT+KVkMkhxGcMTF4p
	F8EH1jXUCIBpgDY6OMd4PRthdalyWVNwWgHHPyqauL5Z3mzjnHraqVdQ4IDhLTUGEEwTpZv4JZM
	RAIdHCu+rus5Wyb5nVoFW2grKfWoRDCHpds5HNPECP
X-Received: by 2002:a17:90b:3c87:b0:35f:c0d7:ac54 with SMTP id 98e67ed59e1d1-36491ff683amr7500827a91.12.1777463920461;
        Wed, 29 Apr 2026 04:58:40 -0700 (PDT)
Received: from vini ([2401:4900:8fcb:3097:5ced:f23a:32ed:4b52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a011512dsm2822040a91.4.2026.04.29.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:58:40 -0700 (PDT)
From: Vineet Agarwal <agarwal.vineet2006@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org
Cc: ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>
Subject: [PATCH v5] selftests/mm: khugepaged: initialize file contents via mmap
Date: Wed, 29 Apr 2026 17:28:16 +0530
Message-ID: <20260429115816.98824-1-agarwal.vineet2006@gmail.com>
X-Mailer: git-send-email 2.54.0
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

v4 -> v5:
  - Restore msync() to keep folios clean for READ_ONLY_THP_FOR_FS
  - Remove O_DSYNC since msync() handles synchronization
  - Simplify mmap() check and drop unnecessary cleanup in error paths
---
 tools/testing/selftests/mm/khugepaged.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 3fe7ef04ac62..c8393ca52cab 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -373,7 +373,7 @@ static void *file_setup_area(int nr_hpages)
 	unlink(finfo.path);  /* Cleanup from previous failed tests */
 	printf("Creating %s for collapse%s...", finfo.path,
 	       finfo.type == VMA_SHMEM ? " (tmpfs)" : "");
-	fd = open(finfo.path, O_DSYNC | O_CREAT | O_RDWR | O_TRUNC | O_EXCL,
+	fd = open(finfo.path, O_CREAT | O_RDWR | O_TRUNC | O_EXCL,
 		  777);
 	if (fd < 0) {
 		perror("open()");
@@ -381,9 +381,21 @@ static void *file_setup_area(int nr_hpages)
 	}
 
 	size = nr_hpages * hpage_pmd_size;
-	p = alloc_mapping(nr_hpages);
+	if (ftruncate(fd, size)) {
+		perror("ftruncate()");
+		exit(EXIT_FAILURE);
+	}
+	p = mmap(BASE_ADDR, size, PROT_READ | PROT_WRITE,
+		MAP_SHARED, fd, 0);
+	if (p != BASE_ADDR) {
+		perror("mmap()");
+		exit(EXIT_FAILURE);
+	}
 	fill_memory(p, 0, size);
-	write(fd, p, size);
+	if (msync(p, size, MS_SYNC)) {
+		perror("msync()");
+		exit(EXIT_FAILURE);
+	}
 	close(fd);
 	munmap(p, size);
 	success("OK");
-- 
2.54.0

