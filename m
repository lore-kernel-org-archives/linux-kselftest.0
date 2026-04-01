Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A62C346ADE
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043921; cv=none; b=uBcxPudhxCt4irYNXzNvgoYdEyFIPwKNwvSxowpVhATMX89L+wL9DQA1IMGOZ0e4rgwYKw919X+WAujsKA601qmVLH2AFA0filZLxMouMZCvvcjYOBoe2xBaAjFPwPwLJqS/6foD2XjUYyqognXY9cvQCio3Xrqp2eGSJ0GmYYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043921; c=relaxed/simple;
	bh=1YQR4oYB827jWhblwTuayOmLSRnKLaKfpyTUg03CM7I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=EcpQsW9MSm2Zt08YT3EMxtz4UQGxw1g+QkdnZuetPGs8wfjOcwaQfXOgHPDnNFZxHqA7wLjqfOJHK01L8rPZxZbBj/8v7meEKO23i/nAGDfohVRQlnz+S8Ct+J2zPvMNu5JJWt6FOpMhPJsXQr/yff3iNScKni4Z5jvK7hteMhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dtvdGYmX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dtvdGYmX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fb14227cso89954205e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775043917; x=1775648717; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPqO66ooSzvYXcHovRc3kumo4Z4L11P3H0CO3iwizgE=;
        b=dtvdGYmXGaGve3LSX3VP8QqMMITzokNLUKzGpAmN+Ptl9Y+loyyXyiMW/3nKqpN3XT
         tgDPCF8sM59IoJ+bJ0ptVeEVccIZtvAaOF9+vimBGkRwcKs54lhSaTvp8Q5m1N9ocBhy
         OuGoJQsvwUXnFt7NTWALhrNgRwxaL7L3x5o3nAfSZroMkoZurp3vNZ7IX5B8AwN1SZxX
         39oMnGzhiQJ6HvxI+Fm0iPGFo0E9R45EGsnBc3hxp0ePCYCTLUDN5sOUjT7agxxAP8/k
         dZkmUgzP7BdrLkMs6pBt1RzKF738kWDchzOQhOrahsQayVhjbZSZi2Edb5JJdST9T1+V
         OfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043917; x=1775648717;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPqO66ooSzvYXcHovRc3kumo4Z4L11P3H0CO3iwizgE=;
        b=DGgDWv70L6cIOrV/RX0grVV+ntVLdwEm9Ze8LeQyHZP4PgExn20c6lRRjVzRzXl5EF
         ITnyteil8ahYkmrB08qG+JnkY2GnpSxsfR4f71tz02lk0Bt+WBf9pN7YlCwkzBOCYRdm
         SXfA6Jy1MdD6V7f0HoX9W9KZn3zlaTZYAnjw/q2EdXn2cJzQY0DtqUXsvP/5QqK0Lltk
         mTWF2UkCmsRklHaEkRzgh2K6QEY8ifwE3N84sHxaVtHl/iEDb1N8hqeuOnPwx2P9fXjR
         pfUqICYc1v9TV4PUeSqjvK4jalgro1n2SgI/e2akIcBVopWh0dcigyICxME8CljGk4E/
         GgQw==
X-Gm-Message-State: AOJu0YwhLCnasjgsM69AQjvjmjbAG1LInuiyJe2MhVJjAcF1GJ3D0jxP
	x1dCBbqQwkgjhEIEETm/WY5qidcJ21AEwUJxWH0d+hi/EPY5N6A6tvvQDSXHA9VAGew=
X-Gm-Gg: ATEYQzwpOgd7OGnKPxGJKznch9c7SRyAtcGmYQUFRxLluq1xX9ZM/7hGPiElsFmx2Gy
	bgVLwFR5GXWNDvz9raNzjlZ1BSvpU61j5l3aLzRH7CA9WuxBvXznKZl2m8negAfj/vdVWjQAq8j
	/MZIuxcqEy0bEJV8azIsY4ixdqd+SKtM/++mF/79jgzzK7+JnEcx1KiKPKiBsrUvngEIPRft7NO
	DTkqjpkVNnRqSTzs/XikyXWu0UoxXRL3KbmhmOMIV3FcdCP2it5tZ9SqzmSZfZr/PYbyWkf84Yk
	DeR1qrbDQZakIGJfMmfBxWIxNC9QUTp1JIwhS/liBUIov2d+QmdlGhmkN5W1kmbUFkDwhFb2fKU
	ZCkGVceir0QmurEHjzxXfTcj3nwk/IpJLSl+rxvhASHhr9ea8sBGp2k23lnhBffxaoiApYt9AqV
	dKqpuqwB0=
X-Received: by 2002:a05:600c:5298:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488835887f7mr57611785e9.12.1775043916610;
        Wed, 01 Apr 2026 04:45:16 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a7ba96sm15541462e0c.17.2026.04.01.04.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 08:45:13 -0300
Message-Id: <DHHSJWIDPYS1.332RJY2H7YNA2@suse.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH 0/6] selftests: run_kselftest.sh cleanup and fixes
Cc: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
To: "Shuah Khan" <skhan@linuxfoundation.org>, "Shuah Khan"
 <shuah@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <b01d1156-2213-4051-9f98-60e74d18e2a6@linuxfoundation.org>
In-Reply-To: <b01d1156-2213-4051-9f98-60e74d18e2a6@linuxfoundation.org>

On Tue Mar 31, 2026 at 7:43 PM -03, Shuah Khan wrote:
> On 3/20/26 12:29, Ricardo B. Marli=C3=A8re wrote:
>> Hi Shuah,
>>=20
>> Please consider merging the following patches. They are mostly small fix=
es
>> to run_kselftest.sh, plus one feature: adding the option of passing a
>> directory to the "-p --per-test-log" argument.
>>=20
>> There is a small corner case spotted in tools/testing/selftests/Makefile
>> regarding failing sub-targets, and also the removal of the default insta=
ll
>> directory for out of tree builds in the top-level Makefile.
>>=20
>> Thank you!
>>=20
>> Signed-off-by: Ricardo B. Marli=C3=A8re <rbm@suse.com>
>> ---
>> Ricardo B. Marli=C3=A8re (6):
>>        selftests/run_kselftest.sh: Remove unused $ROOT
>>        selftests/run_kselftest.sh: Add missing quotes
>>        selftests/run_kselftest.sh: Resolve BASE_DIR with pwd -P
>>        selftests/run_kselftest.sh: Allow choosing per-test log directory
>>        selftests: Preserve subtarget failures in all/install
>>        kbuild: remove kselftest output in mrproper
>>=20
>>   Makefile                                    |  1 +
>>   tools/testing/selftests/Makefile            |  8 ++---
>>   tools/testing/selftests/kselftest/runner.sh |  3 +-
>>   tools/testing/selftests/run_kselftest.sh    | 46 +++++++++++++++++++++=
--------
>>   4 files changed, 40 insertions(+), 18 deletions(-)
>
> Thank you Ricardo. I applied the series to linux_kselftest next
>
> I had to fix a minor merge conflict when I applied patch v2.
> Please check to see if everything looks sane.

Can you please drop commit 33880424308d
("selftests/run_kselftest.sh: Add missing quotes") ? This actually
introduced a regression. I'm sorry about that.

>
> thanks,
> -- Shuah

