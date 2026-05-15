Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0073469EE
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876391; cv=none; b=ky+yjTkPOPpqQRLBwec6vJMb0Mu4dtJy3iR/2WQe3y/361se6JgBCPnCCOMjJ54fJp/LSxNSYp1xA/LxooFv2k5x7XdAo+2MoVYVnNVbR8dBt67D8vwCLojRXf8doBgRCwIH956L1QEDtrSQMGmu6AVAYWrjSmNaFg6G9NVSOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876391; c=relaxed/simple;
	bh=11PvwTnrSqhRrKXUG1flLgVCfsSwFEgQM3usa6azJag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMzz/5XdTDLT2ShR8ZeyMKF/M3dxIzPiE5OxnX0QcJuiXijedtexFtK2CbQzSJGCEZg4yrP7kvjqMI7ZmWV5TFVxdMmI8Wbtl5G255ANCd6w4ImDw64XC0bpc5nVCxq+7hHHOy6zovqe4briqkVy3bPHZqcja1iiGnjmRV4SJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so74413f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 13:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876388; x=1779481188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hPaN1T7r/zmxUDUF/SdVhtgWCcFs71hNuD9xdwSmNs0=;
        b=D744py4SBNdH5kH051d2q5Y85TU9LKY4K7ApPpOIn54xF1oDMZHknB5oxwzjF4LGs9
         ZcRAMgWyNBgKR2vH8XQWnuCDHnZTVVuScwbCkrsZe9/NS/w9sgRvrsJ8XePv4lZAM7ox
         YKLSDfovViEVNrG23oDgQ7DRLty2XJe/boRWfq0YjabzmVJ+Qm1YBBBHdFRE75MeBpti
         mlQeIzd0nSy2DOFaLKWZZaffmPxNng20rpw9u8v8UldR8KhUSHp49iWL4JWftOlNBKp+
         XAtUy8UBWXRNGL1qhYqIzktDwbBpSWEp+AywEWScgyPt7gjW3IDrXFoVq/8G4Qi7fyZ0
         EVjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8dY5Yly5hTw8j8pnZFJzDSLJ7u8mWb9T7R4CWZqIEA646Oa8XPOI5xVXTry0U3JXk9oEwcSp62GOS8DubX54=@vger.kernel.org
X-Gm-Message-State: AOJu0YybFaZ7u1i7gg0rDkSJ8+4lq697Chcr+V/UGHLZKiq3MIGIORns
	a9NVY6VhIeBYPUQyvimBWR3+0inz32qDXbsucX+T77UeR5mIIODmzm5U
X-Gm-Gg: Acq92OF2Y7ceL8Qx/gfZRgPob4D31RR6ThJUgh3siJUC78U5GBIWzH2XQN805oV2IEE
	7BF8JGFB738EKoSRLJ5NnVPVLo9IrpzvWawjmOFttuSI/UBg0zJWZoqSZP3gI96TeowOL8JaL7A
	vpmu0gu/9SnE5dKDIlsSaFe8ic9ybJ/Xvp3TEq2RH1lLQdGuzmKuVYBPNfxGrSC989jOy56QNzK
	m9sw05D+8IF1mhVppwamH/K+djeiDbUyOdHfe/Sv+YNN3Cv15+ElY6aZwIyjcL8d0/kiyQ4oFpn
	rHv/nsV8KbrCP49yt9l0rV4434uCNMO1BWNzHM07nj/XaBwOK431bYIut7k8lCsq9dEICWFPPXP
	SKZT+laNxWppv+5oG1Xv9JImR9ThOJqItZx9+9AAVEcdcB4H4rPIqaaXfaodeVcla0abSXp81L9
	Oz1XfI146Qdd5ZbKnLFWbyjmzTQ8GKpk1KoC7TCvlvJPwcne9FqlCzYrM7GMA=
X-Received: by 2002:a05:600c:a406:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-48fe632a9f4mr65203915e9.23.1778876388129;
        Fri, 15 May 2026 13:19:48 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2896bsm22924605e9.4.2026.05.15.13.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:19:47 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net 3/5] net: netlink: don't set nsid on local notifications
Date: Fri, 15 May 2026 22:19:22 +0200
Message-ID: <20260515201937.2813983-4-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515201937.2813983-1-i.maximets@ovn.org>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For notifications with NETLINK_LISTEN_ALL_NSID the expected behavior
is the following:

- if NSID is not reported, then the event is local to the listener.
- if NSID is reported, then the event is remote, i.e., originated in
  the provided namespace that is not the same as the listener's.

Userspace applications like ovs-vswitchd expect this behavior.  And
ip monitor uses this logic for printing out [nsid current] vs [nsid N].

However, when a self-referential NSID is allocated for a namespace,
every local notification starts sending this ID to userspace as part
of NETLINK_LISTEN_ALL_NSID CMSG metadata.

This is problematic, because the listener cannot tell if those
notifications are local or not anymore without making extra requests
to figure out if the provided NSID is local or not.  The listener
can also not figure out the local NSID beforehand as it can be
allocated at any point in time by other processes.

The value is practically not useful, since it's the namespace's own
ID that the application has to obtain from other sources in order to
figure out if it's the same or not.  So, for the application it's
just an extra busy work with no benefits.  Moreover, applications
that do not know about this quirk may be mishandling notifications
with NSID set as notifications from remote namespaces while they
are actually local.  This is the case with ovs-vswitchd.

Having a self-referential NSID mapping is not something that happens
under normal circumstances, but it can be a case in specific
environments.  And it can be more common with certain container
runtimes like LXC/LXD/Incus that unintentionally trigger allocation
of the self-referential NSID via cross-namespace RTM_GETLINK requests.

A search though open-source projects doesn't reveal any projects
that use NETNSA_NSID_NOT_ASSIGNED and rely on metadata to contain
self-referential NSIDs.  Quite the opposite, ovs-vswitchd relies
on the metadata to not be present to separate local and remote
events.  And the 'ip monitor' relies on the metadata to not be present
to show '[nsid current]', though this is more like "print 'current'
if there is nothing to print" situation, but still can be a little
confusing for the user to see an ID for a local event.

Fixes: 59324cf35aba ("netlink: allow to listen "all" netns")
Reported-by: Matteo Perin <matteo.perin@canonical.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/netlink/af_netlink.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 2aeb0680807d6..607ab4e4ac697 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1482,9 +1482,11 @@ static void do_one_broadcast(struct sock *sk,
 		p->skb2 = NULL;
 		goto out;
 	}
-	NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
-	if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
-		NETLINK_CB(p->skb2).nsid_is_set = true;
+	if (!net_eq(sock_net(sk), p->net)) {
+		NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
+		if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
+			NETLINK_CB(p->skb2).nsid_is_set = true;
+	}
 	val = netlink_broadcast_deliver(sk, p->skb2);
 	if (val < 0) {
 		netlink_overrun(sk);
-- 
2.53.0

