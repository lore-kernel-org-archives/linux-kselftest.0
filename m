Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3539F125AA
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700806; cv=none; b=jMghTjWxpJOEnJymqoy87yCbupEW+zD49WDhYrvv88ca3ReHADi5lUk5Xw+AeNUS1AstKxY4U4YGTWZU9C8U8sSTOI9BecAschdp3CKyH0qfgbRxWdpVeEVHB+xZW/i4xcuJW2gwrzh720mycF5tDF188c4DIdSYZzoy/GUE7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700806; c=relaxed/simple;
	bh=KJbVMsOkLDWfiJX1viGBmIaZLaHOfkGmJc7WvRqzC4E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JLaDfsg7ZbeRmzdp77fKCtmsNFhgXg9fCuDxN9DDLRQjuqcXrCvYQ43rsK4jSXm7lJNAbZkkHXvPjDvmdAM2vjObzY4BV8gNignmqJ+KP2WyERqngIs9KpOALaKd1WpdGiAWX+oyOMyHBFPUqR6zMztJp8HazCkmO10Az1TgbRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mXmJncc7; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mXmJncc7"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-369ef27fd09so7533020a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 02:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779700804; x=1780305604; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DqRrMUWGF6VbRX6nxDFO7a1+i4EYqF2MBg2mCjXGqUY=;
        b=mXmJncc70mqqVLjBF4MsXuu8VQdFdZhzzQNv9TsoaTLTEOtS3cJtzqTiHTIxVBnvU2
         VypJZk7yPuJV7HAno15XSbBnXCc8HV5rpJAqG3IbXaX5x7KEbjOGWIy1DyVkrG3LxaPk
         jvE0VT21ANJ3rW3N2gOjmTbKj6rPgrhIj7/dy59SzsD5FkineJa3h8ZCXOTMp/8kWINP
         W/kyxi+YF5MR/sT1KdwKSJ3mCfFN6Flw57abeMEJFzUHAUEd4JPPJxrv63p/caCl6dnD
         sKI07tdX3+ykmxSwiNyKk1uyAmByrfSB0P9Z8oYGUzSNzudUvQc0iT3VpRF6isQn0ta+
         xKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700804; x=1780305604;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqRrMUWGF6VbRX6nxDFO7a1+i4EYqF2MBg2mCjXGqUY=;
        b=seYQ1wWe9d84LwtRtfqgGQu6Z2DVsYiLqyozaPR9fANRpUlQQMIfEyy/qf02lNiqs8
         hQ3tw+Flr8ZPav+Y7/8tLlRW3BeJaAA7e8ihb6Badh+A0uI4GxZi5KLpl/9/wCOIh+lI
         D6vHG4tuR++2Wkge0uJJ32kLOl18TG2jUkTaIvL9OLVujRD03NHRhJqK0PD89aaTwRRs
         PpkpmPnGu4dXruLzZpJTGMQ6p92R1XGtJfi77FANZ4rVlzS+4n60m567d2ElbYA8Mj0d
         PT/A1RFiGNs+D96XNbmSh8YD1kMZnCrYAYYYmvlrxvyJUY81xwvaI6+ECVVG4d68o/iV
         H2Pw==
X-Forwarded-Encrypted: i=1; AFNElJ+htV0PmLLyri7zOVZMavWu2drVfWVE5vsErwKf45CVeA9EJRlbjuIDXKaTXIzDr1S/KzUlX2bZ4LPyKgBAs4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAr3jsm/2eOCYwCulM5TGZGBoPDHb40/O0TtyoEyC3qvA85g7k
	PSqPyeAAQGaXaYXdDDmf/l1kmM+3W+Noq32OIlS93WLw19tWiBcDCG+CcufYcXpj/snRz34yhKX
	4UA==
X-Received: from pjbmd22.prod.google.com ([2002:a17:90b:23d6:b0:369:2603:1a94])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:544f:b0:36a:b560:5c61
 with SMTP id 98e67ed59e1d1-36ab560606bmr6177499a91.7.1779700804160; Mon, 25
 May 2026 02:20:04 -0700 (PDT)
Date: Mon, 25 May 2026 09:19:59 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525092002.3762888-1-wakel@google.com>
Subject: [PATCH 0/3] selftests/futex: Migrate wait functional tests to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

This series refactors the wait-related futex functional tests (futex_wait,
futex_wait_private_mapped_file, and futex_wait_uninitialized_heap) to
exclusively use the kselftest_harness.h framework.

This eliminates mixed usage of legacy ksft_* APIs and high-level harness
asserts, preventing crashes on older kernels, and ensures proper thread
joining.

Patch 1 migrates futex_wait.
Patch 2 migrates futex_wait_private_mapped_file.
Patch 3 migrates futex_wait_uninitialized_heap.

Wake Liu (3):
  selftests/futex: Migrate futex_wait to harness
  selftests/futex: Migrate futex_wait_private_mapped_file to harness
  selftests/futex: Migrate futex_wait_uninitialized_heap to harness

 .../selftests/futex/functional/futex_wait.c   | 125 +++++++++++-------
 .../futex_wait_private_mapped_file.c          |  26 ++--
 .../futex_wait_uninitialized_heap.c           |  22 +--
 3 files changed, 100 insertions(+), 73 deletions(-)

-- 
2.54.0.746.g67dd491aae-goog

