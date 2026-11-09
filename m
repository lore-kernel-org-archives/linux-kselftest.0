Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217004;
	b=OdmiQQWr78SZUV2qh6r5VBktI9HwRP7FrAH0WMciAjguurgwZo39AJOSoNlJQe0a+wFZ
	 NhrYKBK4vs59DBunVlj/LBCLMEas/2YRx78xvt9y/lfDM6HcQbdP6sfnRrP2X60FdTzDw
	 oRg/bJuWAjlkquj0xV1HEYUi9dI9lUlVZr7IYV2qg4H6L8Cpf/u5WQ7Smc1innOGNkt5h
	 FK9EAzJns2aAN9X9wsQFJsORuDh6cefSCrtGaGZ0DHY6rwxCpgomRZmKTrJZLqR22434x
	 sgYWGUlzJhO3iJkFNTGZruZBHndKzCQdJYTk5bfYCA65RfFin1fYAR2wXkxz94tvpAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217004;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=AbHJFygprYZ5Kqa80ZFE6E74VuEFjurGbCACx8+rqmU=;
	b=4zL9IMVEfA8jVySJ4RXLwvu9ucPJH6R/pBfjd7ew4S+itYnBI6Mkr3lMq8hymfE6vuJ2
	 ppL2Fbf83GkIXlXRA3QnIhESeOkMN/ZjMNWqeiI17J+LfKUv70Q5HJQ0H74/KIpYbdHKt
	 PT4Xtv5M2KHxaJkQekvtPEv+Cy1Pe+gLv/I/j+NJeTDBpoNTikhpceGa9RZaC9c4lD15k
	 Bc/6QMKDyizm08SSp1ScuV+zRaaCDM1SYB2TJPrcNLsGltBvunl7Tkj9CrVHKuM/kIoMf
	 WD8GhLJJCygPbaBEQyxnT5z03Iuv5elNrHDoqqIzSOnlVf6D9C0URZZ2WPLCnYsygWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOP0jDiu;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF261606D804
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 09:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF261606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOP0jDiu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794217003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbHJFygprYZ5Kqa80ZFE6E74VuEFjurGbCACx8+rqmU=;
	b=eOP0jDiumDEWMDq6A4fSahWkR6uqA3XJ6F6HDINsZoncp6yHdVi6AlZZXJ/qFXL2GTGcTK
	IFL9psnRlcFf4cMIUzUhST8o600IqJoREjQJbILo/kWWV82I7zoOmiuHq3wcYx4Ndei/2U
	8h4X2hfBPsVL6ZZMKrAyDO4gCEmOPFU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-qWXSbxjzN9OBK6k3quynyg-1; Mon,
 09 Nov 2026 04:36:39 -0500
X-MC-Unique: qWXSbxjzN9OBK6k3quynyg-1
X-Mimecast-MFC-AGG-ID: qWXSbxjzN9OBK6k3quynyg_1794216997
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50D571956076;
	Mon,  9 Nov 2026 09:36:37 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.50])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 990D918004F7;
	Mon,  9 Nov 2026 09:36:31 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 09/14] dpll: dpllsim: Add support to set frequency on pins
Date: Mon,  9 Nov 2026 10:35:18 +0100
Message-ID: <20261109093523.931201-10-poros@redhat.com>
In-Reply-To: <20261109093523.931201-1-poros@redhat.com>
References: <20261109093523.931201-1-poros@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add support to set the frequency of input and output pins. The DPLL
core validates the requested value against the supported frequency
list the pin advertises, so the frequency_set callback only has to
store it. The same per type tables that validate the configured
frequency at live time serve as the supported list. The configfs
attribute is rejected with EBUSY while the device is live, so only the
netlink setter changes the frequency of a registered pin and the two
cannot race.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
 drivers/dpll/dpllsim/dpll.c    | 15 +++++++++++++++
 drivers/dpll/dpllsim/dpllsim.h |  4 ++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index 5e360596097616..8590d2db808e45 100644
--- a/drivers/dpll/dpllsim/dpll.c
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -79,6 +79,19 @@ static int dpllsim_pin_frequency_get(const struct dpll_pin *pin,
 	return 0;
 }
 
+static int dpllsim_pin_frequency_set(const struct dpll_pin *pin,
+				     void *pin_priv,
+				     const struct dpll_device *dpll,
+				     void *dpll_priv, u64 frequency,
+				     struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	sim_pin->frequency = frequency;
+	return 0;
+}
+
 static int dpllsim_pin_direction_get(const struct dpll_pin *pin,
 				     void *pin_priv,
 				     const struct dpll_device *dpll,
@@ -171,6 +184,7 @@ static int dpllsim_pin_prio_set(const struct dpll_pin *pin, void *pin_priv,
 
 static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
+	.frequency_set = dpllsim_pin_frequency_set,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
 	.state_on_dpll_set = dpllsim_pin_state_set,
@@ -180,6 +194,7 @@ static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 
 static const struct dpll_pin_ops dpllsim_output_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
+	.frequency_set = dpllsim_pin_frequency_set,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
 };
diff --git a/drivers/dpll/dpllsim/dpllsim.h b/drivers/dpll/dpllsim/dpllsim.h
index f9fced337dc881..f59447d26a8668 100644
--- a/drivers/dpll/dpllsim/dpllsim.h
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -26,8 +26,8 @@ struct dpllsim_pin {
 
 	/*
 	 * Configuration, set through configfs only until
-	 * dpllsim_dev_frozen(). The netlink prio setter changes prio at
-	 * runtime under dev->lock.
+	 * dpllsim_dev_frozen(). The netlink setters change prio and
+	 * frequency at runtime under dev->lock.
 	 */
 	enum dpll_pin_type type;
 	enum dpll_pin_direction direction;
-- 
2.56.0

