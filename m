Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3655190462
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 20:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999563; cv=none; b=U1+ij6aufORBk3siLG8k/5yahRB9wcqrsdIUCipVdPs7zpXabXnF5yv2DWt3ObWq4zKTBaBzPTD/x1VFQQHagVqXyl52FYr2INEyAQtZNqhYiFs7b0HHMNowyzr3ndAFi4MM9hthQMr31Cih8H/3DwkSLjYLJYedyr1xamEy030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999563; c=relaxed/simple;
	bh=dAgJUep9B6gimO71jLMRfbSQ2vAWIi0cjxKDAfG7EBQ=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=TreO+Ebw9D1YBDgs6ds+7Lt/8Nl4AJ/PySmroGHnQQiUnMsmQzkzSiGiZvGfqTJIfEHCEIwhW2rzWavYOzww+k8jQO1uXlYprL5KGFTwrlfLOrboqlAhlF8cWoE2Xtjw9FMJ8sfuXarH/35xzXCCZOOFkr7wKz2i9o6bfd65g7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=byJoKGt4; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="byJoKGt4"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a46a53abc9so2188304b6e.3
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786999560; x=1787604360; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CSZQA9P4iQCNyOU/MeXvG8oWGBH6B5SwPxFZoLwFTU=;
        b=byJoKGt4lo1jDsw6QQszyGHrwzMYmmHSU5Nati4aPboYT8PvnHY8OTbhFfAJRBFrfN
         wz2tf6uqVHHW9qNUl4znevFOgYM63L17k12uQmRHqR3c9uUIXtKpfJRoFzSteW7zYbv2
         u/j/Aif+kVEnqCmG8JBrf7yYOUGufr4tmEsgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786999560; x=1787604360;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+CSZQA9P4iQCNyOU/MeXvG8oWGBH6B5SwPxFZoLwFTU=;
        b=ieXj4klncJeXGeXW5EkvzaC9hMjNloofSxzCl4nGycQy+VQjbtHajOUCDpKXYksqLl
         2plUObXxBVuaJp9fJg3/tQB9jmVSg7kGYcSE9dxgoHJHuZ4Fq89Wr9OQICsB/wzcDZnI
         vTWJe41/yKCimmlKIoddVzPcrcom8p7fUi35z6CmM92FZ+d5euABYaFQ+elMrqtEPX7q
         S41u9rkHyWJXp4y+LYrOiSIQslKfU8pgZkEucTjhknO+0rYG2Nb8kQTF6eU41uyyJ8Dz
         8DXSuz8FE3LJ0itFvXFliTLeXJhe6t8V+g+18lwoj60i+RKcn/IMufzOM9NITgCt4umE
         NJ9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqWkKJtxrRXBcBV+6KO53ONqIducizDMwPGySMrsmDBsccic6Lb+GD6lIUAdhpJ9Hh3SHSSRwtQH6ZPBtDuT68=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4X9icI12rCpCr58wPvPyGEMAEwaAObPInmFnCn+f9YclbRBm
	LOFGRVNxOi4lHdph0AlbCqE8XHfn25+x2JfC55qpexR+fT9BDqUVSZVKPnaT7rac6YzZ5UWBUzl
	exkzo4lk=
X-Gm-Gg: AR+sD13qghnKk0NO7zIWo9TinQa0hvfFeCAUHqHhEtrcLCPYGy4nx1GPzgmCb/Kbq4r
	9mjWTMsagIRtNWShv/BQw4HHRwrhGeox1bDe49dRQbD45gvXGG8Kx0lVYIxX6O/O2Z0HnFzM8Yi
	tX7JbtXg0r6v4dRmij8VaZfA0HnCpvoSURTfMSznpSQNn7JNCDydB88uvvASQpFSPpuOBaQQUNh
	OQuVEzwcINXlp5Dp3G0wQhg7Yuzy4pl9gc7odTPxc/g4Z3F8sqtKzQsnV4AMVVyslMO+KGdgInZ
	tYoSJNZKBXw7M75n+XMTJ1/YbHO1I12sBRuDO9mCqdy9B0WL7CechIH13eG4aktOH/1HGQSm/0P
	Ew+lq32g8AQtS+fgOvYLrmaMmB1MR6TJYvqKq6bY9F1xufyNTRiWrx0YOJyfswznDv9a5qpUyMs
	d82xiEQ6i/hzKbPrSfyut5Jj3RQCynix5tsWIs1xC6UQ/QjyUlRwh52XsnOB4Mvd8Dut4UPA==
