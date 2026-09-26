Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96370286425
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430219; cv=none; b=OJWNhOh55CHGvDuKmbTyL9+aeGmM2i4juoIfHaPQ+2rSn0gA/q/KdyE0NWqO0c6RL4NAgLYvxcT9vVpPv7k4fS6NMnyLj31XewOL1QY+NykG7vBNwg8LGVEdg0SGtoyOftJrMUU2rKV5e/Ec8dJaUXQ19VLMlZlyvDQS8h120Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430219; c=relaxed/simple;
	bh=1OgR6JG+wwnh8+xo0vSZjvHjsyMo44Qjvdr8iWZ5juo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dyqCkacldgAB74mwpy0lLi2H/ybt7nFu0H8xDj7fYeeO/QOtDFjmMjlG0F5ueId1T117n91EWyoW67oZcK8t3lS8uaMXfWZlLEVRau39ieQtnh+mpOaMxrD6nUsDg3zdg3YPVK4ybu7PMiKSFSU+LPG1dM8jaQSVf+SMiIUzs8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8gtVcHt; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8gtVcHt"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e6eede34baso89873b6e.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430216; x=1791035016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqPktwupdkqQOvJSb1FXG4s95BKEGPyJZ4WxNU1BDYo=;
        b=T8gtVcHttmR/uzvpOFdIL5ioAEfs9ZZS1BgihT8LMc7/cEjAgF/htt+VsvuE2z4Qzh
         N6WitnwOFXJpLxcpCvOSzmrsVXhEuTEy1XEx89mFonkQj8U1DSmihOyYKzLKxaAknKMm
         bfkgretzqHZ/acGuQ85mFj5dbosMR3clP6CKcCAlCJgsY8aH06Knw5kcgiLXmMFyI2sO
         OHsMfLThaW5HhF4IQUYPpR+OwmDZmqsN8S2EMgSmhv2aFHMRK+VkO576QYJXHYBvwU/c
         a36qTtnvYTfMKr+Zfo1YMKQ58uPM3gYEJvSJU4xffnhwLkNO1IwfJgLh+Nn7Rkzy1zMq
         nKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430216; x=1791035016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqPktwupdkqQOvJSb1FXG4s95BKEGPyJZ4WxNU1BDYo=;
        b=Vde+Efswl/Yt4IQWd6ArH/EllzbPF9bUwnEekgCKxC3/fBD4irIe70DETNhY7pkDe2
         75sYpE7GHZC15hQw68+3QwB5KO0uRpsL8aUXRddbh803cqeymEKSjpgcPQlLScZciTib
         8YZJ5vP4kH64ULzGZ8kZtFazgjv7u4hwefZfBWZABHD3qZvsX7hGt0JSJG8ALzeigPv6
         3lXHUxxPvzpnczMga8SSpQsCw+4mTeyY3f+iLmK0WwuFbDIZBi11ijP0V2QukLvTfyTa
         QHN2T0EZhJS7Pi0pP5wS0HfVh8JH1OaS1alN5wlaZr/Vkq2VyjWdIjMAe7dsOi535BHY
         ihlw==
X-Forwarded-Encrypted: i=1; AKwUvBxcLsD8T5TM/yH4jmDKi7D27sTlzdj6pbKZLhWb0h74kiUIlAE3wdb29VeV4hlSQHJNlQeco5jObf1BrnwGMtw=@vger.kernel.org
X-Gm-Message-State: AFuF++l9ZnL3iOJwdZTA/GR8taXS3e6tDZVnuZznl0z+2ziQuEc1izw5
	imNGfQfplxL1bdx3vaDi/N+M7claXWcN+wtt520pGRvS6mxLhN6CpOXc
X-Gm-Gg: AYBFou3Acvp94ucX2PPgY8pjhOtUgfiW29PiDzU/yxSdmMKHIXS4NU0usF+XZT4iT0+
	SyAIUviPh+y1pP+t4lW7kaFKaTFr6xlmfJkLkLfstxS3eRe1bTrUY0pngUsZAL1k6Er2QMI/gQF
	D69vNvPsrJSAPVoQlDzlpybW0CWM0TtbK2igjwclRmOUzAPa+f1cMRxqy+PTe/gEkzXSOXo6vXk
	fDRqR8SMEF5LfJY6D6t/CXS28VqgQpgOLTUMp+76FIVEibCT3+LYK2XP8RRnuN0eFQ8x7Its5TJ
	8tNvzskNmUsBgaPDSkw+RhHWnQK7hliN9MA2xr8NgygpPWQhVIDj6FcTsXDJSBFSNhvcotxCrUL
	J5QIoYuFDGIa8Y5S9Ts/KoBxx8J0BMZTMbhU4Bc7C/3ejgphkRxst3A/9B203LsQTjfKXPXpm+Q
	QpT+MNnGr+/U0ilOsvnWI0Bf7MooyiMfgDw32OZIZE4/2TaZd5jWs5cM1CCSYWF4t9vi1qG54ma
	RsPapK62E+xlKK6m+g+UwRMX0I8M6oJWVCzjZMlhBMEI7hgnUM=
X-Received: by 2002:a05:6808:5028:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4d72c635fdemr9990262b6e.11.1790430216428;
        Sat, 26 Sep 2026 06:43:36 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74281sm4452874b6e.5.2026.09.26.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:43:35 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/2] tools/nolibc: check for overflow in malloc()
Date: Sat, 26 Sep 2026 08:43:30 -0500
Message-ID: <20260926134332.58184-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

malloc() does not check its size arithmetic for overflow, so
malloc(SIZE_MAX), calloc(SIZE_MAX, 1) and realloc(ptr, SIZE_MAX) return
a single page instead of NULL, and slightly smaller sizes fail with
EINVAL instead of ENOMEM.

Patch 1 fixes it. Patch 2 adds nolibc-test cases for huge sizes, which
would have caught it.

Tested on top of nolibc/for-next 0e1c44b472e1, on x86_64 (GCC and
clang) and i386, and on arm, arm64 and sparc64 under qemu-user:

- nolibc-test, all tests: no failures with the series. The only
  difference from before is the three new tests, which pass. They also
  pass against glibc (make libc-test), which builds without warnings.

- Without patch 1, all three new tests fail on every build:
  malloc(SIZE_MAX) and calloc(SIZE_MAX, 1) return a pointer, and
  malloc(SIZE_MAX - 4096) fails with EINVAL.

- On x86_64, a separate program shows realloc(ptr, SIZE_MAX) returning
  a pointer before patch 1 and NULL with ENOMEM after it.

Danish Khateeb (2):
  tools/nolibc: check for overflow in malloc()
  selftests/nolibc: test malloc() and calloc() with huge sizes

 tools/include/nolibc/stdlib.h                | 12 +++++++++---
 tools/testing/selftests/nolibc/nolibc-test.c | 11 +++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 0e1c44b472e1ec21efdad1df21b10e5c568b65b5
-- 
2.55.0

