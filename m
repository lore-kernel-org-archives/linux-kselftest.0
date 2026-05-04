Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33C931716B
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927071; cv=none; b=icsCrER5OPOp0buYsQzSzyIowhf8ZEsCwuIp58JGPvUQIOfvSWzrUwr1s9S2fWXDS0FpKExARsS9q2yZa0vUp4xBMtjU3JyMBRP7MHeQXvoTTOShCTBJCZ/7m1+9U9+NUPwoyRLsshkuVSTrxWhCytqHQ1APG2vC57Jpq+07cv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927071; c=relaxed/simple;
	bh=BHm33vBVhx38DDJ86+NPN+i7xa6O0H9imAJIPvc6I3U=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=poYhCBMaBCljXYPeHRC8DGUA6/aqnxKuP5BZ50FhVKg5wBNVZtrgnLYSgXWz01EnwlCDN1q4kU9FelC+gkruVBbqgLf5ZKCGY+s6kSwHBlFRGLozf37lbigwvn92EjgTpmogES/yCeuXMN8sFRz2aR04Dv27Yb2MpV6IURJDMmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZfwjzbxH; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZfwjzbxH"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dbe437b072so2885054a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777927069; x=1778531869; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n/VqqbM6LAjsNupD2fDLdZRgroatWR9sWaJ0KWP/Bhs=;
        b=ZfwjzbxHYAaPs0erT90nQEyPbZEOAn+tGhPJFF5onZERwYaRW3bfaRPollwdnMo5VP
         CwPgeWvzAPLMD5xA4kZfPpTvPYQ92Q83LGcCGkdHAPFMVlBGIIeOyuIqxklssbmbGPmb
         IZhmAsXWFRC8xRTcdb6VDs2FB5MRbppNfAa8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927069; x=1778531869;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/VqqbM6LAjsNupD2fDLdZRgroatWR9sWaJ0KWP/Bhs=;
        b=m7pKuyyNXgnDj7/ZYwa3+Tn6TCrY/HZiJokt5UsOP1pdDJO1obWEFCNgCwZ+IiDMVV
         KF9fefmCQdp+04H2V4RbTlcllEwTPKtiho0AM6LayxXGubP8V29Egvrc22w2R9fT+WtX
         4RPz3MzuI4TqJIcXMLhEtWKBxinS09W9FNo4J10oyi3LnGF0VI4gWuW82TNJgVUOlHEG
         63wGN5Bsc7Z/XUuYsI+H0FXZoHTQcBBQ72t4F+CRNloJb0cOhTNmSwXyIWJoBJ0P+OLn
         EMcVscDSvugS7ab2XF21P5j818bVC5zLwcZi64ZZpenntOygg7p7Oi4HlRpsf3GJz6Yu
         vJPA==
X-Forwarded-Encrypted: i=1; AFNElJ+AR/phLBomo9oi2N/o48NXvWFMWuIVqZCYub2y1/6ttZslda295Wv3q2feI/pXFdUfIfjN2Jp+qrsoh66964Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfn/6eK243tNu/BgtDAOb02S+f1ZCSAd3ue+6IXl/0zpNDGHHm
	aaISp41VcxMtrep9/UuVQtSb5xrAZC9spvGxVJQoMYag2oR2X0Yz30IpErfyXTtJiI8=
X-Gm-Gg: AeBDieuNZ6OFoY1mj6r412JVvy/M/Bo6FKic9qWsjJev5Ia7kYmEx+2BsEDHHh8fq4J
	cpeceLMsiX61QLRdF3jIRZcoF94jtDjjLpxZrDaJwhYxAW5fW7E1Q78pxz6+2oodF/2TladPMv5
	nkdXAjI5paS6E94HDTSNp2TvX0Xsy/TksV6BglcxO/Bd0kfpeEvg9Gm7gSoA34DjRDZ9hxfZhx2
	e81GLzOh87bkP1LP0JSccBI4f82Uswys0mhyLzLShrqT7eNnK4pLqHwOj5dywIApSxisl5CFVhE
	UpDdHeRMzmzW6SEJN/GD92bOkkAo7+EUuEwQr/36QwLy2NIMO/5IOrF64ibgYzapkg6FTfx8PKz
	JH0yDgcoeS3ykfF60faWzwyySg5/K/ygzKd1Q8/ShLlE0yECfxDpIo2pvHgIikmbHjrHVAaAM59
	7vtadAFB/MKS1De5BllKmeKnIXWiZ7z44G5uMx1M5vog==
X-Received: by 2002:a05:6820:2008:b0:696:6440:9e2a with SMTP id 006d021491bc7-6998d21c0b8mr89300eaf.29.1777927068888;
        Mon, 04 May 2026 13:37:48 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-434ca5af84csm1538510fac.12.2026.05.04.13.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 13:37:48 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------l5lYAcocEWV6dTrk8DTnmPuJ"
Message-ID: <654e6402-f4c4-4152-af74-6da4bc755ddc@linuxfoundation.org>
Date: Mon, 4 May 2026 14:37:47 -0600
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
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kselftest fixes update for Linux 7.1-rc3

