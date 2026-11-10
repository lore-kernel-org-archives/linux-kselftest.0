Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314735;
	b=OWzc5NF0RTmPIbS3kXmBZSSftj3AJTOT+9z89g4HNAPBC79WiImvf3t2tKu5103AMIj7
	 WXg9q2A3K3oZjra4WviB4lnHN+BFhpN7No7ej34Tl++fHMfafCDtMdDrLJY2+y+s4A+F2
	 fPjlwath5nchpz+pXamB1jfFOwYb+YTwLEb5S02c4JGhROKuqWa6J36a15o5SX3Ap0S45
	 ehBpHnDp5Qb7+Vvm1KLE23Wuqd+pyNTCLUbsD4z2nv5m92rnklXY4Iv4XCb2LenxN8PLk
	 zMdtFNP3KCSuE9ICVRCsrvnUFeuaJHIjHyeyK/VdqqLYjGo4eD9Kgy9anrvs4zfUtug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BfINIDbdnp5YQZaOFA3yDq3s0AajpyTCWSTrx1kczfw=;
	b=SwLRHz9OeY4gMiOs0LIBf4cmR2Oq+fFC+t1+/I6HQabO8vBBH1bydMK19ya51tju67Ul
	 RfHC9ySgMMBqIfxLqvksFPRrwtzTg1CxZ6bu5JMJ+75JqzgD54lBKJDD5Rgk22B9ex6M6
	 mLKY3MFFyM5Xmq+9bwzvT9Wi56mYpVlS6L+vzNs8sW1wD11u2jE5gJwn13s8ovSeAInnH
	 dTe1Fe5Pa+uqBpcjt3i2dz3/EM9YJCcFVHYEe+MDGYaljtLT8shoV8hZHtd+nK6PCMd29
	 6Q3L/g9aX+aTpvf2KrqIs1++ybIXLwuMQCG/rf6fPD5w6zvnQbeELwaxt/DckqdU9pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dEcZUNmu;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB4606A332
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 12:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FB4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dEcZUNmu
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so23951995e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 04:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794314733; x=1794919533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BfINIDbdnp5YQZaOFA3yDq3s0AajpyTCWSTrx1kczfw=;
        b=dEcZUNmuEyvW10CwwvMzlj73emtXK/fpU4H7CvDEry6gD8AmS9pMZBCHmGO+rTr/6s
         a1jZcXSIrGxQ4/dzRn/1Oi5yj6+AZa7H3S8HLfDHBQdEeXVaLy5gTLgTxKfPDzwEq+Lo
         MV0NN62fzU+Phg8hUPH89UJplWl6wCql6scAU2ZeKnhmTEcoeGIQNq3BJIwCn/qvG40M
         kL8idh1jg7BqKcTWM+XNKEweNrzQKtqQKHke4sOPAlA84d3EDAAjBHFIUI1vnWn6dAzH
         PHmcCoK9PmgLWAIOXwtUyNVQpLn61o3FhsjUXL50KIAUjEKUaF0BJ/zsdWY5WeJSu+Pi
         wJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314733; x=1794919533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfINIDbdnp5YQZaOFA3yDq3s0AajpyTCWSTrx1kczfw=;
        b=ojRwFc7Q16QxmRrB6g6s4udmJIjdkpZFfVqW9ampNolKK4NmYqDwk1x0jHIxKyyCt6
         8eVG+kRQTxyzM34zgB4aOqnXqCEo+JzIzbtD2J8vSCSnZwhW9cYKT5YvWT1NYXCjp0jh
         AnLDB1Gn/d2olHtErFpLIpSPnO8juOAnVl7MOcyPBWGJnMJapOc5I5/9RwUtgr3MvmMa
         v0p2Lv+xHLljvZYMEWPCHUApuqqlYPWHrFshkiWi/yuw0vAatwo5vsJV+CH/IdDjnc5P
         2oDAbspPK1z2kFWkhqDMAIZMK4Llr0Bbf1exs0CA/tRHIGmtqiyVD2XKY3wWs2GD6sMD
         wPeg==
X-Forwarded-Encrypted: i=1; AL+hErEprkmk9J8tzNthpH4PCEgJgrTCjavFfAZTzWRITypZPHotYQtxmmITBPfWM6U1xNpZ60cC+4/+kDfRQb3RnuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wTXuTlgAmaHleGA+flikwwc7mHy0Snq9YCSj10ahq4mgrDsT0
	lgAZz8v2JHzpBBAAmNYQBhHgNiF3qv4wnmZIpZQE+EnXZSQDcwwdPatsLaeYwqjJvR0LldeYugE
	tsDgnWIw=
