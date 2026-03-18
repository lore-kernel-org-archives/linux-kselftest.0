Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E6C33A9FE;
	Wed, 18 Mar 2026 03:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773805116; cv=none; b=Kv683hQ0CkD49q+MOJUnqdvZoTXolKnYOrQczWQVc/7csde+G8aqF96OAvQ3hoC2wRHdeffhhdt/3AaXhu/T+Ge6ZgWKgZ7naE1vNhVdOAJfXQ5/axrW2kJVo6rjobr6oXFXXU+hRsH1ddVMP3/BPsSBg2FXkfhiRzwWJ/WioeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773805116; c=relaxed/simple;
	bh=C8i7l0DSbqE1tF4lx+Rsiu+cCgRxyKdIiVFUyi3jQDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tK+9hDtdm/Ti+svjz6ajqrhd328lKMuJDs1EZzkw+3321XEIJ4/HjAixBwyXRNy8AzdOEWTC6+3twMdoNNr7JDdh2ODLAZaozOgPt56cECQ3AToxJ8XC+E6oUIubF+lBPC6cJ3woAVlElVAenAOnuOD9tO2lxt7XarCR7ZYx5vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeiPZaTK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeiPZaTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E9FC2BCB1;
	Wed, 18 Mar 2026 03:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773805116;
	bh=C8i7l0DSbqE1tF4lx+Rsiu+cCgRxyKdIiVFUyi3jQDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AeiPZaTKNz3GI3g2SY/c/8HpK30rhZmYvY6kCuZVHTzUrs4ONZeUqPyXQP6XEAOMV
	 9oOrcVenVFXWtqEuMeaGTGPeSNIzPxHLeAzUlpAa1qAeyofbPx6kXfd2U1p+zFZ/6E
	 hjVgEqcpQ42hozRzMMn4i1EV7V5Zupy5Y+pL8y5YwcBxASOIrgL9LjSmlbx6uoT7EE
	 LH8z/KEx9lLwhsa525QF42hYlEmV59IXJjzrFz6RS3oVBIJj2o8ifBkp/v548Qx0kI
	 oLSXgrAcZc/b3tcsfcBPexCqbijgJv6T8lNQbk7fjBsrcK692l+CG/h+4yxME/wb+E
	 x33WSFVpSKO+A==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	dw@davidwei.uk,
	mst@redhat.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v4 2/6] selftests: drv-net: give HW stats sync time extra 25% of margin
Date: Tue, 17 Mar 2026 20:38:15 -0700
Message-ID: <20260318033819.1469350-3-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318033819.1469350-1-kuba@kernel.org>
References: <20260318033819.1469350-1-kuba@kernel.org>
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
25 msec as the default wait time (0.025sec == 20,000usec * 1.25).

Reviewed-by: Petr Machata <petrm@nvidia.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/lib/py/env.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index ccff345fe1c1..6a71c7e7f136 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -288,8 +288,8 @@ from . import bpftool, RtnlFamily, Netlink
                 if "Operation not supported" not in e.cmd.stderr:
                     raise
 
-            self._stats_settle_time = 0.025 + \
-                data.get('stats-block-usecs', 0) / 1000 / 1000
+            self._stats_settle_time = \
+                1.25 * data.get('stats-block-usecs', 20000) / 1000 / 1000
 
         time.sleep(self._stats_settle_time)
 
-- 
2.53.0

