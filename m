Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131612BEC4E
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 02:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820976; cv=none; b=A7EJlU3g7afG14PnHeaZe18hh727KG/zRbu6hrA/78UJ8MgK1yNY2Pl4tye9cU4/PMtaoMnL7CL7ntufcQHWSa6x9ObPihT8v0+wriSx7JCuIN2sbJYpHC5PlWkdtQr31a3FSjWYKDt4+4/UetmcSIb4sHmYn6b+fXgIP1oMP+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820976; c=relaxed/simple;
	bh=H9hlt5LIq6CQ+Hvl9dPS/oQ9rjWnF0oD3NbRGBl38cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3Y9xjvemsUjvCeQs3mGedfU8uvJPrTQ8ty1/X72opG5NRhJAIdaOEod96n+N5bP636YBybR0SVeEfQ4p9dYOhjrTbVKPmXBnxDdtGsHkSNZtpmA7xbEp5rJO3TZqO9kqoaCZSQLfxaFz5M6J+5JvVzaBI89a49QS6eCbtOgXHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz0pJKVM; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz0pJKVM"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so1880567fac.2
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 19:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790820974; x=1791425774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LY4KZd5gnCBsiB5lJDdI1p1NOkBm3cXEpWyWeVy2l6Y=;
        b=Xz0pJKVMwII9ls083GLkYpeJ+Y3/aRB+0dC2spz1TEh3I/m8vnwJd2oPYhsReK5o9Z
         R1TiB0B7kCzht9rryjO7Nj+T5Tv/bre1HHt/Kva0mvyc7ffDPZv5sDrrNVS/ChP9qt32
         XP876WJY0vYSiBosCuvj8uO3QclILqW8Oy2wYLYNtSXowJZtScdXva0ENjkEfY1Pl08b
         LAhRRS2RnbiGD5JKfn1kTuevcVlH0uhyuDvVXJgWFcPe2i7AtUVizKBpxQExUKg71a2u
         Kt8xIXY33MFzCoCqf9SKB8LPpAT637f7aJN/oEeyIQ5CTsiEK/Ck8sKZVbqQ5Jz628c/
         nJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820974; x=1791425774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LY4KZd5gnCBsiB5lJDdI1p1NOkBm3cXEpWyWeVy2l6Y=;
        b=UM1jj0KXqi9L50uVhwK9gZ5l+RtFS2NemY6vFOrgcRLVAQFHDhrze+uXHpi8zqzYkd
         7pWMXAwWecITlQu7yKJ1som/dfi5Zpd5uo5YskcGQtFYcqOzjF1fSvkqU4LprESapK98
         pFsyLRQP65A1rg+8z0qN55bxAV3wfddIuzr0B+HePNt7FAPKFxuuW9bCXTc9+aiabokh
         dpqiqU6FHfLiicGY6ykYL3z59GQ1KR286CpLiXxr2F0whL3/x0C8kemOzSIH/5uWsKXm
         P9/0SVpJ1CkCmMmfVSOO67r5GXEFIBaLgSCCe75peJvCSwDEGejrWtNYOYXCfdUt2saT
         6AeA==
X-Forwarded-Encrypted: i=1; AKwUvBxfAlJFGLo99DiwC+9CGR3GDh81ZSzU78RcDwqs6y5K8H3Po8dM2I8Djbro5hjLA058MwfDhd4FHA1ITaw2+28=@vger.kernel.org
X-Gm-Message-State: AFuF++mT0KW/EAiOx2TIwpSRzbrwWshxLPz19wl41q+ZR53t81MFQvoA
	NBwIltDoo8gWmvJoEK1YjGhtBym+a6hstCTQdBIJ6pLGvfN1pRKWbz3/
