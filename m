Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37B32652A2
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 22:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770330211; cv=none; b=rR5NhQjI5HC0tKjEokyvCndHELGaB8AputwPQLPy/x7PIrR72guWjvH2PrAvmnSXn44UWmtmee/RVsArt1YuSOYe7ZiMipPaQHVIMy1+5x1mp3EqsDxxuJqBOx66bl2ZqhsjWLE3QYWX/HGbZ6jmWT2MGGpGaTUK0Om6MShYhUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770330211; c=relaxed/simple;
	bh=7zPQ3MQAjvo6T8D3r4iICmMe2INtWpmsBy8CRfvmDgI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KlTMKNVEqDPJOI9PKaUZJq1BhqSQohyfyoHoeIP922l8r1FKruaEdQcA2xlonlTfcoasxSjn7zG8Eog1mgT1uo9RFJCpyAfJogehcladWL0pCZgHlCFg2y2m4OQbGn2iWcFuDZW35ZqtdVBrR1S82OPvTGIRxi3XgYXmrCTSQpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z4X/9rNt; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z4X/9rNt"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b71d3ac508so1208313eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 14:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770330211; x=1770935011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=haoofomy9mUcwiPEYSd4UfbSMuTLktRLPbLWvg6IzYI=;
        b=z4X/9rNtd8ZL30oraMmZ3aZyt6tPTH3tSXCPWlHlIPBhoarrnBrmnNxZHqyTHu5GIk
         hhHH3D//Bhpa3dKZ81S2g4qkKWtDRp0ea89B3e/HnDr5cF+BxBwRrCvQ4+1Q0KhP0m03
         sn0JfJP4a7TvJxF9DKPs+uBDA6XtetJtgpFGp3IQEOqhqakENKZiLOX6Mz4MLQ0EJ58N
         LgRc5oqX4uyuu4bfnXtY24eSTk2QYM5yBcPqj3BDTvkNcrarVNYi6ipuWnBuW7I8OalB
         zvpf7nGtvB+PqrBSvRfk9bcUSPqOzT0uRpo9m69rdu/7MjM1yNBVWLQ286+/j/wkJExm
         C9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770330211; x=1770935011;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haoofomy9mUcwiPEYSd4UfbSMuTLktRLPbLWvg6IzYI=;
        b=wkCLJW0JgnyH3mycgUjx81lLtl1WrzzYzL9TmEQqiegHizOtx+MC2++noisD9JFVri
         uS4W2Vd8evFO6oGpVDjDoa6UiRG98HkzhV/CIRkAvjHDnZMmxzr9l3HgT3ml5EJNslPa
         lYWGnUSyJQ2bHGK/7hE+wsSnEuJKwaFWQFXbk3iomrBZ6KTIlzvO4C2B7KpQunmX9kFg
         9KiY72eAxBnGv/bHCgYjuWjsW8UttudNRu/4APYSc9JD6yeaoEGPsVJHbJN2KN6F+/kS
         UqEuvyOuP7mhe1DpQueHoBW88Q+OdCx8DD/Bu8CLbdC+amREEf99e+WVxDLZaYq8EJ0z
         /iUg==
X-Forwarded-Encrypted: i=1; AJvYcCWg1k2t/bqatUOZF1rAmHS7987mlylk+w4Hk6I4LL2LN/oq3gEktz5z9yl69/VNFdIwB0oBKwDvbbOrU+FNU7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7OmtBnPxRLxoCmpESl2LDTYU85KbuPbr1kNcoTbMUK835Wa/H
	RYR1OXKHip/ve/kNblT9lrLphfh1horlxadEZmIAhcTWlfz4ZkR4qO7t07I0KJ36SQ3AdiveVeF
	4/tSpxFY7dqCnQsv9M3Iec3H8tD3vOIYq7Fgq6Q==
X-Received: from dybud9.prod.google.com ([2002:a05:7300:f609:b0:2b8:28ea:cd5f])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3e18:b0:2b0:6a03:e620 with SMTP id 5a478bee46e88-2b856721f10mr311665eec.24.1770330210752;
 Thu, 05 Feb 2026 14:23:30 -0800 (PST)
Date: Thu,  5 Feb 2026 22:23:27 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260205222329.2419035-1-jordanrichards@google.com>
Subject: [PATCH v2 0/2] selftests/liveupdate: add end to end test
 infrastructure and scripts
From: Jordan Richards <jordanrichards@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Jason Miu <jasonmiu@google.com>, David Matlack <dmatlack@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jordan Richards <jordanrichards@google.com>
Content-Type: text/plain; charset="UTF-8"

This patch series adds end to end testing infrastructure required to
verify the liveupdate feature, building and running the existing
selftests on supported architectures.

To support executing the selftests as part of an init process, this
patch series also adds ftruncate() to nolibc.

Changelog from v1 [1]:
- Moved ftruncate() wrapper to nolibc and fixed issue building selftests without nolibc
- Fixed handling of CROSS_COMPILE env variable
- Remove unecessary complexity in luo_test.sh
- Move results_* directory to selftests/liveupdate/

[1] https://lore.kernel.org/linux-mm/20260122214427.3568647-1-jordanrichards@google.com/

Jordan Richards (1):
  tools/nolibc: add ftruncate()

Pasha Tatashin (1):
  selftests/liveupdate: add end to end test infrastructure and scripts

 tools/include/nolibc/unistd.h                 |  11 +
 tools/testing/selftests/liveupdate/.gitignore |   1 +
 tools/testing/selftests/liveupdate/config     |   1 +
 .../selftests/liveupdate/config.aarch64       |   2 +
 .../selftests/liveupdate/config.x86_64        |   2 +
 tools/testing/selftests/liveupdate/init.c     | 179 ++++++++++++
 .../testing/selftests/liveupdate/luo_test.sh  | 276 ++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     |  27 +-
 tools/testing/selftests/liveupdate/run.sh     |  63 ++++
 9 files changed, 549 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/liveupdate/config.aarch64
 create mode 100644 tools/testing/selftests/liveupdate/config.x86_64
 create mode 100644 tools/testing/selftests/liveupdate/init.c
 create mode 100755 tools/testing/selftests/liveupdate/luo_test.sh
 create mode 100755 tools/testing/selftests/liveupdate/run.sh


base-commit: 145197c9801f90fed517447e24a9d20f3927cf27
--
2.53.0.rc2.204.g2597b5adb4-goog
