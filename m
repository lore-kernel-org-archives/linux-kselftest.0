Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616096;
	b=om7rkCTSfa7et1+EECfX72BE2U/090ysvxwCwLnieziJtwo7fSrExP6uBci/XD3D6uyc
	 gBxOCOPIccxe/r91uUqQhrXgfD17lRTJ2QsINyFhQxKtqoxJZC21d3GWua/AcX3fEMf3b
	 sG1r9S+Cgf0ewuHAtLaL45S7N3X7HgBYCsgFk/ojSU+nnYef2eZFNvF6ED5VJ2StuFk9c
	 JwQkVC65C/0W8fbGVPpzTkg57IevYg5mi1y27WQAgQmTQko/JToui0ssBFyEcZDxkWfqP
	 aWt01TWq8EbpwEyTkzwyDye1Btr7ui/KNxmk5Zn4B6uzy/jbcrIh3DEVUzc3LlvQVQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w4LlOPP020au30EZIDHlk1alCgqnzjFeQiEleoj/jqY=;
	b=N8XKcMjmLRLmhQK9It0/nR1VKMSmynidEFMnC+CLJW21Pl4AZ3+maW32fzjE+EQthQdr
	 guhdrvk05DNHyK8pwxVkg33LktEvbhUPi/We4ImKShwzB9Tc3c9G8QO63yQVreBo8/LDq
	 d1t01glMTVhGT7dLmw4yJD0gdU0t1EKox88mbfVnyPC1ei3LqoOQrILr9gttnm2XWmzhp
	 g4JAGzxGevJGRmJspjcEzjj2Havdnh0rZZFqoO5Tm5PcsVLv+JsUDvMsWIl5rVz4rAxa3
	 npnU96HA1otzFjtbapdncLsNiigwr9MZONEtX9th0V1COdx/rlta7dK9yV76B4F2wjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDmiOFg9;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB9A60A3809
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 10:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB9A60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDmiOFg9
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9eb579c0eso14324825ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616095; x=1794220895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4LlOPP020au30EZIDHlk1alCgqnzjFeQiEleoj/jqY=;
        b=HDmiOFg9LmWC1qeIeOmdtC0BdN5SaLCKolsBcI4ZZdNKTGn0LHthir7vWVd1xjBdol
         o7pODJQWwOqFNCJKbr5oTsGtSkAhzdjOhsiKKq8KZsiudWLjYot3nJ1iGFMuVOti6Vm+
         AolaRGT33An/VO1zqH7BFHx2RleU5szmO3vL1BFJ2dSpmOzf7QrQ4pLH2Gu/BgmKyzGJ
         XHrykPkhekEYSgCv5VVgO2W9u2fhCbD/rslgsXGoyVOiNxw2QHj6cYCezWEy2KEwdZCX
         Rkg5iHHTT8Xfhmbps7DNrcTeAZd/Ap4dhBcGCrS3R0pMmg0c4Y+ZJqt7E48lLOv3dsbA
         pqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616095; x=1794220895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4LlOPP020au30EZIDHlk1alCgqnzjFeQiEleoj/jqY=;
        b=BebQny1/WsCpECWzFPjpaIL51myl7WeuPSFQGRYS1M9pYywfhXRjRZjPkUwSHpQokX
         24T8UvFuQ6I+TwrMa3CsYFVG5CE4Mst/V5n5jqd5U25mV9mJ3j06QnIk2bxDE+f2Zvuu
         x15rnwkeQ8ic77GrRc1Nij/YclxxRSHM8ntw+aUp89NNJjoGAheMeRJ4Z19yaO231NwC
         TsLp7oWqGQQKGMD/SPtYAExT/nVLP4vdI+7k/JLw+bc356FPgzu/awruAA9BtiaTEkKy
         NZn+QX+O7Zk7/+sTtd3ovLHE57HQuCdHhcGkZz8j9CPNQ1MRG5TKX9JIm7Uq0hMhvIrs
         KpAA==
X-Forwarded-Encrypted: i=1; AKwUvBxm30lqcSvUiUbFLSy9QmMEXDWiQC53Yp+BQmX+QzONpqgquBnKPO1tlCQsKfVC6kTukcGnV7OSlLHaueoLgpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fv3X8MlMGbvsBXIhTYPldhXEUvdlFvU4mS0tsfdpe6cah2gW8
	DwgfPwUpGnmke3ps7xO7h5EQxOIroH/q7rX5tzJdv8KeAgTdU8bFq+B5
