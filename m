Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64361366042;
	Thu, 13 Aug 2026 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622683; cv=none; b=aENjXF0F3rkNBjuKKtn4ZlDyMXJXZc6qXBW/HdEaLe+dAA5XdoZ2WCcG2n+IIMRL2BzoeWGV6IkvZGu6s20EowSZT9CiizaMphj/5MZkd/Q0SMRnVQvtloGD1GCk2lTd3wzcV5q7GJAg9Bq8mI8MMmkWc9qWFE9/NyujiM2YLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622683; c=relaxed/simple;
	bh=+2bb1DEpsXOX5tNT+KJy5YjEo5qzpLPzb7BZHVBxkew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G103mqgMvkKmwbKSOs3AlCYBnn4L4rtc3E7lNJWAWDpWxk39sVUiksd6iNj7kfJGZAAPvEGXhgq1k2ENqdEO8PMzySh94v+0x6t17rC8F46YDlN0T4dzZJDkKVjIXgtL8naNMUyP/X+rwhaFsg6yak1rDKjXr5Ert6r86hwIXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=kIGNoZ9X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=URdRJ84v; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="kIGNoZ9X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="URdRJ84v"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 684C97A00B7;
	Thu, 13 Aug 2026 08:04:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 13 Aug 2026 08:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786622681; x=
	1786709081; bh=2TWS1+3v0QVto2rW8iK5a/xf/uV/OD+QdkwvW7tv00I=; b=k
	IGNoZ9XX61NWYyWyAk8JdlTtCAvTM3Ueh2Z8yVID43WcC4C1JXYJmkmzD57wjLUM
	Gh2GslF7O6zy3DSK2/jyBOhrUsqWvMGdlLiIO5co5LJFCfpzgBGTicjhRVrAVyzr
	76vwRiCKtcseUVTENcqQ2tMO4xUYwbuYfb2JxgOIwGEkj3WU4qEjsaAyrUbSicU1
	gk7hdVAznxYZjTVQX7wIvwT8crdHztmCo670io3qunpovbfcvJnL5LJzoF2R0GNa
	ELGohSgbEJDfKnuLYVyHRgBrLs8uvSHnQZJnlTSSk0YLRkWgOhyA/0sqOhU/RvuI
	b7XZuJtBOssujhf/dOjkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786622681; x=1786709081; bh=2
	TWS1+3v0QVto2rW8iK5a/xf/uV/OD+QdkwvW7tv00I=; b=URdRJ84v90/hCzib3
	EJALYQU5ns0RVBU/uSErY4zdur/2T8jwrwPtJolDDbRJa7Gwhk7ZlnOpimUuLdxa
	i/4CWIu2Va6rO0C4NkyECJc9jcbhjT+Ii3CgzIjWv/FZelaZ8o8g6LakR8rXT7VH
	Kr0ifzNjKLSbVZcKqJE0Ev2ibK5L3nKaOSPGBbSzeGypSRPddLbg1e/S1QsCp1tQ
	cd/302gfSG++2MFvhjJlZszXJOQaCE243BsBELyj6rzqTlkRrHFt6T0ljVP9mYVZ
	Jt8jXhQdD9GpYFpsbZJfBlLxn6irIw6zY7xWkMSZaUCRUOJSYvQtN8qX1MnLVIQC
	YqRyA==
X-ME-Sender: <xms:2bJ9as4U8pUXLBnDaQWe2s8btLBLX0-fy7Lpur0twREPrad8M809rw>
    <xme:2bJ9ajE3LFldu6X5HuZTFy9xHE_5L13bq6yW8M4nJ2t9ZcecjJWmxOFbXh-dZopji
    L2IIE4TTIHAhMbv7TSKZxQHscbYoTP2rN_B2kiDBBjgPyN0sgcoPRA>
