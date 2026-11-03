Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702536;
	b=YzD6PT9c9xzUtoKXK/rAqRo4mI/9MnR042rraSoqftHwlVdXGJGbD/oiQyczHMjFqMWW
	 wQKF5b2/5UpALL08B/QRAWOsvwBAj0tlP3rD53qBeemZZK5KX5nPElGlEiZ/ds7WhronF
	 el5R1XMtAun6YYV6fhDtG4vVQVIcURUjXZUyt2/FFj7p7fBQGDrzAH2VFYg2XLEzGx6EL
	 nJkETNZFtPixIsTjskUxPn6l5uXwXKae0fKexTEZiUXOSFlwlsJlr7ZFRhwnEH5fjD2dx
	 fD4QAxppaf82JnT+ehiT9hpszTW2bfUNlQdFlsDYWnNhVVh5SHY4qBKGhXTvkl395TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702536;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=Wk8y5lyddSNqISmOsoUMorH6jePtOzGwLZbSsd0cfgs=;
	b=XRbDkcEV4bPC1upbg3D148xiJU+HWnKxOKORaHsrZrg4hqAyDDpQHBloQTwX7G8+oUE5
	 nbFGOc4fTsnhGKSjew+fw0nVTamfcRRXqAjE8PbPJpdr+HenifHh3xafW4u/yn4wjOZe9
	 rGAYmlR7/wGALFMhMISjl5e775nc86O3NxTYRUcocBYboiZTkee+vpjd/RTfSvsX1zCIC
	 iEGE8yzoTIpWpvEtnYm0/1VfKIcOUWfU854S0A3g+L/m+bZGIMAgfrPs1RIigO5A9OqNP
	 RlxCLfRdKltaEig8uSmk4X/Rmbv74FbeAdiKzB7cl/TUr7toKOiOgI2TOkfGpXWYbPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=PMLzXqRw;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C2606D815;
	Tue,  3 Nov 2026 10:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299C2606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=PMLzXqRw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=Wk8y5lyddSNqISmOsoUMorH6jePtOzGwLZbSsd0cfgs=; b=PMLzXqRwCaEeV2bAPqh2aCVPKl
	YTgOUwFaobiwBqlsHVeSiKDr1jBSe/WqiwfBy18B9tM1d4yEe+rI28D68J/IAhUBefUmDeYRWtWj5
	+fXGdgt22YhQVbkscjnQVfEmmbJe7mt4rx+qjZitektvbFqx9rGKP886j/q7tIs8kHKEt+qwOHChL
	AuJoebr4gZRXTPUVfMZNPfV6I6+D6ytuhtQyQVRXt7Yk0tFRw+B6y2/RnbrPUxpfdGoD4WfT5SJcE
	0xBo+CRi4Io4yc7pJZ8j/wvvg2HZ07TY78D+1Qngjt9hFhxvlQDJTuTB3/erD0rgz2aOsH1xqjvEn
	dM7cUDNA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOBy2-006sNw-1G;
	Tue, 03 Nov 2026 10:42:14 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 02:37:49 -0800
Subject: [PATCH net-next v4 4/5] netconsole: allow configuring the rate
 limit burst through configfs
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
Message-Id: <20261103-netcons_ratelimit-v4-4-b554c27ba27a@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740; i=leitao@debian.org;
 h=from:subject:message-id; bh=ivuyYyxed+3cACuB3kGUwV+T4acdnEPo772SlTJgVtA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6bpq/4WTNBvEVdLC+6EHAIjWDIwLnLHqfnnTw
 mNqK+HVIn6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaum6agAKCRA1o5Of/Hh3
 bQd7D/wL0pe9dcE49s4VF9+tOlY2Ef9HP6I6pdP0NOly9SuE03ashVUUYOThGDfow64SjSnc7X+
 OS0wWEfNYPHkrIgUw6u9x/kTZd+f9GEQ2mhmoYe29JNnj40WJMPgEG3oAnFg9j2NDw7s5Wuk1cP
 LBt+CC4UhplLVggcu+F5ThylDu0skDFxiELw4Kz3C+Am/og8P8/Nw5AZ1j+Hbrmx/eTRs7Djpxr
 sAxc1dOYudtLx/6jT61hUG3LbgZTbBuPUtcd8Ujl8KOIfAeFCUV1inPl19T/DtkMNjZWFcE6DLy
 DCrRIkjmGs0DtmkSKGxXPzrM8IOH13L5/nenViuLjsWpvu8M5quGAQgfIvFoo+SCKl+0vxDNZJ7
 5FznpvQa5XGOByi+64yyn07FOraemCDP7nNhdJ3qU3auPcV+cLYZWp0UMLoLCTzPjCyq52gdHtI
 Po2uF80RsU9YViSgCRg3bsLJ4l2q+3xg4RcpfvdnCmPpST1fC9sr/blFI4vpQ4h30pJndUgQ0Ka
 d7k28aeGmVHdEyGb2Le9QkOS/HgVJ1Wp/sfJ6DNKr0M26S8ugl8lkb5X/MNOImWCymUy6HKWVYW
 AysQAh6MK8VW7A13zUreI+O7TqMYragAHv1p71cehHIcDOONlCQr5Dadge0WhoM71fxk/EYcAz2
 +NZhUTyiKsM4wWw==
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

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 69acf2c5c6b063..2adf09adb9688c 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -978,6 +978,13 @@ static ssize_t ratelimit_interval_ms_show(struct config_item *item, char *buf)
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
@@ -1396,6 +1403,31 @@ static ssize_t ratelimit_interval_ms_store(struct config_item *item,
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
@@ -1761,6 +1793,7 @@ CONFIGFS_ATTR(, remote_mac);
 CONFIGFS_ATTR(, release);
 CONFIGFS_ATTR_RO(, transmit_errors);
 CONFIGFS_ATTR(, ratelimit_interval_ms);
+CONFIGFS_ATTR(, ratelimit_burst);
 
 static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_enabled,
@@ -1775,6 +1808,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
 	&attr_remote_mac,
 	&attr_transmit_errors,
 	&attr_ratelimit_interval_ms,
+	&attr_ratelimit_burst,
 	NULL,
 };
 

-- 
2.53.0-Meta

