Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169464;
	b=3WaIjzHj300EGD6p9oZKzfBgISTg8z3hhoOrcyJWrhdK5ZuPVvVAd92oSd2RLUTjjua5
	 ZM1YucW4ASAcFg8LyIN4ENiVfo+nZhqQXm+Hkze7UzwkpZrjIktPaUwDh+TroEgiOWHJo
	 SjeYdnvJMGdYH+VDYMwC3ypD0mz9tHR8EZw8I2bzVv4IFrxbVxGSXtsTPUMdvm7lLQ2ys
	 nb25tzesnLqhxl5X6kwNWwf69QfmuAmWf7UWgbqIHXhidLju5iabFSoAwS3W5edh9vSLj
	 c2P2+NcQ1gmReUSWqNFuUzIZ4av0fVvdWOeYQg2Xy6WI3crAvCGgxBiFllLNQsN6Wtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=U6Ai3RX3XOfep+2NZPYc+asEVycV3qACLtEG8MfT9tU=;
	b=o7i0YaqDGow0+c09B8cC4bpV2wGxvYy9SRW4WNnBuytzAnYph/STlf9kSZLnH6OHdKd7
	 DV2dbXcyfqsO6h4keF19dNOZd00Z7wH58GxTLPKJcYEU9I4FEKFDQZdYFWa0UG1ubBS3Y
	 0ny/LMh5e6NXzQP12BM8ljJ82pCiO8Em9dPyLL0Ns+vbryHUxbgV6soH74faVAjzseBut
	 ymDcL6nDLfLZkmV4JnLG+XbNVe7H383NJ05n2u2rdNT/nOar5qdbkwJdlsn00kBVa1SyJ
	 D4v0NI+PNIn6Iljibasg3rOah1uBaTbZ3pt5l3G2AK0ONiLntgNgI9haDqv2k9Ey2Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHTLLd4f;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743406079D82
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 20:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743406079D82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHTLLd4f
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso2344485e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 12:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169462; x=1794774262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U6Ai3RX3XOfep+2NZPYc+asEVycV3qACLtEG8MfT9tU=;
        b=jHTLLd4fpz/icE7NfXAZClbnA8xkbQscrSmCRQpuELsK3h2USWg26Q3W6X8Vavja/L
         YLuhSHHIG97DX4Vku+lKQ2EJXlBPD/S7j+2GLvRFfD2GgzMkrv7scQDmx7PLk6QJ1GgM
         PWl/PkvzVNw4VyKwJyFRKazgq68h2GJlW7EhU+GrXvvPro56OQPXNhQqGpeX/40ymLxj
         7tR/YLUgNyo8tuk6Uk9aJHZSZmUdSOHYHEUPJLAjhJgoaJmYUBqB+4vV+axs4J55hgKr
         2hbYZSc1NAORavxZXXtqrACfeAFj/iDoiX+nZltzr1sjsdOsP5t3BHwzH8Yqt/vVBiRs
         Ej9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169462; x=1794774262;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U6Ai3RX3XOfep+2NZPYc+asEVycV3qACLtEG8MfT9tU=;
        b=fKiVluBxjWv91bqYKJLxK9tfUEqX1cDLYcBE/aa8M4Hl4ZR47gAiKjRpcxZimEBHy2
         OhynfUqD3AmRaWq68p3mrDHOAn7S3lzoem5BYGm+pvfBW4TltJ7YHBrsutFI1V5EDZ90
         DinkSjvJi1fuZi/kggoxEO9i3aeWcois1PzQ6BjVbO/pAVe3T+vUBxqSD717yCguGo/4
         venaV76UpUlFPji21fh7k8vPJ6BGsYWiduI7QV2WXpd//sz7pycyIZi8pAcBZjF3kkvt
         akSryOWysl+qeiqXXRUzVVm0JvETmoTD4dDw9sQkWwIWX6bLcMn/APOYoBaDaME1WniK
         wY7Q==
X-Forwarded-Encrypted: i=1; AL+hErGQBTAbyiFLnMRkvEjhSCLuCU7OBZ9kaudSTV5+vkTjAs+fZ6+1cv2Im4EMxdtpRoh1kbR/WSOxag7GnKw8qoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SNxGA4YSshR2FaMkwPADOs5g91LJBXaL6A5hsBKZDsh958hq+
	JlsDWp90hX3XHKjIGfqVtjI3RzZKjrfe2IhsDCAh66z5HhOfPazTclKB
