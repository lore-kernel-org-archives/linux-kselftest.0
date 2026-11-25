Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597606;
	b=Qa6F7QIKHpWbeZQpzIapFiEbMxTgUgw+rsV77uwFUEHNhWvgh4gqWhptxvrQyD1DEMs0
	 kSRB8LK94GeEtRq99nNqhCldXaU6lOffGs2uKoEc/F4nZQ0rVYu/vL+pnWVkjmtkn/TVU
	 pbYImueLoql+vMRe3i12wfE4jbyqIBMoYJ0EXugenh3+l29tc4Tfd8PMkBhuGiBo4n8Ul
	 L9mtNxiBUs45SlhuUuzXlV4UosERyhoofug9yN4HTFDbaIy73Bc/EfN/FMD3YjKxamVnl
	 iAGsrPSzkOZvIXGLHHkYE+lS4l0+ipKPEYcz3NcqTokwVthhhmkPGb3iD37Q3MjnYCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597606;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=yU8TRhGN+yJnxrx0QojH4POUu5uAcweN7uff6VGHBIo=;
	b=HrolcdBbfn3Kt25qSoHjRei5ADQdz1zKKkuQKtO3dW5503rxqF6lzXY7Dy9Vip4DQlmH
	 k67bZJYVBAoNGyZZkaLWfXJ6irjq/8wvBqZyQHvDpMrvI+YGH+e2p++HwPJS2hjwVXTE+
	 2EUCUZNaEstRYiCpJ2DwvXSZF3GXi0p1rX2aRFBos24SkvrBFvj+/HBx1Fd8fWQz+/0UP
	 g933PRdybvEsoRRYQtBYYvuIdKtwjYkodtihKaoTwIXM+PcvEr1x7UQksVn1d5e69QqbI
	 +DS7ySf1NaWVHWLYLPzrGNpauQys7e24KOmdpLM2IPwO9DtE7oEMngqGmHXoaHds8qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQHzRkJG;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2951606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2951606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQHzRkJG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yU8TRhGN+yJnxrx0QojH4POUu5uAcweN7uff6VGHBIo=;
	b=gQHzRkJGSn7JVLQr/rFlAs80/+EoKL0HAMH0AqiIm6qBwm7tbucUO6EddJo++EvfiHmj4Z
	DoVJ3Nz9aDQx/PSnjBlY0rp9MWHZwhFYgbppkE6icBKYahFu6tjTp1vUeizdpfUlIFROqT
	kFJDzpdL2/vOo0P/qbbhyJtHSMCR1tc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284-6rGB0JeVOP28uT4T7MEZLQ-1; Wed,
 25 Nov 2026 09:06:39 +0000
X-MC-Unique: 6rGB0JeVOP28uT4T7MEZLQ-1
X-Mimecast-MFC-AGG-ID: 6rGB0JeVOP28uT4T7MEZLQ_1795597596
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58CBD1953973;
	Wed, 25 Nov 2026 09:06:36 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A1190195B3C8;
	Wed, 25 Nov 2026 09:06:31 +0000 (UTC)
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
Subject: [PATCH net-next v5 09/14] dpll: dpllsim: Add support to set frequency on pins
Date: Wed, 25 Nov 2026 10:05:16 +0100
Message-ID: <20261125090522.3777494-10-poros@redhat.com>
In-Reply-To: <20261125090522.3777494-1-poros@redhat.com>
References: <20261125090522.3777494-1-poros@redhat.com>
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
cannot race. The frequency set over netlink is kept apart from the
configured one, like the priority, so the attribute keeps showing what
was configured and every live transition starts from it.

Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- no changes

v4:
- keep the frequency set over netlink apart from the configured one,
  like the priority
- document that values set over netlink are not written back to the
  attributes
- the Reviewed-by and Acked-by of v3 are not carried over, the
  behaviour of the driver changed

v4: https://lore.kernel.org/all/20261112130359.840795-10-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-10-poros@redhat.com/
---
 Documentation/driver-api/dpllsim.rst | 10 +++++-----
 drivers/dpll/dpllsim/core.c          |  4 ++--
 drivers/dpll/dpllsim/dpll.c          | 20 ++++++++++++++++++--
 drivers/dpll/dpllsim/dpllsim.h       |  8 ++++++--
 4 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/Documentation/driver-api/dpllsim.rst b/Documentation/driver-api/dpllsim.rst
