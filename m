Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0480521771C;
	Sat,  7 Feb 2026 00:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770424520; cv=none; b=qm5Rt6y04JqEhLUZvbNQXXGJZ2GHDJbEwfsMlgQiX/cXepPOLQ04ju6MmlRX4+wUl+cNNCRNWi5B6ipefl4LRKM3+j5ZTUtgKqCUPnXJ9LvyOaojDscHtqI0eeUj5hxRc9NqptRU8Jep+/MBbWDP0S9AAaUkYi+OilSO/3CXuqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770424520; c=relaxed/simple;
	bh=lDCtA2V5X9zwUYPEdtrbrDq5S7xZR2bB3gOjl726bQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CajfMXYcYWfjRq07pfqc6a7+5Wu049s5agZkuXkj0+2479VvwsC6E3aQ00rb51dKTvxtibEHNMuiHzKtlot0tDPjuwytC5JwR6xbZ9hV6lj6dVfYhHPr7FImOP265sRZagj4DF9hZOprW//ga6/+r0ZxeYXkNE962MDJNE7ZPdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKAU41te; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKAU41te"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A1BC19425;
	Sat,  7 Feb 2026 00:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770424519;
	bh=lDCtA2V5X9zwUYPEdtrbrDq5S7xZR2bB3gOjl726bQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fKAU41tezoJ97EQwGQ4jzEQ0z2sG7f9Zttzqx03sgJ4pTv/haIy8OKO7oQ23sf1zf
	 zc5MSTMdfUN+Sc1qYuCVw9HAJ7mfwxsBaMqvoG6R9SvMQibUFMARF9qqDGPfzdiAY7
	 BpBrv8r24mGFNDtWU8NIP59dNy1J9EuObXZTKEu5GI4mTcIyhdsqLms7RSfKjf/GOy
	 RlFaiig/hMnitXwfbNYGNK7Gm4QXWnd5lkkpiDX5O9Nb2h5Fn3Zg6LvZjo6ERXlidt
	 kVHDysT2qTGUOlidfAwvkwyHXPRDRtn3/oq1ovkKSAKshhXarYwWF7QNVX6nxG9zvX
	 KHfNAhLkJi0rQ==
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
Subject: [PATCH net-next v2 5/9] selftests: drv-net: give HW stats sync time extra 25% of margin
Date: Fri,  6 Feb 2026 16:35:05 -0800
Message-ID: <20260207003509.3927744-6-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207003509.3927744-1-kuba@kernel.org>
References: <20260207003509.3927744-1-kuba@kernel.org>
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

