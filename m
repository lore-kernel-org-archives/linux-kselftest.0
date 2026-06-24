Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945FF3FBA7
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304229; cv=none; b=lp15iwN+udoYywlXETG7vELtqUpGGS7VTMcgtYFNDJCtC3Iob9ESicwdgj/txpfmjNlckaESah7gkZ4T+TNOIx3Tm8FllAKp70RgEFniD5lZIHaWRK2vLk1CJ8yVby7ZSn1RkIq2uUqrw+G0NtL8sF2NtreHgvwHAsqcIivorfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304229; c=relaxed/simple;
	bh=oWZSy2vnXbzemBv3Qg4Trq/YGNygJUwHFXQxIa9sI0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMmphcq2RyNxL0pHAmNMlA4+IDtA3v+0HVCqjYNbkPCDWc12rQA+bRl3C5d1hlVvQMk8fs0+XUdaOO3QoQv6IhZAhcSiRiCI+rIhuRCTYm4sfpPs2na7QXrfE9q/PKoi9FLsboeeKcwMf8sv+OK+rH4gov1DSNLjDfDQPfpmEsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdT26ra3; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdT26ra3"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-804e46366d7so9823337b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 05:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304226; x=1782909026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8k9TIVBzrtkJ+5AdlIoIq3eU8KFjMxgcsnRy+gI+28=;
        b=jdT26ra32blMuBBmDt1H56hE/dwz8FR/vAvvDkBUVEdGFDwVPVURYXT2VHuMjCGRgE
         95C09sVPZVWTGeRr+k8/IIyh4tHQcSbEN/LD+5evYUKKNRyZ77ECq7mhgNZegJLIPxFh
         CruLZPY6AVzCpJQIpcu13Sd/BXxr7qiXQ1Ao93/44xo2SUfktFi+lVBlk4vIKN907pmk
         kK51as2km6VU7lMYN/6rYg2RN8s8zo8xGdvWXNpRXz+Ht4lPD6uLtQapbkM0V2HyjoSZ
         wfwsMQVjFhqdxedw4jqYdniwZV0KwsJVFv1ObRa/owEJSkkM955pzc4+k3ONAxB4up9e
         dmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304226; x=1782909026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8k9TIVBzrtkJ+5AdlIoIq3eU8KFjMxgcsnRy+gI+28=;
        b=r/met5lXzV6CyDOvnmp3SfYWr4iT6PJtzdpxhzNkV1W924NFsWFZRDx48E4M/KD6F6
         3jRc1jxcw+h45NNob3/7tzqr8SaDj0f/o2vY1e5dmPX6yYOfy2gFZduARy7no213Pl0j
         x3ca7PZj1goiM/+wevCR4ZJo047SMWIUKfoWanzfnrhnzpgwXJTUAkegdLETjuzXDxfe
         2QFHpg2Azm2yQV8xZuPVme94H5ILcS9wdckY9FRpPgi01Sz8+ozTomz4nyHXrubn0+ps
         lkYgkBXYXDC8qVAKgoK0j1Wk7y2fE8ghum9wCkcebFbsMFegr2MQ4zvDzISgT2VbH2gc
         Xv9g==
X-Forwarded-Encrypted: i=1; AHgh+RptkALEBsJ2nrQ8V8bCi0nPTvu2Lm2AmusW0aaTT9/foBd+uiGLyfryt8JByW7kejR87tzIYoH3nzHnzMd5BXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLPA7ffOGG8v+hQiskBadOL0boiUIzUieez5ZtTtcrrVM389j4
	LStxXXrLndTohmv2Bpsx9z5UYAMShfPBMNT9x9g+QPZ46UJo6kilIp1i
X-Gm-Gg: AfdE7clZ0On7t6s2sLVwwbjhLFtwiJcMiglQjQl7vgJ47xfeLPZFET61QAQIs6N51+d
	cSzVvP+l1+QOnwHT7OjXaAZ22oLkMbRJeZg8scfP9ZHlEng5eT5LzUNgQOpK27tn8YiVGhnaRk9
	b6+B1ygpKyDYJ+RDPEc8X7271H7sJuLLOVX8ap/RJy5XQ27Dv+deaS/1YqWzhUfGdVQ+4POyBGO
	7DigCeayOrSLO25Pc16eQmKIV6LJt/gqZWl4DrxyUPCnywD/nssLwPIzx1otQqC0GBs0bJryhDt
	R9WyJXkOrJ30u/5Iwq5kzFwKmFHbALwhDVthbqP2aiVTvxf4pCF2C/8CfiFp1DAjd2QFL7Cgcsq
	VgH+4W1SZWQ4DOf9H7NAasLDpC3xkwc1tox72h34Tl5DmLMIpZhQ7vctmwwDagJUuthp1Aptr1s
	OjFscHD9XauGqDSY4mHzwVm3/zdw==
X-Received: by 2002:a05:690c:c4f7:b0:7dc:c477:9e98 with SMTP id 00721157ae682-806c3a1a9ddmr62727187b3.31.1782304225501;
        Wed, 24 Jun 2026 05:30:25 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025c96fdb3sm57601677b3.1.2026.06.24.05.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:30:25 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Jason@zx2c4.com
Cc: shuah@kernel.org,
	wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] selftests: wireguard: avoid extglob in netns CPU count
Date: Wed, 24 Jun 2026 14:30:09 +0200
Message-ID: <20260624123009.7008-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netns.sh enables extglob before using cpu+([0-9]) to count CPUs, but
bash -n parses the whole script without executing that shopt command. This
makes syntax checks fail even though the script is intended for bash.

Use the ordinary cpu[0-9]* glob instead. It matches the same CPU directory
names without requiring extglob, and lets bash validate the script syntax.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 tools/testing/selftests/wireguard/netns.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index a8f550aec..98b423494 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -22,12 +22,11 @@
 # interfaces in $ns1 and $ns2. See https://www.wireguard.com/netns/ for further
 # details on how this is accomplished.
 set -e
-shopt -s extglob
 
 exec 3>&1
 export LANG=C
 export WG_HIDE_KEYS=never
-NPROC=( /sys/devices/system/cpu/cpu+([0-9]) ); NPROC=${#NPROC[@]}
+NPROC=( /sys/devices/system/cpu/cpu[0-9]* ); NPROC=${#NPROC[@]}
 netns0="wg-test-$$-0"
 netns1="wg-test-$$-1"
 netns2="wg-test-$$-2"
-- 
2.54.0

