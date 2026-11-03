Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702542;
	b=0jmoqICQd82WPjw4NCXYsEptlOOjm3Ur0r1qeHBCtEUwUg2LnjC0hxQJDyTqjoojgXtX
	 5+wAJ5wWyQHE2limJY0oOBqoSW/D6glm644yfzmv1O/yuoGcbxJQCO4vv1VmZoDe/mYOf
	 xBC6JYNTQvCxYPRBMBnFF+g/IlHcY56Yt1tuuRs5nELcJYfkCkI11HrTeu5IkrXaM7xjK
	 tt/uUckDPjx6GpY3g1/K/mScMV8wLvYbHhxQf9mvw/Acml5mELmjPaiI4rA2xBBLq5vgr
	 Kh+X81wRM2AJPyhEVsT3B+VI6VWnK5aQHs0Ymj123IUomilWn9K7bIupzjQadpLtoaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702542;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=QhNR3Po97MF9R874Cs9wHXXLXgG9MKZ5vAmEXZ16U6o=;
	b=w6t10zGHvSsM3zXWvW8BMPh3ESTgdQWQPZ0DJRDxvzaJVMBIMKTxMn1GmJa4v1ACa1Wn
	 z5HXIpMkdhJ2pOIV0NIPTx/x6F/xpAhPr7megJfHpkQdRAYpeQkvVGqc6HA/mqiixKhHw
	 uo9HX40evurK5ZLi0mG95UnUfHPudj93JjWCVuU2vqX9fjO3jprWCsrt5WOZtL34y5mSF
	 Iz2J8DXoa3uffCooXs7UWzFMwGRPiiRPmL2jNqNFh4PX6yXsUpw6gWthi640l3tgD44JZ
	 XAGIGqQhbW9x5R5awG1sAtL9qDYHRtPTd8ZINI7FjM0cWEuY3ZeAT3aSE9i/d1ofeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=E+oc8t8M;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA6D606D82C;
	Tue,  3 Nov 2026 10:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA6D606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=E+oc8t8M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=QhNR3Po97MF9R874Cs9wHXXLXgG9MKZ5vAmEXZ16U6o=; b=E+oc8t8Mpj32IyBCA0ukZmBz/r
	8B4chCsnHONSIs09h7Rfl/WXJqP/Y2pUbDbVwD11ObTyWQogojmYjnLdZWBWaW3BZNCud3qmIHDJD
	LIJz+RCus9NE0AT6w9DaspOPc46srJ583FSq2JEZ0rvbGEHHkd8iz4qR8xwVRkFG7xBxvohrGTEF1
	LJsxqh12Xy6pxP6XKsJar1lUtdZfd5xvta13IrDtGj/lG9TqbdiEmR2ARm8oenpZ5ahPx7LxWFiYC
	xpyX9od4J6jRPIMf+m4ZIFiLqa8RnM9On6jG0mWg3/x5zUDLLdl9PRjlOMwCTPYgY32k8jnLPND/C
	x6RxxVhw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOBy7-006sO8-1r;
	Tue, 03 Nov 2026 10:42:19 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 02:37:50 -0800
Subject: [PATCH net-next v4 5/5] docs: netconsole: document rate limit
 feature
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-netcons_ratelimit-v4-5-b554c27ba27a@debian.org>
References: <20261103-netcons_ratelimit-v4-0-b554c27ba27a@debian.org>
In-Reply-To: <20261103-netcons_ratelimit-v4-0-b554c27ba27a@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6081; i=leitao@debian.org;
 h=from:subject:message-id; bh=3APHITqA3pi74DTigtQLSzRZ08LNZ7qlYhrwAAIs07w=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6bprxYkNilhD7F5NE6LcG0/3hsVHHcp7UtYJn
 cI7VDunoBWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaum6awAKCRA1o5Of/Hh3
 bcNPD/9gDcuf+tW3kZ3fZqLHQkHLr+MjCqym4QE4vnX3xd14nxPPTSlWt7Zhkio6rV7RMJS0gas
 GyDdiSU+aN1jmOKcHvbGJ9oU1JBV3QNw2USfUSoDd6oxywTV1vBxbE7mFNrwtf4jzRN7xxtXjCJ
 uU6C9usaZd4kWVjnjvDv+e3do+1LBYchGMUSaxGotL8Xp8cd/Dg7zgjRFma2ZwAY+lTLvR92oPr
 FXo19u3uPlMri0hPAGL29njcy8U+RxBb16rJuMdoD9X5LpDJRoB7kcIKxHrU9rCjkR8JqazbB7L
 JnNYvb3k/WzeQmuiNZ96eQYKN8dtjej8QMcnevPqsbAQon4gpmVcTXNuxwFOtEjy6hAyJh7HPdE
 xPDUl3ss7LzVc5/nLTllHN8ZOncnDJNtSgNSnqa0VuQDzr7MNH3AyrFDnrMj4p5uY5NxXGdp/d0
 nHrUbT281pDITT+Fz49lI1TCnvBZCqwcJ6J0pD/3D88GgzEHY0CVY4/woM7gvIHTQBIxHeN7CNL
 JuCjcVHCvhn9lhMEMFj3cYs/dq6C4n/LgEnwXZiYVHJQrTs2CJnQKcr2e10zeb4AvlgFXOOCyhq
 x8lnnN4rbqZcvqU+flXFH79mPfnLLOlVrAQm7q6CdMfdwvMAupdFmd/kuN+MKZwKkBw1l/Lp3z5
 n5QYMwShwzEA0MQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Describe the per-target token bucket and the two configfs files that