This is a multi-part message in MIME format.
--------------l5lYAcocEWV6dTrk8DTnmPuJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the kselftest fixes update for Linux 7.1-rc3.

Fixes extra test number increment in ksft_exit_skip() that results in
incorrect KTAP result.

Fixes regression introduced by addition of explicit constructor orders
for fixture tests. This addition broke the ordering of those relative to
non-fixture tests and the reverse-constructor-order detection.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.1-rc3

for you to fetch changes up to 465b05bae5ac553c13315681c1490dc565337771:

   selftests: harness: Restore order of test functions (2026-04-27 10:48:35 -0600)

----------------------------------------------------------------
linux_kselftest-fixes-7.1-rc3

Fixes extra test number increment in ksft_exit_skip() that results in
incorrect KTAP result.

Fixes regression introduced by addition of explicit constructor orders
for fixture tests. This addition broke the ordering of those relative to
non-fixture tests and the reverse-constructor-order detection.

----------------------------------------------------------------
Sarthak Sharma (1):
       selftests: kselftest: fix wrong test number in ksft_exit_skip

Thomas Weißschuh (1):
       selftests: harness: Restore order of test functions

  tools/testing/selftests/kselftest.h         |  2 +-
  tools/testing/selftests/kselftest_harness.h | 12 ++++++------
  2 files changed, 7 insertions(+), 7 deletions(-)

