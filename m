Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059F03B27DE;
	Wed, 15 Jul 2026 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146555; cv=none; b=NmYO6q89TsHio5JiBi4lkqOzuuhiPDWc7HNS2yMetNNYhAR4ZxBwOI4X1zzftc5vjLETYkqELQGNrL22ng0ZCacaIDO24ki084jIh9+65AdBk4cgE5TkQ65GG/52i5xhdqK4CGBUuHANTZ3iFnOX4uCBaJIYw7eWjLHupG0x4dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146555; c=relaxed/simple;
	bh=b/0Zm9VOMfU0kjPubegMIN5PqGzcfldrc4gFyQgXX+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=acGfobqkQrt7U8Mbfyk9O3wvnioXwjt1RL8zW/OQq44e2y+z7ltRoU5BFoJ5wV/kw8JYshj2jlFuedFfj7kUNGn/+2LUmDjGqs7VtexL4L6HBlm+TAtJlcnXC2GaJtgEUq5vqEi7HbWvh9O/3ekL/GiZmPB+NcudDOVpBr3eh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXdrnr02; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXdrnr02"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2D01F000E9;
	Wed, 15 Jul 2026 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784146553;
	bh=XX6zVRvN5cr1UgHJZecg0QYoYxQXieg+nMc9goMaqms=;
	h=From:Date:Subject:To:Cc;
	b=LXdrnr02yVI/sGAMt6uy2/AL1tRsNQ4qo2xIeVyDcuyhjZMYNFXvet4fHi8kbbzuJ
	 vluoTaVq7r1iEPGiJ++u8lCaOtBgth/CuYmW3tGyzzQx6tR0/JOBs3I2AfI72SX/IF
	 ahsx/fkXgdVPAb1X8L03fZAP0nB6490fCXS3u12XeBSHjGzb3rpccY7PPB6Sue+tnL
	 gQVccfFwJ8p+OItfgAL7gUx9XJ6P+vbxRgtP3GUMp7sePOJRgEmwszN1ttP92RR1vF
	 a+gdnTjnNl25uaYxuQyo/dt9XrjOZ5zOO13iQum2MDmM+WXptWlwxVXFi4T9KhTtGG
	 fCIoiWqkN9NNg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 15 Jul 2026 21:15:46 +0100
Subject: [PATCH] kunit: configs: Enable gpiolib for all_tests.config
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-kunit-gpiolib-v1-1-d2824313e1db@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHHqV2oC/yXMTQqAIBBA4avErBNUsL+rRIusyabCQiuC8O5ZL
 b/Fezd4dIQequQGhyd5Wm2ESBPoxtYaZNRHg+Qy47lQbD4s7cxstC6kmealFO2gpCpKiM3mcKD
 r+9XNb3/oCbv9nUAID6lpfWhxAAAA
X-Change-ID: 20260715-kunit-gpiolib-b0921af52589
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b/0Zm9VOMfU0kjPubegMIN5PqGzcfldrc4gFyQgXX+E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV+p3XhrNJNvX7Hh8r1RQohN64lBAv7durhx9z
 DuvHuXCjLGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalfqdwAKCRAk1otyXVSH
 0DNBB/42Q4NZ9YiQbFdfIb3PSTuH+dChHP6cHTYc0bWSobvPa6iOSWJB30wHHt9Ea5qEkpjFcTW
 jqHCWTA7sNeOjvbfQJmgl4LK9+eJIHQnaHN30xr4tvS2WsVOCAsfeyCTQjYcBPkaEqGUe40eC2l
 RZ78Q4m0YM6O32lcIY/MZDpMU3UOKNOkUyyN6G5EanQq27o8J3/x42l6OFG7eSYLNgO0MI6BkbM
 c+KrsUA4RvtB/gtS+1LgAmU5lCOaEMwMZ8PwNdJs1vh22jXM821d980ZsWnXAiV8Q7q33HtGIxQ
 5fUC8+DR8QFvA62wqPjAsF5bC3+tP/hp+W/r6PafahqQkfgD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Some of the Cirrus driver tests require gpiolib, enable it in the all
tests configuration.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/configs/all_tests.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
index bccc2c77196d..350171ed655d 100644
--- a/tools/testing/kunit/configs/all_tests.config
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -59,3 +59,5 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TOPOLOGY_BUILD=y
 CONFIG_SND_SOC_CS35L56_I2C=y
+
+CONFIG_GPIOLIB=y

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260715-kunit-gpiolib-b0921af52589

Best regards,
--  
Mark Brown <broonie@kernel.org>

