Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8823349BD75;
	Thu, 10 Sep 2026 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048004; cv=none; b=AxwrYncBCozH8uuS3xU9s9Vt2I/9AJeoZL+JiPFbLiKWW7JbsSe32v+xZO9s8Y9NzdFoECOH6o3OOI98MYuEW6RrqBH9GunatEQGoAmdtRENTmn3c+2K33W/U6ZlzHxS+2Qf4dWcyjRyLl2xurGp4AgJM3UK4o8PwMFlo1EE0VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048004; c=relaxed/simple;
	bh=GgvXD2xrB1iqUR8ST98lvwz4QfQlTRnHGFVX6aPoO0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/lHSsOtRCmhrW8qa3Nf4f8TkTHCd+JrYQIXOKLjF7bGX3hMhTR+/7hvNSeHKJ4jA6raHO9SrSE9SlCtHKkSIiyzHnd6t7T7YtQZWRfBRM0AI3s0p0dBNm20+6ZBlkNs7D1N5g8yW9yahsuLJyov9764/TP08UypdpKDYZtT/i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=qbDXvACd; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="qbDXvACd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=tMemiC/iqLpelYSBghG5uWB4ftBE/dbkc5Hnp9Rt9uk=; b=qbDXvACdJJZCDCafjHkjQ6MRnL
	ouv+pvJdleaeKANnxKt4LFnL7215Qhcn81yWRh5AVrbeHEIyinDt6IgD/o8ilIDheC9jeFf3K8GGL
	J0uh66b/HUnEteFd3lgfb+RbBuMyS6TFZ0rJyYWP4WPVhwY+DaJVOjCMpVcpaxdjsQwDxvxf8tu/7
	RsoHfay/cy1/NmWP9kiw+PLjP8pNzsZEcZEyogu56uTlhBn+Bw2PnLtbikUN95EZnejXcpKMGTOif
	/r/s5u+EZNLdnY0xFgjuSmaxU44/STzCdk6UdVLnyxKxg91plX19WUTltP5z4lMMwDOJQvLTTBn1v
	w3gZjxIA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4f6t-000YI2-24;
	Thu, 10 Sep 2026 13:46:39 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Sep 2026 06:46:11 -0700
Subject: [PATCH net-next v2 2/4] netconsole: allow configuring the rate
 limit interval through configfs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-netcons_ratelimit-v2-2-ebf0dd91e26e@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2389; i=leitao@debian.org;
 h=from:subject:message-id; bh=GgvXD2xrB1iqUR8ST98lvwz4QfQlTRnHGFVX6aPoO0E=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqorSvXNUJRgefIUH9DOrBZotYfAFBm2nDD+K/O
 vsLTDadkf+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqK0rwAKCRA1o5Of/Hh3
 bWI2D/9cvJsYgFigQx1Iu2yY6vZmHIasUK8nyEC4/vwPgY1ihIFyp+WxYTX9GjQAXdkHZ8liVQQ
 lc58lGpG4E3Z6YWy0JWpLzzWgR82HzNU2w2GTkaXbwptliWtNfEyWf9QCI84vQpQF2rVmEb09QY
 a/DySYWGx8PqdiixK9ikdiPASE9PhwE9x34oyCikA0+HLClp2W3iVTNfcHa5X7aU6T/VKnLpQ7m
 1cBy/hblMU5y/X2noyCZcwe2tyN/wpWGc4z6L2m1lBaO2frz4n0hk7g1Yf40aujQpr4CT/IMzmz
 SAWW+ZXB7v1qelTGBh3Z6q5bIx28AgMbhTnbFlQO7Hwqh//hZhXxZ6UMvhY0zocfhU2jcwCMxUC
 3bRmiYrqQo0dA9VQGtUvPF1QPOJtHk8FfDkrghzpEcYr84A8W4NNZ5bjk4lAm8FHIOQ5NwR8Rlp
 lp30cU2nQGT3n2SbwVP/VeCdgCmkwGMXfIoE/RUTrlbCDOlkAPb03vZL+4nCmUqJccswoU6TaDc
 5ULYSsabZIjN5sSUebrtRoyYzwZ7Uhta7DOAlJ+nhFsh1htb0EuBFWv8UwMlDM7a+svRfxpaKbG
 c8zbhQ3SP6egaqVHrZ+sNjo0ToQy0m/WcM35aKi1Ah4SZ1+PrMem5wwnyhAoXl35LoJn44kYP9X
 s/Q8nXfEXgNO9+Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The per-target token bucket has no interface, so every target is still
unlimited.

Expose the interval as ratelimit_interval_ms through configfs. It
defaults to zero, so a target stays unlimited until an administrator
sets one.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 13292c3f818e9f..faf8f9bbc6c0c2 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -945,6 +945,14 @@ static ssize_t transmit_errors_show(struct config_item *item, char *buf)
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
@@ -1340,6 +1348,29 @@ static ssize_t remote_mac_store(struct config_item *item, const char *buf,
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
+	jifs = msecs_to_jiffies(interval);
+	if (jifs > INT_MAX)
+		return -ERANGE;
+
+	dynamic_netconsole_mutex_lock();
+	WRITE_ONCE(nt->ratelimit.interval, jifs);
+	dynamic_netconsole_mutex_unlock();
+
+	return count;
+}
+
 struct userdatum {
 	struct config_item item;
 	char value[MAX_EXTRADATA_VALUE_LEN];
@@ -1704,6 +1735,7 @@ CONFIGFS_ATTR_RO(, local_mac);
 CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
 CONFIGFS_ATTR_RO(, transmit_errors);
+CONFIGFS_ATTR(, ratelimit_interval_ms);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -1717,6 +1749,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_local_mac,
 	&attr_remote_mac,
 	&attr_transmit_errors,
+	&attr_ratelimit_interval_ms,
 	NULL,
 };
 

-- 
2.53.0-Meta

