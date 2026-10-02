Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EFE30C160;
	Fri,  2 Oct 2026 02:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909458; cv=none; b=nJXNJGOHSJyMGouEOodOg32FImMBZrStrFEW1w6KVVbSvucLns0SMPLi4brHEr92fRAkQQq7Cg1SnBKnEJfIzUUqEoYQHUYhUK9aGUU6qyT24pNdVWaqRfFWoajfyrQMSz2tn0r4GZmaUfV5jItdsKb4YiTMtmW6PbM8QfeUsuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909458; c=relaxed/simple;
	bh=+6FS9oR0kKGWZoZx6bJzlD4S3IzPtDhJPjUDsFzwNXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References:In-Reply-To; b=XkDCTQVuY/iS9QSvk3mJTNmdJ6Ze3/zCzE8skfZxiO3aGN5SQtyj4qdXcSOy/AEwECQVMBSLbcOvvdJhJVbnrHqJt1lLUY2rildhRa7exn+wvaKFvqoxt7rVpGMlVoYr8HP0NhBqLRvaq1eA341w2o8T8f/bHrPMZQySFWo07fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyP77aDC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyP77aDC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0322DC4AF14;
	Fri,  2 Oct 2026 02:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790909458;
	bh=+6FS9oR0kKGWZoZx6bJzlD4S3IzPtDhJPjUDsFzwNXI=;
	h=From:Date:Subject:To:Cc:References:In-Reply-To:Reply-To:From;
	b=lyP77aDCZDRsf51vNhBk68pMy9TmVId8gIdQgWRyIlCDYB2XXFX7dSyyPRs1vnaQK
	 K8fS3iBgCUfUrqQiQ3Nbbo6nLKNqCA7MzWLABr0AeE2oWTruyXl92ZUpHnZ5OAnYjg
	 hme50BuCqEWMo55qOlvUAg9/6sTwwCIFXGN9t3/7FyLeeKmJ6LDd0W9KbRZLd9aYpM
	 o2V7jneO86QLCGBspSeaH77suuC4nG1/myaPSbgechiWlDzw03qzD1XLky70QO1/fW
	 x8Q35o92p5tBZcfxJyt8gGpDVUu3ZtrTrBYHXzB374wbArI0nZF7MUMwms72QVMb6Z
	 ZbEOeD/hlhqMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA2FCA5FCE;
	Fri,  2 Oct 2026 02:50:57 +0000 (UTC)
From: Haseeb Malik via B4 Relay <devnull+haseebulhaq55.gmail.com@kernel.org>
Date: Thu, 01 Oct 2026 22:33:58 -0400
Subject: [PATCH net v3 2/2] selftests: net: test MACsec undefined SCI
 uniqueness
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-fix-macsec-duplicate-sci-v3-2-0f179fbe1f2d@gmail.com>
To: Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Hannes Frederic Sowa <hannes@stressinduktion.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Haseeb Malik <haseebulhaq55@gmail.com>
References: <20261001-fix-macsec-duplicate-sci-v3-1-0f179fbe1f2d@gmail.com>
In-Reply-To: <20261001-fix-macsec-duplicate-sci-v3-1-0f179fbe1f2d@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790909457; l=4909;
 i=haseebulhaq55@gmail.com; s=default; h=from:subject:message-id;
 bh=0FAExNzFPlS4rBSxGGWB8MJ7GqCJcuq2Irbp0eayKWI=;
 b=bJOiPG0vs9xPf3yDxU/38xNbCx3D4i9MbDMwxyAW9369llatbyeCykR6T0FMXF0HIKdm32luB
 O7ih59WLfSaBzcARBKqcNL3CjX8l3tj6R19Ykp6FcDF/A5ywohR+jLE
X-Developer-Key: i=haseebulhaq55@gmail.com; a=ed25519;
 pk=U/yCVc6cTsqDqxWLzvoONZ7DUA3EfRU+rfO9Xxo4p2w=
X-Endpoint-Received: by B4 Relay for haseebulhaq55@gmail.com/default with
 auth_id=1026
X-Original-From: Haseeb Malik <haseebulhaq55@gmail.com>
Reply-To: haseebulhaq55@gmail.com

From: Haseeb Malik <haseebulhaq55@gmail.com>

Exercise duplicate transmit SCI rejection using default, explicit and
all-ones SCI requests on the same lower device. Cover an all-ones request
for both the first and second device, and clean up the second device if
a kernel incorrectly accepts the duplicate.

Also verify that an all-ones SCI still resolves to the default when a
different port is already in use, and that deleting the device makes
its SCI available for reuse.

These cases cover the duplicate acceptance flagged by Sashiko during
review of an earlier MACsec initialization fix. The same tests produce
five passes and two failures before the fix, and seven passes after it.

