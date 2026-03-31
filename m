Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B163E8C75
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 13:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964641; cv=none; b=gGgaUFTB4m1xTKHrCxPa1nkG5jbK5HftlEeSUnf+A1pLh8+ZuMtZI+k4rRj2AvA6fDoJae9AD2L28G+NN9O8hqP2N/h0WPw/LNCogIF26s806CAAzFzdGF6p0ccisBejCMdfqHikyyjxHx8/TYK+gOoyCrJVyMtRkfJJotMdClI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964641; c=relaxed/simple;
	bh=vDHRx5/RTLjvU+iTwg1KIOBbJHh7BzRF7SUP/ABKQTs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b55PgLsZUa62GI8Ne5IrigjqiI1pZXu2SwLx2ekJ/jqiRe4vgBp2u3nQ52RMQ1WDhJb7c8vudIf9Z9PRDXR1ulephgonzO0k/BPJ944ns+lj+t2c6vSwGQeAi/nX4L6iC0QFREe5EtrRmIEtjfy1HBHR8u/86KabxRdAHVBI3Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b=eFa58F9S; arc=none smtp.client-ip=209.85.161.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b="eFa58F9S"
Received: by mail-oo1-f65.google.com with SMTP id 006d021491bc7-67deb70bc76so3159540eaf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20230601.gappssmtp.com; s=20230601; t=1774964635; x=1775569435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oWgQv7KlmU17zr4FSCoT9B9zPEkLI0N3J9fgtUr43qs=;
        b=eFa58F9SHQRnokttdm30Y9chyTtFComcMMO2BNmEpm3fILWBXd0uc7Qum6EqldwEMU
         s+HbjvF5+cYiw1KVd7/Ycr73JMWBOwV2Nkr2/Mh18SGU4fagQ1mD66klOSVqzxMyhCfu
         32rMnN2AunL9eeIKE86+S7lcg8b1zanoANFRxAj2vdTgCFK83A/oiuI76Qpg3fNkcJiy
         E/5QHl08eBxiTT/uRuL+vsGoyKpKMD3JJT7lBPu3nBVYcgslLbLdqgXu/3Y8oNlIbCET
         51BwvxRcw0c5ekwBBQP34l+49eT3RuAcLGfH22QCdOCJqHYtHtoUPJAC134vSzMtU8RF
         w9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774964635; x=1775569435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWgQv7KlmU17zr4FSCoT9B9zPEkLI0N3J9fgtUr43qs=;
        b=cWqcbr7GMPXFtXYwt4PYu3D/+O0yqhAPfKkQpH3qkoCTIWnXFFJ24HwS4KvAJKjqLM
         uzwfZCqYjEeXoueIdD5rPbIGtwoRsdXKtaQ8CkyqxaSokGtRFq59kfeaQ9K9SEDSLk15
         +rEGQmoe0yTk71hEJmjA+0IoZXhkZZZUqFfAVFNplzU1lRFdY7soFVqURxx5qjzE8Ph/
         hQzt+q6tYySp+UIirFF9ePrhnSBR5QVkovdqyJ3O/FmpJsZLmAxgVuaHvCBXeTOxAJFV
         AldzrurhB/dVT33iPZ9RA8TJcB20B0zb2qX2cnzzBq/k2Kp9+N5U3xt9U2Zd8B4iLS8u
         atcg==
X-Forwarded-Encrypted: i=1; AJvYcCVzm0u6mBFUKKoD5y6FiD1DDPCwBd3KSyLAlV6VcmdJWVCa1++nYOTnJdFnozrBZuGjPNofwVLO2eGCHS3/OUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRs1mb0tN3gjJbvoA/B+pC/ZgjXy1Z2fWp656NajhqJFOeQ67q
	+6ZgKMzpH6Z7xvrbBAfnNEkUTqL9Zf22m13xzXg4eGq5iaM5GT89zai1V7V8U2yKukqw89FxrNX
	I9RsVtkfBrBZVoQ+b
