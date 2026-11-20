Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184493;
	b=HrIUMNSdNolJKNKpNv7/3w9Za5ONmvBAFSV3essAy4nWBr0XnwgHBz6Dzzdwq3NcW6Ru
	 tqkT+YmhdU+F0qKN6XD4yvv1mucKEVyvoclLzjdqwfl2XuqHGz8U9eZpNXvJidg03ygM/
	 5VWZjMoiDccJEY4P5nWAMMiWdXNzzPq4gT+NuuAvCjWMGpH0dnEbKJHDV3IT3VxnDJuXh
	 7GUrzNS6jQV9WJkC8wLcfdJRTOWUjykCHVA5nv5LzIJ5pUrp7xlttxjMR9PaYdCkNitka
	 99N7AMEOdFB3SavF+RnUZM/uQkVGmDrLUoggNxojZD0qMZTcoEHKs1jRwL8IyEPWRaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8kbIPnTNVoYxnzuCSc7WD/8P36oFIhxLoZp7Il+xHts=;
	b=P2n3AcZVEEcPHFpNfpdHNglHwsqwVLiYWJq26uMi3bAPLxQwKBSWqEKBO5TZsMrUbN7T
	 KCcrlR4SCErfrijQdzEt+EK5LZZlYeHbda+XtB3x/k7DwM//dY1T7k06/MEjseh47dCVy
	 5fVRrUfCpJRVgkZP3i2h0cqHo4eY1mLSb3NB1tHcqa54T30GH3rU2oete+MTZyvBaXbDG
	 l7BKULuZmOqst0esguH+h48l93W86AN+C5WqUtiC/9GipMAk5N56L4Ssmdy7i4NFiUAJm
	 Slhfi+FbHMRLC0Wi+v/2KyCsmlQJ3fhxVmUVy5dljxo6y06eii4N2hinKUsWbXUm6CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=YCXylLXu;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2351E606A320
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 14:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2351E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=YCXylLXu
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04e3bf46dso3953115ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795184491; x=1795789291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kbIPnTNVoYxnzuCSc7WD/8P36oFIhxLoZp7Il+xHts=;
        b=YCXylLXuGacjr7o0Nj79F2yQRaIici/FHZRxISZWCv/UwhQz2VuGPEp1KArPhA1hzC
         EtNjTpC9GEeLrjlReZnG+jF9Icg+UPOaqACbrkcaOZuXDGeCEhUWhKp1ohWL2ccBEHJ9
         XmWkwouL02hOYTa3Nc3O+8e7FD1AW/JRqthUP+LSlUoDcsJJXio9MT7lg1FnQ9pCuKpx
         dW57n7UoS7zUblmhogpl4Lb0FOOdUV9zfK4RbnsaxRiz53NlVsLaRyOyPymHNlHHWq0+
         rPyCtQJG+9ZEXuKX0pOcrxHCs2XVKHzJBoEE42DWQlZctaIM/7Pt8uBGW+Spp/TTvK4e
         +phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184491; x=1795789291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kbIPnTNVoYxnzuCSc7WD/8P36oFIhxLoZp7Il+xHts=;
        b=2PxRENubwV91uiC9b7A4xPXnsZt/rl9c/zA4J6o8qe7yywOXzuzYiIfLar7xZz6vJW
         Xmqr/XFA0Mle7IQoxfiXIItsXi8ubKtHhchvhqpNipfsBBI9cATrkrAU0TsQ0UmEfG9c
         WgJ0oI8n59040G+DUrheDniESGroXNBG2Ms6+2AYLMEAeWs0U/6XAwOKiZW62HjJMHxJ
         zz2hiJbEn5PAqga/k310YkBVaMhbg+xL7hfnPY5zTupQytJgF2GBehhTDI6NzOn6+Fqb
         dk8lE5dSr0L5zj4Da5+xaFs8xT8GZuWGJnllGl/Zb+QEezJqXTXZAIGRezeROuGbWFy5
         Xfrw==
