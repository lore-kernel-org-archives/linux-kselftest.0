Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E602249C4CB
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948309; cv=none; b=r7etCrhyqBNVe0ftf1CH+3r/DZr8HyP8BTwHmvwsaQjz2dROnxbGM566gLKfGncxltdXHMZiF2LYJmJHp4ez0YFAPU7fm+qyeGKssqGbhILPo/SnsaFc3R9j3ImHeGuJR4jbEUjE8aF8+rc3TEA9CzHimD3iFtBo0quCW3mnQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948309; c=relaxed/simple;
	bh=ispYBB5sEcTKbtVy3MNVY1blcRMOieKTmsbt+otEJQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdrJVJABUy65QAAYa5QUOoOyUMCBF9IaTBzIf2ZF6r+Q5ozVVVl4DyJDw37x07Izknhq41mC/uKG7ncLdA9gOBUQRWw1S0n4SqgMRmA+1UJR9wgll+BZQ2NoK46YUJ3BOn5O/9DWkEwtdKgFDGwM2WV4oIhOqe2KNjW4m6mV0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Jm6TGgcO; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Jm6TGgcO"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EFEC63F5FF
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788948304;
	bh=Ne0O7Jrbbh35lHn6AVgsM7/xJO5tCKCdyIfi82Y0KOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Jm6TGgcOQK/6ZCcK8Dl+mP0k/bS5qAXb6aqP7cLnHZpZZT3DAmXUlW9Jlrs9jRDtk
	 4k41+uC5HdMFZu3mQrfxgT8YUG+/N1tUuVQDkr4uahhK1fQtP7Dcl5NMZpOxDCIjLu
	 zjOUgGtsuK5Mbtiw9gVj85J2z+PT5JV47U55JYu+aNsAgA1FzntMZGafE/afp8HLU0
	 3SROjoDZnPzoF/aiOgf61b8WaCbamn8y9ppjL21srbgTsAXTWNqUtyRcTU1vc+z04j
	 3WiVA4wkR353+VsVTCLtygQKbIBrdky2hMqmrOeUJ1F0wxTlhMGsiUWNGpww+z8Dld
	 aw9BWn1BZKiwXDOCcTDjrrjb+2E/ICZDYEMIkWujUJHxJp40hsPjYUS5mWjbDiWzxC
	 Eow2nXkImAAVSLE/qKOilG9E4fnl6Jb2xtTbkX4ZFD2bxCoQmZp8XtxhJnVbIwdSZa
	 +1at6KmTUTRpQBGPnTwGobVp+sf9NZXjNH7CsigoONlBfYhRzDq2YogQGn9DnjbXSk
	 oqsjZlck9Qu27+BtwRef0tx8gVf6X3wEmiKdJ+jNzO9hNr51c47I8C7AwTs4v8/w0d
	 3FoZrIPUanA6lV9OEgX8YnuzzdpYa1TFCp5bIdJxcK9AmQfhvYZeFwyYKxjbjj6/5w
	 F/D6mbhQjR3vnaB1xwsxfENw=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-485afdd5079so379960f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 03:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948304; x=1789553104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ne0O7Jrbbh35lHn6AVgsM7/xJO5tCKCdyIfi82Y0KOw=;
        b=Xk16hFyAGPAiWKC3/8JOphNLoMqtGv3I4gYJOi35xePFF3FKJMqvftD9rpH/sHPRGr
         7RET9LpfXHeimVLOvh2S2Ug6zkF2m7GBx0HBHwLASjZjrsvRtomD4r08SAJEdc6YpHSh
         pESA0uhIoMlsKAn6io9w6AG04ZyEcaOC1IwRNb/zym4QfsBVQ5wchw+ixJ69fGmSgUBU
         WkEkuQL4VwXXcwEcfuTmIw7rQ7lxIIckfVIkhSMxJYDO1+gfmsIAztnTVLOiC+RUXsJi
         JVPQuUbNTlBgI7dK3OGOmnnBOtGLIm2WjtYL975q27hd5ngmNuiJCvsv4S+MpcBv/UeK
         YcJw==
