Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8861C3DDB02
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348772; cv=none; b=BQFv67R36wI8dLHKVKpMKWyy8coaIYZ6z84wXnK69//yzNjkRTzK+pHXm7zZ1+I4iUOolfk5L2PapG9VKzsHgZecl/0SEFM/TdGk8ojD5r4cgJBbAdjFijNHrdxJ7QYQ+ygrJOofEi6k6bGzjJ3MO0lOCjGpGw4jCtK2v5mvQQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348772; c=relaxed/simple;
	bh=weOOepSSbnlZ9cU7469mPWDgr3/c5R/3kbdpRpOlCsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrZb6stpwLgVF8eF4Ym3wtG4ip7579S9ASeE83gwk6YTsvJgpQjbERVATsGezntSKOIOa2R2HjaY0/3vtvUqXOhaJp/CyoWJBlcJ/dksdzS8PjsIzENdD4g61ft0fgrIO1HXGAoyiY2huCJJ4wqyiqKl4W2wohdb4OOoS+UbSbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHnewAR/; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHnewAR/"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c888c001628so522106a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348771; x=1783953571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RsAcv5tiOY8uhd8nVRG0fQgmp1hsWD9e8k/xi4zwdo=;
        b=oHnewAR/FwoVZL5sRjQvPah+HmBy5UUc8qSdGs3O7ulranoxHoOswqKG++sxOZjUuc
         7r0YAZDDZDx3foVuwKF0mfFoIpsluCLRH86klsVl2CE0jTY5Ne2t1n84QqY+p+f/xsdc
         dF5SR/TcV5T0znv4zbtWH0XpExAidKcGGkSf2rOCR+4ycUpfwAbm52Db9ojDw0SvlZnZ
         vH9jzR5ErCwzIRLvPcjPDZYms4XFbDZUlVDY67vF79CSeLG94yUXSIQu1f0czjKXQat0
         zY0jeJ4nLKNqX4eC53la9vRLcNOVV2XOJ8ZwNPFTGuk2H86TLJa/ouhZUWE13kzVWzw5
         4loA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348771; x=1783953571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RsAcv5tiOY8uhd8nVRG0fQgmp1hsWD9e8k/xi4zwdo=;
        b=iIiD2K+ncoxHo9AdHUm668MTvOr5oaLljaUS6wtCx483LPJoRQTIyvN9q0a+G5oJKg
         uqChhGY+Qh/5Uisx6xs8WoPTKwSwNCf7giNHHRqZPo/0Dg6P6TQCXiXzGVoMwD4FIzLB
         vDDmEHN6uXK6ML+lEYhQ5YNCPJ+ls5ty/kKjmTAIXLerdTRctQv5YhcfDfxMalFDB6N8
         E8CBk21pwjWmj3HcajzB5p6ktQuU7g+qh2AqtkGhNqGHhVtBKtITA9a6UixTPB9ZHQA0
         GY5ckwIEusL354X0XPk1igbZ2ru0vqTYwXvTmiXQm8CS7wbY1eA4m1Mr0WEslpWkAEAM
         ppdw==
X-Forwarded-Encrypted: i=1; AHgh+RpHBkF6SeTjIHfiGhVo49puxRfyPd/hPmYdH5SY9H9+6GIZgVEE4//qktofm1yK8qhWY6XofblvXEVokTtm1r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiuxvorYP+HsINQR3JqOz3FRpEjnf9BblL/QVtGRlMNYbO2za0
	QPM1QtB9NGoB4NXY+2Oa+VV7UHyVRsoz52l7tmvZyyTVmQCCaESX1vM=
X-Gm-Gg: AfdE7ckZv/xeekbEpbbL+n8jA5ejRw79D4hs6Q+qGAjflyW9CyDQQ60MeaH9YwUKXUk
	E+gVBnscfEdj/IdG4wgY7F2SKzK5XdCJCGwNIl4Kvmv/JA0dihe/UXGtvpPT2riwxG4YWjLAkRd
	Ac7s4kqVq/UBizMURIlurHa8eaUg5WLw5hQWP17vn8+fz1iEJtuoVGDQ9kWZu59DO3JK2+Xk/db
	ATFKCNWL+EgR5OXWkyuchOULjDqoNwJS8Ot4JbnWDKgKl84tuzwWK7WRFuFB1Mc5AS8lCmxUeyG
	xzKfvUjxyf0WEaWWDde4vnDwZOgxihLFZbfipH5K16Rh3s2pbouaRrAr1WdFGcLXkkSjb0FyU7a
	XXxMxaxfnt/jRWkCuDEcWbJqeenjsB75wdErhUm7Im1DGJ0ljo56+f6tzPGPYertYqvVTyh8Mdl
	icxsPGjw6W5xUtLsPZUi7VtGyYe852MmB/pMp9zFBcSpU6
X-Received: by 2002:a05:6a00:8c8:b0:847:7cf0:347c with SMTP id d2e1a72fcca58-84826f0e8aemr813327b3a.46.1783348770852;
        Mon, 06 Jul 2026 07:39:30 -0700 (PDT)
Received: from localhost.localdomain ([211.196.223.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b609acsm3858991b3a.1.2026.07.06.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:39:30 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	shuah@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] selftests/cpufreq: Remove unnecessary sudo from quick_shuffle()
Date: Mon,  6 Jul 2026 23:38:54 +0900
Message-ID: <20260706143857.3306-2-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706143857.3306-1-always.starving0@gmail.com>
References: <20260706143857.3306-1-always.starving0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq selftests are always executed through main.sh, which verifies
that the test is run as root before dispatching any test case.

Therefore, invoking sudo inside quick_shuffle() is redundant and may cause
failures in environments where sudo is unavailable.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 tools/testing/selftests/cpufreq/special-tests.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cpufreq/special-tests.sh b/tools/testing/selftests/cpufreq/special-tests.sh
index 8d40505dc468..f45eb525f3b1 100755
--- a/tools/testing/selftests/cpufreq/special-tests.sh
+++ b/tools/testing/selftests/cpufreq/special-tests.sh
@@ -65,8 +65,8 @@ quick_shuffle()
 	# this is called concurrently from governor_race
 	for I in `seq 1000`
 	do
-		echo ondemand | sudo tee $CPUFREQROOT/policy*/scaling_governor &
-		echo userspace | sudo tee $CPUFREQROOT/policy*/scaling_governor &
+		echo ondemand | tee $CPUFREQROOT/policy*/scaling_governor &
+		echo userspace | tee $CPUFREQROOT/policy*/scaling_governor &
 	done
 }

--
2.43.0
