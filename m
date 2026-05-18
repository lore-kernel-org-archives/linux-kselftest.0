Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C466F38F64F
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 19:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131540; cv=none; b=KVTvjMhRTmmvYpcjMesPEMW5OunIb3uqBkqUgq8nbLBZcUUo+SvVFi4o5coqfRMwUEiNN8n9YiCVoZGq7Mh0FxaMlJiofd7mMdo0acQczIzxrJAsQ6h6HG9vVTndI6rmYgPxF8uMo2TnqLcQiHJ7QVOv6hk4UTpGxqfBE14BN7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131540; c=relaxed/simple;
	bh=dLOJNwezgriYhO1PZqtsX/aHxzI/yIGU4juBcSFDAu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVYnWP5yuMwOs1w1nFi9x9yDKbeKrl3g9ULCBARo5FmmOG/JGpXd8wEnJbeYWkpzS5nry44CS5O/JeWU7FIHjjpYUDfQZLZUOuqQhHO0clmm3GsYxz4P5zSO6kaUg6dzhRB2mEfbVRDDYFhLnrwb1NGhLTHxDpb3QMqctgvSqcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeiDj67h; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeiDj67h"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso14076375e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131537; x=1779736337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGf0CT4yKcvvme5mdnXPLSkPCDM5qKcEM+nXnBaB49Y=;
        b=WeiDj67hTv5Hw40I57BkNRXYL6dPSIQe8S604hpKE3TH7xQdph5wsft+qeJb0xCP6Q
         emp1vBtHvt+ZxIZl2N+G4FdZnFM7x1+Xm8USAVYJRbYUHZqwTt3LIvPAKomLCcNh8MFk
         c4H4lXyq/rb3CSTzFILvHqg8zAjRfCbw9M0oNvZCKmvGt+CiSB3ZwsA9xcF08ORh91ql
         57q6pvTAKwiOmaeqOp83FbVR+jLqba5XXkZEbzwT4S1MVsHLH+Ql5c48BxC//jBKygJM
         OICFSItGoZXxtlhDZrj9hnAPa7x3nwoROMGzXBMTQrsyTUbR8lMZTlG7OL/th8Xvto5P
         LrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131537; x=1779736337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yGf0CT4yKcvvme5mdnXPLSkPCDM5qKcEM+nXnBaB49Y=;
        b=hjBXfzJOat1BJF0vmEWYk5sPBP0bcCec0YDaG3HQaM+k5+U9++uX5zLBA6Kl339RVH
         lIKCWtAhIwEwK+BZq/Hn37b0pg+d5nwsqOhl//cJDnRH5CNgL00Zp5DKDBqUzeIrlUsf
         os/7MZskQRkdwog/keeML/LB1r13XoXsVaKZTXm8la8wadbBpH/XzSt0XIpeGSW0FV8o
         1CmSSn8BKqx8qRlw+7iVIjCXemY4lGQOME0m5FrzCFxfNl5E/0D4iqL7N4bsuP9LK19A
         5n29o30eRPxxODNsruyYhYmEzVVfl2Bbfy9sDpi1BObk1ZgF4mZ/E9YJ1tcEalNyxhZt
         TsLA==
X-Forwarded-Encrypted: i=1; AFNElJ923dzedfM2WpAhWIF4YK1OULP2+S668FlFQa6qDeuJDsA8hmZj1FbzdaGoGTpaBtQqQgVKS7QImtc3GaP/Mmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWb6P7bgnApUXNnd4aKC1/6jvg2un0nzRF2LBqANgKLiQ2nVs
	a1uxYv7gckdnmY52PeoJR0KfgKO9UWRCh5+x7sEqIKivJl4C472AGS1B
X-Gm-Gg: Acq92OGW9DNcVfy3UFgfBr/hVHj1sPoRzfttlFVAn0DSlVxGkCtT2YQp1Bhgz/3xUTi
	kq+23/+Tx9tCSmSO3YyJCrznx3LZH1xObzyshd/7ASIH58ZTgW2X7LITLHDf4nOwGiiROC3rjSq
	VsULe75gEcUGZWtsg2vhKePZ8TihbSxPcq2croZxiwdKnNL4PpJm3+1OR7XYy98z4vOJxydCviF
	wb/28e6Hwq1sIFnYD9YoCVCsBJxF2TcnOjCPfPDs+NS7iMD1+3nJoo1QHQEW/ywbYRe0lKx4gHm
	XNxsqpuCsSZWyPN/DCbh7ksSlZZheQbX8z8vMdj0ff/i/Olsa7SAYn8PCKGa2TPMBwxv0+IZGGK
	yDVC1czoC6/2G1vN9Xn2z7iVNypu4i4JcPLPTVsR08Yp6xlhPdTY6cPTCDJfWFGM3QmYENHOb22
	Xn+1s0OdZ0k7Drn8zOX3ZfCQoOTxVYI6mHguaIf5682sGSGfdG+X4=
X-Received: by 2002:a05:600c:a11c:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48fe5fd536amr192002785e9.5.1779131537200;
        Mon, 18 May 2026 12:12:17 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:16 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: [PATCH 3/6] Docs/ABI/damon: document update_schemes_quota_goals command
Date: Mon, 18 May 2026 22:09:29 +0300
Message-Id: <20260518190932.42270-3-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
References: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the DAMON ABI doc for the kdamond state file input command
for updating the current values of quota goals.

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 Documentation/ABI/testing/sysfs-kernel-mm-damon | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-damon b/Documentation/ABI/testing/sysfs-kernel-mm-damon
index ee29d4e204ff..0bd33c1e6790 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-damon
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-damon
@@ -36,7 +36,9 @@ Description:	Writing 'on' or 'off' to this file makes the kdamond starts or
 		kdamond.  Writing 'clear_schemes_tried_regions' to the file
 		removes contents of the 'tried_regions' directory.  Writing
 		'update_schemes_effective_quotas' to the file updates
-		'.../quotas/effective_bytes' files of this kdamond.
+		'.../quotas/effective_bytes' files of this kdamond.  Writing
+		'update_schemes_quota_goals' to the file updates
+		'.../quotas/goals/<G>/current_value' files of this kdamond.
 
 What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/pid
 Date:		Mar 2022
-- 
2.43.0

