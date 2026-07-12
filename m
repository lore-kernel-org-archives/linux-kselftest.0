Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D7422E3E9
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 04:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783831646; cv=none; b=AIr64p8tWzYtJNhmjy7tiJqKWiH8vf3RQTIg9/p55RWizY3bdS5SvjyvtSZ1+7w7ZTo+SMlfhoRnBlCAo7UTOwSFjyImEpKKnYSFQXNMl6onTOErxTA1o/jbGJtelMOpZt5Hn3kOl4HcoVmlkMuhzaG2x1r3A0rDkVXYwz4jkIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783831646; c=relaxed/simple;
	bh=vHJ4g0f+0j3Q3yr62ahRwdRnFQbA2bzJ7fX2MFfF/ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSPxbO5d8YCbuzx/fdu9gORwfL37pqhfK+fHtmLBjCzN9I78Y+OIe2wYJf6IZva0kLvJOE0TBiijYKDZOC13sw/Suf+ze1nfrins+II8KPKOmM+GY+FXj81W+PDgTE5P8W5MDdvomiaQmVS1lH6Fv/dNCykabJteTM4EaWckmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=masoncamara.com; spf=pass smtp.mailfrom=masoncamara.com; dkim=pass (2048-bit key) header.d=masoncamara-com.20251104.gappssmtp.com header.i=@masoncamara-com.20251104.gappssmtp.com header.b=mIjoWkT5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=masoncamara.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=masoncamara.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=masoncamara-com.20251104.gappssmtp.com header.i=@masoncamara-com.20251104.gappssmtp.com header.b="mIjoWkT5"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485b358552so2296975b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 21:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=masoncamara-com.20251104.gappssmtp.com; s=20251104; t=1783831644; x=1784436444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZXz5E3gRMPDk1Q4+ej8gwhJ/pddHD10PKP9UivF+m0=;
        b=mIjoWkT5IBOGdJZKYzbrtqeh0mHDWLj5HBa+4zOGqUdFngHcnHTmDDcZ0TzBJdgA8b
         mmPvkwgpt52Cp25iDrO7VhRKY1PCfBggLkzyAwUcSO2Dqr4Jer5zEgppkozujh5pr0a6
         65mzwp4CzVaGTvg7OVSWSlMa/MndiB1zg+B/OQ4T13W6T46E2wVC8nJcIhv2XxuO0lKn
         SSpld5OaYEQit20xopvZcHiz0gP0Hv6YDO5fYGzqh6l+8pBCWIUgPpzrpVjv1L9bG8ef
         VAtv+rP9OC8Gfv3gdX9tFVec/Ay0/ffHY7mS3fpishiBwPT6ap7P58WfDMxy7Oo/zOSm
         nCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783831644; x=1784436444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZXz5E3gRMPDk1Q4+ej8gwhJ/pddHD10PKP9UivF+m0=;
        b=Hc6Nmr0RyOeLarziXbcG3WLJAsAnfozbMEny0A8CIkyv94IB2ci2fmBPYAPJ/H7z6a
         EHGxBVvUvUeTp4ikJu+FsPofUkWlKrOBjbkXGsC04I7yCUY+7OfSwotKaf6+1MxZxXoH
         0ytX36uA9mwsQKGKfzLeAXzM+Awhvb/zBNGY4jR+IfutYLbdTfgRbpBreRgLIi5aF55Y
         OFMAITY4Ctri05rLOaD22PBGF4Ag7lNMg5J7Hq2J0d8TJjn6n7IbZjfllUTXDw5qi1Ln
         42FfKw83caRMThAYUCWotH+AZNgH67bOm+dqpIwsWZS4tKkTaqyDKJvvfyMzqPIKMBS5
         dUoQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8nBf2b05zFMdTZ0WAumxqFbP6V394Z2vLUEmJAvNnQZ8wpZq60Jz+ZWbp/+o7OhTyKklaDL9DBvKDM4zdrHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ztej8D6rHBmtgDmLQYHB/lueNZnOUeVi/xPd2swajULCB8ig
	7sy9NhKYAKB+d+41r7ZWHEFLFwpCWT635Akox1NwyoJXUKW2GIajObqypwHrQ0bVdNNj
X-Gm-Gg: AfdE7cni8jABUqqhFh9I0CFxwLTnIWA/jHLpylDJ4OuaQyXN/Q6edstrP/z5SvTQItH
	Df1jmPGLHeiu2Nk/wEN2/8ShzfbYdgvVLNc53nGj5uS1FdkckIBbl45n23MZ18hzdjWb9uc6IgA
	bPjRiYLI59ncCLNBgZygMLYqA3DeCHlgM3I0s4YVu3dbl4UVZ7gJO9Owp2VpWFreAlpvCXUnhW3
	FzCxwYXE5lL8b5duBvDt+OwrTFusIJ9oSWkYEOa+90Vjkbm9wPrwTKhmbFh45rN1YW1FVwlR9mw
	9U2srQZIulYLKXxobSdjPQMUe9THEpGXUTQIm8mtRaxv/EZgdBqx5fGO0crozKcu25Pj3e73ptt
	A3W3cJPTBSKMMgN08agf1ExVxRl2sKO25YjLATGMoT12h/OauV/uGY0k/9CSAlN4jAiiWI0H1D9
	A+PHk2ERywp6+JHgvXlX40dMVOHSP46aDzk3WZ9A==
X-Received: by 2002:a05:6a21:329d:b0:3c1:b9c:4886 with SMTP id adf61e73a8af0-3c110d2fa6fmr4862702637.72.1783831643877;
        Sat, 11 Jul 2026 21:47:23 -0700 (PDT)
Received: from nobara ([69.26.129.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm59384338eec.14.2026.07.11.21.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:47:23 -0700 (PDT)
From: Mason Camara <ping@masoncamara.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	John Chen <johnchen902@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] HID: fix battery queries with nonzero field offsets
Date: Sat, 11 Jul 2026 22:47:00 -0600
Message-ID: <20260712044702.893825-1-ping@masoncamara.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Magic Mouse 2 input report 0x90 places a status byte before the capacity
field. The synchronous battery query treats that byte as capacity and
reports 4% in sysfs when the device reports 95%.

Use the field offset and width from the report descriptor when processing
GET_REPORT responses, and add a UHID regression test.

Tool use:
  Codex (GPT-5) reviewed the completed series for submission-process,
  formatting, commit-message issues, and suggested edits to the commit
  messages. The code and test were written without AI assistance. I
  reviewed all resulting changes and take responsibility for the series.

Testing:
  - W=1 builds of drivers/hid/hid-input.o with
    CONFIG_HID_BATTERY_STRENGTH=y and =n
  - v7.2-rc2 plus patch 2 only: FAIL (capacity 4, expected 95)
  - v7.2-rc2 plus the complete series: PASS

Mason Camara (2):
  HID: input: honor report field offsets in battery queries
  selftests/hid: test battery queries with nonzero field offsets

 drivers/hid/hid-input.c                       | 39 ++++++++++----
 include/linux/hid.h                           |  6 +++
 tools/testing/selftests/hid/config            |  1 +
 .../testing/selftests/hid/tests/test_mouse.py | 54 +++++++++++++++++++
 4 files changed, 90 insertions(+), 10 deletions(-)


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.55.0

