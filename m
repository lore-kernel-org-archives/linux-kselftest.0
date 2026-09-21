Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913B31FF7C7
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 23:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035198; cv=none; b=EU1k3VdtPWDERBOIzOVZ6S+an5kW48Cz4HmgBEY6y8hEi3jLMEjGbnW8m42zOFj+19pqZqTWl7/5d5Qb6dRbCProxInTASrSNcdprgrNYio9U6198VGzyHLfO1/obc2DLKc5Reaj4BQ0Cw80hixt1t92pyV4C2MxeUlJs8IJB1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035198; c=relaxed/simple;
	bh=+j/HWm0sJR8e+Ciz0hsQyb9Lvn2UxVyfqC/mGJlOmkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aBfKuOajIbmspTNgdosVJU4vM6Iu5jGp1KJ7xYhgFCqKt7Rc2+tS+Gei+DIyQ0B73yeJx/HTZo1R5qj4o54WbadKeb14x2Q+CthrIcrb/+FgC278/HeERkqqDZVagAKX47xfWSZNJB+glRl8FuOrUIt4F+6AzABDXe39MVhZJ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0FiFUEu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0FiFUEu"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0135fso34296635ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 16:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035197; x=1790639997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLGkN8jZGRM4X93ZScZTzFD8BnqePaslws4MVAUwM78=;
        b=b0FiFUEucskMbgMd9rxKi+H5fL2ISDmHEy5WITfy2YUGl7bySZFyfY8RpInvT+Adcx
         LaCRQrJ7eSa586FJ0faCRWEgkeo+P/+3oLNKquZv7/apjilH+e+YKMiqo6RuQVjZYYhs
         /e2BfxDfBp3MJwjSfedXr3J4xlXeLVGuY56DwegsLY2SGEYOiH+r41cuqdpnlkcbAVp+
         /PiMAteiWNZv3T5vhw3OPEzSTJLlxHThrRl1ta87Y78NSmZSn1/kGS619Z/lW+VGXi2W
         d6L/i7JfQfXymQYruhaXusdIM7IvSI7WavnsH5geSIUYfZ8eMQzil91Ya20fpy9ACPHn
         maUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035197; x=1790639997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLGkN8jZGRM4X93ZScZTzFD8BnqePaslws4MVAUwM78=;
        b=1lqk75zQZFNAxoQSGw7FMy3bSU41z/Qt/eO9hCLxjnRn33glbS0hLu+GSRq+a+XeEk
         FeP0wOOwriqjGpatAX3pe67TkrQj0/ZNmU7lmxXkcJKHbamWUTtgYhGK0HWPR2ULRu+c
         DDW39kLjD4m7YSXWnoguw3g0BqHJUlbvtAwIUTgY87+xLCVQvCY/A5RGy57UfXtrUK+L
         nRMDkvEf8TwJ4ZOyI0ka5yrWRYCBSTzTUDCvErCYFqvjF6g9UgKc7IswOJkJIQWrTNaZ
         W9VwVVK43ivD3APXn+/r3stFoqvV1UO8iU5z6AM9xCEkZPaqDJBTXVcHxLFLbwK5NRgj
         no0A==
X-Forwarded-Encrypted: i=1; AKwUvBwMNIuIvvT0vqonhvcgaQE763wLjveY0PyLVgtG1EOTH1U9gQzQMs+tkVOi+nWUVrUwQreoS2c/mbK/xV/fCAs=@vger.kernel.org
X-Gm-Message-State: AFuF++mrsP85/pdpYFX92RBX3qtInKOzJsFH/h+D+hxJm6JT4DIVlrSv
	N0MFc+AIJHSSrVXhumANwxQSnRaYoK7IaO1Teiid5+W46heBUc1iD07G