X-Gm-Gg: ATEYQzx82o+xPDRFHUs4EQuyep9XTYiyCvQ3zy9n/f65m6DuZngZP2eXL2Hh5QFMDoe
	wjyXvtyocvKODVTgT8CjKUKXq23GaSCdycNWzVZKEZHu0VtHnYD4oM3RmcAbHHsp61Po2meiitO
	ns4rBQqTOB8qsXfo5nDJpkx0NaAVdJagQ2IgzUe27Vd7z+LBf5MN+q1BRJrcS7vwA6WEXttrs+o
	rLza4COCx2vFJwYWjG+hWP0q7ghv3vnpt4X2W72YK0NfPDOnMVppr45/8zwEDQOIW4YnW0BbU1e
	ZsA0M0XxQVRwK5Te5eHFJ3l62O25ykq40pZY1t//93Uau7ReKVCVCGj6zD0KNQ11IY/5nTVHbYn
	mkNSwU3eSuBCSYzfLdiZoJxSt+vUDcPgSWlTnn5+jBxtjDeUAYeoyP0tFYykOmsxzhL3BkPjP/S
	KXdRDWAUuvsaWjDbSJoPVPa4gvEaZOJtcIUxwMWf4yOqOrag9QC5Gm9REIy0BFVIS97kdf0CemS
	R8TgLYlkHtx6hMAsKPN7ffy
X-Received: by 2002:a05:6820:290c:b0:67e:4189:814 with SMTP id 006d021491bc7-67e418910b8mr985500eaf.35.1774964635516;
        Tue, 31 Mar 2026 06:43:55 -0700 (PDT)
Received: from thesius.dot.cyphar.com (2403-5809-a2fc-2-a90-9fd7-aedd-d405.ip6.aussiebb.net. [2403:5809:a2fc:2:a90:9fd7:aedd:d405])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d04d95bcasm7470456fac.17.2026.03.31.06.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:43:55 -0700 (PDT)
From: Aleksa Sarai <aleksa@amutable.com>
Subject: [PATCH 0/3] selftests: openat2: migrate to kselftests harness
Date: Wed, 01 Apr 2026 00:43:30 +1100
Message-Id: <20260401-openat2-selftests-kunit-v1-0-5819ac6cadf5@amutable.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILPy2kC/x3MQQqDMBBG4avIrDugE1DsVcRFqH/qYImSSaUQv
 Luhy2/xXiFDUhg9m0IJp5rusaJ7NPRafXyDdakmaaVvXTfwfiD6LGz4hAzLxts3auZ+dKMP4gA
 ZqNZHQtDf/zzN13UDOLZ5RWkAAAA=
X-Change-ID: 20260317-openat2-selftests-kunit-6939af23ee27
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Aleksa Sarai <aleksa@amutable.com>, Aleksa Sarai <cyphar@cyphar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=aleksa@amutable.com;
 h=from:subject:message-id; bh=vDHRx5/RTLjvU+iTwg1KIOBbJHh7BzRF7SUP/ABKQTs=;
 b=owGbwMvMwCWmMf3Xpe0vXfIZT6slMWSePj95p7rE1N0SqxjPq0+8czemNiZVme/OF9c51skv4
 u5PEz34p2MiC4MYF4OlmCLLNj/P0E3zF19J/rSSDWYOKxPIEGmRBgYGBgYWBr7cxLxSIx0jPVNt
 Qz1DIx0jHSMGLk4BmOqweEaGP+euzVOyS2ZKW5JzRsXQ3H3XIzudU/cnpVrc9C678PBBLMP/+nc
 xd3p6Ehnjd2xQFwlLuCuaZf8n2fHLK5mg7uN3KiZxAQA=
X-Developer-Key: i=aleksa@amutable.com; a=openpgp;
 fpr=C9C370B246B09F6DBCFC744C34401015D1D2D386

These tests were written in the early days of selftests' TAP support,
the more modern kselftest harness is much easier to follow and maintain.
The actual contents of the tests are unchanged by this change.

Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
---
Aleksa Sarai (3):
      selftests: openat2: move helpers to header
      selftests: openat2: switch from custom ARRAY_LEN to ARRAY_SIZE
      selftests: openat2: migrate to kselftest harness

 tools/testing/selftests/openat2/Makefile           |   2 -
 tools/testing/selftests/openat2/helpers.c          | 109 ------
 tools/testing/selftests/openat2/helpers.h          | 164 ++++++---
 tools/testing/selftests/openat2/openat2_test.c     | 223 ++++++-------
 .../testing/selftests/openat2/rename_attack_test.c | 161 +++++----
 tools/testing/selftests/openat2/resolve_test.c     | 368 ++++++++++++---------
 6 files changed, 494 insertions(+), 533 deletions(-)
---
base-commit: 5e4e16d498eccca363db526433803932921dd74f
change-id: 20260317-openat2-selftests-kunit-6939af23ee27


Kind regards,
-- 
Aleksa Sarai
https://www.cyphar.com/

