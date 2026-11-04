Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826548;
	b=OI1o17XiRiq8HypX1S1R91Ly3WtUk+T+evH7UFFJs+HRgu2FCO5rdZySSRTD4n0oAGJ/
	 gvdGWIlT0Ft/h8sP73yhDEqtkQvEY6moQo6EBYBlqQqY8wH24KFmzlUVtEnsS4iYEmmau
	 o5Wqy0r2Gc1szCk4vXoyblpu+WOciL2M+KSt2UBuTqqDwKe5wjThJywjiqHR5AKpfXpYv
	 fNCEY8vJ6YKI+6SACNb7QEAlyjTjIeHOyUj6T97rL2AoeTUg5cGJovvW9p3hb9LbRFljg
	 3tG5zB1jy75YEJLqueiJc3QToQrfmzq7NtS3NkCpM4JfklLL38ZdK1U/jUQdORRhfIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=irqZ6/3MyiMekC4JKIQxGO3/LPhRZcckOlSBTK+F8dQ=;
	b=X0KrSMHnYMeI161nsJeOFRZtOibaJXTaFnfOTUgxmpeXKhPlimXiL4+ncGxNrPJrYFd+
	 +xJw6BUD5Vh27hT3dhLTh444hvzhcaB+ybeqPkrys8AEv5qpfJqSUl6QL5hWAtIRUPjgD
	 uJIJgFXU0lJiZLsYSYBll8BoJoTmungYZFoEurGyN63dc8zJF2WO9k4L+iFBYZPCiXQA6
	 uM6FKDKZ+JokL066KeiVqw6wl1i6ifAOQG+AZM9YPj8xDPXQIy1a7NMhTnfSB5iIQdvYR
	 QE5jXadewCijjF6l5nUDgaSX1ruRwedduqFO6fu72l7V3QO5tI5BN3+bXopoNC5ALSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEg7oruh;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6123560A16DB
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6123560A16DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEg7oruh
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12771205e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826546; x=1794431346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irqZ6/3MyiMekC4JKIQxGO3/LPhRZcckOlSBTK+F8dQ=;
        b=UEg7oruhJEBaj6ZB2neW6iSWvxxOKi0Wv37wuZBin/3EppB4M0EOSjSnRf5+lMJzSF
         X3P0nqm/4cMEfx0KlrClvKbM/Br7UFji3TzrxtfCC6Sf9mx1UcopnkK728VVYbQ7l7OX
         STE6EC0EJCt/njfoPJMnCO4ZZfskJpaN+ztgkQ7RBbF0WND7fy88qzn8aFXXW6EvyQ0n
         8HXhyxkVdFJVfOo6DuR/NPDbLrepl6n3wm155kLXN1VajbJvz4Jbtbk6i1DsW+G/WlYx
         m9IiGgWz/pn+oFCfwTzgKhP/zqzUvvajiIth+ab3ZxiZki6c7lvTaDKWuEfwHw0Axw0A
         D6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826546; x=1794431346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irqZ6/3MyiMekC4JKIQxGO3/LPhRZcckOlSBTK+F8dQ=;
        b=hJTL854KJZtD7r+OeivT+4so2kvSe2J2eV0brwNcvEHOGPGcxoq6EtRRAe/G00W+Wf
         Vi+q5nXfolrwCOEqEBKEDXZrb7MPAXGWnXCopPZwbHczRl3TMcngUW56x4JfENDI/eBW
         +5bcVWkCSDOOhXlSimZFS7619Psrp7DCAcvwO4qApvHqt8J0fsDqZtBcGhY0cbkUXgjX
         NRmAHsguDsihMnNj5ZgcB0ynd82/hR/xb5Nfkvy7W3fGf5b8JdumFCSbJWDCmR865foH
         64j7sqpAfEoRrOc+ytP7GteVK8OSkUmhz/wvibCmdqaHy5oZvZPM3xqcZub84OOHlGod
         sDzw==
X-Forwarded-Encrypted: i=1; AKwUvBzyXady2VGZjVhXsUqdQMuZ6iMBtftiihujSbAINn0gtLvEdOcWVWGF0ysse4tr5VHslYBXMOL9dAs6m4/DXyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z1D/HjKKSf/vqny6YlIxA1y2c9A5QWuFRn7SB6464W0jogjSm
	MGBo5JOmDZr79DERXeM12JhPIEnwT/D9wckZb8DujWZwkn5o4xVICQ69
X-Gm-Gg: AYBFou0/8Dba/L9wwWh/HlJSw/HwZCKFte2yOipI2xn8V6Jrlf1eQC42RG0rx45ZguW
	lHL7g5DDsgGI6uXw50JW4g9nxIEG2bsTue4g/G4QzXq4ym/46RfOnB8PdIwArZCfue571Yev+0b
	IWgbcrESZQJVbIeBbqqeSB2DLvBYbpI9yMao+kAtvMunq+m+gtW34Eh/NfoO9zJOwG3FWzx9IIy
	gsTZ8Ibv7nIJNxRhedyK58h9HuZmGY2YQf9xhrhG1A4+iTRF+pTDTYoBeeFdcL2QT7GNHqjmHgA
	c+Gz/hRcOFluw8XeSOLMFF4M4tkl8pmS/U5W6iN8lp7x9lNcG/g7l6ubwDumxkyrXVbl4uWaHXv
	lHaavN3jrDbWMUjK7ZswSUk5bhCEkc7I2xFRrvl0/iHbVpcQ8SzLmJNYYDJq885lBBk/R4xR7nH
	suO/tg0nsLGzwh9NGAbiEK19b6YoJ0wamgawTQ0/ydL8+z8ssRSqlQ7KBz20rszV/5ykgkVMp30
	c8nGVBvmbprWv+RRp1x5YC1EcQzycItFfPxamG/nXuRXO8gpBAAZ/psrmSVaN8Cs1I1KAMLFiZw
	ujrr3HqPKjgrDSexVib3gGtUGM18qa2hPBWcgRrunMd9/XOpVqBNWQ==
X-Received: by 2002:a05:600c:1d07:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ac150b229cmr403893635e9.2.1793826545784;
        Wed, 04 Nov 2026 13:09:05 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm70399275e9.3.2026.11.04.13.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:05 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:53 +0100
Subject: [PATCH v2 07/27] selftests/landlock: Fix the ruleset_fd check in
 empty_or_same_ruleset
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-7-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

ASSERT_LE(-1, ruleset_fd) is always true, so the test does not check
that creating a ruleset with an empty handled_access_fs fails.  Check
for -1 instead.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index f725882fa4a7..7d399c097c93 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -1456,7 +1456,7 @@ TEST_F_FORK(layout1, empty_or_same_ruleset)
 	/* Tests empty handled_access_fs. */
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	ASSERT_LE(-1, ruleset_fd);
+	ASSERT_EQ(-1, ruleset_fd);
 	ASSERT_EQ(ENOMSG, errno);
 
 	/* Enforces policy which denies read access to all files. */

-- 
2.56.0

