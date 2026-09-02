Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350F4A43F5
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364818; cv=none; b=Fcht/ridTW67TZzPep8uVP4u+ezPcKHGwFWM5u2zZx/6AWymy7ExfRCilJfNBRx2RL/16FXe1jSWgYmEQz5wA2LIEDEWp9HHUPL0Y3kd6k59GYQh66aw4qWTjo7NOjXAMgKI1XlfRpLqj0x66B5y6+I8jcLJQvJGO9Q5fzMfdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364818; c=relaxed/simple;
	bh=n/Zk7kfVfTs+vnFJat95rrNmdJq5Mr397u5VOT6F1zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=USZcJd4bi+G/RDBM5c8wTs+ADU2p8rramRJn7rskCG/o66IY7gn+GrJfYVe1mOw5OFer+rXfky6dALfrtKBa8WU7dKa9WoJjbL6RBOR7y2q/ZTNeB/WH8VaBYagkah0WvREkH4qER858fiS0F491mb11s70DAMdysWm74vlabJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ajou.ac.kr; spf=pass smtp.mailfrom=ajou.ac.kr; dkim=pass (1024-bit key) header.d=ajou.ac.kr header.i=@ajou.ac.kr header.b=Hn+Blfp7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ajou.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ajou.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ajou.ac.kr header.i=@ajou.ac.kr header.b="Hn+Blfp7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d710632717so12036995ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 09:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ajou.ac.kr; s=google; t=1788364814; x=1788969614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAh7tWHEmqOf5EXSkkVLuXbK+rgxGiOqwP75KDeQuy8=;
        b=Hn+Blfp7E7/kyohp9QS8m5t0sqKnXorlPELRh4SBraAegWvdKPTGH9gUCf1oGo59hW
         /6daWjLB9fGtpU27odKhFNSoDqo53A2bf9H7c7Dr8dYzI4ifQJ4ta3Dg/5bHQeKe58oa
         bHGq8CkdVvO9r1CH9fXUoFgH92E1gfQFrrNtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364814; x=1788969614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAh7tWHEmqOf5EXSkkVLuXbK+rgxGiOqwP75KDeQuy8=;
        b=T14ra24qqpu6+37p5zBPqA2kbthgLRwDOIrTbq96L4UBpGAykLr1Se0A6wHfmv33C8
         HW8x37YEXPULwWNusAO61XYkdh5QWlCuH+yEI47ZEAEi4Yd9lCQLARVNJ4H0n2Yb9tBE
         UTPlIG0rWSAjtU4koFix0deWtRamzVsjBjPKs0BrAZDvcjwMgAhRO2eyHNiOhWhZmO39
         j02PdDA489ds0Prpm6craNrjpFUD8ySekgnd0eTAgLwtMJRQQvUkPE09an8dSajJW3Yp
         7CqgDxAzw4S3q25wXuel8wAvwRZHiOH3lPwjPEGzBDdia57iXxCP8MAeMSlt5IQx/3nM
         SWlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcNpWbU1VpVTogPu8VqS4ZI3gLwh6n+uM/bFnO31cGlW6oFSf/jvKj+eXCJaMUlnLVz0EM+MMfg17CV/KFv88=@vger.kernel.org
X-Gm-Message-State: AFuF++mOsDX3nIIEUlI5wNKIzRTgnUYtltk9eOk3b942AzTk2kg/N7NA
	nCbfo2AzBs2C4A7cFFWWVECGc8spvSa+cByyLdO2I5/SaCjVLKHr9USr3uXApMyUUMA=