X-Forwarded-Encrypted: i=1; AL+hErFwHUV27si0ip+5H8J8ki7CHdUMDv4ka4RTgAMCab3p/TCArMX5V6l4GbFB6t6Ct5EzR960i43kKOcfTKVdcWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FVY6jSMnwo5tKn1RDH89kFjCWzIu2asB2BcWVN1ZA1FyEKywg
	2EsrXxkQjuAyFCenVdD7OXK0tUkhkJd1Oa3xqmXi9M+cy3cKoRoEJHh3L9uPWnvRYyk=
X-Gm-Gg: AZFdTZdl2xD02F02jwnpN/7OQ5OPu4y0SE478Wy7ZRV2hR4I4WqRKOC3f7wVsqMUELl
	ERCVoYLt0Iz/KSVj4lfojtrzvffhxrxYMrwzCg46lrP3z0EL7IYFhXjTBf0dtQrIVCgHZ6xPP1S
	4uA8WgzIxBuyYw1PPkf+8RceRFE8vYDfgxz0MEt4qWPBF8V8VNeRCMT/IqzAWbw3HM3VmmjWTJV
	kD+GJgOa+ow3gLzWcAWdJCMpLoqmdMiZGKVWhySKZnyaDhMwEl4RKS8yMu6yaiLm8FO7ibVcjTl
	2qhkH8idE1lTXrlHbfZv3TSW1qljUffsoJrEL0VswC46byU+0AAmTteV2WIJ8KSBJEXtzTmXYOt
	g8XmJ7n3cj3wx7FI4S7myNdgG8Rk1MPwcGcDalg6GSZUdZSXUKCNhb89SnzcmzWCD3zlhablZWT
	Y+AMAPA0DI1Ya8XRaAY2WNEa8TaDIK3+QScTBsOHG4N7tozSVMC4YC+VdNrMd61jcsRbP2auTLd
	J+yP2ZpsUHSpxR7McsVIMkTnbvafO0dTBCaiUp1CLYz/j7GMzNbzQAcRj66H93M+aE31nWhuR4i
	SmCpEyco3kOdMCJ1nIbGMG6QnFiuF+zrcpyZ
X-Received: by 2002:a17:90b:442c:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3b41c7d17d9mr3258685a91.3.1795184491524;
        Fri, 20 Nov 2026 06:21:31 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm4622229a91.6.2026.11.20.06.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:21:31 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>
Subject: [RFC PATCH 0/1] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
Date: Fri, 20 Nov 2026 21:21:15 +0700
Message-ID: <20261120142116.1630010-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 blocks io_uring as suggested in the v1 review of the base
series. AIO is rejected the same way, and readv() and writev() keep
working.

The simpler alternative, read_iter/write_iter callbacks that just
return -EIO, would also break readv() and single-iovec writev(), which
work today as well, e.g. a readv() of the 10-byte response header and
the body into separate buffers.

This series requires "[PATCH v2 0/2] tpm: Track the response read
position internally":
https://lore.kernel.org/all/20261120121614.978396-1-rmustafin@cloudlinux.com/

On its own, patch 1 closes only the io_uring trace of the base series;
the read()/write() race trace stays. It also opens a new path: the new
->read_iter() lets vfs_iter_read() callers such as Coda reach
tpm_common_read() with their own offset. Today these calls fail,
because the TPM files have no ->read_iter(); without the base series
that offset would index data_buffer again.

Tested in a QEMU guest with swtpm and KASAN: the tpm2 selftests pass
with both series applied.
Claude Opus 5.5 was used in preparing this series.

Rustam Mustafin (1):
  tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0

 drivers/char/tpm/tpm-dev-common.c        | 72 ++++++++++++++++++++++++
 drivers/char/tpm/tpm-dev.c               |  4 ++
 drivers/char/tpm/tpm-dev.h               |  4 ++
 drivers/char/tpm/tpmrm-dev.c             |  4 ++
 tools/testing/selftests/tpm2/tpm_uring.c | 14 ++---
 5 files changed, 91 insertions(+), 7 deletions(-)


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
prerequisite-patch-id: 929c8a56f28a166a5961816bde23cb25204ac74a
prerequisite-patch-id: 624623d00390085ca69fae7309aee60aa27b163e
-- 
2.52.0