index ce71c8bad6b375..c36a35f0b39fa8 100644
--- a/Documentation/driver-api/dpllsim.rst
+++ b/Documentation/driver-api/dpllsim.rst
@@ -63,11 +63,11 @@ priority other than the default, and with ``ENOENT`` when a pin
 directory is being created or removed at the same time. An ``EINVAL``
 does not name the pin, the attributes of the pins show which one it is.
 
-Every live transition starts from the configured values. A priority set
-over netlink while the instance is live is reported back over netlink,
-it is not written to the ``prio`` attribute and is gone once the
-instance is taken down. The driver stores the priority, it does not
-select a reference by it.
+Every live transition starts from the configured values. A frequency or
+a priority set over netlink while the instance is live is reported back
+over netlink, it is not written to the ``frequency`` or ``prio``
+attribute and is gone once the instance is taken down. The driver
+stores the priority, it does not select a reference by it.
 
 Example
 =======
diff --git a/drivers/dpll/dpllsim/core.c b/drivers/dpll/dpllsim/core.c
index c7e0a218000403..795d4b8e98e911 100644
--- a/drivers/dpll/dpllsim/core.c
+++ b/drivers/dpll/dpllsim/core.c
@@ -110,7 +110,7 @@ static ssize_t dpllsim_pin_frequency_show(struct config_item *item, char *page)
 	struct dpllsim_pin *pin = to_dpllsim_pin(item);
 
 	guard(mutex)(&pin->dev->lock);
-	return sysfs_emit(page, "%llu\n", pin->frequency);
+	return sysfs_emit(page, "%llu\n", pin->cfg_frequency);
 }
 
 static ssize_t dpllsim_pin_frequency_store(struct config_item *item,
@@ -127,7 +127,7 @@ static ssize_t dpllsim_pin_frequency_store(struct config_item *item,
 	guard(mutex)(&pin->dev->lock);
 	if (dpllsim_dev_frozen(pin->dev))
 		return -EBUSY;
-	pin->frequency = val;
+	pin->cfg_frequency = val;
 	return count;
 }
 CONFIGFS_ATTR(dpllsim_pin_, frequency);
diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index ecc8dd7af46ef3..3c6ce1a64217dc 100644
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
@@ -233,8 +248,8 @@ static bool dpllsim_pin_frequency_valid(struct dpllsim_pin *pin)
 
 	dpllsim_pin_props(pin, &prop);
 	for (i = 0; i < prop.freq_supported_num; i++)
-		if (pin->frequency >= prop.freq_supported[i].min &&
-		    pin->frequency <= prop.freq_supported[i].max)
+		if (pin->cfg_frequency >= prop.freq_supported[i].min &&
+		    pin->cfg_frequency <= prop.freq_supported[i].max)
 			return true;
 
 	return false;
@@ -258,6 +273,7 @@ static void dpllsim_pin_reset(struct dpllsim_pin *pin)
 {
 	pin->ops = dpllsim_pin_select_ops(pin);
 	pin->state = DPLL_PIN_STATE_DISCONNECTED;
+	pin->frequency = pin->cfg_frequency;
 	pin->prio = pin->cfg_prio;
 }
 
diff --git a/drivers/dpll/dpllsim/dpllsim.h b/drivers/dpll/dpllsim/dpllsim.h
index 44afcd9918c400..fc5eef0324f56f 100644
--- a/drivers/dpll/dpllsim/dpllsim.h
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -27,7 +27,7 @@ struct dpllsim_pin {
 	/* Configuration, writable only until dpllsim_dev_frozen() */
 	enum dpll_pin_type type;
 	enum dpll_pin_direction direction;
-	u64 frequency;
+	u64 cfg_frequency;
 	u32 cfg_prio;
 
 	/* Resolved at live=1 */
@@ -39,7 +39,11 @@ struct dpllsim_pin {
 
 	/* Simulated state, guarded by dev->lock */
 	enum dpll_pin_state state;
-	/* Starts from cfg_prio at live=1, changed by the netlink setter */
+	/*
+	 * Start from cfg_frequency and cfg_prio at live=1, changed by the
+	 * netlink setters
+	 */
+	u64 frequency;
 	u32 prio;
 };
 
-- 
2.56.1

