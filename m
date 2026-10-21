Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613580;
	b=1eiU1QeH1hgazP/OlfIUI5flx59/Vxa8oaDJaX4jbRMOpjK35j60I83pnUPEIMe8emGF
	 83y/xnaM2COQwjUcZqTBHGL1hMYbNK3OdX+Wr5OmcrkoqwjVOqc9unDTHD7jBMUy0hWVH
	 0C0nNJuQCcPfXDeVEdpdkVFyU+iKr6laleG5bc1pJezihREJQNqFA9kPdTtkNBnLwUpnt
	 +8HVIIyv1vji25aJkvWkc4WGgPSqmh7HY3UgiibHAPsDG1DXhplZ8aeOpmZFEMYSNN6UG
	 nx1ve77amfihVkO8FwcgEwt2UnBm0Xh6/f97tQAAXnd9+xmVkxO3HXxPnD2GOFOexJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Content-Language:
	 To:Cc:From:Subject;
	bh=xVFW6jM8P95J8JHTJGGRvHRkVm4betgGVC2wdYsnKmU=;
	b=XyQOUzobIOIqoE2XjZ3X+/M0vcmfbZoSrTU8u1vh1NStqPT3vc6AdjOUWziXWyHL90RB
	 fR5nct5CqJe8PAReHq6GmuEGwgq2IYevfrbeKuA8VhNebwjr/JnSpJDKczPqEQkVMfrfl
	 7oaaQOPJtyZ1bjahwEgzkiGsm0sPxCE9l6dX/ApVGJ5J87MHSNMAF8WIjp3u5cAqM+rDP
	 3U15QSffzDIuQ5EcaTjsQffrLOIiRZKfATitTzGwKvNEFp8RzbdK+6jPkSFR+98+eKARp
	 wvPBJB7AV8qYQZSyRriKErUBtP63jhLIhHLmUG/os3j/H0Td/sfVhL9JRWhnePXJJfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=E4F88Dn3;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D5D606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 20:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D5D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=E4F88Dn3
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-843ea301d60so800527a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 13:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792613578; x=1793218378; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVFW6jM8P95J8JHTJGGRvHRkVm4betgGVC2wdYsnKmU=;
        b=E4F88Dn3JkgX6pHRE2BGYX/OAWLL/yNWF4iB6wUNaKFZWr/YTyeYbIr9ePu1EozkDE
         Zm4lkf7oxG/HAoslNjdJfXx1Ps5m3AHfJPrWsdMC7MjpnFyW4TiLVJwbxvXT63zc3Ir1
         7wv6lcSLcDbS7pIbhwLElf3Rc6jgnIQlmiN5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613578; x=1793218378;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xVFW6jM8P95J8JHTJGGRvHRkVm4betgGVC2wdYsnKmU=;
        b=zYjVxBCc5Qmoy3v/trcpWeRxY1IBB8+ry7AV46niz+Ea2ENGH3VyAQ/cLy4qDvVddK
         LtEyd1YjFifWz1QtSzG+q1F8uyNByv5NyqxLvuB+uDt757vIbJLL3xYc47ZMglnVY5G+
         w4ktcCEWDyrqLYacWEqALSXFbRv4Fq4ru3o8t3D5PX6p8LqrRTjlNbDBgKR7uUv6akaN
         mzVvmM775nH6mASvnBuDSq03KN+D/6ZYshVVPYDhbJlRS1WDEAglLWw9Y5n8xjNLpRq8
         Ei8cnA/H+rlVZgYZd2od7al3VtHKUYwU/4nIUtL4lyx3INOXsQerIeBAN4r01t+NcMx2
         x0mg==
X-Forwarded-Encrypted: i=1; AKwUvBxeeUx+hKad0yed12h4LVMZ2WiTnzdHUb/jPFqBVj/2VwmC/yQm/O3oWlQhyEMNLTiYNj08Cg/Afh4aBzQbOuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhv7bl9uIOmAaTzkxEdvl3rk8TEn3jZdmy2t6AikXK/i4l4lLo
	AJ7G8bSMznwNfLOq35weKMHn/g+0KAIq6gWxiQqTcHWIcqcqwWFCd4mHyjb3gJQTrlw=
