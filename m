Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA77E0FF
	for <linux-kselftest@vger.kernel.org>; Sun, 10 May 2026 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778400948; cv=none; b=kX9HH6vmtcslxnXmkwRYPjbnU5L7KbXHFBjFmkwm/kqye9MYwT7NJg/UB59rmiga5WgRKD4wwODaD50SP/hSqVX6ep+C/+LUuyeSqUk8Z8NVASqH0O5u9IY/TZ8PLx2fADkuDIHMFRSuAw8yW1TY5V+hiha7hptC68/9OkghLaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778400948; c=relaxed/simple;
	bh=47ECLvxijWj14cu9w9q6cI2gRwXGFjhn8LD1qctS6Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSm8mWQrg0a7eJv9bLXt6KHujM0YfIQkN07ChxEhqUyYXdKuFYKu3phes+HceD8qfF0RgDGd+3W8loAe0gSiQpzbtpsx2PoDdmiS0bAXeTSaIhgdygHWzG8ddKw2SDZHQs/u07W7I4UX/MQhdPNlIQKYKi0Q+aIr47uVhYPWPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kh+55/LB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Twfirldi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kh+55/LB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Twfirldi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kh+55/LB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Twfirldi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kh+55/LB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Twfirldi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 56C666783D;
	Sun, 10 May 2026 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778400945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdXU1PJdl84tTK4e05BThCPGtXQET71CeSnXgeGs638=;
	b=Kh+55/LBzZrh2hTPQF2l4jwZCpxn/N+K3OhpbXcLUyP7mHvqrPsMEUOeFHiad2aSdnb4vg
	uQnq9lW0g29W2o8z6DWmz2BD5xZKi47crNh2pRLKHGazOA3sHGWYQnMe/wFSSqE76/lMGO
	Ct6pqZFaHkSEi7jO9UHq7NbZ9faBwSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778400945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdXU1PJdl84tTK4e05BThCPGtXQET71CeSnXgeGs638=;
	b=Twfirldi3B63KEHhQfFYe4gLZLTUTU6wSbI8qVyey+p5nEN0K4iPofKezp42w1Q3mqfvQ6
	f5sFInQNtYmKrGDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Kh+55/LB";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Twfirldi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778400945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdXU1PJdl84tTK4e05BThCPGtXQET71CeSnXgeGs638=;
	b=Kh+55/LBzZrh2hTPQF2l4jwZCpxn/N+K3OhpbXcLUyP7mHvqrPsMEUOeFHiad2aSdnb4vg
	uQnq9lW0g29W2o8z6DWmz2BD5xZKi47crNh2pRLKHGazOA3sHGWYQnMe/wFSSqE76/lMGO
	Ct6pqZFaHkSEi7jO9UHq7NbZ9faBwSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778400945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdXU1PJdl84tTK4e05BThCPGtXQET71CeSnXgeGs638=;
	b=Twfirldi3B63KEHhQfFYe4gLZLTUTU6wSbI8qVyey+p5nEN0K4iPofKezp42w1Q3mqfvQ6
	f5sFInQNtYmKrGDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0E91593A3;
	Sun, 10 May 2026 08:15:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CDggLLA+AGrIDgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Sun, 10 May 2026 08:15:44 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	dsahern@kernel.org,
	davem@davemloft.net,
	Fernando Fernandez Mancera <fmancera@suse.de>
Subject: [PATCH 3/3 net-next v4] selftests: net: add test for IPv4 devconf netlink notifications
Date: Sun, 10 May 2026 10:15:28 +0200
Message-ID: <20260510081528.5257-3-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510081528.5257-1-fmancera@suse.de>
References: <20260510081528.5257-1-fmancera@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim,suse.de:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 56C666783D
X-Spam-Level: 

Introduce a new test, `ipv4_devconf_notify`, to verify that the kernel
sends the appropriate netlink notifications when IPv4 devconf parameters
are modified.

Since YNL currently has a bug where it declares an array of u32 values
instead of the nested attributes expected by the kernel for devconf set
operations, a temporary hack (`patched_add_attr`) is included to
pack the netlink attributes correctly.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
v3: added this patch to the series as requested by Paolo.
v4: fixed lint warnings, some of them cannot be fixed as they are
related to the YNL hack.
---
 tools/testing/selftests/net/rtnetlink.py | 74 ++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
