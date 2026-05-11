Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFBF2836A0
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537812; cv=none; b=aFqNq/U80ptP2Hony4gAvFD0/Q7MOPviGAJhUIjTXMsuPOxb3ACLyFuvvNzTdsJqmvcFUE26w6hETi1iw4gCtaRCYj2VZHbuTVj1ZklOiY1QfcHTeuY61vyf9M1PNSkzkvXur3IZBe9E+nMZI6AlVv71LF2Z+GH1jXjflXYZvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537812; c=relaxed/simple;
	bh=nKwjnpnRfs3arldz393K49uc84UgdKIeNM7pkjmmfJA=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=A3ClMjq8adpI3QLFDlLNijS5EsW/c9+EyC48/i4c4XS3MPnMJIUc8qiwu4creIAP95DWx+uSioAbUSoUosrMaoznYggJ4hXgQpj1U5ICrHzoUthR+HepXbhPhXzSRHC7n1HqrFQpzJIkiyLfSbCsIpUySJ2B2pFQWPOklPKE4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S/bhmNd7; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S/bhmNd7"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dca5f64e86so3888076a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778537809; x=1779142609; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o8w3/S5YvVrsCN2pHRxpZQ4XOTh+EBlCYsNYtMZ75kY=;
        b=S/bhmNd7uzV9nMU08/QoT1xHK3/P7KPvKHw8oEGdy+GuAnMeRDHJIn9DJ7/QHyyhVC
         6qEZj4e+f79ndlbEsX0RInQX4Wu8qRMABa4g4ek7v4UHi0Ut79+g1ZBzkkZB19QZc8/5
         1QIPv4qBU6Gk2fHAouxcQCj+xT+z3q9QvNNGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537809; x=1779142609;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8w3/S5YvVrsCN2pHRxpZQ4XOTh+EBlCYsNYtMZ75kY=;
        b=hsmoT+TcOxvZrgAXD3XrTkpLcoPxu1q4h8kIcYM7QbnYgkW8CM19sx/R23VFxad72Y
         d9S4xdyxMMpibDpAy8v/1WSP4xcJMWcbqnUgogD0M6TGzQFsYfXCxmJIikblhouuqiq9
         +JiqycM2IPvcWpQHTXZ+PLKzO++qJOvqhbZsluyZ6x2Lbg84y/PaT69AmbaQvUSHU5X8
         mRjHlUR29h4XUJInXY5w3fOa5rqBV0wCUxuyx5oBhpcTk8dNFF26lKwkORirJHe4PiSG
         /1O5/Bq6swZyjtD1XQ4Oa/E2gGoZUvd6KxPc16ynMk0Ld2Tco3s+A4+XN9SxV0VAMhrM
         dmOg==
X-Forwarded-Encrypted: i=1; AFNElJ8QHd9l2CLuIwuMg+0RPsX36Tgm7Re4qKoTue9Iwu/FATzXZ+fohIgV8LnBmZX+JrtmzXpxpDfGn9T1u1k9pRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3M6bw/uCECJ8nIbJEzPzVVu+Qt+t2GhNRoNc2KsHD4tkqCeRH
	lRx+C5vsE/fde8txlKJVKReKVtBmEuIZW7Auu8IxWY8mI85RS+rejgMR8PYO8NhjwffENO+krop
	LiYOk
X-Gm-Gg: Acq92OFqydTKSoddwcoxUOlPSYiA6PZMV3qfp+LxmPkXqQUKgBu0IgahDrxWTP1c5W8
	BLiHaI/Nsf1bJ2kKfvHYkL1ssxt/sGxeHki6HX+nXK+lDFfRxxYTM+cmrDaskLfFbltje8altma
	4X/Uo4snu4HdkJPDuG4GfDQBBblbpZn2S9sTkLz3D5zOsY033/OkuuspJuQu0pu+FbgEBns3NJO
	QK8/FB/eI6WxPcsbfWUFS9q8Pt3tAEJviJlb+wtAAu/HBTih4JcYXngzdgwLZrnOO3Z9+LEd/kI
	3WUYPD+2LEW9fI2k6EnFIxANoPc8L0oLbuwyDDtt5Zns4QUE7yKR1gQ8ujfDf93odRobPkGqCaa
	SkYN6Z9RdML7Mxv28PzR9EjORDtoKgJo5heGLnoXjlewbbEzQY57BUmeg+Zjeumz2tPlmG8TfbO
	b6Mh2KLy1HVdlpX657h/CLAn1vfevQBEs=
