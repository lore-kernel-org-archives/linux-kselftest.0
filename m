Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391033FE1F;
	Wed, 11 Feb 2026 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792282; cv=none; b=eve+my1Njgonsciest2H/oI77kw5HBhZYBao5d7QiCaxio8lXV6+Rc8NhJ26VLwQk4QXk+EaMHgQSpPCwu4hT0ru1dXMm4EBelZu0WpsSZb3PZl7V1ranQrFbA9f4k0mKwM+CrNeusKDjkzmGvmWZz81xF467BbaYi+Q3Be0/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792282; c=relaxed/simple;
	bh=Sr7LnPhrJfk31UhkbQ1p1h03LPIJ4ccMUcDAXxi72CQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mJTqDHhy9fNdbxvbqS1vMO9JzMQwh6gPdTcOQf2RaA0PI5uc7vMkkD3OXoJN1tG2qNANSIlLlZ+d/OwlZ9giSbAh4stV85ymsj2Phm+hHAnUBMcGktm84/FNgySkvUAFYAl/EM3Bu4ra6NtEb5RzS9tjJ3OiZd+knZjuBlPrsGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAntwpEJYxpyf0KCA--.7450S2;
	Wed, 11 Feb 2026 14:44:20 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: akpm@linux-foundation.org,
	shuah@kernel.org
Cc: linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] selftests/mm: Remove duplicate include of unistd.h
Date: Wed, 11 Feb 2026 14:43:11 +0800
Message-Id: <20260211064311.2981726-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAntwpEJYxpyf0KCA--.7450S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw17Cw4xAFWDWFWUGrWxJFb_yoWxuFc_Aw
	42yrWkXasYyFyvyr4fX3Z8Jw4v9w48WFs3XF1Svw13tF4qqa1UGrs2y3W7Jw4Fg398u34a
	9FW0y3yfKr1UGjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnwZcUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove duplicate inclusion of unistd.h in memory-failure.c to clean up
redundant code.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 tools/testing/selftests/mm/memory-failure.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 3d9e0b9ffb41..032ed952057c 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -13,7 +13,6 @@
 #include <unistd.h>
 #include <signal.h>
 #include <setjmp.h>
-#include <unistd.h>
 #include <fcntl.h>
 #include <sys/vfs.h>
 #include <linux/magic.h>
-- 
2.25.1

