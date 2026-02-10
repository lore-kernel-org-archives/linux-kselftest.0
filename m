Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE47321428
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770729043; cv=none; b=p48tPUiigFCjDIHXdId59PjC0q2nQyoHi2jziYSIGuPWNjnbklk7hLgRMEI4AzxE3pBFViUvjOiQWef/LFc1RnO7pIh8w7xaQvENjLLkk0pOTwkEkeYNMW6xdeynHD++WQ4GZPSNrqUD3HYVkcmsCDRP2Kc1j97/NIVKq18TH1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770729043; c=relaxed/simple;
	bh=f05M7zKV2fcU0dWyXqgOAv9DwNG8MuhQQy725jkKzOs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NTWFZMW4eND+mh4LStZqlncfkdjoLQBfrNArByglX6V0t5MR80P3KM8OlRPfpw/RdvJ2bXfjZQ0qbqJMBZ0z/hz8KlsbrFRlgu2dDLd0nauZ28D0XTLtVbK6OuHWXPnFXhJp0bUydKx0oABTNeElpfLpxF8EyMqxKT88DiGaNyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gMNsfjpT; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gMNsfjpT"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so3490605b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 05:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770729042; x=1771333842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9ewPRZs8qcG6Pa4UShVQRu75Ce5Dkf9jkx+qJlthNoo=;
        b=gMNsfjpT7F7zskBuLwar9fnJPrg2HruJ6CA919u5JJyNzM8F2pOdQuQzJxuezL+pgD
         qzKoFWRk3nfjKrN+ZJw3AeJrDjxAa1o6OFAx7UwOjQwil4gIR0azqXgcaHY5bvKrv64l
         UX1TzlQRlnKOWOnJ9CE1TOc3fy0yhNX4L32EoZJcJOffPIJZPqA0QeEiE6ByhJqRuXML
         A1ZuS232SkTj3ct0N6N3fQoR9DXvBzwsKiQ16wA7dhwnrZnbE9GFvF55nwO1II6jDNeV
         YyRAyGO0JP4CYlSsKd1Y3FognK5yV7g/6j452hIO6AZ7GiKUscdDSzJR1YJ2gaSf2A8O
         MT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770729042; x=1771333842;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ewPRZs8qcG6Pa4UShVQRu75Ce5Dkf9jkx+qJlthNoo=;
        b=YPW6dUMjxCaSnwtr4i7Z+jkICV2IZ3m58ApfjCZbI1yWwI2TAP2R73YOnUsoOsaygz
         AH5dkY3LXCtLJboy4CQUFfd1UmrG9U2UO9BS05PL6RH6Nx6HyBiqSZh6VDmKVZP6cqqd
         kqWiBfFUkTHF3hRfOvuP7WZZSSuP5Yb/uSb6CtF0kWRhzDSsfiotz1DrsEA8wvhZ+PkK
         J/YosAYjBzW8/pavNPp2ZiBdsUp398TW8DMFMeGeRJcJ5MJ/ImE7RTDpT6SEEDjRoUZh
         em7C3nTNfOzpDsBNS8/T+4EdKlyhPBjxok9gWo71Auj69eBPnq6HDVtVgRWkkgYHyjGg
         dOAw==
X-Forwarded-Encrypted: i=1; AJvYcCXpfWOTvVe7qmO1SxDIVqwtOQXtjxovsADxMA+HMnjwstDkIZFwHBe+x+CsAkDCCfzQyLDiSaLgG/OT7tkg430=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtCxT86FuJaG3ZG5E2VGt6Tagj46Tu9J5zO96wWKUIf3+px8fi
	1Ycfyie/Wxl/do+IDgsQRpFpHtmI88NUa33BXBPfbDX5h8oSJh7V0KJUbkppXSFApUr8IGp63Vh
	5fe57ikQsmKuKlg==
X-Received: from pfbjw17.prod.google.com ([2002:a05:6a00:9291:b0:81f:84ba:9ee])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:b90b:b0:81e:f623:ba09 with SMTP id d2e1a72fcca58-82441609475mr11545607b3a.3.1770729041639;
 Tue, 10 Feb 2026 05:10:41 -0800 (PST)
Date: Tue, 10 Feb 2026 21:10:26 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260210131029.3851957-1-davidgow@google.com>
Subject: [PATCH] MAINTAINERS: Update email address for David Gow
From: David Gow <davidgow@google.com>
To: shuah@kernel.org, brendan.higgins@linux.dev, raemoar63@gmail.com, 
	David Gow <david@davidgow.net>
Cc: David Gow <davidgow@google.com>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update my email address for KUnit related things in MAINTAINERS (and add
an entry to .mailmap so nothing gets lost).

Signed-off-by: David Gow <davidgow@google.com>
---
 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index da4afd2b2415..b2376b713fc4 100644
--- a/.mailmap
+++ b/.mailmap
@@ -213,6 +213,7 @@ Daniel Thompson <danielt@kernel.org> <daniel.thompson@linaro.org>
 Danilo Krummrich <dakr@kernel.org> <dakr@redhat.com>
 David Brownell <david-b@pacbell.net>
 David Collins <quic_collinsd@quicinc.com> <collinsd@codeaurora.org>
+David Gow <david@davidgow.net> <davidgow@google.com>
 David Heidelberg <david@ixit.cz> <d.okias@gmail.com>
 David Hildenbrand <david@kernel.org> <david@redhat.com>
 David Rheinsberg <david@readahead.eu> <dh.herrmann@gmail.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index fcf39de76838..eb653a328338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13796,7 +13796,7 @@ F:	fs/smb/server/
 
 KERNEL UNIT TESTING FRAMEWORK (KUnit)
 M:	Brendan Higgins <brendan.higgins@linux.dev>
-M:	David Gow <davidgow@google.com>
+M:	David Gow <david@davidgow.net>
 R:	Rae Moar <raemoar63@gmail.com>
 L:	linux-kselftest@vger.kernel.org
 L:	kunit-dev@googlegroups.com
@@ -14607,7 +14607,7 @@ F:	drivers/misc/lis3lv02d/
 F:	drivers/platform/x86/hp/hp_accel.c
 
 LIST KUNIT TEST
-M:	David Gow <davidgow@google.com>
+M:	David Gow <david@davidgow.net>
 L:	linux-kselftest@vger.kernel.org
 L:	kunit-dev@googlegroups.com
 S:	Maintained
-- 
2.53.0.rc2.204.g2597b5adb4-goog

