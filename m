Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2363B47EE
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779824619; cv=none; b=m4QPxXIrKFW0Vtdfx4zqGFTFIlnFLn8dfShwRlXp1lHN3TFzGEVyh12QS225pODFNOI7Vu+DZWefOQxXK7uJ1JiuquUkVa1k6Io9kqRTpHnr+DeDYglhyXGhLNDh4Nif9jfN+BpEvSMVjlJzpIvzlhAUQg8KH9SI5YjN9vyCvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779824619; c=relaxed/simple;
	bh=XuxZMWtfwaZOaPWFZW08FgT0dMzx46J//ZDhvW8EJN8=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=Dvs/IBVbliZwLiy0ZrvSMXUbnqpM4e8bnpCQPQ7e7rMKM8Cs7FT0/EUSGp6DV5VPA+flfufntcMXlr1wnoSmxG25RAzVMuH7F3JDOt53ml6P41ai9y7eGgoHJ++Q1ZsdQ4mzWreh0O8OoCIkRpEQCrQAl9/KgMSaLG3JUK6PBsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T4e98HMi; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T4e98HMi"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4854b95c2efso1387568b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 12:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779824615; x=1780429415; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CX4cElAHoE2nQxUTTT2mXDJk2DUAeZpBAOinXe2Xemc=;
        b=T4e98HMi/7TdZZKmuAS4teQuYURt3d207QdG4U2ylkBK1JH8mcw33ky7DpdGXhDxqW
         98M1ATovbsFoQOFL0YD6tOwEmN9R//+XC6cRT2xC6wzioVvhTrfC3xqcf4z66Vx5gHQo
         e9B612uLD5igmR2SK6TWknmuX1I53/OuJNeh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824615; x=1780429415;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX4cElAHoE2nQxUTTT2mXDJk2DUAeZpBAOinXe2Xemc=;
        b=OkCQPoWBFlES4CwaZZOtMCobXhtMGrpiA0LoCfAjczm9RIeuMv7UGsm2iP593K2jYZ
         yl8H3pnBYXfEpIJvLQv5Dz0wMRHdxq0sON2dG1VlTQ/2ZDvwT2WqacUuYNngVHuZpdlA
         LuZiBL10csT33h0B2jZxlTFKejmzBkDJECEO0SOQ7Q8idCxwmuGq0JSMUaru61MdbMx6
         eFWjuhWGgzkiaD5LCxEQg1iQqF8Z6ycujHREO3qGRDOl0XY6G6wr99kpjPZY28XfvcJ7
         u+ssd177rIamTOiNIOs6m1FRF2HR1HQDmEIRe/gDpLC4P/kM6W14kU54imoRVpQFfzZT
         17vg==
X-Forwarded-Encrypted: i=1; AFNElJ8zKl0E1iK6wmSl5cCrZHBvPDYktbCul1gNtNy2senfPTUwxDBeyA9e+z7j74vBrmKV4lkI51/xwKFkRFEAfEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp80ibfgFn8ibC7Uk51B8nrhQzLat+O7u9D7yBvVz+XCEnO68D
	/kk01oh5q7tbTRySE3z6FuqNHMX9wC8Wi1HzVHZShK+DU0nHHMdZa6PNLxTd3LkIX/I=
X-Gm-Gg: Acq92OH/AbshHbrJtVHnz0ZOFLGzL5ybQTraJ1CixKmgyTyxaZ1cMBHIZKqrPyAJyqP
	+lO1b8+ab21f8taNKERPRTQfaVZ8GrI+BdeUpNCuFjLIv/JcVNAcvLJ6eO1jClhCzsqqWHcPb9f
	pwQ0h9KVF+kQ8rDBm+b348yoyxAtLWwSz63KSED28KbaINOOm3IHTbfqzSpjnRrIAkeWG3/OJL4
	LDlimCKQ1TuN0VBVhm7K4R1etaxhjvfjFsG3n4ONnywiPmrvnFim8gxH2P7/uHyD8p2qnEFGWU/
	kmD9wf/Z5joVe4xaXWGGAtUccZB7oEX6eMdCvdaUfMrV5DyH1Y8ZahXoTjSDchgxUgzC7vS3LDI
	4s2KamxO8b/KbA9paLzX9w3sMKw7NYoe3/617pjhNP3TJll/NYrJAct4m7tmiuq1P9zW/ryGZ9b
	BCLGpyr4rPsD78Vyubstt9zkN50BDov3d884Kd3ATOZTNFB5n2+DpU
