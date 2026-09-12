Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846473ACA5A;
	Sat, 12 Sep 2026 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243498; cv=none; b=sm9Cir91PwtUH5b6/mogGoxSia1EGF/lT9FE9dqsydZixnK+uo6ZY8bX/eECBEdLRiYDkYwues9AXui2d5OWEin87Pg4e7ivihtf1D0AL7cwwnpZ3Aq6bHZFRPKXIkDmZdT4N7eshFdMeq6aR9ykFW+DoVaFFKfYDkLrCUh+gCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243498; c=relaxed/simple;
	bh=k3h6FO1n9HYw+Y6AEkFZPmxFJskziuRNRtnmGLblO+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvE2bMZybKyqHKwM8LhuT23K1YXKgfMollGSiBuduMBlGc4yqh/kLHZ+p3brjGGcbcnepH7tEV4sSBbs21fWWLBE4DF3vkU1beTNZHfGM3Bfkuy8TiW2clYoebr3Konijr5QxEvMOyOl66h5E/co5q2yQJYT+vkv+cgNmPzcONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUmG1KVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUmG1KVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E181F0089D;
	Sat, 12 Sep 2026 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789243483;
	bh=XBOdZanOIk+vOpfkmdWq6xWtm+coYAU+MKJSrdKUYUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OUmG1KVT3LwKWRQHjxeqR6Ym4yd51DFpfjQtm3Lm3+Vo+7T8T1KWQ5UBU3vzKHUjo
	 w5YbfwMbbLspJdmpbUlu88/P3XeiK6T3uOIKsGmqhi5K+dw0oGRULuxad8RthwBfR2
	 elhXq/KQ9pJXNz9676fKdknzPcbIPjpO0UkLjS2AfYUV2SXkpSykCRXm4nricmwmoI
	 M9vJEVLaN2YuJsNyS3gucOxKu5AhTYhl0Z0ClUUYyV7zS9JuCv6v9dSWYsQr8ibGBs
	 j7A5o9/JuKaKnL6esOgJZ57TpmGjTlIq0jl6lEQ8Z1+lWohUYJAQ5rgLsPxSRZnzDJ
	 K6WoOJgH82Lkw==
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
Subject: [PATCH net-next 6/6] selftests: drv-net: psp: check the PSP disassociation notifications
Date: Sat, 12 Sep 2026 13:04:26 -0700
Message-ID: <20260912200426.121025-7-kuba@kernel.org>
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

The main namespace must see a change which no longer lists the device,
and the namespace which lost its last association must see the device
go away. Check that on both paths which generate the notifications,
dev-disassoc and netdevice removal, and check that a namespace which
still has another association is only told about the change.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/psp.py | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index d44d2c83473e..13ff5188cca3 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -723,6 +723,111 @@ from lib.py import ip
                 f" in {label} namespace")
 
 
