Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891977;
	b=4VbgTYYMjcM+LDtpWNZh7ZeFtx6K9sVJsldOZGmcszIeonv04hQzlLyO4odQumB23dvw
	 mxBsrWqZPhgrFh8oOUf79Z0qmO1h2M14mwLuv8B3LKLnV3P9sCZoqCmHZnZrwW7BVwSNf
	 U7zNkoy+mwy9XiNopY8R/6YEeP9KBKiFMSpsyObgjExr2/IN2jkc+LRVjemeqc7sYQyzV
	 QHFWq8lDapdz2v5boQwVOghfXORW/ESrKKq+qIXk7ygwh8owzHXDFf5upA95KVt6mnrHd
	 xTirBx4hrK2ZKHIt7B9bdBRA4Oaqfd2JeDOS1jevwQJuWHJgTRkV26bVKpZjYXIT9qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891977;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=gsfTIYG6DvjHPxbAO/LZnJxlbsOGTE8p94YdknJis+w=;
	b=g8taJwyY60qmermZHok59lSvjJoMyBD8N1bM/JRKpaskHFVsoyAqKvm9GiqvOZ9te8iA
	 d+nPWltFRIuNNqu2Hq5GXImfzVnBZr4P1LbJzLmQ1wDyqM3qNw3d0LPvPREv4jRDQw2BJ
	 gORvwYjVtZAjBZ4cDPgUkUGWWTGdUkXJM7xJ53wDHvCUEt3Qc05GXvn/EeQSDPqbHvKJN
	 PxiyOQYufxetxlgT15xhvmGAM7+ua/BIGddxCKOQpQNwcqsEp8qJ3jo8nMWHNp6M+Dczo
	 2/K2U8Veuu2myj1dQbJiXyFKW4PIDmoxJSXyREU7E0x/MCDjyes3fE9NZzITAcVvqbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FhrGfGTr;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB4606EE86
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEB4606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FhrGfGTr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsfTIYG6DvjHPxbAO/LZnJxlbsOGTE8p94YdknJis+w=;
	b=FhrGfGTrOw2zqoRwprM16Gr2lS0U+P5qHDPGhWqsv7Amqn7u8t/Fo5wU2HhfTbcj7AJE1T
	dhGzC+7PNlpExxaPX2K+rnE2+Ud2p8mi/QFkwsYou014f8xsiuTXla30MHp/gnahJIjlDB
	jmL3uKT+C1jwkKFTz+0wnvHvomULBvs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-cFd3yrVrOc62KHgk0pinZA-1; Thu,
 05 Nov 2026 10:19:32 -0500
X-MC-Unique: cFd3yrVrOc62KHgk0pinZA-1
X-Mimecast-MFC-AGG-ID: cFd3yrVrOc62KHgk0pinZA_1793891969
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42ACC1955DC6;
	Thu,  5 Nov 2026 15:19:29 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5202F195608C;
	Thu,  5 Nov 2026 15:19:24 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 05/14] dpll: dpllsim: Add support to set input pin state
Date: Thu,  5 Nov 2026 16:18:43 +0100
Message-ID: <20261105151852.1844305-6-poros@redhat.com>
In-Reply-To: <20261105151852.1844305-1-poros@redhat.com>
References: <20261105151852.1844305-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add support for setting the state of input pins on the device.
Implement the state_on_dpll_set callback for input pins and advertise
the state-can-change capability for them, so that userspace can move a
pin between connected, disconnected and selectable. The driver stores
the requested state and reports it back unchanged, it does not act on it
yet. Output pins keep reporting their state only.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 drivers/dpll/dpllsim/dpll.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index a1d5921fb8d017..2b0c053a7b6087 100644
--- a/drivers/dpll/dpllsim/dpll.c
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -104,10 +104,23 @@ static int dpllsim_pin_state_get(const struct dpll_pin *pin, void *pin_priv,
 	return 0;
 }
 
+static int dpllsim_pin_state_set(const struct dpll_pin *pin, void *pin_priv,
+				 const struct dpll_device *dpll,
+				 void *dpll_priv, enum dpll_pin_state state,
+				 struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	sim_pin->state = state;
+	return 0;
+}
+
 static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
+	.state_on_dpll_set = dpllsim_pin_state_set,
 };
 
 static const struct dpll_pin_ops dpllsim_output_pin_ops = {
@@ -149,6 +162,12 @@ static void dpllsim_pin_props(struct dpllsim_pin *pin,
 		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_ext);
 		break;
 	}
+
+	/* Capabilities follow the ops the pin is served by */
+	if (dpllsim_pin_select_ops(pin) == &dpllsim_input_pin_ops)
+		prop->capabilities = DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
+	else
+		prop->capabilities = 0;
 }
 
 static bool dpllsim_pin_frequency_valid(struct dpllsim_pin *pin)
-- 
2.56.0

