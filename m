Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488319;
	b=kjB8WFkimz6lWyx+66cnm9SK6inKKeE0EcrjRjJ1uWCCEt2fV6f1U5Nr+esl3tC4bgd7
	 IT0YVxeIWCtR6WuejZC6uxA4meJNxTqrhD9GR/0cxMmTeTLcnjIF9jwpIoP1IwOGrusKd
	 mzF+YuKF6rzJru+CvRyY/zz9YTFsrgYPzlIf89zK0knTIdLxSx4a0dmnkX7cPycBM1Hg8
	 mMuDhiskjLEdKe3zIYRKDKKo2C8aRa2wq3pvyZxNUeOxBUUCsgNlT1oNoVNju32dgyeHa
	 6eg66IV+8xkkWhlY/iEJp/7DfVibqNshfdTVebUcOnSn8dq/H16O8rBrwNMoXcZUANA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488319;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=q5EFTCLEHdRIRVIc1WLoQhbVHhzNw1gURxAgzmPnF6A=;
	b=hZaREgVU7W+h9EObkoPCSlAL2XDz+2Bxi2JgrTlCmX6E+g0B+6rJjdBKoRpx1bH5qfmj
	 kuBGrL4CZcGZ99Cykn4Segv8eybNDvR9JPiiLChLaL9sDGcR4m26rhTfzYEFsh6tOuL8N
	 Ln3sM4V1mB2CofMy36yxBnMNkxgUJ9wq7xj+DZercIM5xYB/wIGLlfnzTgIV03hS7UoQ6
	 G0W0nTl45aFnq9z1Owm1/PWBMVgEPVPYh1wNZzQnFSdeIDG4uqp5q6mziAjBSfKOOg2Yz
	 aEUkNGt/SN5J7VonMeEuSLfj3wwgR8ngDKN6bdv+ELLxhHdVc+sldZCQcB9SFdAkSZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ke2hc9QV;
	arc=none smtp.remote-ip=91.218.175.115
Received: from mta0.migadu.com (out-115.mta0.migadu.com [91.218.175.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE3B606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 02:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ke2hc9QV
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ir4B76zlkpWj23djjJNSYj9nLGcKKUpZKOTxUa3rwUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795488315; v=1; x=1796093115;
 b=Ke2hc9QVRkuhStqGmPaOOBCDAP5IcnOLBP2ePRL+ohPxepLVVPwa5HvKlzZZ905gkRMuSydh
 1zv2N0WLnE2iPv4FXuTJkyPC5n0IJhcNA6uog2JCqZ0n1IbYeUzw7rDvLoHZrZydRRdtHQJ6cl3
 pf5IR+AbKBiLfUekTjVgpAQo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9e699e5a7949427e;
	Tue, 24 Nov 2026 02:45:14 +0000
X-Mizu-Trace-ID: 9e699e5a7949427e
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v2 0/3] udmabuf: speed up mmap() of huge page backed
 buffers
Date: Mon, 23 Nov 2026 21:44:59 -0500
Message-Id: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACv6BGsC/3WNzQ7CIBCEX6XZsxhYf4qefA/TAy2L3URpA4XUN
 H13sYlHj99k5psFIgWmCNdqgUCZIw++AO4q6HrjHyTYFgaUeFYKlXBkJpHsy7TJiT6Vwuj8y4z
 igCeNNVpZ1wRlPgZyPG/qe1O45zgN4b09ZfVNf1L8L81KSGG71mitL0fZ4e3JPs17SxmadV0/6
 Sq7dMAAAAA=
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Philip Yang <Philip.Yang@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>, 
 Natalie Vock <nat@pixelcluster.dev>
X-Mailer: b4 0.13.0

QEMU and crosvm export virtio-gpu blob resources from guest memory as
udmabufs, which the host renderer and display mmap(). The guest memory is
often backed by 2 MiB huge pages, yet udmabuf maps it 4 KiB at a time:
mapping and touching a 4 GiB buffer inserts a million PTEs and takes over
200 ms.

Patch 1 has mmap() of a dma-buf align large mappings to PMD boundaries,
which any exporter mapping contiguous memory with PMDs needs, such as the
proposed VFIO dma-buf mmap() [1]. Patch 2 maps the huge page backed
ranges of a udmabuf with PMDs, which cuts the time to map and touch it
by 87-90% for hugetlb and shmem THP backed buffers and leaves 4 KiB
backed ones as they are. Patch 3 adds selftests.

[1] https://lore.kernel.org/r/20260527102319.100128-1-mattev@meta.com

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V1 -> V2:
- 1/3: Add Reviewed-by (Christian König).
- 2/3: Pre-fault only the faulting PMD range when the VMA can't have
  PMDs, so that disabling THP after a PMD was mapped no longer has
  vmf_insert_pfn() walk into that PMD (Sashiko review).
- 3/3: Give each huge page its own data pattern, skip the alignment
  check for 32-bit tasks and read the inherited mapping in the forked
  child (Sashiko review).

A fault racing with prctl(PR_SET_THP_DISABLE) can still see a PMD
installed by a concurrent fault. Lorenzo's series in mm/core fixes this
in the core mm for all PFN maps with ->huge_fault() [2].

[2] https://lore.kernel.org/r/20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org

v1: https://lore.kernel.org/r/20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev

---
Qiliang Yuan (3):
      dma-buf: align large mappings to PMD boundaries
      udmabuf: map huge page backed ranges with PMDs
      selftests/udmabuf: test mapping a huge page backed udmabuf

 drivers/dma-buf/dma-buf.c                         |  1 +
 drivers/dma-buf/udmabuf.c                         | 85 +++++++++++++++++++-
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 97 ++++++++++++++++++++++-
 3 files changed, 178 insertions(+), 5 deletions(-)
---
base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
change-id: 20261121-feat-udmabuf-huge-pfnmap-3258272d077e

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

