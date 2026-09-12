Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F1E3A7580;
	Sat, 12 Sep 2026 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243491; cv=none; b=W+ZrXEEa6LvWIeeAp/poSgup3aneV6uf0EOTICMV9gt6jkA25OdCL2cGB77dkl6lxo5SBC6JKVp3wHCAb0qs6ZAFOS9PaaAvje1pBGgD5AVC4WAU3Ad2AjXugkHd2UF2TtTw7obb66ywQwmYna+sqkTpue6TLqb8kOQo/kYHjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243491; c=relaxed/simple;
	bh=tyrhpf8ig/yC3vPM8EQZUMzf6pBLepTVwnkljBuxqXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZSQky3QmSqSc/A3X/a9XVPE4aUsoZZteeqC1daLvrlRl8KW9Kd94mplh6a+niD8F4wJKDGVLGMcm7p/PFd7cS0FGPValM8H4hi2qFe5ShA4cQ147bOpXZ4LvBhiscTbeumU4nmxl+q4romXrHkHPuJdAwzmv4P+P04IYQVd7Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVQ7NSZq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVQ7NSZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DB31F0089E;
	Sat, 12 Sep 2026 20:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789243481;
	bh=vObHyt0BxB5vN1GfH9LbGPdaVnDnDHqDH/rahNOQkno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VVQ7NSZqlcFAoRSVlD/uC3ifFpNqRI9xfQI/8NgTz944K3dN19iBNGoZxTzJlXfM7
	 oac6LN3gcdYVpCs+6Hp1cdtBXBQlcZuuLzz8YFYBGJ1H/nxqWb/CgjabstvpoeCAqb
	 gU3TBQiHR10a1MDLlDHAzwUC78cd9PtwIIyFQDeWpKAH5bQ2wV1i9IpxUn9CyNznoU
	 vRh5yXjP/bkBKkT3lL/pGM8gIpH+MPuWsG1uey/2daiG5beireKv4idLdx5V3qmAes
	 Gu0in3CZQ/se6f2X3fXTufHKuwwvkfcmldfqZwOawEoF4GGruPMBswpI4oz4khJzgF
	 OyGoAsNIEuxTA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	daniel.zahka@gmail.com,
	willemdebruijn.kernel@gmail.com,
	donald.hunter@gmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 3/6] selftests: drv-net: psp: check the ifindex an associated netns sees
Date: Sat, 12 Sep 2026 13:04:23 -0700
Message-ID: <20260912200426.121025-4-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912200426.121025-1-kuba@kernel.org>
References: <20260912200426.121025-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev-get must not report the ifindex outside of the main netns.
The dev-get checks for an associated namespace are already there,
add the "no main ifindex" assertion.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/psp.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 5e87fb50c348..43780efb84ed 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -749,6 +749,10 @@ from lib.py import ip
 
         ksft_not_none(peer_dev, "No PSP device found with by-association flag in guest netns")
 
+        # ifindex of the main netdevice means nothing in this namespace
+        ksft_true('ifindex' not in peer_dev,
+                  "ifindex reported to an associated namespace")
+
         # Verify assoc-list contains the nk_guest device
         ksft_true('assoc-list' in peer_dev and len(peer_dev['assoc-list']) > 0,
                   "Guest device should have assoc-list with local devices")
-- 
2.55.0

