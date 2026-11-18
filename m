Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794989456;
	b=4O6FHcmh55SS2/xIKM+vMSJBDfZwSlWX/MNEUxHnLzJMNudswJw0QIqv2gc/ahxyxAkf
	 YlzJ5EwmQt+c/elZIZucTgfnh2T91ij8Je6W9rj/sx2vN9DQOmBHXCeukP0D/kXzbK4Fx
	 7Nj27VBRY/qVFq1XQZ6OdwBNz2iQzT66Hgd2wiHLU0JqvsTfzzqzS1cAnieMnHEAsAihM
	 2TDW0JsECr40c+RxscPY7lbxIBcM3N+Yw+PRf4KASN8MLVj8qa7BzVw9kYZd89sey2h0P
	 cP2nqJwHMhMfWuKV5PltTBl1ieuXVpc+qW3f4EE3xCHTtqU3iIr1PJZXswbiQoHusdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989456;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/NpcbjWSUChqv+cvOMiA6HbBw2XREIxDhCy3LbF2ABk=;
	b=ZPZTrknFtWdTOY1/pBf5pAJ7I23214rEIthXoLS3LIzwo7+SS6GLoeLwicnX25CrwjYJ
	 7NvnM5JYTntanch5WK4fXd4iXzsTrUYujgDVc3vvSpQx3ben4tJdC58bGA7yzaPlyMUNG
	 WSH7dmZQxJacPQeqFQlRYIXkWCvcrKR9PuMkbrKPp51CdIqbfnEsN62PojVVnegcZoRUR
	 Vph1gQmUYD3Vmwmb0qTY2vBNbBgxmA6NpHIHZjaWG6npr+VEpR6RsMsY7LBuqpHU3DRxy
	 aHXQiLf5GtccYOuJfBguLmSUOh7B1wIZfhXPhfQwLqW2cvl8j0woaOWPohkSdz5mobw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RKH0mxUO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA61606A31C;
	Wed, 18 Nov 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RKH0mxUO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794989455;
	b=Zhms7/di3DRoi22sOUN6/8lVbuh3Nndf1+OkN7PtapQcfc4U4ifWYcei02AApX3g/A3/
	 WEPEPVu7qf4wwOqlzCD0uLTGivCK6eaCyq7c3D6agMHtp1rFtARUAAnwU2IOP8U6AQYTG
	 taRQtaU5Gr12uJ8UoRfTlJAV/TswHoz5zgWTMFfP/82HieAEUxlFuryrMp19hza+ENh3d
	 +OURY9cDtLLxWQkHEdlnijjArI4Zh+tjaT+i0wyAfyGi+cFeXav1HAGE4CXuchWjV+ytT
	 aU+YQ+tznx4TjzCfZYKaaI3gikfA5B2/mxXqJPus6mI3T/gIeyc3BPjyy83TNeqDSjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794989455;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/NpcbjWSUChqv+cvOMiA6HbBw2XREIxDhCy3LbF2ABk=;
	b=s7/u7goyCnHIpchxMk5LN3AEbz5ovhSL2s5ZLqacBOWmL8AYubNMJziof8XT86SMGDpn
	 tguOwSQqnc1z1/zSlvqjGBzhkxa4S+HGo4EqUF1S01rEAzHcQrzgKTGUwGfs5cCT0zRDM
	 R36v31WXb21w7fAMsoIdSS6w6YT7bdpL2iKUSppsmVYTsYGGf67AcXPKaJdINGMBy6612
	 DUM8tmwj9CMRY4LqJ3HDCH2dwMVmpE1zw4H/pUZknSG8BpywLl7adq1/aLVX2pafDc7Db
	 DRqX/RPV71IG47EuNzbH90PH7zqgUGvhy3sl1FOY8UEPdGtwZvhO5+0vQhpyRpWTkjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FD161F000C5;
	Wed, 18 Nov 2026 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989455;
	bh=/NpcbjWSUChqv+cvOMiA6HbBw2XREIxDhCy3LbF2ABk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RKH0mxUOqBSs7+f5Xppogi8HvUfVGBO26MYqpW3CXbQ3XR4/NBtNpwVjbN5aUk3ep
	 zyVD4jBmksm7cNl1jRlfm/zFv20Tt2Vz/62h5g2vkCgNhwg3dUdSIVcYkTU2Lo9fLS
	 4LkmTwuXN2A6ncbK+Tpu6Jcra3yN5YrbFekTvtSGYaklF0eIJYyqGtNfvCdsL2d9qz
	 Fk87aek0Lv0qAK2jxcmvbnf0cXE7gwDoG7KtJbiXmywEHVKXtyd+YDmjL6+J8PT0wf
	 VJuUClHRsVI2RkUYZbJiuE28BbFMdT6nOZuidwjGPj/DvErn8HJdK+JkTMu8hsTFj/
	 PFjcQYMxkp6Yg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CDE744AC91;
	Wed, 18 Nov 2026 08:10:54 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 16:10:52 +0800
