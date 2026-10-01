Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3A2BEC4E
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820974; cv=none; b=LvYYHbufHlzBFXCZt/jyqe2+grJNglUVyoXF1GRz30sGaUcyWxxGXU865hsOPGinW9yiqcyOZpgzDe8Uv3rrtika66wvuiYXKT9MxZe6C6F34WUJPUX6+A7xR+Lv4Kc8vD5REPzESmfzugv0UBRSDlJy7gsEKDP7CPO0KUudN4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820974; c=relaxed/simple;
	bh=nX2jBnvYS8wUE2Qbi8u0pjLWxyB9s0VVXYISCK8NbOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxvgVqa0TdLqn1ZtMU5nj+JZ0eL8airjEvHXhfASkhzzmr7IhXT0bFO5ggZnXazLwB3xuWIMDhV6KU9PLY9WXEjgRPnJu1AizqOwje+hM/sFL0NbdePEYoawAyrpbWtKmJimOBGyZ3fzJ4ln8sDSqbviFkGD0A4a8H8j8xQ1KW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5jB6y4R; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5jB6y4R"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so3453906b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 19:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790820972; x=1791425772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQJet65ckrbNTaiHK5Z2CMeUS22oqKRz0qD2/TS3z8g=;
        b=O5jB6y4RZhB+mnHOi3LCSpZga3aOSGizh/o3pVnBgyzKjIVbbrPf8/yq0SlSlSmEBx
         TvsEV4kRL/+Ztkn/56MVChpKslJXkcCLSvOgqjC1RLhQJfSTyum607hgiND7v4f8cwow
         zK/XFPXxNFjg53I3fVOp7w5No5WawsWljDTe0oiI6J/urpTKmHsCIidPnsN31LEGCItv
         42L33wemIg9lxmeEHs+8JCl56PyMygDSE23D/2y5o9JLaQturfJM20l49DmQWpbUC3zn
         9vwUYi5YvD+bqL+jQB4TM0mo2wXn9EraWd8VFepAodbPwyoIvbIvoY9Kj6Y8AjiKn8WV
         AHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820972; x=1791425772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQJet65ckrbNTaiHK5Z2CMeUS22oqKRz0qD2/TS3z8g=;
        b=MY359Tq6WAkW2efMkIbQTukaWIxeIaTs9srfbWVEcg2HV85kYl8otH09yA6wTri0mr
         AH6gVXG+yERgrX4K/ICA15MsPGtdih1yZQ80VO4NRr4DP9t76NachfDgE5OTIskNNSub
         gm+w83xNDOUYHl/L8AURP3G8f4OHnxksrxnAdr1kMbVlulZPAWDGgjLG7/DRhH/dujaq
         fe5HzxuUdTBiLfOM17Vc7HZhbkwqN83RTcrciNsI3T+9imlHDzVzhb54AJGgGZWZtLjd
         m9Zy3rb6fPcW7x1nV0Idv9rwUwr4IqF4p2ylls54g8G5P5slAMivc3Kdud4oWK6qxknR
         kFNw==
X-Forwarded-Encrypted: i=1; AKwUvBwfhOdW7KlAShUze2Q/bPCDJ4NpZQaKHHrMuR7zkPaI7hdi77imw6DKNOOxphojeKoIU7dBqFDRjLPEL2ZICn8=@vger.kernel.org
X-Gm-Message-State: AFuF++nFVpGnSYb6F6KQqnuHocW0fVqgyT1T5sd96Ikk06MlADp+xx1j
	y9hNl/XjfeY5wCNc5XUTYDjGqQWCredHjfLk8QDkDYpGkQtTnr/WBPKt
X-Gm-Gg: AYBFou0OjtWsm+Cph95CQF3Qxdu6zt8wKKlJwlHxL6F4j1VMxIFw0l5z+vjpWHiU6tm
	QeBsldlPHFe5QygBgleLCQE8Wi48QvHZTOQjWszGitJTcM5WSSaWAVLXBx+uQPkxox8WBrhYFGG
	59RgUCccVe4MxZ2nsSK+h39WxlsBcfKH5NORH21Fbndha1R9BoGcPe+K9zmKRlo01fKHXMhEjPV
	1gE00x/VBCgl13a/67+1oBc5j18thHL1F/mHspnlzJU4qEAiTOlysIFDn3Bh/nJLDDonzsXnCzt
	bBmN64Cl9PslxJNiFT/NDGp8IHillBDRDjofJjvA0ZyuTI//ZsThdz6J5NvyBh9X3Bsv1JiRcMo
	HaOvVHTu0EsuvifZNmnqQbjrUuGn9r7WwVHrnnMrzomChQ1njKDoj2Zb4f8bjlQisDJhB8Cmhm8
	ngRk+3XOLqCf1UQN0233lydu8nS2OL0z42d5/z93kaQ8EO5x66LQiwB0UcUw2EoCv/NzlBBUw/P
	5mPQmlac0Ki2HjxFZHKVCTf7qj+rDDc1Magxvyj
X-Received: by 2002:a05:6808:1489:b0:4b1:b83a:5878 with SMTP id 5614622812f47-4f1b688af5dmr4764409b6e.14.1790820972123;
        Wed, 30 Sep 2026 19:16:12 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f345b14325sm1208801b6e.1.2026.09.30.19.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:16:10 -0700 (PDT)
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
Subject: [PATCH 1/2] selftests: gpio: enable GPIO_CDEV_V1 for gpio-cdev-uaf
Date: Wed, 30 Sep 2026 21:16:08 -0500
Message-ID: <20261001021609.167505-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-cdev-uaf.sh also tests linehandle and lineevent file descriptors,
which only exist with CONFIG_GPIO_CDEV_V1. Since commit 7673e4c7f7f9
("Do not enable the v1 uAPI by default") that option is off unless
asked for, and the gpio selftest config doesn't ask for it. Built with
that config, GPIO_GET_LINEHANDLE_IOCTL fails with EINVAL and the test
stops at its second step:

  # 2. linehandle
  # 2.1. ioctl
  # failed to get handle FD
  # failed to test handle ioctl
  # GPIO gpio-cdev-uaf test FAIL

Add the option to the config.

Fixes: c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on v7.3-rc5 (x86_64, KASAN and lockdep, virtme-ng) with a
    kernel config merged with tools/testing/selftests/gpio/config:
    - current config (GPIO_CDEV_V1 not set): gpio-cdev-uaf.sh fails at
      "2.1. ioctl" as above.
    - with this patch (GPIO_CDEV_V1=y is the only config change):
      gpio-cdev-uaf.sh passes, as does gpio-mockup.sh -t cdev_v1 (with
      2/2). No KASAN or lockdep reports.

 tools/testing/selftests/gpio/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/gpio/config b/tools/testing/selftests/gpio/config
index 1287abeaac7e..54cf6484441b 100644
--- a/tools/testing/selftests/gpio/config
+++ b/tools/testing/selftests/gpio/config
@@ -1,5 +1,6 @@
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_CDEV=y
+CONFIG_GPIO_CDEV_V1=y
 CONFIG_GPIO_MOCKUP=m
 CONFIG_GPIO_SIM=m
 CONFIG_GPIO_AGGREGATOR=m
-- 
2.55.0