----------------------------------------------------------------
--------------l5lYAcocEWV6dTrk8DTnmPuJ
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-fixes-7.1-rc3.diff"
Content-Disposition: attachment; filename="linux_kselftest-fixes-7.1-rc3.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tzZWxmdGVzdC5oIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0LmgKaW5kZXggNmQ4MDlmMDhhYjdiLi42
MDgzOGI2MWEyZGEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tzZWxm
dGVzdC5oCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tzZWxmdGVzdC5oCkBAIC00
NTAsNyArNDUwLDcgQEAgc3RhdGljIGlubGluZSBfX25vcmV0dXJuIF9fcHJpbnRmKDEsIDIp
IHZvaWQga3NmdF9leGl0X3NraXAoY29uc3QgY2hhciAqbXNnLCAuLi4KIAkgKi8KIAlpZiAo
a3NmdF9wbGFuIHx8IGtzZnRfdGVzdF9udW0oKSkgewogCQlrc2Z0X2NudC5rc2Z0X3hza2lw
Kys7Ci0JCXByaW50Zigib2sgJXUgIyBTS0lQICIsIDEgKyBrc2Z0X3Rlc3RfbnVtKCkpOwor
CQlwcmludGYoIm9rICV1ICMgU0tJUCAiLCBrc2Z0X3Rlc3RfbnVtKCkpOwogCX0gZWxzZSB7
CiAJCXByaW50ZigiMS4uMCAjIFNLSVAgIik7CiAJfQpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0X2hhcm5lc3MuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2tzZWxmdGVzdF9oYXJuZXNzLmgKaW5kZXggNzVmYjAxNmNkMTkwLi5jZmRjZTlj
ZDI1MmUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tzZWxmdGVzdF9o
YXJuZXNzLmgKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0X2hhcm5l
c3MuaApAQCAtNzYsNyArNzYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19rc2VsZnRlc3Rf
bWVtc2V0X3NhZmUodm9pZCAqcywgaW50IGMsIHNpemVfdCBuKQogCQltZW1zZXQocywgYywg
bik7CiB9CiAKLSNkZWZpbmUgS1NFTEZURVNUX1BSSU9fVEVTVF9GICAyMDAwMAorI2RlZmlu
ZSBLU0VMRlRFU1RfUFJJT19URVNUICAgIDIwMDAwCiAjZGVmaW5lIEtTRUxGVEVTVF9QUklP
X1hGQUlMICAgMjAwMDEKIAogI2RlZmluZSBURVNUX1RJTUVPVVRfREVGQVVMVCAzMApAQCAt
MTk0LDcgKzE5NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2tzZWxmdGVzdF9tZW1zZXRf
c2FmZSh2b2lkICpzLCBpbnQgYywgc2l6ZV90IG4pCiAJCSAgLmZpeHR1cmUgPSAmX2ZpeHR1
cmVfZ2xvYmFsLCBcCiAJCSAgLnRlcm1zaWcgPSBfc2lnbmFsLCBcCiAJCSAgLnRpbWVvdXQg
PSBURVNUX1RJTUVPVVRfREVGQVVMVCwgfTsgXAotCXN0YXRpYyB2b2lkIF9fYXR0cmlidXRl
X18oKGNvbnN0cnVjdG9yKSkgX3JlZ2lzdGVyXyMjdGVzdF9uYW1lKHZvaWQpIFwKKwlzdGF0
aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChjb25zdHJ1Y3RvcihLU0VMRlRFU1RfUFJJT19URVNU
KSkpIF9yZWdpc3Rlcl8jI3Rlc3RfbmFtZSh2b2lkKSBcCiAJeyBcCiAJCV9fcmVnaXN0ZXJf
dGVzdCgmXyMjdGVzdF9uYW1lIyNfb2JqZWN0KTsgXAogCX0gXApAQCAtMjM4LDcgKzIzOCw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2tzZWxmdGVzdF9tZW1zZXRfc2FmZSh2b2lkICpz
LCBpbnQgYywgc2l6ZV90IG4pCiAJRklYVFVSRV9WQVJJQU5UKGZpeHR1cmVfbmFtZSk7IFwK
IAlzdGF0aWMgc3RydWN0IF9fZml4dHVyZV9tZXRhZGF0YSBfIyNmaXh0dXJlX25hbWUjI19m
aXh0dXJlX29iamVjdCA9IFwKIAkJeyAubmFtZSA9ICAjZml4dHVyZV9uYW1lLCB9OyBcCi0J
c3RhdGljIHZvaWQgX19hdHRyaWJ1dGVfXygoY29uc3RydWN0b3IpKSBcCisJc3RhdGljIHZv
aWQgX19hdHRyaWJ1dGVfXygoY29uc3RydWN0b3IoS1NFTEZURVNUX1BSSU9fVEVTVCkpKSBc
CiAJX3JlZ2lzdGVyXyMjZml4dHVyZV9uYW1lIyNfZGF0YSh2b2lkKSBcCiAJeyBcCiAJCV9f
cmVnaXN0ZXJfZml4dHVyZSgmXyMjZml4dHVyZV9uYW1lIyNfZml4dHVyZV9vYmplY3QpOyBc
CkBAIC0zNjQsNyArMzY0LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fa3NlbGZ0ZXN0X21l
bXNldF9zYWZlKHZvaWQgKnMsIGludCBjLCBzaXplX3QgbikKIAkJXyMjZml4dHVyZV9uYW1l
IyNfIyN2YXJpYW50X25hbWUjI19vYmplY3QgPSBcCiAJCXsgLm5hbWUgPSAjdmFyaWFudF9u
YW1lLCBcCiAJCSAgLmRhdGEgPSAmXyMjZml4dHVyZV9uYW1lIyNfIyN2YXJpYW50X25hbWUj
I192YXJpYW50fTsgXAotCXN0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18oKGNvbnN0cnVjdG9y
KSkgXAorCXN0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18oKGNvbnN0cnVjdG9yKEtTRUxGVEVT
VF9QUklPX1RFU1QpKSkgXAogCQlfcmVnaXN0ZXJfIyNmaXh0dXJlX25hbWUjI18jI3Zhcmlh
bnRfbmFtZSh2b2lkKSBcCiAJeyBcCiAJCV9fcmVnaXN0ZXJfZml4dHVyZV92YXJpYW50KCZf
IyNmaXh0dXJlX25hbWUjI19maXh0dXJlX29iamVjdCwgXApAQCAtNDY4LDcgKzQ2OCw3IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBfX2tzZWxmdGVzdF9tZW1zZXRfc2FmZSh2b2lkICpzLCBp
bnQgYywgc2l6ZV90IG4pCiAJCQlmaXh0dXJlX25hbWUjI190ZWFyZG93bihfbWV0YWRhdGEs
IHNlbGYsIHZhcmlhbnQpOyBcCiAJfSBcCiAJc3RhdGljIHN0cnVjdCBfX3Rlc3RfbWV0YWRh
dGEgKl8jI2ZpeHR1cmVfbmFtZSMjXyMjdGVzdF9uYW1lIyNfb2JqZWN0OyBcCi0Jc3RhdGlj
IHZvaWQgX19hdHRyaWJ1dGVfXygoY29uc3RydWN0b3IoS1NFTEZURVNUX1BSSU9fVEVTVF9G
KSkpIFwKKwlzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChjb25zdHJ1Y3RvcihLU0VMRlRF
U1RfUFJJT19URVNUKSkpIFwKIAkJCV9yZWdpc3Rlcl8jI2ZpeHR1cmVfbmFtZSMjXyMjdGVz
dF9uYW1lKHZvaWQpIFwKIAl7IFwKIAkJc3RydWN0IF9fdGVzdF9tZXRhZGF0YSAqb2JqZWN0
ID0gbW1hcChOVUxMLCBzaXplb2YoKm9iamVjdCksIFwKQEAgLTEzMjMsNyArMTMyMyw3IEBA
IHN0YXRpYyBpbnQgdGVzdF9oYXJuZXNzX3J1bihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJ
cmV0dXJuIEtTRlRfRkFJTDsKIH0KIAotc3RhdGljIHZvaWQgX19hdHRyaWJ1dGVfXygoY29u
c3RydWN0b3IpKSBfX2NvbnN0cnVjdG9yX29yZGVyX2ZpcnN0KHZvaWQpCitzdGF0aWMgdm9p
ZCBfX2F0dHJpYnV0ZV9fKChjb25zdHJ1Y3RvcihLU0VMRlRFU1RfUFJJT19URVNUKSkpIF9f
Y29uc3RydWN0b3Jfb3JkZXJfZmlyc3Qodm9pZCkKIHsKIAlfX2NvbnN0cnVjdG9yX29yZGVy
X2ZvcndhcmQgPSB0cnVlOwogfQo=

--------------l5lYAcocEWV6dTrk8DTnmPuJ--
