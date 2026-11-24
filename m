Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530280;
	b=JY86GH/kYwgnfNaod3fUrO9hCysILpyKTHVShVDibf+7l0DJ0YZoU7GXaEXVi0IM2AoU
	 pdj+MalGiFc0aPmcNLSWgM3tPACu0bwYN4GZ4tTizvcqWExbVC1MKTa5+s0VqhpUmXG2B
	 nVvwYnTLP3hHegsRy0Gb1Tx6dKxg8k81QGQ/nszYBCrik4DEk2+pu9rpxN28FlLAevvd5
	 MTGc6khWgxQe0glqklp+H31yH/fMtCBmHgMoIp7Z1KgwUYRlgUIJa8QiQy9Qh9+nJW3GK
	 JKVguGJz7ghbEGragfETuvSwOOV6mQ51qfpfdUrBS1P+XxwiykfnIjGan+ZLs403Gbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zeYR8ZpHeq1pZR+dWFeLvQVug9RPwZ0JSTo3dxUe7oU=;
	b=Y+dhrDRshTqR0AGAMZh2ryq5lArOguCzbQPcW1Op4Eatj3QuB3fWg+9/btqdelVszznC
	 cbJ0R15KKQLL0crrGFcF14Xi7JdrHu636DS6SKWTrJlOLqkZA62wGkKUS0rHCb1cJwmFm
	 m8F2Urpk6Pb7rpL/GC3pFM0wD2azQ+D8jsP3o8jrIVdXhXz5tno4A0zyf3eBVIJsxBFCb
	 6a2Ij2RgVNQefNAfPeSelLQTsqMn2mjsR0AH0WRy1aInWO3z9jLdvyOrxDOlizQFZRL9/
	 vxeya27lKm9VRpnwzcErpDjXxY60gMaOlKa64UT/hg5wYP6JsMGxWoR0n0K/I9j6ZEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LmHp0DqC;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA3E606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA3E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LmHp0DqC
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4c685c751so39308927b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 06:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795530279; x=1796135079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeYR8ZpHeq1pZR+dWFeLvQVug9RPwZ0JSTo3dxUe7oU=;
        b=LmHp0DqC0LRcWzknI/MLiNMBE5IdV/Pjma5UHmY8zzorIPCtV77jLK8KiLMmtFYLBa
         89+/Z7XRSKgZNZi/nP/r/BuULrWI8qfvyRnxdRp5fo5qaRng8tk6qVQPcotdmlglWm3+
         SgfB610d4aAbAILLqBTOthGY7bd8E116LiOqP0ypMvHkcA4PSjyQwVzkfxgVwwQOlkmS
         IMJ31/cqmFDQd21IDMxpIVV0OQeZwvyvEBPu2gBWJE+1QJz/3t6HvR4n9x0+SF5ymL8j
         Q6pKroRBs45PhDK1IuSE17NFWuehw3+EfRM6C28jlCVOSQ43D5Ntiimv0yoYBSJYQGbw
         XyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530279; x=1796135079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeYR8ZpHeq1pZR+dWFeLvQVug9RPwZ0JSTo3dxUe7oU=;
        b=TImMLCGZpU8/QfiORe0YLRs4ahvN034vXNExGGDHEMP0tyXHptHGNJxWClYwYeu/P+
         k8x0Oyz76WhJhRNLdzjKXy/1SwHJaGJ662rXNdQekzNlBJYMibpfrfPT5oOORjpPdnCq
         VHAa0Y+oihTtGNU5s+P2A/e3Ai4BjfTKgKvnt6OI4dNbhgTtophDWtfeL4Hq+4KhgP0R
         2yWn8OTwzBGOrb2FxlCPww5tXLOWVdh9jDWStpffe+5MHa9rUOOLFHA7ApmC1KtaynwR
         2an+OJVEvk4lEOGXD9EXH3MeFhAFptjnU4IGdXljfHn3GtNYSbQYvIhaQtdnJGofIk+0
         uEww==
X-Forwarded-Encrypted: i=1; AL+hErG8LHd1PZlXclEpCJLZV08HikADoFG/nKMDdCt65/qRdvBnHM2OkrZ6q1Yy1x2rGIbXhSPJs/B6s390CkHF4bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V/IykXumL003rZzi2ZldJA3gvqAxy8QB8bZEV+DsYssVLLwmS
	vbFcmRLbHi2D3B8vcA7euCm6hjd7unDN5JzpOSONp6t7iraEi8XpCCD1C1x1ldug2g0=
