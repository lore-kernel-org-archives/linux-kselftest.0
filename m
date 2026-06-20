Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30517175A7C
	for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781974825; cv=none; b=EfYaBMgOHiL+lPQKJW+C5Tdh8C5EbXHIiAiA9esV586libhR3TYcEEF/lcHvFlm+Bg3K8BgMmRXGiwaG1PCHSOl5xoj5wfjMmJtV8TILmG6JN+SU5nvAIUFFyO6TiqU+r9YO0PlRQH2DxAI51YGwkvPziveYsSUCVOmZM6rKbt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781974825; c=relaxed/simple;
	bh=I02bDcCrDGBiSTfhOIecaCFDQCkBb5q+NTBDTZKlMtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9YYluk/ACnZ75E4UYP1+M4eyVEFgm9YN38bl+xQZBLP3T22N+JAbYKg34npB6um10ICaVfXauLPmgTG7r7sUSZ2Do2Kjk5VpwmNwQ1fSwsflrE10716CeCdZrrXV4Brf2BUrGA6TinxSZAtDWSP5JE65nC0iKFYFV6yPCxXI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhCOPnhO; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhCOPnhO"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30beab3af9eso7544513eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781974823; x=1782579623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=791U2tBdJdcxd6h2V4/2ZsIhWrubyU//nAsR0sJTOO4=;
        b=qhCOPnhOnad/ByqYbfZBfZiFpAHy3SeIQFcNHf9LJzNzNBTdLKYCfyRA7Ey6e91g1t
         dQUY45pKp1m7p5IET/WbAksbHzhb6gGAPsgPO+FlJgW9HB/Ou6gPPLJcFf/Z0hEgL7qd
         FcbKtmcTN77x/OV7jZ34T9IFWDHUoP9AlliAX/635MXVSSpaEiQrxynLE5PyKaerzIxO
         6zdMsRqnivL/y7WED12CVbX7IU6TFVBn9IybqIk5omXJ9h28yvGy6dt6BnL03YqGEoL8
         XlLAnkRhp3Zl/0xQUHc8sR9T6Ks3O1OTWYBzG6PY9w5sr2ndRlCTPPCjU6d+GTSVuN8u
         aoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781974823; x=1782579623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=791U2tBdJdcxd6h2V4/2ZsIhWrubyU//nAsR0sJTOO4=;
        b=GY9+ZSzJJbM7G11N/nCtVDxgt4S/3lPXoJISKQGVK079qjPR95LJIcvBB6/DLy7r/3
         aLLmY2Kd+WjawvYmJloVPQASnue9ONAqnWXgtiovfwD2gvgm2F6RiyUqYKKSOzyPCyl5
         ojdYswUyoYvOYhMd7rzSGuPfX293t7UlELptz4DbZl2pXQ4Xn6u2YZPBoaI+FTcj8cFW
         4UjMdycgYwwW+jxSCyHGMAlRI5s98WQvSVl+YXcZwnFt6susl3jD47F89Kl/TGoHQ0kz
         B69xYTXHSlrCnD1UXm4zFXVzMY8cecDdcoOM/hmVjLZN0TPSuTJIfa69wyP9pFzxHl0c
         CpdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UWsN4IX2oCfRI8q8963PLF9TOpMoBkhiMG0NJEU0O0v3F3wt5dwLqs36Jr8wx7WRfICfrP6N/KICMFeTa6PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+t3ofQIVPmjCsPXDk3RqQcbe+/wxOB22ZjQT7US4Vr/46e1Jt
	wKV0p42qUgLj+SgUoAh/yYYEd+LtMMNdOnCyc15vf7SzCGwgaQPyYd1M
X-Gm-Gg: AfdE7cn/2w5cs1xpREXwKbEoOA0RO6aT+8tcmTxZBYWDcYi3z/KMa6ZJZe+Sv/J6uKL
	mge1mVs0Kf9FsJtlEAxORqKnIoOqvpxNO3BT8iZggMCeiDRa2+Z+4qLvxDAo/FHFkR+uGP90IbK
	puQnq72w70YZSSsHmQlqNrpl1XGo7e4XmZ7FQYqx0LZZsBJEpa6T5suNyY0Z6QinsCEFKCFLF0Y
	T/+sS5K2Ur9Q8jklAJTKCAMdD+c5AYthdzRTq7BVJiiZ88nQH5i2Edfa6AtZKUkPEgqTViEkGof
	U+efUMP/IklH3Hwl7dAyytcPiEGVkEdje4hSbESrU6/oPlFcThOyz0FHFg5Dbsfgi8K7nMP5rse
	ps+Y525t4yqwkNMorQ1tf/hvsyNn+nJslPIMRW/ovgOOWUZXQBaSlvXjSMxDC6vq5UtBlqCtLLQ
	jkEXGf1rc2JDs8WdayxntB3tGUclYPzvhw5hOEMAvQOke5qjQVqUTv9JnfaQ==
X-Received: by 2002:a05:7300:a949:b0:307:37a4:15dd with SMTP id 5a478bee46e88-30c07036b08mr5368848eec.26.1781974823196;
        Sat, 20 Jun 2026 10:00:23 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be7eeb7sm4139594eec.30.2026.06.20.10.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:00:22 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: "Starke, Daniel" <daniel.starke@siemens.com>,
	Xiang Mei <xmei5@asu.edu>,
	linux-serial@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH v3 0/2] tty: n_gsm: fix gsm_queue() UAF and add a base regression test
Date: Sat, 20 Jun 2026 09:56:15 -0700
Message-ID: <20260620165616.354233-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive worker walks gsm->dlci[] without gsm->mutex while a
concurrent GSMIOC_SETCONF -> gsm_cleanup_mux() frees the DLCIs, so the
control handlers can dereference a freed gsm_dlci. v1's NULL check only
narrowed the window; this series fixes the use-after-free itself by
pinning each DLCI the dispatch dereferences with its existing tty_port
reference (dlci_get/put), so the data path stays lock-free.

v3:
 - Drop the cmpxchg() in gsm_dlci_free(); the pin alone fixes the UAF (Greg).
 - Keep the addr bounds check at each call site, not in the helper (Daniel).
 - Correct the Fixes: tag to the refcount commit (Daniel).
 - Add the AI-assist tag to patch 1 and trim the comments (Daniel).

Verification (KASAN, panic_on_warn=1): a reproducer targeting the MSC
handler crashes the unpatched kernel and survives 200+ race rounds on
this series. The selftest passes on both the clean and patched kernel
(pass:3 fail:0 skip:0).

Weiming Shi (2):
  tty: n_gsm: fix use-after-free in gsm_queue() control frame dispatch
  selftests: tty: add base regression test for n_gsm line discipline

 drivers/tty/n_gsm.c                          |  73 +++-
 tools/testing/selftests/tty/.gitignore       |   1 +
 tools/testing/selftests/tty/Makefile         |   2 +-
 tools/testing/selftests/tty/config           |   1 +
 tools/testing/selftests/tty/tty_n_gsm_test.c | 344 +++++++++++++++++++
 5 files changed, 414 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/tty/tty_n_gsm_test.c

-- 
2.43.0

