Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588F23C2BB4
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101421; cv=none; b=GsdIihTOIdenz/2vIZdoHrhzdsIYOS9LvkE2d9ODVGjemVwYQd+BGU+0fkXkKNfugzT/+fwDg8z4DsZRk0UpgpCXHhxL/J2LDBnhTAGdHz62CVpPp2kdDGjA3LGcQ7LG0TU1nkalZT2k5wJmmbfiXI4jgvBXXcwBUCQYNmZdfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101421; c=relaxed/simple;
	bh=Dqabu4UeNovAvh+LzyIVlcZ/EhWLpGQw3HuptsIqWcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J+/3lVn9KVE1M6gAv70gypcVh80hGNfy6YAzqSSmNSDUCNPo4fsqegNGBVL0qJzY+Bz8pl51TRUaV0Vp/FJrREgBBJzqvaO3ZtfY+Jf2MgMlZMggFHdbzjKvTTM/STZczoxZ/wkoc1OBtKFLfvwyEjsrdKaLwnGxI1j/GSkjMCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkds8EwA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkds8EwA"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848643382fcso5787343b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784101420; x=1784706220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GC1e/5Hz543x6Xbvz3bOQl04AkOMjBv03xL6AoR9lwc=;
        b=qkds8EwA3LRnpbK7vx86S0AAu6Fprq6DEz5sL6wGfwMozzSXXkMf45eVTiXmFLC3PF
         6oWmFt/7QQQFef831SzFjdW/2ENlfBWdt73ibW3Ryr3+tvtt8CgxpSkFPJ5R54EXTJoF
         Kfb7GIg/ZP4EqSBP3nWv0POFJVwTsaHgE4qpyI4yv4lT5EN4fnI2yDAFesRxBXbps06+
         GiD2o4niv0JiLuoYaw7b0dDF6ggClaQtCQxPElGFxYTJu74JH3UoGzN6sNstwcA9Hb2A
         SEaV/kgPHn18Y/Cn8N3I2TPgEL+c1CMHKHegEgja4EB+AUnHfr6LLzyxodK8bkN06Dek
         51JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101420; x=1784706220;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC1e/5Hz543x6Xbvz3bOQl04AkOMjBv03xL6AoR9lwc=;
        b=tGYf/5k67ia+evOlcOot6Fd41VKEVsuwloghunuyxydHCvpaZX/CQ1q0NS/Zko16Qv
         Ta0VdA28KHQA/A96xIeg/hdupCwtPmrDy+IIJCgk4zbBcPpZASR+Ke/iXgZM5ksh/eJ0
         h/BRTf6nd79oTJPKEyjnKZUPlvGa1VbzU7AKxvQgVzCfGz6VwqSkZ+WLEhj9A4UNNi4w
         ZArKvArAYIa9bmGiJeV7N2uhpPyxwLBLgaPnE3oYjC8rNzVWc/9TDpAXsPeMzsCquCTP
         0U+MlUzbNx7LysNrGJcnldZNMhxkX8W67APuNdnKx7cJ+u1NBMJJ0MCwyIxHyZOhR/KT
         IWyg==
X-Forwarded-Encrypted: i=1; AHgh+RoeJ1AM4AlUgadQKhrISiE7IcAS3Z1qp6cnvBj7LOAVfiCjFo5qbmzt/YEvpC9cEQmBQQVqhjratnUhd22DBKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkhw6fytu/CPd5ZrpjQT6ZlVvWRdRUwHY+ZGQMrD1FMV2RQAJ/
	Qpavxt4/ooHPeCodoalQQeW2puujWF0a3TpiNJYTjNCS9JLwAiSdKFiP
