Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B304494A0F;
	Thu, 10 Sep 2026 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048008; cv=none; b=nv8ZsGw+c0Sk3Sw92jtr/rC6sh37I+PhT0SS8mnzQ/oc3iuLlcRxkQ4qx/buBc/qt207wrHQqYsQIxpFvYr9yqqW5EIEZEBIgs3zcR8hCTzcn9Qasdbd5kIMoze5c+cLpnhMW7AKqctIYtwOnj6QEidaZZQPIujvhSKpTacbXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048008; c=relaxed/simple;
	bh=R7vwxfMtCdVEV0k2K5iBJN4LpKxwNZXOtaX277UogyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOvq+j7DaP2PvJt5cFcSbiGYkx6hm4+Oerc3UACACzVmXam2bJcWq6RkqrNHys6akZHKwUIFt2a6ZZJTro41x3vRb0tXgd2aaBaKplWZHkXqouBuu4BVSwY4+GPakefkc6Kzsino8Z0qYqzSksDlYEEYcrXMJ2X56ddJs41Da10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=RjrFD+23; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="RjrFD+23"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=ttP+erLBmJ2WI5yYL7mzHv/oynO9Da7pLbV1+ebVkF8=; b=RjrFD+23bRpniFtVQoPqTFgBCU
	cETEDVUFuL+qGFysmVLKfSBt5GvOsIAEjwEF/S4OLCufe2RoRiXkYfIkFmsnMnNb8PWMbCpAIIapZ
	R0mXTThQMGeIKLQtCQPTmyUxy/GAXplWGgLmCTsOq/Hic6q9OAsv003AomFqN0oWwRFoz8Y+UDmzu
	0wJ4xDrIyEP+AQqAI38ESgyPn82mWDUXJC/73wcQlnscKAN1/EnfF3Q2ZIFZmDtW0K5U9/PAaeSbD
	FVjMeuUOAtMvsbgs7y+9Mdkn4Cbre+DvFT7butZovRebNjzpP8SGLzg/oIjgZXN+TfnsrH81pCMGP
	/jjnYIdQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4f6y-000YIP-1w;
	Thu, 10 Sep 2026 13:46:44 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Sep 2026 06:46:12 -0700
Subject: [PATCH net-next v2 3/4] netconsole: allow configuring the rate
 limit burst through configfs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-netcons_ratelimit-v2-3-ebf0dd91e26e@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=leitao@debian.org;
 h=from:subject:message-id; bh=R7vwxfMtCdVEV0k2K5iBJN4LpKxwNZXOtaX277UogyE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqorSvLBvF21kvR3NEZrcjPyifJdniLOajaP87d
 +IwbKaRUGOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqK0rwAKCRA1o5Of/Hh3
 bUJ/D/0ZKBLlrzeUmiqB3H9HU3QKePR677ssjeFv+vQN3PlgZpRJ4vVamimxhhnxjlwscxA+DsA
 q+MOMlgrsEc40FF+pZ5Gv2GCWv0WQOSnv/PAw0pqY2ncCD/pJDyV4CdUJ7wYV2FgL5P2zLZ2pwn
 nXKusx2GbzsyoF/FVZvIEwUVQzCU5++ojWcv7/K4tOVmHbTPMMiBiOp3DSeGKZKNUPs2i5NR1WD
 7cLjrWCxD55bym665xxuRxf+iyDUuEuxrcMyf8gmHaGrL1ERLgXVAvzF6pJcQWwL4ZmjqwRicQm
 z4dUpo/4K3NFQ3iOlatcD6eWzoGMw9VaTS4SiCSoApkX6+p4SzUsEtZNE45OlWE6nj/V2Q9TP/U
 ndwL2FK0qinEPClO4OzHIGbG3VHn20O4rVRTFNXIXHQmbcZ4MqWYRE4D0NefXj1//jM92EwzoU4
 sOa/pBoT2sWeNNTgnPJx7JwYBIOHRQoH9Y+2UH5uP/fSsMR78Nzj0frgUfQQkaoPilj+oQhw6rh
 LDIRPTL/1e2AjfJ1iuEmcSgEf9kOdjmGy7PGSsd0nwEiZJJGEJYyZuzVEJw0ge5KdRyCCc0shu7
 ujvnGM70mEcYCUW9jScpuB+15E0X6DkgbizKG2DR3oXRVtS7Y6nFt6axdas9HPaNLMZ9gWKByhk
 x7nRCbKVFQViKxA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

A target that sets ratelimit_interval_ms runs with the ratelimit default
of 10 messages per interval, which is either too coarse or too generous
depending on how chatty the target is.

Expose it as ratelimit_burst through configfs.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index faf8f9bbc6c0c2..10e02b7c3f9cbb 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -953,6 +953,13 @@ static ssize_t ratelimit_interval_ms_show(struct config_item *item, char *buf)
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
@@ -1371,6 +1378,27 @@ static ssize_t ratelimit_interval_ms_store(struct config_item *item,
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
+	dynamic_netconsole_mutex_lock();
+	WRITE_ONCE(nt->ratelimit.burst, burst);
+	dynamic_netconsole_mutex_unlock();
+
+	return count;
+}
+
 struct userdatum {
 	struct config_item item;
 	char value[MAX_EXTRADATA_VALUE_LEN];
@@ -1736,6 +1764,7 @@ CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
 CONFIGFS_ATTR_RO(, transmit_errors);
 CONFIGFS_ATTR(, ratelimit_interval_ms);
+CONFIGFS_ATTR(, ratelimit_burst);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -1750,6 +1779,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_remote_mac,
 	&attr_transmit_errors,
 	&attr_ratelimit_interval_ms,
+	&attr_ratelimit_burst,
 	NULL,
 };
 

-- 
2.53.0-Meta

