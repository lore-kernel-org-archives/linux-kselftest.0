Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7CA373C12
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549880; cv=none; b=gURoUdT+X92cqEEtfSWjMpzPd0eaJ9nPrjpHV44vh9iXuPOJdr/T44NU1+DYnZCTV7SzngFqjtSR4tZnTyuEAWLC5EIbjOweVafflNxCP3eHjhEc3uf5u05Zi5Rvh7/gdeuEM9RorkF6XJk+ghg7TSWjll2j/b5ez2WT7bqvUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549880; c=relaxed/simple;
	bh=eK4a0WtdaL3aV0EMfgaXJButk4rR3VRAYpe6DC5K4Lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/5bKdBS4jGsXLp3fjiKbH14evlTbZx4yGx2ugm49vyDsRome9M5KDm/o1b/6A9FLbtDeYLXaCN0s6+ILaawmM5yWzpcDS/DeF0NkoK57SflnahcCyPyol00krwCP5dWphB9DUsX6VygKly4AKxddzRSD31JztZaEaHun+TP4EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXzg/kQA; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXzg/kQA"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2055573c8cso176301366b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 12:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788549877; x=1789154677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4SXGOs+pxXPTLdkT30adlIyBlKnJ4eSELcniu8p+1M=;
        b=LXzg/kQAx8yKSJoOlebQwvilLWwptQKoJ31kOYEsmQLTzrFMmp9CslqOanYXggR1Aq
         uWiy1NwGrcIUy41OxYe5o6Hd3sM16id95TxN9921NpbPLdhNZtAa/HOOcy0eGn/TXLyu
         pgYRHOwDp7TdsDV2jPwnQZcXziDR0vFm33TPs3s2bwUtOSoHqAzH+PjwBHOfRoOdrf9O
         JnhbI2uEM5rh9k3UAQSpUcrvxXG3p5yJLgZvtRgy/Y+C0jSCRy0rBF7v9uJ7j85Gat/2
         MtqnLTiN60tDEgm3981DrDUcOfmm56nyUddraUqVeFHqYQHYld2+MVGXrCTslq6Wsihu
         U2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549877; x=1789154677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4SXGOs+pxXPTLdkT30adlIyBlKnJ4eSELcniu8p+1M=;
        b=LzargaNAWsjzMEDnwiRx4DPjw3D0fBSt+vGDPmW8G3eqaXrbz2fNp865NL4ZzHaZEL
         cRZR2+ith85CfIJSEqZ+fCvxe2+KW0h03QluY2wlIwPU+OGRqJaahkUPH1YkWZHSBEh9
         1mtion/c0yUxENWryn0LEROP71tlxifKwxOds/CLyGQMTN9VdSN3xB7AecHdt5R3FxB8
         8Ir41BfvjrO13ImajS6AS/s9WcWWbBXVt3OuM6GV3OKIo2/z2ywm7h6QZycRMVxC3ypY
         kaYfnUTMuzJKnnLcNvpjpg6RtU8R+IX+6mTSnU3XuXfY6ZaW1PQaTQWIgaSAzjq/c5G3
         mOGw==
X-Forwarded-Encrypted: i=1; AKwUvBxckatFkHMQGKm00HL21n//FJZd6jYgCAFWDorQZGg99KyCqy83RwsGF/dz3KmA7Mz1ZXucU34bTxuDmMj2kEE=@vger.kernel.org
X-Gm-Message-State: AFuF++l52itIhV3Kkc2ehux8jzT6HBvpkU7OezjjniwqgEhROVGp/F3G
	HcU4ZXB8GtyD2hNCmUSrCQFsgOdWnrrcyH4k6WrqwBbuSHv+0LzHutFA
X-Gm-Gg: AYBFou2NP4Skjz1u24FDog1Q6CrjOlpE7OFaDJ2OC5hxZA6ga/K1QM5kTdCJCw3K4F/
	jfpKbN9Co73HLpmGyoErFhxG1d4x5OnKh4gn2d1hHkkyMPcBkR68Imj68XzoG/yhRPeBJaTNws7
	e9PvCJH80lUAY9BJuoOkigkG7we/rykXSyWIluFwHjLuX1oOqC32jgVEjeqKupKURPu7B5gbVc6
	bDrVZ+vvJn9eIjLSw7JyLlck799NJhJlG4W2JFNYV2HElsVgImwEPaflG2Wd+fb/O7MQiWCQpxW
	Z90eoLT8BD14l1PziYkSzvojjUYARCCI1LJiuiWQqJz+c6rDCTssMzV7aqoIXdtZxlg7VNKfAZI
	p/x1XD9dCCyzU1GvQ2ZKhSQw8EMeNmD/Xhsh950Y904/qi3xWBK/iqFt+CbHMyidsHwnHR79fdI
	HDHZB/Rg0A8Xa0s/CSqF0sSEgE5LWn6GSc87xiYhi7zqsHrYo8WQ==
X-Received: by 2002:a17:907:a893:b0:c1f:1520:4de5 with SMTP id a640c23a62f3a-c260c66a8demr334783166b.1.1788549876645;
        Fri, 04 Sep 2026 12:24:36 -0700 (PDT)
