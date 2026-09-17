Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAE44E0B9F
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677914; cv=none; b=gptIEkRs29INmh4NJRsPQ+OSBq6+Qt+ZLxOYR30fvyy/JT6hwmEXvEayCTZcbj0tnYLjYlhxFCG5soi3fSC+iCgTPt/BK3HKX9LTZAg2WwoMcAh/4X2eqlcT1iIsC+yiJ2PRQSrrdn9pHm9xIeUuBUeqz3LG6cFnPWJZX4QVQQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677914; c=relaxed/simple;
	bh=AkbxLkF/+nAmGEf9KgEr5gQ3H9mZvwt0D27L0+zaegU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I66P/MGeHtjvfcZWL8j4bk5pSQpvER5zA7OPUbL19vYwr8KCQcT09V+nKvQrH+8/87T+7LgN146vwbwt/x8q752Hcb8QLVx+dXvWOhxVVv5HXZXHZITkEKcuzRrJlKCmgZYpgb1vJ3Q3BwVT5MLth2E9+E2JQhqmi5ELAu8yMZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LB/joyzB; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LB/joyzB"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so98798a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 13:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789677910; x=1790282710; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hoad39omJnatpjgiztoN01A08gT8UYIlksvJjwoC6QM=;
        b=LB/joyzBePGiI7tkKSlYZq3igeTLEQwIbfTTi2+2c68POih/95MDqqrFzGtH+O2TRy
         tDwqb7E1Lv2aqNebtuRG8xiWsyM3LXQn7TlpCJKJfl6hJMFf2uNMqnwwCDgL/fH8KkBv
         QdK9wRQNf+3xYNa2cqFHYJxm5me5QmFq74w6Wg5jyE6JPuBAbH94n4JXyar9eRbhZzTL
         h7KqJSV8A+cLL7Z66qx4nyJId1AB+bXC9WBkuiXwzYyE8QVkyWgI0z5X1D9QVnBzySdW
         zwoal8jyv/sofhyxgLjMqHEpM/5pkGjmpg2CZatAqkSZmHx0Zrolr+FoVKpnku+TkDT0
         VZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677910; x=1790282710;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hoad39omJnatpjgiztoN01A08gT8UYIlksvJjwoC6QM=;
        b=DkDxAu/Ntmp51UD64wRMKDmDuU27l+dJf3139UGrn/EFlYXBZV8t4hyicxj5dZn7+L
         j6IhzJICI9fP+s0GBF02O0dg0TmQZBEIXX/Z8pO44gpP67Cs/XukMsimTyLCqkYNgUk+
         OMAduYXmiVmbPogPqxFy686c8bAfcDs/3UjAEY7iOZutselMPvZCIESfwQ9qeXbnRVef
         cCsXohIIncsAoTlKXkd+sefFWs5f6hW83n/L/RShvXqjHHpmRMNvtfJkZZ1Z6enmC7Yk
         sxDEy21n31FBoxtHfyp+z5P7kadHJXjnmDNJisGHiJgLdoRkF+i8cOCTD0hnFGOiHKIJ
         1niw==
X-Forwarded-Encrypted: i=1; AKwUvBx496yLnyKAceqlUxnbCqZljGi3N7YJvLhxM+jHbc+nWdiIoD9OaPO/LbFFmayh8uLOz3y4idt4te4ke5r73E4=@vger.kernel.org
X-Gm-Message-State: AFuF++mSyuI6kCOU9ZxAiDxY9MpFNQHP8bIcWlZisRjnv+FcdJCISZ+R
	liChAS625yell5hJvLqQGD0eCcNIDs08LFob6fiiH/TRB/wXihNLeUZufxaWw+Dx7OMD7ykwH7w
	hFw2thg==
X-Received: from pjbei24.prod.google.com ([2002:a17:90a:e558:b0:39e:ac:d0a2])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224c:b0:39d:f317:44cd
 with SMTP id 98e67ed59e1d1-39e54eab3dbmr1101051a91.14.1789677909569; Thu, 17
 Sep 2026 13:45:09 -0700 (PDT)
Date: Thu, 17 Sep 2026 20:43:48 +0000
In-Reply-To: <20260917-memory-failure-mf-delayed-fix-v6-0-4b00856b5364@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917-memory-failure-mf-delayed-fix-v6-0-4b00856b5364@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789677906; l=2010;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=AkbxLkF/+nAmGEf9KgEr5gQ3H9mZvwt0D27L0+zaegU=; b=l43vikXXPWbiYd0vKIvQqVDarn1Ty3l6Vrm71axmlmmBFUC/OJBsLcDslWeQrnqbkktxP00pO
 rxclAE9wwFRBWLRaf58fDlGZj9/LGabzo7cne5Pv9ImCfAttWfE42ZJ
X-Mailer: b4 0.14.3
Message-ID: <20260917-memory-failure-mf-delayed-fix-v6-2-4b00856b5364@google.com>
Subject: [PATCH v6 2/5] mm: memory_failure: Allow truncate_error_folio to
 return MF_DELAYED
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, 
	Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, Rik van Riel <riel@redhat.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, Lisa Wang <wyihan@google.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="utf-8"

The .error_remove_folio a_ops is used by different filesystems to handle
folio truncation upon discovery of a memory failure in the memory
associated with the given folio.

Currently, MF_DELAYED is treated as an error, causing "Failed to punch
page" to be written to the console. MF_DELAYED is then relayed to the
caller of truncate_error_folio() as MF_FAILED. This further causes
memory_failure() to return -EBUSY, which then always causes a SIGBUS.

This is also implies that regardless of whether the thread's memory
corruption kill policy is PR_MCE_KILL_EARLY or PR_MCE_KILL_LATE, a
memory failure with MF_DELAYED will always cause a SIGBUS.

Update truncate_error_folio() to return MF_DELAYED to the caller if the
.error_remove_folio() callback reports MF_DELAYED.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Fixes: 6a46079cf57a ("HWPOISON: The high level memory error handler in the VM v7")
Fixes: a7800aa80ea4 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 mm/memory-failure.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index e698d0e9711d..37ea23489b75 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -939,10 +939,12 @@ static int truncate_error_folio(struct folio *folio, unsigned long pfn,
 	if (mapping->a_ops->error_remove_folio) {
 		int err = mapping->a_ops->error_remove_folio(mapping, folio);
 
-		if (err != 0)
+		if (err == MF_DELAYED)
+			ret = err;
+		else if (err != 0)
 			pr_info("%#lx: Failed to punch page: %d\n", pfn, err);
 		else if (!filemap_release_folio(folio, GFP_NOIO))
-			pr_info("%#lx: failed to release buffers\n", pfn);
+			pr_info("%#lx: Failed to release buffers\n", pfn);
 		else
 			ret = MF_RECOVERED;
 	} else {

-- 
2.55.0.1082.g2b9226bbc0-goog

