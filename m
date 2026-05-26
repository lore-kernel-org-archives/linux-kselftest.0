Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F974C14
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 01:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779757600; cv=none; b=G5Bys/spaeUEK5G8AI/NMaUThw3u5ByUMfQKXfWxhL2GB3rdHefduiHtmoDsIrCUir1E0KKwEwLk3OQLGNxfZGBHjjhvA17dHbQ0YmN5SOgn9WRZYHu3E8cMyeO4QAFlyrPaYAdIEz+BTSUPcchsr4MU0xgnPAM/FQoQYaH4EoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779757600; c=relaxed/simple;
	bh=+Q6AyHTbbA6BotFOIp7LMNACjp1Q4mc+fe3YNN9C0uo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pd5tbedJtgEjZfDHRBeQyRnBvx2AmJziQ+kRtSQLRfdW6XGEOnH4iXQ5qgDRZb4qnynJohoxf+El/n1Y4CNDi+new4uhMCb4xgUMIbQAOZEG+PMImi8sF5MbW67SOoGiaVxTx/DhTKduZJuaoM7v/69r2pOKaWmnrGbvtf6KJB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RHKjtGZ+; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RHKjtGZ+"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so11984169b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 18:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779757598; x=1780362398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7AhxNHmZ8ZDq5n1GgqGfXcCH4faAsdGBWYiv9j8tsA=;
        b=RHKjtGZ+64zjlx+bPwEjn/O1i3BYMQLhBteDa93RDDOIGeC3rbYDVbFPZmPxuHi9Zv
         Zc9sXrJXLKaQ37TcdPHk/fsUk8QjDuzMWADWVyglgv/tSjZAMZ3+M9UHoLPe8bAxB4gl
         QKlU7DlasaYve/C2n+Aq463Wr6RkLK6ip/2J41BAdt0qXwXB6diH+vQWYlC2o+LmHuHo
         oeYlB6XQHlY4clpwjaeyrNmuVN/4Xjlxy46a913nbFbqcE/B2LFOxhUGQH+nMXN7IyDG
         AI9m4QfwlKwOZ8FLd1cMyadSvr5dcFdfy4ZLrogMvzc4EPbWawnmR7H8WdKa6Zn1kBIq
         Fe7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779757598; x=1780362398;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w7AhxNHmZ8ZDq5n1GgqGfXcCH4faAsdGBWYiv9j8tsA=;
        b=PNYl8EBBJb6cg1C4V3Ud+ymYvFXS8l/eCVq7RtOdQOOaGlkV55ErRPEShwDO3HqXpB
         TT/3bf85KbB6JLgh1y/k7vYQjE5w/mWw042La3vul3W8ZkRGWFuf19T++PtmSXqpHrNk
         JlO+70JFC8RSJ9YSg3UgTY+x+h5aLH0H1J9f4xelOMmlnelxt0s1YXSeKJmonzDdYVIU
         wJn2qtcfm3R96rZ4vxSzofJkzhpeHcsIs/iu6FCviSNNmOy2nxJrZXqfznUJHloMxxMj
         zayzegbhLz9GaFFVGLUIt4qYNiILKrtGYxyS5nuJ6Hcw/sOagpcQfwosb1Kqt96kaQ9o
         CxnA==
X-Forwarded-Encrypted: i=1; AFNElJ+0G7twN6PoDn3djT02s/Zmjashbzc38rzAVu3GWMLgt6Co8qFu2nWjVGEiXt1awHFE/qNsCZuOvVo9o4BrD7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYtPXJLaeiIbt/5z2a5uK4i18NdJBD82xwTShJRiXENambC1vP
	7Iig3k/28U0OD2GeufnTz/u54pn79d1h5cjH9UaSoYUWJ04fYCm6mO0LlLnaIDHtR/0Am4ZFQvV
	DCQ==
X-Received: from pfbgh10.prod.google.com ([2002:a05:6a00:638a:b0:838:5125:b5e4])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:238b:b0:835:5aa3:2dab
 with SMTP id d2e1a72fcca58-8415f1236aemr16681764b3a.6.1779757597638; Mon, 25
 May 2026 18:06:37 -0700 (PDT)
Date: Tue, 26 May 2026 01:06:33 +0000
In-Reply-To: <20260525075748.3720995-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525075748.3720995-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526010635.23980-1-wakel@google.com>
Subject: [PATCH v2 0/2] selftests/futex: Migrate functional tests to harness
 and fix validations
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is v2 of the series to migrate futex functional tests to the harness.

Changes in v2:
- Move is_futex_waitv_supported() helper to a shared header (include/futex2=
test.h)
  to avoid duplication, as suggested by Andr=C3=A9 Almeida.
- Call is_futex_waitv_supported() check at the start of TEST(waitv) in
  futex_wait_timeout.c for consistency.

Original description:
This series refactors futex functional tests to use the kselftest_harness.h
framework, fixing inconsistencies on older kernels where some syscalls
are missing, and corrects the validation logic in waitv negative tests.

Wake Liu (2):
  selftests/futex: Migrate functional tests to harness
  selftests/futex: Correct validation logic in waitv

 .../futex/functional/futex_wait_timeout.c     | 104 ++++++--------
 .../futex/functional/futex_wait_wouldblock.c  |  33 ++---
 .../selftests/futex/functional/futex_waitv.c  | 135 ++++++++----------
 .../selftests/futex/include/futex2test.h      |  10 ++
 4 files changed, 132 insertions(+), 150 deletions(-)

--=20
2.54.0.746.g67dd491aae-goog