X-Gm-Gg: AYBFou17+zhKoovn56Ujz4kKemHFEh1vdAzLZprjyE2M/wp5aF98QqZRRirze2ccM8P
	9cgClisVp2PrrVVTKMO0qJRtoSwAfZJ197VHFBwFoKrvQO0B4kAX+P/8n/W7mBBpysCuZhsqsMA
	G7+TkQgHLufgkZ5DCJqlSmDVoZBSEhlCGtKwLbc51TK9hSLWaGv/Fi3jAKIDMWNaQnkDy3mhF4H
	6NR0lKo/YMtU3QLDnPg4tO1ROTopedK/OasIFzCM7vwFwLmBEsJDjiyPRCR8kXaCTtWpMgW+5bR
	jwpy0pdysGkisSc4da4RjvZj+KapQp63u0pennQ4LQWK3lDUYD0Is7AiFDaZ8Qo5IIog3W9XjpQ
	vLrTf2cByFYKh6DDBnfH57FrU67C3IyvtpB8sV3zLSylxLSNTT56UmquxSintU1dWu2I0xMPlZh
	ak4XXzhn1zImVgs6M2vf3JYecjeajTAb5U8RnC+47OnInPvNEb65q6YUwWnT9twBqj4ntN0A2R2
	Ge/Y73uPhjshENIWOnbSfk5AiJO/PeFjIZT9kKp
X-Received: by 2002:a05:6809:306:10b0:4f3:9349:15e with SMTP id 5614622812f47-4f393490d3fmr630456b6e.41.1790820973868;
        Wed, 30 Sep 2026 19:16:13 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f345b14325sm1208801b6e.1.2026.09.30.19.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:16:12 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Samuel Moelius <sam.moelius@trailofbits.com>,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests: gpio: expect gpio-mockup to reject a range with no lines
Date: Wed, 30 Sep 2026 21:16:09 -0500
Message-ID: <20261001021609.167505-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001021609.167505-1-danishkhateeb03@gmail.com>
References: <20261001021609.167505-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 446e8c31d0fc ("gpio: mockup: reject invalid
gpio_mockup_ranges widths"), gpio-mockup refuses to load when a range
has no lines. The "no lines defined" case of gpio-mockup.sh still
expects gpio_mockup_ranges=0,0 to load and create no chip, so the test
now fails there:

  # 2.  Module load error tests
  # 2.1 no lines defined
  # test failed: insert gpio-mockup failed with error 1
  # GPIO gpio-mockup test FAIL

Check that the module rejects that range instead.

Fixes: 446e8c31d0fc ("gpio: mockup: reject invalid gpio_mockup_ranges widths")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on v7.3-rc5 (x86_64, KASAN and lockdep, virtme-ng):
    - before: gpio-mockup.sh fails at 2.1, both by default and with -f.
    - after: it passes by default, with -f, and with -t cdev_v1 and
      -f -t cdev_v1 (on a GPIO_CDEV_V1=y kernel).
    - control: with "-1,32" in place of "0,0", the new check fails with
      "insert gpio-mockup with ranges <-1,32> did not fail".

 tools/testing/selftests/gpio/gpio-mockup.sh | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup.sh b/tools/testing/selftests/gpio/gpio-mockup.sh
index fc2dd4c24d06..41c8a1c1502e 100755
--- a/tools/testing/selftests/gpio/gpio-mockup.sh
+++ b/tools/testing/selftests/gpio/gpio-mockup.sh
@@ -310,6 +310,16 @@ insmod_test()
 	remove_module || fail "failed to remove module with error $?"
 }
 
+# Load the module with the given ranges and check that it is rejected.
+insmod_fail_test()
+{
+	local ranges=$1
+
+	if modprobe -q $module "gpio_mockup_ranges=$ranges"; then
+		fail "insert $module with ranges <$ranges> did not fail"
+	fi
+}
+
 while getopts ":frvt:" opt; do
 	case $opt in
 	f)
@@ -378,7 +388,7 @@ if [ "$full_test" ]; then
 fi
 echo "2.  Module load error tests"
 echo "2.1 no lines defined"
-insmod_test "0,0"
+insmod_fail_test "0,0"
 if [ "$full_test" ]; then
 	echo "2.2 ignore range overlap"
 	insmod_test "0,32,0,1" 32
-- 
2.55.0

