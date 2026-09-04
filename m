Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EBB3546EB
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549880; cv=none; b=SoZIwP+roBXQ32UmtWhGFLD5m5NdJZlktIkbXX5jGv5Fp1afgyZeE+iTkZy/AYPMY8xeyeR2cR5OKsP9Nq7M4UV65gTBpzfVrJOPvbAgqiJ6ZGqsBKiNuYdsy31fe82cHUos+2Cw1e9tbnr0j6OGdJuoVyj992f7Aj5+mPEd+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549880; c=relaxed/simple;
	bh=1TLp0mcpPztPjUtMwMwh25MNgjqQzYvogl/T02HTuZo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BF/OqJC9cvzYOUS/N/BvGPtlEWfqj9Rj9ziXX4m4PPYkjTLoEZFINgHFH5QB+0MkVwmJD16BuilbjWGr/MLkfBoWKoL46U2n4z2SFwUMdkmZUNanJNU2oEokYzGrJz72rtVPEgkW9347XDwctT5eCiedtlLobQ/a0wSyV/n8+bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFBf0gMs; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFBf0gMs"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c25b661d37dso198441966b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788549875; x=1789154675; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6+3E6XdBlMMWEsp4l0QEjnTRS+wXP5LKYWHqQew038=;
        b=cFBf0gMshOXE5g2gwE3/Mej9hTYqE9sjQIMtcy92CvVZxak4tmPey9EUBEf5jFUsxo
         kGdazRo5qaErqx/YIFn/g/kvPKHYEA1GSc3QZGP3vGyU1iLZYpJ/wyO+pBidmRBgbUK8
         HU1RAUy1NkVBcIt0Wf4q0hWD2ffVtUz7BLVP8asCZrZ+cB4gyn39R+aZGOh/+DXWGbkM
         U0JqP3plXnXU3xCywyE6sIWYr+R3AgehC6U0+S1DjV7rHk9pz/ZtCOyF6qPEd5fVreo7
         OoCzLqAtl8gPrXhLD5JoMf831KiJllQIadEQCzFuKTXlkz6ODZwPISuSQIG+u3TElHFe
         5OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549875; x=1789154675;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x6+3E6XdBlMMWEsp4l0QEjnTRS+wXP5LKYWHqQew038=;
        b=OnGmlDpEdm3tqQIyCb6qb3dOKfitY5bo8EBYWIKvirbRtU2mEFhVupsaN8f+PCW0Ch
         LcLv0UKo9dRMnH65DW5JBvuCYXXiwu++5hHctyeSCGOxg0Lgli0eL85HeT+LCgp5KR6y
         nJ4D7oZ/recC6byKvImA5q6+rBpr1jHhS2tQECLfbPkf0IdaKj4NN4lcXWuGDxqQjb35
         8f/5o2cMzJTozWhSPsMFOdgFIpcAJNL2H8RrKNLjmPHz2FtGRfG78UfirlQ9XXT/r+U5
         OJyz4bSEqVRCsOrC3PGhHjLJ6EMx7PtgO4FpZpk2WnX07iIunBboKvR0sxJV3klUNmyi
         Q7ew==
X-Forwarded-Encrypted: i=1; AKwUvBysYRmJjJOKGaDlQAYAIlCN2HA5IM7DoH1xKM9bgCMhiRs00gndQu3TvA6s1qZ9Rabq+1GCegvTnRv75OP3n8w=@vger.kernel.org
X-Gm-Message-State: AFuF++nbLoLgHUZXjjvmX9vzwSRSdfz9/Zal4nTRsdRgYf7xIHLGjTaW
	jVFWKsDS2Il3V9BXnSE9ixek+FNG4J+RQTsTverWYQ5fw6Axu/OJGBGg