X-ME-Received: <xmr:2bJ9au0NADCYoS2vQTltru3kmW63ObX05tiCsfFlEinuD8YQonfZ8ZHD8xY>
X-ME-Proxy-Cause: dmFkZTFXLItT+q8IbL6YV+xEy528T+8x4hka0zrMSCPitpBhuqC7Cgtig6s3qRJm6tiA60
    wqlrRLUHwUl4AHrjyQMwTFw1XmWqrIRr+P7Bucrsnih5NwjX55Z/WkLCLCwyVU2+hCe6R9
    9tQdgesWvIul4ph+Pl4lWAGBYXiVNOeEL2HhaoIPRCbS5P0ZLJSeOEawJ4rt+TzClXeNoB
    YqJ+I5O6xFuSWXF2/yFycbsWwmR4+wmgeiDzky/gIyHMcmjc9QbmC5sVWZz7wP8B0315sD
    lH+tIMhpMibJZJoj3Kgz9ge5wlTzh2lVtrvecEp2ML9zc+qGYyhyWM7Pdv6n4rFC4Pvbbg
    1ecN0Wdxtr66H/RcFPmbcfbySCKcsmhqYu+85il8znvZ5DSvkcwRxNGfZt2r1m/95Wk+I3
    KgUgmzFPKXiK847wECg9/e6FnAHipCd1J8do/rKxbHUgGA9/I3O5f1/xFKLIpW68o9bOmo
    4bc186x4oQK2gVPTPUb6GYThWcp0PyQCgFUGr8f/5yOoDQ9XLxk8tgV9F0q8uu2d2crQOP
    s36TbmvRVZMQyKtMK0bujXli9KM/+c15BHgEy8Q9NHJmeduAhWmaG+6bk3HySwAuTp0cms
    AFdiYR3T3j2gHoYg2JHqkxkbabQ2whC8T1/aFIBbZGceMNHlztSU6m2G8cgg
X-ME-Proxy: <xmx:2bJ9agobI3fC6Gkvds4WSTXaQCwhtZYDzXp6OiogabC-EBgGhiiPWw>
    <xmx:2bJ9arMS8b-kYplAeuwBpQM9aRHsr2VCXvv_K1OgtG1pCWnGw9GFtQ>
    <xmx:2bJ9aiVIVghfQLJwNWLRpV8i7LZnYlF8clY6OCPKX7iry5OoA82Tkw>
    <xmx:2bJ9auuGZewN3fFuj4Ox-dZp4jQQa5ZY0cOs8VP_Y2DYKEt_6SA3uA>
    <xmx:2bJ9aqydCdPl_OUVVaMHbknAOJs5nrilWKhTgsVh0N3-PLgufB75V6Cv>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 08:04:39 -0400 (EDT)
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
Subject: [PATCH net v2 2/2] net: ipv6: Clamp to IP6_MAX_MTU in ip6_dst_mtu_maybe_forward
Date: Thu, 13 Aug 2026 15:03:51 +0300
Message-ID: <20260813120351.2807829-3-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813120351.2807829-1-alice.kernel@fastmail.im>
References: <20260813120351.2807829-1-alice.kernel@fastmail.im>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

Commit 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
dropped the IP6_MAX_MTU clamp that used to be present in ip6_mtu(). A
similar IPv4 commit ac6627a28dbf ("net: ipv4: Consolidate ipv4_mtu and
ip_dst_mtu_maybe_forward") preserves the IP_MAX_MTU clamp.

Restore the upper bound in the IPv6 flow to avoid potential 16-bit
overflows in forwarding paths.

Fixes: 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
Signed-off-by: Alice Mikityanska <alice@isovalent.com>
Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
---
 include/net/ip6_route.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 09ffe0f13ce7..fb59a5885faa 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -382,6 +382,8 @@ static inline unsigned int ip6_dst_mtu_maybe_forward(const struct dst_entry *dst
 	rcu_read_unlock();
 
 out:
+	mtu = min_t(unsigned int, mtu, IP6_MAX_MTU);
+
 	return mtu - lwtunnel_headroom(dst->lwtstate, mtu);
 }
 
-- 
2.55.0

