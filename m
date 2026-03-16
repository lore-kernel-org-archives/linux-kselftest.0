Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7E372EE1
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 23:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773703080; cv=none; b=O/TrXwyEOrv9q+F0BR2R5JncryDeinVul2ufA559DIBV/kI/AoKntafdhJvrniYWJZqA26OADhZVa50FOjojs5rGabADkkZwbjpS/Tmx8K2rR3cnHzyiZEK6KjT6q+7eZW5tB8yaMgNNCdPppGkW4IHLcno3DrHfxrIyGNpFJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773703080; c=relaxed/simple;
	bh=mDiRUybiN8xtO0jNqWej4yQAIVXz7TqBhHezwwwh1DY=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=EBWNnmoWzYbaVw2DRUfXXG0EuYFwlitBGDF1qHP6jLEALSkpd4zfLM7L0on1gqm8e74OxTi+HdGWRx5aNVxrXvI3OsJmJTKcd/+dPkgV4pBbFEVogDyHB24ReNUtrgSNNGLARGlnDaMr+i8oyGNx/VIr2YInKDQXfBLq1YiBMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TeHRdEj2; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TeHRdEj2"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d741f61ee5so4437991a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 16:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773703078; x=1774307878; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=30L93/t/lmDouGWNlwDptRBqNDH2gOiFKuLxcpSjpEQ=;
        b=TeHRdEj2nngMPhc9I//4SseJDuow2nMH3MvTeJM/4NQhwzmHvgdH47r9XR8+DF8Cn0
         ZmEY39sTFkF5LJh/XcksTmfyvebzfDbe7RRYUJqe6EHU+k4gQKsL69y1X7CE+sNcDLL9
         w/9Ug/8p9rJpYhOuELeC8DA9n4MWdT1OMhAcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773703078; x=1774307878;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30L93/t/lmDouGWNlwDptRBqNDH2gOiFKuLxcpSjpEQ=;
        b=rHl3ckuPEniV+H0Zm8KgeZFK6YaLtlVWRbN6c4MVXMugDooVIpiKa/3kvy5dTJM6hz
         M8sPuFtkNzIjYO2rgk8M6WtOD3OWAjm5YcVtjZSFcv+bUzBgyWrc3aWP+YTU7v1GUMxf
         0xvVEEroEIArPaMvv5KZZmlcL/Nnpg1QHgVEMIywtJnhfdD2lr257CNtMGK9OvvdO4kq
         EBHNGV5Er+oW4AoEV+MRzdzU792GPzec2iA0JjNGGDpNASJ52Ukf7+Pnr9gbK1RY7ge6
         EfsvpSnuOja6Ts2cP/KW2GC8UE/kEuiE6EGqSHKHIcQTqkPm7rMzxzsCOMyv6ZWEVCIX
         +guQ==
X-Forwarded-Encrypted: i=1; AJvYcCVav3OhdqJ1RQl63AyfIsFBDyl5Ajvfoy5icz/j0omWyHuXZbzQd8fsw4vvq+I7wlWj2FltI3MjHxqC1oe7uKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+CkPhzYMSdK96WDpl4dm1bPHGIdzJ+zrcztsWcn+KvsTXmZN
	So3Wm4GtKv8MzDzEliX5B6NlxsL3YFEJqDb49kOnMa3f4iiViS4UYwYQef2jNhucwIM9fTexjyY
	Vm92E/qU=