X-Gm-Gg: AYBFou2maYtEEGMGJwNm2Ed2P0bXaZwAaW2qYDBsYQIfwAPaV+YE8OOA7VxiXwgFHJ9
	yDnsmW24Bduip0CxJ/op3JVpDDKo5F1s1rTqKFRNeLutinnjIFOOdSC7uGJ81J52J7j3K4S0Oye
	7cOsQHs0DKEOx2x8zOYRNoxG1iFtYsgaVOiqwOrRJlBN/85HFrN6LQr3LR7sHiqYNEsSA5zKlbm
	5k0lmNBuOvGGUWtoYtd4MWSU0wPAqsx26e/GVaBgvzc7jM7g4UL+ljxsCKJwgcffgPkH0J765lW
	+5QcV6gt8p2+8++/nV+Yl4Zhga1/VRXT7a+Uzo5iLi7RC/4CyDCuzzgbA50wll6MCHncEH2qrIq
	oQruOwX7pid+M3YPAmXyD5yc2ont7aWQz+v6Wf4EbC8kXCRyHMlz1lXHdtgu6g1WEVSNCbhy2GP
	4oVGKh2AJlmyLh3l6jRVy2gPX4Lk5/YNSYhyZRNcWapXpEntLObvwywNMHEE79wB4ZfRTpXKE0f
	lbSOlzQQHzslIEkhr4HSn1djT4y27FzpO/MGB6jbig=
X-Received: by 2002:a17:902:f78c:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2daec5dfa20mr91006295ad.4.1788364813891;
        Wed, 02 Sep 2026 09:00:13 -0700 (PDT)
