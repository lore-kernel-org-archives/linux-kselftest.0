Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D39399377
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 06:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787724936; cv=none; b=k00+0A2fnAP61wxT9eRX3d0hfx9yHCOli4KoN6/FBOLK9CqPI4tD52X/PeGuq9dOFKuOhIO5iSpVK2pUTs5On8wdapBGi1ouD8S5Tq2UVrcG4o/BcM/yRadrZNtOf4zRJ9Q8BjBj0EyQ3vmzDF/g2Nvz91NL2+kZbIBv3sykuQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787724936; c=relaxed/simple;
	bh=bEgZ/lO0dQl/Gk12BJFJKAn5h5zpT8Qua2XOyb7g5x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jFow+KC6d87RiMbie6Mv1M4GaErQk9KvEKVkLNESj7ueyKoW8JY7Wh9oRzMQiCy5GWT8PNTMjaZlRED08xPSMAUMFh3pMyl0RrdDW9zxCvK6fLs0tZio8GdAsOz25RwPh6+Xe7P7KIDX8VSPZpmKH5IZSLsb7Xr29OZ1oHnL3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5G6WdPR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5G6WdPR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3964e480f76so932933a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 23:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787724934; x=1788329734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFxcZ1IROsPv4rceYm+aT5Ud3Cuqd0ESuqG9hhc5tu4=;
        b=r5G6WdPRqeR7DXeVDDY0NCdfkRicsVPQG4tQmrPfDi+I8X5ZUFZ8JNMi22xruwjDe5
         chzQV4fm9FRuRIii29yHBB2VbVRUAKQOl4zA933s5qRvt065hMlbiYc1DYaAaOyw3IPS
         qaihU7/606uIg5S1jEHHFcsR1zrd8M4snD5gmh0RvFegCwQELqINBTJU4F/fmalILxlS
         S3Juu+hACkZwwwMUDpRQ6/gZOD8cmSJ0338d03+ieeCcvZt0TGXd3K9InPUZXrKHJ81K
         TQUEtGSr2j99FNNf5dXM4rh9Pq+u3YEe/GqetnRo8jBHrs+R9R03SPbEm0tjJ4nBFRUt
         MeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787724934; x=1788329734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFxcZ1IROsPv4rceYm+aT5Ud3Cuqd0ESuqG9hhc5tu4=;
        b=DpQSEDvHRb5NvUaBEZPZUNTTA0gspAFRVhXHIXtErnWzoQS9xgfNNs3mcXthAVi0p7
         jgPD8h/3gEX7Nxyd+pfKplH6tZCk5Fy1+XB82laLXnG5YzKOu9HJ3gvngyl26taDtruv
         Ok2M/jU6JPhnz9ABxKpwnXYNES8lkJrOVirzFAg3RwGtc0a4Sui5k9Cot2PWWLu2o2Q9
         N9j6RHvb72zQKi50AchlGZ0qqQKdXFh9TefO7LNd+VpYIuc/vrw6bAL41y4ulGl3+8rV
         pvyWUHFZX7OImSpcXUvLiHOBaFQVFuZaQiwa/Y/hSyDR55PgiWFKi/1MuywQaxwS4qc2
         wy3A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0GvFVrdmHHOqQ9PjinCV++TmO0P4ixAzZQejFEI60kR+BqyRHOMyqvpQX/SXUUxt1vXqOKfr1qODJY3P73z8=@vger.kernel.org
X-Gm-Message-State: AFuF++lT2ak18n5uTyRP5yoiIPBMHJkNxyTCgk5ZjWjgkfj/nUs1ArIQ
	BzMispS+Ed7CoZ70el90Ii/n7OKcyppoT7SfoI+vthCDbrRsiibqcKDD
X-Gm-Gg: AR+sD10n5j5aPHWHnRn1CGbNaSm8nXDYVyBHOXQATaSGAQcWsCz25yDQBeUUibRYPjc
	1gAji2m0fJpbuqMa9gcQIzGnrUh2eq+qbIpeU0jHVm4QaiuYz1LWiSk0sHYxvrBkfBUDoD2MA0r
	WVSNrWYw6I6JWkbep/zJHlQUuO5uG82CijcKd/cWJi+cvmv7jfxpzF42jaRvDYRNPhYkrtGNnp5
	kRTFfrYYxWNnQUT07fkAKM49P2oA9aTawkwwnlqF61VnkzAGX1lzQAXvmff/1GH+x6SGMfJwqIz
	SldKc0n0DFUu1UH7QokkBRcL1MEB8lsLjSZOUTaY6DiEtaYmkkxokdA7P/pgWdiJfFE9rAzIpId
	nuNWsxVL7bvrRByadjbhmq8qIldEEXW54QMFAYyXva38v0WIC9DmadBW9ZnyeeClU4De2fYQs8J
	X1+Xux87QEK9rBENTV8hdK6bqUDvBlcbU1+IzkzwNm77MbVGbSEw/uBsUXC16TmjQMqyUOLBIUa
	6ZSPJf93k8/uNXh2raszCEYxM0=
X-Received: by 2002:a17:90b:1e4f:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-3966d5f8eaamr8803881a91.10.1787724934185;
        Tue, 25 Aug 2026 23:15:34 -0700 (PDT)
Received: from Anshuman ([103.161.223.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d885fb6sm5192046eec.14.2026.08.25.23.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 23:15:33 -0700 (PDT)
From: Anshuman <anshumantewari123@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anshuman <anshumantewari123@gmail.com>
Subject: [PATCH] selftests/mm: fix line buffer leak in mremap_test is_range_mapped()
Date: Wed, 26 Aug 2026 11:43:00 +0530
Message-ID: <20260826061300.14038-1-anshumantewari123@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_range_mapped() uses getline() to read /proc/self/maps line by
line, but never frees the buffer it allocates. Every exit path
(parse failure, match found, or reaching EOF) returns without
calling free(line), leaking the buffer on each call. The function
is called multiple times in this test, so the leak accumulates
across calls.

Free line before returning.

Signed-off-by: Anshuman <anshumantewari123@gmail.com>
---
 tools/testing/selftests/mm/mremap_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 131d9d6db..779ef2d5f 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -156,6 +156,7 @@ static bool is_range_mapped(FILE *maps_fp, unsigned long start,
 		}
 	}
 
+	free(line);
 	return success;
 }
 
-- 
2.55.0

