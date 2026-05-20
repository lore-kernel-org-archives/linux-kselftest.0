Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39303ED3A9
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 17:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297825; cv=none; b=HYlq8tJhK4P75DnV0Kcy3mR/dFEVOqH29CgwP5H5pmOiAelHj3gfl9jaXxvxalm5X402xcQ//E7hl8FyhPoSjw3wycAhADlMG2WC0s6t+Mrz+OAp2GLHoPr9dfIdiyPGGSDSwxu9I7uQ5ZYRVHZzc9YOFrpXQftPGOA6ENawETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297825; c=relaxed/simple;
	bh=dEn/DZjJ6ZkDMxdIMlTcRhfqUFij0sqTMuUmS72Qvf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2wgmqt9C6u5VzvIjr7i2q8At0wcyicnD0qWo7vKKoJ+xGQsWgRx7QigClYLOUhKQQmgqWJAzFJUfRJlpE8PQrpR/ul8aBRp2zHfZ1PBtRV7VAzB6ei743+XKPdu2o9a+Ry90nQGiWYJoLsGiKP8oXh1zJ0l8++yEJ3KAS4C4tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so3806534f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 10:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297822; x=1779902622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f/5B2KT7zWN9FEt5jFJ3UZmNoriTd7Q2p02B+ALz3Mw=;
        b=e72bEw548Lz48d0vj9M6ncn3osC6vCzTO5eLIUPl9RAaQZ5uE289xVRHnXHMNZBs5o
         hPJsCJv4J4zJYQZhCEE2NTTwYr+hnbBaSPsToC0NzEijqM3gUyBfRpeEm7YrLq67zlbJ
         JbRINLFt4+51uUfY6R/Fj1lIjR/Kk9RzMzddNPgVm1EyRsydHncyF9Bhj2bW56DakYJP
         rkRheTD8NOyJgqA6W04xBfeOOcI20HdkeaJJY2PSCmQklWsFqbeIIO74xkijtBmlK61v
         DY9vFyybNm3v9aN224rHEHA1wq93JVmVGovXwEkIJkala3hN4alMwTDeLXiW7ag45+FR
         C4mw==
X-Forwarded-Encrypted: i=1; AFNElJ8nTULeLde/lQo+Bm2q7sO6JZTOXPV3HS/TMBsn/sQNq6R/c7/VXYAc05U2ZlhVPu0nZhBSvMi+aNOFZe4Fers=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4h00x8oe0ApL7C6oWQ7bEm8HA+ot988hMIO1Hs/CB+O/kumR
	/lbzgD+wVmnhvrxka9QnHh+eyFbNEJmi3BROton/oVzvPA2XgKGYPHlR
X-Gm-Gg: Acq92OHSfnzuHpWi3YDF6yRhxmX7C7T3rzTx4j0BRF7Z6uDLr9iIl/TfHLY6xPfFJUq
	+Nwto2AqY4YrlRDSjZhUC37t/sHoePwBUO347yIjAELPAxm6oQmWDoON3zp73I8Z1LUF2EBqbbJ
	pggLX3FNN5WPBwjuMVN45TcIYE/fAy5BGMzOYB7RmrRonkfg3xi0scpaT0CHh9CPnLoEF972FDI
	HMtx5TO1lpuwwsbg7isuOuD0pEbB061pXIHapMvQvL1+ktdwe7ipckSh61EMnggzhlAEj2SSdrf
	Usogawjs9hOXNfJkouIULTs1aPXwpo+/hOsHNJ5Z+vVYlOURazXGavAVrFtuInEqdQlOEUfS588
	rtVxwO2mpta4/eNtYaujiCS6AGojfep1tUj+N3OBhyapU02jlhlIE8NCHcKJSYa+wYOyrjQ/d4M
	IPp0Gau1SqOaa3oaZWm5zbTo2WIlh8PSnUL+7yzkpLm5e/r7ln/iCQUdpfFkVKiy4Uetk/41kSc
	UaI6c50
X-Received: by 2002:a05:6000:2503:b0:43d:d037:d59c with SMTP id ffacd0b85a97d-45e5c5ca060mr41914479f8f.16.1779297822258;
        Wed, 20 May 2026 10:23:42 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm51125580f8f.26.2026.05.20.10.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:23:40 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Kees Cook <kees@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net v2 2/4] net: netlink: don't set nsid on local notifications
Date: Wed, 20 May 2026 19:22:36 +0200
Message-ID: <20260520172317.175168-3-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520172317.175168-1-i.maximets@ovn.org>
References: <20260520172317.175168-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In most cases, notifications on sockets with NETLINK_LISTEN_ALL_NSID
do not contain NSID in their ancillary data in case the event is local
to the listener.

However, when a self-referential NSID is allocated for a namespace,
every local notification starts sending this ID to the user space.

This is problematic, because the listener cannot tell if those
notifications are local or not anymore without making extra requests
to figure out if the provided NSID is local or not.  The listener
can also not figure out the local NSID beforehand as it can be
allocated at any point in time by other processes, changing the
structure of the future notifications for everyone.

The value is practically not useful, since it's the namespace's own
ID that the application has to obtain from other sources in order to
figure out if it's the same or not.  So, for the application it's
just an extra busy work with no benefits.  Moreover, applications
that do not know about this quirk may be mishandling notifications
with NSID set as notifications from remote namespaces.  This is the
case for ovs-vswitchd and the iproute2's 'ip monitor' that stops
printing 'current' and starts printing the nsid number mid-session.

Lack of clear documentation for this behavior is also not helping.

A search though open-source projects doesn't reveal any projects
that use NETNSA_NSID_NOT_ASSIGNED and rely on metadata to contain
self-referential NSIDs (expected, since the value is not useful).
Quite the opposite, as already mentioned, there are few applications
that rely on NSID to not be present in local events.

Since the value is not useful and actively harmful in some cases,
let's not report it for local events, making the notifications more
consistent.

Also adding some blank lines for readability.

Fixes: 59324cf35aba ("netlink: allow to listen "all" netns")
Reported-by: Matteo Perin <matteo.perin@canonical.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/netlink/af_netlink.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 0742e97f256e4..7269e23b578d6 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1482,10 +1482,14 @@ static void do_one_broadcast(struct sock *sk,
 		p->skb2 = NULL;
 		goto out;
 	}
+
 	NETLINK_CB(p->skb2).nsid_is_set = false;
-	NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
-	if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
-		NETLINK_CB(p->skb2).nsid_is_set = true;
+	if (!net_eq(sock_net(sk), p->net)) {
+		NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
+		if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
+			NETLINK_CB(p->skb2).nsid_is_set = true;
+	}
+
 	val = netlink_broadcast_deliver(sk, p->skb2);
 	if (val < 0) {
 		netlink_overrun(sk);
-- 
2.53.0

