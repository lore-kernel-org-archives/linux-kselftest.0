Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709081;
	b=PBYI9YUzUSpYsjEhoawuA2NOr+Z6GMGyVrgaDGtgXghyxlZLk3SLgwiWoJb9B5I7gQWI
	 UgX8QPByPxvqEDrJ6EN2CNUduVsR3VRgfegY5MKDudD5e4LnjwSK2IGP1xgDYWt/MreG2
	 YwZ5WktEHwdUWSGBX/BINo1kNziC6LPJrozb19NA+PeCG8LCt/+Uc5gCOUWXfuVWqHSM5
	 KoNI6EoiiJtPAxPo9XlLgSA6+TaKBs+h2vexnm9AVqHVo0VXdRbWFOrl5vC6m5FCtCs9i
	 axZLDJM2jcgR0+dh0sfQF4DactrkMTYKjmt9ISvNQqnXckJL7WX1lTxE/IbjVj0Fd9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMk2f/fqCAvSxJVDBmT7g9JYmbYmFWnKJP7u8qwul4w=;
	b=mrFYVZL9hcTdiNwGMNECX9NhQkIBTUIridE3z6lbja18DROl+gDb4uxSYuv2h6OC83cc
	 e1ecvFs0JOzUwBH0HBs2ktZ8ogjRWfs1oQZ/1rAD73rFnpPE2tgx5Ll32mvaDaegCe70H
	 CFsYG8SqNTZoDgdNvEiUhgHaBL6DGBNpdeWs1Ti8r+rpnN83ly6g3fWKBvYb9tZNYpIfA
	 XNqFFmrxuGB4TjXJ9Fp/MhWFUF5S7Hg+V3kUzjDvfgYMD5jfXp3PNJteWyJQgRCRYkWuD
	 qnB2buNyrRzwjEeRj8JnLQBzyKgLfxfOOXq9kQEQS8vI7lMm808luAouRefBkpsKuew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lknqSoyM;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C360A2608
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 976C360A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lknqSoyM
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so133457a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709080; x=1793313880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMk2f/fqCAvSxJVDBmT7g9JYmbYmFWnKJP7u8qwul4w=;
        b=lknqSoyMqx7M5JzkCB0hI//vEdyeFjOV/snJIk7rjc22ubicY9wEfQPg4UxeobKwNk
         17DJY29vRyF4sxAEDtcnN4xiOZUToZTaNmc+FmUPBNFPCwU+Ru4U75gkQdneRkd5tT4P
         /7iDRPnXc8VWTsWI3JlgwPm+nkjWP4FPwcRLjXZj4Vy+thDsyk5P34mln8H/b0xOG3r7
         2VJ2owrmo+EEft3dKUxx6Z0EDBQHaEyR7vC2gv/USn7wIcZmmNC0tHdYbmpuTBPkkaDx
         DIJMg1c19qBNK+rkawAOu3/MIeqgpQFPqa2xctX1EywvDrdHPNThXztui8qHSQFUz5Jl
         M3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709080; x=1793313880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMk2f/fqCAvSxJVDBmT7g9JYmbYmFWnKJP7u8qwul4w=;
        b=2aKkd9K9dkE/dLyO2i/axKT7m4eqcQXA6c2E69eTH9jSN4cQW22nZc/i/ITQ+EBOSw
         FUYjHHwzMXfMbTuuS8OSPa96ZLUZl4bz/TlzwCEXbJgywHKtqwWVA/AXv1tSZB7xHoom
         BZyVVsBB/TVuzCfv/7OnsIm4vUVwx3BYw9z6NED72vw3gNEt9NMut7UMiPmelQGv2tu2
         Sbe8Mt27CjJW47TKXEobuFNohVDoCgSO3tf9+A/NRtm5dyQXqu2+e1Wlxq6qxDTKiOw0
         pNiezAjB6gO9GbVmqJDe5qjpb84QoeS/hz8JMI8DeD2AJwl8dvM3zcy27iqvScl3H+iJ
         j/uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkNu0raP6HFfJAdbzfl2LZB+ogv/vHMHNvS9yTqQNvfoaJRLNq+2xJt3vORP5/MWHoWMB+T7kSAnVzfDVdkXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXKav3gcQWYoZMcQa+xTdrkkn1XoNjhUQlSTTZ6IOLkNz2ssd4
	7T0e1tiFoUzbRaGK8qGKeP2OTmtaN9LcdxMJoewRlii84fZeiS/OSw7c
X-Gm-Gg: AYBFou0wPsSNqIjYQgcWRGN5wPpfOqPxnPWPXzivJNpH1q5s8kWkQMM4h5uaxMLe+ku
	KRQvEsGyvG1L915m/SX9lPfhK4GiUVNfRQ09diiNzjKMiI4f2vHpMrPHr7GjxUZJ3JuDSPjNXoB
	hUPDOw1qpsergvAtEhWcw7Iu2Fo3FSsnFogiNH4WKW7XWLkZvt2zsEBu/f5E4Ef0OZr2HNiX6f9
	wJ6hzKcu/HmeMa09u0PDT7JP0qHS45d0SgrolFfp3VQcbbdz6bsYXyNnUMAp4+b+zAON36zt3kB
	K0FJUytyZOuD9PtYIjIzcSjg27CRnL/Dx/Bt84axLE7/DG06mqmW3afjXnTwru8DQ6WaHHnKxvk
	yzgpJnYtuGdavgQIfnRUts46TD0L6HdjnhS8vRCfDSXltb3+X6ueQ8C1l0DG0h4h2dsHg0+7nCZ
	A4aQEBg45FGzRmmMFTEPbyXQYAH38jWgDZ3rUmHjymFQbI27sjXI9WM/nd2hVxCR35q1tUuQgIv
	1UA6189qER4F4xIEEQj3NAADCmT1qfJ2IFbAfV43/o3W8UeW2bFyw==
X-Received: by 2002:a05:6a21:7812:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e3766f2f79mr215409637.68.1792709080029;
        Thu, 22 Oct 2026 15:44:40 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:39 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
To: Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kir Kolyshkin <kolyshkin@gmail.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] checkpatch: don't warn about BUG() in userspace code
Date: Thu, 22 Oct 2026 15:44:22 -0700
Message-ID: <20261022224426.2756960-4-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022224426.2756960-1-kolyshkin@gmail.com>
References: <20261022224426.2756960-1-kolyshkin@gmail.com>
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

The AVOID_BUG check says "Do not crash the kernel unless it is absolutely
unavoidable". This makes no sense for userspace code under tools/, where
BUG() and BUG_ON() are assert-like helpers provided by the kernel API
shims (e.g. in tools/testing/radix-tree), and crashing a test program on
an unexpected condition is fine.

Use is_userspace() to skip the check for such files.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 scripts/checkpatch.pl | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a97d5748878b..be0e0493d4a2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4924,8 +4924,9 @@ sub process {
 			}
 		}
 
-# do not use BUG() or variants
-		if ($line =~ /\b(?!AA_|BUILD_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
+# do not use BUG() or variants (does not apply to userspace)
+		if (!is_userspace($realfile) &&
+		    $line =~ /\b(?!AA_|BUILD_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
 			my $msg_level = \&WARN;
 			$msg_level = \&CHK if ($file);
 			&{$msg_level}("AVOID_BUG",
-- 
2.56.0

