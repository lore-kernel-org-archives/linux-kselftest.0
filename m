Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721892EC09B;
	Thu, 20 Aug 2026 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787206546; cv=none; b=ZherwdhGpLpcy7zW1uHWdhj+PNkh5La/FK2nC+vIfRpyRUXBNTBb0A64iDAfVOp1R5SyaYyvbX8manXIreZ24GFqW0us8dF7DhAlitB0thmqxvRbGP/1Sew4ix84nUpe/pC+3yxtGjQMMgeEF4so3rkeqdxRPuK6vz/+EZb3Wwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787206546; c=relaxed/simple;
	bh=JDRGJqpd6/+jOag/ZIoKor+GSihliLKGnR1X5SKh8FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8adBYuz1n2IiaL/ixaZYyN3EXz3Z+PjQN+XOO9fZUvqiLknCc68jIU7SPxgjdfSiLlopsigyeyygiDwDju77qYEH8kY0cT8f40R23fTzzUIFEuKT3iZezbq4yGHLzP+BdTu5NkVQfzGHHANhFlYmWiwKY8TZx5vLnXYbhTLtDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8f4bcdd29c5e11f19a56ed5b684f684d-20260820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d8c56ef1-3f0e-4005-987b-25cdc788237c,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.19,REQID:d8c56ef1-3f0e-4005-987b-25cdc788237c,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:7db8b62,CLOUDID:548e8bd7b5f61f1a0f61e7e475775867,BulkI
	D:2608201415408YJ6C13O,BulkQuantity:0,SF:17|19|38|66|78|102|127|865|898,TC
	:nil,Content:0|15|50,EDM:5,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8f4bcdd29c5e11f19a56ed5b684f684d-20260820
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1493064475; Thu, 20 Aug 2026 14:15:37 +0800
From: Song Hu <husong@kylinos.cn>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: shuah@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterx@redhat.com,
	sarthak.sharma@arm.com,
	usama.anjum@arm.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] selftests/mm: TAP output and global-state fixes
Date: Thu, 20 Aug 2026 14:14:23 +0800
Message-ID: <20260820061426.356869-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uffd-wp-mremap and mremap_test never print the TAP header (and mremap_test
skips with a bare exit(KSFT_SKIP) rather than a KTAP skip), so their output
is not valid KTAP; hugetlb-soft-offline toggles enable_soft_offline during
the run and leaves it disabled afterwards.

Tested on x86_64.

Song Hu (3):
  selftests/mm: emit TAP header in uffd-wp-mremap
  selftests/mm: emit TAP header and use TAP skip in mremap_test
  selftests/mm: restore enable_soft_offline in hugetlb-soft-offline

 .../selftests/mm/hugetlb-soft-offline.c       | 35 ++++++----------
 tools/testing/selftests/mm/mremap_test.c      | 43 +++++++++++++----------
 tools/testing/selftests/mm/uffd-wp-mremap.c   |  2 +
 3 files changed, 39 insertions(+), 41 deletions(-)

---

Changes in v3, per Usama Anjum's review of v2 patch 2/3:

- mremap_test: cache mmap_min_addr in main() before ksft_set_plan(),
  so the skip paths in get_mmap_min_addr() are taken before the plan
  is set; a skip after the plan leaves the run with fewer tests than
  planned.

Changes in v2, per review feedback from Mike Rapoport, Sarthak Sharma and
the Sashiko AI review Andrew Morton pointed at:

- mremap_test: save errno before fclose() in get_mmap_min_addr() so
  strerror() reports the actual failure, and split the ksft_*() messages
  embedding "\n\t" so continuation lines get the "# " prefix.

- hugetlb-soft-offline: restore enable_soft_offline from an atexit()
  handler so it also runs on early exits, and use read_num()/write_num()
  from vm_util instead of the hand-rolled helpers.

v2: https://lore.kernel.org/all/20260815080716.3596514-1-husong@kylinos.cn/
v1: https://lore.kernel.org/all/20260812120821.523860-1-husong@kylinos.cn/
