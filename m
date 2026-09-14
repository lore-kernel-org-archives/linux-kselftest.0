Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FCC46C4DF;
	Mon, 14 Sep 2026 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387850; cv=none; b=GzH2NifhM4nXfo7IocxKDbdjPPt3TuEqYxb5q+eBWa6XJAeXpdGYApT+cfDNOaM7yqKZGHTB8YXAHYwqAL8g2q5wVNLRJ9I21hj1aSIYfcAmAvdR0WvpVISEwCZwX82O3wuJLDIPp7bTQNFJQuAkTJlYJkesfql3HZd05m7vPD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387850; c=relaxed/simple;
	bh=vIGkiylmy9t40EZOeJRY1ap/teiPp9QU6ZMsk+qBM+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bqOsPrOHv7vnQaTwk8/vqxZ92QwADxgsmI6GWXF5rWqXHcXagGvoe6RhXYES6WtpY7GXqZlvUXQdmkDeDoEanip06MyWwpW7QHRzdHnyxhAklG5sxMds3You6oV/OojOfFBqOOkAay/r9+BXUeQzv6tjYEOCgSnTvX3uJGrITo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=oYMOHtlb; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="oYMOHtlb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=fIABMr7eHwYcEaguutUoj/lfdfqUz7CoJUcQ0BuphlE=; b=oYMOHtlbbiQn8ts1/0P+0MrsLv
	b0uMynE1rr+CHU2fSHmVHPp7UWJDoiNBvBSE172Jo/WcF1FMEQGgeCQ8lRN2DCpCFlwx1vBs6Jzla
	1wAQCjjYIiFKiwN21uWmIhGb/nq1skcHPwJKGV9VIE1Au3qs1vypdQ0tyuRKC6q2+4mGvcWXGn5aD
	OOWuuiIZRSv+9u6666ym3+xM8i2R/+umBGXWcxVoraaaL5OBTFcGj67JtmaiMmCZPGv3G5R96uWeN
	hDwdcNhc9OdnoYIVlctnxcEditY8ZoMF2oPnjn/nE8B6cDhtU6J2cYr34CxuAwkghp73hpIiPUcI4
	PBiEmYOQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x65WI-003bZH-0i;
	Mon, 14 Sep 2026 12:10:46 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 14 Sep 2026 05:09:53 -0700
Subject: [PATCH net-next v3 3/5] netconsole: allow configuring the rate
 limit interval through configfs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-netcons_ratelimit-v3-3-8e81b789ab37@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3163; i=leitao@debian.org;
 h=from:subject:message-id; bh=vIGkiylmy9t40EZOeJRY1ap/teiPp9QU6ZMsk+qBM+A=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqp+QxaUnbwmp6BHkhaGDjMKNNVGyuFoFzYON1I
 2oR2VQS3KGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqfkMQAKCRA1o5Of/Hh3
 bV9AD/90MDsf8XUFTSB6aUW/2b6AYxnWJiatWfaSNOheFh7Q7nWCnB0+hkcpoduV08LS4mZNoIl
 WViaJ/u53glL9RopcjczjOGDG92fO8HpQCLIuUPEdu+Lvk8Pd4XZWGZA0hYq5OGO0XGXQNqFnW7
 4R8/eqIctTTOW6yAanBvIgvjY3X951wS0poIpsN1/LFysWioWU8QsK1gEJGEEJX4MNwZ5AbYAIb
 dJFiib6G/ATz+hes+UOxKZ5fm2F72eXBL9cHgEyyIaasXP9/+GfTVyDOhHDXFx2A3MLWQd6r/FX
 +68YbbypRifLGYxLb1N0Mw3yy7J0LPvyVSx3RJrnganKeOQ1XC8sUVFtJMW9ax+AtZXXewmj0M0
 kHt8u5Y1WcTcYUO68L1GG0GkQM84W+AEtta57BURJB2G5hoiuu5XNz5yeXviMaTLxGKU4FyuiCL
 vhiYkTo3Gokv/EL5SEm4qzZlYELrQ5zux/mrXUAmZl0xJJZ16s3PB2WHx4Q8wL5dvD8jXIBmJKn
 Udu2+iOk5Sf6Rut6JlIq99s54h/I+2vMHH1lGIEtl8zbzqtDglsw65mo+AxUFTRboqFHYQ61hTg
 gJAI3FxAMZlEKZ3X3XHMvifmUyXwFedxJhXzfv7qwvDl+k8Zm+BkkCYhLYxzDM7lL4NaK7tmwX8
 zgUWIq/SCXMWmbg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The per-target token bucket has no interface, so every target is still
unlimited.

Expose the interval as ratelimit_interval_ms through configfs. It
defaults to zero, so a target stays unlimited until an administrator
sets one.

The write restarts the interval instead of only publishing the new
value. A target is configured while it floods, by which point the
bucket is empty, and ___ratelimit() only refills it once the interval
it was set with has elapsed.

Reject more than INT_MAX milliseconds. msecs_to_jiffies() saturates at
MAX_JIFFY_OFFSET, which is below INT_MAX on 32-bit, so checking only
the jiffies value would take a write there that a 64-bit kernel turns
down.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index c1c92413c0a5c5..d4e3ac272e9b4a 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -958,6 +958,14 @@ static ssize_t transmit_errors_show(struct config_item *item, char *buf)
 	return sysfs_emit(buf, "%llu\n", xmit_drop_count + enomem_count);
 }
 
+static ssize_t ratelimit_interval_ms_show(struct config_item *item, char *buf)
+{
+	struct netconsole_target *nt = to_target(item);
+
+	return sysfs_emit(buf, "%u\n",
+			  jiffies_to_msecs(READ_ONCE(nt->ratelimit.interval)));
+}
+
 /* configfs helper to display if cpu_nr sysdata feature is enabled */
 static ssize_t sysdata_cpu_nr_enabled_show(struct config_item *item, char *buf)
 {
@@ -1353,6 +1361,35 @@ static ssize_t remote_mac_store(struct config_item *item, const char *buf,
 	return ret;
 }
 
+static ssize_t ratelimit_interval_ms_store(struct config_item *item,
+					   const char *buf, size_t count)
+{
+	struct netconsole_target *nt = to_target(item);
+	unsigned int interval;
+	unsigned long jifs;
+	ssize_t ret;
+
+	ret = kstrtouint(buf, 10, &interval);
+	if (ret)
+		return ret;
+
+	/* msecs_to_jiffies() saturates below INT_MAX on 32-bit, so the
+	 * jiffies value alone does not bound what userspace wrote.
+	 */
+	jifs = msecs_to_jiffies(interval);
+	if (interval > INT_MAX || jifs > INT_MAX)
+		return -ERANGE;
+
+	/* Restart the interval, so a target that is already flooding picks
+	 * the new limit up now rather than at the next refill.
+	 */
+	dynamic_netconsole_mutex_lock();
+	ratelimit_state_reset_interval(&nt->ratelimit, jifs);
+	dynamic_netconsole_mutex_unlock();
+
+	return count;
+}
+
 struct userdatum {
 	struct config_item item;
 	char value[MAX_EXTRADATA_VALUE_LEN];
@@ -1717,6 +1754,7 @@ CONFIGFS_ATTR_RO(, local_mac);
 CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
 CONFIGFS_ATTR_RO(, transmit_errors);
+CONFIGFS_ATTR(, ratelimit_interval_ms);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -1730,6 +1768,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_local_mac,
 	&attr_remote_mac,
 	&attr_transmit_errors,
+	&attr_ratelimit_interval_ms,
 	NULL,
 };
 

-- 
2.53.0-Meta

