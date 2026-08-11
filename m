Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752601F12FB;
	Tue, 11 Aug 2026 00:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409209; cv=none; b=uolh11//Jcj+fBkn4jhUWMsKUJKSqlz+84Gor/2sz0LxmyL4zdUy/KGZDQY6EBpo5JIeYEuP3I4+1GCg3qND78rQlF4zRL8z7LL+MTCQUHhbA/3pLeWaaS3tku2E4DTQGcVPIWjItIfoGhn2sQR54gGBrNduLhTjYh2x+wRrp+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409209; c=relaxed/simple;
	bh=TdbAYwImypxnphYGIRFHvgfYIaZVDjOlu+3E8FqPa0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bvvPj6A8b4y74iNeBWNJDYBi/rBQj0un00lSnuuvjt2CtVwuakNiLZyGLfzMB4cqD99V22LTxINN/7uIDwkWQLZsGfkA+nqYSuVrZIcZ+VjahwLyANgH+A+MMN8cSRUKlG6rVw20dExBBFSZv4CPMOquaLCmbkKrnCdx2lTcvfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFjI6lS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFjI6lS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA27A1F000E9;
	Tue, 11 Aug 2026 00:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786409208;
	bh=0C6wnVcLsZr9CuU/8FjVtnOu4RPEnRWbc5uFWvIj8vw=;
	h=From:To:Cc:Subject:Date;
	b=MFjI6lS1+jrkDand1Diqp1NizYK+2haSsCQZjibRYynxVQtuJ9gNIauuZr3uEuodZ
	 b6f1+CyjcgL6h1ovEsJHgbmY31awbkZBA+otnXj7AMtY/BYslaY/l8mqVILlPc7eTz
	 X4yGiCLJ0ehRm5SGobne6cisBCZA31B0lL+UIORv6eH+90TuZIufzDSuRXsZeMB9nT
	 mGOyqUz9VJu9NmC5Lb1JV2Fgr2Rehnke3xVKJgzCIYIWNNjE53qwumPSdunJS6MrZc
	 Qfv1ipvRvcXjF2wVvrf+d280kRZurF08OAbBNWx7B9lxZfeY5xl9F7iFzoI44qXTZs
	 IfK13+DA0A+qQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Petr Machata <petrm@nvidia.com>,
	danieller@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2] selftests: drv-net: hide the devlink port_split test
Date: Mon, 10 Aug 2026 17:46:45 -0700
Message-ID: <20260811004645.1072124-1-kuba@kernel.org>
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
their setups don't run new tests. It's very useful during test
review to see whether the test works across all the runners.

Reviewed-by: Petr Machata <petrm@nvidia.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - use TEST_PROGS_EXTENDED instead of TEST_FILES
v1: https://lore.kernel.org/20260808164843.2475226-1-kuba@kernel.org

CC: danieller@nvidia.com
CC: petrm@nvidia.com
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/hw/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 234db5c2c90c..78bb0169350b 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -19,7 +19,6 @@ TEST_GEN_FILES := \
 
 TEST_PROGS = \
 	csum.py \
-	devlink_port_split.py \
 	devlink_rate_cross_esw.py \
 	devlink_rate_tc_bw.py \
 	devmem.py \
@@ -54,6 +53,10 @@ TEST_PROGS = \
 	xsk_reconfig.py \
 	#
 
+TEST_PROGS_EXTENDED := \
+	devlink_port_split.py \
+# end of TEST_PROGS_EXTENDED
+
 TEST_FILES := \
 	devmem_lib.py \
 	ethtool_lib.sh \
-- 
2.55.0

