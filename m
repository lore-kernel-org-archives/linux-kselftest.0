Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4868439CCFB
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 05:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093740; cv=none; b=QxscC3++w0w4X2pSUH/czS3v09oQ3BvYhkobKqfAoorwJnAJVD81/ob2nDqZ2bgC6Ik1FO50NxCu4P2YY+KU91eQsuRMeL3l08Elc1408djUFLln8vMv0YljVwG3K4mgZhVzI3nVtLCiFzL1dZ0jaqrBQb/4nzbmgCi7eowkYjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093740; c=relaxed/simple;
	bh=pJX/4lNrcag8H0C5X7KRzo+mZLWneQs3WuoJyZPrq/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VCXkBHW7jCp3uNX2Z6KReMTF5RUT+Gdc5o4ZB2NdC4EESMdyp6WQrhU00M3bgtnkJC5IMwMgfomjxAJh8hjD/3FPA856iL5IynnvfvmKq65tQN+4b6JbKwkiDKiduSEfgHFkCYjBFcNelQSeXYQPNh08ELQx30k7uzxjCsef534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=QiEaMwsi; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="QiEaMwsi"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D3C8F3F61A
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 05:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1784093735;
	bh=o7X0Xr58oM7rQRCx2gdCy8KQKCUZWoTYtzajiDu6fH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QiEaMwsiKbLZmGjYTLv63+of2NuSLJYdmTdw327OnZmp0ZnZKDAVXlvF2XYnVHvez
	 bL82zKGcre62LNJnyTrk5fgIDSPa0f8yO2FaPGXlWudXCY6ISj5TWELy1JxypgHcF/
	 nkrsgfbv+ThVPMcOI1rtei9YHHQlueg0gz7zROwHdR6fz8Y95PuDHX/WP/xLS2vqO2
	 LXw5vBnOIk2y0o9ame5Zu9uAdxhzdGHowqwAtRE6EBilenvBmG9MyMN5oTRxCBC1vu
	 X80ErDrmPUjQ3Q2GQxfTaFwSM64BwkNxuYyOfC6g52gB04nFnuGkUzuVkJBQ4/Yxmg
	 CujsrGOostOfmey8FebxCOEYXP/un0n12tnnSENv1KiGpR0kdJmuMGVY461PxXQpeb
	 zx6GSRMY/I8sIBPaAaYK3Gu0jODnEXogKSGConcZCvBbmLWCaOJdq/BzonYEumyRZ8
	 JynqM70ywFtNEp8KF8BfJplY44dE2Yc65rROZujTz+wuDM9WDs9sKtSaqv+fjXuE84
	 6Y0L812TXR3FAZUOu+JXPZz4II1k5ouRTNj4ROcELJdnbIJvsdqrROziebjONlQ8+U
	 dz2h1N3DRLQC4KPp9znGXc/I7vzFa6JhWhh/G9Iz36d/0OSyOPgkyTA7RBH22yhUDC
	 FF1aIfVDiCxjSRPvbcgL6ZTA=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso24654425ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 22:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093734; x=1784698534;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o7X0Xr58oM7rQRCx2gdCy8KQKCUZWoTYtzajiDu6fH8=;
        b=SrF8NGZUnX7sstREBP0a3A9Wuq4kH4WOyQo2b5k+xr4HbMvrqfCIo3R+4AmQpC1UY1
         BkVzJZvpTqE/qCazIzaVaUfVogrb0pW50eWykvUKdLB5urX0ChI9uvBIR+c8qLrRx30v
         txjW+6z3lbhzgAlPFYc6340dQFTuLJ3sknqO4nkUq9WFS7VomoZ1rif1u1orS95suodo
         8YREMYy/fp/Ko8/hjLDEhTGj0aFvMjUwMr/4clhwSC/VzJjil1viqABmgOV0p+NKHmFB
         wPW3gCXAOlClx4xDmtUhdYYOotwy5UNHYhubCsEonrjHtK/7LGdg/TH8Fa/6CbwUff9l
         IEtw==
X-Gm-Message-State: AOJu0YxGyxh48TNZ7DSQNgTbCLu/u+2axRa7KfBCjavJbsYnCpZqsGfG
	+xWbHVfqvK1CTm3LvQ7BDVfCM0tEkPpJOurQ0NprJ+PLbYa682AsEWkl68QGd8L9BTOPQuGR6//
	NPsEBItL9gKT9RWKb3sjniBgCRsz6g3TcDOLdNd6O0vSUTd5sZClvqeUVF82fz96Ykvpto3NfIn
	q/N+udcFnyDg==
X-Gm-Gg: AfdE7ckpAGO5IafOCH8xLfv6cqEayqQdmVch88MxOifBtxMi5L7Gz8IOS4knqQgNaLG
	aE6fCr3PTsPu+Sv7BXQNxn98FZCbHLKKnISpdziIGKylyl2BX/5huScMkyk0R+PwmrQUJkbx+DW
	Ya+yFy5ju+YQNTV2DzNoRgTC3zOkoY4+ym/OtvywoyGtJeBt2zOWr1KnJSsJTMnVC3G/+27mMB1
	J6XS/NK+aC9Nk77EGkrhbLTjkI6SBWG2FD/HhJYrt4IE3+yJY4xS2OhNreM0Q7yEraB6GU747Fr
	SrO5lda27IOnZT9foTmC1DjMeGObOyniVLqzUO8y6Q2SEaWwhcoykHt7EOAGk1jON5EnNuvVEDn
	/s366CkqOorx7175kLAQqZJ2gkECfhcrrc9DDNXGuEQup3kMsa1TQyHWo5FPtjVsCacVKRYkd5v
	01
X-Received: by 2002:a17:903:468f:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2ce9e9ad7c6mr169580565ad.18.1784093733869;
        Tue, 14 Jul 2026 22:35:33 -0700 (PDT)
X-Received: by 2002:a17:903:468f:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2ce9e9ad7c6mr169580385ad.18.1784093733497;
        Tue, 14 Jul 2026 22:35:33 -0700 (PDT)
Received: from kylee-ThinkPad-E16-Gen-1.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cebec91c92sm51358305ad.56.2026.07.14.22.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:35:32 -0700 (PDT)
From: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
To: kuan-ying.lee@canonical.com,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH] selftests/seccomp: Fix pointer type mismatch build error
Date: Wed, 15 Jul 2026 13:35:52 +0800
Message-ID: <20260715053559.28535-1-kuan-ying.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We hit the following build error while running the seccomp selftests in
our testing.

CC seccomp_bpf
seccomp_bpf.c: In function ‘UPROBE_setup’:
seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
5175 | offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
| ^
seccomp_bpf.c:5175:57: note: first expression has type ‘int (*)(void)’
5175 | offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
| ^~~~~~~~~~~~~~~~
seccomp_bpf.c:5175:76: note: second expression has type ‘int (__attribute__((nocf_check)) *)(void)’
5175 | offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
| ^~~~~~~~~~~~~

get_uprobe_offset() takes a 'const void *' argument, so cast both
operands to 'void *'.

Fixes: 9ffc7a635c35 ("selftests/seccomp: validate uprobe syscall passes through seccomp")
Signed-off-by: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 358b6c65e120..0622bc2acad4 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -5178,7 +5178,8 @@ FIXTURE_SETUP(UPROBE)
 		ASSERT_GE(bit, 0);
 	}
 
-	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
+	offset = get_uprobe_offset(variant->uretprobe ? (void *)probed_uretprobe
+						      : (void *)probed_uprobe);
 	ASSERT_GE(offset, 0);
 
 	if (variant->uretprobe)
-- 
2.43.0