X-Gm-Gg: AfdE7clHUVtomhuH+JTr20PrjQ5x0029zzHeB8PUru6QDH1LUu8Wa8merZJ98PBLCjD
	5JDhbQy7IlqEaerYyxeY2H2zULk/DJH+qljVpDZiP1lF2hM7K+lzAPqa6noxXX7y/8UX/DMvHm9
	k8N0hgACvaOX9B9gAMSQXXAV/U0uF6QdLdaAtB3oM5dHPy0EL8H7gcJtz8F5wbuMjtYQtED4xMb
	qlnYQKNCW2XIaZFNId746MktTzkLrwbyP3dBqcSotzKY6ZWWHj8LFV+nGqyLEom6PvSkdiT3UzQ
	hNiZ7QrwGuJsSQxyIx4qwsjGZGNAfyLFVXD7MGajfe7PMy1qopBJKCo5uJHSChRcLXVuVvOLkfC
	l8jBCSecS9NIdLshrzl+OqqkrzuSWhXIX8K35mS05iECw9173B8GpOPDHCQAJfDvRdDTZw9WHLv
	LBJQBJfWyvrRRq1DfZF1c8ay+xxUMY1BaEShwqPgbjEdKbNQ==
X-Received: by 2002:a05:6a00:855:b0:848:4ff5:5311 with SMTP id d2e1a72fcca58-84a51467aedmr6726397b3a.28.1784101419571;
        Wed, 15 Jul 2026 00:43:39 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dade0sm2666238b3a.46.2026.07.15.00.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:43:39 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
	netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: nexthop: per-nexthop UDP dst port for fdb (VXLAN) nexthops
Date: Wed, 15 Jul 2026 07:43:17 +0000
Message-ID: <20260715074317.2271-1-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714174201.GA1037700@shredder>
References: <20260712191218.236-1-jack4it@gmail.com> <20260713122339.GA548566@shredder> <20260714034309.2226-1-jack4it@gmail.com> <20260714174201.GA1037700@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Jul 14, 2026 at 08:42:01PM +0300, Ido Schimmel wrote:
> It's unclear to me why you need the UDP port based demux. On a single
> node, do you have multiple pods that belong to the same tenant and
> therefore share the same VNI? From the above, my understanding is that
> the answer is "no".

Good question, and I think my earlier framing sent you down the wrong
path, sorry about that. The honest answer is actually "yes". By design
a node can hold several VTEPs on the same VNI, as long as they belong
to different HA sets. Anti-affinity only keeps the two replicas within
one HA set off the same node. Two pods from different HA sets on the
same VNI are free to co-locate, and that co-location is the case that
needs a per-pod port.

> Assuming the answer is "no", instead of having multiple VXLAN sockets
> in the host netns (each bound to a different port), why not have a
> single VXLAN socket bound to the standard port (4789) and let the
> VXLAN driver perform the demux based on the VNI? [...] creating
> multiple VXLAN devices in the host netns that only differ in their
> VNI and then move each to the relevant pod netns.

For different-VNI pods that is a clean fit, and I want to try it out
regardless. The outer packet still carries the VNI, so a shared socket
can steer by VNI without decapsulating, and the host never touches the
tenant frame.

Where it stops working for me is two same-VNI pods on one node. They
share the underlay IP, the port (4789), and the VNI, so the outer
header is the same for both:

  outer: NodeIP:4789, VNI=X  ->  pod A (HA set 1)
  outer: NodeIP:4789, VNI=X  ->  pod B (HA set 2)

There is nothing left in the outer header to steer on, so the host
would have to look past it and terminate the tunnel itself, which is
the VTEP role I would rather keep inside the pod. A distinct port per
pod puts the distinguishing bit back in the outer header, so the host
can stay a stateless outer-UDP forwarder.

> Given the anti-affinity constraint, you will only need to load balance
> between pods on different nodes that use the standard port and that is
> already supported by the FDB nexthop groups.

Agreed that the across-node load balancing already works. What the
VNI-demux version costs is packing density. With one shared underlay
IP per node, VNI demux allows at most one VTEP per (VNI, node), so N
same-VNI HA sets of two replicas need 2N nodes. With a per-pod port
the same sets fit on two nodes (replica 1 on node A, replica 2 on node
B, each pod on its own port), and anti-affinity still holds. For 5
sets on one VNI that is 10 nodes versus 2.

So the port is not strictly required, and your VNI-demux model is a
real option I will prototype. The tradeoff I am weighing is density
plus keeping the host out of the tenant datapath, against the uAPI
cost, which is small: NHA_FDB_PORT is the nexthop analog of the
per-entry NDA_PORT that already exists, it is control-plane only, and
a leg with no port behaves exactly as today.

Happy to keep digging if it is useful. Thanks again for thinking it
through with me.