X-Forwarded-Encrypted: i=1; AKwUvByVwBrb+a+tEEXLWkIYMZWDuGuFezmf80qLB+5RtyQNIqQ1Ge5Mijnd3lT3czkugSAjaF8X1z5BHT8i6auTc+w=@vger.kernel.org
X-Gm-Message-State: AFuF++kInRdDdUY8AC5OP3HCHOS97BRAbasR50Tz1Jwzy1TGogqqbcL8
	xqr1y/Dhz0qOrpjKmsFqEndbbL/7V3J8pNCP49YXyuwA30b1r7kMhoUmx9EcWB61H9DXH0pe3vz
	Yl1QDx6ccZQSjP9ToMm0CFT6v7YaqaKbNF8xfmZweb+WqoCS/39r/cdQcQgn0ZfygxdRbjpwolx
	ezNE5+saxSkQ==
X-Gm-Gg: AYBFou3g7ctQWzNPYr/kuT9y+pflGgLOzlV4eaKbXvaWdqyMEH9+v/67RC9ZDw9nl1i
	2vPhw0OEigr1XX90jeQC5fGIJLYgCnrNSRopwjMEnxeFhri2koaxfWZGf8Q1eI09SOIvPdMXus/
	kC+kJqhHk0yH7tx77BmKPLNNZk0C3FqFkkJ/lEVz2ENHjeNi+9cZknWqV8VwIS1USmp9p0ffSV1
	+9/bG5tNNHZrEZLs0j7N2g+HitDEH1Un+Kz9tNih8AHHRTw3j5psEL+cvkvjhsCxO0rMrzO7hso
	A3IacCW0IGWcgpJwW7kJeL35rG2jwDTfA3X8RCHPrwhhzag84cMOgJYk7MzYwpbyJoLWXo9e2DR
	W7akMk01xqAP8kFlH6ifFFPnA6q4FjIEszzA1erhCrJcuK4s9gj1cxCwNvrRPMtDoCAGea53PoH
	Ye8jugFmQUbXc7ZYxuY+uls7JRmrcBoPHRAKjcuH8y57Kkp7oWjDYir8Qo2lvYnZRXftBYibLkD
	z4C7kVkmpo=
X-Received: by 2002:a05:6000:228a:b0:485:8c16:a331 with SMTP id ffacd0b85a97d-4858c16a578mr30840998f8f.38.1788948304405;
        Wed, 09 Sep 2026 03:05:04 -0700 (PDT)
X-Received: by 2002:a05:6000:228a:b0:485:8c16:a331 with SMTP id ffacd0b85a97d-4858c16a578mr30840951f8f.38.1788948303969;
        Wed, 09 Sep 2026 03:05:03 -0700 (PDT)
Received: from ?IPV6:2a01:cb06:c054:d70d:4174:4522:1a58:40cc? (2a01cb06c054d70d417445221a5840cc.ipv6.abo.wanadoo.fr. [2a01:cb06:c054:d70d:4174:4522:1a58:40cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm35849463f8f.13.2026.09.09.03.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:05:02 -0700 (PDT)
Message-ID: <1940bd28-3dda-4a03-a8b9-37fd0731282a@canonical.com>
Date: Wed, 9 Sep 2026 12:05:00 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/powerpc/tm: Fix tcheck() reading uninitialised
 CR value
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Venkat <venkat88@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907215420.1258678-1-thibault.ferrante@canonical.com>
 <4206CE63-979B-4464-BECE-F89D0B1BDC91@linux.ibm.com>
 <d80d892c-8505-4530-a23f-e3b6daf72d03@kernel.org>
Content-Language: en-US
From: Thibault Ferrante <thibault.ferrante@canonical.com>
In-Reply-To: <d80d892c-8505-4530-a23f-e3b6daf72d03@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2026 10:56, Christophe Leroy (CS GROUP) wrote:
>>> diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
>>> index c03c6e778876..6024ce4ba6ff 100644
>>> --- a/tools/testing/selftests/powerpc/tm/tm.h
>>> +++ b/tools/testing/selftests/powerpc/tm/tm.h
>>> @@ -105,8 +105,12 @@ static inline bool failure_is_nesting(void)
>>> static inline int tcheck(void)
>>> {
>>> long cr;
>>> - asm volatile ("tcheck 0" : "=r"(cr) : : "cr0");
>>> - return (cr >> 28) & 4;
>>> + asm volatile("tcheck 0;"
> 
> Why not use cr7 instead of using cr0 and doing cr >> 28 below ?

That would work, but that's not consistent with other asm in selftest/powerpc: tbegin./tend./tabort. and vas_paste() all target cr0 and shift as needed.
