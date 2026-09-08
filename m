Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F533E360
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 02:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836230; cv=pass; b=uqCzx71AGr62P17xvDIZFK/jBGYIeUDodJx/yQzBBf4Lk3tNhSg2r/6nO1Ab9Ju/90BtjpA7hXD2PaL12w//WdrPCcmb7HisNH2SQ/LBzQvVOXccsNNPjO9DrtBA3bOvWpnj7QCk/9Zm/U2s79TrPt3kDL5Rtff3RzQS07Zw/k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836230; c=relaxed/simple;
	bh=7QT6BoZEqcPorRF+41Olle15p4YL12kp6yZbrGZ8iLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BMnpqm4rC9A1YcRiJ4kGzgRjplqjwC5BpRa/Yl462BJPxpivFJtcjXPvpqZsZPHRHaGPQ1KF+i+FJXJDzvZY+9+hNVVhVWCEq1ppfp8ppL5oc81gIEF3l5owYqD0fCM6Fgk3VyT/yhFM07zqYX5JUEsZ4OJdIjY/FY5GSo2qswM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2+lXPuH; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2+lXPuH"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso4356860e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 19:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788836226; cv=none;
        d=google.com; s=arc-20260327;
        b=EMlTFQ+7W5evPEC2vIEVHG1+74eIq+AphOOEYKu6SPtZRECOiP0XK44EEJVBknqE+H
         Npaug/WhrSvKvba/+ZaCCRlYcEQv6slRb9ZBt6KKPhy40msWzCdEWN1p5GsjZZtBX0+j
         Jog7gnHim1uuZh1nRGUrPgj3nlVGgfEvqKP0AOT709NUOZXDeKa02GrDZXqn1w9Vd7AL
         Fyv2HsZQiUQB7Eh3mmoY4K3desRB36PPYwqaB59OkAE/iIJedzZmFvN+r6jhnquGHQMS
         ghw+KjedihetbvP6SSQ9PBRKfaLeOuPGchdJuV9cheqKlp6k7qWQBZg1ricb90nIgm4l
         BXfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7QT6BoZEqcPorRF+41Olle15p4YL12kp6yZbrGZ8iLo=;
        fh=SlUIm48K4Q6D6GX5zmJhl216RVUzTgvdJewBYK4Vyio=;
        b=SXWZUFSzTF8ssSArHsjpdI/NXFy05pB7hDp4pTr7HFDiQeho11ddYOMLf7rFOOsrkG
         H+UpqKzOQzKT7R9WscPBDm+i7Amd/exqmMOeAjSWk1Q0Bx+Ax5wawa6Bj5x4T+L3Sj98
         oxX/w0UqkijgOoacMGpenv9hm73tin16yrubXeQYGAFYSSgX2IOjcAk/GxD1WKiC6pjj
         Zym6NPscKIjKcAan+/bO5jwl3zvbjA1NB8nAw4P/WyTOB9HwUapSrDqe8arxhkicxnVi
         u9zyD8HUc2aKohvC+UHtZdZKjLpmRyMFWCF8oV3+MNvSrRvACIzTgppX+BRj+R8v+EYt
         qgXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788836226; x=1789441026; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QT6BoZEqcPorRF+41Olle15p4YL12kp6yZbrGZ8iLo=;
        b=Y2+lXPuHDzNBPhBHm7jD2JBjY6yYMYwVQYJWnYYCNDXyEDrSHPVx062hLelr0OP7Lx
         HlnlBP9W4TBcrQZVdZZJbLlJo5D040Y0a004yCzzO5gG2SfyyBSbVdKcAfePjvO3Z49V
         VaneVhUtpbu8birBJq2hXka/T+FT6NbRRPQ9TeLMxFN45NGvH66PNFG5SKtYgfsKA83Z
         mGO/EbGfm2wW4ti/6jwZRUX3PcDX6HhbjhnmBqCS06lmbJE89QO2bIz0p69e9NKj5klX
         rwcR7apqWKvjpq0GM7e0RNxqwUqYhOk/dgIAAWcU6nJLkXn3XvjuypH9uDzkb4LG54gp
         s+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836226; x=1789441026;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7QT6BoZEqcPorRF+41Olle15p4YL12kp6yZbrGZ8iLo=;
        b=RDXxiJ58tIrW34uDioCbshf7VwureE32CizgVG53DV49A0cN9BPC8oi2N6xbyhA/9A
         MswnCVBR41c6ELnyuMDknXgqkrWxiHtCAZh9M/5Ulg6eFQVfUwr3hwU9m30lSe8jRXns
         5aquYQfsKkSKgOaw5Tj74Zk4BLr3WGYXesrS8v4+jMJWKhuj3Y1BBexbaGTdnjxTHbrS
         G57yY1Csv31C1dqkEOO6wo5SC+1olfJySSGewrUYhwUlMyKBLxoTEjavrMVhSyv2+GQZ
         Oh+kdZxEkFaXdjmED+KCg53dOXXECrJ942z/kEjp2Usn5k4su72RSNt1cHxjrxAWi6Ws
         eiQQ==
