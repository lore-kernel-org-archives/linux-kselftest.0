Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB65A3909B6
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484724; cv=none; b=OxxfitzLaRdGHNQUuLjkbcC9bjjiGYKOmctVvXcFbXN76Iz9pDVvY8nWHhsYcZzhF9TAXMDhbzk4DUBgFCBX5fHvVp/ZnkRv/yGtPIzM6f1vVAfyaG8S9mh14KneFT/uvnZhDKn+jPnkJUIoH5QgKjCJMp5J64vkHnzPv+wD6SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484724; c=relaxed/simple;
	bh=GX2vdzDQw0orDpF1KNiOJ+YXbUSF7H7c0zdw6D2rYGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E17lPBU+ACdWyaJE2TIii+LM47c0nil8aKNGeWg+7H70P9F3rPBAfgAdRFzGoqBc+ZOMqITt7w/9DshUjDRP0EXQLmnJDg8gWp+LnrePZi/WWXSOw0Puo2Lbyxa8thm0LbHZYRute83RHREttzyURiXqaHJgAcOBnAd7N1nxQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcEc0k0x; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcEc0k0x"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48379a42f76so40160185e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 12:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772484721; x=1773089521; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDZTHc6BBusOWypWkW0rlAgV9n3xRkLBnweZCKkigSA=;
        b=BcEc0k0xnXwLqx3BAYn71fakEtFCvMpcx4Eg2m6NjO+ZaRsNg2PRm8rsYF3loqFX6M
         zF1DzQw6ZQeQUca4mpm+4zf5xz2nvj4pi2+hinTH6C7KQ8WYDCU8WMaZ8AdfKxwDaQY4
         1u0OdzEWWRpiubE8594uRO6hlpuBxFcfVEWtEgfnQdLSmtzvU6ZGHWNpUHmn9Tj1Gkdv
         hovJNq2GAReEHI8p0Fo/LqvtY00Hg2nfQGKcZWVmvFPDUsXsvJxmh/eS9SsFSVmtqa3i
         zXFMFZHYuX8fjbQiHoBLQvo+ABQNSniC/REf/OlPgtGXBX4Joi05VHNZ6mccVSd11Dip
         kqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484721; x=1773089521;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDZTHc6BBusOWypWkW0rlAgV9n3xRkLBnweZCKkigSA=;
        b=fDHZg1BvwiG6n7bTKwwtVFHT7eBLT9pBFEg7iQAr9pOtA7HI7pGAMn67bmwbz0Rdl/
         R/nVqTKQ3Uaphv9qGKuL8iIxgR4Y92L0y36lZs6lQ1vZYsi/qO3y076JNI6eFQFZvuHq
         rwwsJRJlpvNTr1pv+HqxQHtWovXqbMVs9oPI85xSPjc92pImYV5fm1WIJGlyHeSQq5Ky
         AKpMvuppazR+vUkrGCPR67UBMLoJPRQja2ci+DYsUSh8Bd4yuJMTszBigwT9+5/p9y/p
         IKYiaCbpYufE0W7+GwpZY6Fv5JXyu5yJSlwXJp3CJ8U/4ZXsvBq1VUtUg3jV7gwbd58W
         txGw==
X-Forwarded-Encrypted: i=1; AJvYcCVCh6QduH43ulyUlR2HDfx0GmndplqmVcMCLAbOSslkJkYMqDpwymertN96/liIBTbVqi+/WPocU82uVG5fBg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK9weCcsfZdsGZl3fwe7bVwCxXzxS6IakB4KpK/P8NVTlHlIPj
	RNzOBRqARSAu1JOVcokcgcXHfH5j/XlPPlWLH0r6mjT8rpy6H+3+7UfD
