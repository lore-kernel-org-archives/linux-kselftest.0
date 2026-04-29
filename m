Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61EF2F745C
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475890; cv=none; b=EDXD6MD7ek41a5rh5A0H4cyxYovvegHfgPPmDog6mTsVTpxxlnvW50gavkFo5+eKz6KWmFwGoN+M/LJyRA7C5KHeto3kOfvtpEUx3gN87BcRs40KoXEaD+DvNmi6NJIomEtSU6i14Ic2qvyT2oRjGbF5VNShLb/dKJ3ITYt/roU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475890; c=relaxed/simple;
	bh=IcSgz7CPtBhFf1K8izNXcbPchRtKjVsJDl/ciso75PU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fR/WUjof2rDHhHtxMFHkGQLkAP8e1Iev+kO4mxF7cbRoAX1+AEB+dDWmRLg5xB1g4xCCDJR2SzzT7otC5sEZNcMPJRLXV3HQJRWe3t6bwK36w28iEuiR59h60WpIlXH2LS36bQeHbj/gXruJudBJt0BZXt7k9HgILZ1p0TjRCf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso105947995e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 08:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475887; x=1778080687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wI/PIcTVy7eu/PfacjAoItlkhWbBUZ77v7uqcAyLoWE=;
        b=QdqMFaYbCs3IVpo6rLQYg9lH9WEpxOa5pazXFpbWh57+GMINcx0zLRyJeksAdtWL28
         kjql5RAvuZvI4Hutafudi1CxKIFkWDZZq59kN9tFqyseYVwRn/dtGpuaWmlbSgqwesMC
         EZPivtv+9WkPjKB7ApQCubFlkXOalzfQJH0SW26xuo/H3iZ25f2Hd5bXJ/0XpK3urIzU
         KsvzPimbSAPRlKP2y1lu41ShoWj9i5NMRR+Ly11co8j3YKQ2HPNPEUzy4GyfhZKhGTNc
         KUcQ3VjEg6jGo6KDuf5Ul2u/XtEutTJDiWfQ3BMhs3uqbUbATkCOWokcjJZaiTwOuDoW
         sVxA==
X-Forwarded-Encrypted: i=1; AFNElJ8AoazlM7JaXIksPYPtiPYDJvNnXeVFWw5kAYQz7NtAQe1tHplo/AinHvc8PnlBkRK2b8lf4NGZMoh1tuZzkmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypwUaZjon3e3+vOzbg7/dKHhLeNjK4XnF52MQM0MTzCjodtPzW
	6GC2CP5lmOlSU3OalFfXAv0tuY838riO17Ubik0y82mOmYDg8RprCPly
X-Gm-Gg: AeBDietmprkkgVsiAS17/L5JGolzQoNyq1EbQMnPr8oZy3Xo9o8yIv/AcUM60B6CvP/
	ZsVGXw2sWCzuo3uX36ghOrZvZmMLQ3wvNYNx/c9vwF8wU1iOKHmnV3y/A9LHGbc0ZdMslMd4d1o
	9S+tWbevqKDsd/K40pHIIdSPoMTRUN8HH2mKAI++frAdUxbWPVXlYQ1WO0ygYaMn5lx6iplO+N1
	14jzwoMsi4GgrXDOfMuY+pnUFYJpF6s4FFwOsOz3otklg8WDoZ4Hncg8Q3+Xo70vcRKwM+qASfr
	ZbOTdjBgrptbmbvFk2oyOx46tB7yjvkmFETwAKfw4hhHcndkk/haG7MUqbltKnQ7thfzV2ijlg6
	jnmq5JHmsgveTD/ekvK2AJGEeIgHtEiL/R1CGkQ+IT0IQ7vzPZhHObsl4HgwOovoBJaJWzI4FVG
	CqLpBbW3jTc05/46IE6WiwygFGTrTrjw9SnfYpIaF3O6e9f1Leiq8ER30E0KEDxhXbJkRUsw==
X-Received: by 2002:a05:600c:1396:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48a77b1b85fmr132416975e9.22.1777475887157;
        Wed, 29 Apr 2026 08:18:07 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2d3811sm32358165e9.3.2026.04.29.08.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:18:06 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuan Tan <tanyuan98@outlook.com>,
	Yang Yang <n05ec@lzu.edu.cn>,
	dev@openvswitch.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ilya Maximets <i.maximets@ovn.org>,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] openvswitch: vport: fix self-deadlock on release of tunnel ports
Date: Wed, 29 Apr 2026 17:16:36 +0200
Message-ID: <20260429151756.4157670-2-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429151756.4157670-1-i.maximets@ovn.org>
References: <20260429151756.4157670-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vports are used concurrently and protected by RCU, so netdev_put()
must happen after the RCU grace period.  So, either in an RCU call or
after the synchronize_net().  The rtnl_delete_link() must happen under
RTNL and so can't be executed in RCU context.  Calling synchronize_net()
while holding RTNL is not a good idea for performance and system
stability under load in general, so calling netdev_put() in RCU call
is the right solution here.

However,
when the device is deleted, rtnl_unlock() will call netdev_run_todo()
and block until all the references are gone.  In the current code this
means that we never reach the call_rcu() and the vport is never freed
and the reference is never released, causing a self-deadlock on device
removal.

Fix that by moving the rcu_call() before the rtnl_unlock(), so the
scheduled RCU callback will be executed when synchronize_net() is
called from the rtnl_unlock()->netdev_run_todo() while the RTNL itself
is already released.

Fixes: 6931d21f87bc ("openvswitch: defer tunnel netdev_put to RCU release")
Cc: stable@vger.kernel.org
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/openvswitch/vport-netdev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/vport-netdev.c b/net/openvswitch/vport-netdev.c
index 12055af832dc0..a1df551e915bc 100644
--- a/net/openvswitch/vport-netdev.c
+++ b/net/openvswitch/vport-netdev.c
@@ -196,9 +196,13 @@ void ovs_netdev_tunnel_destroy(struct vport *vport)
 	 */
 	if (vport->dev->reg_state == NETREG_REGISTERED)
 		rtnl_delete_link(vport->dev, 0, NULL);
-	rtnl_unlock();
 
+	/* We can't put the device reference yet, since it can still be in
+	 * use, but rtnl_unlock()->netdev_run_todo() will block until all
+	 * the references are released, so the RCU call must be before it.
+	 */
 	call_rcu(&vport->rcu, vport_netdev_free);
+	rtnl_unlock();
 }
 EXPORT_SYMBOL_GPL(ovs_netdev_tunnel_destroy);
 
-- 
2.53.0

