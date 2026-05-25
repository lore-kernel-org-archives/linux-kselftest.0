Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2763D5658
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 07:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695875; cv=none; b=o7PCJTu64f6So7/IC1X4jXCFLLTzu/NI9TwaQbvVOTuQy1Feo7PaOWf+tlPVd3EtHj0vWAqidnAS0DemOcNwYmTHmZI6jHVr3oon8TPCYfgzj5tGFLw5XFPZBq/2ANN8z5mSvr0HDEbFynjD6+3f0hVLzX4b/cDLaEkACufIvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695875; c=relaxed/simple;
	bh=tgubj2fWoIqtJgz2UyOD1IY66J/+Td2XFwpdKKonSM4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SyDh1Yng5IVSdtpI14CPjUj2j7+05bwmtOMn/OHo+6jsoC7oKa7U8F7ksKs/wQqrWwn5OjwL9K1zrLxh8rO9EhFWxQpnxwtt7wItTVcRfiHCsGk4z3NnW8sTbdLktO/DMDvg86YI2O8Y4TpwInIl/Wg66peWluDOoAruMud/oTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ONr5JJIu; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ONr5JJIu"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8353b042152so10936206b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779695874; x=1780300674; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ONOen26/rwXOwUCvKhwXx3c4xKxvzpwYANo8CLMZlYE=;
        b=ONr5JJIusE0CquJAbvxiMya50THs601DjBzQ4DBZ2Ej9yRxw8Vtqd5FTOlSycNC8wn
         ZX9IYkmTBW0NrHcW43Do9mtMpqtPKJPKEpLWhwl3PQlhw2ZbHg1wBJcHa1zOf0SzXWe/
         k/uZiqL2m+7YXVBHVmRjcRGEKfY9vSQQ413m/CSbmSv4VsUEzJe4SYh2Y6OAsFRXYAZz
         8GJUT0ct/uNNWHWZ9ZwHaytEFBMNc5Ql3rip/4UnOUs6hBUiSFEx1ZyIfK7Wc06deo1u
         Stt1D5+p/LR3cnHoKaqG+whkl8yn9xAvLufWaXAcxr//5z+p6K3Nlrs4w/uAuf+BlZUE
         +V1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695874; x=1780300674;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONOen26/rwXOwUCvKhwXx3c4xKxvzpwYANo8CLMZlYE=;
        b=X0UnkCt33yEEQCkWodrX6vsNcd0iPzQJe/W5N/yV9ZM1zJg2MngT0e9j0nLXkKTNqm
         GzrAGH/Iz7TNKds4iAEYZ6I6HV2uiYGuxIv0osV8qYROJmywkOx5OPWnCRKjtAkGCxOn
         OlOhPSWcULo9wPRX8ZIom1SeKH97FHjRRw6Dm4kRm2b+XpoBMPIg86cH65dcVDCKX0sd
         MWj3MhFqbBqO8q/vu09yLcQkx9R277fJZolNvMmpiLG4Q5Uu3OyvBj5AZYd4ubX6rjNR
         bM5bkYMw4M5GMDp1U9Vh8RVNGquhupZSkJyxW1u+BmwgjWSNNbD7bCqEMRWBvbZu4+SR
         N9jA==
X-Forwarded-Encrypted: i=1; AFNElJ91rVazO+xJ+2YFohmZQiVV0En0FI93war2w/2nzne2baqcZOQWCEv2GEQtUUWpD5tgJ2kjvN2b8HPf3PxXk2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXhpAT+PslnsfeeAFxk4pPfAj70RPbKRq6JEeFVvrWj2otYHpT
	qvjYfDqo/WhWM58gsnKYohkktXiz4KFiZ+B3Big6wXrnz15Zeb3r48tZLiffEn6j9wCa3hC4s+M
	DuQ==
X-Received: from pfbfx10.prod.google.com ([2002:a05:6a00:820a:b0:83c:61b2:176b])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:bd0b:b0:83e:b443:9651
 with SMTP id d2e1a72fcca58-8415f0f01cdmr13456240b3a.4.1779695873720; Mon, 25
 May 2026 00:57:53 -0700 (PDT)
Date: Mon, 25 May 2026 07:57:46 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525075748.3720995-1-wakel@google.com>
Subject: [PATCH 0/2] selftests/futex: Migrate functional tests to harness and
 fix validations
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	Edward Liaw <edliaw@google.com>, linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

This series refactors futex functional tests to use the kselftest_harness.h
framework, fixing inconsistencies on older kernels where some syscalls
are missing, and corrects the validation logic in waitv negative tests.

Patch 1 migrates wait_timeout, waitv, and wait_wouldblock to the harness.
Patch 2 corrects the validation logic in waitv negative tests.

Wake Liu (2):
  selftests/futex: Migrate functional tests to harness
  selftests/futex: Correct validation logic in waitv

 .../futex/functional/futex_wait_timeout.c     | 101 ++++++-------
 .../futex/functional/futex_wait_wouldblock.c  |  40 ++---
 .../selftests/futex/functional/futex_waitv.c  | 142 +++++++++---------
 3 files changed, 133 insertions(+), 150 deletions(-)

-- 
2.54.0.746.g67dd491aae-goog

