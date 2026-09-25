Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD0331578E
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 04:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790310556; cv=none; b=rXnsuveMAiY7jJ1pfa5kc52lykubcQ+bRpd7kWFJ4+5evPChh5A2XPhQnU1jSpUuuqbs+Ky9skJgtsZUr0DTz+OLkw+z0WLTL5URg6PBanm8sJatONa93DhInaW6zcomMs79ChWBXjRu4ZMFgSVU0lB+GVU3AHw43nZH8lmVkHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790310556; c=relaxed/simple;
	bh=fQ0lGh5nE5x7WDibbiBqKf1lP6tmpG1zFRinGo82sGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OfWyTwQ6E6avcfpRSPGpqWeQoUnGGkN0GxMk2HNMRMDdOWzAWoditPE/yieb1pZALJDz5PRQq6flkzjLMe3TkjI4yfuxum/5N+IkY91A6JjO5KO72OvOYXdxZvcfz1fjQu/y3o0eEyFLDdBgJeJh5lwQc7dUVDNdwpD7JTTfrWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8AbLEkU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8AbLEkU"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso1626345ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 21:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790310555; x=1790915355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yf3h+E5l7lZ9xnH7vca0oSG6Rr+EZJjVtHwLxzVwIUM=;
        b=R8AbLEkUR4IpEkG6xRYfoNLoTuHU5cV9lvDxspLCQ1PxN+CdCGs1V3DpXKL73SVEuL
         sM242vXt/qMaCZqEoEO1rVX1+WDDnUmAyGjObq1XfpKjHTjeY8vboh8jzBCoSrVJN8um
         OUmqUm7zeLtFoRoR++/jKx3ap/QdwJJRLcWsdaxzNZxboSUTlsCIlpcfJMpU9EEHTBNC
         sgIH/fd/NNxkpUxo4qBz8CpOqFlhxbi2iS2BrL3jugVJ2/oKlgxL9BL3ZNAUv3/z7m+e
         5RjbvH9bv6BZsOcvCx6W+feaSdfduOYi68ZrlXfrt0+FKKcObDIWp7CqDZJpVSBAiGSa
         9tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790310555; x=1790915355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yf3h+E5l7lZ9xnH7vca0oSG6Rr+EZJjVtHwLxzVwIUM=;
        b=RZ/YKe1n0LLAS7Wv+f1QwZiDISwjZw35NiMDZ159vYBB3hDpo4ubXkJCsSZIgfwrMs
         /OqVpiYes2fkXkf5g7fgjZZtEbTxMXK/SGadKsvr0+llGkyqyYZ+t1VJWqR+mgfmvALH
         tVRkenYRAzz67XqVoc1pESZQBmuYU5yzK7RZqXT/jzym50o3fiB5k3ub+CPeddzh4riw
         3M4jI4W8JivL6Dquh2jKht0C8aKFTh8nlYW9CjT3iKRlXAqbl+nMzc+ocNuy53+vvyb4
         zH8cB2gJDRwtQZ8pOjRI5SepsNx8sbP1uPBFZYTq2vGD+KZnfGRpjY8x+Y/RWD1//+g1
         tyMg==
X-Forwarded-Encrypted: i=1; AKwUvBzcXQK3seoaE19fJHW6nkyhp9bVtAvMnTwQBPnSMlIcf+OH+zvKjb2AcFokt9OJjKwOvDT7jpz1aykWWMtsI5I=@vger.kernel.org
X-Gm-Message-State: AFuF++kEQVgJ1iTnmHnkbs7mCaI1UWser64wzMYPWfmvg9TIb2XJ2MMB
	dgvI5UsI0EJmrxf8FyI0Qm/E4SWc452i/hieOVf4v1UwU33ytnh/q7Y=
X-Gm-Gg: AYBFou2GageBtlm+Z8/JIQTJZAYA36GZeRGcikJ8uR361dGAYAeBPNGm5dkLPB7y4Yc
	oaiLxk0WH/ryO6jkFCopn7nWSSiyQkxWtZr/bvAdcXXrWfXB+NvdaKOp9oKzFiLhyAonnUyPcoj
	YHY06SAL0FjtfKmjMgNlcz5teIqPSRVjcvbWYlkSa9v1jgblQRwoF2Y1HsnFS072trNee/shUqM
	je8mUM64+mkn2VvTt81P4QiB7PekFsDthK7luBof4kX7XAHz7VP6AHqH2FV+D5GrWSDwSaqqgTV
	OtTcrSXRjnWfdVdVcFLPQRsxq2AZiaaJn7AeRw0Kre9Iu+Qp2ZzkWitWzhdppJkeziYcKRrQh0f
	dNZao7q7374mzvrpgXv5f/qdb8ZPlaJE3L88IBToRnKf4rStjDoO5Xu03AfgfVDcMoT4mRR7mo3
	Zk7Srx+eDiN0YLUepDH1BFAR9KUffL6I1anPjy4pDg72+IySfXRyJ5bOEJV3CT7il+mFG5eI3lc
	tOoehXuEryZ4XQtKr6rzcLKt2M83cCQe2A=
X-Received: by 2002:a17:902:f549:b0:2dd:c100:424c with SMTP id d9443c01a7336-2df7e247b6fmr40036125ad.48.1790310553531;
        Thu, 24 Sep 2026 21:29:13 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9525cd53sm2499125ad.38.2026.09.24.21.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:29:12 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v2 0/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Fri, 25 Sep 2026 13:29:05 +0900
Message-ID: <20260925042907.2330519-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on the source lands in a
destination VMA that was never registered for write protection, and
nothing clears it afterwards.  Patch 1 clears the bit unless the
destination is RWP-registered, which is what the present-page and
zeropage move paths already do.  Patch 2 adds the test that catches it.

v1: https://lore.kernel.org/all/20260919004630.1159895-1-donggeunyoo.kernel@gmail.com/

Changes in v2:
 - patch 1: clear the bit unconditionally (Kiryl Shutsemau)
 - patch 1: rewrite the changelog for readability (Mike Rapoport)
 - add Assisted-by: LLM (Mike Rapoport)

x86_64 defconfig plus USERFAULTFD, TRANSPARENT_HUGEPAGE, GUP_TEST and a
swap device, under QEMU, base 17e7b8eacf4c:

  uffd-unit-tests                    before   after
  move-swap-wp on anon               not ok   ok
  the other 114 unit tests           ok       ok
  uffd-wp-mremap, 38 tests           ok       ok

  pagemap bit 57 at the destination  before   after
  swapped page, dst not armed        set      clear
  swapped page, dst WP-armed         set      clear
  swapped page, dst RWP-armed        set      set
  resident page, dst WP-armed        clear    clear

  MADV_COLLAPSE over 2 MB at dst     EINVAL   0

Donggeun Yoo (2):
  userfaultfd: clear the inherited uffd bit in move_swap_pte()
  selftests/mm: add a test for UFFDIO_MOVE of a write-protected swap
    entry

 mm/userfaultfd.c                             |  1 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 61 ++++++++++++++++++++
 2 files changed, 62 insertions(+)

-- 
2.53.0