X-Gm-Gg: AYBFou3JF8R8KdvLwvSLjskYOEd1Q4E0/gw8jsAR2AykUP6PvPRrEr/sJiXT34Miob4
	OL/DaFV9A38s+QacYsrzfurgNkw/Bbc/YQ8XNsbAgik8Vbddth38elRvKjnSNaLnrzn3ax43T3c
	uJqBOmroNcB+cvRtr4qV3LzFmb3dodHy52NwF4Sih5iEr6QUeXqmlYGJbwBneHOJdTYTYCoFNj0
	kyOiQQ6R0vo1FFuKQ1D47WtzmzObfj+x5dl2Hg8WYBJ4ekCI21TtbY+i0enO5OpqNxPfrkZDvR0
	uGTPYA6fF1eB9q/IwWXE2caIt+q9pMyNKWQCKbNHi4zPBsmsYls6MAfGCqdYxeDatTA/jSKWjmC
	PZA6FlSY9xm8JdukRT9zR7054Qn21cq7siYfQXrKbmv1lu0sIlU1pjyM0Sa4d8V7GP5Pj0Byw//
	r3M0XtMOLSj9fd6e5RBJKznx8wiejS0A2UOZzOY8+Noobssl2ZaYmPlAKKs6d+HapVpXDNBGLv1
	Hdyhg6d5Zm+CbeKaXzyti6Cf39FO7iIw1ELRdeyXw8j81EYqdfEXkZV6oRG4H+e7FbaeKcU1g8b
	DA==
X-Received: by 2002:a17:903:1b08:b0:2dd:c100:9440 with SMTP id d9443c01a7336-2ddc1009c6bmr120569975ad.62.1790035197022;
        Mon, 21 Sep 2026 16:59:57 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d045e78sm386135ad.51.2026.09.21.16.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:59:56 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 0/4] rtnetlink: dump link-layer multicast addresses
Date: Tue, 22 Sep 2026 08:59:47 +0900
Message-ID: <20260921235951.3214-1-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ip maddr show" prints link-layer, IPv4 and IPv6 entries. The IPv4 and
IPv6 ones come over netlink today, with IFA_MC_USERS for the user count.
The link-layer list, dev->mc, is only exported via /proc/net/dev_mcast,
so iproute2 and other users still parse procfs for it.

This series adds the AF_PACKET family to RTM_GETMULTICAST so that the
link-layer multicast addresses are reported the same way. Patch 2 dumps
dev->mc in the ifaddrmsg format of the IPv4 and IPv6 dumps: IFA_MULTICAST
carries the address, IFA_MC_USERS the reference count and a new
IFA_F_GLOBAL flag marks entries added explicitly, the "static" column of
/proc/net/dev_mcast. ifa_index limits the dump to one device and
IFA_TARGET_NETNSID selects another netns. Patches 1 and 3 update the
rt-addr spec and patch 4 adds a selftest.

AF_PACKET dumps returned -EOPNOTSUPP before, so iproute2 can keep the
procfs fallback for older kernels. The iproute2 side is ready and will
be posted once this is in.

Changes in v6:
- Move the dump to net/core/dev_addr_lists.c next to the dev->mc
  helpers
- Stamp cb->seq from dev_base_seq and check dump consistency
- Let an unexpected dump error propagate instead of skipping
- Check for an address only present in the peer netns in the
  target-netnsid selftest, the peer and local ifindex can be equal
- Document the ifa-index filter and the zero header fields in the spec

Changes in v5:
- Filter the target-netnsid selftest dump by ifa-index, a new netns
  also contains the fallback tunnel devices

Changes in v4:
- Reset the resume offset when the device the dump stopped at is gone
- Use a tracked netns reference (put_net_track)
- Say ifa-family must be set in the spec doc, drop the AF_UNSPEC remark
- Close the netlink socket and guard the checks in the selftest
- Drop the Fixes tag

Changes in v3:
- Report the static bit as a new IFA_F_GLOBAL flag in IFA_FLAGS
  instead of IFA_F_PERMANENT
- Support IFA_TARGET_NETNSID and test it
- Describe global_use accurately, it is also set by dev_mc_add_excl()
- Fix the target-netnsid type in the rt-addr spec, as its own patch

Changes in v2:
- Always validate the request header, not only with strict checking
- Use a single "with" statement in the selftest (ruff)

Yuyang Huang (4):
  netlink: specs: rt-addr: fix the type of target-netnsid
  net: add AF_PACKET multicast dumps
  netlink: specs: rt-addr: document AF_PACKET multicast dumps
  selftests: net: test AF_PACKET multicast dumps

 Documentation/netlink/specs/rt-addr.yaml |  19 ++-
 include/linux/netdevice.h                |   1 +
 include/uapi/linux/if_addr.h             |   1 +
 net/core/dev_addr_lists.c                | 177 +++++++++++++++++++++++
 net/core/rtnetlink.c                     |   2 +
 tools/testing/selftests/net/rtnetlink.py |  73 +++++++++-
 6 files changed, 268 insertions(+), 5 deletions(-)

-- 
2.43.0

