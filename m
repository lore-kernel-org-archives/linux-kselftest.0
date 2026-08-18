Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1C3E1CE4;
	Tue, 18 Aug 2026 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049006; cv=none; b=PDK/E8E2aEujfZE00BhE7JyQpqATwgIqI2ybqFYAGYnyfUtyugvzgH1DFkRu87x9FAR4iI7gZXq8xTGGIpslsbig8wZFq/zEvX/RO2QMo9JgHMfb+1zfYPAIRYO2GCYMgjONqQiveK4bUAmPkHEzEGxmPg0EHD3DpiPDSJvTwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049006; c=relaxed/simple;
	bh=Q3qoIG28CpFJLddjjct+GSvPpQNH4vUDWBsW4OFZkcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKlkSLo054pYI0StDplSbwrJAPxeen5OATCDbVyX4/cslI/mia82fRkfUp7/jadSp9VRUm8zRRDaWACkw1lvSe/MhmaSGdqYPhy3rdikkQy4bFMW57jb77ocqJpZBCBbKbaRZsEbCnXVw++7H3eB6Alp4xE7YsJ5hHNB4DbUOrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ZfyIyuXI; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ZfyIyuXI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=Kz0Mz7z1sjUk0o6kQF/8M9atXJEj1KDEndjp7Pcq0Yc=; b=ZfyIyuXIwSZDs8kUqp8JduK1cP
	uJc1q47Da0sQ976khbi41JAgEyrPQvXVRKiUCdcPEi4FyqlTwuXFIz2ko5NQVZA7zvZJ4Vh4dzVxI
	iYVZj2KLZeZQ97UvokDGmlC0xeZw2hOoQKiZJVIkQCUMVJVI02UM75fEnf82ZFYsdF/oL4FzXPQKH
	D+ATUpRQ6fjbgL9lpj9z6xlmmr04Xt7KlWDigTq6YEnGHkQ6SCcO6CDmTOMdhiRW9h70kUEkBQLd7
	oiSqsQPK8JyT7xz7Ot1K7iYlQFoBVjzgFrIRv4Ay4SIMmLJgrE+PDzoeLfCBrwk80N2/3WAtpOurd
	rdlRCGnQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwH50-008x6e-1x;
	Tue, 18 Aug 2026 10:30:02 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 18 Aug 2026 03:29:14 -0700
Subject: [PATCH net-next RFC 4/6] netconsole: tell the target when the rate
 limit drops messages
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-netcons_ratelimit-v1-4-8c5d2d17789c@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4145; i=leitao@debian.org;
 h=from:subject:message-id; bh=Q3qoIG28CpFJLddjjct+GSvPpQNH4vUDWBsW4OFZkcM=;
 b=owEBbAKT/ZANAwAIATWjk5/8eHdtAcsmYgBqhDQOlUKu6MPD3GsyVRno8F+Qe+xhRy+jNAFFu
 MyVOqPaOOWJAjIEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaoQ0DgAKCRA1o5Of/Hh3
 bfTCD/ICSI7nWiauE3PkZgmF0FEPl5jR5YHMmGTxcpj3VFWIF3tztOqirA85zv3ZaphuUFF45vi
 QHRTE0Co0FYo2vwx4eIvCQQzeUOrIBCrfJnztQOrijhF+C1elOkiB6niouQggLXBrl3K7FLj8fK
 P1ygn/PXzkze06uQe73tVNqpXxF2gv3CGTM6ifXmDTUiTrWzI0IXuNKV8QZNpsOvu3qYgPxBRZ7
 YFvwBzX7h0FHU3s9vD5Dx2cbJ16F16u/2hexUtvV0pXyCSZa6Hy7EGkQs3lEOLMoTgHOPPcxugB
 NEKjLBAal8jtVciYFhuF4sSD0UO0kJ/IxRT7QJxW1WDlGySclZXCMLJF1d4+pYHAkfIZVSe3e1c
 eZT2nGVxJFFJIWo1XMW5oDSctc5M0WqygCA+lhR2KzDazWmsfzziZFYF0srr+cNlm7Q2s59n7V1
 eN2/zM7K6v0N27Yt/hpB54KBPUBYMU3SDfXV5C4EXEtS8nJqeOC1bLHmh7/i3tzp6Wl2gHtzw4N
 s29/Y3wTaCet2CesuDidmaErnc2e15tGQd+ZIcv6J3F0e8OQb1bg19UcQxszQd4wBXid8UVu7Jq
 RlMAyDXgk4fK5dYB1vY6eurBDQqMs4cIOXE3CRWbEDMnFxsbtcdccFlzUFi7DVebgRbg98uhJv9
 xo77yalCAVGlE
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Keep the number of messages dropped since the last report on the target
and send it to the receiver as soon as a message gets through again:

  netconsole: 45 messages dropped by rate limit

