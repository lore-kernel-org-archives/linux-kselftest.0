Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF05F17B506
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785117676; cv=none; b=WCeV6cBAvabUOkf8GqP2Ybdyi9x+e+Z/1JxPjUlJbaLnRIZQwmTKoPZlC/kEOUDZUC76BLVnm/FXH6O58/r02FF7A4Q5RoiYLSkvxJJPNikZs8ECvmH5aFWEF1eZK6mRot1RlelggoUh2UBpo57f0BlaDfYKPiI6FsTaqXmqlOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785117676; c=relaxed/simple;
	bh=beGwk2ll/Kvg5JK6MK4vn6gQZ/EyqfU2I1zL3w+Koco=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=avrF+fbqDcq7vqvGwWjgmSNgiA4M42Mxr1V5Tc/uMZYoMRIsQW6GQYUCeZjm88vb7GxAK2SnahOND4vGQogJQE+MqstTdqZJsfTsZuCJNb0I+ZurhSEsLDJ2Kf8r6l37OsG1lMKesy4LkYF813/kOySpE9R3OUeCiiyH/IJ/eTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=Gq0JcbvC; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="Gq0JcbvC"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1985896a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 19:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785117674; x=1785722474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1yc0HP4n9/5TsAEOfrGcMa0kXz8+ZC1koTHwFdPfKw=;
        b=Gq0JcbvC+o+TOILqzrFa1dXUav+5E205k9ovNwRGBIOnwKK+qmraEkXX4b7ZBq90Y6
         7CHNRKc24BBayzmadq0vxJzd/tm4rgTdEfJClSFzDrbXWfV6rgjFi2XKrTKSIm6t00a5
         ylzBSSKuu6OhrLk1VGtebU76tXzWd8HyXt/IdWWUfDF0sGb7Ua/RFO4dVrYWXnPrbQKl
         lkukv22JkNswNiNS1kx/b5GR9aaByn0QPsGGpsJuM0+aQ5VpeK46yB3luZN3yOpIy+Mm
         COFQivYSbGr/Lg/DHODPho8LEYYTlwhM4x4F9L/NNRf0MVkb9gMMGUPpg3lMu/eYg5k8
         /Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785117674; x=1785722474;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1yc0HP4n9/5TsAEOfrGcMa0kXz8+ZC1koTHwFdPfKw=;
        b=eQVv/PqaLTpjtJtHnY52D6hVRt7OTqiyeNPcJGWoSQKXqVFd0ZtcD0Y3CC1W3GevSf
         kyZGaR3u7b3m4tmCLXAs8OSYFNI6tjFK4YkPHBFSmzxjdNfxI7ZesY9WBHDuIf1nyDjS
         PiknqG1e/fbd/ZSSeV8ffualogPS/FOsI2oF46esSOSBmw1dn9i66kTJypBwUKKn30KH
         kCvbZ6Eaa76kU9JslViRkoGb945B25pH1Qvy+L4NeW4cFsc/13U4nZiHhK4cC55moGGR
         n0PKNNcUTKSkA7uePelblR5bEVop2pzdhmheNJXc66L4sVILZmvntUmRZcNxb1BLgfFI
         /Nzg==
X-Forwarded-Encrypted: i=1; AHgh+RrRaU+dJTtXStoayli6VtKEoKbg35qFz3n4TnSr/I8WvK0QWSTAryJ5po/Dek2sVR9lVojZb4BW3FtNuoRMah4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJG60RHnG9YR6CUfN2sNvS2GDhuxM+j5D6wIEqjIvHZaR4FgW
	5TrMQvkghnP01q5DLtaZoNSUcgFPDNSXRy7quKHRO0wYOEt5PhYlO3WcX1mlplIjUhQ=
X-Gm-Gg: AR+sD13RljB+4YU7TM9kmeXu8PKjFmKUyiIbJDRReyAKkbNkSKeJsOd9HaHB75S92Pk
	suXJVxUcAfCFeiSyn8OsCAZDTdVcm5MbaEmfm48gJcWnwuNCtyqIR6NycM2tegeex1zj/XrbWk3
	6elyjnQma6ZlV+NWDNTb9MJb+itMGZGuECuKBuBbk5HHDoxdabfPmUE/1cy3Sn0J5HpqhIBi5ad
	us/9tuYXdq4+rK8s4XKZsgKoC6ntm5F6+zAbc7LaIhPXU1fpbX/KDObE0oxXKLtSflKPKbM/hZm
	wu6x5Y0SQlywVXGCZMoPqStyP7TFPeA+7tcWcoWbetQYbEqPg84iBje7cZ1WE0BFcYTKW9Nie8M
	cAFdC9H4OrQhBBZj0PApkFd4ktzCBAERUfxvCXvJwhH2CJpsqFW+CeL72uwTEXz5o8EGZCGa+nV
	c2lOYnxORXS6hi2jbSXZ4cPfru/7dkDs/fy4hpJoYboYkXgqkKeq1IKSRcin1/HZLD99IrHAk=
X-Received: by 2002:a17:90b:2d83:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38f1f005916mr9214393a91.16.1785117674140;
        Sun, 26 Jul 2026 19:01:14 -0700 (PDT)
Received: from ?IPV6:2402:8780:1329:2779:943f:461f:3cbe:df62? ([2402:8780:1329:2779:943f:461f:3cbe:df62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm44855913c88.10.2026.07.26.19.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 19:01:13 -0700 (PDT)
Message-ID: <4e22086c-8a60-4965-8d78-a946dc54eaa3@openresty.com>
Date: Mon, 27 Jul 2026 09:01:09 +0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ammar Faizi <ammarfaizi2@openresty.com>
Subject: Re: [PATCH 3/4] selftests/nolibc: add abs() range test
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
 LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang
 <yichun@openresty.com>,
 Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 gwml@gnuweeb.org
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-4-ammarfaizi2@openresty.com>
 <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
 <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com>
Content-Language: en-US
In-Reply-To: <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/27/26 8:32 AM, Ammar Faizi wrote:
> On 7/27/26 3:00 AM, Thomas Weißschuh wrote:
>> We have _NOLIBC_OPTIMIZER_HIDE_VAR() for this.
> 
> Oh, I missed it.
> 
>> Maybe it can be made variadic.

Oh wait, tools/testing/selftests/nolibc/nolibc-test.c is compiled
twice. One for libc, one for nolibc. The test cannot use
_NOLIBC_OPTIMIZER_HIDE_VAR(), it breaks libc:
```
$ make -f Makefile.nolibc run-libc-test
nolibc-test.c: In function ‘test_abs_range’:
nolibc-test.c:1756:9: error: implicit declaration of function ‘_NOLIBC_OPTIMIZER_HIDE_VAR’ [-Wimplicit-function-declaration]
  1756 |         _NOLIBC_OPTIMIZER_HIDE_VAR(ll, l, i);
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
make: *** [Makefile.nolibc:278: libc-test] Error 1
```

What approach do you prefer?

-- 
Ammar Faizi

