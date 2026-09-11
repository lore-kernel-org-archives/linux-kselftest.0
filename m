Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DDA5A0AB1;
	Fri, 11 Sep 2026 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158424; cv=none; b=QXI10beHkMbFu5z3ZhG/LTyT02S9vfqT9PZKPB+Yd5OCgnk0Mgdv/awS676r1AFgk1YiEhnCnDM2nyqwGR6btSvlH5JRsh8DV2UIo4uNaR6ILtWHhniUTa99xQ5896pb/wmR3qDP4GCcjUZeuja1qz67oMK4DvEK1RmppdXhM1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158424; c=relaxed/simple;
	bh=9K8sTy2EJkFOwG3nXiNve5oBGaZajFtxlwGeQzamFJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N+Yv5Zu2GaqkRjvJbAOJb4Nc1etEKMo68QbC4JkmKA0gFG3GzVYOr7aRlEA+kw/dHzzxvELneJanZltbl/JXt7+xLsYRPxkmlc6laeyKxijAjPj9mZKbzrbDVSEDJe5KJC0t2DZl+I2/QOHSO3vCFzkvSLCXWPAVQOBciSax9aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H47aeLbL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H47aeLbL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0A51F000FF;
	Fri, 11 Sep 2026 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789158422;
	bh=NnR0GeWNRLqdGq338Ey2H6UohBj7tkxzAd4cY3tSTXc=;
	h=From:Date:Subject:To:Cc;
	b=H47aeLbLW26mDJ3hIr5REH3iFRbaPcBGJcDZHo1GghYD4vS4dLz7a0QRTB2xk9fiS
	 NlobfSv0xNl8RzkEHFi+scydb7nYCy8lS/xBRHAQMcsc3Ebb7atLjBuBwpucbsivpS
	 xDgSKYpBm5gL5PG7124vbl7EAbkP/bZYy7VJC+odk/M4z+XHr83Jxv/wKVEWiSJlgd
	 NPNhE4VEhTi4pl0NO3vehfVDPAJvRU8LneXVbr6h4tm09X+aErBEhU25V4UcOQTABO
	 80fJ8Y5/pPgUVJmOubnYen2SYWIRHEyuYtSgVhNOqY7qJEP8VLZ0Nj1ik+KzqJNL0w
	 kbUAuw8gdlS2g==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 11 Sep 2026 21:25:44 +0100
Subject: [PATCH] kunit: configs: Enable DRM tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-kunit-drm-v1-1-c5c0f18fc7b0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMdjpGoC/yXM0QpAMBSA4VfRubY6m5J5FblgDg4ZbSMl7264/
 Orvv8CTY/JQJhc4OtjzaiNkmoAZGzuQ4C4aFKoctZRi3i0H0blFaGMIMVOEuoDYb456Pr9XVf/
 2ezuRCe8A7vsBmpJMiW0AAAA=
X-Change-ID: 20260911-kunit-drm-9cce0032e098
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9K8sTy2EJkFOwG3nXiNve5oBGaZajFtxlwGeQzamFJI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqpGPZ5qOzafPW1n6RJiH1y24fTpXyZzoDENFWj
 ej5JuH31lKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqRj2QAKCRAk1otyXVSH
 0FICB/45446yTT2biB8x0NcxbnMLUgt1Afs0YLcAyK73O8t4moNmod2UwBezV/kWzFBZxJK9GMu
 Ss6/qx8jxRmp55biHAkoD0BTGkXL08rtT450nXjuCzrgbufqz6S7Qjxzm0YxvQT+F5Dd0iVloST
 bb2HD8ZRy6nAY5CAjlIDsdSi622QduJzkpGlsppNgt6mXBL+nWY/Z3Us/hvqNyWCtJNU1ZGK3NN
 4trijc8g50OCBkD0XsZPR24xHMVR98VVGk2OR1dNv80/nKtW/X2OzlB+zkpiGpl33TtKe15DLvt
 lMr8Hb2EUyHkObvRvDgju1IsGfT1hs3v6lH5wtqKxLD5Q7g9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

There are a number of KUnit tests in the DRM subsystem but these are not
run as standard since they are gated behind the main DRM config option
and all_tests.config does not ensure that is enabled.  Add it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/configs/all_tests.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
index bccc2c77196d5..bee893f9fbbc6 100644
--- a/tools/testing/kunit/configs/all_tests.config
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -59,3 +59,5 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TOPOLOGY_BUILD=y
 CONFIG_SND_SOC_CS35L56_I2C=y
+
+CONFIG_DRM=y

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260911-kunit-drm-9cce0032e098

Best regards,
--  
Mark Brown <broonie@kernel.org>