netconsole formats that record itself rather than calling printk(),
which would feed the console it is currently servicing. Nothing here has
a printk sequence number, so the extended header carries a zero.

The timestamp comes from local_clock(), the same clock printk stamps its
records with, but it is taken when the notice goes out rather than when
the message was logged. It can therefore read a few microseconds later
than the message it precedes.

The notice rides on the next message the bucket lets through, so a
target that goes quiet right after a burst of drops only reports them
once the host logs again, and a target with ratelimit_burst set to zero
never reports at all.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 6d60a5188bf13..0af2e5b4335c0 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -50,6 +50,7 @@
 #include <linux/workqueue.h>
 #include <linux/delay.h>
 #include <linux/ratelimit.h>
+#include <linux/sched/clock.h>
 
 MODULE_AUTHOR("Matt Mackall <mpm@selenic.com>");
 MODULE_DESCRIPTION("Console driver for network interfaces");
@@ -177,6 +178,7 @@ struct netcons_userdata {
  * @sysdata_fields:	Sysdata features enabled.
  * @msgcounter:	Message sent counter.
  * @ratelimit:	Opaque structure to ratelimit messages
+ * @pending_drops: Messages dropped since the last notice was sent.
  * @stats:	Packet send stats for the target. Used for debugging.
  * @state:	State of the target.
  *		Visible from userspace (read-write).
@@ -221,6 +223,7 @@ struct netconsole_target {
 	u32			sysdata_fields;
 	/* protected by target_list_lock */
 	u32			msgcounter;
+	u32			pending_drops;
 	struct ratelimit_state	ratelimit;
 #endif
 	struct netconsole_target_stats stats;
@@ -297,7 +300,20 @@ static bool netconsole_ratelimited(struct netconsole_target *nt)
 	if (oops_in_progress)
 		return false;
 
-	return !__ratelimit(&nt->ratelimit);
+	if (__ratelimit(&nt->ratelimit))
+		return false;
+
+	nt->pending_drops++;
+
+	return true;
+}
+
+static u32 netconsole_take_drops(struct netconsole_target *nt)
+{
+	u32 drops = nt->pending_drops;
+
+	nt->pending_drops = 0;
+	return drops;
 }
 
 #else	/* !CONFIG_NETCONSOLE_DYNAMIC */
@@ -345,6 +361,11 @@ static bool netconsole_ratelimited(struct netconsole_target *nt)
 	return false;
 }
 
+static u32 netconsole_take_drops(struct netconsole_target *nt)
+{
+	return 0;
+}
+
 #endif	/* CONFIG_NETCONSOLE_DYNAMIC */
 
 /* Check if the target was bound by mac address. */
@@ -2554,6 +2575,34 @@ static void send_msg_udp(struct netconsole_target *nt, const char *msg,
 	}
 }
 
+static void send_ratelimit_notice(struct netconsole_target *nt, bool extended)
+{
+	int len = 0;
+	u64 ts_usec;
+	u32 drops;
+
+	drops = netconsole_take_drops(nt);
+	if (!drops)
+		return;
+
+	if (extended) {
+		/* append the extended headers */
+		if (nt->release)
+			len = scnprintf(nt->buf, sizeof(nt->buf), "%s,",
+					init_utsname()->release);
+
+		ts_usec = div_u64(local_clock(), NSEC_PER_USEC);
+		len += scnprintf(nt->buf + len, sizeof(nt->buf) - len,
+				 "%u,0,%llu,-;", LOGLEVEL_WARNING, ts_usec);
+	}
+
+	len += scnprintf(nt->buf + len, sizeof(nt->buf) - len,
+			 "netconsole: %u messages dropped by rate limit\n",
+			 drops);
+
+	send_udp(nt, nt->buf, len);
+}
+
 /**
  * netconsole_write - Generic function to send a msg to all targets
  * @wctxt: nbcon write context
@@ -2583,6 +2632,8 @@ static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
 		if (!nbcon_enter_unsafe(wctxt))
 			return;
 
+		send_ratelimit_notice(nt, extended);
+
 		if (extended)
 			send_ext_msg_udp(nt, wctxt);
 		else

-- 
2.53.0-Meta