X-Gm-Gg: AZFdTZdNQpsZ2nDDDGn0TiYshaCUeN4wO1jc+9qELCwas97sEhZzHZmltvRBclvi61P
	RI/FFSIoJjyaC8ivUUKzgbn3kZq3JWV2Wm9Y7Wdc5DcoFUnoub32JxLHgk1Vv2PqRgR32uK5SAy
	JDKJj4R4C1XvwOSGqRFQ5XteQCpdHoA4Lh2oFBn39vrMSsEfvYPGrnEtDYv9eCF2yAwR5rQ3LBW
	4rBAOITBiupVO2JGM8uToAh4Pj7br80lY9Vunl/7mZrtlEZpTt7n+sHrXRn164T1ZnDZJZNKMMK
	WUarR+WSLKNPDu5Fepuddyq8dsm8xLSrP4N/DPQCd4lPuLttiHQGzqsncxA1ie5A3x+QjDwpifS
	uqfFLPd1DWgw2xVY/Rc1GjbiXMvuZto8iot2kr2UcnRHVZ4DJUHkmp3IJgTMlFGjBkpz+8venLD
	PoHGBGwKf1cwdSWGK7jQJeE36CqvvhAi4lbzDI1KvywzmkfXDhxRjW+pq/ckf9Xo4VR5f7epgTA
	9tvuNPKcHAxdChGprFR79MvasT+3s2QAW3DFICCR/BQRa/eSKkDizqjQDAi6qr7Z9zXW1itPAm3
	ejBKNTXELqBo9cTIYtD7na2jzRI/Yaf3Emu8wZw=
X-Received: by 2002:a05:690c:e004:20b0:8b5:6583:a09f with SMTP id 00721157ae682-8b56583a41dmr3892037b3.100.1795530278752;
        Tue, 24 Nov 2026 06:24:38 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033c2d4sm58062957b3.36.2026.11.24.06.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:38 -0800 (PST)
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
Subject: [PATCH v3 0/2] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
Date: Tue, 24 Nov 2026 21:24:30 +0700
Message-ID: <20261124142432.368943-1-rmustafin@cloudlinux.com>
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

io_uring passes its own file offset to the TPM character devices despite
nonseekable_open(), and its asynchronous requests do not fit the single
command and response per open file. Patch 1 rejects io_uring and AIO with
-EIO. Patch 2 adds the selftest and replaces the separate selftest
patch [1].

The series applies on top of "tpm: Track the response read position
internally" [2].

preadv2() and pwritev2() with RWF_SYNC, RWF_DSYNC, RWF_APPEND or
RWF_NOAPPEND now succeed and ignore the flag, instead of failing with
-EOPNOTSUPP.

Tested with swtpm in QEMU: the tpm2 selftests pass, and the new one fails
without patch 1.

Changes in v3:
- squash the selftest into this series, SPDX GPL-2.0-only (Jarkko)
- keep tpm_common_read_iter() and tpm_common_write_iter() non-static:
  like tpm_common_read() and tpm_common_write(), they are used in
  tpm-dev.c and tpmrm-dev.c (Jarkko)

Changes in v2:
- open the message with the use case, rewrap (Jarkko)
- drop the CONFIG_IO_URING guards (Jarkko)
- drop Suggested-by

[1] https://lore.kernel.org/all/20261123165638.2161305-1-rmustafin@cloudlinux.com/
[2] https://lore.kernel.org/all/20261120121614.978396-2-rmustafin@cloudlinux.com/
v2: https://lore.kernel.org/all/20261123173321.2363162-1-rmustafin@cloudlinux.com/
v1: https://lore.kernel.org/all/20261120142116.1630010-1-rmustafin@cloudlinux.com/

Rustam Mustafin (2):
  tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
  selftests: tpm2: test that io_uring reads are rejected

 drivers/char/tpm/tpm-dev-common.c          | 70 +++++++++++++++++++++
 drivers/char/tpm/tpm-dev.c                 |  2 +
 drivers/char/tpm/tpm-dev.h                 |  2 +
 drivers/char/tpm/tpmrm-dev.c               |  2 +
 tools/testing/selftests/tpm2/Makefile      |  2 +-
 tools/testing/selftests/tpm2/test_uring.sh | 15 +++++
 tools/testing/selftests/tpm2/tpm2_tests.py | 72 ++++++++++++++++++++++
 7 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/tpm2/test_uring.sh

-- 
2.52.0

