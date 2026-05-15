Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432739E171
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 20:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876388; cv=none; b=ZY6Pu2fPzxRnvKBiMaiZsmiv1WlIXM8L48n4h9xHSwlGmlSLI8ifjOfgGTPSVrl9XTyw8ZTomrd9lGmqTvTeDoQdBlzsIGN5DBAYnASlo9Z+lNiZ4kHoqJH0avFPGDlrghFmB54k4yiC+st448J0aiRpqAW8udjbuzRmmqu/gW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876388; c=relaxed/simple;
	bh=Q28j9z8dp3oa7JMWHW9YFacpLH2Z814ez5zEJhieN9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=up9y4uWNfBzAWi4RJJCdCnIQoUTOPwixROeWsGJOpkZSdMAt8pKPsA24MD7xLy3WTMi5CVvtE4xusOhd2O9yacNJ7rVL/2P4daqvLwxWayfCoe+9Rd0xfWrmUGBdEbLhGhzg+W4TKIAvt4r2RtadFVZoC3TXp7Q3yc49MCpVXa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so1789935e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 13:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876384; x=1779481184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N3vmZN+/CLFfYNwXnxNj1H7df8GenR+J9C9ZLO0cmvk=;
        b=XGTvi/T1Mo4noB7iArmNyM3pGE3BEPBQkrxA80gc0qZis0sSUHtShImnxfOFehVqg5
         eJdrMbYvY5SZlKK1VtwO0gBY2cxU4nHpMH9s+aXFwcfZWFjvqtLqo2uQQzu7p1K0Wohy
         JA4WiEMqJmqTq9nFJLHmfIunCbvikKIWgGtBQrsIf1FlUs6A0bVaK3JwfVpIkA2tZvGi
         jeH9MxPJSss9H5azFk5cFK6+GN+undgkgtEKYQGEfYk2PPnKenIFnPBS0H+TsDtOhJMA
         EC0+ThYBpoj+xiFzThJeQ1AsDfRG4198Tvcw6zgVPA28f/MXhx3weBO3cXBLLZsdzDGw
         PmHg==
X-Forwarded-Encrypted: i=1; AFNElJ+1P96Rhfx4ZJlM85zZ25o9zaQOPoEMO9xG04l3qg09ymKCXY+Cemn4Y9hRz3xOwIiN8faz44046qGSAF/90bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0sNWStOqCDf0sznq/ujgFyXgvCEQ2QBr0mWvrCcFq4AwedQt
	lJfC5U30RlrNipAFLGU+p9GkgXFjJ+Kiz4lfrlGolornG9cqa5Q+kGGF
X-Gm-Gg: Acq92OGwpQVrn55QSo/iLEBbZQZVcOZKqx7FjOQw36fJB+OaHUJ+FRyoWyKOpk1/EHT
	a+0WyCKMNZ43ejr5riHdt+mWtR/E4yfa6WQcKdqO+pu6gDvNPenBCRRVsYHv/gmvaOXAuoJyrdi
	vLMHQeFunnzZxEf1KqCmNEGMTG6e060TKa42mCCt3i42nPAZHTGnJ/g+NkoUjF2NnUTsoZ0AT9R
	c74phplV0fHq5Ynu+0B1CFHzkoe0a9IynAbh2sxm5mUdfAWgxmN7mV9UEoSOIvzsJT8pgaBKJnq
	k1ggLCzKv/n5QXoazrD9fZV6CJ/2BgymGyqGwdp7DMSEjBBheEqVpDkfW9ca92PpGayRRrwOCaz
	2RJPkuN5/oA6QoaYa/3PHLHjDCvs8e2uN4PkL7xH/GSqj9IUbxijYg1tKPFXJW2ATakcWWJPeER
	FB2HnejtdPATfkGdK9a1a+Zl7hAtBa42cY/PPuL1m/leSQBH6I8iH6PgjlEiM=
