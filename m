Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B69E4BE426
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791387403; cv=pass; b=JEMHW1iLotxmyTg+OgH37nDCZitJ8Fle4Z2H5UBO3bISIABxtCm7VDFWhQYf+J9e+x6QNDm501DCSovs5xDPc6hGSWZ1bSaOD9N/JslTckPQPVk2DxbXdLNZKxFfgDhivaCgyC6ZiGIaMdFVyFfnWWCuJFs5HbvbhY/4GIgIj5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791387403; c=relaxed/simple;
	bh=VIlwNxRfdBd5XK7k+Yn5qCHGcNB8TrH811M/2dEK2D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlqmLxjGgQkTJCaN3mN2BPh32IateheEFg8hbUUnQgdLugXVQf6OgAp2quimoz4V4NGKxRKAvGrqhOCnXqRGjDlMMTiZzYmHcsVZsOppttM64djpxlSQMX0/rhnF2mmd2xFiRHibz18Ccfq5RJ+oppFv7NqKirFbcC5o7X/E5jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7LI/huU; arc=pass smtp.client-ip=74.125.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7LI/huU"
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-754acd5ebe8so3362398137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 08:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791387394; cv=none;
        d=google.com; s=arc-20260327;
        b=bihtbqObutF2acABZHOorl8e6I1n7QH94eSveekRNT00/1D7uno+jWLdY+QdggRKew
         fhLeJxsKL8QwIgUEzliglffNkqfB1kYNMra27EW4UgqW9yQVsuADteTRSNqt+E8Eu0gP
         2CK6pbplUHrFKcYYyI5Bx59vXTMEXMteJPfPxuljQ8qx87DNAfEKKGgnUQk9DuOjm6Mj
         aGKoWnxmQrlsYU/PeSRwa9e66ldSzRa8kyX8jsDkhX5eWwDPip4F7Gx9HeMShPK6sPv/
         KHTZ2c1K5CCbIXKdhYi/5HRnbUc4McrE2lWuldjYOe4OHchsMQncNTPHDpnyIWWGd2WL
         iNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIlwNxRfdBd5XK7k+Yn5qCHGcNB8TrH811M/2dEK2D4=;
        fh=VxXZDvCWNGyGQDy5QZvib6iTxu9YrrvzWmGjrMTK0s4=;
        b=lCAVtujV9yad4Hil6bPmCOgwWhI2JURrGpBGFo5QMrLzqe81w3W0hkV45+s8N0noye
         2fH2/x3uJ8aGxPYTImlrkg657pdaZ8zkawuEFdw31bvxZgunCLWspRaBdKvYCom1AMkd
         1Y7jVTkhjVSQ6Iaixwy6UReiJNWozF/dM9RcQ2vucg+1RpkakNAueU8Z1G0F/tLDEPVe
         MApMSu6ObL8gg3OVuPKFBgP8TgVTd2uv1cey/iRNVFfgVbzhQX+5yeUFMw7WxypfzJ69
         c3FPv4Hqa4OxKy7pkOr3VcKuDXU8Rh6L5Mtx2APbZ+/gR95AVpZIDLvCVWEtEG3f2bfo
         DR7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791387394; x=1791992194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIlwNxRfdBd5XK7k+Yn5qCHGcNB8TrH811M/2dEK2D4=;
        b=k7LI/huU2qDMJmkL+bBVEAg9JXf6gWlj2Ft5BFK6OrWROExNpfcfgh58pnRGDVnZaM
         DkQRdbITh67m89tUCOWjnioK8Ei+m6VcBudKEbMx9fa4GgX92CyjWFqx41O0Y6MWOa7d
         xfQdWeEzRpnNrUGGaTzbrFmwrin4TUjeu33VxinQcxECqrOj/1iYTCLppQJ9uO8/Mol8
         TlL3kFrGvTrrXIJxzDCMVYl4bSNQNUALDWHlw3sJ8+WZrcyMd6awY2iRAm0cUFpLbhW/
         bszkS20aiI3aPyU8nIhWjcPfDpow97rAv4jXtqKtJAull6hBeV3A2dKI2ZfHcIvsbZhE
         8Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791387394; x=1791992194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIlwNxRfdBd5XK7k+Yn5qCHGcNB8TrH811M/2dEK2D4=;
        b=yQEYP8zBnw45QQ8Y3/RYFAQa5Ri2Xt6pJm134Ohob538haccdgllaLyQhloHNH5Q29
         vd0dnAeuVV652p6TST7gezg5hpVyICaW+bTifBWLBOCJQuuYGzXzYv5wmjZRza6psPOb
         cRd27dW+7wmkE6XHt0zrIQ7QCNbYqElE0qJ7SnsfNAlPZ6PBkVNGoJmg15IH7GsDeiKV
         HobNr85qQKD+AbvjyYKm9oXl8ZrRgPbfaCfSeVFaCjW3TZRSxG3kj+xAqcQ+Otb6Oq3f
         +hSlE2cQ1xghLqP5jey78iiZHHbmruCZiahjml5ggTbJrHYDj9EskY62b2DWV3pIwUUD
         lRUA==
