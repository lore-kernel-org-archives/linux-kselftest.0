Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122B03783AC
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475887; cv=none; b=RXjNXtiZjePC5HLwCiVTgnzLQg5Y0XpmNB+maHrpS4fOeAL3hn9ponIjH82VJ28/RNCTn+99sg8xYaKgOqclUIvRDqcDda6OFcbFHYU5ZJGKNEvohhIFGPDAAr2uYk/LkoWMyaz1M/CNRmiItgfWKYymtP7LoF4gzV6EOKm86XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475887; c=relaxed/simple;
	bh=Spbw5+FwnAD1Te86LZRFTidv12kPXHlIeSpjbXHRsAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbVXNQPsmZOb/1oZn0yNZ7luCjB3zSH1Yv6scXJUOx/bYmPrM+9jBi+97u+86REzs1U3hoqz++yg8ZRqwHanfsQ8HvllhzDsLNFu91NtWFa30zvnNxDejK4tFTgMjRX4dpVm/uJtt8KAIZowpXfdiNGYzQPAMpluDIpVsgHE32M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso105947225e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 08:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475883; x=1778080683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g3lBM/B1h9yI4BCUe+xp9frAHx+qvXrSW9JLGyPZkQ=;
        b=afAA5C8BP96ui0OZQTG9clxeKD6dgOxxYtjyVBoLNRWsQity6/Mi9GI4wUW7YzsVph
         O7PWYUAMyFh4VQssNW7CiGcTyM6WxeK1R4idLz7LRYWXSLhqP/JpbatGT/Ir7NbMiiSe
         lg8sVjxpP5ALLpuHvrCITPKedb98+qXvuKHezlzz9C7CC6KdSWX0P1+ZBpWKBV7J3b+f
         a/4jO7UUxwGb9VIb61JMI8+uZ/ht7RArQM6B4itn/toNNv0Dc1TNuyi8XVSsnzdwQVBG
         Lm3EC+Cyd2NbvrrVWzhX3Kj5HZo8eCG3sGZNVmpMvb7CAtMUp78v7987ig6AI90J0Zow
         rlOg==
X-Forwarded-Encrypted: i=1; AFNElJ81dUwoUZ2NTK+vYV0ene8moyVkl3vOp6ITXnqbxnXqXhDBkkWJsNnNtLHGeut2QdZcJGIC0kUUpQiiXJ1Pyto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPsXkKI4k4/Aft/FSSwdrx/nJGPI+qHLNgOI63otbuq7JMbTX
	88C15vJxlJ7Pf0ZI+H1MncNqv3h4l4rC/rxSu/b8jLOc7fV1/fcsM1uC
X-Gm-Gg: AeBDies8BLB3vnTNkdnoGAhiwziQVnE8sPjOMQnBI6vwDFLE9MEJi+PjD3DFz6IjkXu
	/OfCbfRH5WwsNXQrjO9Uv6Y3bue7ehbUUujI4pOqcp4SnvaF3pkk7bmlJ6JEYV6utULSXP0aBdc
	/l6Mz3qSn07OpRyPyX6+ylF49WF5eq6CwoENZbPNBqYbe8h31S8ExGFuxKsXaj7hx6N8RRtiBx6
	BSROEkWH97v1fItc4GFLN/SwHwooKeHwzekeF06babp6dzn2mPMIh6VRlsWXfyErOuzIVLsto1n
	owM5DWTClPVEXnTCCIFjF40lFH4eg8ZJix2gFQQ5+F5AcrRS+zbvn6xQXCaG+K6BZm0a+mw9XK2
	e0EviOWKD7/+TvQ6POmRw8Q9yBffR1wHCr6/jNKQhy2ErJdgzOG+RjxtDBzce+WvpQg6jckHQbn
	U2JrTCFsLhpZYGpPN4c9nQSGGmKEmrlW8SLrLgoT9Jnm3nDFoJtBIQri6o+wpJrjf73eLBbQ==
X-Received: by 2002:a05:600c:a110:b0:489:1f3e:5f69 with SMTP id 5b1f17b1804b1-48a77b176f5mr97415915e9.18.1777475882817;
        Wed, 29 Apr 2026 08:18:02 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2d3811sm32358165e9.3.2026.04.29.08.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:18:02 -0700 (PDT)
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
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net 0/2] openvswitch: fix self-deadlock on release of tunnel vports
Date: Wed, 29 Apr 2026 17:16:35 +0200
Message-ID: <20260429151756.4157670-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two patches - the fix for the actual bug and the selftest that reproduces it.

I missed the self-deadlock in the original patch that introduced the issue,
because testing required code modification in the ovs-vswitchd to force it to
use legacy tunnel ports.  I thought I made the change correctly, but apparently
something went wrong and the tests were run with the standard LWT infra instead.
The selftest added in this patch set will at least prevent this kind of mistakes
in the future.

I mentioned, however, that these tunnel vports are legacy and not actually used
by ovs-vswitchd.  RTM_NEWLINK + COLLECT_METADATA is used in conjunction with the
standard OVS_VPORT_TYPE_NETDEV instead since 2017.  The code to use the legacy
tunnels still exists in ovs-vswitchd however, but only as a fallback for older
kernels and we're planning to remove it in the next release.  I'll be sending an
RFC to remove support for these legacy tunnel types from the kernel, as they
serve no real purpose today and only increase the uAPI surface for CVEs, but
we need to fix the known bugs for stable versions.

Ilya Maximets (2):
  openvswitch: vport: fix self-deadlock on release of tunnel ports
  selftests: openvswitch: add tests for tunnel vport refcounting

 net/openvswitch/vport-netdev.c                |  6 ++-
 .../selftests/net/openvswitch/openvswitch.sh  | 37 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 10 ++---
 3 files changed, 47 insertions(+), 6 deletions(-)

-- 
2.53.0

