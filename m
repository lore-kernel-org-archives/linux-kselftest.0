Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892000;
	b=DtOtCNy9Ie+iqp+zI4z8VyuQut7dKpMNApjhZlqpHODQ11HsopZ6C8RtJ8AD7zhm2s6H
	 E6QV/w/ZhvwlTKB4CFImO5PIj5g4f+yS/3AMj6oqgLzGu77iUy8Lpj+zrm051bEhtHohD
	 V1g8+EuvNtKEYU0WfxBvvJgssadB0csy3aaIzZ03+Yzd6BBBUp9wW8XUruu0D+9SejXOp
	 qFc1pX0PC67JSIinbk/9Lx8FOcR+tGO6OZspB6Bb8pxKRFAgpx8J9Z+yM8GhwbRBM5vv6
	 gTPVTyfBzOTy9fqYOOLCBCVQ1EfQ6sbmKIFkEMiqXqu/oZK4G3l65IhxN1WInStbNOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892000;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=apwvEm0AmaaM37/dLdBO1681jXAgLmCr55TOqKSBLUU=;
	b=U97FjJXWYjckC1iloGZ4ZVVq7isasYZIBDncd67JaEidYdqcsAz63KCk8QjjTXnxE3Qi
	 OgQFr10Hxs0xND8YqgSqbjhV7r2XT3h6/diO1bs27uzzFUq7tihQ/e+PiOmQpBIi94rHO
	 9HWTwuPvu8mCkWzNPOmT69pQBH5N+6YpGa4MCElf/qv7egEF3ZijdJejKoQFKH5JopTPc
	 RWsujPOYR40yy3cbtPNPV8qNm2uRof/j6H80JlyH73AruqHs6R97suXKCkgDwU/gINrD7
	 W47RY9NvlklWy2YgemXxainKjVSp8N3FVUI/u3xOqi6moQqVbo1jQ8CipZti243LeEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cb7ow5HA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B566C606EEAD
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B566C606EEAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cb7ow5HA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apwvEm0AmaaM37/dLdBO1681jXAgLmCr55TOqKSBLUU=;
	b=Cb7ow5HAVU5f1dv96sGje9yU9vaPhFkk8Oc8AuBZQURQYjFowpHb4+KaasL18W+LvoBMlQ
	785bfbmHcgWrUHTLGQ/WyB0309HWUPeFj8GkRu3wR9Ec5gPCSRFTJkMeKJaaKaVExzJP0g
	NiCV46bGYRG9FBiC+OfgpmsBvVWBZ/E=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-SoNA3rVsPN6UUcmbFLNBDA-1; Thu,
 05 Nov 2026 10:19:52 -0500
X-MC-Unique: SoNA3rVsPN6UUcmbFLNBDA-1
X-Mimecast-MFC-AGG-ID: SoNA3rVsPN6UUcmbFLNBDA_1793891989
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEF5B1956055;
	Thu,  5 Nov 2026 15:19:48 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 088441956089;
	Thu,  5 Nov 2026 15:19:43 +0000 (UTC)
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
Subject: [PATCH net-next v2 09/14] dpll: dpllsim: Add support to set frequency on pins
Date: Thu,  5 Nov 2026 16:18:47 +0100
Message-ID: <20261105151852.1844305-10-poros@redhat.com>
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

Add support to set the frequency of input and output pins. The DPLL
core validates the requested value against the supported frequency
list the pin advertises, so the frequency_set callback only has to
store it. The same per type tables that validate the configured
frequency at live time serve as the supported list. The configfs
attribute is rejected with EBUSY while the device is live, so only the
netlink setter changes the frequency of a registered pin and the two
cannot race.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 drivers/dpll/dpllsim/dpll.c    | 15 +++++++++++++++
 drivers/dpll/dpllsim/dpllsim.h |  4 ++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index 8a302c2537c880..3caccd38a7e74a 100644
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
@@ -148,6 +161,7 @@ static int dpllsim_pin_prio_set(const struct dpll_pin *pin, void *pin_priv,
 
 static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
+	.frequency_set = dpllsim_pin_frequency_set,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
 	.state_on_dpll_set = dpllsim_pin_state_set,
@@ -157,6 +171,7 @@ static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 
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