X-Received: by 2002:a05:6808:2389:b0:484:d5a3:9969 with SMTP id 5614622812f47-48549ed0fefmr10870705b6e.12.1779824615322;
        Tue, 26 May 2026 12:43:35 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48554041ccasm6523908b6e.0.2026.05.26.12.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 12:43:34 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------ihOKNgVCaf9T85XvFwUpYVcg"
Message-ID: <7f5acf69-9224-4d2d-b7f6-99114a232446@linuxfoundation.org>
Date: Tue, 26 May 2026 13:43:32 -0600
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
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kunit fixes update for Linux 7.1.-rc6

This is a multi-part message in MIME format.
--------------ihOKNgVCaf9T85XvFwUpYVcg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull this kunit fixes update for Linux 7.1-rc6.

Fixes use-after-free in kunit debugfs when using kunit.filter when
the executor frees dynamically allocated resources after running
boot-time tests. This resulted in fatal hardware exception due to
invalidation of capability flags on the reclaimed memory on some
architectures such as CHERI RISC-V that support the feature, and
silent memory corruption on others.

Fix for this UAF couples the coupling the lifetime of the filtered
suite memory allocation to the lifetime of the kunit subsystem and its
associated VFS nodes. Ownership of the boot-time suite_set is now
transferred to a global tracker ('kunit_boot_suites'), and the memory
is cleanly released in kunit_exit() during module teardown.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 8f80b5b227ef9ea422080487715c841856339aed:

   kunit: config: KUNIT_DEBUGFS should depend on DEBUG_FS (2026-05-04 12:10:40 -0600)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.1-rc6

for you to fetch changes up to fb6988b83b4cafe8db63999c1ddff1b7c66d2ff5:

   kunit: fix use-after-free in debugfs when using kunit.filter (2026-05-21 10:45:49 -0600)

----------------------------------------------------------------
linux_kselftest-kunit-fixes-7.1-rc6

Fixes use-after-free in kunit debugfs when using kunit.filter when
the executor frees dynamically allocated resources after running
boot-time tests. This resulted in fatal hardware exception due to
invalidation of capability flags on the reclaimed memory on some
architectures such as CHERI RISC-V that support the feature, and
silent memory corruption on others.

Fix for this UAF couples the coupling the lifetime of the filtered
suite memory allocation to the lifetime of the kunit subsystem and its
associated VFS nodes. Ownership of the boot-time suite_set is now
transferred to a global tracker ('kunit_boot_suites'), and the memory
is cleanly released in kunit_exit() during module teardown.

----------------------------------------------------------------
Florian Schmaus (1):
       kunit: fix use-after-free in debugfs when using kunit.filter

  include/kunit/test.h |  1 +
  lib/kunit/executor.c | 19 ++++++++++++++++---
  lib/kunit/test.c     |  1 +
  3 files changed, 18 insertions(+), 3 deletions(-)

