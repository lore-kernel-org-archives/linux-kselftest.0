Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBED3A9605;
	Tue,  8 Sep 2026 18:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891599; cv=none; b=KXktI1MaGbOgvUGiiSsJDyNgdFeWV2b8E0j2g3D5+aKPfrHP3IeXnXLEzYgDvZLLZ0ZFXmYL7ze8UR0H/XESoLu2vgRJdV8QcB5yiD3pa0SPZeneO20qgUoMpMryaKrZDci2KhKJlILPuWVLy5XnWqyD+yHQhjp0f44M/ziqoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891599; c=relaxed/simple;
	bh=LUiVOTFg1tnrxdQsq6or85GsD7yX0CD8cnaCVNhMmjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pD1uICE7Rc3tV2Uiz9gJ3AEHpa7Y6g56RGwdvfJKc9ecAUVQ+9+h3JWxqWeQbJvbKAUDLQev+xM/L9dc41pkopcAlOjWX1btfw587H3IHHiYhT2yXDeVrmpsZgW6H+zV9pIs9PZ0A2fpsKBuocM0A/1qMusdmJ2z8yWreeAPm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcTlrPE/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcTlrPE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE481F00A3A;
	Tue,  8 Sep 2026 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788891598;
	bh=vnf1Aokfz0Pd+GQW7kvwiEALZgbY6RG7KxqSv9UBbm8=;
	h=From:To:Cc:Subject:Date;
	b=FcTlrPE/FfPlph6rgO0ddGee5oGKXZeONniWmoyDxIQdXhuZrzpbHm58pS9qkeEaV
	 Nd6ksZdtRr7SFp4zL1fFX57O1n9T9y1b64IWTAuTFYL6RoXG5TronC/A+R7kiDTcW+
	 YeVAs0ctL9rG5MJEDF9KdXxSnmH/drfyp15W6B+AIM0tmvz+YOnE5x9JuRr6zo5gLt
	 hkyK6GYRPp8EFLni+4COG+Z9743lVu+yRt3UxJV/+mSAlZWw/QXKAFPIJMYEgjZq+R
	 FsWLkhOKM2fm3zZdQPgmXPfFKMYZi0cetXfyUcFwzl+zJbgliMYQ8+pVB9Zt3KBvkd
	 PpO+e65uKmcCQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	adrian.pielech@intel.com,
	sheenamo@google.com,
	przemyslaw.kitszel@intel.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: warn if LOCAL_V6 has DAD or not kept on link down
Date: Tue,  8 Sep 2026 11:19:56 -0700
Message-ID: <20260908181956.1357684-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

napi_id.py intermittently fails to start its helper on Intel and Google
HW runners:

  CMD: /srv/netdev/drivers/net/napi_id_helper 3001::1 37569
    EXIT: 1
    STDERR: bind failed: Cannot assign requested address

Either keep_addr_on_down is not set or more likely the address is
configured without nodad. Having to make sure that all tests
always wait for DAD after impacting the link would be a whack-a-mole
so we expect the env to have nodad and keep_addr_on_down set.

Warn about both while validating the environment, and document this.
We could fail completely but most tests don't impact the link so for
quick local testing it'd be annoying to have to apply the settings.
I hope the warninging stikes the right balance.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
Adrian, Sheena, please update the setups scripts for your
systems. Looks like nodad is missing.

CC: adrian.pielech@intel.com
CC: sheenamo@google.com
CC: przemyslaw.kitszel@intel.com
CCL hramamurthy@google.com
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 .../testing/selftests/drivers/net/README.rst  |  9 +++++++++
 .../selftests/drivers/net/lib/py/env.py       | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/README.rst b/tools/testing/selftests/drivers/net/README.rst
index c6bed9a985bc..3fe49bce4f3a 100644
--- a/tools/testing/selftests/drivers/net/README.rst
+++ b/tools/testing/selftests/drivers/net/README.rst
@@ -70,6 +70,15 @@ LOCAL_V4, LOCAL_V6, REMOTE_V4, REMOTE_V6
 
 Local and remote endpoint IP addresses.
 
+Tests reconfigure the device freely, including taking the link down, and
+expect the addresses to work immediately afterwards. IPv6 needs help::
+
+  ip -6 address add 2001:db8:1::1/64 dev eth0 nodad
+  sysctl -w net.ipv6.conf.eth0.keep_addr_on_down=1
+
+Without those the address is flushed when the link goes down, or spends
+a second unusable while waiting for DAD to finish.
+
 LOCAL_PREFIX_V6
 ~~~~~~~~~~~~~~~
 
diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index 25903f580b40..6262080a8bf4 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -239,6 +239,25 @@ from . import bpftool, RtnlFamily, Netlink
         if missing:
             raise Exception("Invalid environment, missing configuration:", missing,
                             "Please see tools/testing/selftests/drivers/net/README.rst")
+        if "LOCAL_V6" in self.env:
+            self._check_v6_env()
+
+    def _check_v6_env(self):
+        """Tests bind() to LOCAL_V6 and bounce the link, it must survive both."""
+        ifname, addr = self.env["NETIF"], self.env["LOCAL_V6"]
+
+        def _keep_addr(scope):
+            with open(f"/proc/sys/net/ipv6/conf/{scope}/keep_addr_on_down",
+                      encoding="utf-8") as fp:
+                return int(fp.read())
+
+        # 'all' wins when non-zero, see addrconf_ifdown()
+        if (_keep_addr("all") or _keep_addr(ifname)) <= 0:
+            ksft_pr(f"WARN: net.ipv6.conf.{ifname}.keep_addr_on_down not set")
+
+        dev = ip(f"-6 address show dev {ifname} to {addr}", json=True)
+        if not (dev and dev[0]["addr_info"][0].get("nodad")):
+            ksft_pr(f"WARN: LOCAL_V6 {addr} not configured with nodad")
 
     def resolve_remote_ifc(self):
         v4 = v6 = None
-- 
2.55.0