X-Forwarded-Encrypted: i=1; AKwUvByWfgTmzP3YLvBWH0fGEHaxgEdqurtO/5N9IKAvtZlinUYALyh6qiXFKfN8CVN4hrb1yMVj58E5FWxyXZf8iMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nSfIhRpE24IFFQJX76iBKMPPkdZllw2FTsz7QZeqs+ICMGl4ME
	PVU85xqlPjQZ0jtAhh5XoGZJU4zVucZ7XEuiRXHKTVnOhdrg9CxeOBu0RZRov11b++AULpGTOMo
	YMnwpRstrNGfGvGwejRcDZYqQRY5lFcs=
X-Gm-Gg: AYBFou1SZYRrtowWQXtwBoc1yTqhqPdp4Pi+m2YUVjFloEWMQbBYvL7N2n51SCxF3th
	jySfVZtmtKCmLgu6LH3fX1z9xlRW/Zoj9Fo/RjyL+qao0UY6B73guygS5QM1mbGkcZJBu2DNuOh
	eD9MksQk/IAnO+4dElmwWmS8LGaWSBeQpXZ327w+7D0h+KVXJC/e94Xp7sMbbYXCgloy9T6s9cW
	E+Fijlqt0MFbijx20ubrFbLUiZRcLMgpfuKqprMRvT0qhexQfMlLzGs6EJcycbLcGcKNEbECTex
	9pGfb03p8jn31+Hxqpaeln5hc+Aun2OoT9TBoVB2/qHfbRfZWvNnhIOUOS7LtLDTsxub+QbMIn4
	IjsrtM1XJmA+sWwX9YaPht0UtRoClJ7zPbw==
X-Received: by 2002:a05:6512:10d1:b0:5b6:4ae:8c01 with SMTP id
 2adb3069b0e04-5b616f59cf5mr4175296e87.28.1788836225895; Mon, 07 Sep 2026
 19:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905093932.43726-1-sigefriedhyy@gmail.com> <f1e70062-943d-4521-976a-ae7c9fbc756b@6wind.com>
In-Reply-To: <f1e70062-943d-4521-976a-ae7c9fbc756b@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 8 Sep 2026 11:56:54 +0900
X-Gm-Features: AcwNN1U9p2sFJsv_7_Qjw2glgbmq-K3CoxGpp4O9ALykWZMch5RDUDwBJuNCCmI
Message-ID: <CA+7S2vL7Xm3nPw96R1+aN-sHLaprPxFUNw4qi6kbTAUu5OUyNg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/3] rtnetlink: dump link-layer multicast addresses
To: nicolas.dichtel@6wind.com
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> These addresses could be listed with 'bridge fdb' (RTM_GETNEIGH on AF_BRIDGE).
> Instead of having a new message to get the missing info (users), maybe it would
> be better to update the current API.

I looked at the FDB dump based on the suggestion and I don't think
that path works well. The missing users count is not the only problem:

It doesn't list dev->mc for every device. Only ndo_dflt_fdb_dump()
walks dev->mc, and rtnl_fdb_dump() calls it only for Ethernet devices
that have no ndo_fdb_dump of their own. So bridge, vxlan, macvlan and
IPoIB devices never show their multicast filter in "bridge fdb show",
while /proc/net/dev_mcast lists them. Fixing that means calling the
default dump for those devices too, which adds new entries to
"bridge fdb show" output on every one of them.

User space can't reliably tell the entries apart either. "ip maddr"
would keep NTF_SELF entries with a multicast lladdr, but it seems vxlan's own
FDB entries seems also carry NTF_SELF, so a multicast MAC added there as a
forwarding rule (bridge fdb add ... dev vxlan0 dst ...) would show up
as a device multicast address, while the real dev->mc of that vxlan
device is missing. And since a dump can't be limited to self entries,
on a host with bridges "ip maddr show" would receive the whole learned
FDB of every port and drop it.

It would still need a new uAPI. All self entries are NUD_PERMANENT, so
the users count and the SIOCADDMULTI (static) bit would be new NDA_*
attributes. On the other hand, this series adds no new attributes;
IFA_MULTICAST, IFA_MC_USERS and IFA_F_PERMANENT already exist for the
IPv4 and IPv6 dumps.

Covering this with RTM_GETNEIGH would need the default dump for
devices with their own ndo_fdb_dump, a way to tell filter entries from
a device's own
NTF_SELF FDB entries, a self-only request filter, and new NDA_*
attributes for users and the static bit. That is more new uAPI than
this series for the same result.

Therefore, I feel that my original proposal seems cleaner and causes
less chrun. But feel free to let me know if I have any
misunderstanding on the suggestion.

> FWIW, AF_PACKET seems strange to me. Isn't AF_UNSPEC (like for interface, cf
> rtnl_fill_ifinfo) more appropriate?

For address dumps AF_UNSPEC already means "all families" (RTM_GETADDR
goes through rtnl_dump_all()), so I'd rather keep it available for
RTM_GETMULTICAST. AF_PACKET is what iproute2 already uses for the link
family: "ip -0" sets preferred_family = AF_PACKET and sends it in
RTM_GETLINK, and ipmaddr.c has always tagged the /proc/net/dev_mcast
entries as AF_PACKET.

Thanks,

Yuyang
