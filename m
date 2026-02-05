Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D833374F;
	Thu,  5 Feb 2026 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329244; cv=none; b=Nmp1ttMVCdt+km7M0GXROVqCEJIc3SRYj/WFUtRdA+3trEFl0bt4oRaxbd92Ls5mIW9j4ZyLOc5qOzH6G7PoOc195/FBpKTh7Hg9JB6/ReB6Dde0ecm52czBqC32/pu5sSk4TKr4AqW5iHT5rWGVbOofzOrTo/GUhfQvhcl9jSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329244; c=relaxed/simple;
	bh=dWh0mOzwbT1TuyOC+Ky71MtO6LwJ9Y1oKS/T5O9bMOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BysCQOXKzlo7JH5PqwyKacCQe2ltQgvaci1vy/NIBzrQ9H6eGPw7TvJZB+lUrneBRmchiQvJcC57Xe3w8T+3g4foiZu/n4FkKJ/Zwht5l+rNqQYAQi18sulF3DQg3DAf+ypgc9WobAfk4aSyPoWjs2I+/P9/URB7o5hy4lmzrQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkyhiyXw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkyhiyXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A986BC19424;
	Thu,  5 Feb 2026 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770329244;
	bh=dWh0mOzwbT1TuyOC+Ky71MtO6LwJ9Y1oKS/T5O9bMOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkyhiyXwhvKjb3WRseyX8fA+sJcUc/Ga2Hv72tw0lgMvSTfRPFnUW+x9e7iLpm6a2
	 KirTY9kMdBO7/OnXQYCHjXXX9RXVhKjJaoPqRMqM0Ief581GiLP4r1xQv2yeTzUfGr
	 KfbA0qfCCAH2si688TzPMsyxM23WO2k8s0osod+p8QCkePhzBYl/sxUmamWj+UfOLe
	 56PdNYSANUXqhgsuzRsYi0JsRZh/m5XbYM5DQDCQWPrMTOHgej5SVlbNv5XMBW4h6d
	 Dnmc8VlpUif+kw/BPwrOZPJLebu7buQ6VrGAD538ACwVIvQ1ngfCiexsenva9xgxlF
	 FHHVT0LHX/s6g==
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
Subject: [PATCH net-next 4/9] selftests: net: move gro to lib for HW vs SW reuse
Date: Thu,  5 Feb 2026 14:05:36 -0800
Message-ID: <20260205220541.2992807-5-kuba@kernel.org>
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

The gro.c packet sender is used for SW testing but bulk of incoming
new tests will be HW-specific. So it's better to put them under
drivers/net/hw/, to avoid tip-toeing around netdevsim. Move gro.c
to lib so we can reuse it.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/Makefile           | 1 -
 tools/testing/selftests/net/lib/Makefile               | 1 +
 tools/testing/selftests/{drivers/net => net/lib}/gro.c | 0
 tools/testing/selftests/drivers/net/.gitignore         | 1 -
 tools/testing/selftests/drivers/net/gro.py             | 2 +-
 tools/testing/selftests/net/lib/.gitignore             | 1 +
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename tools/testing/selftests/{drivers/net => net/lib}/gro.c (100%)

diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index 8154d6d429d3..7c7fa75b80c2 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -6,7 +6,6 @@ TEST_INCLUDES := $(wildcard lib/py/*.py) \
 		 ../../net/lib.sh \
 
 TEST_GEN_FILES := \
-	gro \
 	napi_id_helper \
 # end of TEST_GEN_FILES
 
diff --git a/tools/testing/selftests/net/lib/Makefile b/tools/testing/selftests/net/lib/Makefile
index 5339f56329e1..ff83603397d0 100644
--- a/tools/testing/selftests/net/lib/Makefile
+++ b/tools/testing/selftests/net/lib/Makefile
@@ -14,6 +14,7 @@ TEST_FILES := \
 TEST_GEN_FILES := \
 	$(patsubst %.c,%.o,$(wildcard *.bpf.c)) \
 	csum \
+	gro \
 	xdp_helper \
 # end of TEST_GEN_FILES
 
diff --git a/tools/testing/selftests/drivers/net/gro.c b/tools/testing/selftests/net/lib/gro.c
similarity index 100%
rename from tools/testing/selftests/drivers/net/gro.c
rename to tools/testing/selftests/net/lib/gro.c
diff --git a/tools/testing/selftests/drivers/net/.gitignore b/tools/testing/selftests/drivers/net/.gitignore
index 3633c7a3ed65..585ecb4d5dc4 100644
--- a/tools/testing/selftests/drivers/net/.gitignore
+++ b/tools/testing/selftests/drivers/net/.gitignore
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-gro
 napi_id_helper
 psp_responder
diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
index cbc1b19dbc91..2da53686354f 100755
--- a/tools/testing/selftests/drivers/net/gro.py
+++ b/tools/testing/selftests/drivers/net/gro.py
@@ -117,7 +117,7 @@ from lib.py import ksft_variants
     """ Setup hardware loopback mode for GRO testing. """
 
     if not hasattr(cfg, "bin_remote"):
-        cfg.bin_local = cfg.test_dir / "gro"
+        cfg.bin_local = cfg.net_lib_dir / "gro"
         cfg.bin_remote = cfg.remote.deploy(cfg.bin_local)
 
     if not hasattr(cfg, "feat"):
diff --git a/tools/testing/selftests/net/lib/.gitignore b/tools/testing/selftests/net/lib/.gitignore
index bbc97d6bf556..6cd2b762af5d 100644
--- a/tools/testing/selftests/net/lib/.gitignore
+++ b/tools/testing/selftests/net/lib/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 csum
+gro
 xdp_helper
-- 
2.53.0