X-Received: by 2002:a05:6808:a60f:10b0:4b2:c80:e01b with SMTP id 5614622812f47-4b252208f0dmr17553727b6e.14.1786999559786;
        Mon, 17 Aug 2026 13:45:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2960dfc9bsm1325941b6e.14.2026.08.17.13.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 13:45:58 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------qhJ7AEllHBNasUEyESjDQB6T"
Message-ID: <a5c7d1a5-46b3-4bca-9b5e-96355591b6b2@linuxfoundation.org>
Date: Mon, 17 Aug 2026 14:45:56 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kselftest update for Linux 7.3-rc1

This is a multi-part message in MIME format.
--------------qhJ7AEllHBNasUEyESjDQB6T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the kselftest update for Linux 7.3-rc1.

Fixes zram test failure in kernel_gte() when using dash and a spelling
error in ftrace poll test comment.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.3-rc1

for you to fetch changes up to 649ba27dfac784427a01f9c95c09ecbcb88900d8:

   selftests/zram: fix kernel_gte() for POSIX sh (2026-07-30 07:55:37 -0600)

----------------------------------------------------------------
linux_kselftest-next-7.3-rc1

Fixes zram test failure in kernel_gte() when using dash and a spelling
error in ftrace poll test comment.

----------------------------------------------------------------
Cheng-Han Wu (1):
       selftests/zram: fix kernel_gte() for POSIX sh

Wang Yan (1):
       selftests/ftrace: fix spelling error in poll test comment

  tools/testing/selftests/ftrace/poll.c    | 2 +-
  tools/testing/selftests/zram/zram_lib.sh | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

----------------------------------------------------------------
--------------qhJ7AEllHBNasUEyESjDQB6T
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-next-7.3-rc1.diff"
Content-Disposition: attachment; filename="linux_kselftest-next-7.3-rc1.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS9wb2xsLmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdHJhY2UvcG9sbC5jCmluZGV4IDUzMjU4Zjc1MTVl
Ny4uNGRhODZhMjBkYzg1IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9m
dHJhY2UvcG9sbC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS9wb2xs
LmMKQEAgLTY2LDcgKzY2LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkK
IAl9CiAJY2xvc2UocGZkLmZkKTsKIAotCS8qIElmIHRpbWVvdXQgaGFwcG5lZCAocmV0ID09
IDApLCBleGl0IGNvZGUgaXMgMSAqLworCS8qIElmIHRpbWVvdXQgaGFwcGVuZWQgKHJldCA9
PSAwKSwgZXhpdCBjb2RlIGlzIDEgKi8KIAlpZiAocmV0ID09IDApCiAJCXJldHVybiAxOwog
CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy96cmFtL3pyYW1fbGliLnNo
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvenJhbS96cmFtX2xpYi5zaAppbmRleCAyMWVj
MTk2NmRlNzYuLjBkNDRkODM4ODhmOSAxMDA3NTUKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvenJhbS96cmFtX2xpYi5zaAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy96
cmFtL3pyYW1fbGliLnNoCkBAIC0zNyw3ICszNyw3IEBAIGtlcm5lbF9ndGUoKQogCiAJaWYg
WyAka2VybmVsX21ham9yIC1ndCAkbWFqb3IgXTsgdGhlbgogCQlyZXR1cm4gMAotCWVsaWYg
W1sgJGtlcm5lbF9tYWpvciAtZXEgJG1ham9yICYmICRrZXJuZWxfbWlub3IgLWdlICRtaW5v
ciBdXTsgdGhlbgorCWVsaWYgWyAka2VybmVsX21ham9yIC1lcSAkbWFqb3IgXSAmJiBbICRr
ZXJuZWxfbWlub3IgLWdlICRtaW5vciBdOyB0aGVuCiAJCXJldHVybiAwCiAJZmkKIAo=

--------------qhJ7AEllHBNasUEyESjDQB6T--