X-Gm-Gg: AYBFou1VCiXkz7glYlZBo+SnSFgyAnCT4ONXVsSvUmSdUzChfImczfoIXJO7WGA4rG+
	F6bkEcb8rfL7TJJeR4atSRYp7Sm1pAURLjFf+runlglk3BGMaWQJhth+XhXVATvGLNdXslaXTWa
	I/JMGzFKTRwRKq7HzTPciKRTebU038+aeunR3yGyD7ohtyfBBX+Fvc6S6GJA3i0x916TcSTp4w3
	nDnBseFJYc14A2vhmedGsxMzAu7aCr0cVaAz68/L367MRtNFgtdH8skssp46WthSMUAnYkFtBRi
	Hay+ZIoBITbwxFf9ppxi44gjvvq2hwwQv1Pnv6if6FmAFAOQCs+GONyF3tbhGFRNmmNLD0xWeGO
	cLR3aktQJmWaIxvP7xw/9rOXxX6M6/UOIMTWBq0RQv5gAnjr3ZqHoJ0KfGJVq/9dpu1pQ5ycq9C
	ZElsYQHTkJFNlQbMn8iaP8BbEvTZc08wv6f1//j0c7g2XNS/MBVcjIETLo4qzP0hWT2zIuBiz6p
	4t5nRZT4GzpJkihke4Rulq6N3cYH6CVSVaPEp3XIB0GQoFT3ToSbBTUBHhkB/yuoA==
X-Received: by 2002:a05:6808:d4c:b0:4d6:92b3:5c8b with SMTP id 5614622812f47-5535d4dbdb9mr2097381b6e.65.1792613577939;
        Wed, 21 Oct 2026 13:12:57 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b8ba5107sm2820106b6e.17.2026.10.21.13.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:12:56 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------qggjQZhU0idK0x3lQ4VJK41Y"
Message-ID: <aacd551a-f512-499a-960e-585bce02dd12@linuxfoundation.org>
Date: Wed, 21 Oct 2026 14:12:53 -0600
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kunit next update for Linux 7.4-rc1

This is a multi-part message in MIME format.
--------------qggjQZhU0idK0x3lQ4VJK41Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the kunit next update for Linux 7.4-rc1.

A single fix to kunit_run_all_tests() to return void since callers
don't check the return value and the integer return type is a remnant
from when the function was executed as initcall which is no longer the
case.

- kunit: Return void from kunit_run_all_tests()

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.4-rc1

for you to fetch changes up to e38f53f0482468efd04397f66bda4648b70ac9fa:

   kunit: Return void from kunit_run_all_tests() (2026-09-02 09:19:48 -0600)

----------------------------------------------------------------
linux_kselftest-kunit-7.4-rc1

A single fix to kunit_run_all_tests() to return void since callers
don't check the return value and the integer return type is a remnant
from when the function was executed as initcall which is no longer the
case.

- kunit: Return void from kunit_run_all_tests()

----------------------------------------------------------------
Thomas Weißschuh (1):
       kunit: Return void from kunit_run_all_tests()

  include/kunit/test.h | 5 ++---
  lib/kunit/executor.c | 5 ++---
  2 files changed, 4 insertions(+), 6 deletions(-)