Subject: [PATCH net-next v2 1/2] tcp: document black hole detection for
 tcp_mtu_probing
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com>
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com>
To: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, 
 kuba@kernel.org, shuah@kernel.org, pabeni@redhat.com
Cc: Yongjian Wang <echoowall@gmail.com>, rdunlap@infradead.org, 
 linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
 kuniyu@google.com, skhan@linuxfoundation.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794989453; l=2444;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=ta6f43Q9WCijtV9U1XrIJWYCHAQ4FrHJdfRc+ckR0n8=;
 b=S4lH+mwLEmJOlG3gNxDU33WKSApX7xGkxPBbsThKzrn0lyRgQxF6BY/IaRIex1VXZzX6Fqylt
 pTvvDpGU65vABIK5GKvo5VMuNv+z+nFeD26bUy85582xk+RWcS4iIyj
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

ip-sysctl.rst says that tcp_mtu_probing=1 enables MTU probing once an
ICMP black hole is detected, but not when that happens or what TCP
does then.

Describe both, as implemented in tcp_write_timeout() and
tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
and tcp_base_mss.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 Documentation/networking/ip-sysctl.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 0b7bfbd98a92..6ac8b3fb9aae 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -412,6 +412,8 @@ tcp_base_mss - INTEGER
 	Path MTU discovery (MTU probing).  If MTU probing is enabled,
 	this is the initial MSS used by the connection.
 
+	Default: 1024
+
 tcp_mtu_probe_floor - INTEGER
 	If MTU probing is enabled this caps the minimum MSS used for search_low
 	for the connection.
@@ -711,6 +713,25 @@ tcp_mtu_probing - INTEGER
 	- 1 - Disabled by default, enabled when an ICMP black hole detected
 	- 2 - Always enabled, use initial MSS of tcp_base_mss.
 
+	A black hole is detected when the retransmission timer fires after
+	the handshake and retransmissions have stayed unacknowledged for as
+	long as tcp_retries1 retransmissions would take with an RTO starting
+	at 200 ms and doubling each time, which is 3 seconds with the
+	default tcp_retries1. This time is counted from the first
+	retransmission and only checked when the timer fires, so a flow
+	with a 200 ms RTO detects the black hole at the fifth timeout,
+	about 6 seconds after the original transmission.
+
+	With value 1, the first detection enables MTU probing and lowers
+	the MSS to tcp_base_mss if it is larger. From then on, and from the
+	first detection with value 2, each further retransmission timeout
+	lowers search_low to half its MSS, keeping it at most tcp_base_mss
+	and at least tcp_mtu_probe_floor and tcp_min_snd_mss, and lowers the
+	MSS to match if it is larger. Once MTU probing is enabled, the
+	connection also probes for a larger MSS, as with value 2.
+
+	Default: 0
+
 tcp_probe_interval - UNSIGNED INTEGER
 	Controls how often to start TCP Packetization-Layer Path MTU
 	Discovery reprobe. The default is reprobing every 10 minutes as

-- 
Git-157)


