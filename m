Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87F3803C6
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 23:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468666; cv=none; b=X1D++balFoTNbTgRFPA3qnRtAh7DIabv7EcBv+YroaPqlaKWGuLp+ApaJaiZqIi/ZJZH56Qh0QMJGKzwiWIiVw32uyFooyDpOJVONIx826T6U55yeAdJjp0rO+PJonixnvBIQRM7vat9y208wbx4ED4lHeI2QNbhAwCt3BAFXDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468666; c=relaxed/simple;
	bh=mGH2HAOi0TNj45O+XuKLfX/dRuUkO7FRMffdRyeFGoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipOpCy7xeT0bG3nDPn6WPKTPAxLFQrx527vWQGi/hIdGLHodg5rnIbpBKovg9E80WtWrKBUbu4tGbMqsSmXluUDeCJUaehuhEULnLzjU4nxZvXI4dP9MVgPJrTr/A1/5e+Wv84BspvYZjfVCXGQBzr+2qlBcyh6IQKLbKmKeLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gR39VxgR; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gR39VxgR"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb34c17b96so81893a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 16:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783468663; x=1784073463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=er6pkGgqUgqjUSkeHs8hENATy3dGAIc5vSPhqVqK9VM=;
        b=gR39VxgRgKDdHRfOuUYBmh+PVE5MUGxH4RKllaera4Brdv1kj9cY7NbVVCNJdJ2Lwb
         SV8B7h0MT0JbUAsnUkXzhjGysLkY2byyxT2Pa6Av9IA4zTWp2nSJqE1pUDlnX3WBBXPa
         7jjGLj+Cb8ldxNZkuO18JyKO5WMI90oxI08iD8H9VByvkeWQoOdg72/A8U3egL+LjWfJ
         n/7BtjTXuhJHjXr159c5bi9vwjicnNwc/vv7ya/BQghuqL+norRpjVNhvE9zGzLx9wh2
         cIelL1hJx1BhF0W8AwV7zLeb5NDQdY4YcRPFcYI/Jjma8xVee/EEW1nZ612rzYKzl813
         BmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783468663; x=1784073463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er6pkGgqUgqjUSkeHs8hENATy3dGAIc5vSPhqVqK9VM=;
        b=FXqbQC3FkzE2I+nCRPYMMufw7P7jWEBxTJ7eCK3Ew08eB2vvPa4NhtaAzhRGVBNpNU
         zBHGVvBrued84z2a+3hyYLRKbk3i0OYab3pmjHh/nrrFMr8i/VUvhLPpO3hECf+I8CYd
         nT/k/9lNJ0gUGpNA86G8MZSbBolrQKdgTJZ4jTl9vFlE6zT/LzikdExEIr2i3oGCm3AL
         jdE12ihJbwz+v1nR/NqT6zoNsnFPoDRFUFVpFrtNoaOV5ouidqRHNpXBQmqhVgIcAo41
         yynGDhJg+I21b039SLhyB4M5JJyRSz6biOYYPjSaInBTMSLfYvVwoqWsqHIwJnWuEuB5
         loYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ONvH6LzSvU34OrnquK79IbH+aekd1L4LeP6yzOln2hGcpkMaesoVoTKEtM4AQcNK6s6Uwoj1bJmjTvEGFomE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUx5Erh0WHRd3yZOC87PAIyy7/S6X9VllJVRSSwhAjJAKe3Hko
	wvR84zd9eB6GIxF2KM+zeeq+5XG4Qm0pevKsvC9NIUdrKrZ9RWUwNKAh
X-Gm-Gg: AfdE7cmG03ydUk9ysIrjsNtnXj8f07mrmXo8m91zanmHloF4uKrmhlWYm0aNQg82P5f
	zOpATjh5NmZAHnNTk7qkMw56SeEmJlrTrDZ0Q0BHu0oqNYz32REVjIkSGcvbfS6rKA4OnSjjjR6
	FPVT7XKZ9npkN93AI7SlYtBwJl/Na4inVSLvh+SnkJrpYN68yAlDmJKJvP3Lr/qBIH81+lX2k+Y
	K8RJ7P5nzL4FhQ/Ud8C/IYl+b7OXSI8uSp3z/tcwMfBhsoYpm5nK36oGx8XRJeS1a3EfNVhVamN
	5xKgmD3CEQcNcDPBKobxc7ODXLFNOUo5fWu23tmC52VN4+FSbqsBU8Gcbce1GxVLKmZ57+swlTG
	c0WZEuxXzWo8HMG2GwItS6jGFdDJM1YlLAOLpxd3FBUAYR9q2cjpPehbIxHXl07qlDiavqAUABm
	m31NFWsT0=
X-Received: by 2002:a05:6820:f023:b0:6a2:9bbd:367a with SMTP id 006d021491bc7-6a36d8735c1mr193412eaf.12.1783468662946;
        Tue, 07 Jul 2026 16:57:42 -0700 (PDT)
Received: from fedora ([187.142.231.66])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a5ef513sm763159eaf.6.2026.07.07.16.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 16:57:42 -0700 (PDT)
From: Cihan Karadag <cihan.cihan@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Cihan Karadag <cihan.cihan@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: gpio: add gpio-cdev-uaf to .gitignore
Date: Tue,  7 Jul 2026 17:57:05 -0600
Message-ID: <20260707235707.1349969-1-cihan.cihan@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests") added
the gpio-cdev-uaf binary to TEST_GEN_PROGS_EXTENDED but never added it
to .gitignore. Building it with:

    make -C tools/testing/selftests/gpio TARGETS=gpio

leaves gpio-cdev-uaf as an untracked file.

Fixes: c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests")
Signed-off-by: Cihan Karadag <cihan.cihan@gmail.com>
---
 tools/testing/selftests/gpio/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
index ededb077a3a69..16f74de479f17 100644
--- a/tools/testing/selftests/gpio/.gitignore
+++ b/tools/testing/selftests/gpio/.gitignore
@@ -2,3 +2,4 @@
 gpio-mockup-cdev
 gpio-chip-info
 gpio-line-name
+gpio-cdev-uaf
-- 
2.54.0

