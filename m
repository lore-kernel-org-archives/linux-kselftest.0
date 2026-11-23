Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449324;
	b=Nrhaa5t7nSjTT3zDtcRuLvR4OH3Ooth9HSQ/5GDiaY0E2CZJVpsTsf4mocQnDTMJlttU
	 cM6SDdLJM4ZDNA38DAglmq6QKw/CViQkhxv7KFctBxucpERRVOBp8ouvZ9XVnKh8qrPyH
	 Q/L+QNahlggOn5jbi+yW7yQuCs24sH5AKWXryfKDoPC51B0KUdw5D2tDDAwIcEVvOHEoc
	 X/ubySIDQ/LkddCBd3AMhZY320jGpizRfP4Ab9wOIFOi2RXBiNRYW6I3UkTtnRRNyyzQx
	 99Flr9IDj7XPkhuTJv5+hxdLIijWvM9nrlG/t5zuU6hruDyCBXF6HBovIN9FscTpGpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
	b=zBuVTtCbfMnzH2AngHwUWDX4trT7MwYsCkJGA5xGmTN4EW1qsGuUVMh7XWsVHihfllpf
	 5Utr3u65WYxObuxFR6zFKt+/FJTBEXtHTNIvtmJrdKvR3U4VhEc2jwktm9C1Gkm4Jhfcc
	 WzTDeGt4MdYATQrWx0IzePAlQ0e1VN2jn3eh6gN6JYVsUqbNP9dMi1VMdXVjv1nhjSD1U
	 2OvKn2dk4gGXZ52rYukNK25ZSuZpy4SCmPe0PSpNpXSveHlrsA+UoJZ+rhip+UuudW66q
	 +TzypZHJxJjZIF0CEX0g1CkHT/6xhm4CLUDocTpY7VUJF9Q568n7nqF9EiCpOlQ3n5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkIsuT2y;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1E8606A32D
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE1E8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkIsuT2y
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so4406011eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 07:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449323; x=1796054123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
        b=LkIsuT2yOR+IXm0ZQBfc2/Lid/L3sxGAL+rGlx1baRLc+zQ6e6kcSQDDdVg/533Qpa
         x3Mg+nJObzSsZ+fdtHifBu8C5Djl7eWc9dLmvzHriCa46CUE5IlgsnHOXI4DYlFbZjeM
         oZQkuz1X1QNE65NHu2OMiNlg/afD6ViJV+Rjh1eqKA+7LrWCF5kLlRr5fWBNTcyZktb4
         NuSHlnWuAlaIheWzkFhQkry1UGFoPUMGQfDbg0OdS2Y9pIWTQroWwVog47EKGuTeOmfJ
         2B9fAT1ZN42eB9NGE4H9cigA9wswXOGzkyaZAIYmsXl9LWsVf59IU/+Xb/jqrjz16Ryz
         sDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449323; x=1796054123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
        b=a6mP4nf3iAZfrsypbI4AAvFspFYFdhRW+Torz6wJc5M79GRzCuIZd9vyARkQFb0q84
         F4obCjEf7CPSapVUbEgN4Ij80sRSNkcQY0Et8u0VE7Yc6yeM0WYdzLtZPor0KleFoQ6Q
         sxFbGXxgM7T94MWsY1sWLSmevBaArY0cz8++f8ewvbtBKXOpd5Bbiq5nFN7lQNmklIWF
         nVGOaJdi7vhO/CrACA6xp/Y9WVsx8pOkq+9pW2l6+kKsLTLha888nuFYA/ZzvFznoF+F
         HfgiacXMZmnvzr452+zAlC+4P8BeOaxwL0UFp5VdbpvH2VNbDIRNSuTEyPoGxe8jdCpP
         bLPw==