X-Gm-Gg: AYBFou0tkMsmZCCABI7+NI/Eus3/RpzDUHeXdX1elepS2glsF6ojQN0XXtAZOL5Hzt1
	mCLJkAMa1LQPMqzhX04guuM8ELq6Zu/OdXqT9yawUmARgzs43l+j0TZ4yoKmUQTW/8HkicgsPwf
	8Ry+BGsF9XTSjmGYz0yU8H4PXGi/xYLZiP0hrF09m8On4CB18Ih1QcJ7bZkEPlMvGSlqhOrp8Es
	t25NkRi3uDRJ78F5kk3Hu4OLnuLi7ldPI36MW2eE8py6aPX+geMYIL3Wp5LUhcsuUZo9nXHNExN
	fhnioBmzWazVucG4a3U8PNA/Sv9fKZJo6GGPAL8McaTjbEW1Ff0z1yq5HO3cMpeNwP715aBi2KK
	EW1wf3XJvr8sLIFCi3S2GhiXR7j8Yt+qeNXz48hXYfwXTPUniV9mPPAjcNcmp9Iegh5eTwr3PFd
	j7XW+Dmh5O73vCH5GF8+wT9xr9LgRFba5Q6dcasvUSil9LrYpZ2pP7v9CZY3+UxBEr6DoIHgwN2
	CtLS6OY+eFYeDO2C+JQEtrz0DDv3nl60qqCJ36sVXFJrlo2APRlcqyOmquQARH3q+b0y2Lr2HyT
	Ekq3STcTufNMNAdag9TXcBDUu+Sv/EnrQfYFGD/oSszWegwaoH0c
X-Received: by 2002:a17:903:3bd0:b0:2e9:f354:e97f with SMTP id d9443c01a7336-2eb36482f5cmr79668765ad.60.1793616094571;
        Mon, 02 Nov 2026 02:41:34 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1f3a:7c59:eeec:de7d:b077:9b9f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3925ff38sm25195465ad.36.2026.11.02.02.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:41:34 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Pokhriyal <umangpokhriyall@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] userfaultfd: validate the whole range before changing write protection
Date: Mon,  2 Nov 2026 16:06:20 +0530
Message-ID: <20261102103621.156928-2-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102103621.156928-1-umangpokhriyall@gmail.com>
References: <20261102103621.156928-1-umangpokhriyall@gmail.com>
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

mwriteprotect_range() checks each VMA as it walks the range.  When a later
VMA is not registered for write protection, or is a hugetlb VMA the range
is not aligned to, the call fails after the earlier VMAs were already
changed.  When unprotecting, userfaultfd_writeprotect() then skips
wake_userfault(), so threads blocked on those pages are not woken although
the pages are writable again.

An unprivileged process can trigger this with a range that spans an
unregistered VMA.  It hasn't been seen in practice; it was found while
reviewing the userfaultfd range ioctls with an LLM.

Validate the whole range first, as mrwprotect_range() already does.

Fixes: a1b92a3f1498 ("mm/userfaultfd: support WP on multiple VMAs")
Cc: stable@vger.kernel.org
Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---
 mm/userfaultfd.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 87da92526..b8a9d9574 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1105,21 +1105,31 @@ static int mwriteprotect_range(struct userfaultfd_ctx *ctx, unsigned long start,
 	if (atomic_read(&ctx->mmap_changing))
 		goto out_unlock;
 
+	/*
+	 * Validate every spanned VMA before changing any of them, so an
+	 * invalid range is rejected without changing part of it.
+	 */
 	err = -ENOENT;
 	for_each_vma_range(vmi, dst_vma, end) {
-
 		if (!userfaultfd_wp(dst_vma)) {
 			err = -ENOENT;
-			break;
+			goto out_unlock;
 		}
 
 		if (vma_is_hugetlb(dst_vma)) {
-			err = -EINVAL;
 			page_mask = vma_kernel_pagesize(dst_vma) - 1;
-			if ((start & page_mask) || (len & page_mask))
-				break;
+			if ((start & page_mask) || (len & page_mask)) {
+				err = -EINVAL;
+				goto out_unlock;
+			}
 		}
+		err = 0;
+	}
+	if (err)
+		goto out_unlock;
 
+	vma_iter_set(&vmi, start);
+	for_each_vma_range(vmi, dst_vma, end) {
 		_start = max(dst_vma->vm_start, start);
 		_end = min(dst_vma->vm_end, end);
 
-- 
2.53.0