drive it: ratelimit_interval_ms and ratelimit_burst.

Spell out the two properties that are not obvious from the file names.
The limit is accounted per message rather than per packet, so a message
split into several ncfrag packets is never truncated by the bucket
running dry halfway through.

List both files in the target parameter table too, and qualify the rule
underneath it. Only a disabled target can have its parameters updated,
these two aside.

Note in the message ID section that a message the bucket discards never
reaches the counter, so those drops leave no gap in the IDs.

Signed-off-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 Documentation/networking/netconsole.rst | 71 ++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 694bca4803d50b..82b5d169d200aa 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -127,19 +127,21 @@ To remove a target::
 
 The interface exposes these parameters of a netconsole target to userspace:
 
-	=============== =================================       ============
-	enabled		Is this target currently enabled?	(read-write)
-	extended	Extended mode enabled			(read-write)
-	release		Prepend kernel release to message	(read-write)
-	dev_name	Local network interface name		(read-write)
-	local_port	Source UDP port to use			(read-write)
-	remote_port	Remote agent's UDP port			(read-write)
-	local_ip	Source IP address to use		(read-write)
-	remote_ip	Remote agent's IP address		(read-write)
-	local_mac	Local interface's MAC address		(read-only)
-	remote_mac	Remote agent's MAC address		(read-write)
-	transmit_errors	Number of packet send errors		(read-only)
-	=============== =================================       ============
+	===================== ================================= ============
+	enabled               Is this target currently enabled? (read-write)
+	extended              Extended mode enabled             (read-write)
+	release               Prepend kernel release to message (read-write)
+	dev_name              Local network interface name      (read-write)
+	local_port            Source UDP port to use            (read-write)
+	remote_port           Remote agent's UDP port           (read-write)
+	local_ip              Source IP address to use          (read-write)
+	remote_ip             Remote agent's IP address         (read-write)
+	local_mac             Local interface's MAC address     (read-only)
+	remote_mac            Remote agent's MAC address        (read-write)
+	transmit_errors       Number of packet send errors      (read-only)
+	ratelimit_interval_ms Rate limit interval, milliseconds (read-write)
+	ratelimit_burst       Messages allowed per interval     (read-write)
+	===================== ================================= ============
 
 local_ip is optional: if it is left unset, netconsole derives a source
 address from the egress interface when the target is enabled. Writing any
@@ -148,7 +150,8 @@ automatic selection.
 
 The "enabled" attribute is also used to control whether the parameters of
 a target can be updated or not -- you can modify the parameters of only
-disabled targets (i.e. if "enabled" is 0).
+disabled targets (i.e. if "enabled" is 0). The two rate limit parameters
+are the exception, see `Rate limiting`_.
 
 To update a target's parameters::
 
@@ -182,6 +185,43 @@ You can modify these targets in runtime by creating the following targets::
  cat cmdline1/remote_ip
  10.0.0.3
 
+Rate limiting
+-------------
+
+Netconsole hands every console message to every enabled target, so a host that
+logs continuously can saturate the receiving agent. Each target carries a token
+bucket that drops messages once the configured rate is exceeded, controlled by
+two files in the target directory:
+
+        ===================== ================================================
+        ratelimit_interval_ms Length of the accounting interval, in
+                              milliseconds. Zero, the default, sends
+                              everything.
+        ratelimit_burst       Messages allowed per interval. Defaults to
+                              10; zero drops every message once an
+                              interval is set.
+        ===================== ================================================
+
+Unlike most target parameters, both knobs can be written while the target is
+enabled, which is when a flooding target most likely needs them. Either write
+restarts the interval with a full burst, so a new limit applies from that
+moment on.
+
+The limit is applied per message, not per packet, so a message big enough to be
+split into several `ncfrag` packets is either sent whole or not at all.
+
+Crash output bypasses the bucket. Every message is sent while a panic is in
+progress, and an oops or a BUG() turns the limit off for the rest of the boot,
+so a small burst cannot cost you part of a crash dump.
+
+A drop leaves nothing on the wire. On an extended target it shows up as a gap
+in the sequence number the header carries; a basic target has no such marker.
+
+Capping a target at 500 messages a minute::
+
+  echo 60000 > ratelimit_interval_ms
+  echo 500 > ratelimit_burst
+
 Append User Data
 ----------------
 
@@ -364,6 +404,9 @@ indicate that a message was dropped during transmission, as it may never have
 been sent via netconsole. The message ID, on the other hand, is only assigned
 to messages that are actually transmitted via netconsole.
 
+A message the target's rate limit discards is dropped before the ID is
+assigned, so those drops leave no gap in the sequence of IDs either.
+
 Example::
 
   echo "This is message #1" > /dev/kmsg

-- 
2.53.0-Meta

