Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311900;
	b=JvxNuXgGU5d9Aasj+OfhudT1InXFdl9sxC47CaNyLOtHPR9ELucQPnDedPPRRC6CSpyA
	 eM6/qVBhPWqNqPMlQ5mYuIsIoQg70j/WSH5AlVNnjttoYTRfopiOW6T0ZdcQypudzZCc+
	 stoVGkmmppvcrjKl50gzelLM9ujuyKvkEN9pMEK8MA6g6kpHCY/vcsgMYe3hPvyEqd6Yz
	 DVUsXa7ZHa0KYP8Rw6VoTil13nI7X+K7thEmnh47/sS56hvnc9focfy7tPYw9EU5nzhH0
	 IkBQtOQqrYX0FM2i9MOSjzU4UoJB71Ue585W+A1Lm0v5ZJG76Qo7bJOj14ktR/xpiAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5jNtZbHxCXS7Amya3dC3EE3s6XNWDFBG2KE54hDksKQ=;
	b=tSdweWFLX+WA1kts8/LWyGCMXalaZFEkZYyH9yMgcQoEKXUSvAK/0skLiTmDYkEKJGv5
	 Sx1nwclb4gNBnI5RM41hhxgb/9dnETdT3KNdfY/b1Y/XwP7Q53JtLumwe2BST4LxkLJ3t
	 1f8rMqnT9MRZWLLvmL/Mt/BZGJfYgdrXhQviBLuPbn9sNOrIOw1DcndUypHWH1AfALHT/
	 /S65BbByUPMwrXAwVOuc13YMKCdbcJOv+bogp74r/Oty/CFOqtGOv+cbEfRCUZxokFnX0
	 q0uaHHsG8E9Q2lgByyDpEMWHU7sonVQodYGzUNPAYh6cP4sp7pru821LXOYtA4iNovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoZdQbsF;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E2606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0E2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoZdQbsF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso404565e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 15:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311898; x=1793916698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jNtZbHxCXS7Amya3dC3EE3s6XNWDFBG2KE54hDksKQ=;
        b=JoZdQbsFVWPXIont+c9qQKJKUugHbIIPKhgkwvBEeX1Nrf1kAPMM01K3WqnfJfFwv6
         syCiNUQV6b4DoGN2IcVUiCe4uPUuCZtMejWSVcZH01CGV2nMY3fAI6LHuJTMva71O+nu
         DPMEXHTLobv6RcZuqJ8+UE4PhEectz/1LncuIXpwIxzexKN3EV32aWzq9X+reDQSMIPP
         AwJRc8Vv42P4Zewsst/0OHNwogxY1e5rDTQ3ZgX8tpjVRIhL/+4czp8Elh/Uz0o+R6J6
         Fz0i8E7ouEoc2GK8Rzm7FNpRNzKALZHZyuEP8BHrJXgdJdG4HoS8w936F2H4LAzZ450O
         +16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311898; x=1793916698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jNtZbHxCXS7Amya3dC3EE3s6XNWDFBG2KE54hDksKQ=;
        b=ZtwmVR9O6si/OZLY9Y9iwHL9iPXIiRqxxrpSie0cN3w9s/YadRWNNvXQlvpmNnNEJq
         PWOTGL5fEWHUbyVOalPQ/ICXJHZ4PKeFy5cXO2l002pm5IsJCqPf63HoY/uivLZdLP0y
         mfQU0/Z5Tt+Qzx0rITHRnvkNFjk7gFo1Rp77JAR71vMam9PmuKCMQQK22dqjN/weQutM
         zSTWdbpCZ1Mg+BrN+352/UmX10mcgghkUP8pCppwXFm3i+eINBQVhWS7nyikmsZlAqqY
         L342SHHbBHSBxv53o0xVMKI+8YD+KmndS47sQ5gQv6O20lBVk5hNXm8Slzqv/a7/TF4U
         YL4g==
X-Forwarded-Encrypted: i=1; AKwUvBxs08gX67J0QD2gJ7KREvlnS7ya8Pav0A/gkK8vqdVJvquVSDSDpC3yHaa+A9eagB/vDAFLmCHfjKyF9XJ5QfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrt5455xLXzi2IgW2jcjZltQBUrpw81+uWV0On2k77FDgpc1ot
	xKucd2XBrrNnAgz3NnWaiklxu4DX2wx/ijOKcs4Z86LMHdLi/iSRQ2mZ
X-Gm-Gg: AYBFou0MNMKt5yii5q0/FXAmsa54tFMDPQ8ndXihxZa7iu+YpXqAeH7bMvH1Xfw44NS
	JMU6aTe8X9VesBpjSaUybTn2h7YYx2o/8tGHLHLc9zwKQYTUdFfFH1LEa4oRdbu0QN4tuFAhlaz
	PsVtXDdWeYS8cDjPrqi1iR8Tb1XMlSG9TrQQoJwltxRW/XHIcirzG7+OOshhHOdVh1Z+p5L6y7N
	90luONZp/0Zx+BZ7u8k3ql5+exJVzjjCljmkVERmKPziCmRu7pU461AUrqjRBFKmJ1//LVzuRjh
	o8vPgI0s7X23iKkpsLY59PUA7R/I90tW8/nkTpC7FaiKa9V1i6WsvTAA7HHaMFupbxer9y17avO
	I7e8xpianWP/WzRRUHWlomEB45VekPw4rtP7bMDyYDn6RM1c4Mu8y3Tgrjp6epnjIR/fXKi/qBL
	qUk/0piY4nkFJKVBl65HpuBc/z72rCGDg3T7r0wDEaPiVOfjQE8to2GJhBvs0zqvmJagmAOjNe3
	kNFw5X0+oupd1mrOTpxui8dG5L3GpHXDWln7pEv64S4L149A0DSWzzWA2hzQPRdzM6FQzLrWo53
	tZVNhUoD5GRwUA==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr7162435e9.29.1793311898530;
        Thu, 29 Oct 2026 15:11:38 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm104011305e9.10.2026.10.29.15.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:11:38 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Thu, 29 Oct 2026 23:11:01 +0100
Message-ID: <20261029221129.89068-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029221129.89068-1-azpijr@gmail.com>
References: <20261029221129.89068-1-azpijr@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mfill_atomic_hugetlb() drops its locks to copy the source page with page
faults enabled and then looks the VMA up again. The retry doesn't check
that the VMA is still registered for WP, so if the range is re-registered
without WP in that window, a UFFDIO_COPY_MODE_WP copy installs a uffd-wp
PTE in a VMA without VM_UFFD_WP. That is one of the leftover uffd bits
hugetlb_fault() has to tolerate.

The non-hugetlb retry goes through mfill_get_vma() again and fails with
-EINVAL. Do the same check in the hugetlb retry.

Fixes: 6041c6917903 ("mm/hugetlb: take care of UFFDIO_COPY_MODE_WP")
Cc: stable@vger.kernel.org
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/userfaultfd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 3b71712edab4..a70ecfc8a998 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -810,6 +810,10 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		if (vma_hpagesize != vma_kernel_pagesize(dst_vma))
 			goto out_unlock_vma;
 
+		/* The range may have been re-registered without WP meanwhile. */
+		if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
+			goto out_unlock_vma;
+
 		/*
 		 * If memory mappings are changing because of non-cooperative
 		 * operation (e.g. mremap) running in parallel, bail out and
-- 
2.55.0

