Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99013C65E0;
	Tue, 18 Aug 2026 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048998; cv=none; b=jFHqZOf9OfcZcZJoe/otvnb2DK2l1zwh7+yH5dt2HzKcauYM14udnZElfvIC88o+45XOjsSWgyTju4LAXlmGGZgZhmVqyI99UUg7j5abDg8w+DdhZx5XAMSl+rhRlBtvJJiQD6+p9s1KxqDffnHyxovzItr13WfnPDl/SWo1E38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048998; c=relaxed/simple;
	bh=+PEINribgpDWpNHxXOZNeeb6KNomusmu0cKY3eK6Obs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDWCbm9PB7mbppVum834jP8kRhgolAUW/t5YYoU6BMQC0g47WeBou7VFQyEXYD8tQMwOOB6elefd5hQiukgIo2flyZqByBHfPaMOgFExzWukEzCdqkXb1HiAoByqftJhShSfp1pMoyhXTeL5lOlr+vXL6fF8CMitn1icNJ/jzMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=HgdIeAgw; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="HgdIeAgw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=tUdFNSHtPF7z4z8dWRcTnirk4pd4hwL1PbeqJshlGOg=; b=HgdIeAgwIe5zPYVsy2QFETJZHU
	dahuMFVnIMRT0qYfbT778yxNn9IXcRga3WteAUu+2MyHE0d8xmicZQR3BufZW0GcBPWERxJwTUQgu
	YA1ErGcLPWS+Ey07SLWaiNrYGTXqQkInk59qykcbD5fzBU+Drc+S9dCWKXIVPSNx5ry+2hEsY8sIU
	3IbR9KKwLbgz/rkHRhfbeFCLFnglc05Ws0+1fqwCoUiP5eZkVhO6GQNAYftCEi6iQGut/+3vtd7DX
	VywL9rGlmCRe4f6NwL7mjfFxg7CSHc406decnoQ5ETJ/rfmp05MwTrIgLT7wYYf2Fu02BTdsMonE4
	v56OJUjQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwH4p-008x63-2T;
	Tue, 18 Aug 2026 10:29:52 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 18 Aug 2026 03:29:12 -0700
Subject: [PATCH net-next RFC 2/6] netconsole: allow configuring the rate
 limit interval through configfs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-netcons_ratelimit-v1-2-8c5d2d17789c@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387; i=leitao@debian.org;
 h=from:subject:message-id; bh=+PEINribgpDWpNHxXOZNeeb6KNomusmu0cKY3eK6Obs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqhDQOF00k5m+HLNyG3w2xrJQq9qVi5ltmb/KwG
 L6Hc0BcdHuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaoQ0DgAKCRA1o5Of/Hh3
 bYoTD/9nOI0f5ktqnNMRYwxxpQhLJX6YBuVvN3Je3ODL3Q9szQCW467wM4jbnIHiZ3czJWitxtg
 l+ZkOf1pUNw/yULe9eGbk+mGlj4BFryF16vmItco3Cc+E4KLOWJEI6o+vMWrPBIr0qwSED7FMiH
 TuAsKqdnopX+ovjjV5R3G2pn5x2LvVsiL6RnyrJ2JaNy8Ev9DXHX3A5p6ikcdXF8Unc/2RRk7O6
 Uid5zdHnu3owcGcYbb4IBiPmSmrsOcQG6Kjy2eGJkjr77+LpguuITIW0xUo2PTOvlQDODlC8WJH
 WQtmsaW71Lex66DacHnAFV4Ki8X4QolmM/QkoQm6NDpVjFxkGmDaIKXeutGCwTJFkjhRl/3vi3A
 UTzd/m0tsL1xraRZWWNPn65u+3Pz9v/6ZgR0tqDq4/tModc2tG42bWVPW5vfFNnE/JdH5h4146b
 3IVulqJTp7ZQX9mYmvjXnwxU95F3EOHdb/PPi2ZyqKEslEz4bwFG/bncpeqPhjgnoXjFrLVAZH3
 mPvU9/cOZ/Ar15PGZ8D77v/xXxa+O6v9XwEDKl0i370E0odzm6RxfTjHN5sEAp5C4tj8CIZAJw+
 wzTmqq+Sw5a0nqgUmzeBhZzk8Q3n8JAUwhHuvYZa/r0MOckOPSvboLxjGsra8JKiSf6sJcL7A2e
 +Sv6drdOoKMDAYw==
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
index 2ad514afa2b89..6f94495d0abc3 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -940,6 +940,14 @@ static ssize_t transmit_errors_show(struct config_item *item, char *buf)
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
@@ -1335,6 +1343,29 @@ static ssize_t remote_mac_store(struct config_item *item, const char *buf,
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
@@ -1699,6 +1730,7 @@ CONFIGFS_ATTR_RO(, local_mac);
 CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
 CONFIGFS_ATTR_RO(, transmit_errors);
+CONFIGFS_ATTR(, ratelimit_interval_ms);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -1712,6 +1744,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_local_mac,
 	&attr_remote_mac,
 	&attr_transmit_errors,
+	&attr_ratelimit_interval_ms,
 	NULL,
 };
 

-- 
2.53.0-Meta

