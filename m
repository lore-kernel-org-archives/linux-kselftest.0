Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490922;
	b=LwBw02R9zR+ny31hU+GwP+NIoX7bozQJXsyuSVaQccFHMg4u9S3VyTVW+y05s8Qa8yNb
	 LH0EpUtOIM1AlV52K2gD3jGjvWxI64ey4YCPHSP0dDyjcZLK7nnCk8h26AEYEJrESx9Rb
	 rbtqU3dQRg5SCiJn+SOSDaJ5dFoAJNpjXwbbUXwLKt3r6P1d/ze9v7N+7viMGflVsa2Gq
	 UCnN7WhLRBSElhzHot/6HAZdhqKMaA/KjHWjiJZtneAndiOfsgDUZEJ9PV2LaURf1nXi2
	 xDVSgoHZ9loZ7gO9ifzpO1vd2gbafuyRM4lY7JxEQQYAVXn+9d5Rx8Xxlzm2JKHbYhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490922;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=YfBBZc7pNzNbAvzjWT1h8ZQQXAFZwd0rLhVnqfxyIdI=;
	b=VRqlz5wdUbqpUSWjy58QDBE8tPPPuXID8jkPG8tD0oNawJhK85OEKEYExSntBlS2c/xg
	 w9rpr0xaowGjPL0m1skTxBXx0vd2vqZ1iJp320YixEAVbDYdhShw0RT2l5aUhDHeiRqy2
	 jq+kvn4dzH76W7ppRQD5HftcJ7/K58drKmQvSMADpK4V7gW6Wzcgxsw31reo71sebMeZX
	 fMQ30RfYklsvfXuMjhrGBPM3ZVHBxddHFkGtSyZnSyGLVLPaIagWoGPTGDbEn2+KnV1Jk
	 J0L7eZRx5dwtUAwC5KQzYDya/RYjCPCYbmQFto4egPIjjBXQ6Fdklpn9SSnyckwfzvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35CB606A321;
	Thu, 12 Nov 2026 13:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 5B28446704;
	Thu, 12 Nov 2026 14:41:59 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Thu, 12 Nov 2026 14:41:00 +0100
Subject: [PATCH net-next] ipv6: always apply all.force_forwarding to every
 interface
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
X-B4-Tracking: v=1; b=H4sIAPfB9WoC/y2NUQ6CMBBEr0L22ya2gWK8iiFkLYuuIbV2C0IId
 7eKn5OZ92YFocgkcC5WiDSx8NPnoA8FuDv6GynucgZzNFZrbRSHybY4vHGRFkMYFoW9K0+VMbW
 2NWQuROp5/jkv4CkpT3OCZm9kvD7Ipa/yv430GvNt2oFm2z5/T7/plAAAAA==
X-Change-ID: 20261112-ipv6_always_apply-afc485227167
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Gabriel Goller <g.goller@proxmox.com>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794490917824

Currently, writing to all.force_forwarding updates the interfaces
only if the value stored in all.force_forwarding changes. Setting an
interface to a different value and then writing the same value to all
leaves that interface unchanged:

  # sysctl -wq net.ipv6.conf.all.force_forwarding=1
  # sysctl -wq net.ipv6.conf.dummy1.force_forwarding=0
  # sysctl -wq net.ipv6.conf.all.force_forwarding=1
  # sysctl net.ipv6.conf.dummy1.force_forwarding
  net.ipv6.conf.dummy1.force_forwarding = 0

Apply every write to all.force_forwarding to all interfaces, even when
its stored value is unchanged, matching all.forwarding. In the example,
the final write to all now sets dummy1.force_forwarding back to 1.

Also match forwarding's locking: take RTNL for every write and compare
the old and new values under the lock, rather than returning early based
on an unlocked comparison. Send netconf notifications only for actual
value changes, including for default and per-interface writes.

Note that IPv4's forwarding does not behave like this, but we won't
change that one and align force_forward to the IPv6 forwarding.

Fixes: f24987ef6959 ("ipv6: add `force_forwarding` sysctl to enable per-interface forwarding")
Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
 Documentation/networking/ip-sysctl.rst             |  2 +
 net/ipv6/addrconf.c                                | 38 +++++++++-------
 .../testing/selftests/net/ipv6_force_forwarding.sh | 51 ++++++++++++++++++++++
 3 files changed, 75 insertions(+), 16 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 0b7bfbd98a92..3cc80d9b024b 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -2683,6 +2683,8 @@ force_forwarding - BOOLEAN
 	Enable forwarding on this interface only -- regardless of the setting on
 	``conf/all/forwarding``. When setting ``conf.all.forwarding`` to 0,
 	the ``force_forwarding`` flag will be reset on all interfaces.
