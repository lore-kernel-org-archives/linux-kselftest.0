Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702531;
	b=psyg4dnUIwViebUHYLl5/bhmvlMVFaGUXFBRl/GvMotb0DpC5RIcZJqPir1cEogStMov
	 3U9R3kZEFqTZAW1l4XjW9mI0y+2/nNPM7uGYu4Plgf0krQyOHUkkxvVRojgtOy5umq6yz
	 rGOPI/A6uSu51uhegc5EYZ56WYjPXek/rMMKbEQtieXwOO8tgGq7qO48Ut6DpNlS6Iqm6
	 bK7U+AY7eVdJFk4wR01tSDwiXoCEEL0ecRaPAFHDH0SnaixaoNak7ZN9yOiSrzgIqbF8d
	 xGlHrJoywbhFlSoR2EV/chgbo3+msN9iGQSpr7FhxCd+4/6KpYpTKFBdmR+INp02OWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702531;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=PZCWpBrsT/DLqznKxRT6TrmH8PQ9kwsErJKsH/2koHE=;
	b=25m8gPCsK67mj36L9VSBrQ1upbVgN8h71qprUAQOEPbA3YIRQKBV7n5uVBVxgGru80P0
	 gC2OZtnXITikAG7wB171vxw6QZ8+haRsNYdHkDgs0t3c65bQs5qb+fra521AvYu/MrrjN
	 xhiasSX9Uj1nS/w54dY2r7lBoxEYrZdKGAZ7+WGZ4UGQbz3vBQgQxmtaUhz2nhfFwMN1U
	 hTwvVouTXT/u8p323dHimqdgDRtkJ8epBOnccCsv/gSR3YZmqAtX97Yhcq24dVyc0rv/B
	 5JTh1ae79bgtmoNh9jNbJPHdMAIW4bBn9kt1O9p4qxToNCVwbVLqPb4J0s6TmgaSSPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=HnwAdAh+;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C7606BFBA;
	Tue,  3 Nov 2026 10:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526C7606BFBA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=HnwAdAh+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=PZCWpBrsT/DLqznKxRT6TrmH8PQ9kwsErJKsH/2koHE=; b=HnwAdAh+42Op1WEPwRTJe5/sRV
	sm+duJGtA8MNwnquPX4GFGLLEZSZ72pPEQKkd+qxMGhoIEyHTos3ZoLKWUWbznS4XylSbzEkSr/Bc
	dhI1XQ1iT7XaqZ+YXeaFOWIV/kD+dFeiS6huYT3Aq9QHdu+eOxR6L/NaN8rw2Mqsta+5w7uSSlUDj
	cgr40Ge24ZjQz2GSslxGyWSVGBKxWarU2R0TtP9G+GzyFNkuej1QrWdOC9TJx3SKpeTz7SWZ9nQ9q
	62EveSUodD69EuKLzcK1GvyUEiy8Lh2a2YjjVxRDgKpTfdVVcuMSQDc6U23Fohygf0ZVZswSY+YZH
	hfU6tTCg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOBxx-006sNa-1Q;
	Tue, 03 Nov 2026 10:42:09 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 02:37:48 -0800
Subject: [PATCH net-next v4 3/5] netconsole: allow configuring the rate
 limit interval through configfs
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
Message-Id: <20261103-netcons_ratelimit-v4-3-b554c27ba27a@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3219; i=leitao@debian.org;
 h=from:subject:message-id; bh=iUmSjIDDUkJnVfM64oAkpcnZSQ6YpVyoc0SXbgtTe7I=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6bpq0NeHj8B0GFFgLrhCSIMGX2GvvPLT2Xx/y
 W5UdgGYJ4yJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaum6agAKCRA1o5Of/Hh3
 bX4RD/4+iCUY3xPO7jB9q5ahvRgbrOsTwTjh0bD5IG+s60xJxPuJqjOzRGqOFlfO4ccGpXX1+sR
 8RBbqmYxLTrVg/RTrVpGAk30+yjJ6jupP1NLqLQ5BH3rfgCLKz5QcEcHvkEpnKjwptMHtQdrGeh
 ufScjTXL0MGcyEqo4FYcwYlijYnYXgwrB2g2iwQsUc8s4+pdON7iSzqFDnux+MEvDJX0WVR+Qkx
 IoptCB9+vc0hv2C0VrKhOISkzDWMnvv7I4UYGz5BC7mShltBwZh1dmubzehK0IMzhIP1cmVG4cU
 5TVQrkXybD2Oi9g4x1VNzQtHGJyWezSmhfU9UqyKxyfiGNV1gq7mBYVTLarQQ8+16W51R4AqGYq
 fFmoCyIvH9FBTvwFmqzfDsOaluE31+RceMm5saLRtO1M1r4bC7TPIuAlIUgIMsjX3hWL8DiL/s8
 5xuEJMxEppz9fcIuP+3vsXpDKMEUkgjy3Z6Gyco+StDV8Ne8+nwhchv6ftHVQxZ5RXJU1s4xGMy
 m23tFxMTh7UlKO6u4ERXWtWVZ81OJ4dx794TgyotzQfiJwSqlZKxYuu1qNK2avpBNTOLwkpesdc
 LNqpGG+Y5qjtMILsZYBC4pHIP4OF1vZ3Sb22FuTgzo+irtkjwOQVf2sqK28HG55NLvxUHFVZvp8
 G4MG/Mz06GbgJyQ==
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

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 3e4495c1cab182..69acf2c5c6b063 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -970,6 +970,14 @@ static ssize_t transmit_errors_show(struct config_item *item, char *buf)
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
@@ -1359,6 +1367,35 @@ static ssize_t remote_mac_store(struct config_item *item, const char *buf,
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
@@ -1723,6 +1760,7 @@ CONFIGFS_ATTR_RO(, local_mac);
 CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
 CONFIGFS_ATTR_RO(, transmit_errors);
+CONFIGFS_ATTR(, ratelimit_interval_ms);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -1736,6 +1774,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_local_mac,
 	&attr_remote_mac,
 	&attr_transmit_errors,
+	&attr_ratelimit_interval_ms,
 	NULL,
 };
 

-- 
2.53.0-Meta

