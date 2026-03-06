Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE31480335
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 20:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829696; cv=none; b=u95zjn5OxooGp8XT/jQok5ZHSw0oMJOqBw8tY3Br0ySI3kfXXlXI8s5PF/Y187CSJ5mKh+Cqd+AG5lUg8zmQKK+aYrxVovO4+yfwDU1f8aV+Ef3egzI7xZVyGgGlPmkcILbc18IzLPGf9MKnzHnRVT2/tQdSn5WduGhZ3QQf3i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829696; c=relaxed/simple;
	bh=xe+DXwR8c5spGB+Cxg4nkauvqxAU2o/QNc/tzDqcYbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDA4RmgEtKWVSZ1Yqpge3k8sVYFq+OlYnQmPY67mYgBs93kBMea49C4gZv1oC6xdwnvVRhJwA+O+EVEa8a+paz/3/3S4Q3VorLg+EJRGQQCh61z9AKVtdQd63uxqqKDhV3byD3tij0uRMbSv6g/IwK2HQ3UVnD1kr0Fo0XdS1Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gdAC/sgx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gdAC/sgx"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-660f1a1e977so4022448a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772829693; x=1773434493; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AYCYImW+JW2wgi9uTPYfNWiWlHbrFKxW5h2M+saYbtU=;
        b=gdAC/sgxb4S9WQNWoIfI7bwrL5Wn5S/cnwsbeMUKHJpNVZv6Fv5jA8h1CaZ4qHOvkJ
         HsA86vxadDiGidW8238DvTq0xc8OC2t9P+7HdyAR0y5DAfgQAHBV0lR5wvW89mX3au2C
         drT5e9TBtj7ZD77T4a9pf+C95GJTZuSMo/1pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772829693; x=1773434493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYCYImW+JW2wgi9uTPYfNWiWlHbrFKxW5h2M+saYbtU=;
        b=BkGuaRsWeAVz1XWXhBfIimsDe90nPWU8rk4XkPxaALPp3aXTqmnirkhCUK01AaKawy
         yz6bKDNQDSR2eArlsNkUBwgotqNa0aDQhAgimFsu7xTVYYKQ8ipB/fGKpUiUvDFfS8eP
         fZ2VJbKUaUm36HUe19Fgg16NLRX/2ebkEOL1foOrF/l75mSIMuL4TgYnMDhMKCm9KnHk
         2yECOmgywITEwew7pLaJwbY53HXAOobCuFigvSSoPj3z124rAD8lIyeHmXPah67EDQkM
         y8rUPwCfhSXr4ofLevotxZHOCi6XjBbgVPf8KioqwD4T4CIfEizncOukL8teJYVgVfIB
         +ubA==
X-Forwarded-Encrypted: i=1; AJvYcCVSS069hKA3hh2mHET6jsiChlXypssQqufa7Kft1r4JFjRWHiMFg0hypnE58GaKx5dJIEp58pJ3r2LGbDleXt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCna37DJ+sFJWU+hqNk++L5uiL47DLKts7h6yCWNyb2B06SPe6
	6/5RVmLetgIkx90UuT2+BM0aVoIwKPVeYtrbiesx9acbnkN14DtF/GCgKKC8UGrWZiVOF+/66GN
	61TICv98=
X-Gm-Gg: ATEYQzzny5mwR/hJHdzzH0FjfAZQw84sYRtR52Hqve0KFqjeeHyTGfH5RC5lekBT0NY
	Z/ykPAR/eFF3fu2Tg4qdIYqIWW5xE8N6IRosnPjJuOy0gyWeQxbvYwrkS0mYr/HtOS3mRPFhcKm
	VA7zD+xCTgvOQ/jUPpcYiZ+sEoKj5/wxY/AjyLCHYyxMCcz4Oq/sD/1YWvzNcFfxWoqmnFGM24P
	aWxK+hSBVpxhe/HvUxGLH6sXZ/0RnDuMBMfAJiB8b2IMk21rtsk84GocH3NufVeEpQSU5HI9w6J
	RIr5aewHjQQJJWPLXqKct6WA6qfrlNIHUZs+Rcn2iM06rTU6cn5uSc6O3sPTiq1bvvVcYtIC+dR
	ArooZ+LRTxmJuCv3TcLCH4OarYN/0YWvxss39hUY0BgrjOeGJruNzgMN0I9UB9sN2qxC/I9Tyi8
	Bt3OV99zX19pgaGg1JPh502eIgPHouS/1lTOQ72/3/IyEbQxaaPsN4DiFYCns9wQJBGxkYyy/W
X-Received: by 2002:a05:6402:354f:b0:659:3f29:22d1 with SMTP id 4fb4d7f45d1cf-6619d4a6067mr1806448a12.4.1772829692693;
        Fri, 06 Mar 2026 12:41:32 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3e692dcsm709800a12.12.2026.03.06.12.41.32
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 12:41:32 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1178836966b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 12:41:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWN/HFL/bCqHvUOPE523JGUsB9iaZwOQ11I8fyyoKe9BpXahYtgLGcCtgegSQJKwwjj4IbAkhr0vlcl1+OFXg=@vger.kernel.org
X-Received: by 2002:a17:907:720e:b0:b94:29e9:d39b with SMTP id
 a640c23a62f3a-b942dfc0ab5mr195388366b.43.1772829691976; Fri, 06 Mar 2026
 12:41:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ed050fc0-bc06-4e8e-afc0-86c770848f93@linuxfoundation.org>
In-Reply-To: <ed050fc0-bc06-4e8e-afc0-86c770848f93@linuxfoundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Mar 2026 12:41:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=whR5vYchKJHyfzcEgyW-ThktX=RUKNBgwqBxyO-VFPajQ@mail.gmail.com>
X-Gm-Features: AaiRm5245OTTlYiTzy-fHiewwqRCSN1sMuphGFr5Qezrjhpm_ATEqWFUuk9nXwM
Message-ID: <CAHk-=whR5vYchKJHyfzcEgyW-ThktX=RUKNBgwqBxyO-VFPajQ@mail.gmail.com>
Subject: Re: [GIT PULL] kunit fixes update for Linux 7.0-rc3
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: shuah <shuah@kernel.org>, david@davidgow.net, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Mar 2026 at 12:30, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> Passed my repo sanity testing. x64_64 tests crash on mainline
> and my repo because of a known issue - fix is in next-20260302?
>
> Hope it gets into mainline soon.
>
> - https://lore.kernel.org/all/20260226-ungeziefer-erzfeind-13425179c7b2@brauner/

Already merged as commit 28aaa9c39945 ("kthread: consolidate kthread
exit paths to prevent use-after-free")

                Linus
