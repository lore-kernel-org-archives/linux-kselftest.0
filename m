Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05064C33DC
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766954; cv=none; b=WVXPdHMXxF5UIKC7FqicoiD3yXAEf+FD97WMZUB2N8a3Oblkq3bEgLW0MT90pU/gScM80cmUK5LfDmpPbQg1AfNi1khBnvM4+2i/cB8+HdndUPg5D/Ua7JhsEwEnhpiXyOlqEhyihv8fTWGRdV6jQD+pA3+oewaM1fSPPnbGOmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766954; c=relaxed/simple;
	bh=rSgDQXtkBUcI8Uwuh9JsK0ZtlAqY1r/1adpyEamAgRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNt9tgEyrj5lelHR7YMqtNvl5dhWLIBQUMrknrv4jrSPyQIq+F3GOb6MjPFX7z0ugfUdRC6YK/KZ6ePJt0juK+IRp5jTSjv0WZrss4iu86KqL32sbTtp8V8xcuByYZX+UFHwOZKjF8VpYWpUyPJJPdKXy/UdzZ++xq6Q9JxDVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG5Y8CqV; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG5Y8CqV"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso3341193b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 04:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766952; x=1791371752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEdmlVadIcezq2ZsZ8/Ln2Oh6O1HspeuQRgFacxN4xI=;
        b=gG5Y8CqVFtyYzVCQ1rUxoCrfOKOLm4MfxBukYU4r3syS37rlJmLGTyfNBPfWBKh9/9
         udUUk2k3pJra1/yUJn11Z+3jODkFk6HlfnO+UkXcNuR7ZBzCNANwzhqI+yPnpN6ukoiv
         5KNs1HTGJoRT+ODUjXFXbd2Vdxibd+OWuKT/AniZdK+pOAhK6tKyUuABG0QOBNVWgVI6
         IRjdXS01Dj+Ff1InDAeZI0JI7y0avYTbzhJCUlCazOA331njf5NhrWLqD3sAdLNahnEh
         0iEk5fM72IiMyLoDO7bSJUnJiHt2yzGkIOiNF/EnB9jLCLpJ10/KgqjDB4ivKsUDfb+v
         rztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766952; x=1791371752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEdmlVadIcezq2ZsZ8/Ln2Oh6O1HspeuQRgFacxN4xI=;
        b=m2qiIpHx8IUbjKz1KyI01KcEAVjO7o6KxuErIHxrAqC3Y/22nwqUKvtBF9UWkpr2pn
         gG4HuVyrAcqxt/ez8nlth67k4fZFIoafj9uBy9/HroqjiQcWy4iwXIImldGzgQapKZao
         eaUgM/+iqKjmhOgiqgeoMVB7RAvHHGvSKERkXR/I1LDe2elpxEL1NG/cP3JwWzAswUzw
         itnIYKgjlyN9kxFB9FDky6N4NwZUj61j/m8EDUiLMbPpDqo3iVcmVXU74XzZvptdaKQi
         CIdCqgPQEcMVZCH+mr65+qZA+rw83T77wunls2KqoqYIzVtkEj6n1XAw8EdSN7d3cKYi
         iGrw==
X-Forwarded-Encrypted: i=1; AKwUvByghsCOVK1YYWR8zQWCWei18Iaknag+jqpPPxAu0ofAlYtpOmGOqouquFslHlcKNyun2QaGr+xvburmTrqWk8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3T2jJKiH9sQRixIP/iZAEZNbx6CxWDvM2kH4WVje71FmlJ2aO
	ZLZ8C8x6NZaq1rK0UERPAu9hcqPxLiY6+Hd9kAOU9+nVZu3VkFmq2EDg
X-Gm-Gg: AYBFou3H1cBvQeT0h8+l5ioGNRHKha9EVixmQyQI/YGaW7Szc83BcevXMXYKFLZAknD
	sCJtSCFdKmTyfry7FTy4oCDhw3pOGwVboysaqtFA4S2mdBfOFfIW4M0nmzZW5qzR2cjBT0GjU5p
	t1K2XCh7vJERP6YUOw7hvZW5OGHoO3Crsy0w2kSgFKqRHHdsiMO3DKzY2NMe4+UuMLgzD50lUmH
	MALylhrmMxA3nwutRJrVtDe9ixgcs7X2gZboOOynlkluLzQ7fjiue3UwALv8R8IpFgNWIAKzQDa
	MZZLxlxKQDYpLMb3lI3JBS4YMriWNpfyjMwAeQvjgoK/iucvrGFdH6nAEfFzcTRDvbsiMV7vICk
	fFe92v3VgtFQsLprMTMd9e2Rxhsqu7BCpQMaNd+7pTYdLnepi47V3JyFLK2qxI8pxoB2njrDQDe
	2YckeIAV/K/B6kgcwF9iPH8YPI9aQf8yNOW1CUp/KIqFJtGU5Pt7oMxNpddcmQR8DsA8JFU5T/F
	XlOnwdyui8VWAkMuVe9v8wUNajgesdZw4s5oMKtz26wYpMjG6L8ZnhtXaab2PoGL89N4i4gt4c=
X-Received: by 2002:a05:6a00:99f:b0:881:bc81:e8f6 with SMTP id d2e1a72fcca58-8874c9d1e5emr866456b3a.23.1790766952061;
        Wed, 30 Sep 2026 04:15:52 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726c07f4asm634108b3a.59.2026.09.30.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:51 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] selftests/alsa: Do not take another control's event as our own
Date: Wed, 30 Sep 2026 20:15:33 +0900
Message-ID: <20260930111534.3782264-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111534.3782264-1-sammiee5311@gmail.com>
References: <20260930111534.3782264-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wait_for_event() skips an event for a different control with a
continue inside its do-while loop. But continue goes straight to the
loop condition, and that tests the mask of the event just skipped. So
a value event for another control ends the wait as if it were ours.

A driver that notifies a second control from its put() queues that
event first. The core only sends ours once put() returns. So the wait
returns early and leaves ours in the queue. The next test then
reports it as spurious. And event_missing passes for a control whose
put() said nothing changed, as long as it notified a neighbour.

To fix this, clear the mask before skipping the event.

Fixes: b1446bda5645 ("kselftest: alsa: Check for event generation when we write to controls")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 tools/testing/selftests/alsa/mixer-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 53a72753bb08..02136c436e16 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -267,6 +267,8 @@ static int wait_for_event(struct ctl_data *ctl, int timeout)
 		if (ev_id != snd_ctl_elem_info_get_numid(ctl->info)) {
 			ksft_print_msg("Event for unexpected ctl %s\n",
 				       snd_ctl_event_elem_get_name(event));
+			/* The loop condition must not see the other control's mask */
+			mask = 0;
 			continue;
 		}
 
-- 
2.43.0

