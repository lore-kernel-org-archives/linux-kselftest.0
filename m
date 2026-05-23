Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B527732
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779497872; cv=none; b=NOdAnNDk6ViSODRR9ZoXH2DDGjtoG/i61CaVotjeKbapwWBat6IBwFnHNtS3MBf141+AJoHN/bvoe5SUZEhWXepz+KGZrrHl3q8WtKB4IXZEbRhbQsOaRSKepk3z9ZORAxYBWb24wooCkBQrQ9jqzqTWQPlihYBG/SYnPrRQedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779497872; c=relaxed/simple;
	bh=WUs7gb4X0dktqJ2K20s3J+bAtuWEGcrYha06520AAes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RztMuR/7mr8ZCBCS2YZ7DhTomtpINB74V/EPAU3zQm1/n8M1qz/Kf+W7Kls9ZgSJHaW0mTPej6tkRH8u/HDYeY8rfXzslk/O2Fz6aQmYS0D54siHxfxx6/YL+W7CQHtNqExj5WjMHJH5MWmNJey5876Hdns4NQ+gg8BYPv65i/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s13xRv3h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s13xRv3h"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso65971755e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 17:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779497869; x=1780102669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUs7gb4X0dktqJ2K20s3J+bAtuWEGcrYha06520AAes=;
        b=s13xRv3hvjF6QG9UP1jtRmiVJXvIcorpZJcvHquSRZKVDy1OrbKKbLXysAuiH1Mu3y
         Xx/YaKiY2gz0XbACfIW7wRGh0TEWxmV9KzhKdchhhOoYuhrCQnds+IjtqnpTj99aO3pw
         xoFiX0nU9X17NvJ5nzAEbK7FECy2ZFD5qleFQ/jp6gXD39aIu3BjPSzMZPvxeHLcjtof
         A7BOOybIPt40UO7BuvbIVrcEsQYKYqo/LyLekeung1IF/WOp6g3ajKqGip1Q4llLpkcE
         oqUa5tKz/wEevwJHQR6U5jkmiJHIoIa9QjbNnIileQBuqQIiMvaVh7U+pzWgTDgM695v
         cOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779497869; x=1780102669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUs7gb4X0dktqJ2K20s3J+bAtuWEGcrYha06520AAes=;
        b=ckYzCSp5v+oblviryhkE8ECFNPholwFV18TCBYcVc/w52x7t1dleSJprrIZ5lQ/nAC
         OWKZSgzHZO7qr5EiGrJcT0cyrRBAEOZ0yaxLbTj8M6Im1pOP29dkAeMJqG4OVC0ylHQF
         X8wdxQRCEe/8xhcBjqalgFvKL/DF6nyvpZbthsuTDh+8mfwwPsc6d8qAEHLfml4HKmTs
         Ali8/tL6GZZxGFiIPKTpzzf9OHRi7qM4Bus/K5egjQelX6ysm4w3oVGZFKm4wrZbHKoe
         ehMUddPdTGyXgraZyQETIBkGvV0fs8khQALyV4cyt/dZDrnsLn/jR9/M0B4HQt7pD1tv
         83uA==
X-Forwarded-Encrypted: i=1; AFNElJ+2J8oHES2LVheqyoFWs4Z0Ek3a4F4JrGd0Xwg90QbuNNCGlyz2nUHBLHj1B1ZywQKr+Lm1kfSoZH8K1RVSfWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSypjNL5l6sdTVnXEw/suxV5qTPpMQpk8n9rxMCMJB+x2bs4Pu
	g9D9UJvB0qyGLtPNtNFAYngZbgjBvTSfyQdoYCRbK29TZydVd2QwS6cf
X-Gm-Gg: Acq92OE07fDCLkyFk7xx/BzpQ9rAwp0hqWWmDTdEpS81DrVqjKobGv01HK+zl2HpPrH
	0hJ+LbutZMvQHV00gYgte7rSawzAfJlJVSdfz4RwRoA31Sk6RSCeflCLo/d8R9yEhVeoOJrGS93
	Vz1cs6rN9PkfOE2dYehMWJyaF9MDOGT2CfazRW8ZlGrjWhxA0LGxSZSgov1Kf+a8Z2QtOXShQ4C
	rYUAi5jM7Edo9/9t73iubOETWCM2O0Qs4HGkuWarJi2xLYkBBPKySBTWu5lL8omZnUPg+1+X8DV
	1JV5pEdAmqOf6DB97WWdEdt7KCkl/mAWvPhG5zOePzIxsxTv9kO6aND787irCc3CJK0TLTDQEM1
	oGOfWjKloNnFiZXtqZZOxaWAedR9+c4P+G45rmUs6tOYw00wNcFREcHPNgEVsCLZHmDwFfOsPGR
	rf1VJmwucpzZRj4HJP8ZV1h5anATso0PGBMn1y1swg/ezJxagWJ3I+x52BFz2/Y6AIRIAP6aUVe
	gWh9A==
X-Received: by 2002:a05:600c:1550:b0:490:48a0:b87a with SMTP id 5b1f17b1804b1-49048a0b90dmr56445365e9.9.1779497869303;
        Fri, 22 May 2026 17:57:49 -0700 (PDT)
Received: from ?IPV6:2407:d000:508:aa0:95fa:ebc8:3e52:4986? ([2407:d000:508:aa0:95fa:ebc8:3e52:4986])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm38704615e9.1.2026.05.22.17.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 17:57:48 -0700 (PDT)
Message-ID: <ac5d0889-0cc2-478e-9e23-bffdc39983bc@gmail.com>
Date: Sat, 23 May 2026 05:57:45 +0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: selftests: elf: Include <endian.h> instead of
 <bits/endian.h>
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Brigham Campbell <me@brighamcampbell.com>, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260409164020.1575176-4-hisamshar@gmail.com>
Content-Language: en-US
From: Hisam Mehboob <hisamshar@gmail.com>
In-Reply-To: <20260409164020.1575176-4-hisamshar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Gentle ping. Could I get some feedback on this patch?

Thanks,
Hisam