Received: from localhost ([2a02:8071:50c5:5c0::48d4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6dfad6sm147025866b.60.2026.09.04.12.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:24:36 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
Date: Fri, 04 Sep 2026 21:24:25 +0200
Subject: [PATCH 1/2] iio: flow: slf3s: keep the vdd supply balanced across
 suspend/resume
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-iio-slf3s-pm-regulator-kunit-v1-1-5ea61e6d6db2@gmail.com>
References: <20260904-iio-slf3s-pm-regulator-kunit-v1-0-5ea61e6d6db2@gmail.com>
In-Reply-To: <20260904-iio-slf3s-pm-regulator-kunit-v1-0-5ea61e6d6db2@gmail.com>
To: Maxwell Doose <maxwell@maxwelld.cc>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Li Youhong <dayou5941@163.com>, Li Youhong <liyouhong@kylinos.cn>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Wadim Mueller <wafgo01@gmail.com>
X-Mailer: b4 0.14.3

slf3s_resume() enables vdd and then restarts the measurement.  When the
restart fails it returns an error with the supply still on, and
slf3s_suspend() bails out before regulator_disable() when the stop
command fails.  Both paths leave the driver's idea of the power state and
the regulator use count out of sync.

The PM core only runs the resume callback when the preceding suspend
callback returned 0 (device_suspend() sets power.is_suspended on success
only, and device_resume() bails out when it is clear), so the enable
count cannot climb above one.  The damage is different:

 - After a failed restart the sensor stays powered but idle.  Every
   following suspend then fails too, because the idle part NACKs the
   stop command and slf3s_suspend() returns early - the system can no
   longer suspend at all until the driver is rebound.

 - If regulator_enable() itself fails during resume, the next suspend is
   free to run.  Should the stop command succeed there, the driver calls
   regulator_disable() on a supply it never enabled, which trips
   "unbalanced disables" in the regulator core and aborts the system
   suspend with -EIO.  The devm cleanup has the same problem on unbind.

Track the supply state in the driver and drive regulator_enable() and
regulator_disable() from that state only.  A stop command that fails no
longer keeps the supply on: it is cut right afterwards anyway.

Reported-by: Li Youhong <liyouhong@kylinos.cn>
Closes: https://lore.kernel.org/linux-iio/20260901025010.356735-1-dayou5941@163.com/
Fixes: d240b0b8a1ce ("iio: flow: add Sensirion SLF3S liquid flow sensor driver")
Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 drivers/iio/flow/slf3s.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/flow/slf3s.c b/drivers/iio/flow/slf3s.c
index dfa7c1409045..37f40685e9d9 100644
--- a/drivers/iio/flow/slf3s.c
+++ b/drivers/iio/flow/slf3s.c
@@ -110,6 +110,7 @@ static const struct slf3s_variant slf3s_variants[] = {
  * @vdd:	supply regulator, disabled while suspended
  * @variant:	pointer into @slf3s_variants for the detected device
  * @medium:	currently active calibration medium
+ * @vdd_on:	tracks whether @vdd is currently enabled by this driver
  * @lock:	serialises the multi-step command/response exchanges
  * @crc_table:	pre-computed CRC-8 lookup table for SLF3S_CRC8_POLY
  */
@@ -118,6 +119,7 @@ struct slf3s_data {
 	struct regulator *vdd;
 	const struct slf3s_variant *variant;
 	enum slf3s_medium medium;
+	bool vdd_on;
 	struct mutex lock;
 	u8 crc_table[CRC8_TABLE_SIZE];
 };
@@ -382,6 +384,12 @@ static void slf3s_disable_vdd(void *data)
 {
 	struct slf3s_data *sf = data;
 
+	guard(mutex)(&sf->lock);
+
+	if (!sf->vdd_on)
+		return;
+
+	sf->vdd_on = false;
 	regulator_disable(sf->vdd);
 }
 
@@ -416,6 +424,8 @@ static int slf3s_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to enable vdd supply\n");
 
+	sf->vdd_on = true;
+
 	ret = devm_add_action_or_reset(dev, slf3s_disable_vdd, sf);
 	if (ret)
 		return ret;
@@ -453,10 +463,8 @@ static int slf3s_probe(struct i2c_client *client)
 }
 
 /*
- * The sensor has no low-power state of its own, so stop the measurement
- * and cut the supply while suspended.  Resume powers it back up, waits
- * out the power-up time and restarts with the medium that was active
- * before.
+ * The sensor has no low-power state, so stop measuring and cut the supply.
+ * Resume powers it up again and restarts the previous medium.
  */
 static int slf3s_suspend(struct device *dev)
 {
@@ -466,9 +474,16 @@ static int slf3s_suspend(struct device *dev)
 
 	guard(mutex)(&sf->lock);
 
+	/* A failed resume may have left the supply off, nothing to do then. */
+	if (!sf->vdd_on)
+		return 0;
+
+	/* The supply goes away below anyway, so a failed stop is not fatal. */
 	ret = slf3s_send_cmd(sf->client, slf3s_cmd_stop_meas);
 	if (ret)
-		return ret;
+		dev_warn(dev, "failed to stop measurement: %d\n", ret);
+
+	sf->vdd_on = false;
 
 	return regulator_disable(sf->vdd);
 }
@@ -485,9 +500,17 @@ static int slf3s_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	sf->vdd_on = true;
+
 	fsleep(SLF3S_POWER_UP_DELAY_US);
 
-	return slf3s_start_meas(sf, sf->medium);
+	ret = slf3s_start_meas(sf, sf->medium);
+	if (ret) {
+		sf->vdd_on = false;
+		regulator_disable(sf->vdd);
+	}
+
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(slf3s_pm_ops, slf3s_suspend, slf3s_resume);

-- 
2.55.0