X-Received: by 2002:a05:6830:6a93:b0:7dc:d2ad:fb17 with SMTP id 46e09a7af769-7e1df107bc1mr15883202a34.20.1778537809440;
        Mon, 11 May 2026 15:16:49 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d4fe15sm7717724a34.18.2026.05.11.15.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 15:16:48 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------zoTvuWpxOtvlrg80mHF0CFD5"
Message-ID: <ff508236-2150-489c-a815-66961074fc60@linuxfoundation.org>
Date: Mon, 11 May 2026 16:16:47 -0600
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
 David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kunit fixes update for Linux 7.1-rc4

This is a multi-part message in MIME format.
--------------zoTvuWpxOtvlrg80mHF0CFD5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull this kunit fixes update for Linux 7.1-rc4

Fix to decouple KUNIT_DEBUGFS and KUNIT_ALL_TESTS options and fix
KUNIT_DEBUGFS dependencies so it depends on DEBUG_FS without which
it will not be useful.

diff is attached.

thanks.
-- Shuah

----------------------------------------------------------------
The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.1-rc4

for you to fetch changes up to 8f80b5b227ef9ea422080487715c841856339aed:

   kunit: config: KUNIT_DEBUGFS should depend on DEBUG_FS (2026-05-04 12:10:40 -0600)

----------------------------------------------------------------
linux_kselftest-kunit-fixes-7.1-rc4

Fix to decouple KUNIT_DEBUGFS and KUNIT_ALL_TESTS options and fix
KUNIT_DEBUGFS dependencies so it depends on DEBUG_FS without which
it will not be useful.

----------------------------------------------------------------
David Gow (2):
       kunit: config: Enable KUNIT_DEBUGFS by default
       kunit: config: KUNIT_DEBUGFS should depend on DEBUG_FS

  lib/kunit/Kconfig | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
----------------------------------------------------------------
--------------zoTvuWpxOtvlrg80mHF0CFD5
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-kunit-fixes-7.1-rc4.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-kunit-fixes-7.1-rc4.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2xpYi9rdW5pdC9LY29uZmlnIGIvbGliL2t1bml0L0tjb25maWcKaW5k
ZXggNDk4Y2M1MWU0OTNkLi45NGZmOGU0MDg5YmYgMTAwNjQ0Ci0tLSBhL2xpYi9rdW5pdC9L
Y29uZmlnCisrKyBiL2xpYi9rdW5pdC9LY29uZmlnCkBAIC0xNiw4ICsxNiw5IEBAIG1lbnVj
b25maWcgS1VOSVQKIGlmIEtVTklUCiAKIGNvbmZpZyBLVU5JVF9ERUJVR0ZTCi0JYm9vbCAi
S1VuaXQgLSBFbmFibGUgL3N5cy9rZXJuZWwvZGVidWcva3VuaXQgZGVidWdmcyByZXByZXNl
bnRhdGlvbiIgaWYgIUtVTklUX0FMTF9URVNUUwotCWRlZmF1bHQgS1VOSVRfQUxMX1RFU1RT
CisJYm9vbCAiS1VuaXQgLSBFbmFibGUgL3N5cy9rZXJuZWwvZGVidWcva3VuaXQgZGVidWdm
cyByZXByZXNlbnRhdGlvbiIKKwlkZXBlbmRzIG9uIERFQlVHX0ZTCisJZGVmYXVsdCB5CiAJ
aGVscAogCSAgRW5hYmxlIGRlYnVnZnMgcmVwcmVzZW50YXRpb24gZm9yIGt1bml0LiAgQ3Vy
cmVudGx5IHRoaXMgY29uc2lzdHMKIAkgIG9mIC9zeXMva2VybmVsL2RlYnVnL2t1bml0Lzx0
ZXN0X3N1aXRlPi9yZXN1bHRzIGZpbGVzIGZvciBlYWNoCg==

--------------zoTvuWpxOtvlrg80mHF0CFD5--
