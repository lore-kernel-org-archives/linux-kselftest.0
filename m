Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B89DDF76
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 22:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784156170; cv=none; b=q0DmgQdrAbhVlwjsjmRIQ1kj3OySXg9Kq/Ig+Qx3yyfuy3t4iIpnEvguDFHaS0r44nVYXqDr1whCd7DYB5u0iVQbjwkg2t3XQ+ARmO7MuGaVjRIuwrZ/8CrI14TnAjIH/fEPb5XI2Mk1kFzVV1ThXJxZFhMFLAZCxz9Of946Sug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784156170; c=relaxed/simple;
	bh=UBlfDsYNOya0DmR/NQDysciqWWl95dJFw0BTTqX4MX8=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=GSxkSHQlRm88EIOf9xW91XBdH+HuDgh/6onXBSvnMBAkQAptgrkflj1zLAevWnPiYo+G7KEs7ASga7+JgDHQ5O/q7fOqOjTBFi9IFtk683zR/psM39IA0BCvphUF6+Mrhb7cMzvSywK12Z05VY7ZTC652tPvE6jfXCvLZBM8iMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EuNWa02c; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EuNWa02c"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44aeefa1c00so15424fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 15:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784156166; x=1784760966; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPLuMuxpWYcjfZkIUJAamd8dt+XaeF6Gjn4JNYYGsgI=;
        b=EuNWa02cSTGSnXNPhFI1ffjXtxRXdR6G4Qem/qEWx/cd9FMImtG8sBiXAQeMBFK3/q
         v9O5TCf1dAwG4iGzoahy3rgCpQkb6U4zV+2NwF1uscz17H97v/2CV8SO0OHCaLS2W0vs
         jPzWPpBqh/U6iJN9TSI4J9z+KuK/VpG21i8K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784156166; x=1784760966;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BPLuMuxpWYcjfZkIUJAamd8dt+XaeF6Gjn4JNYYGsgI=;
        b=cgshIQYANrkwUGxYfAw8g+/YAsuxjbszEZQpfLvooQOtNPDQFNnBBRJQQJbX0XU/Qk
         E9Scj6FrimoCsNSnUZ8ims6LmB5tYF72ZBpp10Q2yKisWLggs5EZsDT8VhUh+vKRJBYA
         3ZLL8X6Pzfcvz9bgtJ7YDPr14cfnUGJ+ksQA23/bp1/bV7eHVKLoe4pjzWdxNU22L/KM
         ahQeGZxiR+fXlOTnAbVcPZ5xXScydOIlM220Aeg37AIbj2osxadei7N+UyxTaWqrok+q
         n07VC5oyeCb4mbPaR4JAfUGQxpRvR6jw3P/YgUcCDC1NkFeAz7aC8/e9sM6d4Hp3lCvo
         j8+g==
X-Forwarded-Encrypted: i=1; AHgh+RoT6CA+7IR6uakmeqnetz4irRwYlfj+3oRicCC/qeMG0f4Nd7ktljQcXip4ine+Gd82YfdoZSyojP97qMQtp94=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxyOYJuZ5YybR63csiTsGZ2DuifNzUf91RpdXY8q7zK5UwpFHj
	JuCgaJzUBksacYafF1vJoVe3hVjYw0jUv/WyKf3PgqrRiElLGzfPzE1UKct4jcdaxnk=
X-Gm-Gg: AfdE7cmB4S6CEsVVGDefcpK/JO7sMNg2NPCp6jG8vUZUpF1u3HO588hzsu3g2nvDuyD
	JQBkQIDasdVBtwgZqZyZtS5LhbIzAr+T4gVVZjv5O+k70RDw4QBcq2hWzXP+XzzpmNdEEra0yhD
	GjZmbT1PtkTx/CfHu/IxgUafafur0zOVUZ4uLyqKWta1ot6Vc2nu9v7Y1Dx4Ac8zHp2Izxj4T3/
	H4XpkaRdCk+g/bzdSOba3zWZnVrYe3BS/w57BLoom6nc8M6ADyf2PR9yXoq3oMQfuwYQqu37J2f
	dwx39//cHRRzA2WzAQn9YcrRfZx674Fmoj03Js1yL4TJm16mp2tut+SvOJDvoWl9HWuOhAgQSYe
	SHytN9lYwvSgzJgOtfJ6dC8aK+QreRnxKGF2EugVepeV1E/zfiWBE3MLKrFDA3VaiVlpEqzNmQN
	G6oiQlbq89oHL1Yz8CiRVbkw==