----------------------------------------------------------------
--------------qggjQZhU0idK0x3lQ4VJK41Y
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-kunit-7.4-rc1.diff"
Content-Disposition: attachment; filename="linux_kselftest-kunit-7.4-rc1.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90ZXN0
LmgKaW5kZXggZGE1MzEyZTBkZmE1Li4zMWQ1NDk1NzhmOGUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUva3VuaXQvdGVzdC5oCisrKyBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCkBAIC00MDAsMTEg
KzQwMCwxMCBAQCBzdHJ1Y3Qga3VuaXRfc3VpdGVfc2V0IGt1bml0X21lcmdlX3N1aXRlX3Nl
dHMoc3RydWN0IGt1bml0X3N1aXRlX3NldCBpbml0X3N1aXRlXwogY29uc3Qgdm9pZCAqa3Vu
aXRfYXJyYXlfZ2VuX3BhcmFtcyhzdHJ1Y3Qga3VuaXQgKnRlc3QsIGNvbnN0IHZvaWQgKnBy
ZXYsIGNoYXIgKmRlc2MpOwogCiAjaWYgSVNfQlVJTFRJTihDT05GSUdfS1VOSVQpCi1pbnQg
a3VuaXRfcnVuX2FsbF90ZXN0cyh2b2lkKTsKK3ZvaWQga3VuaXRfcnVuX2FsbF90ZXN0cyh2
b2lkKTsKICNlbHNlCi1zdGF0aWMgaW5saW5lIGludCBrdW5pdF9ydW5fYWxsX3Rlc3RzKHZv
aWQpCitzdGF0aWMgaW5saW5lIHZvaWQga3VuaXRfcnVuX2FsbF90ZXN0cyh2b2lkKQogewot
CXJldHVybiAwOwogfQogI2VuZGlmIC8qIElTX0JVSUxUSU4oQ09ORklHX0tVTklUKSAqLwog
CmRpZmYgLS1naXQgYS9saWIva3VuaXQvZXhlY3V0b3IuYyBiL2xpYi9rdW5pdC9leGVjdXRv
ci5jCmluZGV4IGIwZjhhNDFkNjFkMy4uYzc5OGEwMjQ3MGQ4IDEwMDY0NAotLS0gYS9saWIv
a3VuaXQvZXhlY3V0b3IuYworKysgYi9saWIva3VuaXQvZXhlY3V0b3IuYwpAQCAtMzcxLDcg
KzM3MSw3IEBAIHN0YXRpYyB2b2lkIGt1bml0X2hhbmRsZV9zaHV0ZG93bih2b2lkKQogCiB9
CiAKLWludCBrdW5pdF9ydW5fYWxsX3Rlc3RzKHZvaWQpCit2b2lkIGt1bml0X3J1bl9hbGxf
dGVzdHModm9pZCkKIHsKIAlzdHJ1Y3Qga3VuaXRfc3VpdGVfc2V0IHN1aXRlX3NldCA9IHtO
VUxMLCBOVUxMfTsKIAlzdHJ1Y3Qga3VuaXRfc3VpdGVfc2V0IGZpbHRlcmVkX3N1aXRlX3Nl
dCA9IHtOVUxMLCBOVUxMfTsKQEAgLTM4Miw3ICszODIsNyBAQCBpbnQga3VuaXRfcnVuX2Fs
bF90ZXN0cyh2b2lkKQogCQlfX2t1bml0X3N1aXRlc19zdGFydCwgX19rdW5pdF9zdWl0ZXNf
ZW5kLAogCX07CiAJc2l6ZV90IGluaXRfbnVtX3N1aXRlcyA9IGluaXRfc3VpdGVfc2V0LmVu
ZCAtIGluaXRfc3VpdGVfc2V0LnN0YXJ0OwotCWludCBlcnIgPSAwOworCWludCBlcnI7CiAK
IAlpZiAoaW5pdF9udW1fc3VpdGVzID4gMCkgewogCQlzdWl0ZV9zZXQgPSBrdW5pdF9tZXJn
ZV9zdWl0ZV9zZXRzKGluaXRfc3VpdGVfc2V0LCBub3JtYWxfc3VpdGVfc2V0KTsKQEAgLTQz
Miw3ICs0MzIsNiBAQCBpbnQga3VuaXRfcnVuX2FsbF90ZXN0cyh2b2lkKQogCiBvdXQ6CiAJ
a3VuaXRfaGFuZGxlX3NodXRkb3duKCk7Ci0JcmV0dXJuIGVycjsKIH0KIAogI2lmIElTX0JV
SUxUSU4oQ09ORklHX0tVTklUX1RFU1QpCg==

--------------qggjQZhU0idK0x3lQ4VJK41Y--
