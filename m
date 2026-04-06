Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1F32779D
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 04:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775449535; cv=none; b=NdFZaXjglUG+5ncTtzQyU9EJMBNi/OkYSAJ0vTeiMhv7wZKMdKSwMMmFy7/IDJ7hjBTmQZHiaJsYp9BoX6pTrc0MV+PZ69t4P8wyqfOf7HMPLy7OKCcPEy2LiryTImcTssEaQ8neS1OC47/j3PsX+pwgq3YHhIEN6017nzRp3OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775449535; c=relaxed/simple;
	bh=B7ofdFU5/Qy4lPbjF538KUTGBJ46Nu05u1pF0sMbD88=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ul62W8VUoQxW+WSNJt5CU8hegH/YrIedR6yq6gKRj9/DH2N1SYltM8/VpSOdWKaanyA0MQvBR1lDNGQ2RYsBb87UInAl79HEyoLBKY/YMp1iJRmZ5W93kmXeATRP0okj15JRJ2Ha9kKU/fBnELKWJZ7PFXHys+4oX0zQ3LPHAkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FndBHQzf; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FndBHQzf"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-79853c0f5b9so58608647b3.0
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 21:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1775449533; x=1776054333; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFnOSG3cnYhHQlH8ga8KT9MBbSlP+Iab17pKo/eMRDc=;
        b=FndBHQzfHsshdKtdD+n+FYVEFG0o7KPjAMLd71cqf2ve9gYQ8Y6PuG0TtZz5vfAF7Y
         lYRNbtVU67VBNWcPAl7+MEHXOx2ftwylrmASXz7J0tEyvrs4a6iBXIgZtmpuTK1NSLS6
         nMj9hMukXdKei4oEYTDxeuxnO8qr3K9GzXDz9X7os8agswhh5yGyua9z+JBbZ3YdVoiP
         5VKS81xH2rGKgo0bHnnzIIrPu9SCnp73uy2dn5KPuNQ6zEGHLdtvwvmaoFDdz9Qxnw7L
         jFhCcmvHs9rZCUOrumwknophS17qgG+bfjCNSd+g2YLbaMmIbCgo3741ua4GUBWpD0iK
         ftjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775449533; x=1776054333;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFnOSG3cnYhHQlH8ga8KT9MBbSlP+Iab17pKo/eMRDc=;
        b=AgsaetrWf7SQgEXDGrDeS6+IQ6DvL2nxRvXRiu2Sff4mBohKahpaRt1uUgOaEh10Ic
         frMxg8qQwz+6R2TGDqhCettvLnc+LC+FglYin5ecR67B3o+kQX16Jkg3SBVAbOcfAuf5
         54j6vnbMu8GpZ68NZDXrDGPPmqRAxqjeFIgph4QVBfpd0M9z2Yg/DUnP1WDwpMfXoZ7y
         3qDu4ZTcBFCpPj/CUFu/6ul+Nuxvfjx5NuiC9ENC5lrtuw5Ir9pfvwN8H/eiuuWJ3/xh
         g7qJU6jR3Kogic7AUXaiTtEIJ9CsvwLVb5hWLjwx+9wFjKZl4jsgHCT1j0eLl3Ks/SGe
         FAAA==
X-Forwarded-Encrypted: i=1; AJvYcCUg9SLYbNY4tON14L3Aqu4HSQWdU4Nijq4QNpRUZ2q3pvIXFrOoJ08i5gHodxL4+PZG2IKVznrk6DKt+xZdbFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWip9a9HhqlrxZ7482qZeGi4iSjI937FIQlpW8ScG/Ez5eZ+/
	OfJtAKgpOS0zI6n/OJi2jmeghLfK2lcHIZlwx3Vprzr9dxxfgJP8pLUDF9kaV02TGOZ1jiOzr21
	ytP/Dq5zUpVj+iXqykDICZGBc2UVowlbsbAIA
X-Gm-Gg: AeBDievvFdqpqkyWK3pGH76DVvcC3Uh7Ggh2yUe1/Kb09ZniG7P7HvclRkQOLPRLkxF
	lKBBVRUOcCGwAuElDAeobPPc51+tblqtbAJThePom2DKZ56YcBoRjcfXSNSmgNHdCunWbULAmUV
	mO3gPMC82uET/iunmqIkZrsbCFrKLvzbLv8Eo1+DRrkQ2apyxSD+O/83pMa1gJrgXEddOFzjMrt
	yyiYKzfeORFTd/hREGvxck+EkHCwT+WomULtPgVQNBzp9P4Au1TL4yYIdKQKYYfSuupJiQRwf+6
	wOzxvb+ouLHHVdmdeBf0tF0RtyHJ9rDP8RmM1wIWIv1bnfjlAfBYAJKWmxartYp2YJkVeiohkf+
	0xdkzkAuKbKDUilYYR+jfzfGPlEVxb3358naj1nz3fTel3VwOrmYVfew=
X-Received: by 2002:a05:690c:d91:b0:7a3:e167:14f3 with SMTP id 00721157ae682-7a4d3dc6489mr118980747b3.17.1775449533048;
        Sun, 05 Apr 2026 21:25:33 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7a3703113ecsm8745177b3.14.2026.04.05.21.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:25:33 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 7106C34057B;
	Sun,  5 Apr 2026 22:25:31 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 51BC5E54F2C; Sun,  5 Apr 2026 22:25:31 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH v2 0/2] ublk: fix infinite loop in ublk server teardown
Date: Sun, 05 Apr 2026 22:25:29 -0600
Message-Id: <20260405-cancel-v2-0-02d711e643c2@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALk102kC/2WMyw6CMBBFf4XM2po+oFFX/Idh0ZYBJtGWtNpoS
 P/dwtblubnnbJAwEia4NRtEzJQo+Ary1IBbjJ+R0VgZJJeat1wxZ7zDB7NWGyGvslOtg3peI07
 0OUL3ofJC6RXi9+hmsa9/iSwYZxeNndFWjcpM/fqOuGtmxrMLTxhKKT/pkSuiogAAAA==
X-Change-ID: 20260403-cancel-bb6a1292534c
To: Ming Lei <ming.lei@redhat.com>, 
 "zhang, the-essence-of-life" <zhangweize9@gmail.com>, 
 Caleb Sander Mateos <csander@purestorage.com>, Jens Axboe <axboe@kernel.dk>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Fix an infinite loop in ublk server teardown which can arise when a ublk
server dies while recovering a device. Also add a test which
demonstrates the problem and verifies the fix.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v2:
- Add support for batched fetch in pre_fetch_io (Ming Lei)
- Link to v1: https://lore.kernel.org/r/20260403-cancel-v1-0-86e5a6b3d3af@purestorage.com

---
Uday Shankar (2):
      ublk: reset per-IO canceled flag on each fetch
      selftests: ublk: test that teardown after incomplete recovery completes

 drivers/block/ublk_drv.c                        | 21 ++++++----
 tools/testing/selftests/ublk/Makefile           |  1 +
 tools/testing/selftests/ublk/fault_inject.c     | 52 +++++++++++++++++++++++--
 tools/testing/selftests/ublk/kublk.c            |  7 ++++
 tools/testing/selftests/ublk/kublk.h            |  3 ++
 tools/testing/selftests/ublk/test_generic_17.sh | 35 +++++++++++++++++
 6 files changed, 108 insertions(+), 11 deletions(-)
---
base-commit: cdd71b7feb3674d14c5edd9c133242ddf9a363f2
change-id: 20260403-cancel-bb6a1292534c

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

