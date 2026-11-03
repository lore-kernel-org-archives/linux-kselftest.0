Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701731;
	b=VkuT3Q3+hx2Myjg2vMWXdA8DsmtC+Sekfe6xxQeEx0DF4K52wk8Mz5RS3XNgofKz0AfE
	 WX77/grAhB+BpQwXwU6tG3RGApFzde4Bz/IAiiNJkXcoOQGGWiGMajAUbh8f6cjq+n1ME
	 84oNv7WrXBS687x4MPlnVZn3c18YxNvQTQtVCYI8ioimZaql2zhBzkLpNcsXA9UKCBNnD
	 jk8vUy/Zn3ctUamgvFf1p7NArZv8FQwOCDTcSg6XZPeobJzgsOdzWty19QLqxElU08f/p
	 zLd9x5h7ElqWNFiHr/6jwOAqHIkBsJMGyneHKJQmi0jcndSpL8iYvaIiYA2Ok6DsP3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1bfQdtMJVeOry4zlZR5idJ3ioLg9CkbsmK6ATlbqUPI=;
	b=uvnavYZ7dPxQrQr9ryTagSowXNYJgAsIQq+JoBxxyLsCjW7AACi6GzyEQe2wnElKggSO
	 emvKDm1FvjFv/ryRnNKbImzSnRRh15NQL1RGS++OD2kOflAVj+uu4tt4kS4siC5hf4qPe
	 1lsWGSFnLC85og5H+47iEShnCrIFzX0WfbAXhFMQ+U8/L0N82lc30KjxpuGmvzoboti0y
	 XK9YJTvGvuDa3Pa5mnN9SyNKPjeRfT68Y3A55ThnpWPD1KCo7YWg4dTkstMx/GNqPF81b
	 QbjiPVeb+f++xAYCWN3dQziVdPUhy/UuulqyrPA6gqBIKVtUUK//Y1XLgFO3OWZJHsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TODm00G4;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C76060A380A
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 10:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C76060A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TODm00G4
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so331431f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 02:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701730; x=1794306530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bfQdtMJVeOry4zlZR5idJ3ioLg9CkbsmK6ATlbqUPI=;
        b=TODm00G4alr+z6BRhGlXx23IP7ZkEySO4RDAWd9wJPUOJdQ+5XL5h85th+krrWPMG2
         IkZxdhEE7wtgBbVPP0IHNFQyOYyhKyebMse9y0a1NjBxsQ+h6DcNpx0rUEC3mQ+m3uKh
         2sDD9kRVd3Qt7T7N13G2/je82bUBAON4lr4ZPs35pSt5TxPpqDW6MouZB2AzlUE+Falx
         p9zDwTwgNr1OjkKkUu734GIls2xhy091V9lioaaEdan7IG3bULNODc2vQuWWfnhS2a58
         Q7ZG05vb+HVnuynmuork9rlBxM1tzwi6Bf7W1nAuTrrCQdTFzLC1m8Ezql8+Hx6ZZPza
         ZbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701730; x=1794306530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bfQdtMJVeOry4zlZR5idJ3ioLg9CkbsmK6ATlbqUPI=;
        b=BbrPGeNvYC5Z/iVOFuTO6oNJmGDo/2DCCeV69/zUGxHnX7vPCPh1Js1/ivnyUDLLMK
         VbIl/0s9p/3S6iB/koAIzGN0f+7R7SPIMcKLsdH+tN3Nc+8I1Ws9tlcXYTboOPCClSLu
         Yyup44ad5VeCazZ0rgkM58HAZzBKLF5Qn/j58aFJxXURO+8nPCYHLkXaC0hqcYkCTMSw
         0jajBI95g/eVT+snHWNV3XkO813no3cWNKfj7fjGOFkkN64g3xn9DM7HT3rC3Wsz1HE/
         JAOrZ2yPyWrTtaV0A8wG6Xvz+4RyXqSVIXErVAMC9XFsgK2txYSPr0GijmI7hHTQ4vN7
         UElw==
X-Forwarded-Encrypted: i=1; AKwUvByA5DCQbxLZqSnnfkYFBFI953psyRZnSMpH/JCA47PBs//i7IC4KffGv6vLHVWsuW/En7vaVSZzqii3hdcVK+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hOauAaVj4zYg2GGLCLLkzCx4tNv3gAO8hPlpW2aYtU7L/xGoc
	DP76ODKQjMfqL/sPel/D0wGZEvEg9FZqrVHLlUMbyBE3v2/m50aHiFC1
X-Gm-Gg: AYBFou3Xq17Wr1eQl89JdDvSWmjz/28SNOT4x3zm+oIo8dLGKtOZYjF6gUhv3+8R02o
	K2tPOYMwEJKPYLaM4+9I7R1Ph9HqtJo+hawtsCpATLFZy1QujtwEmuG2F3FLCX07v6Yvt9fYxAM
	Yk2aFWJe7XdTmO4Zt1xXNMMSVTMuuNy6Ku+pJPwVTpTT8/CFMxdcSt+Po1vvtbOGpQLz7jHMNtO
	Zt17eyFm54FCOuO2LD/8xgmOFixti9JbBWU50iC8xls6QWGDJi4TOPhtApNh0eUbl743lTHwG7n
	fCYBNbC/tRVrYFCg+iMMCiM4yTkT1vh+HPUC+ByH5Wf5ysZ8AMvjHod583iBtbmFkPYHWMiD7yj
	+1h6PfHYl8ixyrmQuQNBeldAbG+WkPEfvhzfGhF4EtE4ZOCgBZuOml//i09vVlETzffAtAFXwS1
	dJVdgwS1BrIypiPEMqYC+hShsu+TLvE6d6sM9fJuech92lh8up0EtoNBGEuZrE+3LRsb9pjOGAQ
	bwM66S22R5nHjR2vpqGCeu2N4JEe5ZCyctKLQsbOesvEk7p0Vmc+Lfwx2aLTk+JHmaBAmNs+kxJ
	sm52vO86+65HeQ==
X-Received: by 2002:a05:6000:98b:b0:48e:3484:8af2 with SMTP id ffacd0b85a97d-48e64d10510mr37075329f8f.31.1793701729728;
        Tue, 03 Nov 2026 02:28:49 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm24941003f8f.22.2026.11.03.02.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:28:48 -0800 (PST)
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
Subject: [PATCH v3 1/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Tue,  3 Nov 2026 11:28:35 +0100
Message-ID: <20261103102840.68903-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103102840.68903-1-azpijr@gmail.com>
References: <20261103102840.68903-1-azpijr@gmail.com>
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
PTE in a VMA without VM_UFFD_WP.

Recheck VM_UFFD_WP for UFFDIO_COPY_MODE_WP copies after looking the VMA
up again, and fail with -EINVAL if it is gone.

Fixes: 6041c6917903 ("mm/hugetlb: take care of UFFDIO_COPY_MODE_WP")
Cc: stable@vger.kernel.org
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v3:
- none

Changes in v2:
- drop the leftover sentence and the non-hugetlb reference from the
  commit message
- add Mike's Reviewed-by

v2: https://lore.kernel.org/20261102081140.201987-2-azpijr@gmail.com
v1: https://lore.kernel.org/20261029221129.89068-2-azpijr@gmail.com

 mm/userfaultfd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index f33ccedfecd2..6321bb82c1ef 100644
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
2.56.0

