Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEF4A014B;
	Thu, 10 Sep 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048014; cv=none; b=cezWTbxhkH1k5IxZiYZut0Og8fMBaBeDbZnRM3e18G6a5YxnSMAazjy/U6PTNCG81fpNc2MxAKCelkqUkUfx2mtNaCicyXQ7u2VQpVjqqBm6Iv+M8aRpc7xEM4D+zIderY5lf+ahTPo4jWD6yEETo2zniovPS1y6L2YfgOYsZCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048014; c=relaxed/simple;
	bh=YweghrEN35d/HrIQDZzlztjwvxtnA6T6pjRwWdD/VPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsepmUYcPN3wniAc5eRJ6dshPUm8Z8Mq4+6MOyTJy6K+d5ulDL+/Jfg1kez4pm0Ri1UTJUBUgaIZkIInWUV/TFt6DIHml5Siktu67ngXCcbWnmU3BGrZP+fX8P6O2paIOszI4WRAESbjBkE8XyfcDifVZQxCqwkXBLLnzrlZ8k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=emUrnd93; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="emUrnd93"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=6lGdzSD4TWF0V5JshmLHmzYOBwaLk4uPT6kfJ83UM0I=; b=emUrnd93Yuv4NEnksdN6lxuBsA
	tVtnv5Q7g5R6zpN3PRmLr1Cqz5U7IcQ4Tc9f3nGmWu5RuhS98UGEKZJqoUmEUPj5G35WDn65HSI/8
	4cn8mhLBgZcczZrDYuzaEfbb5833XmrYVDfGWOnFxgYeNkKHbcjFwkyVg2Ezzi8ls9i/9zCWxDZmx
	6tgEyp6fffjV5rQiOV9AeKp+IbaMQI3wTcYL9mxN1wfXBXd1QibPLtsPTcYfm+QBHvM7q0tFt49sE
	oRlYZ8LBI40m8arU6D8FkVPDt6rS+EghqVQ+LJpikgQ9HCn0VuTLLpRmpnXLZEFJriiqGBmVvzx5B
	vyiMb9Gg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4f73-000YIn-2e;
	Thu, 10 Sep 2026 13:46:50 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Sep 2026 06:46:13 -0700
Subject: [PATCH net-next v2 4/4] docs: netconsole: document rate limit
 feature
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-netcons_ratelimit-v2-4-ebf0dd91e26e@debian.org>
References: <20260910-netcons_ratelimit-v2-0-ebf0dd91e26e@debian.org>
In-Reply-To: <20260910-netcons_ratelimit-v2-0-ebf0dd91e26e@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3209; i=leitao@debian.org;
 h=from:subject:message-id; bh=YweghrEN35d/HrIQDZzlztjwvxtnA6T6pjRwWdD/VPs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqorSvOedOtB9UAZ59DRyvRo3o8+LhENkpQBRXW
 XSVIz9YvN6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqK0rwAKCRA1o5Of/Hh3
 bS0TEAClh/SWx9vqpLBePxbdQOQOMmR4vb3mi6OcbDYi8vnA8taJTN4KRz6OIB+ngdCVPd9SvN7
 UcNF3tEH8cKSnXEBCFtgzrnRa4ZN5nDHNuVJS2sFx0/qoecMfRLIcK2ePonCjtFT4axIes4XQEC
 I0brZpUw0zTfyBgREuuhfbxAYYPMVIKawnS0QLO80L4bWpyyTrp3ywW+XTdYr8HmKhoTzAZbZg8
 0x2aVgGBFqo6+ndo+dFF7pfV+HfoYBi4uhowYU2gIti/g0vVIMmMgby/hor1C/Z5IQ8BFPffADk
 zsF8qiSkcszDon2L8lzqw42J5KJadPpa3g8/FhG3iJhdMybitTH+jktxTAOxNpM23OFVB4AV4G2
 DUt3bpyxntRpAxsFgtDszjZ3jrJv7I8TyVBtCSHY18M3iuDgJMtNlwUGwm4SkiXte1FH5P1af2M
 BvIkaNtISRrXuJg7z2vvJdq1CLUV/N7bgRBWLM1HjhuxZ6UjjW5AuoUIHrfsp96BjbZcqmqhzuK
 NK5a8oYWZz0rukX5vKZ8vwPtUcTOdJa8pT0tJMdgJhdJ+4WJYccpTe+njlchS6JV+ZmQOB6Iu5Q
 jLQzcfD8XWxoWVm2xfFnon0f5XQZ+wKrqk2bdced8Rf+SL2zOo4f+oIDGADdMhg+c+wCHhYptqH
 LyQCerzAFZdSSsw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Describe the per-target token bucket and the two configfs files that
drive it: ratelimit_interval_ms and ratelimit_burst.

Spell out the two properties that are not obvious from the file names.
The limit is accounted per message rather than per packet, so a message
split into several ncfrag packets is never truncated by the bucket
running dry halfway through.

Note in the message ID section that a message the bucket discards never
reaches the counter, so those drops leave no gap in the IDs.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/networking/netconsole.rst | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 4ab5d7b05cf102..a9ccf798346562 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -177,6 +177,41 @@ You can modify these targets in runtime by creating the following targets::
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
+enabled, which is when a flooding target most likely needs them.
+
+The limit is applied per message, not per packet, so a message big enough to be
+split into several `ncfrag` packets is either sent whole or not at all.
+
+Crash output bypasses the bucket. While an oops, BUG() or panic() is in
+progress every message is sent, whatever the limit says, so a small burst
+cannot cost you part of a crash dump.
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
 
@@ -359,6 +394,9 @@ indicate that a message was dropped during transmission, as it may never have
 been sent via netconsole. The message ID, on the other hand, is only assigned
 to messages that are actually transmitted via netconsole.
 
+A message the target's rate limit discards is dropped before the ID is
+assigned, so those drops leave no gap in the sequence of IDs either.
+
 Example::
 
   echo "This is message #1" > /dev/kmsg

-- 
2.53.0-Meta