X-Gm-Gg: ATEYQzyexZOyi+dm2hoTHiOLwYkI9f/jH1Q7EDLIMAYqbVTdp/IlQpym6E1/edOT9I1
	/gikJJlQxgaKpPoqJT1fA4WV47Z6ZynG6EYxjsE3PDXQRSjrnlGzYXlCN6KOAtyazZNtNRr4crF
	wGtyq9d8Qoo8HyLl61fsQjIiKHgCd3W/90u2sr7Yeszs4uDlyRZk+k3AalaPPn8r7IEYoKQNsq6
	IlpZjjO+n3HCghK73E85oo3pN3w1wU6zVCb4hT/D0PleR4v4MSOT0soebJgfTKpvQsVmDUzxu0y
	F0EG7VjRSsdKJpKRFbZ3XGkq7a3yZKpk4dd7QzPLHEzgG0ywRRAGkWvlw0jPN/0YGnD55nvf4YC
	N2yKDXG7am4AdIE6Us6JpgNHpGWRDNTxtEM4fLvAVioWr+Mz+GzH3pjgJxfLQNvX0FLGGXBiHg3
	hnsDpOdbimOA7p0a7FYurWpmU98YrZ9OaI44E=
X-Received: by 2002:a05:6830:43ac:b0:7d5:96e7:1509 with SMTP id 46e09a7af769-7d78251c376mr11535437a34.21.1773703077714;
        Mon, 16 Mar 2026 16:17:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e2df1ddsm17678028fac.9.2026.03.16.16.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 16:17:56 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------b7L0B609OUt3qCjnF7nMvRkI"
Message-ID: <359e8d15-726e-4021-8a75-9c2eba0a770e@linuxfoundation.org>
Date: Mon, 16 Mar 2026 17:17:55 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 david@davidgow.net, Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kunit fixes update for Linux 7.0-rc5

This is a multi-part message in MIME format.
--------------b7L0B609OUt3qCjnF7nMvRkI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please this kunit fixes update for Linux 7.0-rc5.

linux_kselftest-kunit-fixes-7.0-rc5

- Adds documentation for --list_suites feature

diff is attached.

thanks,
-- Shuah


----------------------------------------------------------------
The following changes since commit b11b9b6751b2cd74960dccd91667c5117fce743c:

   kunit: reduce stack usage in kunit_run_tests() (2026-03-02 10:11:06 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.0-rc5

for you to fetch changes up to 8b8f1d5e350acdf972b6b02e225d9e14c600f7ad:

   kunit: Add documentation of --list_suites (2026-03-09 10:46:02 -0600)

----------------------------------------------------------------
linux_kselftest-kunit-fixes-7.0-rc5

- Adds documentation for --list_suites feature

----------------------------------------------------------------
Ryota Sakamoto (1):
       kunit: Add documentation of --list_suites

  Documentation/dev-tools/kunit/run_wrapper.rst | 2 ++
  1 file changed, 2 insertions(+)
----------------------------------------------------------------
--------------b7L0B609OUt3qCjnF7nMvRkI
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-kunit-fixes-7.0-rc5.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-kunit-fixes-7.0-rc5.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L3J1bl93cmFwcGVy
LnJzdCBiL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L3J1bl93cmFwcGVyLnJzdApp
bmRleCAzYzBiNTg1ZGNmZmYuLjc3MGJiMDlhNDc1YSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXYtdG9vbHMva3VuaXQvcnVuX3dyYXBwZXIucnN0CisrKyBiL0RvY3VtZW50YXRp
b24vZGV2LXRvb2xzL2t1bml0L3J1bl93cmFwcGVyLnJzdApAQCAtMzM2LDYgKzMzNiw4IEBA
IGNvbW1hbmQgbGluZSBhcmd1bWVudHM6CiAtIGBgLS1saXN0X3Rlc3RzX2F0dHJgYDogSWYg
c2V0LCBsaXN0cyBhbGwgdGVzdHMgdGhhdCB3aWxsIGJlIHJ1biBhbmQgYWxsIG9mIHRoZWly
CiAgIGF0dHJpYnV0ZXMuCiAKKy0gYGAtLWxpc3Rfc3VpdGVzYGA6IElmIHNldCwgbGlzdHMg
YWxsIHN1aXRlcyB0aGF0IHdpbGwgYmUgcnVuLgorCiBDb21tYW5kLWxpbmUgY29tcGxldGlv
bgogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAK

--------------b7L0B609OUt3qCjnF7nMvRkI--