+def _subscribe_mgmt(cfg):
+    """Listen on the mgmt group in the guest and in the main namespace."""
+    # Listener in the guest namespace; socket stays bound to that ns
+    with NetNSEnter(cfg.netns.name):
+        peer_pspnl = PSPFamily()
+        peer_pspnl.ntf_subscribe('mgmt')
+
+    main_pspnl = PSPFamily()
+    main_pspnl.ntf_subscribe('mgmt')
+
+    return main_pspnl, peer_pspnl
+
+
+def _get_dev_ntf(cfg, pspnl, label):
+    """Wait for the next notification about the PSP device under test."""
+    for ntf in pspnl.poll_ntf(duration=10):
+        if ntf['msg'].get('id') == cfg.psp_dev_id:
+            return ntf
+    raise KsftFailEx(f"No notification received in the {label} namespace")
+
+
+def _check_disassoc_ntf(cfg, main_pspnl, peer_pspnl, ifindex):
+    """Check the notifications for a netns losing its last association."""
+    ntf = _get_dev_ntf(cfg, main_pspnl, "main")
+    ksft_eq(ntf['name'], 'dev-change-ntf')
+    for assoc in ntf['msg'].get('assoc-list', []):
+        if assoc['nsid'] != cfg.psp_dev_peer_nsid:
+            continue
+        ksft_ne(assoc['ifindex'], ifindex,
+                "Disassociated device still listed in the notification")
+
+    # The device is gone as far as the disassociated namespace is concerned
+    ntf = _get_dev_ntf(cfg, peer_pspnl, "guest")
+    ksft_eq(ntf['name'], 'dev-del-ntf')
+    ksft_true('ifindex' not in ntf['msg'],
+              "ifindex reported to an associated namespace")
+
+
+def _dev_disassoc_notify_multi_ns_netkit(cfg):
+    """ Test the notifications dev-disassoc generates in both namespaces """
+    _init_psp_dev(cfg, True)
+    defer(delattr, cfg, 'psp_dev_id')
+    defer(delattr, cfg, 'psp_info')
+
+    cfg.pspnl.dev_assoc({'id': cfg.psp_dev_id,
+                         'ifindex': cfg.nk_guest_ifindex,
+                         'nsid': cfg.psp_dev_peer_nsid})
+    defer(_try_disassoc, cfg, cfg.psp_dev_id, cfg.nk_guest_ifindex,
+          cfg.psp_dev_peer_nsid)
+
+    main_pspnl, peer_pspnl = _subscribe_mgmt(cfg)
+
+    cfg.pspnl.dev_disassoc({'id': cfg.psp_dev_id,
+                            'ifindex': cfg.nk_guest_ifindex,
+                            'nsid': cfg.psp_dev_peer_nsid})
+
+    _check_disassoc_ntf(cfg, main_pspnl, peer_pspnl, cfg.nk_guest_ifindex)
+
+
+def _dev_disassoc_notify_one_of_two_netkit(cfg):
+    """Test the notifications with two netkits associated in one netns.
+
+    Disassociating the first netkit leaves the PSP device visible in the
+    guest namespace, generates a dev-change-ntf.
+    Disassociating the second one takes the device out of its view,
+    generates 'dev-del-ntf'.
+    """
+    _init_psp_dev(cfg, True)
+    defer(delattr, cfg, 'psp_dev_id')
+    defer(delattr, cfg, 'psp_info')
+
+    tmp_ifindex, _ = _add_netkit_guest(cfg, "tmp_nk_host", "tmp_nk_guest")
+
+    for ifindex in [cfg.nk_guest_ifindex, tmp_ifindex]:
+        cfg.pspnl.dev_assoc({'id': cfg.psp_dev_id, 'ifindex': ifindex,
+                             'nsid': cfg.psp_dev_peer_nsid})
+        defer(_try_disassoc, cfg, cfg.psp_dev_id, ifindex,
+              cfg.psp_dev_peer_nsid)
+
+    main_pspnl, peer_pspnl = _subscribe_mgmt(cfg)
+
+    # One of the two goes away, the device stays visible in the guest netns
+    cfg.pspnl.dev_disassoc({'id': cfg.psp_dev_id, 'ifindex': tmp_ifindex,
+                            'nsid': cfg.psp_dev_peer_nsid})
+
+    ntf = _get_dev_ntf(cfg, main_pspnl, "main")
+    ksft_eq(ntf['name'], 'dev-change-ntf')
+
+    ntf = _get_dev_ntf(cfg, peer_pspnl, "guest")
+    ksft_eq(ntf['name'], 'dev-change-ntf')
+    found = False
+    for assoc in ntf['msg'].get('assoc-list', []):
+        ksft_ne(assoc['ifindex'], tmp_ifindex,
+                "Disassociated device still listed in the notification")
+        found |= assoc['ifindex'] == cfg.nk_guest_ifindex
+    ksft_true(found, "Remaining association missing from the notification")
+
+    # And now the last one, the device disappears from the guest netns
+    cfg.pspnl.dev_disassoc({'id': cfg.psp_dev_id,
+                            'ifindex': cfg.nk_guest_ifindex,
+                            'nsid': cfg.psp_dev_peer_nsid})
+
+    _check_disassoc_ntf(cfg, main_pspnl, peer_pspnl, cfg.nk_guest_ifindex)
+
+
 def _psp_dev_get_check_netkit_psp_assoc(cfg):
     """ Check psp dev-get output with netkit interface associated with PSP dev """
     _assoc_nk_guest(cfg)
@@ -863,6 +968,9 @@ from lib.py import ip
     _check_assoc_list(cfg, cfg.psp_dev_id, tmp_guest_ifindex,
                       cfg.psp_dev_peer_nsid)
 
+    # Removing the netdevice is notified like a disassociation
+    main_pspnl, peer_pspnl = _subscribe_mgmt(cfg)
+
     # Delete the temporary netkit pair (deleting one end removes both)
     ip(f"link del {tmp_host_name}")
     cleanup_netkit.cancel()
@@ -873,6 +981,8 @@ from lib.py import ip
               or len(dev_info['assoc-list']) == 0,
               "assoc-list should be empty after netkit deletion")
 
+    _check_disassoc_ntf(cfg, main_pspnl, peer_pspnl, tmp_guest_ifindex)
+
 
 def _try_disassoc(cfg, psp_dev_id, ifindex, nsid=None):
     """Best-effort disassociate, ignoring errors if already removed."""
@@ -991,6 +1101,8 @@ from lib.py import ip
                         data_basic_send_netkit_psp_assoc,
                         _key_rotation_notify_multi_ns_netkit,
                         _dev_change_notify_multi_ns_netkit,
+                        _dev_disassoc_notify_multi_ns_netkit,
+                        _dev_disassoc_notify_one_of_two_netkit,
                         _psp_dev_get_check_netkit_psp_assoc,
                         _dev_assoc_no_nsid,
                         _psp_dev_assoc_cleanup_on_netkit_del,
-- 
2.55.0

