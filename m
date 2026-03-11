Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D831F9B7
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215772; cv=pass; b=s+7SepWkqWcpV8WoEd9yosrWn7DF5hlKov8OSc5Q+eGdezW155fDeW6M9i6rEcZ86r279glhl0mb5mmCsBx5uviDur+CS4x2Cz9WRffRBplVWHpiwv2LAW9bbH2o6AKO0Kpn4WccnoVIkL6XmE7fyeh1RbiU1rOWpuhetJtWa/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215772; c=relaxed/simple;
	bh=lAGj6nwkp++G9k/rSCeEKSrGzcAUEaSnQ17uO7koJgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJJ5+Ubp258rV6tIeWJVLEkNJWThaW04BYb8V6oo6y+Rg3Oxb4jym/18zkUqD/7ZPLWakmbLC5Qe4Ngq5fO34FNIgUDr4YlqoAACGVC5AktrMDLh0PjTbJpps31abn+J2g/g2qD4Il/LT5mybNwmEI8NmrJ3JoZ46gJrneAi/9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjpNT1Sl; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjpNT1Sl"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78fc4425b6bso138959947b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 00:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773215768; cv=none;
        d=google.com; s=arc-20240605;
        b=QqRn4FhIjb+gYQUh9SqelNTKZDpyopmgMmaUxtbAA2ZBLzA0mK4gp6tQiuDcCKaE2m
         C7YOvLd2u7zftSRdEQq3qBdgPZD+VDYAWHgFftV4Vpo6MKVpoPgV6ZoIUhbqb3t58i7h
         D5z0RUhwkZSfhIfXa47Nq2umg5Mp38KQxpA4SXSlzvNIjTLGMrj5B9t7+dJSm6ve68XY
         SRKqnwC1xwaRrEGY7Ni8Ivwf4zYHRTFcPPGZI6JLTfX3syLjagOr7NVRO9Q1j1jcPeFs
         ThpCHD9OcU2Mk/m30BZ8RDmNcvFixhQl5Ah3lXsl4OXmhsZu6gvv1F9Pv3WLtynrRris
         M3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+EtDzf/2qX0/pcxNehTrmnkTztfsdGIQ04FR+hwnLr4=;
        fh=Ok08VfYyTiM3owvDnwkcGjM1euog8zJIRCRevkvVmNQ=;
        b=PRccPZ4lPuvrulAY58VUZs/ky8+4ZLBgDqmoAj580x4lWYY/z23i0+ub+ZruzoBKpy
         YmME4ffNT9gcyTZpAgT/3EMwnV9fsxjCEwtrOPfpguOV3pPa0aQXjS1E7KxT/HD0ZDbo
         kqQu1Yszuivd0xWG2mHQNWZs4x7SKden85hH+yYfVAsCMC6w5aNtOl2mVKZCft8DLjJR
         XcXVuJIlqLHOGvn40VE3QQvMyBCigtuAiMReqE+IX4xu36Mk2b08oBuQlvQ72ecD7YTE
         xUovmNKicHIOu40eMylKxw6SWZG5zhDM3KuPzdZ5KW36IPy6ReM6niyqAmyI2Jwyhg98
         d0bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773215768; x=1773820568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EtDzf/2qX0/pcxNehTrmnkTztfsdGIQ04FR+hwnLr4=;
        b=IjpNT1SlxlKtc9YXp5U0aFqnpqWyK0m+bOzVnDOkyI+zsMmbyytD6uiu0UiZDZ0KJt
         pp1www2jjQdTjkJ9NYwrP0sSWl0njQyDKN15odjgWfyNK5/4idOOKVFhLqGi6TKDpTpR
         AcxvHCeWjn6KfkD33/dOE3DNzeD1RapOYtDTkoAQ8VXiuMIqcU5zv81s/hRhxGUpHI/R
         gVldmfbldF5jQxCrtbC6iXx6/RZ53Pjtj5NxuPzGI9yTdX6IiBcvDkUZqP0mBOlPnVzM
         aEIikeSQibtBVzsMSeg2p0eKzUDOzptOvJSRa6f7o+zXRcnW2j3MitLfGovp3Yk+gd5U
         vJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215768; x=1773820568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+EtDzf/2qX0/pcxNehTrmnkTztfsdGIQ04FR+hwnLr4=;
        b=v47F89Iwd1eGVZi/h4mnNlTX64KH2FJRrimMqCzrzJ+szJOiONM6N9YbaFzR+I8sd7
         qaV2KcmYVW66GAjiPrzJ+AbZFeXMO4hSk6DtNnDlRvpyp+Ouy1zskcX5nNd+RnZyRRSk
         4omdmqshc/XLDDbNzBr4lmS9AKpdqMdHxQzL8rOgBt7pspkCBP5FJ9FXkZIQXgrImwAa
         y8eu/qdXMMFihBlS5LhqBKVqLfgP7dNwZS6E9Yt4vmXsg+to1zY9V+/VYRWnssmOb/M+
         TQU2+wgOlStlb5VCZpj28HHunWdsXnWHYnjgp9IXKHkiR61fX+2QgTItysmpe2rALYPG
         fRWA==
