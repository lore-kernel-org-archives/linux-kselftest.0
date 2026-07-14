Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C056B47ECD2
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039423; cv=none; b=ceBnDvhnS0ULnXjgMy0sR1zCRmJqKlNUKMyI3llXrls+ULzQbFbMDOhKPSi9ol9sg1rr5EXo7Xa4CULDUNDJ2Dbab473JbfDjTFf0gfdzvre9vRJBrAPz79+mKE7ppDhdknQSOucEhXjZzZ+oV3GDnuo0wDlDkpNeoGs/9LErXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039423; c=relaxed/simple;
	bh=zFeWDdafDoYi7ea+8KDHKiNyfn2RCWSEnlN5ywMFr9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIki3hxCqTFUXK3iC1gGt+IH4w76LLFF1Axyp9AzWy5U74Mf+9pqTe+bw/IkSQQ8nwKNVMsTOyG77X8qcDAGNioNIBXuf0wF/MsWmn0IsSDIGGMw3wHCrUYV6C7oj34E5PUXOMTChurgY5fiFtliSyxAp3VF3ikveS93MKKWNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=fqZ6Rgph; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="fqZ6Rgph"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so4498237e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784039420; x=1784644220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myAuJMzKK/4iG9Cmnf7VPvLoMfqifqNKwX3ebA7nias=;
        b=fqZ6Rgphmp6BfB1w3zQfLmRui03bV4pkN21UgZ8ba5Gcn1E10qX919G0ei3ilz0vOL
         yjrfDDypdVHXPgxRRGPSLzNySRnqryAZl4sQNNFNo1XWXKs3M2/iTaRsYl9rtqeVuQlw
         aeOqsAnJBNv6qDiuKHkJJaxQzqdknxGgmYoSglXffqwf4LsguOXRdQC0UQ9i3Sm8sCbP
         HFrOeq3bdbjAsXd2WDs8+Xz6m7tykP9OD9Zb6QJU+cxN0OtuDK1DRr2YGYOlTt+zD3M4
         dm18+Qdy4iEm7ZsIwvi6xmdis4jmF4CJGyxqHBO8QyUXFcsryoQxRzNmhCy6Kpyy4fsl
         4olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039420; x=1784644220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=myAuJMzKK/4iG9Cmnf7VPvLoMfqifqNKwX3ebA7nias=;
        b=ItKjn8PftHwmVUZZYOIwk9IZxzbLezSsewNrhIMn0raLNenT7bmM9bB4C1LzySOZbQ
         XOcgIJA7q/R42WPZkLAWHERI3dCRyXXpfJ5b4qoyb3hu0oh1cgVtBRcuetl8MUEd+8KB
         f9djTTemQi6YTa1miguMFpDC9CNXm2MdMWNdzhov/MPSV/uGIA3lANoQsEaHVyIo21T+
         hgHs31zre3SGee2092aYF0x/mMsyEerFQTFz4WMcoYJdkysa96IYnOw/Xhdgy6CmO8lf
         6BlBKx4LqA0NGx1C9xVnV3ayOLubU4BT/inER0ZSOowJhv10n/Mh/2xr5TDW9XLrR/BF
         Qi7w==
X-Forwarded-Encrypted: i=1; AHgh+Rp4Z6IBTUPb8nDuw5R/eEoYzwgwuNPeXc1E2Yi80u9gJSLQog1lHLU59TXn8oosf/abKOu9sJridDupjjUDKrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydw+G4JlyHWcbADbqY9JdC0JiO5QQ7B7mkWwTC/RtWQGyY0OWw
	/zeW6DWN26x8sgBh/AIMLrwRpuBkiM+1uy7mh5Dn7P0zEvSemntt7IhkMaJ+mmSGV08=
X-Gm-Gg: AfdE7cltRclrPlQM4HSeL56QzHG0dP4mhSJ1/u8Gj1aNR6sza97S3PW7WHhsPpe05bW
	OHn1bMvBeOHm2uVYqmO5jjAx7wYZSAxEyJbeeQNFXuKrrMq72Nl2xN6OnfZA+4NKJ8VpDzfawUJ
	DVneyGYzQBuDByrZGWF9iTPXZYcMJZZz1S1u5KQzh2HyF/JBVpy/KfnjKS0Sdq/7j43V+BSczgQ
	pJsEhCD9OV6mAD3TJEZEKYYihuVORS0bvBzNRreIYDno5Ydxb5JWMAVMZWkN18xxgQaE7oiPDPI
	b0uKImpD5IPf45BWisZ8de7tURWNzrgSTKQydVdQuM9KL4kAVZjW2/GwmVfDjC+BWTnUaSdbJr2
	zmJRuKKtg9RsAq+6qJCkqVzAjdf9ePbO+4W4XyJIG1oCgxOZfeqHJpefhuvt4hesvD/ZL2UGHdo
	lRdLnvpRj8NhSl3xDk1i0QIA==