index e9ad5e88da97..c4136e73b6d0 100755
--- a/tools/testing/selftests/net/rtnetlink.py
+++ b/tools/testing/selftests/net/rtnetlink.py
@@ -1,17 +1,22 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
-from lib.py import ksft_exit, ksft_run, ksft_ge, RtnlAddrFamily
 import socket
+import struct
+import time
+import types
+from lib.py import bkg, ip, ksft_exit, ksft_run, ksft_ge, ksft_true
+from lib.py import NetNS, NetNSEnter, RtnlAddrFamily, RtnlFamily
 
 IPV4_ALL_HOSTS_MULTICAST = b'\xe0\x00\x00\x01'
 
-def dump_mcaddr_check(rtnl: RtnlAddrFamily) -> None:
+def dump_mcaddr_check() -> None:
     """
     Verify that at least one interface has the IPv4 all-hosts multicast address.
     At least the loopback interface should have this address.
     """
 
+    rtnl = RtnlAddrFamily()
     addresses = rtnl.getmulticast({"ifa-family": socket.AF_INET}, dump=True)
 
     all_host_multicasts = [
@@ -21,9 +26,70 @@ def dump_mcaddr_check(rtnl: RtnlAddrFamily) -> None:
     ksft_ge(len(all_host_multicasts), 1,
             "No interface found with the IPv4 all-hosts multicast address")
 
+def ipv4_devconf_notify() -> None:
+    """
+    Configure an interface and set ipv4-devconf values through netlink
+    to verify that the appropriate netlink notifications are being sent.
+    """
+
+    with NetNS() as ns:
+        with NetNSEnter(str(ns)):
+            rtnl = RtnlFamily()
+
+            ifname = "dummy1"
+            ip(f"link add name {ifname} type dummy", ns=str(ns))
+
+            link_info = ip(f"link show dev {ifname}", ns=str(ns), json=True)
+            ksft_true(bool(link_info), f"Failed to retrieve link info for {ifname}")
+            ifindex = link_info[0]["ifindex"]
+
+            # YNL do not support netconf notifications yet
+            with bkg("ip monitor", ns=str(ns)) as cmd_obj:
+                original_add_attr = rtnl._add_attr
+                time.sleep(0.5)
+
+                # Currently YNL has a bug for applying devconf values,
+                # this hack fixes it. In essence, YNL is declaring an
+                # array of u32 values, while kernel expects a nested attribute
+                # on set operation.
+                def patched_add_attr(self, space, name, value, search_attrs):
+                    if name == 'conf' and value == b"MAGIC_CONF":
+                        fwd_attr = struct.pack("=HHI", 8, 1, 1)
+                        proxy_arp_attr = struct.pack("=HHI", 8, 3, 1)
+                        rp_filter_attr = struct.pack("=HHI", 8, 8, 1)
+                        ignore_routes_attr = struct.pack("=HHI", 8, 29, 1)
+
+                        return struct.pack("=HH", 36, 0x8001) + fwd_attr \
+                                + proxy_arp_attr \
+                                + rp_filter_attr \
+                                + ignore_routes_attr
+
+                    return original_add_attr(space, name, value, search_attrs)
+
+                rtnl._add_attr = types.MethodType(patched_add_attr, rtnl)
+
+                req = {
+                    "ifi-index": ifindex,
+                    "af-spec": {
+                        "inet": {
+                            "conf": b"MAGIC_CONF"
+                        }
+                    }
+                }
+                rtnl.newlink(req)
+                time.sleep(0.5)
+
+    ksft_true(f"inet {ifname} ignore_routes_with_linkdown on" in cmd_obj.stdout,
+              f"No 'ignore_routes_with_linkdown on' notificiation found for interface {ifname}")
+    ksft_true(f"inet {ifname} rp_filter strict" in cmd_obj.stdout,
+              f"No 'rp_filter strict' notificiation found for interface {ifname}")
+    ksft_true(f"inet {ifname} proxy_neigh on" in cmd_obj.stdout,
+              f"No 'proxy_neigh on' notificiation found for interface {ifname}")
+    ksft_true(f"inet {ifname} forwarding on" in cmd_obj.stdout,
+              f"No 'forwarding on' notificiation found for interface {ifname}")
+
 def main() -> None:
-    rtnl = RtnlAddrFamily()
-    ksft_run([dump_mcaddr_check], args=(rtnl, ))
+    ksft_run([dump_mcaddr_check, ipv4_devconf_notify])
     ksft_exit()
 
 if __name__ == "__main__":
-- 
2.53.0

