Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5746D2D3;
	Mon, 14 Sep 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387854; cv=none; b=C0SjOzOOdpttXvu2p4wo6u+DdUq9QqearDqYjZSg7ce6VHEKCSUv3yZPDzKZFUEGQ+qsrKgvFeIMz3fnpS7FdFHj9WsGp5zh9pp9yvumt5bG3nFuVS1uRw6p5XSP93ftfWwuaT5mYHwwKKCtaaJdlwaCh34RYMpS8BmIarUFLT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387854; c=relaxed/simple;
	bh=xC9eheCbPDQeFe5WhOtC4rtGUt7ob8GpONmRkWiUHW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cegT0DyHCyWcDZHwRP6K9jKuwjJCBF0QZ0fMEY4VMU9MekCE97s+Wn2rmk0wpXwlnYCakyX1m3v6HKwRzGTc8amLD3ar9HDSGAHt1uFJfJe7sCp/UIafhyc/XUjl09KDcYsBoWmerXN2aU1pWrnr+zJ99ioYgizqQ1yDWn5LWDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=SNf5UG+2; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="SNf5UG+2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=cO9ZFId8nWTm2pkBnUuRRfsysKyuNOHqLKO3CRNHOpc=; b=SNf5UG+2BPkzNDLlQWZmew0JrP
	Dh64DSeilcG5MS84NP0oooVflYV1iseaTOZP89TcWXpllDZ+y83EAhZ5DRPeH/wKJtiS9GaBMzkf6
	VWHzH3lcp/Q7L/YZqRaUqFPA4wAwI6JGQkUz7H3qMHBo+agIerj1RmHYHkYK1M+1LGBggk50gYvq9
	D6ktThDZM32aKaQR2DOf4ew2FmvrMgUqdpCAKIWVArspAokw6RQNR9jXbxkwYo4yL7NNCAOrZwGZh
	j14v7oy+G/zKIk+7FidLBsac+6X1bQ/xDf2uMIXKM4VTgrXk6eDDG0E1r5HaUmx0ePG45fx0BXJwx
	l8Vn/UTw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x65WN-003bZc-0e;
	Mon, 14 Sep 2026 12:10:51 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 14 Sep 2026 05:09:54 -0700
Subject: [PATCH net-next v3 4/5] netconsole: allow configuring the rate
 limit burst through configfs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-netcons_ratelimit-v3-4-8e81b789ab37@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684; i=leitao@debian.org;
 h=from:subject:message-id; bh=xC9eheCbPDQeFe5WhOtC4rtGUt7ob8GpONmRkWiUHW0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqp+QxZxcjH8L/FUUiAVQliS5LzhsYn6S+Xilr2
 qqMwfADScaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqfkMQAKCRA1o5Of/Hh3
 bexND/9DzB4We+mgke/j/cgzfJRaBV76T6fl2CcK0UXVB5a2m8iZQD9NshPhLZbeypcwFDVZzVh
 lIkfRZakXJ3JoAuJRPxXQlomnFasa+/XnUkD/L9Lc6XHpO4BFRN/rLhNjzvmEEzwAkh/C9an9lW
 jvrdHSYrBGWuX/40uo38Uj78b/yVGFV5pvVgJfyabjI0M2gSOwHWyhxXBiZcoADP70LunHqJzpF
 lUTNm9LDlR6/8o6yRyQmjGWdKztknL1CnVZejYZCYLhCtTSULbtXfV1XioAA56OGj+ZPm7x5W7l
 2EjKUm9lIDEqHPTL9xw27p+dVvmtOaaVMXXxaBRP/NEbd/vXKd9DZgteymslmyfNBFvP3sN4Xw+
 yqGJ/V8bLbm4kRfsWmV+oL4gtahHDJIbO9HT15+HTIVyx5BIE/qUFtEwMDvqKCmYzrnO52baC8Y
 mrH2DZyeyNlX4bAoFZFNvfvaUhso7YtO+FwSQ7gsJTLNgtVXOfzFcKM6wMVS5rvN0EpwuARb7Yp
 t4XuH7B/gU5OrrwKn14VPW0Wr4PZkS+jlP/kBdZbpyaTe6kFd1BKqAhDijVQvn8iFrlLvy7qir6
 if2yZTC29NSpSEGkidYs3oJq5z5yrpLZRgrKnluIa8j6HKNtj0RhB9/OD4bN+Tnh28BD12Tag3M
 mVSSZ8fBMHSs/dw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

A target that sets ratelimit_interval_ms runs with the ratelimit default
of 10 messages per interval, which is either too coarse or too generous
depending on how chatty the target is.

Expose it as ratelimit_burst through configfs.

Restart the interval on write, as ratelimit_interval_ms_store() does.
Raising the burst of a target that has already drained the bucket
otherwise buys nothing until the interval in flight ends.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index d4e3ac272e9b4a..691a97c931a3a9 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -966,6 +966,13 @@ static ssize_t ratelimit_interval_ms_show(struct config_item *item, char *buf)
 			  jiffies_to_msecs(READ_ONCE(nt->ratelimit.interval)));
 }
 
+static ssize_t ratelimit_burst_show(struct config_item *item, char *buf)
+{
+	struct netconsole_target *nt = to_target(item);
+
+	return sysfs_emit(buf, "%d\n", READ_ONCE(nt->ratelimit.burst));
+}
+
 /* configfs helper to display if cpu_nr sysdata feature is enabled */
 static ssize_t sysdata_cpu_nr_enabled_show(struct config_item *item, char *buf)
 {
@@ -1390,6 +1397,31 @@ static ssize_t ratelimit_interval_ms_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t ratelimit_burst_store(struct config_item *item, const char *buf,
+				     size_t count)
+{
+	struct netconsole_target *nt = to_target(item);
+	unsigned int burst;
+	ssize_t ret;
+
+	ret = kstrtouint(buf, 10, &burst);
+	if (ret)
+		return ret;
+
+	if (burst > INT_MAX)
+		return -ERANGE;
+
+	/* Restart the interval as ratelimit_interval_ms_store() does, so the
+	 * new burst is spendable right away.
+	 */
+	dynamic_netconsole_mutex_lock();
+	WRITE_ONCE(nt->ratelimit.burst, burst);
+	ratelimit_state_reset_interval(&nt->ratelimit, nt->ratelimit.interval);
+	dynamic_netconsole_mutex_unlock();
+
+	return count;
+}
+
 struct userdatum {
 	struct config_item item;
 	char value[MAX_EXTRADATA_VALUE_LEN];
@@ -1755,6 +1787,7 @@ CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
 CONFIGFS_ATTR_RO(, transmit_errors);
 CONFIGFS_ATTR(, ratelimit_interval_ms);
+CONFIGFS_ATTR(, ratelimit_burst);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -1769,6 +1802,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_remote_mac,
 	&attr_transmit_errors,
 	&attr_ratelimit_interval_ms,
+	&attr_ratelimit_burst,
 	NULL,
 };
 

-- 
2.53.0-Meta

