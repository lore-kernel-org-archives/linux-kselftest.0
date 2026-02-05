Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1977F33506B;
	Thu,  5 Feb 2026 22:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329245; cv=none; b=mrsKOZiK09u/EppaQO8OYp7fY2qtByXRAr1VJ4KTT6mKfi6MDvQ30i4z+ScnwP5RxfghdiknoC262ZgylW+tZS9cVIsU0h48ujqQvnywKW/o5gu3MO9SBVWlD+hFCFLQY7924BBn/pP9bVdeFgR4AvzFMw3fFUEElF4Vgp8BSgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329245; c=relaxed/simple;
	bh=DBHDHe0eez1p5U9j+/9fUn8+eThUGjBpKlxAzQaMngA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhHhBebf83YK2wyixXxsZRCRCgDF9Fu+Sf5S8rsxOlYUaDH/unkzpqKONgPczBcCF+COMju0ffINzjqjM2Hjl7GykmezwaG3c2mFdt1ZmOAMYAp0mnJt+tqzNLcSnq24OeQEbo3iRtS1rmIxuIkWRH49QHUzhcuFmy2Y1YpPdRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6p+DbVV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6p+DbVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69140C19421;
	Thu,  5 Feb 2026 22:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770329245;
	bh=DBHDHe0eez1p5U9j+/9fUn8+eThUGjBpKlxAzQaMngA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6p+DbVVMb0Pi3WPEK+btOcyevLaanfhHGcSQiADQ3+NYhdwdOMc3tuT4wRLgRCac
	 1uS1bwIiz/3NVCbPaY/jVkQpY83tymSuPiCgSyR7paqmqekhScneNkUmG9jyE4Em7j
	 VS5PHmru6BRLY/JmTT9kvEHNhKuesSIDRm4pHFs89DBKuHcoFkxnDrCZbmS5Qaauk/
	 14GjUIWXxZiKSYz/LMizrRbWVAMnfxdbphxdd2ug37aqLruyDk3c5ZTo3Oc3ba/B0J
	 cmM8emQgCfZY7HPfCR3bqMNOyskkap1jbTeKuzWyW/D200558tT2sqy3lXGyHaU5or
	 cW12xyS11X7jQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	donald.hunter@gmail.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 5/9] selftests: drv-net: give HW stats sync time extra 25% of margin
Date: Thu,  5 Feb 2026 14:05:37 -0800
Message-ID: <20260205220541.2992807-6-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205220541.2992807-1-kuba@kernel.org>
References: <20260205220541.2992807-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are transient failures for devices which update stats
periodically, especially if it's the FW DMA'ing the stats
rather than host periodic work querying the FW. Wait 25%
longer than strictly necessary.

For devices which don't report stats-block-usecs we retain
25 msec as the default wait time.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/lib/py/env.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index 41cc248ac848..39a98eb2592e 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -285,7 +285,7 @@ from .remote import Remote
                 if "Operation not supported" not in e.cmd.stderr:
                     raise
 
-            self._stats_settle_time = 0.025 + \
-                data.get('stats-block-usecs', 0) / 1000 / 1000
+            self._stats_settle_time = \
+                1.25 * data.get('stats-block-usecs', 20000) / 1000 / 1000
 
         time.sleep(self._stats_settle_time)
-- 
2.53.0

