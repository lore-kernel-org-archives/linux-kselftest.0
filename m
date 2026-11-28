Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795826516;
	b=mvXBFuMYU7rJjyNKHUvS7Va3S0OaRnOEzx6Ykk5Ejtf+LtcxTbt37jnJjG0fIAilZyNz
	 2keMyv/KMj/oMsALb2xAUx0NdYICy8AXxlC+HtO56xnSXb7Q6vYRM2bLKMIh7DSZ+Zy0V
	 MBqrq2jYpXuDi05sPGlmxT0IR/BN5w9VPsXXqT5booUJQoEt8WjRhfJAz4eqysY+bFnyB
	 d5nOp7Y8V7HcTPlQhkCBoElj3+iRnpiyqQw+3TU2WDEofOv25YLkoRRGsJ03SDj9rA0Un
	 GHDDhQ657Y7V3t8iW723Tir2CHiSf/iBSa3CQNEnyaxW/J6u9dYnKV3lkNnTIyJn/YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826516;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k9P5r4zRavs9vWI7FzZxFkeTlmp2ngkFeToAzBYyCXg=;
	b=bG0DxGyQNoi+VfUP6+DmbVEPGol88f82l5asbwVeqJgu+kMn+RF2EESn/pxrome1Yhj/
	 K0zdRaVsnrQwOOvxRUE0qXlV7xVhLZazeG+UY3keh5c1yfDnF36/ecnndF3wEiSXtMvqI
	 ism1TSbi2BZkWLeJyeA0IPKoWFB6qJcq1+95Aze+HwURneFraJ8fkMRHYaATipsLkYvDr
	 fzZWZt6wQJH/A8JSsrJBBLNM8bJNSJbQSPcfJuCD0j6JSNlb6edkEqUgLCbrTOPneteYp
	 SZiwZPVkw7mmDN7diCt1zTYb7AfLVpinzhadT+iYaJT3p0/Dx37PNWww5gxcfD56clw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WxHO8Sr+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1190E606A321;
	Sat, 28 Nov 2026 00:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WxHO8Sr+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795826515;
	b=WK2v9GOxv4zD/jy1yF5IKgUdQW16d+tMftH/ERmNuDZM7yR+eYS5ienNwvubYd3RW7Xh
	 46y+OCCONa4iEYovagxZslIhOc6W2zLgggwvXPdqiayCXWtRqBp1x6PISoZq9hbnuoeFt
	 Nt8/1IIY9S4VzizpZSQFSFz5/h15/JITx52dVfwqz3bxOw3RT7FpxbyH6zw7hIix6+mDm
	 IkjxbYWVvLwsW48nl/+4nMvXHi/jkftTUWJrwDO54+nbWEx7hOhGBZyYABo0Yy6VqhWZT
	 aXG2XHIbB40quAoUIsjQSxk5EZzQhCDFmgPkxWcJJ02nTYtDfwegPHM6amHi/8K+pxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795826515;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k9P5r4zRavs9vWI7FzZxFkeTlmp2ngkFeToAzBYyCXg=;
	b=eBUUmctMmk1QbXpEM7Mg1NV+JbKylXkQkpbiuAGQZbaSqVkAYGFbSbl8f+sAkpe6kEyr
	 QJs+5GcP1Qu45LtLWHNHn9dYwsdKcDxDkcRBIA/pc9pjCQFXx5a/ACHvhNyer7SKpJ+T9
	 GbXOzCf8ZrXBRkpb2YLIzgLD46vf+hz8HnrFKnZHNCabY2ea+CDvFXMT1IHwZW8blKb86
	 t52wYZHiMTAtNhnctTeii0/ldv/lHdCnrT5EWeVs0PFTK5cA4YflMPCDV2gWJX4oi3CYy
	 wrlpiyDPeDLA1oviBvPX7P9i+7/ni0btbiNkUaop7NWE6flKiH3gPCSJryTJMWKByPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0ECE11F0092B;
	Sat, 28 Nov 2026 00:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795826515;
	bh=k9P5r4zRavs9vWI7FzZxFkeTlmp2ngkFeToAzBYyCXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WxHO8Sr+EGbIzXd2KGDYqMxfDQT4uu+BcUEb5OTJTX0wGCpPn47+aGyw4Gge3uiPz
	 ILTkrJCjPIBzFW2Vhc0VaiJhZJzTFLXZISGBZ5qr/nBmPcO8Cj3945ZGiIISmESj3g
	 0e+uiWbtR0RQbgKlCN1nZkzERt+s3aNbBrPxqvyzfJi3Qb/YyYX/jn0T2YfzQKGXkK
	 o1POtgxEoJMuSVdQtkYfQ2iygHRu/HTQaaSCFUopS/wR7fQeop8+bWJOP8qQRT4Klg
	 q6+Etr/Hl3m2mmZ4EganI0h+v6xZsksKo7ZghdGaVCvgJL3ondsFuC7nxQSNTNv8Xs
	 p64fyr890/j9A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8F9E34DECD;
	Sat, 28 Nov 2026 00:41:44 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sat, 28 Nov 2026 01:41:34 +0100