X-Gm-Gg: ATEYQzxsbx4KIxAyNZAA5Uv1BL4W0jv9wpmGaDzFEyNefKgWxZ/Ihylnp5PyvNOC2Pv
	3wKNWt/s7FRsOmfAanGLpnEplsjeP4TC+N1VIFoOaFokHC/lddu5/QcJGoes3BIPAl70aQhKMjq
	HQwDlAjs05z4S/ExDE7wfxtLCJ1z+XDVvFvJwxj8UbqXdo1BNsemMwKvhqvwPDt6Ai4Z5TAUpHW
	7YMGCq1cqzzX+OW9B4EkXx1+4UuxwCFH9aI5UlTmsDkzZ4LP/K0astVw63R14unQl6Yh1gAAG6m
	P2bUp6qK+7kjekr40vnw89Lu+yMk5wVFaV0f6L10KJTzJMJuBQgbzaSGWaSpY9qs+eJ2VGhsihm
	l91g2P4i7AeOA947/3p3kUX4fSS4snaTKGIN+dCFoooA3GblfUKGHIZlb1w54lXoyw8/U/+Kout
	Z1qxW4iR1O4hCPJEKV/C0V3J6UQX29Bcn0eWzXfY+E8w==
X-Received: by 2002:a05:600c:34d6:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-483c9c1cc59mr250790135e9.31.1772484721113;
        Mon, 02 Mar 2026 12:52:01 -0800 (PST)
Received: from [127.0.1.1] ([2a01:4b00:f03c:ba00:3081:348a:50c4:2d80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126705e5sm898705e9.5.2026.03.02.12.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 12:52:00 -0800 (PST)
From: Jamie Hill-Daniel <clubby789@gmail.com>
X-Google-Original-From: Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Subject: [PATCH 0/2] seccomp: Allow using `SECCOMP_MODE_STRICT` with
 `SECCOMP_MODE_FILTER`
Date: Mon, 02 Mar 2026 20:51:50 +0000
Message-Id: <20260302-seccomp-combined-v1-0-c0cb7acb0f97@hill-daniel.co.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TrA1OvSV6JC61h5SUYgg/HtLl
 4E5zLzQqDI1WNQLlW5unJPIOCjw554O0hzEAQ3OxhrUjbzPV9ECx4mCxsl5GxxZjAEkK5UiP/9
 y3Xr/AGc4iVZiAAAA
X-Change-ID: 20260302-seccomp-combined-24bc3dbe32fd
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772484719; l=1608;
 i=jamie@hill-daniel.co.uk; s=20260302; h=from:subject:message-id;
 bh=GX2vdzDQw0orDpF1KNiOJ+YXbUSF7H7c0zdw6D2rYGM=;
 b=naS1/aq+YoMzST/EZNS35eDMvxD1nHxkUULPJov97RZuOYvEodeTZipKJVNsGQNbzyJaR6OiM
 FrNvzsat+wtDFPXTRdZBYwK5BWKbYVFjdYhc5xpu+W43Sdh753XTf6+
X-Developer-Key: i=jamie@hill-daniel.co.uk; a=ed25519;
 pk=ovqCXSlFUjrT82WuRtIuXB13U5n1yfxM6o0M5O5J2tA=

This patch adjusts the logic used by seccomp to allow applying both
`SECCOMP_MODE_FILTER` and `SECCOMP_MODE_STRICT` to the same process.

Currently, once seccomp has been initialized, a process may not
transition to a different mode (only add additional filters).
This means that in container environments such as Docker, which by
default runs with `SECCOMP_MODE_FILTER`, processes may not enable
`SECCOMP_MODE_STRICT`. This is an obstacle to using applications
requiring `SECCOMP_MODE_STRICT` in these environments, and requires
disabling these security measures.

This patch introduces a new `SECCOMP_MODE_COMBINED` (used internally,
not exposed to userspace). When a process attempts to apply
`SECCOMP_MODE_FILTER` or `SECCOMP_MODE_STRICT`, this mode will be used
instead if the other mode is already enabled.

When subsequently running secure computing checks, we run the strict
checks followed by any installed filters.

Link: https://github.com/moby/moby/issues/42082

Signed-off-by: Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
---
Jamie Hill-Daniel (2):
      seccomp: Allow using `SECCOMP_MODE_STRICT` with `SECCOMP_MODE_FILTER`
      selftest: seccomp: Adjust test for using both `STRICT` and `FILTER`

 kernel/seccomp.c                              | 46 +++++++++++++++------------
 tools/testing/selftests/seccomp/seccomp_bpf.c |  5 ++-
 2 files changed, 28 insertions(+), 23 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260302-seccomp-combined-24bc3dbe32fd

Best regards,
-- 
Jamie Hill-Daniel <jamie@hill-daniel.co.uk>