+	Writing to ``conf/all/force_forwarding`` applies the value to all
+	interfaces, even if the value did not change.
 
 fwmark_reflect - BOOLEAN
 	Controls the fwmark of kernel-generated IPv6 reply packets that are not
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 6572bb22b2c0..10642c68571b 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -6841,7 +6841,7 @@ static int addrconf_sysctl_force_forwarding(const struct ctl_table *ctl, int wri
 	struct net *net = ctl->extra2;
 	int *valp = ctl->data;
 	int new_val = *valp;
-	int old_val = *valp;
+	int old_val;
 	int ret;
 
 	tmp_ctl.extra1 = SYSCTL_ZERO;
@@ -6849,35 +6849,41 @@ static int addrconf_sysctl_force_forwarding(const struct ctl_table *ctl, int wri
 	tmp_ctl.data = &new_val;
 
 	ret = proc_douintvec_minmax(&tmp_ctl, write, buffer, lenp, ppos);
+	if (ret || !write)
+		return ret;
 
-	if (write && old_val != new_val) {
-		if (!rtnl_net_trylock(net))
-			return restart_syscall();
+	if (!rtnl_net_trylock(net))
+		return restart_syscall();
 
-		WRITE_ONCE(*valp, new_val);
+	old_val = *valp;
+	WRITE_ONCE(*valp, new_val);
 
-		if (valp == &net->ipv6.devconf_dflt->force_forwarding) {
+	if (valp == &net->ipv6.devconf_dflt->force_forwarding) {
+		if (old_val != new_val)
 			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
 						     NETCONFA_FORCE_FORWARDING,
 						     NETCONFA_IFINDEX_DEFAULT,
 						     net->ipv6.devconf_dflt);
-		} else if (valp == &net->ipv6.devconf_all->force_forwarding) {
+	} else if (valp == &net->ipv6.devconf_all->force_forwarding) {
+		if (old_val != new_val)
 			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
 						     NETCONFA_FORCE_FORWARDING,
 						     NETCONFA_IFINDEX_ALL,
 						     net->ipv6.devconf_all);
 
-			addrconf_force_forward_change(net, new_val);
-		} else {
-			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
-						     NETCONFA_FORCE_FORWARDING,
-						     idev->dev->ifindex,
-						     &idev->cnf);
-		}
-		rtnl_net_unlock(net);
+		/* Like all.forwarding, apply to every interface even if
+		 * all.force_forwarding did not change.
+		 */
+		addrconf_force_forward_change(net, new_val);
+	} else if (old_val != new_val) {
+		inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
+					     NETCONFA_FORCE_FORWARDING,
+					     idev->dev->ifindex,
+					     &idev->cnf);
 	}
+	rtnl_net_unlock(net);
 
-	return ret;
+	return 0;
 }
 
 static int minus_one = -1;
diff --git a/tools/testing/selftests/net/ipv6_force_forwarding.sh b/tools/testing/selftests/net/ipv6_force_forwarding.sh
index bf0243366caa..383d1ec64f1c 100755
--- a/tools/testing/selftests/net/ipv6_force_forwarding.sh
+++ b/tools/testing/selftests/net/ipv6_force_forwarding.sh
@@ -86,12 +86,63 @@ test_force_forwarding() {
     return $ret
 }
 
+check_force_forwarding() {
+    local dev=$1
+    local expected=$2
+    local msg=$3
+    local val
+
+    val=$(ip netns exec $ns2 sysctl -n net.ipv6.conf.$dev.force_forwarding) || return 1
+    if [ "$val" = "$expected" ]; then
+        echo "PASS: $msg"
+        return 0
+    fi
+
+    echo "FAIL: $msg (got $val, expected $expected)"
+    return 1
+}
+
+test_all_force_forwarding() {
+    local ret=0
+
+    echo "TEST: all.force_forwarding"
+
+    ip netns exec $ns2 sysctl -qw net.ipv6.conf.veth21.force_forwarding=0 || return 1
+    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.force_forwarding=1 || return 1
+    check_force_forwarding veth21 1 "all.force_forwarding applied to interfaces" || ret=1
+
+    # Rewriting the same value to all re-applies it to every interface
+    ip netns exec $ns2 sysctl -qw net.ipv6.conf.veth21.force_forwarding=0 || return 1
+    check_force_forwarding veth21 0 "interface force_forwarding overridden" || return 1
+    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.force_forwarding=1 || return 1
+    check_force_forwarding veth21 1 "unchanged all.force_forwarding re-applied" || ret=1
+
+    if ip netns exec $ns1 ping -6 -c 1 -W 2 2001:db8:2::2 &>/dev/null; then
+        echo "PASS: forwarding after re-applying all.force_forwarding"
+    else
+        echo "FAIL: ping failed after re-applying all.force_forwarding"
+        ret=1
+    fi
+
+    # Disabling all.forwarding resets force_forwarding, including on all
+    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.forwarding=1 || return 1
+    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.forwarding=0 || return 1
+    check_force_forwarding all 0 "all.forwarding=0 resets all.force_forwarding" || ret=1
+    check_force_forwarding veth21 0 "all.forwarding=0 resets interface force_forwarding" || ret=1
+
+    return $ret
+}
+
 echo "IPv6 force_forwarding test"
 echo "=========================="
 
 setup_test
 test_force_forwarding
 ret=$?
+if [ $ret -eq 0 ]; then
+    test_all_force_forwarding
+    ret=$?
+fi
 
 if [ $ret -eq 0 ]; then
     echo "OK"

---
base-commit: 676f3aace662fbbc180b3898b190a372fa2a516b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261112-ipv6_always_apply-afc485227167

Best regards,
--  
Gabriel Goller <g.goller@proxmox.com>


