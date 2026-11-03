Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702526;
	b=G+A87/C6TyK9G0ioMkek3cC8+GgHux4I2KCNrHRoj5cFB0JHvNDDTq2QqIxQesr8j7tt
	 cPV+8esJ7DiJhpi290RJXRW809VCxCRzf93Or702KOOlb80dRyK5mtGjVs5gTzBcv1Zhh
	 GiEyGeoCtyfjXWyDg4lbAZvgN+0oc52HAlQOd81oKE/Pr7RjOuH/Hi+j7rDLi8+dOmxa2
	 HfHHoKosAbvQy4SocYMpEZgk64d9R1JJIkPaeTZTV0DbJmKmX/Nt+kMU0QaCi4zxqsh8n
	 IhHH+qi8QkJQJRWeXEx4iWiH8YD7iS6hNGU359er3C5MJXYUkVCUH6tuL/QHs1mPAxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702526;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=v38Da74OfyufAHKT5CIT6a3m4lW6hsNirkcyKIghIzE=;
	b=PqCw0+Y31JVv91P1vFqv+q6nC9yXrEqGD/AGCTqRi7QZzU6OR5RglhfAmQr1v1YuYRVW
	 8pFLVKHA8GEGtgY1iD8C15uisTvcCmxw755KPFZ8ohgS9AOaSIdiYgf4RQyOpPFxeDIgi
	 krBJDfFDMtzgjwn31NTmgYltHquN2RK1eE5fpG0QXr4Zs8reDTAhHhs5A3+C2l1znoU0j
	 y2kUqQ8uxnN9pHTysFqadkVddfw3NEYSRCZ+Z6IxpdMTcV78U7xGVmt/h0flB6uDSrtGI
	 S0y2UdVoSjFjomIjKRVKHowzSCCcEtie8aQurpwNW1ObD1Ykjje0jHP/hEhqhVlawnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=QmrhoVx2;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3BD606A823;
	Tue,  3 Nov 2026 10:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3BD606A823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=QmrhoVx2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=v38Da74OfyufAHKT5CIT6a3m4lW6hsNirkcyKIghIzE=; b=QmrhoVx2KUA8a4OD31rjh6/HZh
	LIA/hi/vu4elC3Xj5ku5cQL1A7ZYyE7US8QRcxu4ieGNjnzgvajhj0VuUBaMe9JWemhkA7EX+tYKq
	NjjED07T6loN/Roc8HCqj6Ztn3H22as1EjcnIOWhEZE7aQGYB8DGv5HKTMAE26ST5ubGYQ34tqL2B
	fHH0hkloM9NNBPmWRWiVXr+okZ68rXj5TVM2meYN0tPcND8ouo08cbmzE5dAwiRTXjluqYFH+oKJJ
	+2nEzEaTMeAOG/H9VlXuQ4JZW4kY6FAkZIAoUprF2T8jnt6VG5cxvOu5Lr3Nc74+7X8ytxMfbLAFs
	prXs42+Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOBxs-006sNK-0i;
	Tue, 03 Nov 2026 10:42:04 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 02:37:47 -0800
Subject: [PATCH net-next v4 2/5] netconsole: add a per-target message rate
 limit
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
Message-Id: <20261103-netcons_ratelimit-v4-2-b554c27ba27a@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4183; i=leitao@debian.org;
 h=from:subject:message-id; bh=O+6Ic9VKPeFKuSgvLdDubnW1tGMQzftSGlmnIFPVTCI=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6bpqzcimwQEa8UH9kpCc1iWB4cTT+itP3ynbE
 tq39jYAkvqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaum6agAKCRA1o5Of/Hh3
 bWyAD/9TVbDSHgVq4G4Tr+r3fcX9JsATRvIUedgGJOnSG3gWn55DPKkA+njpRgzP9sZuNgBm16z
 krlVplAVCJUu8hFr8OqdvRlDkPCUJYACVU0S1b9KM1Vt5dZ9QHLO1g4YZMtq31PgtGr1ArWvgnX
 KzWQOhngaX+5D7TbMJ5+OBl/oD0VUBrRMBklhh2qIaUlfGg7282DyaAUmuZSJ8lNoXHgCdvZHNu
 1blNdYv4cAkzpQmXPEf0bX2LtLti4N72CUB0N87psAU+KRgdg6T2AL0ToVMTf4ZaMNHsO/uB/qE
 2pCBOLp7rEuKH+NZ/Y26tcOi75MtEEJAVl6Ul3+Gcs5Ak4RiUoVrKRJ/mvSvXlUSHr3LKb2BpYM
 1JUqe9oF/ZogD0hljP2gwikSmah59qRH2ynkqTsTPKYaML/damZFch0oWSFjRUpH5Q7pBN7gYv+
 G2s7xetiFmiELg/Ie737e2I1adAurwOhX22TffpSTi9ccE3bSwteWri24Ke1WHpbpKNMA9n2G62
 CFJiHh+RcjUS4yOBqUan6yqVRptGjA3BnQJ0jICxKVBfwzpRTGOZcTH/WtvB6DIUA0/sIdc0qEF
 KqT4IDwekBReBG2vXUpZT2LsY43qWrXxJCQv125igRzNgmqVhkqXE1Frv8fmdj23SpIMl6RePgU
 GcrcRMrZiDJgvEA==
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

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 6637b4a16b6c98..3e4495c1cab182 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -49,6 +49,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/workqueue.h>
 #include <linux/delay.h>
+#include <linux/ratelimit.h>
 
 MODULE_AUTHOR("Matt Mackall <mpm@selenic.com>");
 MODULE_DESCRIPTION("Console driver for network interfaces");
@@ -196,6 +197,7 @@ struct netcons_userdata {
  * @sysdata:		Cached, formatted string of append
  * @sysdata_fields:	Sysdata features enabled.
  * @msgcounter:	Message sent counter.
+ * @ratelimit:	Token bucket used to rate limit messages
  * @stats:	Packet send stats for the target. Used for debugging.
  * @state:	State of the target.
  *		Visible from userspace (read-write).
@@ -239,6 +241,8 @@ struct netconsole_target {
 	u32			sysdata_fields;
 	/* protected by target_list_lock */
 	u32			msgcounter;
+	/* carries its own lock, writers hold dynamic_netconsole_mutex */
+	struct ratelimit_state	ratelimit;
 #endif
 	struct netconsole_target_stats stats;
 	enum target_state	state;
@@ -301,6 +305,26 @@ static void dynamic_netconsole_mutex_unlock(void)
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
@@ -337,6 +361,15 @@ static void dynamic_netconsole_mutex_unlock(void)
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
@@ -2500,6 +2534,9 @@ static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
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