X-Gm-Gg: AYBFou2rb/RSFNMzX33C0qUXId400zLKhhEVakdjXKh/l6j6mon9Nk1zemBLiYmPW56
	k7IrNQ5P8GS7Ym9MQoTtrhK0dCyePw2YZbppGgs3AQ9ZdE2mzzGG8wCEfVCsx4au+mptVwjWnH2
	hTNix6Qwr+vAWDxzt0b/lyx0Q14/XsbN2Y8kUPl0bJ6gNriYT3WoVUmcigUpVAibJK2+73K9aop
	PhUCZ5MDJCG80rJZCfbNlZn8ClCMzQNlkD7ezsvxHx3PXzKKRT06VnpJ7p3TeFkXHS08WX5uPwO
	e7i8Qwv/lHl4X6TFJwa27HT7yYoPUbBT35/Uuw/LOHqPzxTJeC7s2SAytoudWFe2XgvKfFXxl5W
	m2Fs18M2dxj8UZ7vOC4J3OV3YIRukRTq0g4mNhPDHJG4BGrOx3e2Ur6HSrgXyPvOfBen/alQRsp
	E0FOL9uFd7qOQydZAG25dizLBm8OfzXnJEHqa5jhu+389v0MKJekoOZrIHW4dBOIvHfwgKXWHVh
	uCyPFI36a+pP9OrjuXyHYO4+NQrFEJMfdw4oYEfJCQFHUMb5aSmHYPg8z6g/Hi7mhpUYb2wR5nE
	T3DmaTQ+MkrqhjywI/r00Xgg1orcJkdqnDkFmtF+zrKP/T0=
X-Received: by 2002:a05:600c:6087:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4ba0233cbbbmr40551245e9.3.1794314733553;
        Tue, 10 Nov 2026 04:45:33 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005946sm70546095e9.1.2026.11.10.04.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:45:33 -0800 (PST)
Date: Tue, 10 Nov 2026 13:45:30 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/12] klp-build: Fix dependent patches, add selftests
Message-ID: <avMR6tKwddVBrkpk@pathway.suse.cz>
References: <20261028214534.1919398-1-song@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028214534.1919398-1-song@kernel.org>

On Wed 2026-10-28 14:45:22, Song Liu wrote:
> klp-build fails when a later patch in the series depends on an earlier
> one, because it fixes each patch against the original source on its
> own.  Patch 1 fixes this by combining the patches into a single patch
> before adding the #line directives.
> 
>  scripts/livepatch/Makefile                    |   3 +-
>  scripts/livepatch/klp-build                   | 137 +--------
>  scripts/livepatch/klp-prepare-patch           | 277 ++++++++++++++++++
>  tools/testing/selftests/Makefile              |   1 +
>  tools/testing/selftests/livepatch/README      |  16 +
>  .../livepatch/test_klp_build/Makefile         |  26 ++
>  .../livepatch/test_klp_build/functions.sh     | 149 ++++++++++
>  .../livepatch/test_klp_build/run-tests.sh     |  68 +++++
>  .../livepatch/test_klp_build/test-basic.sh    |  93 ++++++
>  .../test_klp_build/test-cancelling-patches.sh | 102 +++++++
>  .../test-independent-patches.sh               | 124 ++++++++
>  .../test_klp_build/test-line-directives.sh    | 175 +++++++++++
>  .../test-new-and-deleted-files.sh             |  94 ++++++
>  .../test_klp_build/test-offset-and-fuzz.sh    | 120 ++++++++
>  .../test_klp_build/test-patch-not-applying.sh |  73 +++++
>  .../test_klp_build/test-unsupported-files.sh  |  30 ++
>  16 files changed, 1366 insertions(+), 122 deletions(-)
>  create mode 100755 scripts/livepatch/klp-prepare-patch
>  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/Makefile
>  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/functions.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/run-tests.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-basic.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-cancelling-patches.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-independent-patches.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-line-directives.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-new-and-deleted-files.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-offset-and-fuzz.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-patch-not-applying.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-unsupported-files.sh

I am sorry, I am overloaded and do not have time for a proper review.

I just see that it adds a lot of new files. And I wonder how much it
shares with the livepatch selftests. Would it make sense to put
it into a separate directory, e.g. tools/testing/selftests/klp-build ?

Best Regards,
Petr
