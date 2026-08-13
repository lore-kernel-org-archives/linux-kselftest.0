Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBB3C2781;
	Thu, 13 Aug 2026 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622674; cv=none; b=Aiu2+hxC5Tw5gYk5OYYYsjPF4xWGDIkh+7LzOgv/iZskomqxBqFjXcoexm4+Rplbrlx+52Sg+EKi3RIYEUBnIzLQgMYSRrnuo9vpGuzPUSYkreuC1HIYkiYL7iyDyBtPQiRVoDBSNJ23idjVpSsHAxYKv8uQS/OTnIchykPN4bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622674; c=relaxed/simple;
	bh=+JB4P/ukYYFbVUKqSKinRpoGAuSCF0lBUnywqCYtu6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LgbhW6JVtMSaNGyWrdcpUQfe3QPJAAB9kTNTOVzllvMySLKS4lEhrM0Bodsb2Mm3xGcnCY9ltNHFW0RgtINhj7hCHzP1uFfXCt84BvhG0CmFeE6diCO2UdYiqZKjsgrHfkFaxzphXLjTmFauU6v971Li2angav5FbXv9hVBkBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=dFsqRd4z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j1suOg+R; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="dFsqRd4z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j1suOg+R"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E93727A00C8;
	Thu, 13 Aug 2026 08:04:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 13 Aug 2026 08:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1786622670; x=1786709070; bh=9a9g36VeVENJ45arNPuWE
	4C32eE7QVXHzJNO8Byp95w=; b=dFsqRd4zzcuYXrnXWOqClwi+fOMnPNNEAhKBv
	i0SSkk+TWrAtKMiqtoiT/jepojanA5MGcmU/H2uxZN2i+sZ0Yvr7dxVZ3yDA2gYi
	sispe2QM6FImrxrP0rMId7GHSJsbz0DvyTMWutUQZcTzb0n4iSVjoTePKmpVK1bG
	E+Gq0CVs1Wnbb6ooDi8bIndj7KuYQfu5AMbtDt6m3HbPSvxd9kIhBhwybBjU3Hm9
	r+KYxkQ/hszrLokNT2j3jh2gjgxYHWOLGavgdnpDxlV7cHoj+qGjt3/t4mF05sFK
	tv6I1FtwD1eTorXhvUtUOe5s8yI957WKn7s3V151y4sOT01nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786622670; x=1786709070; bh=9a9g36VeVENJ45arNPuWE4C32eE7QVXHzJN
	O8Byp95w=; b=j1suOg+Rm3im2Kc2Ohd1y3pMIKWBUGD+mTtw15hS6VlZIJBCogS
	aaFcLez0BkKeIH0ZEvmkYFkwHPZyL0c38X9XK3g/XG5EODA5Xui+OtzrOjtIMxNc
	cZYc7a6+1wLGtdln/yChXTadRMPCk890AcOmWPaarwIdhAhS71UrX8HMrGP6QWwA
	cBS02l0N3F3bCKGeoRy/Bi8PTeBigNEXUB6n9TkqbQ2crWnEeWOOV2QHG5Hu+5vE
	NjxTrWY6VkPzD5yVMb+vLCtMopn00LZ/uExf275cJIWNzeQDJaO4UyipHbCULB9r
	94dKF3d4ZxVFUtzGsnRO8jZgjzK58JGR2jw==
X-ME-Sender: <xms:zrJ9au86J0YHvqao4iHQb3HIbOQnlK4dDzOAMx5Azutg8GCVtWqmzQ>
    <xme:zrJ9aj4Ze-QuD4v9BkAwuaeatfdC_kMs-cGNF8E89fJNAcnhpTjIKFXHQ-I4f-QJR
    BFwjY9EiSKOfdo8Z5Wu95IxUEhQvSALLGgB0-5JdP7JOhPpo3jkAPim>
X-ME-Received: <xmr:zrJ9anb7qQkVdtQZ_a18ozXY0p0WBYWceXwqZqxTbJgiUnipwBwe1LStJkw>
X-ME-Proxy-Cause: dmFkZTFKuX8wHJfjRFK1Mdbd5c/vADgmeTMbbMoTB+DVigqkcpQrX/eN2vn0gkeLRvHGP2
    Ta/crjBhszcfC57iNL4ouZC+muSZ9IXVSkQWP9q1TTqAklbs4ls5PWJkaN659ZT8VMCTH1
    jk63ZOhkwwRGVqeJQj1T0yRbEFWCfL6K48v7g4r78GDVVEXqNMwUz9nZm+52v3IL7wDQRK
    PFgkKdrx/yF8DNbEE+we2K/jhJskulWfAL9+VLVbvAHMmY1Jz6NC0Vum57KCxqeVhU7oaZ
    i+hNPoGtuKY0YvDBxqlfv7fkE3nuIOrWQOsJUwBbXSKfRxr3ZMue2Mggsm8XNoxKj0OFDm
    2Rb2JFHMKN007HweHPeZbcr5fsKxuoS2v7pNuJgP/JH1mgOLK1RU0r6qwsaiJdDoIUmncD
    5MrScErXz4A3CIHTyH7U6nVdfYVlWjvxalJONpGIAIKzzkBcHHZfoEBkGOOTZ8Ch0i3rNe
    Nc5e0rsMjuDah5drJVAWLFq69S//SA8esMJRtBlH4GML7NphbukUrP5+q/d7BJI88Tzklp
    RX9QGG0WKMio35c0vpVujxfhv64WA5cCcRFCu1OtXZlUSS3I6wZZ0DlWAq6rQNTFKki+He
    QVz4q/Q5v/gQwVabrb+xI8oouGPwf5puPoxp3/8+aiaqvXo4pdiZnF2aO0Tw
X-ME-Proxy: <xmx:zrJ9al9UMpij4oB4kxkKW5t43cb_o78d8wnW_esZI83OSiQTOhvbog>
    <xmx:zrJ9auTZShH2z5tnOXt_H6xGitdkYPjNfjMaloW3ScytcyHWPAe6ww>
    <xmx:zrJ9agIesnNqR5kUxpWGd25KgGHAwHESxG5vdAYgcHtfa4uaOhB6kw>
    <xmx:zrJ9agQkYPKJ_CX6SjQzUFhWlYb-XCCB_ZNeEMtlZcuxkVl44XHHqA>
    <xmx:zrJ9alVGAvoOXz4jqdFtGhpDG_v5Telgcr3LsDErzvyx55PixODlSZIc>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 08:04:28 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>
Subject: [PATCH net v2 0/2] Fix UDP length overflow in edge cases
Date: Thu, 13 Aug 2026 15:03:49 +0300
Message-ID: <20260813120351.2807829-1-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

These are fixes for rare edge cases of 16-bit UDP length field overflow
that might happen on netdevs with MTU >= 64k.

Exposed by the new WARN added to udp_set_len_short, reported by syzbot.

v1: https://lore.kernel.org/netdev/20260805205957.1652619-1-alice.kernel@fastmail.im/

Alice Mikityanska (2):
  net: Fix UDP length overflow with PMTU discover and big MTU
  net: ipv6: Clamp to IP6_MAX_MTU in ip6_dst_mtu_maybe_forward

 include/net/ip6_route.h                      |  2 +
 net/ipv4/ip_output.c                         |  2 +
 net/ipv6/ip6_output.c                        |  2 +-
 tools/testing/selftests/net/Makefile         |  1 +
 tools/testing/selftests/net/cork_fragsize.py | 77 ++++++++++++++++++++
 5 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/cork_fragsize.py

-- 
2.55.0

