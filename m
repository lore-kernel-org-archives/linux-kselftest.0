Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F6C1A681C
	for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 03:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782530591; cv=none; b=UAkaPqJ8AN7/QjRSYittZnPq9S7Y56amnyUxMoofvV2z8MitkiAuqyWGQDA0YXevApE7UG9u4AgVlet1BuR63irDtRberegT3etOXEVIOyTozZ8PXBrD3Czenppb0j9dtQcVAGJCjArNBb+vNQg2C3i5HoC5Z313FX+0QoqoXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782530591; c=relaxed/simple;
	bh=SV6EY6XCUwkEMMddd2iO2o2cI8JPUmgYKWu3JcsREQM=;
	h=Mime-Version:Cc:Message-Id:From:References:Content-Type:To:
	 Subject:Date:In-Reply-To; b=USx2+QrDqAqYf4HOSTkvjXMPAZFXlnys7MWXGNcgaauQJkV0tZmz92990dn0PRD9tEeCPCJI8E6f8Z4dBSt8aibR2XGUlsiFYbZ2iDwLSC9ybj79JbqemvvbvG4Sb9t4ZWEGroThosOAzsO4V7BKmQRRhNBOgfmVmyFo7uUvFXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a7l1dtQF; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a7l1dtQF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782530584; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=JaDRtHNksBp8HzdSWMeH/ZqouUwL9AyNRTvyVWjch9k=;
 b=a7l1dtQFFIdUJGTYAu0dWZ8R7wwFtJZLDqXJlzQJhnqoCLuBQ9X6S4bqjNXFeqB8ywvlRT
 IQEX9IfeDpRCJMVTYn35ZzuNCq4AQfW+wFB3wUetRkmZ/lvtJsu1td/SXgFrA7oVeQpKst
 mnhDTUN3e5yBQGyAIDAMFs2ZIXqooWyi4UzAnMmsdthx/T7DKx4K+T7i7FIqvhuVS9YFup
 N5RxpRVsZY8jRormmRDRUNX/flfAiN3uR/Lmiek14w61yiWuX+2s0grbPuQhs4ttrSjGf3
 E3xD2piuQIJFDkj9JVfkuY3deIvuAHw9km22Va5Vf8EvzPgsBjjcTphnNJM+GA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Cc: <andre.przywara@arm.com>, <linux-kernel@vger.kernel.org>, 
	<cristian.marussi@arm.com>, <will@kernel.org>, <catalin.marinas@arm.com>, 
	<broonie@kernel.org>, <shuah@kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, 
	<linux-kselftest@vger.kernel.org>, 
	"Yijia Wang" <wangyijia.yeah@bytedance.com>
Message-Id: <20260627032259.2086191-1-wangyijia.yeah@bytedance.com>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26a3f4216+081747+vger.kernel.org+wangyijia.yeah@bytedance.com>
From: "Yijia Wang" <wangyijia.yeah@bytedance.com>
References: <stable-reply-item017-arm64-sve-resend-20260626@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: <stable@vger.kernel.org>, <sashal@kernel.org>, 
	<gregkh@linuxfoundation.org>
Subject: [PATCH v2 5.15.y] kselftest/arm64: signal: Skip SVE signal test if not enough VLs supported
Date: Sat, 27 Jun 2026 11:22:59 +0800
In-Reply-To: <stable-reply-item017-arm64-sve-resend-20260626@kernel.org>
X-Original-From: Yijia Wang <wangyijia.yeah@bytedance.com>

[ Upstream commit 78c09c0f4df89fabdcfb3e5e53d3196cf67f64ef ]

On platform where SVE is supported but there are less than 2 VLs available
the signal SVE change test should be skipped instead of failing.

Reported-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220524103149.2802-1-cristian.marussi@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Yijia Wang <wangyijia.yeah@bytedance.com>
---
Changes in v2:
- Keep the commit message aligned with the upstream commit, as requested by
  Sasha.
- Link to v1:
  https://lore.kernel.org/r/20260626-b4-arm64-515-preview-clean-v1-1-ad19e286e322@bytedance.com

 .../arm64/signal/testcases/fake_sigreturn_sve_change_vl.c       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
index bb50b5adb..915821375 100644
--- a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
+++ b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
@@ -6,6 +6,7 @@
  * supported and is expected to segfault.
  */
 
+#include <kselftest.h>
 #include <signal.h>
 #include <ucontext.h>
 #include <sys/prctl.h>
@@ -40,6 +41,7 @@ static bool sve_get_vls(struct tdescr *td)
 	/* We need at least two VLs */
 	if (nvls < 2) {
 		fprintf(stderr, "Only %d VL supported\n", nvls);
+		td->result = KSFT_SKIP;
 		return false;
 	}
 
-- 
2.43.0
