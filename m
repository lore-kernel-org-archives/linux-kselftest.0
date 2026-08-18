Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0183C10A3;
	Tue, 18 Aug 2026 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049014; cv=none; b=cXwMfVtVZ+B8BW8Dyt81HweiBwGqSdOJC1zuXHoE6rSTmE+oZYYkbY4ATr5VR9Vcj2gQjDCmy+V6qj28rpDrioVtgob8O3gU+R4VvWpGqCr4n/Gyah17V2RF1jjmpbGSQfA7auvhm7V+etT+xOdarxMP8jii3c35viCMa2x4oLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049014; c=relaxed/simple;
	bh=/etAJJtrfw3F/NjXwyUYeknccqYgvo1SAqIH9/lrHcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WobbeYeNnkaGeis5VvL1i7ZFeLeiqLWfNLzYrqEb6iktqeLYhEcmgD7UnSINo4U5minds69LDrjFClWDlPxbPnzcBBnRttK5xns9nblSipgWbBGzPdQwy60mkhWbaqzBO7Nq3NzK68EKnsE8oVpQTKpC6MO9P23BmwgI0czIuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=V4hzDR0K; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="V4hzDR0K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=G+RMJyYuWASkHXXd+GnjSoR1L1cHAANJPPpOAclyXA0=; b=V4hzDR0K6XlhG3kMrg9pxaO/BT
	8Le83uoNbm9KxRBnoMbJs0d1cFDCGnuRudvkS5tZcLOYGni5gHdbt3NMGP8RNn1fXZ8B5QWUwbmuq
	vj8zHvE6QP/qYByUujvNfgssu02/MnzlInQb22AN7w/3wEfE1hWzXfNiDkATU630dquh93phkp8Ew
	qc9UupWqKh5Jrlh80Eodqdw7NDCgEY2iSQTg2tCNrWsxpVB64eH5To+hf2XysoAJBYdKh8sRdDNfb
	SoobXuTLpGodDm8bK51pmWHzts0jnYYzJS/1GbOmNZ9nR0EKqFMFzBbxOxmusXXx9ZJQkFMXu6tyN
	a2ddhGjA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwH56-008x75-0d;
	Tue, 18 Aug 2026 10:30:08 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 18 Aug 2026 03:29:15 -0700
Subject: [PATCH net-next RFC 5/6] docs: netconsole: document rate limit
 feature
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-netcons_ratelimit-v1-5-8c5d2d17789c@debian.org>
References: <20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org>
In-Reply-To: <20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: paulmck@kernel.org, davej@codemonkey.org.uk, riel@surriel.com, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, samuelcrossley@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2955; i=leitao@debian.org;
 h=from:subject:message-id; bh=/etAJJtrfw3F/NjXwyUYeknccqYgvo1SAqIH9/lrHcc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqhDQOB/LYnnchrr2D2Nu3MfytO8/okSB6+3QG8
 jdb4J7VOiGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaoQ0DgAKCRA1o5Of/Hh3
 bYLpD/9Xm4BSlqPsFt1cz+DDb/2M/AXMv5GADWUCsGrqhOuG2yLeitTCOXdwVXKpana/eVlLWfR
 WqOgIGT4sxznH5m1ef9F1HFDTnth45I/LZphmjJsXU+OKIC6qiLPn3eo2+pJctkM3jZ8NqHGBEs
 QHRRXn9q6G1nNUgT67SdjZT61DwYFLJz13uHs3bTUh0xumvd1ZailNTjcekDInoW9uNjZssONxR
 gFZVqLgbRCMqHpORHBm4ryZ3VONBu+2CjELHUQW4mOYDS0xIB2m7Ps+5q9Tbp8fcz271EysFzFM
 Y9EGAlXuMb0oVRSgxZDZZCxrhtZYWYWSHnaVElTTwD9BP5vXpTNGJZ3N8LdzFvzhTIIc0H0vrVc
 QqAO0RbptJ31EoABB2XKuX35m2eIuiJ6NVXm/Z4dkw3bpUz7qRHxmBXzFkJzK0kzC63MpuDC5g0
 pj0L+99gHoLk9KkzKT2ck6Cl4VdcEEu+K4F4R3YC2ok/ID6BEG1y1o2TotnWFTUyoP/EhsNA0LR
 e+sgX5pmIBbXJ0Dtwmd/OVnMis1sy6b6lf905PYPn2Vo5b7UG943mDbu7nBR8cb/mMwNXE1gLHz
 0arva3zR8WroRhqB8cMz2kLpB/C3G0v6RANfYS7L4unvxUL2FoEE/8Fw1OhPgCs8h4X+gzZcWk5
 nLzEThFMrhDEpjg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Describe the per-target token bucket and the two configfs files that
drive it: ratelimit_interval_ms and ratelimit_burst.

Spell out the two properties that are not obvious from the file names.
The limit is accounted per message rather than per packet, so a message
split into several ncfrag packets is never truncated by the bucket
running dry halfway through.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/networking/netconsole.rst | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 4ab5d7b05cf10..7369cd89ae76c 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -177,6 +177,49 @@ You can modify these targets in runtime by creating the following targets::
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
+                              10; zero drops every message.
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
+A drop leaves nothing on the wire, so the receiver is told what it missed as
+soon as a message gets through again::
+
+  netconsole: 45 messages dropped by rate limit
+
+The notice only travels with the next message the bucket allows. A host that
+goes quiet right after being limited reports the drops later, when it logs
+again, and a target with a `ratelimit_burst` of zero never reports them.
+
+netconsole generates the notice itself instead of logging it, so on an
+extended target the record carries a sequence number of zero.
+
+Capping a target at 500 messages a minute::
+
+  echo 60000 > ratelimit_interval_ms
+  echo 500 > ratelimit_burst
+
 Append User Data
 ----------------
 

-- 
2.53.0-Meta