----------------------------------------------------------------
--------------ihOKNgVCaf9T85XvFwUpYVcg
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-kunit-fixes-7.1-rc6.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-kunit-fixes-7.1-rc6.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90ZXN0
LmgKaW5kZXggOWNkMTU5NGFiNjk3Li5jZTA1NzNlMTk2Y2UgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUva3VuaXQvdGVzdC5oCisrKyBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCkBAIC02MTMsNiAr
NjEzLDcgQEAgdW5zaWduZWQgbG9uZyBrdW5pdF92bV9tbWFwKHN0cnVjdCBrdW5pdCAqdGVz
dCwgc3RydWN0IGZpbGUgKmZpbGUsCiAJCQkgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQpOwog
CiB2b2lkIGt1bml0X2NsZWFudXAoc3RydWN0IGt1bml0ICp0ZXN0KTsKK3ZvaWQga3VuaXRf
ZnJlZV9ib290X3N1aXRlcyh2b2lkKTsKIAogdm9pZCBfX3ByaW50ZigyLCAzKSBrdW5pdF9s
b2dfYXBwZW5kKHN0cnVjdCBzdHJpbmdfc3RyZWFtICpsb2csIGNvbnN0IGNoYXIgKmZtdCwg
Li4uKTsKIApkaWZmIC0tZ2l0IGEvbGliL2t1bml0L2V4ZWN1dG9yLmMgYi9saWIva3VuaXQv
ZXhlY3V0b3IuYwppbmRleCAxZmVmMjE3ZGUxMWQuLmIwZjhhNDFkNjFkMyAxMDA2NDQKLS0t
IGEvbGliL2t1bml0L2V4ZWN1dG9yLmMKKysrIGIvbGliL2t1bml0L2V4ZWN1dG9yLmMKQEAg
LTE1LDYgKzE1LDE2IEBAIGV4dGVybiBzdHJ1Y3Qga3VuaXRfc3VpdGUgKiBjb25zdCBfX2t1
bml0X3N1aXRlc19lbmRbXTsKIGV4dGVybiBzdHJ1Y3Qga3VuaXRfc3VpdGUgKiBjb25zdCBf
X2t1bml0X2luaXRfc3VpdGVzX3N0YXJ0W107CiBleHRlcm4gc3RydWN0IGt1bml0X3N1aXRl
ICogY29uc3QgX19rdW5pdF9pbml0X3N1aXRlc19lbmRbXTsKIAorc3RhdGljIHN0cnVjdCBr
dW5pdF9zdWl0ZV9zZXQga3VuaXRfYm9vdF9zdWl0ZXM7CisKK3ZvaWQga3VuaXRfZnJlZV9i
b290X3N1aXRlcyh2b2lkKQoreworCWlmIChrdW5pdF9ib290X3N1aXRlcy5zdGFydCkgewor
CQlrdW5pdF9mcmVlX3N1aXRlX3NldChrdW5pdF9ib290X3N1aXRlcyk7CisJCWt1bml0X2Jv
b3Rfc3VpdGVzID0gKHN0cnVjdCBrdW5pdF9zdWl0ZV9zZXQpeyBOVUxMLCBOVUxMIH07CisJ
fQorfQorCiBzdGF0aWMgY2hhciAqYWN0aW9uX3BhcmFtOwogCiBtb2R1bGVfcGFyYW1fbmFt
ZWQoYWN0aW9uLCBhY3Rpb25fcGFyYW0sIGNoYXJwLCAwNDAwKTsKQEAgLTQxMSw5ICs0MjEs
MTIgQEAgaW50IGt1bml0X3J1bl9hbGxfdGVzdHModm9pZCkKIAkJcHJfZXJyKCJrdW5pdCBl
eGVjdXRvcjogdW5rbm93biBhY3Rpb24gJyVzJ1xuIiwgYWN0aW9uX3BhcmFtKTsKIAogZnJl
ZV9vdXQ6Ci0JaWYgKGZpbHRlcl9nbG9iX3BhcmFtIHx8IGZpbHRlcl9wYXJhbSkKLQkJa3Vu
aXRfZnJlZV9zdWl0ZV9zZXQoc3VpdGVfc2V0KTsKLQllbHNlIGlmIChpbml0X251bV9zdWl0
ZXMgPiAwKQorCWlmIChmaWx0ZXJfZ2xvYl9wYXJhbSB8fCBmaWx0ZXJfcGFyYW0pIHsKKwkJ
aWYgKGVycikKKwkJCWt1bml0X2ZyZWVfc3VpdGVfc2V0KHN1aXRlX3NldCk7CisJCWVsc2UK
KwkJCWt1bml0X2Jvb3Rfc3VpdGVzID0gc3VpdGVfc2V0OworCX0gZWxzZSBpZiAoaW5pdF9u
dW1fc3VpdGVzID4gMCkKIAkJLyogRG9uJ3QgdXNlIGt1bml0X2ZyZWVfc3VpdGVfc2V0IGJl
Y2F1c2Ugc3VpdGVzIGFyZW4ndCBpbmRpdmlkdWFsbHkgYWxsb2NhdGVkICovCiAJCWtmcmVl
KHN1aXRlX3NldC5zdGFydCk7CiAKZGlmZiAtLWdpdCBhL2xpYi9rdW5pdC90ZXN0LmMgYi9s
aWIva3VuaXQvdGVzdC5jCmluZGV4IDQxZTFjODk3OTliNi4uOTk3NzNlMDAwZTFiIDEwMDY0
NAotLS0gYS9saWIva3VuaXQvdGVzdC5jCisrKyBiL2xpYi9rdW5pdC90ZXN0LmMKQEAgLTEw
NzUsNiArMTA3NSw3IEBAIHN0YXRpYyB2b2lkIF9fZXhpdCBrdW5pdF9leGl0KHZvaWQpCiAJ
a3VuaXRfYnVzX3NodXRkb3duKCk7CiAKIAlrdW5pdF9kZWJ1Z2ZzX2NsZWFudXAoKTsKKwlr
dW5pdF9mcmVlX2Jvb3Rfc3VpdGVzKCk7CiB9CiBtb2R1bGVfZXhpdChrdW5pdF9leGl0KTsK
IAo=

--------------ihOKNgVCaf9T85XvFwUpYVcg--