X-Received: by 2002:a05:6871:7501:b0:430:16b5:909 with SMTP id 586e51a60fabf-45660f8e6d5mr65375fac.15.1784156166125;
        Wed, 15 Jul 2026 15:56:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916d5cebsm20934897fac.15.2026.07.15.15.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 15:56:05 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------UHFIRoAQ0VjesPfB4ET10Qrh"
Message-ID: <362433e5-8281-4fcc-9d85-09f75a7d97a8@linuxfoundation.org>
Date: Wed, 15 Jul 2026 16:56:04 -0600
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
 David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kunit fixes update for Linux 7.2-rc4

This is a multi-part message in MIME format.
--------------UHFIRoAQ0VjesPfB4ET10Qrh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the kunit fixes update for Linux 7.2-rc4.

Fixes warning suppressions with kunit built as module:

CONFIG_KUNIT is a tristate symbol but the warning suppression code in
lib/bug.c is only built if it's built-in due to it using a plain #ifdef,
rendering warning suppressions broken for kunit build as loadable module.

kunit_is_suppressed_warning() already has a stub for when kunit is
disabled so drop that guard entirely.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.2-rc4

for you to fetch changes up to 5142c56651578abc346d6c17f3fb919b9ffbb317:

   bug: fix warning suppressions with kunit built as module (2026-07-10 10:26:58 -0600)

----------------------------------------------------------------

linux_kselftest-kunit-fixes-7.2-rc4

Fixes warning suppressions with kunit built as module:

CONFIG_KUNIT is a tristate symbol but the warning suppression code in
lib/bug.c is only built if it's built-in due to it using a plain #ifdef,
rendering warning suppressions broken for kunit build as loadable module.

kunit_is_suppressed_warning() already has a stub for when kunit is
disabled so drop that guard entirely.

----------------------------------------------------------------
Bartosz Golaszewski (1):
       bug: fix warning suppressions with kunit built as module

  lib/bug.c | 2 --
  1 file changed, 2 deletions(-)

----------------------------------------------------------------
--------------UHFIRoAQ0VjesPfB4ET10Qrh
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-kunit-fixes-7.2-rc4.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-kunit-fixes-7.2-rc4.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2xpYi9idWcuYyBiL2xpYi9idWcuYwppbmRleCAyOTI0MjBmNDU4MTEu
LjdjMWMyYzI3ZjU4ZSAxMDA2NDQKLS0tIGEvbGliL2J1Zy5jCisrKyBiL2xpYi9idWcuYwpA
QCAtMjE5LDE0ICsyMTksMTIgQEAgc3RhdGljIGVudW0gYnVnX3RyYXBfdHlwZSBfX3JlcG9y
dF9idWcoc3RydWN0IGJ1Z19lbnRyeSAqYnVnLCB1bnNpZ25lZCBsb25nIGJ1Z2EKIAlub19j
dXQgICA9IGJ1Zy0+ZmxhZ3MgJiBCVUdGTEFHX05PX0NVVF9IRVJFOwogCWhhc19hcmdzID0g
YnVnLT5mbGFncyAmIEJVR0ZMQUdfQVJHUzsKIAotI2lmZGVmIENPTkZJR19LVU5JVAogCS8q
CiAJICogQmVmb3JlIHRoZSBvbmNlIGxvZ2ljIHNvIHN1cHByZXNzZWQgd2FybmluZ3MgZG8g
bm90IGNvbnN1bWUKIAkgKiB0aGUgc2luZ2xlLWZpcmUgYnVkZ2V0IG9mIFdBUk5fT05fT05D
RSgpLgogCSAqLwogCWlmICh3YXJuaW5nICYmIGt1bml0X2lzX3N1cHByZXNzZWRfd2Fybmlu
Zyh0cnVlKSkKIAkJcmV0dXJuIEJVR19UUkFQX1RZUEVfV0FSTjsKLSNlbmRpZgogCiAJZGlz
YWJsZV90cmFjZV9vbl93YXJuaW5nKCk7CiAK

--------------UHFIRoAQ0VjesPfB4ET10Qrh--