Check local iproute2 MACsec support before running the new tests. Keep
the existing local and remote checks for callers supplying a configuration,
without requiring remote or offload support for the new local tests.

Link: https://lists.openwall.net/netdev/2026/09/16/11
Assisted-by: LLM
Signed-off-by: Haseeb Malik <haseebulhaq55@gmail.com>
---
Changes in v3:
- Split the selftests from the driver fix, as Jakub requested.
- No code changes from v2.

Changes in v2:
- Check local iproute2 MACsec support in the new tests, as Sashiko noted.

Link to v2: https://lore.kernel.org/netdev/20261001-fix-macsec-duplicate-sci-v2-1-330311abe5ec@gmail.com/

 tools/testing/selftests/drivers/net/macsec.py | 57 +++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/macsec.py b/tools/testing/selftests/drivers/net/macsec.py
index 9a83d9542e04..81003bda9b0d 100755
--- a/tools/testing/selftests/drivers/net/macsec.py
+++ b/tools/testing/selftests/drivers/net/macsec.py
@@ -34,9 +34,10 @@ def _get_features(dev):
     return ethtool(f"-k {dev}", json=True)[0]
 
 
-def _require_ip_macsec(cfg):
-    """SKIP if iproute2 on local or remote lacks 'ip macsec' support."""
-    for host in [None, cfg.remote]:
+def _require_ip_macsec(cfg=None):
+    """SKIP if iproute2 lacks MACsec locally or on cfg.remote, when given."""
+    hosts = [None, cfg.remote] if cfg is not None else [None]
+    for host in hosts:
         out = cmd("ip macsec help", fail=False, host=host)
         if "Usage" not in out.stdout + out.stderr:
             where = "remote" if host else "local"
@@ -263,6 +264,54 @@ def test_offload_state(cfg) -> None:
             "features should match first offload-on snapshot")
 
 
+@ksft_variants([
+    KsftNamedVariant("default", "", ""),
+    KsftNamedVariant("explicit", "", "sci {sci}"),
+    KsftNamedVariant("undefined", "", "sci ffffffffffffffff"),
+    KsftNamedVariant("undefined_default", "sci ffffffffffffffff", ""),
+    KsftNamedVariant("undefined_explicit", "sci ffffffffffffffff", "sci {sci}"),
+    KsftNamedVariant("undefined_twice", "sci ffffffffffffffff",
+                     "sci ffffffffffffffff"),
+])
+def test_duplicate_sci(cfg, first, second) -> None:
+    """Reject duplicate transmit SCIs, including the undefined-SCI fallback."""
+
+    _require_ip_macsec()
+    ms0 = _macsec_name(0)
+    ms1 = _macsec_name(1)
+    sci = _get_mac(cfg.ifname).replace(":", "") + "0001"
+
+    ip(f"link add link {cfg.ifname} {ms0} type macsec {first}")
+    defer(ip, f"link del {ms0}")
+    with ksft_raises(CmdExitFailure):
+        ip(f"link add link {cfg.ifname} {ms1} type macsec "
+           f"{second.format(sci=sci)}")
+        # Clean up if the kernel incorrectly accepted the duplicate.
+        defer(ip, f"link del {ms1}")
+
+
+def test_undefined_sci(cfg) -> None:
+    """An undefined SCI still selects the default when it is available."""
+
+    _require_ip_macsec()
+    ms0 = _macsec_name(0)
+    ms1 = _macsec_name(1)
+    sci = _get_mac(cfg.ifname).replace(":", "") + "0001"
+
+    # A different port on the same lower device must not block the fallback.
+    ip(f"link add link {cfg.ifname} {ms0} type macsec port 2")
+    defer(ip, f"link del {ms0}")
+    ip(f"link add link {cfg.ifname} {ms1} type macsec sci ffffffffffffffff")
+    cleanup = defer(ip, f"link del {ms1}")
+    info = ip(f"-d link show dev {ms1}", json=True)[0]
+    ksft_eq(info["linkinfo"]["info_data"]["sci"], sci)
+
+    # Deleting a device must make its SCI available again.
+    cleanup.exec()
+    ip(f"link add link {cfg.ifname} {ms1} type macsec sci ffffffffffffffff")
+    defer(ip, f"link del {ms1}")
+
+
 def _check_nsim_vid(cfg, vid, expected) -> None:
     """Checks if a VLAN is present. Only works on netdevsim."""
 
@@ -333,6 +382,8 @@ def main() -> None:
                   test_max_secy,
                   test_max_sc,
                   test_offload_state,
+                  test_duplicate_sci,
+                  test_undefined_sci,
                   test_vlan,
                   test_vlan_toggle,
                   ], args=(cfg,))

-- 
2.43.0


