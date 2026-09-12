Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665033AE712;
	Sat, 12 Sep 2026 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243499; cv=none; b=ZkR1Q0Q2zMkFl5g2LgStd5meIf3/O5zezH46AU9gEhIewX/b4poq47mMmhkMcjQyHWwDWgFMVmlDPjxglf3owRLRRTcXWH+h+J7HRWnN9AMVLaHu6d5IvsarPJtS1WyZOcBCbnfBAWJ1St8D4k2qzzoRKPIASr4miG1sNwlY5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243499; c=relaxed/simple;
	bh=2ydc8rCloYZqN79aOZVPhcKUJkHjImJdM6xegt9uJ/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7moYgzlGJTiFXnJLT6pBY4SNf9wglEBddxZzKtrTtbVwHSa4RE+Bq2g2VVyKyWRIPqsU3R9yMv6zSscteanYoc31BIpZNs+aVig3RI5Z+F5+IjnoAn6Nx5aZyFLlwCUAxSXC961qXEvO8+rJC/yk3/C9kXdCVGDidGK2ErMtRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhKyinP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhKyinP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5741F0089A;
	Sat, 12 Sep 2026 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789243482;
	bh=cUEuPueZ4NpQRpxSc6BqEk1OkAFqDAIPI1Z+GgoOh1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fhKyinP0ljI5CfuDCaeytPBtqUSv7m2YTQVelG0/0sGLFP6kpgWggvXX4YEzjFCGn
	 l8jV96/kVQmoGLGF2dPYI8UU8VoulQf1UypNZWUCeGNU+clUMbH0fOs4YiCfeJfLoN
	 MmyTcr1LFElyNnBJ32NG2Ii10NbQKOMt+uEXH9rdDeWrRBVGvxY4xgfUuoWt2gP9W7
	 vfASGOCtkfH8fT9IiOnWd6aHNz0kmu9MI/9FFUpmvIHYLCeKDxjFZVYlT6fShb4RC2
	 IgJPaZxQbrdAMiHAG2t0C8bpAd7D4awV5CJZckqgIzT5FYdm5l/RasR+kTDl3w0CL+
	 jmvRsHeaHmdHg==
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
Subject: [PATCH net-next 5/6] selftests: drv-net: psp: factor out creating a netkit in the test netns
Date: Sat, 12 Sep 2026 13:04:25 -0700
Message-ID: <20260912200426.121025-6-kuba@kernel.org>
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

The netkit removal test builds a disposable netkit pair and moves its
peer into the test namespace. The next commit needs a second associated
device there, so move that to a helper. No functional change, other
than looking the new peer up among all netkit devices rather than the
two the environment created, which is what makes it reusable.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/psp.py | 60 ++++++++++++----------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 43780efb84ed..d44d2c83473e 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -798,25 +798,18 @@ from lib.py import ip
     ksft_true(not found, "Device should not be in assoc-list after disassociation")
 
 
-def _psp_dev_assoc_cleanup_on_netkit_del(cfg):
-    """Test that assoc-list is cleared when associated netkit is deleted.
+def _add_netkit_guest(cfg, host_name, guest_name):
+    """Create a netkit pair and move its peer into the test namespace.
 
-    Creates a disposable netkit pair for this test to avoid destroying
-    the shared environment.
+    Returns the peer's ifindex there and the defer() deleting the pair.
     """
-    _init_psp_dev(cfg, True)
-    defer(delattr, cfg, 'psp_dev_id')
-    defer(delattr, cfg, 'psp_info')
+    existing = {link['ifindex'] for link in ip("-d link show", json=True)
+                if link.get('linkinfo', {}).get('info_kind') == 'netkit'}
 
-    existing = {cfg.nk_host_ifindex, cfg.nk_guest_ifindex}
-
-    # Create a temporary netkit pair
-    tmp_host_name = "tmp_nk_host"
-    tmp_guest_name = "tmp_nk_guest"
     rtnl = RtnlFamily()
     rtnl.newlink(
         {
-            "ifname": tmp_host_name,
+            "ifname": host_name,
             "linkinfo": {
                 "kind": "netkit",
                 "data": {
@@ -828,25 +821,38 @@ from lib.py import ip
         },
         flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL],
     )
-    cleanup_netkit = defer(ip, f"link del {tmp_host_name}")
+    cleanup = defer(ip, f"link del {host_name}")
 
     # Find the peer by diffing against existing netkit ifindexes
     all_links = ip("-d link show", json=True)
-    tmp_peer = [link for link in all_links
-                if link.get('linkinfo', {}).get('info_kind') == 'netkit'
-                and link['ifindex'] not in existing
-                and link['ifname'] != tmp_host_name]
-    ksft_eq(len(tmp_peer), 1,
-            "Failed to find temporary netkit peer")
-    guest_name = tmp_peer[0]['ifname']
+    peer = [link for link in all_links
+            if link.get('linkinfo', {}).get('info_kind') == 'netkit'
+            and link['ifindex'] not in existing
+            and link['ifname'] != host_name]
+    ksft_eq(len(peer), 1, "Failed to find the new netkit peer")
 
     # Rename and move guest end into the test namespace
-    ip(f"link set dev {guest_name} name {tmp_guest_name}")
-    ip(f"link set dev {tmp_guest_name} netns {cfg.netns.name}")
-    tmp_guest_dev = ip(f"link show dev {tmp_guest_name}",
-                       json=True, ns=cfg.netns)[0]
-    tmp_guest_ifindex = tmp_guest_dev['ifindex']
-    ip(f"link set dev {tmp_guest_name} up", ns=cfg.netns)
+    ip(f"link set dev {peer[0]['ifname']} name {guest_name}")
+    ip(f"link set dev {guest_name} netns {cfg.netns.name}")
+    guest_dev = ip(f"link show dev {guest_name}", json=True, ns=cfg.netns)[0]
+    ip(f"link set dev {guest_name} up", ns=cfg.netns)
+
+    return guest_dev['ifindex'], cleanup
+
+
+def _psp_dev_assoc_cleanup_on_netkit_del(cfg):
+    """Test that assoc-list is cleared when associated netkit is deleted.
+
+    Creates a disposable netkit pair for this test to avoid destroying
+    the shared environment.
+    """
+    _init_psp_dev(cfg, True)
+    defer(delattr, cfg, 'psp_dev_id')
+    defer(delattr, cfg, 'psp_info')
+
+    tmp_host_name = "tmp_nk_host"
+    tmp_guest_ifindex, cleanup_netkit = _add_netkit_guest(cfg, tmp_host_name,
+                                                          "tmp_nk_guest")
 
     # Associate PSP device with the temporary guest interface
     cfg.pspnl.dev_assoc({'id': cfg.psp_dev_id,
-- 
2.55.0