X-Gm-Gg: AYBFou1yUmMDKOy2/tVSxncKyAT40lSiOtTAhIk53waXzLOTAdnn3IE9ZeEZrQGfR6R
	9s1j2vvNkgHPGrF2xXQBtnzh+xZj6tVqsOX6PvZjhCZvHpNQ7F8R9jKn91/u7UVQ1MEw8l/3RoQ
	HQ3yUZtossCyZNHO9dS/BysVhrtejGWO02x5xWqvSrpdp/UpUwx1Vrb5GwsKlsinIExf/GvEkr5
	w7hU3LNaeH1P3ocEAYa8y2qFf0+nMoIQ3vrElOF0t1mKbB4XDjIwzPVjUNnGCA/slgQFQdyCE4N
	oC4Nt5tBDgmvrm0tFpfqn8TGRRFmuEk0JPS3U6AS4vqw0k8epuWrhkbYhLaDHdo7tSIRjAEyGmb
	YYSpIqEw/nm96hkkswnt6q316V0nTfw+zqeN8I65nfPv5FtVo5V+EtlzXbXqONj9csWYJn9rH4g
	lP2Co1VJ7jnBeR58torr8nWtEEhaMoKynZZm3rXQ9wPKrDqAhklRVSD4a8ZlBwqrvK1N07gkAIO
	znXhK5tBhzA9TrqwZuqSOuCm/t9WtEcpbGWzwoF5NY+Sqr/V6vf5KtpAJwK/F7Gn2P3kN4DlzdW
	p7VLVpYAr/i2CfYRaUb/TrcIKxf4JNEYC3QAnu5YV5WKRUNwxx2gxQ==
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr38276815e9.35.1794169461719;
        Sun, 08 Nov 2026 12:24:21 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fc31sm5714139f8f.48.2026.11.08.12.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:21 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 0/4] landlock: Fix REFER in layered domains
Date: Sun, 08 Nov 2026 21:23:47 +0100
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWOwQ6DIAxAf8VwHqZFtrid9h+LB8CqTIUFnJkx/
 vtQb33Ny2tXFilYiuyRrSzQbKP1LoG4ZMx0yrXEbZ2YCRA3RCi5lnxQrh686XmghgJ33jUxLZc
 0N7UqtdEEWkqWGp+k2N/Rf1Unx69+k5n26G50Nk4+LMcDM+7eeQsKQBASMUdxL68ceeu8Mn0BA
 M92VHbIjR9ZtW3bH7NpTwjFAAAA
X-Change-ID: 20261108-b4-landlock-refer-nonfs-layer-fda8bcbe0b44
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

This patchset fixes a bug in Landlock layering,
reported by Dwi Siswanto in [1] and [2].  (Thanks!)

The bug
=======

When Landlock initializes layer masks for path walk based checks, it
unconditionally adds the LANDLOCK_ACCESS_FS_REFER access right to the
handled access rights.

This leads to a wrong layer composition, in cases where the following
layers are stacked:

1. A FS layer restricting REFER, but also allowing REFER in a rule
   (e.g., handle REFER, but allow REFER on /)
2. A non-FS layer (e.g., networking-only layer)

When these rulesets are enforced **individually**, there are REFER
operations that are allowed in both rulesets -- the ones that 1
allows.

When these rulesets are enforced **on top of each other**, the non-FS
layer starts enforcing REFER implicitly as well, and all REFER
operations are denied.

This patchset
=============

This patchset fixes the issue in three commits:

1) The fix, which should be backportable to older kernels
   and which is CC'd to stable@.
2) Regression selftests.
3) A more elegant fix for newer kernels,
   which is intentionally *not* CC'd to stable@,
   because it would break on older kernels.

   In newer kernels, we already add the "REFER" access right to the
   handled access rights when we merge the ruleset into the new
   domain, so there is no additional calculation to do for it.
4) A documentation update to clarify the situations where the *_REFER
   right is implicit.

Please let me know what you think!

–Günther

[1] https://github.com/landlock-lsm/go-landlock/issues/66
[2] https://github.com/landlock-lsm/linux/issues/67

---
Changes in v2:
- Rebase on master and resolve conflicts
- Fixed documentation as pointed out by Dwi Siswanto in
  https://lore.kernel.org/all/20261101125114.19009-1-me@dw1.io/
- Link to v1: https://patch.msgid.link/20261030102411.12985-1-gnoack3000@gmail.com

---
Günther Noack (4):
      landlock: Fix layer composition of LANDLOCK_ACCESS_FS_REFER
      selftests/landlock: Test that layering does not break refer
      landlock: Simplify landlock_get_fs_access_mask()
      landlock: Clarify implicit handling of LANDLOCK_ACCESS_FS_REFER

 include/uapi/linux/landlock.h              | 17 +++++++------
 security/landlock/access.h                 |  9 ++++---
 security/landlock/domain.h                 |  9 ++++---
 tools/testing/selftests/landlock/fs_test.c | 39 ++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 15 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261108-b4-landlock-refer-nonfs-layer-fda8bcbe0b44

Best regards,
--  
Günther Noack <gnoack3000@gmail.com>