X-Gm-Gg: AYBFou1GAf8ChT6XFyc3Km7GIIEuJwHTAJdtvPKuOFPgtEcwdmJSCWwcnVlzHBCY9AJ
	rs5Ur/GheMi+67+D7xyOkEXzaqzwWzUBmp0aOpO8pXssWHdadSYzM7Xjhoe2Nl6WZm/tdEmIbLL
	Ju9DBGWqomiATY/s3mKJDz3aoNI5fIhyI3x8yzxVYZu4U0BfKZG4RW3xjzySbzkInq5IJioiU4i
	nfpvLvPWaY9mFXtqo/K318haH5a9uQznsZsA08n+tnBDdgqJzzKRqGTohDCuAin03kDQGri1lv1
	DBBIOvDs9PcJ4rG08okuXC9nF5+Qz7FZE68QOsz2AzGpiFootBi7P/wWrR6rUTpCfswkwmFyUS/
	oPhUGGu229r+hPlzW/cqN9vmL6yR26U8aa9kiKj/LTRP1rHtMmt7I96DrwxQtGSJPW6hm3ZaSvy
	SRgZCpoxDd6J7rcRvo8gHdiKx50GWaZN7J7QUp4Lc=
X-Received: by 2002:a17:907:3f98:b0:c26:19e3:e988 with SMTP id a640c23a62f3a-c2619e3ef32mr205513766b.40.1788549875549;
        Fri, 04 Sep 2026 12:24:35 -0700 (PDT)
Received: from localhost ([2a02:8071:50c5:5c0::48d4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bb9a9sm141698766b.55.2026.09.04.12.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:24:35 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH 0/2] iio: flow: slf3s: fix and test the vdd supply balance
Date: Fri, 04 Sep 2026 21:24:24 +0200
Message-Id: <20260904-iio-slf3s-pm-regulator-kunit-v1-0-5ea61e6d6db2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAwAwK9Izg1EVxT7FenBalaDdlcSLYL4d
 xePc5kTjFXY4J2doPwXkxgS8lcG/dSFkVGGZCioqKihEkUi2uKd4fpD5XFfui0qznuQDUvHTHX
 zdZUnSMWq7OV4+vZzXTdLe+rKbgAAAA==
X-Change-ID: 20260904-iio-slf3s-pm-regulator-kunit-43ee079b36f0
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

Li Youhong reported that slf3s_resume() leaves vdd enabled when the
measurement restart fails [1].  The report is right, but the patch and
my own Reviewed-by on it were both too narrow.

Andy asked whether the regulator refcount can go sideways here.  It
cannot.  device_suspend() sets power.is_suspended only when the callback
returned 0, and device_resume() returns before the callback when the
flag is clear.  So the two alternate and the count stays in {0, 1}.
Please drop my Reviewed-by, the reasoning in it is wrong.

Three things do go wrong though:

 - resume enables vdd, start_meas() fails, the supply stays on.

 - the part is then powered but idle, so it NACKs the stop command.
   suspend() returns early on that error and never disables vdd, so the
   system cannot suspend any more until rebind.  This one hurts most.

 - if regulator_enable() fails in resume, the next suspend disables a
   supply that was never enabled: "unbalanced disables" in the regulator
   core, and -EIO.  Unbind hits the same case.

The original patch fixes the first one only.

Patch 1 tracks the supply state and drives enable/disable from it.
Patch 2 adds KUnit tests with a fake i2c adapter and a counting
regulator, so no hardware is needed:

  ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/iio/flow

Four of the eight tests fail without patch 1.

[1] https://lore.kernel.org/linux-iio/20260901025010.356735-1-dayou5941@163.com/

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
Wadim Mueller (2):
      iio: flow: slf3s: keep the vdd supply balanced across suspend/resume
      iio: flow: slf3s: add KUnit tests for the PM regulator balance

 MAINTAINERS                    |   2 +
 drivers/iio/flow/.kunitconfig  |   6 +
 drivers/iio/flow/Kconfig       |  15 +
 drivers/iio/flow/Makefile      |   1 +
 drivers/iio/flow/slf3s-kunit.c | 734 +++++++++++++++++++++++++++++++++++++++++
 drivers/iio/flow/slf3s.c       |  35 +-
 6 files changed, 787 insertions(+), 6 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-iio-slf3s-pm-regulator-kunit-43ee079b36f0

Best regards,
-- 
Wadim Mueller <wafgo01@gmail.com>

