Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDD553D9D2
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181387; cv=none; b=MPTT98R7hXdE3tGsp3FkXd3mrn+fE+Usn5v/wVWtYkc5uoLBgS3+s3U4nQfyPzW0Y0e0TEqFpBegPaDtuTngQJ64kjBHUV64rH8mxL58niIgxNri2Z8+6nVgxN2g5wTSD4par9KsghXbLv0ZoerN+IMEGkT5rFEsMB8G7fuXxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181387; c=relaxed/simple;
	bh=9OeixsceemmEnxehS4nFF1a2FYDdepSavWu1P0EAnzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F+pd/ubpeyDdB7uc7gDiyQ0W1kUTW3wC2w3x1SkP1FZFxjhNo+VWQPKjs+VZaoaBYWY9QGQTSRHMNJyREP9Rfcnp07UAR7LsGKYhoMVWyFZF+IfPIbZErLtIb6Yg8KPEGaLDdoXfvObUBVZg/gtHq/AJmpfjpHUFhARyNoeEMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=cKOOysva; arc=none smtp.client-ip=74.125.224.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="cKOOysva"
Received: by mail-yx2-f5.google.com with SMTP id 00721157ae682-8644b2b4ae6so330707b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1790181378; x=1790786178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0e5lTRhuZiVse6rLfC3ssGDQx6Z+oJqHSfiMTS5QO4=;
        b=cKOOysvaur4Q9x2WyEc1b2g4vi39OoTsYvdqSSn+c29aYnEUz+0p0a/vBqVSU+iYBO
         Qa22NU3nCcjEZNi6Nwmij/tsLjGD3uW9hy/TZFDG8phDuMMqmryNMvoOzWGZ9QcxyB2D
         uELEEv+hnUftol0gtl1QZjtbgTw9Bp9rhoAtKUUe1n40l9l4IhPkssn7e6hxQUmp/kp/
         +gRyp2oM/V4iKDb0uanFXWj6YZ2UR8P+jmzUsnhkPn/dvuceEXctlGcM5Og8MIrqE6h1
         DuOBzM+Y9fSKcWkTw6AiCa9Fw1/EUrKDDZHToJ+/RSXGCGBsqi4KOJKFHfZSdC/RChVN
         DKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181378; x=1790786178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0e5lTRhuZiVse6rLfC3ssGDQx6Z+oJqHSfiMTS5QO4=;
        b=QWtbiEt0JT8NAqT2h2bgzw2qxVQwdGD30gvpOJH/7+8Zdp1k/j3UXrLfwe3q58vbOt
         ZMLscCq3LZtRREz3akvDQjvAlIRIHRBI1QlrY1g8S5dTHIC8QH/8hWTvUYwjT+4HbVW5
         JD18nlm1e/l4QEbB7jK7xl0wzA0dltwh/NJlZlntXQheCFTZ0k3OYc1WCULKIHd++MsA
         lOHmmXmnlOjgmi2KucHJHr3A+RTmyh86E9Ip3U/B/7BC1WjQ+3DzduhV/uMsED9s5+cy
         +31/VWnLCfe2Nz+n4/xYqlFZzwVepYdpqebGYUu6iv7iN67qbRE6I0dj5uswdnmZ4oOB
         bDpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtYP7OYuzi6gdH2UvQOuDSx8Wef3Px1wERMw8P50pQO7Snm24Bcfievw3tVeNln4KxCCgMlMKxDYbJtOwOfcE=@vger.kernel.org
X-Gm-Message-State: AFuF++nEvG79jvozAWW9AtE7nPzQYLvwa5ZZxEWgtY6gRIprHuU+vDUc
	f6tut+CWPEFXItgVFOHAUNMLQLbH/FC1N/aPOW1++RaI376isS1O90yBb8d8dd7GbIrg
X-Gm-Gg: AYBFou3xUcvBvIXxLrwyTau3OkD0YUpoQ+ARh1l9rkT1mGCMwb6UaUa7vgzVqReQMP+
	RNRwVhQw12Cj5msTuHXSS7e8xCPkWT6FwQpK59LL2WXROPPYj0/GFmHGSjgC6xdH0DOlpe/dK5Z
	Z+mTTwZWuUtuimm1YOReGGvC8asagvsPclb+ILs8+7xEx3ghC+9+RyyZ1BCciYZTU7tdVVhZgNP
	IZgaQn4CE8BRSAz3Jn3c140/aZ/6hDdmTrkUi7b7LDTgPP0kF//9awoeB25Esmm++1J2rL1qyQQ
	EjVJkYX1Osk+mcFocdqVo5NVSqZBU6zMv9wxTTRxnBnB7OqgnCnKgpHnKLcCtyxLdXmsou7EwR3
	fDJSBFmJp/Hd5F88l2e5igJTadPeVHqI1gDcP/NdxrdH7J4B3UmCUKFradj8BHYoZmwwuYqeR7Y
	hiQtquzGIr2XtlQszHAF3JsZ/qP+la5Az7kqVDVmhFjzamSJq88Hfvi01j45S3T33YpV7ZjzvoO
	qpzwmm8Rmb8fJ/OSdcfy8HJa0XAQeqmHNxvor1ovAvBoK6w/g==
X-Received: by 2002:a05:690c:998a:b0:841:dd38:a734 with SMTP id 00721157ae682-8a452878e4bmr37543737b3.0.1790181378043;
        Wed, 23 Sep 2026 09:36:18 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c9778sm12709257b3.8.2026.09.23.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:36:17 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] landlock: clarify TTY signal scoping
Date: Wed, 23 Sep 2026 12:33:19 -0400
Message-ID: <20260923163321.79770-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document that a PTY master retains control over processes attached to the
terminal, and add a selftest covering this boundary alongside the direct
signal restriction.

Since v2, the documentation follows Mickaël's capability framing, the UAPI
description refers to arbitrary signal targets, and the series includes the
requested selftest.

Link: https://lore.kernel.org/r/20260916152336.1589383-1-clusk@northecho.dev

Christopher Lusk (2):
  docs: landlock: clarify TTY signal scoping
  selftests/landlock: cover TTY signal scoping

 Documentation/userspace-api/landlock.rst      |   6 +
 include/uapi/linux/landlock.h                 |   2 +-
 .../selftests/landlock/scoped_signal_test.c   | 175 ++++++++++++++++++
 3 files changed, 182 insertions(+), 1 deletion(-)

-- 
2.55.0

