Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749789;
	b=Sfk/B/4vetuis+D/MSPCilCuPZoiecuJoRA+2kvZ6Sow+NRPRcdWQpZH/yBP4Ttes4T0
	 1M3FKz+ofxjQhKqqXzWNGK34kwm5YYLSyxGc4j8ZhxAr67I6VRE7Vivz7RgRF6BTo7Xgx
	 iuA8j4fQtzznDdZE8g7dIaYsLQQmaK31ocXU9JyZPr0lRzXjYvcm9QUdhfq+wHo46HcPz
	 Xz9JBUQLy5++WGzg5f8kKwRSwphrXfD5ZwqXVdP/PvQF7I+lgDHyCR8F/GZUoV0O5TaAt
	 l3Spm3AbA3FK9zlDQdfkN8Vb1+MT7/xWakIpbUVNxaXwXMyv2jFYW/bT2jI4LkJrqZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=skeWlY9qqzvD2S0y6NSVBgm7gug5B6mxGigPdEgMeRg=;
	b=KrHjVncmi4MjAIBnbHTTGZ7CdtCvC4z6p1kLAtotLxMsL2MeFXSpBNKME6l6QdLlkZAg
	 CBLmDzXMS60TnuTEDMiu9Xmjkskc1Wp4LmXHk6wHYu6mbtlfVYi9XJf7PdKmUl4UInBFi
	 twfeYm6Kpdmyqwo6LKIiMrOD3eZC1PF3VaU96ZEpHnzXv0YboRLGTec34CRwjuOd+gcMS
	 Q2qqmVCxmbHf2KzfJ2h2jeOCI/y8TQ8gk3qapTT72BfxncKCU2bydmpJW5dhrcWwDt01c
	 ThtK7V0vclLugR51JKhjfP3anGuWm+CFJ+6QwARPwGK03BP4yyXQLK/oRP0bDsrVG9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhCyEaNC;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4518606A329
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 03:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4518606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhCyEaNC
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3ada81853so8866750c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 19:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795749788; x=1796354588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skeWlY9qqzvD2S0y6NSVBgm7gug5B6mxGigPdEgMeRg=;
        b=WhCyEaNCh/5h4fFok113/zslMkpXx1htd+MkLdA2Uz8QdeMa4BsIlCZDRLNxcl6PyG
         VKbhgjrOMSbNbPa1yaNgIrP0ACv+Bt6ooLiBcY3tm4ZmLfMLw9oMT7yAcaqOeStaJCpQ
         vB9kdk9TKhWebYS8D8GaXjl/ZKb7VWHeW3ygrRkC6+uYf7FxPjRF//q33qdZw8VHoDhV
         7Nm76mKgGFHkJ7VPOLgEsrn88IVUuB1HZIKB9aP50TKxeLrF+5kSb1VSmG9Xyo7ICJ76
         jNpDrSrWDoJwkIrSS3PhIyURrpqy+kCh0/d427QkO4Xh5Lzd66RUe5YYXvvvj+yar4j+
         QBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749788; x=1796354588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skeWlY9qqzvD2S0y6NSVBgm7gug5B6mxGigPdEgMeRg=;
        b=tbiy1SQysDncvsLiW2p0X8gaShb+X+rukmxRGm0RJ8pZ0/6AVw73isLj6xqjruHm4x
         EI3d0EKvjephirURWBxC8D8xipgD4zdh19/NfbFwf3VFtlD/5TnVuHKTfiZ3cxA/+B+E
         YbKD4EM7gfM+MmtR2gMnUhrftfLMFvwg+VhRReDVz7MGPlWD6XFtHtobuyMKDb55plJt
         uKXEho3e6xrQsskFYJD6yPIiMQn1hCrV7Edd1E+SHusVKquJ78tK6Xv77pIBB6Kc9NkI
         XGIyV3dljwQLQRjtTQ/PBRN3ef/3akvyU4ECxgH61UBB9Sgg5KkmzTcitAmbbb5lw0m/
         +poQ==
X-Forwarded-Encrypted: i=1; AL+hErHgpvXZqq3yRDfwOCoL+t7wALgsiYt82pWmIxzWaWADwo80PE965lBP368H9HcRZjtJGCw2DKejDZ/m/XDxdb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uiGRx7BLQb7DFVOYY+DON/3JGlc6fp1MLjrwySpaNmpI24ZzY
	d1OD+SKZ1EkSRjO89nyMyzCKTy84H99g3cOXatZXhfl4Nyn48rAE+37n
