Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392781A275;
	Sat,  8 Aug 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207727; cv=none; b=Cz1g9/Xjw5/4paIdJnj15uYAKavMlpxoLTy3DLntHRoDE9B8HynmjvV9EwyMUwmmAU47XACm3zwI7dKE53T7b/yBLcYmt1PTVh2I2OfFgm9DCEKBLDOpt+q1DzcAV2t7ajrdioL9HV9Y74pwYOOW7ksc0iIOX7bk+0PCULgcAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207727; c=relaxed/simple;
	bh=Hk5Sgg2AN48oJ5CdxBRQ9xQyqsZkqFERBkxcRQ5KZ2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uH2dFIX9QfGnM83fxZ6J/Co70UFJGkCN1/QXSdlwY53IWRbdPH9lt01axA3Tb5Z4mEKUA0bsAwrg0j+bJERemaFc0LqCmDZQKBlq3Sr1HkKzHYXPnbgqU5XLSgjTuC5d9xsiaskuFfbMM0or8gNp1VOF/AzHq+8Xd5gn/rIVMrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5znJt7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5znJt7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7701F000E9;
	Sat,  8 Aug 2026 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786207725;
	bh=AABEQhYN5R63D94gYBaNDzinugchf9iwm2ExPYiPQx0=;
	h=From:To:Cc:Subject:Date;
	b=X5znJt7ma9yVa5qOMflszUA9RMEyQ+MslPW0WNsAtyjwFB3+ka5Fq/RxvPj+SOgYK
	 PKIyj6gWCzpezpALTNbdJLyA287JcvvibYTaeZYCxBB758sFAetxMl0NsQLPJ1xMR2
	 gjg+5ctdSQXUxxVzsX1oZl0+XE0rp2/TDBnbv1eaEyBAe5xi43EKmliIbMY9npBpEk
	 16hWz5SvTcS1O/uu1LZTWw5wyTl0XOMaYCRg6EfLAKuXlBpr8h1Urid0dR4Ja42GwO
	 hwvDrx3zxNJUArDFREgx3uqjdfSZsSK6vKyVInYi4tRREixTT+C9RbDCyEKyUheIaG
	 CjG9UKo4qZWwQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	danieller@nvidia.com,
	petrm@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: hide the devlink port_split test
Date: Sat,  8 Aug 2026 09:48:43 -0700
Message-ID: <20260808164843.2475226-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devlink port_split test has limited applicability.
NICs (as opposed to switches) require at least a re-probe
to apply the split configuration.

On top of that the test is not compatible with our driver env,
it just splits all ports on the system, not only what NETIF
points at.

Long term we may want to add some indication in devlink whether
the port splitting is runtime (cmode of sorts), and fix the
test to follow driver env. But since no (known) NIC driver can
support runtime anyway let's just hide the test from the selftest
framework by moving it to extra files.

Having this test randomly break unrelated NICs within the DUT
makes people implement allow-lists for ksft, which then means
their setups don't run new tests.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: danieller@nvidia.com
CC: petrm@nvidia.com
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/hw/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 234db5c2c90c..ab13f58d703e 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -19,7 +19,6 @@ TEST_GEN_FILES := \
 
 TEST_PROGS = \
 	csum.py \
-	devlink_port_split.py \
 	devlink_rate_cross_esw.py \
 	devlink_rate_tc_bw.py \
 	devmem.py \
@@ -55,6 +54,7 @@ TEST_PROGS = \
 	#
 
 TEST_FILES := \
+	devlink_port_split.py \
 	devmem_lib.py \
 	ethtool_lib.sh \
 	#
-- 
2.55.0

