Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3541540758A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773963062; cv=none; b=tbv8H4EX9fDrOGZGGX46vXUs1cB3nsAuu7ADZroo9mDKm9qGLPexapXlEBLZQcEWz/T2W7bzrpi3FoaHZ4jAXJ0aPPo/YhLuusVK4EPyXzvVK5hbmOjlQbjZaiSyoJEUBZIF67+bHFpNthJeQkl+jI5zxVPC+emSBvtLY4qja84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773963062; c=relaxed/simple;
	bh=4nBmEq8PTxZ6noHdf3XYrTEMDbspLx8WC3hJcQV/KoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q4U15GGHYvwLz8rVhi5FQ/HsxrFK340r0S09wgWRrlR0LpqyW8IteIBRVO+yfTxW7OflNEmeJmgjymrM3xhRiqKBn88pd00cUA1hQYTFglSQO+A/I10qmC7YIq2SP2ov2F+sOo1Ht4KMR9a8QJyzuvEWw0+WIHF2jb0mgdN/w54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+j0/diJ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+j0/diJ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c741b950511so31958a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 16:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773963059; x=1774567859; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovB857WaY8E/qhB9OVlkciDwSTU3lGKfzkX9KK2x9wk=;
        b=p+j0/diJlY77CuXR9Tk54HsPz5ZqsgCDDIWCVmWTZ84Pw455+A4833FDXRQpK/fJKn
         3oOnBeaov91Y5rKz5YbghTf3NYdHPpLxdqy9dtC2JL5hFMXrIILkljV4Em7LmbP2grSx
         cqnACMcEBZDF4zHjH9SDA+PkgNp8fDc+SndHLXgkoQl1GiIUMZtsXJNhKkxL0Ja7BB6J
         +YoQIQ4tnZsrSaW05T+6wWdlQTYzfELFO4n3368Sjz5kzQjrrLbuk07PinNja4eQubhy
         LsREzRmbjOgQh6qluOVQyI99vPptGXdRFh4/hEPpQ5laJfT9W1cRQlTF/LsNqXiuGJFx
         zUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773963059; x=1774567859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovB857WaY8E/qhB9OVlkciDwSTU3lGKfzkX9KK2x9wk=;
        b=K1LBuKKqNUaXl3HyPHXeXAsbmNa1ruFaALvBsf0Nn0eM4xoC1U0uuStaJ3UCgB0gnZ
         ruyhippsFsZ0YV2heqck+vCZQ/qw3IqhUpHQsCGmPmHbaFLCdaoHYF0l0E3wC63JgVWP
         R8UhRCR1eEWvcAp15RhxKBkFummPAv0aW3coRsjn+AeehVG8cbXd7XsGeiZyCjIoVo1I
         4ADf+9uFO8V2eq2WuHpKU/Ya29B9MQ5ZbSQ4LpVER+NF24HXTYYIbpvItew4OhC5IYvQ
         cuFKiHF6CQVH8//NfXlVysbcwXYfFmwqeTS2lILPNPMuXhdDJeY7wA+EQzev74DO9zJX
         KGJw==
X-Forwarded-Encrypted: i=1; AJvYcCXcyyfvFL9vyr12ecJ0+acku56ehRot4AXKeH3Zey6Sb3liBFqtqJkLLDB9MaOGqofBnX0iIBbLZnveRfaFpac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzReKD9ZBt3i6uNK04vmqUVLq2qAn92LOXE4AUW4wBuHr7Yb2dU
	Vj0qvIhFgtCf8RTmNwfAkU+uz/Q8EHG5PeJRkh6qqdQmU9xLrk318iHUvEJej8BexcBoO3pfzEa
	ZxoXCdA==
X-Received: from pfbha19.prod.google.com ([2002:a05:6a00:8513:b0:82a:5ddb:b051])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a2c:b0:398:8f38:441a
 with SMTP id adf61e73a8af0-39bce778777mr953630637.0.1773963059297; Thu, 19
 Mar 2026 16:30:59 -0700 (PDT)
Date: Thu, 19 Mar 2026 23:30:30 +0000
In-Reply-To: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773963053; l=1597;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=4nBmEq8PTxZ6noHdf3XYrTEMDbspLx8WC3hJcQV/KoI=; b=vxpkmKNhTZAlitbCxGvzVvglenrXGw3kA9VLn/NaSu26fMFzma1N7B2oDY+7WGhTEHrWyRZfI
 Xc+uBjA/xs8Cf3TsOP1JQPD7CsnWMD8SRzBy9zxDOlQIv328bdjw/Ai
X-Mailer: b4 0.14.3
Message-ID: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-3-92c596402a7a@google.com>
Subject: [PATCH RFC v2 3/7] mm: shmem: Update shmem handler to the MF_DELAYED definition
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

To align with the definition of MF_DELAYED, update
shmem_error_remove_folio() to return MF_DELAYED.

shmem handles memory failures but defers the actual file truncation. The
function's return value should therefore be MF_DELAYED to accurately
reflect the state.

Currently, this logical error does not cause a bug, because:

- For shmem folios, folio->private is not set.
- As a result, filemap_release_folio() is a no-op and returns true.
- This, in turn, causes truncate_error_folio() to incorrectly return
  MF_RECOVERED.
- The caller then treats MF_RECOVERED as a success condition, masking the
  issue.

The previous patch relays MF_DELAYED to the caller of
truncate_error_folio() before any logging, so returning MF_DELAYED from
shmem_error_remove_folio() will retain the original behavior of not
adding any logs.

The return value of truncate_error_folio() is consumed in action_result(),
which treats MF_DELAYED the same way as MF_RECOVERED, hence action_result()
also returns the same thing after this change.

Signed-off-by: Lisa Wang <wyihan@google.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index b40f3cd48961..fd8f90540361 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -5207,7 +5207,7 @@ static void __init shmem_destroy_inodecache(void)
 static int shmem_error_remove_folio(struct address_space *mapping,
 				   struct folio *folio)
 {
-	return 0;
+	return MF_DELAYED;
 }
 
 static const struct address_space_operations shmem_aops = {

-- 
2.53.0.959.g497ff81fa9-goog

