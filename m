Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795729045;
	b=TtC0qP26iQjRCtqRkcvw0o9QagPBynWd5+EaWJ+A62v8o6n/x4NP7aKYIRFZ20TmpuJq
	 y7S/tucjOsywm8v7cpoWoURBa3HsSKFjuIYwBEP4VWcoPv0QxU0D5hwwwmUql5mIygOhK
	 LHkrdfoptDAulY8XDfpUVEFdran++WoPq7iQAUeqdatReJlFqrXBvFmKSYVsRvAKqUK8k
	 kmg+/ZC1/MKEANNod8BTW/Ek/pfOdBMm5d+UFku+3zv1yhbUKHjLDZu0Umpbnqf/9WdBi
	 J1UI441qBpwC3daKyP+FP9+VLmb0J5+GStsuRKRQP4RIUBYmh2S8LKEZL/XiSUaaf8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729045;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k9P5r4zRavs9vWI7FzZxFkeTlmp2ngkFeToAzBYyCXg=;
	b=4otioArmzPLqh2GhRHQrq7s7weUpE8J+sX6SIkCS4I6cvm5dErojqVUsXmFIngOv9dvY
	 DZFeLQ55D3LlWXYBWIQ6Dz5AUVZUqwNVcCAHXkM6YqM3dw5E7mw+xZs+hn+F9IRNO1d2e
	 2MVuZH7TlcFRrhWjBe59Z0B1YSzLvOVisdfbf8PdEmYUAxHg4wmoN9y+aG1wDidt5ueeb
	 h8/ZLcbqdHgkXGHZKOcPd///rqKOX4lw8N3AeyWM+2uf9uuvbHT2kkXTC38B5nKsGZBpD
	 sgbQgM3Qz2W0M5AnrLLvU4Qo+I9iinhOJ0Ty17k4iNLOwViERld7TdkV67VryGFXgoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LQwV/OGI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B265A606A327;
	Thu, 26 Nov 2026 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQwV/OGI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795729044;
	b=FNb5s7DWjHMj2pYVoru3/xJWYaxSJCu763MNqiArtmEcYGschy9yiguAfM04Lb66/lr1
	 CmZbNHPfUBXLCLCR6Vki8XbbMUs4ZVCiswD9ifn6w8pW6DH4tDWKu6V1tSuQcmOFjQQdj
	 Zhn6unO5kNkcsPxrh1sHwatR+PQ3hNuD2kmHgn36dk/R2CT5l8jTAzTfF9VYfNfP4Qyy2
	 1c5t5nmdSlgymGBC1SVUqsc+GFKCFtEO+G6dCUqalPRX/vN+eb574K70ZYUBFzLrKHS+Y
	 eDsr9RMJ/1LER2x+fmHiKLQVzG2eEwJinMyprmEv9vVXR4GNqPb/a+KfEN9W34OBdGA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795729044;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k9P5r4zRavs9vWI7FzZxFkeTlmp2ngkFeToAzBYyCXg=;
	b=JAnpY1ZWY8g3IdWac/uSgC8mD7QBwggSGLacvoacj6J5YhmiD5d5127onTyFAQJ/7Z9u
	 zCsLX2wvJf+nMphp6VAS9vJncrCut8OlRIcGqlnNSF3C+Osb12NoHrj8DnvwXDpr0VzkB
	 DhdPMQB/nM/AjBH+gUXCScoNAVokExzzSniYfcoJyzSvPJVvUHP3zKwyIOb/FClZmjgOT
	 dBSr4QGsHenShzIYJpDEGFC/qK93iA/qk3MLKdDiDibUTSVurSMg0EQ5BQC64c0/btvlU
	 29ke8DgE7rKYPb7xgzBD0qlkYtRsHQmdIcak7tcd6vG15y9/sNnnpSkSfrwarX7wd9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D8A81F0089A;
	Thu, 26 Nov 2026 21:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795729044;
	bh=k9P5r4zRavs9vWI7FzZxFkeTlmp2ngkFeToAzBYyCXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LQwV/OGIio3krmgBqoLyUijouKqGfkqypxtiLmA7U/4jToTJvNifj98D7MMyK/uNp
	 /CdxLyrUgxr+DrkCM8rnv3R1agTLpNoQ4p4p8bhWYTBVFeZwdytQS3wgLL44Fidhp+
	 ru6A4ZtZoyrZd58Xh1oKGmWc6Ae7Ig2jNbR2Tck7WEwxINF0ObmlG7zXKekAyB29R2
	 +scFMxhRvsSbBrD5O5GEbLRs2o/pCx7ZAc0nAEL6+JsEiOrL34CsOKJJDPNGmm+To5
	 0oj1Ei6+ZuGYfuzgd1zMCnHDrbEhP6RNAz9eaDZWorI4vqrTfIQEwTjhB1pmp9xO8M
	 r3EDk6ec/a3xA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BA6314D833;
	Thu, 26 Nov 2026 21:37:16 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 26 Nov 2026 22:37:06 +0100
Subject: [PATCH net-next 2/5] netlink: specs: rt-link: add the lisp link
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
Message-Id: <20261126-for-upstream-lisp-v1-v1-2-7382a4bcfd9b@free.fr>
References: <20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr>
In-Reply-To: <20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vincent Jardin <vjardin@free.fr>, Donald Hunter <donald.hunter@gmail.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795729035; l=1837;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=/PetGQdaL3uGENm+cDP7KlWMMRtUNnnGqpSboQO7TLs=;
 b=E90lr2hKe1x4TnsDVNUoOwWTCZltXA4bw9DS5wKuTSk+fWZ6CXchra3RrZninHAl4MaHdgMXe
 z2BSm9SwulKCs8JwJBmfrKl4D8RVhQwABMgwJhTvY8PyZqp9+YHTIeO
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


