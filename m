Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584BC493D50;
	Thu, 10 Sep 2026 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048000; cv=none; b=FqLRPGNokTEy6eTZXRvztDVIg5BdQJSQIb5FtxMUKPTbaWopauOr7ZtdlBVgmHa1yH1P0ca1ZG/Gnss/Fb8BumoS7dZLKlmD5liJ2cRFJjuZiHqKlSvKxyl3zUWp9QbFawvajehKCi4KD3Y4FTTc55CFjWrINXWMpfFCaROCnFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048000; c=relaxed/simple;
	bh=te3BGjv2ZkjpAtQL+NYq1q8u2tx56jSGzo6NvbWg650=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmpFX7JBOEZTK00888uxp6eNpqzTlsAWGKCgo/tL4tDgyp5OeeHTFTKZTvPt44mKz+in4O2/ze9pndalyhfZWZ3uTss2eVMaaKII5gYBtGUa8KMmKhHD8EgI1R1At5g67qPDL+t0CFaLSwejrLkwWbmBo0Q1LuRN8uamoN6ULn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=IVBMUMNf; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="IVBMUMNf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=zhVYq7G9Exl1xvrXgONfvwSZx8+yAyxUVtkgjfCQr/U=; b=IVBMUMNfOCEh5gtOQcoEiFi0pl
	Al7+8KuZCUeUrSbVcf1JdjbIJO97rr76wEy1FW1wymYAiSj6YrdWkfLwJfZSSGd5B2u6SepE2131Q
	zwNm83YKwRSL7kfIwOSG7qDfFXVwXSNnDiOTn00Z/+J5lgoaR3wp3W2hoeV7YoQWwe+FGyHTV34eO
	TOzCtMyzoFQE4GmrzEvgM9X6aqWqbha88ORBkT9rIdrogv/y8cUtf8lv+VTMu5BVOLMWH03yJf2mx
	8t0chOPDnJcV9QHHzmXrP28Vqz98mXeqVkb9hWsFYiRT5DuhIH5m+ED/pYjNv4GL4wRICzbjLwgrA
	bzGraNhA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4f6o-000YHl-1b;
	Thu, 10 Sep 2026 13:46:34 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Sep 2026 06:46:10 -0700
Subject: [PATCH net-next v2 1/4] netconsole: add a per-target message rate
 limit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-netcons_ratelimit-v2-1-ebf0dd91e26e@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4007; i=leitao@debian.org;
 h=from:subject:message-id; bh=te3BGjv2ZkjpAtQL+NYq1q8u2tx56jSGzo6NvbWg650=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqorSvVw2Y1/q8d1jeRobTLospSYvh9UR+LXD8b
 tGeDwsY7N2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqK0rwAKCRA1o5Of/Hh3
 bXv4D/47oB7YhUpBoxx2TLHcCdY+Q75AGJ2mgSQU6XI6UyyVyr/bBLGCzxFB04wQlXlBo9Et/kD
 PL+c+L1L92cU6ELWG+XJHLLO5qhpA5rHxInARpRwpHS3OYcqdrYnnUkXfp8Gh9hwUOTqDT95ijq
 ykGw0frlcZUKwYl7Moo6RKSFwm7S4d9AyuDePQJsyxhpyATPPk3MoWnlpakvzf67w3BGABZC+rR
 NlLf9LfA1nb/gfp2PLL+2x01JvLmrGnMYeU+K53D9qfOmurX4VDTXQiGxDdkh4MQRe2eMtlp1y6
 aYgX0+6bfDYITHWPaXFCfq/wBcx+azkoxgMiwmM+yW8eOHxGrm5orOSutVrGJTOczHG0oWG/ejy
 z73LhEmvy8Prq4yhPFbPMFPEQ+z99AsXN6MtpTEx02F7DVhbjIxmOE65T6WTaq4dJSgQr+McdPb
 odlbqw/F7NdQsEAsi649fsOrfaDcbiAd6GzDyQBRUPVzJkCHtqRIaVo3YwMVAd8FfWeG6h07nSE
 Xrzvny9jKvMqBl4CUwmm/BJplpaD8hPLA6zA5zvMlzr/jg5KqxktXCRfp+1Q3VRsLuOX/ssX4JC
 jiV8pyGZD8S/a5H+Qq4Gt5THSMDA5KUvLLkX/7fQlF95I662/qdEWmj2G/WC2PugaHvfsxjXh74
 tqlrDgEnOTwerXQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Give each target a token bucket and consult it once per message in
netconsole_write().

The bucket is created with a zero interval, which struct ratelimit_state
treats as unlimited, and nothing can set a nonzero one yet, so no target
changes behaviour.

Skip the bucket while oops_in_progress is set, so a limit configured for
steady-state logging never truncates an oops, BUG() or panic().

The configfs files that expose it come next.

___ratelimit() only trylocks its own raw spinlock, so it is safe with
target_list_lock held and interrupts disabled, and safe from NMI. Set
RATELIMIT_MSG_ON_RELEASE so it does not report the suppressed count
itself, which would printk() from inside the console being serviced.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index b358e5c3673510..13292c3f818e9f 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -49,6 +49,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/workqueue.h>
 #include <linux/delay.h>
+#include <linux/ratelimit.h>
 
 MODULE_AUTHOR("Matt Mackall <mpm@selenic.com>");
 MODULE_DESCRIPTION("Console driver for network interfaces");
@@ -175,6 +176,7 @@ struct netcons_userdata {
  * @sysdata:		Cached, formatted string of append
  * @sysdata_fields:	Sysdata features enabled.
  * @msgcounter:	Message sent counter.
+ * @ratelimit:	Token bucket used to rate limit messages
  * @stats:	Packet send stats for the target. Used for debugging.
  * @state:	State of the target.
  *		Visible from userspace (read-write).
@@ -219,6 +221,7 @@ struct netconsole_target {
 	u32			sysdata_fields;
 	/* protected by target_list_lock */
 	u32			msgcounter;
+	struct ratelimit_state	ratelimit;
 #endif
 	struct netconsole_target_stats stats;
 	enum target_state	state;
@@ -282,6 +285,26 @@ static void dynamic_netconsole_mutex_unlock(void)
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
+	if (oops_in_progress)
+		return false;
+
+	return !__ratelimit(&nt->ratelimit);
+}
+
 #else	/* !CONFIG_NETCONSOLE_DYNAMIC */
 
 static int __init dynamic_netconsole_init(void)
@@ -318,6 +341,15 @@ static void dynamic_netconsole_mutex_unlock(void)
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
@@ -686,6 +718,7 @@ static struct netconsole_target *alloc_and_init(void)
 	nt->remote_port = 6666;
 	eth_broadcast_addr(nt->remote_mac);
 	nt->state = STATE_DISABLED;
+	netconsole_ratelimit_init(nt);
 	INIT_WORK(&nt->resume_wq, process_resume_target);
 	/* Set up the skb pool primitives once; enabling only refills it. */
 	skb_queue_head_init(&nt->skb_pool);
@@ -2482,6 +2515,9 @@ static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
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

