Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295047;
	b=0l52OC42kwi0PDYn9TYFLnnY5g5o1hNljX13UCGzN1YFjbGgpZXQOiNuqf3rJfqXgbNk
	 Pd+JhIMw6MwJNkOqIhbODQGMThffnRltoVniJXR+qggvRt7umfSH/UGOMcCX5Y3WlFmtG
	 2FoNFZPGuS1TIJdS84YoUGNhZgdTIxldpNyLj1jf+WBUc2O7xtP7AOzws7pQfCkKNZGio
	 RLc0TvvMOFuBjxvKeD1HK2LylFiYbidYfLM+pSFfCH4jdCRD3dajLK5SaC2TUpt+MpP0+
	 AKbNqnRl2aKXCXmLZ18HbAa6GzTkdQumO12OLetqXggdtCxFYjvvZILG4to+h9xP+lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295047;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZMDApzLIDOAKE5Gyc0kBJeDtiPqWtLZVQgfI5VI22BQ=;
	b=PyE/Ps7pS7tofTNt74y1LEbBnv9ue96Iwjg1l9xPt7rkEZAkXezKtq65f9+jx+5kOkM1
	 IIC/L1uMuRwUkUdngr9yIfnooa/OiUqImzrMXxqfGAeByvd7u2v/4GL2VjXwjNpBAsO/s
	 BL22c3mS8qhYamT3wB8En3Din0ukAAl70OaSpdTbmk3KBBlZw7AmVISJbcNUWbl0JGioS
	 9ZCL68FJAXGFhGccZmRLD+I9QXFrQCwh6eQNyu/iB35pzCdslxNuNMPLlPOLWnKo1bFtG
	 QfSdhAUMIBaHPv6MjyyHJl+BvVwjKRECYA7E8lcIllByniLaQpJC61mrqJexLWlj6KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DlimMrOb;
	arc=none smtp.remote-ip=91.218.175.162
Received: from mta0.migadu.com (out-162.mta0.migadu.com [91.218.175.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97E606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 17:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A97E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DlimMrOb
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LXdJ2wzcp0hoHVE9cbEq+7Hky76xZdetmi2maoCyhPM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793295045; v=1; x=1793899845;
 b=DlimMrObNqkXb5rzzvGt/o5MlLGzTCnpncP0VUWI1dg2+CfU41UO9p3lvJQnz69v18Cywvrp
 px/On5GsE4FyXiNd8EQRj6TXLEiLlr5Mtt1AVGx+tkk2prfJRp1trLFlgy55E+DuthYgyepjnDS
 Ho07kMcgRMyyjJwh4u4XbJzQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9eed6b1d4b951111;
	Thu, 29 Oct 2026 17:30:45 +0000
X-Mizu-Trace-ID: 9eed6b1d4b951111
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
Subject: [PATCH v6 3/8] kho: Include linux/mm.h in kho_block.c
Date: Fri, 30 Oct 2026 02:29:50 +0900
Message-ID: <20261029172956.20791-4-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029172956.20791-1-dongtai.guo@linux.dev>
References: <20261029172956.20791-1-dongtai.guo@linux.dev>
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

From: George Guo <guodongtai@kylinos.cn>

kho_block.c calls virt_to_phys() and phys_to_virt(). With CONFIG_KFENCE=y,
the LoongArch implementations use offset_in_page() and page_address(),
which are provided by <linux/mm.h>.

Include <linux/mm.h> explicitly to avoid implicit-declaration build
errors for these helpers.

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

