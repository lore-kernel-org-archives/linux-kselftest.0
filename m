Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260943F0763;
	Wed, 10 Jun 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087381; cv=none; b=IAPP57rYHb+QCXbf3RUPoxRlmjsAgtjni1CvbgURS2Wxp74iHgkjDwWFtn8iKz+6j/mo0EzMhEY4oIT30PlDuJzhfRjabaM0iMwpob562v6WWIApPoh6DWkjnclW5xXAKQaDdsgYAfDAvzgBk2VWHMzSy9jhR9ERly4pNGBdVKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087381; c=relaxed/simple;
	bh=UtQCH3uy20HwxtFrwP88iG9vYt2++QDI+vc0wtIbR4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVvy2WD6XiOg49OgZ29aJ/YbOglwIcxE5By/HtlbVLzL4lcC7wN+oICQ9z/n271jpxa1UMLnQHGynJJDo5BrQbV3yAlu8vr5uPy9umMkwB5Ivh4a9LdmTZ8FifOGQRrgEqOf1c7xi/vh+RK18ZX0lckAthd4JxfjB0DS0ySD6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=spSEVkFJ; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="spSEVkFJ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087376; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=zdfnlijOCrbir+VZ2n7kQKRLZHQg8II97GPm1C9tmhA=;
	b=spSEVkFJNbbSA0wXxQWDGpgZYN8zo1W2nNG+hiSbNvKSj3qmuz1t6pwb33/TW0Uq6qANO3sKj0cCHuZK6XcIffzZ8ck3bEhAJLaBguX9V4g5u+EgZ5biCChI1Guxuc+O3bQaezr1TdXJID/skf2+5WPvBPY1C7hHiaR01aL/4y8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aHmiG_1781087374;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aHmiG_1781087374 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:34 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com
Cc: willy@infradead.org,
	ziy@nvidia.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 06/11] mm: khugepaged: allow khugepaged to check all shmem mTHP-sized orders
Date: Wed, 10 Jun 2026 18:29:14 +0800
Message-ID: <b4d0c1a5a49284b1f0afb0810e056f6d88b17d30.1781083630.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are now ready to enable shmem mTHP collapse, allowing
thp_vma_allowable_orders() to check all permissible shmem large orders.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 75b18ec4a6c3..a87918b7e18c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -578,9 +578,14 @@ static unsigned long collapse_possible_orders(struct vm_area_struct *vma,
 {
 	unsigned long orders;
 
-	/* If khugepaged is scanning an anonymous vma, allow mTHP collapse */
+	/*
+	 * If khugepaged is scanning an anonymous or shmem vma,
+	 * allow mTHP collapse.
+	 */
 	if ((tva_flags == TVA_KHUGEPAGED) && vma_is_anonymous(vma))
 		orders = THP_ORDERS_ALL_ANON;
+	else if ((tva_flags == TVA_KHUGEPAGED) && vma_is_shmem(vma))
+		orders = THP_ORDERS_ALL_FILE_DEFAULT;
 	else
 		orders = BIT(HPAGE_PMD_ORDER);
 
-- 
2.47.3

