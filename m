Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D0E463B86;
	Mon, 14 Sep 2026 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387860; cv=none; b=Ql8rDV6fDEDO2DNCTxsvRjGbMcZqfPN0sQUxnwLdyPv4oy7MUxEsX6Mnm24WZdpZwx3jqZHcjXUxqvyvF5z9j2XLy43/sFB+pi4nHGRsKcj2ogrxKs7SpBsStAHpzoWW/3HhMYbNfqABKxCf+B/y3QyIehQvuCQuqhWUAI+JvY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387860; c=relaxed/simple;
	bh=tbCmJto27lZvoHrdaDlAjBK2u9Sy9ypdNQr9qyG8YAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/3P76nRurIqe/R1rMFkfYFNyWMkAHh5HPohv496r22ge6Ehp+w9HAl5OEyxLs/LqQsDxx3AigpUBkUDwmofePRusRYLrPtir+mG2yJAnr3oaphcCTYrIzLOW4kTXTizzC+5pdg+WFz4UffD+XCzD3/4uB19hgSaBV1CCn8qPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=t8hcCBD8; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="t8hcCBD8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=DFvyBMTDpflO+4J/qxAqOv/mmKbukWTA8t09UNH9jao=; b=t8hcCBD8GHn6vMKWb2/55BbkJ8
	aMzYCAypnWhxBmpimfdrxRksKGtFApdfm/E1D2gUfpcIn1tJ8k1pV/TBCSu/pPMcGUgtL9JYT/eeM
	UxtvLr+s5zBlr8qaGxfUXEw1bM+MJxZVPGgnNDZHj6KzffCv66+uzOYqEQDkop0I5R8NFrYfGeHV9
	BIpH7V0Pj6TVatI9G2+xefLgxM0p0P5+cR2N3zUlSLk3/MfpWLLqq7vdOnU3NBrBM5Q6i7DNi0rkn
	AjKLEbzQ5vXjmlUwEV1F+ZB5xzzmP2lScToXs9F/wk26Bk6Q0vezqPTzdN6+CpJYMNqkJwCihVjl2
	slcwuPiA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x65WS-003bZs-05;
	Mon, 14 Sep 2026 12:10:56 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 14 Sep 2026 05:09:55 -0700
Subject: [PATCH net-next v3 5/5] docs: netconsole: document rate limit
 feature
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-netcons_ratelimit-v3-5-8e81b789ab37@debian.org>
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=5831; i=leitao@debian.org;
 h=from:subject:message-id; bh=tbCmJto27lZvoHrdaDlAjBK2u9Sy9ypdNQr9qyG8YAs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqp+QxCVKz6qJI7mRuYe7t79aBjF/GzvIAZFkCQ
 rJeSdto32WJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqfkMQAKCRA1o5Of/Hh3
 bYQXD/9mN6CJiqY6kF0foFIajYJrRoW+V5LMGGgzd+OL4csJYaIGkVtIXqK3/eQmpppm0FYLbl2
 85rl/bdR9Je6m3xhJsODsIb7AIvDyVxRjk2cMSmAFsRI1f82c0X65gKkl2p8RUEr43+Z3MFR/Zt
 JW40RFFVVxF6ApMkeH0ZCxW6fLPxfTkNLU2ThKwfjB+B1cXWQHKo6PR+I23UiQp80Pst+mlF1Ru
 0J5/ASEpd3+li0jITGSaaiJAZeLHE10x5vi0Vc7CfE94nXkg4aGVxBEY5Qx82b3WEJoORoBQ3DG
 VjwLR6PyEknlSMG7rKwcvejY7sB46zjtQnlFaKoeicVo55/G0lu2AddYErHP/nKdK6LSwpjV3Lv
 itKVtoXKIh/6HYs+SA1QNdwVfxZC4YbdqXPwFx0FYFVfnQuyKa2E0m5Y0EG+A+koaDOXzFDeUB0
 zB13x2dE8/FR0cMcnV3u80y2f4y7AMgZg5RbjOF9QbM4QG8wrWw5BUi0qguSk6k5uJ6fMbERVRw
 PrAmSmFFOVMNHpnCi0RRT1b+kc2VbYG2hL8sLjHFs2SdgWZGrBXPpB7p2Or4e0rgyvyQhJWi0P9
 RzA/+J85As+JXRxcr9slTq8W6Y2yc/aGzNXWaTSh7ktyzTRtwb4CiNwez4jv2zTzrCXCzbgsncv
 wBXZ1CkwhHJ1bbw==
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
---
 Documentation/networking/netconsole.rst | 71 ++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 4ab5d7b05cf102..9fe4888fe136b3 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -127,23 +127,26 @@ To remove a target::
 
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
 
 The "enabled" attribute is also used to control whether the parameters of
 a target can be updated or not -- you can modify the parameters of only
-disabled targets (i.e. if "enabled" is 0).
+disabled targets (i.e. if "enabled" is 0). The two rate limit parameters
+are the exception, see `Rate limiting`_.
 
 To update a target's parameters::
 
@@ -177,6 +180,43 @@ You can modify these targets in runtime by creating the following targets::
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
 
@@ -359,6 +399,9 @@ indicate that a message was dropped during transmission, as it may never have
 been sent via netconsole. The message ID, on the other hand, is only assigned
 to messages that are actually transmitted via netconsole.
 
+A message the target's rate limit discards is dropped before the ID is
+assigned, so those drops leave no gap in the sequence of IDs either.
+
 Example::
 
   echo "This is message #1" > /dev/kmsg

-- 
2.53.0-Meta

