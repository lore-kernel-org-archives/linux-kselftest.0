Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CFC477998
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383142; cv=none; b=m1YzFU2v9qWwjbxA7ch4N8hVOpRiq+QIIu1J+i3lm2tTOLboKiU9JUnbuMfDQZCw8v0SRUPUfCFePMtRRQBu0yF5OkSUYjVUaEiEGBlHRoC2eLhsOeZybMTm4T5d7d+LCtk1a/qUqXa8K0C6JZ1iZzmS+hur5WhZhu11DAvUMog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383142; c=relaxed/simple;
	bh=cHfHAp2JJwUkoyl9WpXULmIpX0KdRRi6zl8S5xz3qX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHiW72HPBfd7KdEvbU0Th5hs8fmEv2J3GVlWEPg6WGmp5VMlwJIMZw25gRFUs2FRXHB9OxnilrN8mzL9C8uFakqYbES1r021a6yteVA8q6P9GjpPIPiSZnQZrPt+eBNQ483MCZZOOThCYkfXAhtXK99EkoZ0FVq8vnje+U7UvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4uNBDpI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4uNBDpI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82cf636dac8so4877382b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777383140; x=1777987940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3byBSOEgzWp/7f2Lr/jllR3/Q+AIHH06pprc3xCjkns=;
        b=J4uNBDpIeilC0OtD2yfOdRYGBaO8RLeG0zp9KZM1Kgc4tYPNJqDXbjuFUmFJmKOGvd
         T2/tIVULeVA537a/Pe+iT9Y0JPHFg/0eh3GLC6Llnqj1tcmWhnxe9VDA/Z4Gz91kNtjK
         uoUNqiPGaeJk7cPcUPf1kIgncvD33Hlq/Qs8cJV9PMw+ydgHtU+WqESwnY6UzriHGc6G
         G3N5AKSUkYN57idAIw9cqTEPQCz18pAnzzCZZn+rKDynnNZDC4Cc0N/ple2EvnEM2YJw
         A97Szcv8A1VayKmNlKyrJN0Ulk83B44Yk2vkJzwyAKLTuTzKvM6isjjBXltDgV6VGAyq
         amRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383140; x=1777987940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3byBSOEgzWp/7f2Lr/jllR3/Q+AIHH06pprc3xCjkns=;
        b=T4OMAeJsmEGLcyHzi+ake298MU43u82YF7y7RJYkZwKvX3bQluROKTtzhL48hMToYE
         suLHtdEpCB5tgmP9II2oxo9rExNdjPH6nJbKuE0e7G3byxzlePwRbHO2Ieb++YpA0TMr
         VtQ7QUZE98Z2FrSyMSj6+MFSP2hZ5Du78TZe1N40tBVZFpy4GFGU86p9OwXxXj/okZoF
         1XBy+G2bsbxg6mSjDPGqTcoJUoqTlRPT2siOShtkMEkEFNYb75App31ZcvUeM2fhP0vC
         /wBW7xvv+CZJd+KItgRtCM3DRHZS6+d+nOqueNQEMPSUG/atAnTTnLZr9enj/KA8CvKb
         Sg2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+3cvH/sMG8rDUiK+PkwxZqFHzGsJ3GMZNtTB7r5W7zb3COczPfStTVrgsNj4Cy2JGr+2gP+wiMk7rp+5u4BYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VPZ/ggZp1MH+2bodom9vSU5WS6JNr0GqiAc6i+pRjVIiGI0D
	K846rTgazKWaBSEZ0ce/j1YI4KyNox/uMiWiVr7NXBQX3FAdbtZrKp+Y
X-Gm-Gg: AeBDiev7x9uJHCR960fQ22zKFswg59+cAsIYzEvA4HZrAck15cYEV2zBZhjtSuv21E/
	7jlzsdY3eeHucRHleLnqOSBZydqECgbDTUDdladgNx+yATmwJ9d5lA7D++pyGWBQuEUze5Vx4Pf
	R81pTXQQth76ra4iHO+Sep3bUy5iKm75KyG54Bt5xCn5YSGV2TEjrEJLv4x7AkjohQ2pHH93Jdm
	mtXaKwJtBw9xozSRLB/hd+Ru2PwT4V+a4W1sX4SSoo7lH6bVwbyPepj+i/xZbJGQCcWyHHpoZe8
	ugESdD0q21GZZHyL5ITd8Nr1/9Ya2bN18J1tfjSx6XphJPsB4ri5tR9pNNprhbsuCUTyULzI7n9
	6qJCc1n+EOEqhTEGJF3YOelkWiOz4WJvICy63ygoL0pR+pG9dJ6x1mZfKX+OPib3EUaBQ0e69pr
	u97KKVbJf4TY8SgwRM/R6UKpTAehOCi23HD/iiSKjj
X-Received: by 2002:a05:6a00:1802:b0:82f:bd8:70eb with SMTP id d2e1a72fcca58-834ddb5b988mr3067266b3a.21.1777383139525;
        Tue, 28 Apr 2026 06:32:19 -0700 (PDT)
Received: from vini ([2401:4900:8fca:e7b6:f223:6319:a79e:7616])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae2027bsm2914609b3a.16.2026.04.28.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:32:19 -0700 (PDT)
From: Vineet Agarwal <agarwal.vineet2006@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Agarwal <agarwal.vineet2006@gmail.com>
Subject: [PATCH v4] selftests/mm: khugepaged: initialize file contents via mmap
Date: Tue, 28 Apr 2026 19:01:38 +0530
Message-ID: <20260428133138.88802-1-agarwal.vineet2006@gmail.com>
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

v3 -> v4:
  - Restore unrelated blank line removal
  - Restore original close()/munmap() ordering
---
 tools/testing/selftests/mm/khugepaged.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 3fe7ef04ac62..6e929a484a1b 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -381,9 +381,19 @@ static void *file_setup_area(int nr_hpages)
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
 	close(fd);
 	munmap(p, size);
 	success("OK");
-- 
2.54.0