X-Received: by 2002:a05:600c:3b27:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-48fe6516b54mr70915975e9.25.1778876383868;
        Fri, 15 May 2026 13:19:43 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2896bsm22924605e9.4.2026.05.15.13.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:19:43 -0700 (PDT)
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
Subject: [PATCH net 1/5] net: rtnetlink: fix link nsid reported when the link is local
Date: Fri, 15 May 2026 22:19:20 +0200
Message-ID: <20260515201937.2813983-2-i.maximets@ovn.org>
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

For most netlink replies and notifications the expected behavior is:

- if NSID is not reported, then the device is local to the querier.
- if NSID is reported, then the device is remote, i.e., located in
  the provided namespace that is not the same as the querier's.

Userspace applications like ovs-vswitchd expect this behavior.  And
ip monitor uses this logic for printing out [nsid current] vs [nsid N].

But this doesn't work for link nsid in cross-namespace RTM_GETLINK
requests.  For some reason the code checks if the original device
and the link are in the same namespace and not if the querier's
namespace is the same as the link's.  So the logic becomes:

- if NSID is not reported, then the link is in the same namespace
  as the queried device.
- if NSID is reported, then the link is not in the same namespace
  with the queried device.

If the link is in the same namespace as the querier, the code will
allocate a self-referential nsid for the querier's namespace and
report it as a link nsid.  This is problematic because:

1. Application doesn't expect to see nsid reported for its own
   namespace.

2. Application can't know if this nsid is the nsid of the current
   namespace without making extra requests.  So a lot of extra
   logic is needed to understand if the link is local or not.

3. Implicit allocation of self-referential nsid for the current
   namespace affects notifications on sockets listening on all
   namespaces, since this nsid is now reported in every notification.
   And so those notification handlers also now need extra logic to
   understand which namespace the events are coming from.

4. A seemingly read-only RTM_GETLINK request for a different namespace
   allocates a self-referential nsid for the current namespace, which
   is a little unexpected.

Let's fix that by applying the same rules to cross-namespace requests
as for standard ones, which is:

- Report NSID if it is different from the querier's namespace.

This changes two things:

1. If both the device and the link are in the same namespace which
   is not the querier's namespace, the LINK_NSID will now be reported.
   This just gives more info and the user can check if the reported
   id is the same as TARGET_NSID, which is in the same message.

2. If the link is in the same namespace as the querier, but the
   device isn't, the LINK_NSID will no longer be reported.
   This is the main change, as previously this would mean that the
   link is in the TARGET namespace, but now it will mean that the
   link is in the SOURCE namespace.

There are no changes in logic for queries that are not cross-namespace
queries.

A research across open-source projects doesn't show any projects that
rely on the things that are being changed.  I couldn't find any
project that uses the reported LINK_NSID with cross-namespace requests.
And no projects that use cross-namespace requests seem to even parse
the reported LINK_NSID.

Of course, that doesn't mean there are no such applications, but the
current behavior feels like a logical bug that IMO should be fixed,
otherwise it's hard to use all-nsid sockets properly.

Note that the logic for notifications in rtmsg_ifinfo_build_skb()
remains the same as those are formatted from the perspective of the
namespace where event occurred, i.e., they are always "local", but
then distributed to sockets listening on all NSIDs with extra metadata
pointing out the original namespace.  And users need to translate
the reported NSIDs to their reference point.  While RTM_GETLINK
always reports NSID from the querier's reference point.  Hence the
reason it should not be reported if it is the same.

Fixes: 79e1ad148c84 ("rtnetlink: use netnsid to query interface")
Reported-by: Matteo Perin <matteo.perin@canonical.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/core/rtnetlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index df042da422ef3..0d539b8e4bf61 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -1881,7 +1881,7 @@ static int rtnl_fill_link_netnsid(struct sk_buff *skb,
 	if (dev->rtnl_link_ops && dev->rtnl_link_ops->get_link_net) {
 		struct net *link_net = dev->rtnl_link_ops->get_link_net(dev);
 
-		if (!net_eq(dev_net(dev), link_net)) {
+		if (!net_eq(src_net, link_net)) {
 			int id = peernet2id_alloc(src_net, link_net, gfp);
 
 			if (nla_put_s32(skb, IFLA_LINK_NETNSID, id))
-- 
2.53.0