X-Forwarded-Encrypted: i=1; AKwUvBw5F3/7BK1CJPn2it7EPmWWRsbm7T9RrzELJHMICy4H6FE9m96zkhFc1NGGVQL7y5SKqAtbcPWZjNyn135Oom0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeaRMFd7WTteRb8RSymYScbp+3Lev8SB/+wZybrlaDCP52nSzH
	7/ss1fJg2es4+PA3pJqlmsmaGtxwLdtP+dG6LQQlblHXB4rzXDuuOz7q6aG0eGYPOoWkQwfckIZ
	sQwED8XVRdk6aar4vaV4jR8Iu50R+Y84=
X-Gm-Gg: AYBFou2u51TWNoW9/WjOlNYAn/9aCXgedEvaAyGNkWgYzwT4d8wt9qgdGtruu8KKVbc
	GlAkQONMFQDaOohKEzXZrsGgu9KZYTo5d1Grv1tw1aV3sv4kM5O9i/M15oWsd/rOWPIkmIpOcim
	xSZQou6lr3YTNw8uk+/WKhnXjwsHDHr8I0J2N0Ux8/56Vn1iE2hVXtjyf3qCcoSxQmMzbEjcuTh
	LZN/+dMMOWT5LPBB5hzsbLiNCQ3Wit6OiU22Fv2P8l2h2xeXp9/HtQpUlRCLCwoZ/axzdNSdNEF
	DWnO62QVF8H2deGmWcsc23dA6H2j4WvbRrjg8akyAW8Ysg5821aHtIF+tFrreBRUDCBkeUoAHPz
	WlqbHfhn0x0Fx
X-Received: by 2002:a05:6102:c8d:b0:7a5:391c:37ac with SMTP id
 ada2fe7eead31-7ca38a0cc36mr934178137.10.1791387393843; Wed, 07 Oct 2026
 08:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007092801.35649-1-jaeyeon.lee.dev@gmail.com>
 <022ec915-62ab-40d9-8705-90692e75acfb@kernel.org> <ce49e816-ae77-4c64-bd28-168d8ca52d8d@arm.com>
In-Reply-To: <ce49e816-ae77-4c64-bd28-168d8ca52d8d@arm.com>
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Date: Wed, 7 Oct 2026 17:36:22 +0200
X-Gm-Features: AclHuK_qZVYeP9e6a3BCk4ZuXrh1Fr29YQchvsleR4vDz7zanz3IAHpg3zmw-tk
Message-ID: <CAD+X6aDjhCGt_Btw7pcoj8uT4-tiTHX9+wEQQ4yjFx1KQj11VA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/mm: hugetlb_madv_vs_map: fix TAP plan mismatches
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guillaume Morin <guillaume@morinfr.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:01=E2=80=AFPM Sarthak Sharma <sarthak.sharma@arm.c=
om> wrote:
> Anyways, the original code also calls a ksft_exit_fail() in err_cleanup,
> so this skip is just preserving the TAP test count, else we'll get that
> planned tests !=3D run tests message.

Thanks for the review.

The skip was only there to keep the number of reported results in line
with the plan.

I am happy to send a v3 that drops the ksft_test_result_skip() call, or
drop this patch.

Thanks,
Jaeyeon Lee