X-Gm-Gg: AZFdTZchNBD/dN6qnSW28p+TysQXXAJPyWOC8c8MsPWEQCjvagqMwt9tFca9Yihjeqj
	jGx4gvslx9MqUyvJXIQjysMf+HrZTNFiVu9rU4SR6P69FP6nutnk15Zc4TWljIDvqAAOvq6cJnp
	MHTV0U3dQ+xIwbFTAGIpdRco7CW44tpaeWzm6KVSO75dU7x9E8PzMOkJQ45j5MxXPY9K7PsJ+fo
	pKi1mYcV+RWX3vwjcatAdGRnJww5ek7+6+OttiUMgGQMc6pxyjtBMR8jO2TXT0R3tAXKv9yCKbj
	K1UdWdhEs4nrCCXlmp6E35cvU8zVGOnx/zxyPA5YeSdIv1hDLmq57T/oGzczj5Rot8889ZsHLWs
	BfMfDTdSAc7fI08aYZFlL5f3gkx9rDzZd/WjcAfiqy4BFdMBZ1oIfWpB3/C/RZR1bgblyJnGjXf
	G0u3/7PVnboxKkMGxsMuNl/PpKn2hrpoO87lCX2BsntuDCmjcrHOnf4WQjfIPoYd7yLtigMCNVT
	DlFLvwxW6VHNRh7wgfREXlm15eF68jV4+U84O8aOJ8cN+CBBURR8dQQ/sxrRHo90UXZRn1lKy3+
	17E0k5+XZRJKy36n9Pl5dnxSlUQhIGm6PAu5aRG1DolGUAI5oDCMUoOhhV/lWJ3yoSdBtoNz0W2
	sIA/FXdeGVEzXDweEvQwCvVHJpkAzXgvkLHvN6wCKa/uh6LUOFJ33wCTUTQN9i1SCgbNaPCfgSg
	==
X-Received: by 2002:a05:693c:65ca:b0:386:b826:407 with SMTP id 5a478bee46e88-386b826061cmr13286774eec.20.1795749787617;
        Thu, 26 Nov 2026 19:23:07 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm81845568eec.10.2026.11.26.19.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:23:07 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v10 2/2] selftests: net: test joining genetlink groups no family owns
Date: Fri, 27 Nov 2026 03:22:46 +0000
Message-Id: <20261127032246.2886407-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
References: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that a Generic Netlink group ID no family owns cannot be joined:

- setsockopt(NETLINK_ADD_MEMBERSHIP) on a free ID fails with ENOENT,
  and still works on an owned group.
- bind() with a mask of free IDs succeeds and joins nothing. With an
  owned group in the mask, it joins only that group.
- A socket bound to the free IDs is not a member of the NET_DM groups
  after drop_monitor is loaded. The test unloads drop_monitor again
  after it loaded it. Skipped when NET_DM is already registered or
  drop_monitor is not available.

The free IDs are found with a family dump, which only lists the families
of the current network namespace, so these checks are skipped outside
the initial one. It is found with its fixed nsfs inode number, which
also works in a container with its own PID namespace. Kernels before
v6.17 do not have that number, so the checks are skipped there too.

Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 138 +++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index baea3e7f0f8f..875ce0443814 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -74,6 +74,7 @@ TEST_PROGS := \
 	netns-name.sh \
 	netns-sysctl.sh \
 	nk_qlease.py \
+	nl_genl_mcast.py \
 	nl_netdev.py \
 	nl_nlctrl.py \
 	nsh_gso.sh \