X-Forwarded-Encrypted: i=1; AJvYcCW3c9yhwnlt3lpnU1EDnAW57C2ErH/1A4j8EJYQ5rcLRL2CRQY7eimR9WKl0a3I4Zn/L5aauaMmYek8ia1sun4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+IRyuyTO1eXNgExBAGuuwT2uuSd/bl/NFkWuTXiMaKxy4dQO
	yiMer6FDR/I8NwWkEuCY90swmcFUuR1Rn4BFYbeoU9KbapEgL0JMEVsgYXJ+YWvcCM/NIapQt2g
	z0jC5oUlUgcgqhNR+ahPYs76S5c6vhj8=
X-Gm-Gg: ATEYQzw15sRsPVBu9Q+sCphUzVc7p+/o/pfdFHxW7g1r1C4Q62aiaSKV3AzWETAvIWD
	XRuOZL5V7nnV+vlRA76kQzXpaF+EmsQUhS0gagx2CTGFp82WYNgABt6p+cvZelh85VgF+oTHByT
	BblTS5T+BnEpbQPeCKmtyJWX+fV5wWmuxycTtm91JO04P7RvEmF4ZFbgoVicBQP0fmY3IfeNep5
	mfdXtG5Hy2IXY1reDO/+/3GyC35TsKW5J63GHOo0CpDGinmUFI3otfR108UyvFhCyW0dq6ni6e1
	Z1h5A1Lhur2vw/B+MUqzKKEaiovotA==
X-Received: by 2002:a05:690c:2704:b0:797:f13a:c571 with SMTP id
 00721157ae682-79917fa5df5mr12806597b3.58.1773215768327; Wed, 11 Mar 2026
 00:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310102145.857810-1-sun.jian.kdev@gmail.com>
 <20260310102145.857810-2-sun.jian.kdev@gmail.com> <f0d1eb34-2d6a-487a-b486-3dc64c25df6c@redhat.com>
In-Reply-To: <f0d1eb34-2d6a-487a-b486-3dc64c25df6c@redhat.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Wed, 11 Mar 2026 15:55:58 +0800
X-Gm-Features: AaiRm53EkzwZReT_wk7QVC-Ygi0J86_yaQ2oUG5Ism0on_mG6PZTKx-yHNgXT0M
Message-ID: <CABFUUZFQfoVRJ6HJqadHhWNj4FVOk=snuSmuEepMD6jZfyrpJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests/bpf: Skip bpffs debug iter checks when
 unavailable in test_bpffs
To: Viktor Malik <vmalik@redhat.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 8:32=E2=80=AFPM Viktor Malik <vmalik@redhat.com> wr=
ote:
>
> I don't think this is a good approach as it will mask genuine bugs that
> would cause the files to be missing/inaccessible with one of the above
> error codes.
>
Hi Viktor=EF=BC=8C

I don't think this change masks bugs in a silent way. It prints an explicit
INFO line when maps.debug/progs.debug are unavailable due to
EPERM/EACCES/ENOENT, and it still fails on other errors or unexpected
iterator output.

> If you really need to execute the rest of the test cases in the file,
> how about you split the test into subtests and then just add the failing
> subtest to your DENYLIST?

Proper subtests  would require reworking the current fork-based flow to
report SKIP/FAIL to the harness, which would be a larger refactor than
intended here.

My goal is to keep this as a minimal change while still achieving the main
purpose of this test: exercising the core bpffs operations (pinning and
renameat2 semantics), which are independent of the debug iterator files,
and clearly reporting when the iterator checks couldn't be performed.

Regards,
Sun Jian
