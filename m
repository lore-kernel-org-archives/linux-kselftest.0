Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ACA3A544C
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348770; cv=none; b=IOqnjGmJmhk4DuXG5rfzUzyzIA4PI4JPs8H7Qd+1/Oa5EpIZ6KHEFEdLpWpbWRkfZIz9sCK2r9xPEviUzFGL2CqYWJDSJ6ma9zmYfQEa9O9vVumnxD5ty3+ROD7rRLliESgivraaMc19DQ5sJiZpV9VAP7fBoivC3o0csQmjh0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348770; c=relaxed/simple;
	bh=x90aUn0J9cOzFK9OMOuB1T/9j8EV5QSJzT98AE3Ubb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/pvObkGBHSKCemseiQfjK5lUmJvxw4w+UzErWatHhbY1Z3t+2wSIE7NmhSBg2kU2OynZN7XnkW3jciLSow4a+ueFt1OVk+LXVk13O+hpzZjj/EISNMfN/WJlxOquUq7f8hBeTFrpRwA5dvP1q+4BhKzmhs6jjrsfGL0fzs1U6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9krdShV; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9krdShV"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c888c2cff98so681781a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348769; x=1783953569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfyQp4sNmNhsL49jNoWYN8Wz/1RG0tztSjlIz4Q1N+g=;
        b=Q9krdShVbBLeGfakh7SnPqJwfUsVKx23I7oQuvp385w6eanlpdq2LWyOGKsfuerezQ
         TOGwf38LE57e9ZCyTqm4jrTI5QrADwjcmO42fFAwYnwm/ny4sKXt4hViEVgtVbC6ey3f
         m87NfW7RbSfKrKDRHDy49gpGdVt2FqbKduRkSHcWZj9J4PGEnadi07ftJt4OUKJSKASb
         TTxOLCxmwHFfMvXz/VoBAzGua3LJNYG2WOtOTMJ/alIwcO0liFfznfALOzGZL8RlSKCa
         7IN0EfZsK8oNwV9X7oLLvrgEpwfmZ/OmCItet/OwIIduIdGx+glnQHErb0T/0F7/oGx9
         VoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348769; x=1783953569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfyQp4sNmNhsL49jNoWYN8Wz/1RG0tztSjlIz4Q1N+g=;
        b=SOhuO1ztgUqCMO04mSoKCsb7o2+wmBHvUi32S3pw6iqioNFP1o2/pilS5L8i4s7FM6
         bIXyaqkZJRE8j3Epa76P5+gpy9FWrps7dDcIFOURVLp6/AgPZmOzPj8Dt1wOHszShStG
         9IIZqaOqjH0JvpXUvO5ES9/1sUbCfR9CORL6d5OpDM8otlbkFNfyIc86AOuhbiAIxeet
         oe69ZYw3BZl8cf5IGWtSQW4NYMqxwNmMQxEIjzfxWW10j1Gq7pOB5tR6HCZt4bgrl6uU
         eqqh2J63WOLIH3L29km3GF3yVmw5bzJxsrvfRUZWiygSs7EdSqAc7haOa9+mQmsMrIJq
         0BHg==
X-Forwarded-Encrypted: i=1; AHgh+RpCwkGdqy6S5rB7b6c23gKeehgY9PFWbL7Q5ylcdUrC1n5bYpzrr8nnbZyGZKr0AwZIId3vIsqBLJZm+HgkZjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzmJKRYbdXpyNJe9vTD5eBYfulGxsxZVEO0LOPF+sxSKn4Nun1
	VGdCws02Kf5YYMmn5bbBqw1RFdpBULpjedJLyrK46ifs5Qvedv/Jsi4=
X-Gm-Gg: AfdE7clUcUcB2PQOgqmGayJNDaSBJVItSVmeWbBJu2ZVTi8Nkhu5lofSqNDw+ZljNaH
	QN6lAaETWo0ky50eetJTgPde/ZHz6n3HywcE/Qsjxflv+0/Z9SmOrHTLA2zT8rUR0659Z8f7b3J
	yLSMR9r0fpJFb9RekyfGjZtbtJUz+LwylKweN90KEwW1UiD8XMm6ZBzqK39s+NI+GB0pwYmo61d
	OzzsivzPurjdjgzYTvvKNlYOLq5zDc4y+t0ZsTw6JzNOZ7kr5rdvxrVFQFdo8mPXatCFw+u876H
	a7ioZgpFRXnwPHC0GrksdHYGTiXaLihc/M2xDf78g+o2Mci0B3UMCDt+WwSFSLezvI8hcWN+0kJ
	XlgT0NhbZdIieEvTYdy8j4KQRb4wQcwaAI1H0a+82O8gBSpHb6Ei/BclTgqAdnJZlPugSPU5dO7
	TD6RGNezJ4w1nG/mrubrp4GnC5fx4SnLVvpBIBJR5VACnj
X-Received: by 2002:a05:6a00:2301:b0:845:c6c3:5e75 with SMTP id d2e1a72fcca58-84826e13ba3mr842845b3a.42.1783348768602;
        Mon, 06 Jul 2026 07:39:28 -0700 (PDT)
Received: from localhost.localdomain ([211.196.223.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b609acsm3858991b3a.1.2026.07.06.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:39:27 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	shuah@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] selftests/cpufreq: Remove unused local variables from switch_show_governor()
Date: Mon,  6 Jul 2026 23:38:53 +0900
Message-ID: <20260706143857.3306-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

switch_show_governor() assigns the current governor and frequency
to local variables before switching governors.

However, these variables are never referenced afterwards. The function
does not restore the previous governor or use the saved frequency, as
backup_governor() and restore_governor() already handle state preservation
elsewhere.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 tools/testing/selftests/cpufreq/governor.sh | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/testing/selftests/cpufreq/governor.sh b/tools/testing/selftests/cpufreq/governor.sh
index fe37df79c087..212ef1cf43d5 100755
--- a/tools/testing/selftests/cpufreq/governor.sh
+++ b/tools/testing/selftests/cpufreq/governor.sh
@@ -100,11 +100,6 @@ switch_governor()
 # $1: policy, $2: governor
 switch_show_governor()
 {
-	cur_gov=find_current_governor
-	if [ $cur_gov == "userspace" ]; then
-		cur_freq=find_current_freq
-	fi
-
 	# switch governor
 	__switch_governor $1 $2

--
2.43.0