Subject: [PATCH net-next v2 2/5] netlink: specs: rt-link: add the lisp link
 type
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
Message-Id: <20261128-for-upstream-lisp-v1-v2-2-68e8649c3ed2@free.fr>
References: <20261128-for-upstream-lisp-v1-v2-0-68e8649c3ed2@free.fr>
In-Reply-To: <20261128-for-upstream-lisp-v1-v2-0-68e8649c3ed2@free.fr>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vincent Jardin <vjardin@free.fr>, Donald Hunter <donald.hunter@gmail.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>, 
 Danielle Ratson <danieller@nvidia.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795826502; l=1837;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=/PetGQdaL3uGENm+cDP7KlWMMRtUNnnGqpSboQO7TLs=;
 b=FVkrzQEf9ZBeuUfbrMMS5YS3BhY5JO7XpAzuShXu3dALsVvpupce6vMPIlcY1RoHXjFuHW6bF
 jQtuMRO+9W+DH+4OIIYH8XSC1Y9Mdlt6YEEbXIftrJiPM+lZ3sw9rJF
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

Describe the attributes of the LISP devices.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/netlink/specs/rt-link.yaml | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/netlink/specs/rt-link.yaml b/Documentation/netlink/specs/rt-link.yaml
index 81b58633911d6..30a8e36c212f4 100644
--- a/Documentation/netlink/specs/rt-link.yaml
+++ b/Documentation/netlink/specs/rt-link.yaml
@@ -2368,6 +2368,38 @@ attribute-sets:
         name: mode
         type: u8
         enum: ovpn-mode
+  -
+    name: linkinfo-lisp-attrs
+    name-prefix: ifla-lisp-
+    attributes:
+      -
+        name: id
+        type: u32
+        doc: |
+          Instance ID of the packets that the device sends and receives,
+          24 bits.
+      -
+        name: collect-metadata
+        type: flag
+        doc: |
+          The device serves the instance IDs that have no device: it takes
+          the instance ID of a packet from its tunnel metadata, and
+          provides it when it receives.
+      -
+        name: local
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+        doc: |
+          Source address of the packets sent to an IPv4 RLOC, when the
+          tunnel metadata do not give it.
+      -
+        name: local6
+        type: binary
+        display-hint: ipv6
+        doc: |
+          Source address of the packets sent to an IPv6 RLOC, when the
+          tunnel metadata do not give it.
 
 sub-messages:
   -
@@ -2427,6 +2459,9 @@ sub-messages:
       -
         value: ovpn
         attribute-set: linkinfo-ovpn-attrs
+      -
+        value: lisp
+        attribute-set: linkinfo-lisp-attrs
   -
     name: linkinfo-member-data-msg
     formats:

-- 
2.43.0


