Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2489E2EB5A6;
	Sat,  8 Aug 2026 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786206863; cv=none; b=TomBpIasagr/ql2PPWJSm7h15do7hAuviu1E55dzQ9qqHZqEm8guE3QcM9BrfZZqg1jpF5gpV4L61KRmNfUnhi/SmDeuSsGP/zoVlt6lKplJCDV3e2amlOOYTrbYdO18IKlO9/1EOozKafOqdByAHSexFBRskpNG/ozZftjFeoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786206863; c=relaxed/simple;
	bh=ZB6003YcSxT2gKhoD7xlC+Sq0h/YddzeEm+oshQYXN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjRRQWe416Olng0Qtn66fhwGwoGHLBr6j2H/DXoaIF5xBVW16X2J7kiM2TMebvmbGWHOwXdGm6QEU4Plsxooc5PNlw211MFHiYuKaXpi0rRnJ0Xe8hv5VmvOP3MYD/+cnoZCHUhzXxC1T8SIqWZA+u6wcVMYdxjTI+FEdoiG8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kI2DY5jy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kI2DY5jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE0B1F000E9;
	Sat,  8 Aug 2026 16:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786206861;
	bh=BrOVGNk7Dnr4UcFv6cMbOONoijTlCTz1oYBJ05kXt8E=;
	h=From:To:Cc:Subject:Date;
	b=kI2DY5jyRu+fkj0SgrJ6Q+mf3lkE91LJ4LCdovtuFNIk01cnCPKh7yEQPw+xCmDOF
	 PukLKzgxzq5Frd2uGxdNPo0kSAyHmkTn2EM5wiYGjtIYk7uw3/8a42d88BuPKq7BgJ
	 bYN7fhKvDGgnhH/jAo1xPFb0qebuHT+LGL+p98BASWhbBviEn+asSfHs5FyQD3tlPE
	 8+2qebqI3T72S8honBmqcaruYtH70oT+n8BTZQurlwccAA9YBAG6v65AWJ6j0rAm1O
	 q5KbUpcgR6dvk8KMn7dwqukxyQrrNwRNMjfyfqa0NGbBQENqxznL9MJXx3Hm/QhWmF
	 bYkeJyMOQloLA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	andrew@lunn.ch,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: netdevsim: fix SIGPIPE flake in ethtool-coalesce
Date: Sat,  8 Aug 2026 09:34:16 -0700
Message-ID: <20260808163416.2456810-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adaptive-rx and adaptive-tx checks use 'ethtool -c | grep -q' under
'set -o pipefail'. grep -q exits as soon as it finds a match, which can
happen before ethtool finishes writing its output. When that occurs,
ethtool receives SIGPIPE causing (uninformative):

 # selftests: drivers/net/netdevsim: ethtool-coalesce.sh
 # FAILED 1/22 checks
 not ok 1 selftests: drivers/net/netdevsim: ethtool-coalesce.sh # exit=1

This happens on debug kernels in NIPA, ~4% of the time.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: andrew@lunn.ch
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 .../drivers/net/netdevsim/ethtool-coalesce.sh          | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/netdevsim/ethtool-coalesce.sh b/tools/testing/selftests/drivers/net/netdevsim/ethtool-coalesce.sh
index 9adfba8f87e6..b9fcafad4258 100755
--- a/tools/testing/selftests/drivers/net/netdevsim/ethtool-coalesce.sh
+++ b/tools/testing/selftests/drivers/net/netdevsim/ethtool-coalesce.sh
@@ -116,12 +116,14 @@ done
 
 # bool settings which ethtool displays on the same line
 ethtool -C $NSIM_NETDEV adaptive-rx on
-s=$(ethtool -c $NSIM_NETDEV | grep -q "Adaptive RX: on  TX: off")
-check $? "$s" ""
+s=$(ethtool -c $NSIM_NETDEV)
+echo "$s" | grep -q "Adaptive RX: on  TX: off"
+check $? "" ""
 
 ethtool -C $NSIM_NETDEV adaptive-tx on
-s=$(ethtool -c $NSIM_NETDEV | grep -q "Adaptive RX: on  TX: on")
-check $? "$s" ""
+s=$(ethtool -c $NSIM_NETDEV)
+echo "$s" | grep -q "Adaptive RX: on  TX: on"
+check $? "" ""
 
 if [ $num_errors -eq 0 ]; then
     echo "PASSED all $((num_passes)) checks"
-- 
2.55.0

