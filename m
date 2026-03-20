Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CC3E716A
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031369; cv=none; b=tzQ4y2rBlFJnxyhI/btz28edyeWjWWWJQR76GCK5uUOGkdwkjO8mDgM8SQ5NJL62ByQT51uzNQOc4BnZzWuimdzv6M095SsLKPiAWDNUoluwwAUYIs/6N9rhAyq+n4c6gDRqlRfryTG9lfZiE/64rkx3w+J9/+AUGNFiUcwxfk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031369; c=relaxed/simple;
	bh=ZK2PP6H5Htd3EMxs/tbHhD+tM4DKDuhATR/fPLzNQiQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ty2jmdNsWsuH2lrFWwCWzW2d4XZDbENy/hhUOHsq5o3uoZo6dPumOJYGTvu/8IzTtgHlMA7UhBeGzPZIMSs3oV2mJyj32CddvL0K8sgcdtBX9bpyfIM2hPXflhtzgX4zj23PZztMfs35OHjSxKLsOapwfAz/lCI37NNaho73B64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IZgFClXw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IZgFClXw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe655187so13504505e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031366; x=1774636166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zI2ieTUFXonsrBR68Y1B781kbM8PTDVs2B5gc4uGYm4=;
        b=IZgFClXwGgS+tMGGJ5bFW+tdktw9xzed/D+vCT+COQ4jx5uQRHQtT+jHQ2PJROZw+z
         TxP0sjD/n+MeyEApNHy9BX+SwJkrd4P1YDT6T6mG4fw5oM31qveGAYUBxwNqIZXa/LE2
         JvdqAPCDkuH66rJm0LXy2qyZd74PmH7vg+lhj8nf8Bfd1ME/wQcYIGR5Ym8YHs9MnUZ4
         8OUDkJh3RnIeOyQP8AW0zN94sXaHJd2qJks3wAeEdakZLThsHGlIOF7XoorIyDCmnNaO
         FUFQuEDJtcbYTiwVDQhe0h2agHivlG1qfK8lis3Unjpr5QbAuU81+BRXjrS1cxZBKdkP
         pGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031366; x=1774636166;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI2ieTUFXonsrBR68Y1B781kbM8PTDVs2B5gc4uGYm4=;
        b=lpS8nffIBA/L23/bXuW0Ynwu/GPACr94woUc+M03fqQuGpGypM0BPdhW9ZC5OBEa68
         2yUiranVG7zuD5/oTpPRX65M5zrs8hWb2y1RkeyQq7kv9kubTUTEGtIv7koIxDZio5hZ
         zUKXP9PlhDQIvKzvtBHu2VBHKCjSwEhhm+jYnomFTD7pkYb5pNTlUEgCVbi/HPnlDd6r
         BjgBkfAbJgZeUuT8bNAjsZ8Usd5pjUslKR8rLgHirl8Jc+Egipu+NiBU4YkD0nA9Ej+k
         PHh8nsavk1+HJ3V+YW5gaifLhUUVVO/v6hRW7d7PIM/fNJS/BUEedUjDAGEksiH8KLQC
         mnSQ==
X-Gm-Message-State: AOJu0YwsS9QguqfWrESQLYl6+EPeb1pmTC9I7tPlvugPIW4d8QJfJeuL
	72FZdB1QrBT5qFYXRlekLng55ChH0kJ+mZHZw86TfcICjiul3zo4BeV3lXIWu2D37bAmyzHXU8r
	HIm+z
X-Gm-Gg: ATEYQzx7gVHHRcwwvw6uKaHQjPJ2z5bRcmNEe0sPso1s67MM9l6Gd7dP+P2j3reCkwY
	FmEn3F+qY7ZPzSxLrZNWpbQwbArg8rHDRJVDHY5/q3rHnnJ/nTjL3+HzwfJNhcn40SzMTZT59yr
	61I0t9XB9ew6RONfcaM7eWlbGd4KV451ZWXD1TOVjw+b8DP5RNzplZHQYuGiuvjWS03bl8l444z
	FoC2Ll2Sxurdjg5FXZ3JHrhAorUHPXBRhL0dGOVhGMIe6KNbSqOi3qlHF3ntbimeB9j9y5pFqUv
	yR8v6kmlOTE/Vc0gb3/98TdESSLqWFtGrhLHf4w2C156kQUMiKZSEflVRmNR9KNyoOJCj+SBi0n
	3/ougy8/oHfAVsmMq8vmp1M+efT7QAywsDIM9c1unb2FuJXNKH278e4XAyXHmAAId9I3UIPJKuE
	JqDKzlAWtOiA==
X-Received: by 2002:a05:600c:35c1:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-486fedb2545mr69529735e9.11.1774031366421;
        Fri, 20 Mar 2026 11:29:26 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90553b04sm19518657b3.28.2026.03.20.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:25 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Subject: [PATCH 0/6] selftests: run_kselftest.sh cleanup and fixes
Date: Fri, 20 Mar 2026 15:29:15 -0300
Message-Id: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPuRvWkC/x3M0QrCMAyF4VcZuTbYdSjoq4gX6ZpuAe0kKUMYe
 3czLz8O/9nAWIUN7t0GyquYLNXRnzoYZ6oTo2Q3xBCvYYgBjV+lsTXDIl82zJRj6nO5hHwDrz7
 K/8Gjx9OdyBiTUh3n42dRmaSe32SNFfb9B4t4OzmBAAAA
X-Change-ID: 20260320-selftests-fixes-dad2b1df50d9
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031362; l=1348;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=ZK2PP6H5Htd3EMxs/tbHhD+tM4DKDuhATR/fPLzNQiQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDusXjprKnLKlyP7MGf/ErCP+mTOT5X0BuS1RBlRTJ9qnSW1rl08GzXeciqDYnRapZnufVA2lyA
 3geAkd9hTwwA=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Hi Shuah,

Please consider merging the following patches. They are mostly small fixes
to run_kselftest.sh, plus one feature: adding the option of passing a
directory to the "-p --per-test-log" argument.

There is a small corner case spotted in tools/testing/selftests/Makefile
regarding failing sub-targets, and also the removal of the default install
directory for out of tree builds in the top-level Makefile.

Thank you!

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
Ricardo B. Marlière (6):
      selftests/run_kselftest.sh: Remove unused $ROOT
      selftests/run_kselftest.sh: Add missing quotes
      selftests/run_kselftest.sh: Resolve BASE_DIR with pwd -P
      selftests/run_kselftest.sh: Allow choosing per-test log directory
      selftests: Preserve subtarget failures in all/install
      kbuild: remove kselftest output in mrproper

 Makefile                                    |  1 +
 tools/testing/selftests/Makefile            |  8 ++---
 tools/testing/selftests/kselftest/runner.sh |  3 +-
 tools/testing/selftests/run_kselftest.sh    | 46 +++++++++++++++++++++--------
 4 files changed, 40 insertions(+), 18 deletions(-)
---
base-commit: c612261bedd6bbab7109f798715e449c9d20ff2f
change-id: 20260320-selftests-fixes-dad2b1df50d9

Best regards,
-- 
Ricardo B. Marlière <rbm@suse.com>

