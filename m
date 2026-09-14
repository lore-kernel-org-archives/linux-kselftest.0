Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90444A72C;
	Mon, 14 Sep 2026 12:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387846; cv=none; b=fTtZ9E2BruOOrhGbXHtDBt1LcN67RAOV5hxu4n5lFDx+UtSx9cfBtics46fnDuFiUsbb/U6jY0LQaah9Km7aq3WEGU6gwmGFESwrFcB7JuMLRfjsB8ckvpk2GO/hVhu/BvFbCTOLllKUeHTeu6K8/YBZ/OXs/VyuwnVGNvpAIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387846; c=relaxed/simple;
	bh=cpmQcxGuCsqpL2FWjhLOvXk3o+1MsiFVU+67fFK602Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BljqBWCLKErLVcIyDsgKK1x9JuewfJUOh4p2uIxSl2nQ9Hmgwhkc/qekhbRIlcruKSS4ygx6ppXyPmElmr3rYhkzjty90E/Jua/x6OYlFA0hC+AHQFWJAZrfLmevBV96o1axDsfK0B2/DBIJ8mDa+r6GgB1SWhXrJ5Dp+Pf8noI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=RMtoEGG8; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="RMtoEGG8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=v6GxCrbwntxQGiCi6ExZJmvVyBpKpf0qD6c1T1VcByc=; b=RMtoEGG8t/4TlO1cuQyRhc+I5n
	ia8fG3oFvEdmVI+Iq6rKKBroFFtMUd3jlJzo/NdAgW9Ex89qioepbuyq18DZCkJatoueleYENcAUr
	9vzMqWmTDSQoX/3mjkJWwnmi5lQ1zbm2VqddU7Q+1uVkobG7mM0s8trCBRQvEdoOs+laWG8Nhdt8P
	dILNlDNNNqXJJl9woc17N+FwuRD21oOsJeTn1gkIz97VVmavhuPRZuMZZRy46RmN4U26P/UdOBDhZ
	QQ+42qkdlSDox6+7mJ264DXNbNzFJKrk7FKNJ71JkR51Xl3Xc9R2KtmHPoSQ9IS1+CyEdL1a4coNP
	g1ATNlQQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x65WD-003bYw-0w;
	Mon, 14 Sep 2026 12:10:41 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 14 Sep 2026 05:09:52 -0700
Subject: [PATCH net-next v3 2/5] netconsole: add a per-target message rate
 limit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-netcons_ratelimit-v3-2-8e81b789ab37@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4127; i=leitao@debian.org;
 h=from:subject:message-id; bh=cpmQcxGuCsqpL2FWjhLOvXk3o+1MsiFVU+67fFK602Y=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqp+QxtS9uEIDU3gN2gXsniyP3CBrK3X7wrbX1a
 xzj6DdmeACJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqfkMQAKCRA1o5Of/Hh3
 bQhzEACs1hVz1YViAq+iVDXuSAAsuyd5wcgTsrUcIZkgjQU4w0jZa0On06Kcs0qlS8Rfgrink7n
 U59r7dBSxupI6E4YPB5zCuSHunM3UVxUigsoqz5Z/AoQZNj08zxuCzfr/BuEsZ7QCzuty+q2i6Q
 FoHGfas6VRwxV9faDlis8uKibC279LYpnItRGKN4FN+d05feGj2J3GWwklR8ghSHrEFV/e9oPe1
 8/YueIffwTLzOWw4QW+sBHZrImjEJLqXPVXuFGDg1cqCYbsoBb7/FT5cqNfh+ifTR8TCPGL5GmP
 xxjo2TqFBj+xrc9t2xDKEMXMh0ytizYsCvEUoU/KvvnBoY9MZHrsbgfH4mDApfY/lEsyGKokM91
 xRIqSCcfMiTS/EXav27BEgQl2tWxHatYdKeQKXLtUr9T+bRw1Odt36c8fe4xC0OIxKbySoYBbzM
 cweVNb3uK+yNIztLBv5YZp7rZEtvyKoxPhciLzIjfwmYKPfOJQlZn+eFtYIzSq5l4dGzmaobQRH
 +V4Y0ILuFfb0LifYq3PGLxB3A9Kd9rIkZKDJ8qXGFN7xZeVEvsxbav85FZXma+JDZKpIQojgi9c
 upu4pia74hJPnhQHb8ARVZ1UOF4cW/MEdHXnLszQKyBXHvOcwQioCqn6WTEwbQylLNmCqTYSjqb
 yaLe3pAYqpsXwnQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Give each target a token bucket and consult it once per message in
