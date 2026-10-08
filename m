Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A1B4C650A
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470759; cv=none; b=RYNvgCXO+ZpNf5yelygxWGBecTQIxKeqxBl0hxK1BfAoUeinD3jBqb5RtFAmuMr+o4HOc2TTCnjjIfM+4vnvjNlK1krwpGonu9oWPj/uX2JwWP6wWf3+YhJzJUFMmty2ZdSPlyjqCnBf3PrItWH+lhE5TdVGJLvc8hHQyvd203M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470759; c=relaxed/simple;
	bh=QWiEB4RSp+V5dH/Aqgan5cJwk52VX6Ezefo/QbSJRDo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KlHsr+nN/FJJbazqX+TYi8S6nCV1VwQTECQ2/D1ujUzuV+t2KAT0L7NrnD/conXOiyzuMWzOQQVjs8Gt9xHBLVSg31xumJIxnBe58VDXKpsWOb+Vtb8KCy87XnLMJc5jzYlMSs6k+Bb2uv1C02RjMTADVifVhLfF0gtAud0Aqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjcKIrXu; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjcKIrXu"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-351f7a0b13bso399077eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791470746; x=1792075546; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j461oAza6kS+xdmD4uBj9+ZclxkG9bJ1dHy6LksUEcc=;
        b=IjcKIrXuDd07i4JEO77UIWs+t/F2XhdlV87wEUaxb/jFhJA9sbLeb8pWl5blS2YDsi
         biJKt+hz7GULWp9p1fQoPR3lX29DtuUWcs/AH3VAIwBQUHW+jzl1afA38CNVK/OQzIb8
         +Z3Zzj4w+niFJ+AJ1mpmkg1zpY4nzeFjH320u0BjnjLn95Bc1KBoyWBh/yAsSMR8CY+5
         MlMtY//M306gy7jQglNwvhijXN/VeS2abtK6DNWyNBO7ZEXrFwE2FLmltaWqf7JI4zoh
         KgAs8xPvC//dJK7k//s+bI+8kmsH+NhYKn29TY9KAeSZqerKTK15DBCjmHuzAs162+BA
         yx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470746; x=1792075546;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j461oAza6kS+xdmD4uBj9+ZclxkG9bJ1dHy6LksUEcc=;
        b=HfQ8f5f2ukADMTduUkF2SugId3XaUtCc+Pp6wyOPqOyExaXhzYV3iws5OQFKzJYSBV
         O+iQBLnrIeM2gMaG8F1Hg9L2M64JNUNJRc14aXkEPgfiygNvJpW9dVf4+A+dtjHn+X0u
         M1m4Yim7t01L1cZz6Nb/k3zygOwN4OnIkEaUDnu8Ik3QoAb0QE7NYYlVD1Cg5AcI7U3p
         71A7xQ55WvIsRo5I5chLtslycPNfUDWZnwcc9y4c0+kgqTk6vWX+/a/V7+z/5CJ1KXig
         SZzk/zVhXcNnmdJB3LRdA/43NhkeLf5HPc9i2h9f6kozixFY419MAyTRAbvrEFSV/4Ud
         sj+g==
X-Forwarded-Encrypted: i=1; AKwUvBwVrkxgD/ZP9HIYaqHBm27/8ALmXsNGVHz4X5VC3OJsazTRDe3+1mfRIHuhF9qY1rJEP/96tdzKGu6TlSmjKyo=@vger.kernel.org
X-Gm-Message-State: AFuF++lp5BRovKw+vy2nnNxzjt0SL5R4ZGUahXi20GKyjfZMo3/WI9wz
	XjLzdiB0sgqftbC1NI+mX3ALbWLLyDfN1rduhDtkz7XAmKJ3HS/rs+bdEKPbx64BP46oCg==
X-Gm-Gg: AYBFou1LIfwwFd/lWoUXPp4n1WLAyjvUm9bZnb1nQ7b4DLt9B/hmpEMjD8nnoG7C10O
	5pLNcXPj8Mtvx79vCtc+ah1WcIHHOP/YHokN80FRR84OmqAOjBvLX99Kh2SmN7aLFKMJFxO7cC1
	qYB7E+2PwzbCtq6Gw2/bviwuwdAqa60b0v5Xdblw7G3sJLcp+eJ0yNHoM8+1lSThIMatcrbijLJ
	7Nlue9PN1s6zqLfHZLehS7DoLHPAn7RPhVkBqqTL5eBSriXFR6PYHGWZhnNWYUfB0bfX8fuKvJS
	UZJy3FwwAJa8AQd2S94Qywh8xc3YVTHyzU/arz8bB30bFYYWUdmi1WkGc0CbZttxVJ6Nxd/4em9
	L+djFv3YqosjTeNWUdTb7UDEl+X6+oMbniThxwhCSLi1kkIc5mh29zHMvCBD/6+dR8pfMBPsYrP
	KTTD85wPw/0ZJdR4FzuQnCeVEXOKfgRfxrXR3VgDbHUi+PwazwIj3iD9hWmg2sAf0Jdg==
X-Received: by 2002:a05:7301:1291:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-351778bb61fmr4464528eec.21.1791470745880;
        Thu, 08 Oct 2026 07:45:45 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm17913731eec.26.2026.10.08.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:45:44 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] selftests: ublk: fix the fault_inject delay
Date: Thu, 08 Oct 2026 22:45:38 +0800
Message-Id: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKsx2oC/x3NQQrCMBBA0auUWTuQhBDEq4iLSTupoyFKJilK6
 d0NLt/m/x2Uq7DCZdqh8iYqrzJgTxPMdyoroyzD4IwL1pgzxr5ij/mJyjk11oaJem4o5cFzw4U
 zfdEHJm99JOcCjNS7cpLPf3O9HccPoattinYAAAA=
To: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The delay set by --delay_us on the fault_inject target is lost in two
ways. Its timespec is read after it has gone out of scope, which makes
generic_06 fail, and any other completion on the ring ends it early when
more than one I/O is in flight. Patch 1 keeps the timespec alive until
the SQE is submitted, and patch 2 makes the delay a pure timeout.

With both patches, a 1 s delay holds every I/O for 1.000 s at queue
depth 4.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      selftests: ublk: don't keep the fault_inject timespec on the stack
      selftests: ublk: make the fault_inject delay a pure timeout

 tools/testing/selftests/ublk/fault_inject.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
---
base-commit: e1274a6bc40a4618f6fbaebbdc51cca865d51bed
change-id: 20261008-bug-ublk-selftest-fault-inject-delay-46ea414ba226

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