diff --git a/tools/testing/selftests/net/nl_genl_mcast.py b/tools/testing/selftests/net/nl_genl_mcast.py
new file mode 100755
index 000000000000..32b4951f8816
--- /dev/null
+++ b/tools/testing/selftests/net/nl_genl_mcast.py
@@ -0,0 +1,138 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Tests for joining Generic Netlink multicast groups that no family owns.
+"""
+
+import os
+import socket
+import struct
+
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_raises
+from lib.py import KsftSkipEx, NlctrlFamily, NlError, cmd
+
+NETLINK_GENERIC = 16
+SOL_NETLINK = 270
+NETLINK_ADD_MEMBERSHIP = 1
+NETLINK_LIST_MEMBERSHIPS = 9
+# include/uapi/linux/nsfs.h
+NET_NS_INIT_INO = 0xEFFFFFF9
+
+
+def _groups(fam):
+    """Return the multicast groups of a family as {name: id}."""
+    return {g['name']: g['id']
+            for grp in fam.get('mcast-groups', []) for g in grp.values()}
+
+
+def _free_ids(ctrl):
+    """Return the IDs in 1..32 that no family owns."""
+    # Outside init_net, the dump skips the families that are not netnsok,
+    # but their groups are still owned.
+    if os.stat('/proc/self/ns/net').st_ino != NET_NS_INIT_INO:
+        raise KsftSkipEx("not in the initial network namespace, "
+                         "or the kernel is older than v6.17")
+
+    owned = set()
+    for fam in ctrl.getfamily({}, dump=True):
+        owned.update(_groups(fam).values())
+    free = [gid for gid in range(1, 33) if gid not in owned]
+    if not free:
+        raise KsftSkipEx("no free group ID in 1..32")
+    return free
+
+
+def _sock():
+    return socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, NETLINK_GENERIC)
+
+
+def _members(sk):
+    # The returned length can be larger than what the kernel copied.
+    buf = sk.getsockopt(SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 64)[:64]
+    # An array of u32 in host byte order
+    words = struct.unpack(f'={len(buf) // 4}I', buf)
+    return sum(w << (32 * i) for i, w in enumerate(words))
+
+
+def _bit(gid):
+    return 1 << (gid - 1)
+
+
+def _notify_id(ctrl):
+    return _groups(ctrl.getfamily({'family-name': 'nlctrl'}))['notify']
+
+
+def join_free(ctrl) -> None:
+    """setsockopt() on an ID no family owns fails with ENOENT."""
+    with _sock() as sk:
+        sk.bind((0, 0))
+        for gid in _free_ids(ctrl):
+            # ENOENT
+            with ksft_raises(FileNotFoundError):
+                sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, gid)
+
+        notify = _notify_id(ctrl)
+        sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, notify)
+        ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_mask(ctrl) -> None:
+    """bind() skips the IDs no family owns and joins the others."""
+    free = sum(_bit(gid) for gid in _free_ids(ctrl))
+    notify = _notify_id(ctrl)
+
+    with _sock() as sk:
+        sk.bind((0, free))
+        ksft_eq(_members(sk), 0)
+
+    with _sock() as sk:
+        sk.bind((0, free | _bit(notify)))
+        ksft_eq(_members(sk), _bit(notify))
+
+
+def _unload_drop_monitor():
+    """Unload drop_monitor, so that the next run can load it again."""
+    try:
+        cmd("modprobe -q -r drop_monitor", fail=False)
+    except OSError:
+        # No modprobe in PATH
+        pass
+
+
+def bind_before_family(ctrl) -> None:
+    """A free ID joined with bind() stays unjoined when a family takes it."""
+    names = [fam['family-name'] for fam in ctrl.getfamily({}, dump=True)]
+    if 'NET_DM' in names:
+        raise KsftSkipEx("NET_DM is already registered")
+
+    free = _free_ids(ctrl)
+    with _sock() as sk:
+        sk.bind((0, sum(_bit(gid) for gid in free)))
+
+        # Looking up the family loads drop_monitor.
+        try:
+            ids = _groups(ctrl.getfamily({'family-name': 'NET_DM'}))
+        except NlError as e:
+            raise KsftSkipEx("drop_monitor is not available") from e
+
+        try:
+            if not any(gid in free for gid in ids.values()):
+                raise KsftSkipEx("NET_DM got no group ID that was free")
+
+            for name, gid in ids.items():
+                ksft_eq(_members(sk) & _bit(gid), 0,
+                        comment=f"member of NET_DM {name}")
+        finally:
+            _unload_drop_monitor()
+
+
+def main() -> None:
+    """ Ksft boiler plate main """
+    ctrl = NlctrlFamily()
+    ksft_run([join_free, bind_mask, bind_before_family], args=(ctrl, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.25.1