netconsole_write().

The bucket is created with a zero interval, which struct ratelimit_state
treats as unlimited, and nothing can set a nonzero one yet, so no target
changes behaviour.

Skip the bucket while the kernel is dying, reusing the helper the
oops_only fix added, so a limit configured for steady-state logging
never truncates an oops, BUG() or panic().

The configfs files that expose it come next.

___ratelimit() only trylocks its own raw spinlock, so it is safe with
target_list_lock held and interrupts disabled, and safe from NMI. Set
RATELIMIT_MSG_ON_RELEASE so it does not report the suppressed count
itself, which would printk() from inside the console being serviced.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 833da29717ed1d..c1c92413c0a5c5 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -49,6 +49,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/workqueue.h>
 #include <linux/delay.h>
+#include <linux/ratelimit.h>
 
 MODULE_AUTHOR("Matt Mackall <mpm@selenic.com>");
 MODULE_DESCRIPTION("Console driver for network interfaces");
@@ -187,6 +188,7 @@ struct netcons_userdata {
  * @sysdata:		Cached, formatted string of append
  * @sysdata_fields:	Sysdata features enabled.
  * @msgcounter:	Message sent counter.
+ * @ratelimit:	Token bucket used to rate limit messages
  * @stats:	Packet send stats for the target. Used for debugging.
  * @state:	State of the target.
  *		Visible from userspace (read-write).
@@ -231,6 +233,8 @@ struct netconsole_target {
 	u32			sysdata_fields;
 	/* protected by target_list_lock */
 	u32			msgcounter;
+	/* carries its own lock, writers hold dynamic_netconsole_mutex */
+	struct ratelimit_state	ratelimit;
 #endif
 	struct netconsole_target_stats stats;
 	enum target_state	state;
@@ -294,6 +298,26 @@ static void dynamic_netconsole_mutex_unlock(void)
 	mutex_unlock(&dynamic_netconsole_mutex);
 }
 
+static void netconsole_ratelimit_init(struct netconsole_target *nt)
+{
+	ratelimit_state_init(&nt->ratelimit, 0, DEFAULT_RATELIMIT_BURST);
+	/* The flag keeps ___ratelimit() from reporting the suppressed count
+	 * itself, which would printk() from inside the console being
+	 * serviced. Nothing calls ratelimit_state_exit(), so the count is
+	 * never reported on release either.
+	 */
+	ratelimit_set_flags(&nt->ratelimit, RATELIMIT_MSG_ON_RELEASE);
+}
+
+static bool netconsole_ratelimited(struct netconsole_target *nt)
+{
+	/* A limit meant for steady-state logging must not eat a crash dump. */
+	if (netconsole_kernel_dying())
+		return false;
+
+	return !__ratelimit(&nt->ratelimit);
+}
+
 #else	/* !CONFIG_NETCONSOLE_DYNAMIC */
 
 static int __init dynamic_netconsole_init(void)
@@ -330,6 +354,15 @@ static void dynamic_netconsole_mutex_unlock(void)
 {
 }
 
+static void netconsole_ratelimit_init(struct netconsole_target *nt)
+{
+}
+
+static bool netconsole_ratelimited(struct netconsole_target *nt)
+{
+	return false;
+}
+
 #endif	/* CONFIG_NETCONSOLE_DYNAMIC */
 
 /* Check if the target was bound by mac address. */
@@ -698,6 +731,7 @@ static struct netconsole_target *alloc_and_init(void)
 	nt->remote_port = 6666;
 	eth_broadcast_addr(nt->remote_mac);
 	nt->state = STATE_DISABLED;
+	netconsole_ratelimit_init(nt);
 	INIT_WORK(&nt->resume_wq, process_resume_target);
 	/* Set up the skb pool primitives once; enabling only refills it. */
 	skb_queue_head_init(&nt->skb_pool);
@@ -2494,6 +2528,9 @@ static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
 		    !netif_running(nt->np.dev))
 			continue;
 
+		if (netconsole_ratelimited(nt))
+			continue;
+
 		/* If nbcon_enter_unsafe() fails, just return given netconsole
 		 * lost the ownership, and iterating over the targets will not
 		 * be able to re-acquire.

-- 
2.53.0-Meta

