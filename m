Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106883E0255;
	Tue, 18 Aug 2026 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049005; cv=none; b=MKHgg4kNQVdXZE6RyOvBwV8qKS03NGbqVVHM33i52ou7TxJAyGRR2I5nTNetcQDWVPgFf70Q9pkvLMYvfXU2TP2iWc+m84kC3LyUm3G19V/B8LDQNAg9XyS6RugjNd3DiyBsbA6/I/qp8qnwDRwu7jzZAN+ji2pQrXV8jHyCCFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049005; c=relaxed/simple;
	bh=R5iXd9olCf6Hc+oy9EHjUHxjp0R1Ga+f57pdI5oZ1H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0undrTN87R2AUyVytrIkyUvd8aSpD8uRzFVK2p7oSrgXaOe9t50myNGgRAyPd4R6TG8hxcK/QQNmQJBMecwmzWtxze6g1ojRE6yKeL+zmFl3JmZk6iWOUdLORHQAwztysicC7tX5kkbe36cFU7LaTVleDvboDPxQeT2rBTAqeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=QupJKn5m; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="QupJKn5m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=sxZtfqnwWWtAmKIrsR5oLgR+/1CWbp+LHmOJL0bB/lA=; b=QupJKn5mQiqxcm1XTPIme3LTwL
	K05HdkaoZkzP5GmDxyrSMph6G92qcD/q8zOVMBlVGXqutPJwaZKLkMQo6vO1mE0bJlRPqQ/E9Adt8
	zJmtcdTDJ7xfo9oOuizJkvpsIhmz/irzP8wSbQAp6ytOtiQSc+KEfxALSfZWcSgZa7CyFLwl3pFAK
	4nsMr9b3KDdJcRMuVrAEFIhi+u57qW18Z0mwGzZi0PKseWxKPcCRaVAFehP2MbqQ5OzCHE/7jkN3u
	V+i+E+h3UYzLBp7+gddBpN2T/vQ3/U+1HAuwT4wjgvi8JvcpwjcYRHdQYN3hvkaPoa29B56Sz80JA
	cJu2CASg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwH4v-008x6O-1A;
	Tue, 18 Aug 2026 10:29:57 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 18 Aug 2026 03:29:13 -0700
Subject: [PATCH net-next RFC 3/6] netconsole: allow configuring the rate
 limit burst through configfs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-netcons_ratelimit-v1-3-8c5d2d17789c@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2283; i=leitao@debian.org;
 h=from:subject:message-id; bh=R5iXd9olCf6Hc+oy9EHjUHxjp0R1Ga+f57pdI5oZ1H0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqhDQOdXIrnqoQGDGi6J1jK88hwtsE262RGDZbc
 djkUf+qkv6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaoQ0DgAKCRA1o5Of/Hh3
 bY6fD/4vUz5sKAVwFICoNyZyQEBHyzqRJRD0/q9sZdVn3gEN9E7ndgb0ldcxvvArnz4T/rkMDpx
 BUqpjvX6XM7k4E2R7fPDRxK/GPTaoHEaReZYkfG8UmvZty0t4NDh1SyOCOAH3H9AkehhEpxYnMM
 OW97ugy/bjMQQM+sLS43tIJ1ft1xrtyLNC3502iGUw47oEogo9BvffVVYuBLc8TwrTlNgjZBFbv
 XxrAPI5WAJJhDGtpDx9Kx6FG65C0SQaAkRsx4PBQPnZGaHUhCo+HruRvT0BmbXvlEj+U1R8p5jO
 ulCWHQgUJso3ohL1Uqc54IkN/zIXioo04KJsjdPGtoijECIubBGRHkSX4/NlksZey7t0Gp7VNJF
 Mr802ouEXY64AERQwk9yPrzXeDNsBFMKhl9GgIgGb0Ag8hTYNUyy68GlSZMK4WB5u1sCIcprY0P
 IMVgqa25T29OfKxLYp5cdeYFWE94S5XsTbLr0G7k7Sni3cka2z/mF67P1U0Nf3FPv4bGLIepavn
 vCkYq0dcF6A5BwjJRTFnyPx3BeZiC6Wj/WlQ6UedzHSXUA2R1axUSm5qtCFKV3GCJ6D130krYvB
 K47r5hwaTDvyq3n9GZOIJ9osE64a1l73Pz6UpdDkLWWxlo5QzPyQXcmO7T/qHBt2+apoAiqxNkF
 OGbATfFBxtFnEUA==
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
index 6f94495d0abc3..6d60a5188bf13 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -948,6 +948,13 @@ static ssize_t ratelimit_interval_ms_show(struct config_item *item, char *buf)
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
@@ -1366,6 +1373,27 @@ static ssize_t ratelimit_interval_ms_store(struct config_item *item,
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
@@ -1731,6 +1759,7 @@ CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
 CONFIGFS_ATTR_RO(, transmit_errors);
 CONFIGFS_ATTR(, ratelimit_interval_ms);
+CONFIGFS_ATTR(, ratelimit_burst);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -1745,6 +1774,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_remote_mac,
 	&attr_transmit_errors,
 	&attr_ratelimit_interval_ms,
+	&attr_ratelimit_burst,
 	NULL,
 };
 

-- 
2.53.0-Meta