Received: from DESKTOP-2P4OM44.localdomain ([175.195.197.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd35dac1sm15536475ad.16.2026.09.02.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:00:13 -0700 (PDT)
From: Seungwon Bae <qotmddnjs@ajou.ac.kr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dsahern@kernel.org,
	idosch@nvidia.com,
	shuah@kernel.org
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seungwon Bae <qotmddnjs@ajou.ac.kr>
Subject: [PATCH net v3] vxlan: reject dynamic fdb entries that reference a nexthop id
Date: Thu,  3 Sep 2026 00:59:56 +0900
Message-ID: <20260902155956.296699-1-qotmddnjs@ajou.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit cited in the Fixes tag allowed VXLAN FDB entries to point to
FDB nexthops so that overlay traffic could be load balanced across
multiple VTEPs. Such entries can only be configured from user space,
cannot be learned and cannot roam. They only make sense with a user space
control plane such as E-VPN where data plane learning is disabled.

Despite that, the VXLAN driver does not currently prevent such entries
from being configured with the "dynamic" flag. The per-nexthop FDB list
is only protected by the per-device hash lock, which is not sufficient
when two VXLAN devices point to the same FDB nexthop and therefore share
the list. Aging runs in softirq context without RTNL, so an entry deleted
by one device can race with an addition or deletion from the other,
leading to list corruption:

  list_del corruption. next->prev should be ffff8881069d9548, but was
  dead000000000122. (next=ffff8881069d9448)
  WARNING: CPU: 0 PID: 90 at lib/list_debug.c:65
  __list_del_entry_valid_or_report+0x1aa/0x210
  ...
   vxlan_fdb_destroy+0x5b8/0xad0
   vxlan_cleanup+0x328/0x450
   call_timer_fn+0x2a/0x1c0
   run_timer_softirq+0x18c/0x210
  BUG: KASAN: slab-use-after-free in vxlan_fdb_destroy

Fix this by rejecting the bogus configuration of dynamic FDB entries that
point to FDB nexthops, both when created and when an existing entry is
updated. As such, the per-nexthop FDB list is only ever mutated under the
RTNL lock. Add test cases to make sure that this does not regress in the
future.

Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Seungwon Bae <qotmddnjs@ajou.ac.kr>
---
Found with AI assistance; treated as public per
Documentation/process/security-bugs.rst. A reproducer is available
privately on request.

Changes in v3:
- Reword the commit message to explain why rejecting dynamic nexthop
  FDB entries is safe (per Ido). No code change from v2.
Changes in v2:
- Reject making a nexthop fdb dynamic (on add and update) instead of
  locking nh->fdb_list; a nexthop fdb cannot roam so it must not age,
  leaving nh->fdb_list mutated under RTNL only.
- Add fib_nexthops.sh selftest coverage; add Fixes tag.
v1: https://lore.kernel.org/netdev/20260901050253.47197-1-qotmddnjs@ajou.ac.kr/
v2: https://lore.kernel.org/netdev/20260901120740.105374-1-qotmddnjs@ajou.ac.kr/
 drivers/net/vxlan/vxlan_core.c              | 11 ++++++++
 tools/testing/selftests/net/fib_nexthops.sh | 28 +++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index ac88d1c85..93bf7c535 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -996,6 +996,12 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		return -EOPNOTSUPP;
 	}
 
+	if (rcu_access_pointer(f->nh) &&
+	    !(state & (NUD_PERMANENT | NUD_NOARP))) {
+		NL_SET_ERR_MSG(extack, "Cannot make a nexthop fdb dynamic");
+		return -EOPNOTSUPP;
+	}
+
 	/* Do not allow an externally learned entry to take over an entry added
 	 * by the user.
 	 */
@@ -1257,6 +1263,11 @@ static int vxlan_fdb_add(struct ndmsg *ndm, struct nlattr *tb[],
 	if (err)
 		return err;
 
+	if (nhid && !(ndm->ndm_state & (NUD_PERMANENT | NUD_NOARP))) {
+		NL_SET_ERR_MSG(extack, "A nexthop fdb cannot be dynamic");
+		return -EINVAL;
+	}
+
 	if (vxlan->default_dst.remote_ip.sa.sa_family != ip.sa.sa_family)
 		return -EAFNOSUPPORT;
 
diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index 3d3471267..431d7bed7 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -533,6 +533,20 @@ ipv6_fdb_grp_fcnal()
 	run_cmd "$BRIDGE fdb add 02:02:00:00:00:14 dev vx10 nhid 61 self"
 	log_test $? 255 "Fdb mac add with nexthop"
 
+	# fdb entries with a nexthop group cannot be aged out
+	run_cmd "$BRIDGE fdb add 02:02:00:00:00:15 dev vx10 nhid 102 self static"
+	log_test $? 0 "Fdb mac add with nexthop group and static state"
+
+	run_cmd "$BRIDGE fdb add 02:02:00:00:00:16 dev vx10 nhid 102 self dynamic"
+	log_test $? 255 "Fdb mac add with nexthop group and dynamic state"
+
+	run_cmd "$BRIDGE fdb add 02:02:00:00:00:17 dev vx10 nhid 102 self"
+	run_cmd "$BRIDGE fdb replace 02:02:00:00:00:17 dev vx10 dst 2001:db8:91::11 self dynamic"
+	log_test $? 255 "Fdb mac replace with nexthop group and dynamic state"
+
+	run_cmd "$BRIDGE fdb append 02:02:00:00:00:17 dev vx10 dst 2001:db8:91::11 self dynamic"
+	log_test $? 255 "Fdb mac append with nexthop group and dynamic state"
+
 	run_cmd "$IP -6 ro add 2001:db8:101::1/128 nhid 66"
 	log_test $? 2 "Route add with fdb nexthop"
 
@@ -669,6 +683,20 @@ ipv4_fdb_grp_fcnal()
 	run_cmd "$BRIDGE fdb add 02:02:00:00:00:14 dev vx10 nhid 12 self"
 	log_test $? 255 "Fdb mac add with nexthop"
 
+	# fdb entries with a nexthop group cannot be aged out
+	run_cmd "$BRIDGE fdb add 02:02:00:00:00:15 dev vx10 nhid 102 self static"
+	log_test $? 0 "Fdb mac add with nexthop group and static state"
+
+	run_cmd "$BRIDGE fdb add 02:02:00:00:00:16 dev vx10 nhid 102 self dynamic"
+	log_test $? 255 "Fdb mac add with nexthop group and dynamic state"
+
+	run_cmd "$BRIDGE fdb add 02:02:00:00:00:17 dev vx10 nhid 102 self"
+	run_cmd "$BRIDGE fdb replace 02:02:00:00:00:17 dev vx10 dst 10.0.0.3 self dynamic"
+	log_test $? 255 "Fdb mac replace with nexthop group and dynamic state"
+
+	run_cmd "$BRIDGE fdb append 02:02:00:00:00:17 dev vx10 dst 10.0.0.3 self dynamic"
+	log_test $? 255 "Fdb mac append with nexthop group and dynamic state"
+
 	run_cmd "$IP ro add 172.16.0.0/22 nhid 16"
 	log_test $? 2 "Route add with fdb nexthop"
 
-- 
2.43.0

