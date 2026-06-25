Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FDD3E44F4
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 12:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782392062; cv=none; b=lNr8RGn0hKjwnIn88oXGKY+GEnEFkMflIXSIjjhHmwe0JijWznM57zCCATPHYbMufVuu0ovpxR7yKkz2vg0snGq7V9C9o1BkJFgZJzwXxN+5K71RzGkvUhVRgUewNxQr7epTpCUBYADpS57WdtY824vRDbloL06g06IDSgxrSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782392062; c=relaxed/simple;
	bh=ZwoYLetcUtF9UoQ4QRBlUB3RVZ7uO3Uytsx2+NqgYzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSvXEO4aOqFxtgjXWFCkc8tPOt2/0sgHrQA85AWX4zBWzZ93kIDwKuf+ppLsTl0hG6fNZI6N3oJ3u64acMy49R9IKbKQSGM6XIfQqqr6TEqb4Su7raWPPzVNRYDVgOFD+7SfG1M6Szjk+j5TTTLwYTOwb798GeJkdR2g6m+2q1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oa7bnVXp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oa7bnVXp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46e30429b10so283539f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782392059; x=1782996859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJAtGQmovXlj8CbbOYVBpCwG1j5kbcJ2ECu+Lwn8HsI=;
        b=oa7bnVXpbA5iHBLS7wTv3D6N+r860Gw2N6/iMG8KeuKt+qsURZSjLM01LOwP6b3ybx
         W/gDc/DYI3b4Y8n+IdtNwfbWy70x1ESPNW8xtMhA09Sjl0wmwxcLH27xWnf8QCx3J5Gq
         VkJmI2kvIaGAQ11xZe+tLf3107UiP33pNtEL0Atw3nV9DCOS+c44f5lVf7TSzMv/+zOD
         5bpSkbE+26mIf7Qwgp30YOh1tA8jnDg/Jhv+r3aiKksqyLEKjKk9T+KXPtt0/nQwS0hy
         8cVoTJlBLPxS1+/9TaDgiFfZQYTu6vKoehdouD5uFo4SSlq1pOMiNby0PhI+878PdGWH
         VUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782392059; x=1782996859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJAtGQmovXlj8CbbOYVBpCwG1j5kbcJ2ECu+Lwn8HsI=;
        b=BXtEpX+1T6skPYlGzfKcwMR+YXIVYANPnCgJuM/kvGZ3AMsx93HfhefAux3+T2vjIy
         qOlC3UrXdwOWpw8MMkEmMn0qK4Wm429TK8L9R2sueCZ9PcTh8neRgleviMBk4Pcd1TBk
         xNxFO3mFqSCG15uaC1LBmOqaFgi15Msl1V9fq5qReToudtDqE4DenwxvBBvXdISwCbVJ
         hH+XjbymqIdXN7NI16b0YPlreqpyTBIxMopzRhvI/wMcuF42ID42950SPclTlKeEL4Og
         AkI6CFBdqvC2Bwx+TtedEC/kTGbDnND4+f8+D+CrjF3kWK463/oXXviIrwoWF88DFc8R
         XodA==
X-Forwarded-Encrypted: i=1; AHgh+RoBAeMKsNHm57pQDvCy42/uD4rkAr6OrZ9wxvh2RelsrMA3rvtJyJ0ZC4/uFnWKWlCV+pMQiCb+t1SRDOp8nAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPM6twRhu0AyHOw5B1NPOG06pOyVct7gRa4EyUXMRf56mBLszw
	06hzwmu7etEeik5SzW9Dogvl5juMg9q88AIxDysIIjt4AHQrNBwRmo+M
X-Gm-Gg: AfdE7ckJRCHDnFq9TtfJyEhB/JftZ5l2A9INnQS5nLXTEPVEg48w7ESBiI5xExbJ0PT
	wzXUhN5pLRUl9pRvM8eFtZNdjt3fc2E7I5ip8/EfwdAcnX+RqJAYwGsvKWwO/Nmct4O1fKiTJ11
	f31cOyzGPWTQJK6GP8PV+CA/I5S23+yJEhPl4JrK0OB9Z+xDvSvVTyfLIYbavhPPAnbhHqDvAMu
	uYmt5fPZyFEPyBmKeG2PV3K3RNWveR5XNYsqESHNe1YGC491XxO2mHpYt0eK0FhaMsJ5uOaCkol
	NEuCklOjM1gY4MxZPN3HiuOt8kTMci+o/ezdhNzTFyotXLMR//ckaPRvxAprRbNqmiKzqK5TGvW
	VFF5/YTMrc9gdzLnP3Fz6fkWwo4zVgEDmJ7PzA/0JmCZ9lIXZbK1TG2dgTTlkh/5HSJ0s114SbU
	FfyQI1VAufkzzg4krQhVaVMt0=
X-Received: by 2002:a05:6000:4286:b0:45e:e9ac:42e8 with SMTP id ffacd0b85a97d-46dc0839ffbmr3888358f8f.18.1782392059131;
        Thu, 25 Jun 2026 05:54:19 -0700 (PDT)
Received: from beast.lan ([2a00:c281:1461:c400:bf16:e4f3:7fa:c2dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm724670f8f.25.2026.06.25.05.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 05:54:18 -0700 (PDT)
From: Boris Shtrasman <borissh1983@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boris Shtrasman <borissh1983@gmail.com>
Subject: [PATCH] selftests: helpers: handle multi line in test_sysfs_prop_optional_list
Date: Thu, 25 Jun 2026 15:52:37 +0300
Message-ID: <20260625125237.36605-1-borissh1983@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify test_sysfs_prop_optional_list to allow multi line parameters, in
order to comply with checkpatch output that limit line by 100 chars.

Allow use cases like:

test_sysfs_prop_optional_list \
        property_name "value1","value2","val3","very_long_option"\
        ,"extra_long_option" \
	,"even_more_data"

Signed-off-by: Boris Shtrasman <borissh1983@gmail.com>
---
 tools/testing/selftests/power_supply/helpers.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/power_supply/helpers.sh b/tools/testing/selftests/power_supply/helpers.sh
index 1ec90d7c9108..8535cb7ed094 100644
--- a/tools/testing/selftests/power_supply/helpers.sh
+++ b/tools/testing/selftests/power_supply/helpers.sh
@@ -108,7 +108,7 @@ test_sysfs_prop_optional_range() {
 
 test_sysfs_prop_optional_list() {
 	PROP=$1
-	LIST=$2
+	shift
 
 	TEST_NAME="$DEVNAME".sysfs."$PROP"
 
@@ -118,9 +118,9 @@ test_sysfs_prop_optional_list() {
 	valid=0
 
 	OLDIFS=$IFS
-	IFS=","
-	for item in $LIST; do
-		if [ "$DATA" = "$item" ]; then
+	IFS=",IFS"
+	for item in $*; do
+		if [ "$item" ] && [ "$DATA" = "$item" ]; then
 			valid=1
 			break
 		fi
-- 
2.47.3