X-Forwarded-Encrypted: i=1; AL+hErHQ/SrDDlvQdhufFsOYQ4UnpBfh0GHSvlRpi+7ypF9HeT8+gQxGrNxaWoUv8D7Izu5XYLZBDzx8dGefZSZvaCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mu37C/69CnB7KlX7hRZHzQqK/hTIneRX1uFKaiNTuRM0QUj7K
	vHMW4hmOAhwqoA0czvmf9zUNAwwiGa/zlUBWP0s1L7CDkkhMOqPYdMSK
X-Gm-Gg: AZFdTZeUEj0kxFNPrBxHTD/dwPVrpfa6nuS1f8A0bC8FgBbg13IeSfnlib/2HyuuSUz
	X1MUBawguEBJDejtmnVWOXLGs1EdVBGFq8eeY04HH/ZL5ybYmt7m4yDfLKuk9E3A85wBjjyuhIg
	/FmNhPLRMVJR7U+ihlTJOxwjJH/5zqV+LM5fXW3TvOAR1PmTlzmXpSO6GYMONrYufIvqqf0cJ2Q
	L3ZsKTsOsho9p5v0X9xzsKchgvnemufY2d1OxaZYx6FfIsaSfsoEOWahxnnLkhSLYY+RS83LpBL
	JMhILIAbBrenULGnKYtjlWvdrCl0K+T9UZtiMgOTygSXcyIBEBd8xKc964V/ZmZmDH/l2MZ+Zc3
	9sOhybq7qKVsSjcaRQUMsXvWBw/6t7RuTgDb/lXwgB2O87g5sbi/hPH1+1pGS6pkJ3KQuF6s6rI
	yjMQDibG1relyX/aJfqRzEmA8MhviMKUFjBAeKk4P9jw34Z8s+FceCVceb4JA/fGRcR9cptOAKB
	WmaBQy+CYzzXYKxX28VGs/kWTLev/mjqblR/BcNA7UVsaU7Sp35hYaC7uR7UN26vqQ8KHARbxuM
	o/kWZVPPiqTOrPKjjnYLL/jLFG2C1Y60n6mJdyk5oEAtNDjOXk8U9zAY+U1NzbjT/JQgRmBgUD5
	i1QfvbNWvVrh616AKaWLNa3CzSs220r+c2GF1XYJWqWXQ2HOW9uaxbZocX0zgmE/e6+tzgt+xxi
	I=
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr7555478eec.10.1795449322783;
        Mon, 23 Nov 2026 07:55:22 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm13723517eec.18.2026.11.23.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:55:22 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
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
Subject: [PATCH net v8 2/2] selftests: net: test joining genetlink groups no family owns
Date: Mon, 23 Nov 2026 15:55:03 +0000
Message-Id: <20261123155503.2497063-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
References: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
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
  after drop_monitor is loaded. Skipped when NET_DM is already
  registered or drop_monitor is not available.

The free IDs are found with a family dump, which only lists the families
of the current network namespace, so these checks are skipped outside
the initial one.

Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 127 +++++++++++++++++++
 2 files changed, 128 insertions(+)
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
index 000000000000..4e86a5556b62
--- /dev/null
+++ b/tools/testing/selftests/net/nl_genl_mcast.py
@@ -0,0 +1,127 @@
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
+from lib.py import KsftSkipEx, NlctrlFamily, NlError
+
+NETLINK_GENERIC = 16
+SOL_NETLINK = 270
+NETLINK_ADD_MEMBERSHIP = 1
+NETLINK_LIST_MEMBERSHIPS = 9
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
+    try:
+        netns = os.stat('/proc/self/ns/net').st_ino
+        init_netns = os.stat('/proc/1/ns/net').st_ino
+    except OSError as e:
+        raise KsftSkipEx("cannot check the network namespace") from e
+    if netns != init_netns:
+        raise KsftSkipEx("not in the initial network namespace")
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
+    buf = sk.getsockopt(SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 64)
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
+        if not any(gid in free for gid in ids.values()):
+            raise KsftSkipEx("NET_DM got no group ID that was free")
+
+        for name, gid in ids.items():
+            ksft_eq(_members(sk) & _bit(gid), 0,
+                    comment=f"member of NET_DM {name}")
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