X-Received: by 2002:a05:6512:21d:b0:5b0:1428:cab9 with SMTP id 2adb3069b0e04-5b0236bb426mr2001205e87.50.1784039419732;
        Tue, 14 Jul 2026 07:30:19 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4f90csm3589518e87.21.2026.07.14.07.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:30:19 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-rdma@vger.kernel.org
Cc: cgroups@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	jgg@ziepe.ca,
	leon@kernel.org,
	parav@nvidia.com,
	mbloch@nvidia.com,
	cmeiohas@nvidia.com,
	roman.gushchin@linux.dev,
	bvanassche@acm.org,
	zyjzyj2000@gmail.com,
	shuah@kernel.org,
	tj@kernel.org,
	mkoutny@suse.com,
	hannes@cmpxchg.org,
	alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	wenjia@linux.ibm.com,
	yanjun.zhu@linux.dev,
	cui.tao@linux.dev
Subject: [PATCH rdma-next v2 12/14] RDMA/rxe: Allow queue VMAs to outlive ucontexts
Date: Tue, 14 Jul 2026 16:29:25 +0200
Message-ID: <20260714142927.1298897-13-jiri@resnulli.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714142927.1298897-1-jiri@resnulli.us>
References: <20260714142927.1298897-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Prepare queue mappings for asynchronous ucontext disassociation during
device disable. Rely on the VMA page references to preserve mapped
memory until the final unmap.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v1->v2:
- new patch
---
 drivers/infiniband/sw/rxe/rxe_mmap.c | 35 ++--------------------------
 1 file changed, 2 insertions(+), 33 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_mmap.c b/drivers/infiniband/sw/rxe/rxe_mmap.c
index 7f723a2f3700..a4ead89ccbd3 100644
--- a/drivers/infiniband/sw/rxe/rxe_mmap.c
+++ b/drivers/infiniband/sw/rxe/rxe_mmap.c
@@ -11,7 +11,6 @@
 
 #include "rxe.h"
 #include "rxe_loc.h"
-#include "rxe_queue.h"
 
 void rxe_mmap_release(struct kref *ref)
 {
@@ -30,29 +29,6 @@ void rxe_mmap_release(struct kref *ref)
 	kfree(ip);
 }
 
-/*
- * open and close keep track of how many times the memory region is mapped,
- * to avoid releasing it.
- */
-static void rxe_vma_open(struct vm_area_struct *vma)
-{
-	struct rxe_mmap_info *ip = vma->vm_private_data;
-
-	kref_get(&ip->ref);
-}
-
-static void rxe_vma_close(struct vm_area_struct *vma)
-{
-	struct rxe_mmap_info *ip = vma->vm_private_data;
-
-	kref_put(&ip->ref, rxe_mmap_release);
-}
-
-static const struct vm_operations_struct rxe_vm_ops = {
-	.open = rxe_vma_open,
-	.close = rxe_vma_close,
-};
-
 /**
  * rxe_mmap - create a new mmap region
  * @context: the IB user context of the process making the mmap() call
@@ -106,17 +82,10 @@ int rxe_mmap(struct ib_ucontext *context, struct vm_area_struct *vma)
 	list_del_init(&ip->pending_mmaps);
 	spin_unlock_bh(&rxe->pending_lock);
 
-	vma->vm_ops = &rxe_vm_ops;
-	vma->vm_private_data = ip;
-
 	ret = remap_vmalloc_range(vma, ip->obj, 0);
-	if (ret) {
-		vma->vm_private_data = NULL;
-		vma->vm_ops = NULL;
-		kref_put(&ip->ref, rxe_mmap_release);
+	kref_put(&ip->ref, rxe_mmap_release);
+	if (ret)
 		rxe_dbg_dev(rxe, "err %d from remap_vmalloc_range\n", ret);
-		goto done;
-	}
 
 done:
 	return ret;
-- 
2.54.0

