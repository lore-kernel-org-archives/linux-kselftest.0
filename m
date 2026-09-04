Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F216456E0F
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516643; cv=none; b=lC1ouCGrX5ku4pA59uFiEvwxD0df3YZsSWKc29lXKuAnEXGizcbkLguSECjXYwd/hpUcB32+qEBKklOZakBS9ClkJU7df3kq2zQTS3gDy3JNNT7HQYq9h33dO5BfCmScoljSsMVOlNHBoqPwhDQfgez1UjlGqEwpk7UV0geVSoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516643; c=relaxed/simple;
	bh=9aOZu5joPDLJyi4gz7dO0f9aMIY13LvVV/UJCIG+uIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLUfFnCgBxKj5JgpYxecANz3uU2EOxxQUqShDtHntP5R+o3SSn5lU5tZQXpipo0826dzoOZ4yXYehUCkCOytJpUqkYlkhhNtqiXcKQXOvsEyXZr6PnVRKAF/IMARHmnvZ7V3d/S6EQ+Dy5jkH4/Fck42ugIEIbVew1k+FQVu6JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OMDA5LLr; arc=none smtp.client-ip=91.218.175.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OMDA5LLr"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9aOZu5joPDLJyi4gz7dO0f9aMIY13LvVV/UJCIG+uIA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788516633; v=1; x=1789121433;
 b=OMDA5LLrG8KDrfPVcchlsXbhmMDk865MrwFysRUs9ECTzubH+1uug4zwb1SxLQgRgJp9sDPU
 pfj7iDyCFWimdOIUFY3t2hkpZQ+W6CkKvuoIsdKvaRe8pZJdifYCaEboSCRwYEXnZxlVV+TDQUq
 IZXhR/Swxia4qtJDty0ZJ7oE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 94f18b2629cbbf22;
	Fri, 04 Sep 2026 10:10:33 +0000
X-Mizu-Trace-ID: 94f18b2629cbbf22
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	chenhuacai@kernel.org,
	ardb@kernel.org,
	shuah@kernel.org
Cc: ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v5 3/5] liveupdate: kho_block: include linux/mm.h for virt/phys translation
Date: Fri,  4 Sep 2026 18:08:50 +0800
Message-ID: <20260904100852.26006-4-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904100852.26006-1-dongtai.guo@linux.dev>
References: <20260904100852.26006-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Guo <guodongtai@kylinos.cn>

kho_block.c calls virt_to_phys() and phys_to_virt(). On LoongArch with
CONFIG_KFENCE=y, these macros (in arch/loongarch/include/asm/io.h) expand
to offset_in_page() and page_address(), both declared in <linux/mm.h>.

Since kho_block.c does not include <linux/mm.h>, the translation unit
fails to build with CONFIG_KFENCE=y:

  asm/io.h: error: implicit declaration of function 'offset_in_page'
  asm/io.h: error: implicit declaration of function 'page_address'

Add the missing include to fix these build errors.

This is the same root cause as the luo_session.c build fix previously
acked by Mike Rapoport [1]; the virt_to_phys()/phys_to_virt() calls have
since been refactored from luo_session.c into kho_block.c, so the fix
moves with it.

[1] https://lore.kernel.org/r/ai5nYlbERQBXRHSp@kernel.org/

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 kernel/liveupdate/kho_block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..0d56891b2f4c 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -25,6 +25,7 @@
 #include <linux/kho/abi/block.h>
 #include <linux/kho_block.h>
 #include <linux/slab.h>
+#include <linux/mm.h>
 
 /*
  * Safeguard limit for the number of serialization blocks. This is used to
-- 
2.53.0

