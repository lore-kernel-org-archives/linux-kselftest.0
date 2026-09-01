Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDED34CCDC2
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 04:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788237081; cv=pass; b=FrTqFgqRNPbiRxtEoNoOlu6JvBl5vmQXlMFf3MwVSlfGiPfG5KuSyCnRxqpx00RbvroCc0uMUF00pqWXdDztU0UvQ3fQYM/pV6al2owzlPcOJrl2WFl6WJGZCqPKoj/p0/jD6cArbjU55xcDmG8bwHmqetUi9J1HyQwRbxdkis0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788237081; c=relaxed/simple;
	bh=FX0nhEKouXbN0cOaxQkUE4HqDcyHbyV+RINDYZ62VQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3547iApSgAo6RTLOcksdvpgV4sJdocOPeXqvfp05nzlrK4MvCbJ2vytW9zcxvT3gYR8w9VobDKBYssJ3musGoz1YJdDY28aQn1BA1HCxx5OOeEDGdj0fHirbyXkI/nxJjUjGB6gGDmVEWkqnNXeN93wd7Oy3EGcskMmJoP6deM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bcvnM0Ev; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bcvnM0Ev"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c10e86e52so112491cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788237078; cv=none;
        d=google.com; s=arc-20260327;
        b=XGdxhy9AJBXw7OPNeEk/s2G/pmLOpPl63ArHYALff0H+f49U9E9QGVcZLkSjs0lT2M
         cYRJphyU38nm33wChrTzeudrNw51RV5D8zm4GE42pYCIKUr4oVF5Gnr1RZuWqoARnqjq
         ktiHK6nYqViANms8ekpfq1poB/gAzAat0i1VK4J5KVfhQ74n2+uQj9hJAO8hhHYpmFpH
         ERLvnZRNIHc5CbZsCbI0+5e6uPHNhp0UlzVsMwjKqVoHfPC+sCB7lRbMZxYjJMBeSbpE
         hVjqmO9LUPysde0vMWPlwRpJcmTTNmWazn+azqZIs0acGNron2PXZ4AD9Gi8Y0l5OcJU
         iQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEJ7OhBX5NB/UHZTgvDkxBk1HpXEXeGzsORVysWiviY=;
        fh=zRllTyGP75EkooS5KSomO42MmLsiiC9ryILxLvqR4rA=;
        b=Rmiml1yxB3j+4ftAOP5YkCOb/Dk5W5oGuKXLIjiqpOE+C6up1O9caUsw5hu+8DezMS
         iQ5/aGyFqJeB8UTAm+JdhQnPaWJa4Cc7b03RZi/QhMKFn2DeT7dPvgCvK3MVkW8ecc13
         ZSQTnvwmXLxhD3QpDFz+OY8ChxYM5NrYK4glEZsETcCgXcFd82hbUedjjmcSexKw4OOG
         MI+ox1LCUCOXKGcxMqad+x338nR/sUlRO/gcWX6rByBzlT2xvaOb7wko9sC95CrxPLTz
         HkQSr73eLHd4hiLqbjczSOdFtwYZsBCovWAWnzsElUALlo4wjYAuSU9oCcClQ+UMnTpw
         sRYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788237078; x=1788841878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEJ7OhBX5NB/UHZTgvDkxBk1HpXEXeGzsORVysWiviY=;
        b=bcvnM0Ev1rsjLH4d9NysaloWAk6hH35T3e+vJmZKrUlrO9claYdXj5mfE34ZzGPsl9
         zmxh6PMIVyKikRDplT1VsSwsRjOkGDVaRwHK7hXDXjeik2PuVUZhTBTEg0nOA21LEzN8
         qFPqP887U+Yn2a8PIYiOvJfPM/fT3y4lADjplwdyTiHAH+OWvnsjB2Kc07hTiDgKobXH
         oJqfBIXmriHuKoJZg74Im/voBwDc56+V9C6UTFugcln99MCGFhbYFP1qvguqF8dt9ErF
         D6J5HxPAzhZkxczPtWWT9uJd2TTCMoaVSnJVoCe9SfEXq8QnpKvMu24Iw4QFEsbs/HuS
         v30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788237078; x=1788841878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEJ7OhBX5NB/UHZTgvDkxBk1HpXEXeGzsORVysWiviY=;
        b=i5tyGs651MObDb5XgSFBkbnN2PlzgnMXBebvnrXmPtw2K7VpovEtbLoK+umvq1qnqG
         bwOmmOr65zSZ+/jPZ6AfRZPuehNDRZkbpC3Dx68fn+95L9QX8RfTrZvwzowahta14nD9
         GK40KZndmfdto1pi8QVZGXYA9lyXQ7OIP0OLBeFdugzgPQG4YA+JdXUZqh6CJQi6Z3rF
         bqZumIgwuzYjZMvDC8U/nY4Jp8R49esrTuQHfG9AdTeHCfXYJ+ss6AlcrZaS4doVca9+
         8FEfNO3PWavWPuWMsNBocOTktkYU1j2dTYsSOqb9MgllBHGRnIBSg3f6KmoA3kxqOf2E
         QWRA==
X-Forwarded-Encrypted: i=1; AHgh+RqStARLiCkX4URzM+hfiHvfP3OUpU7H9ncv7mMcD+nkGAER8LmT5+a8VBQU9icg7GfultXxK/WCbPOJCtnk+GM=@vger.kernel.org
X-Gm-Message-State: AFuF++lV22ZqXot5L9d+ef4HHfoXSZ/6lmauQddJlXpCj5zUG24zMMZu
	cAs8yz+iCls49DsckURLdF4xQYxRQ9/TsUfKDNXimowEgp93D8d6hs8IjqJWvjVebmHfnsYxlqy
	3D/XITNnyGs/vPX+JRObmj9YzG3VIT9F+Ec4oFWor
X-Gm-Gg: AR+sD11+OlNcFqdJEZR+/ereCURDXzOQR+XrSn9UKVvz5C6f8jEsGu/BXQXHkhxKv2p
	yj4l9YtNtPAHzlf8dT5Cl8OIZGhb/Ks7Ja4ZCJnzc7BlvDLFtcX0X8RfdKMo2WLksYYBCFJV/r8
	nd+3ycquI/yOrN1tdjwppFRCASasNoxOq/xCQLkXxlqpV+7QD48g6vCbjw4Dmcec3SCdDw2Maa1
	qnRb2puweXTHu7cvtQkvX2qG+sfOj2uq2GbucLDOBmeg+DAIQHXhSjGhCaGjW++vCbmTM3O8lbN
	9AaLou0oKXcxUwgXnytvwl3xqSTqQjJV+OXNcmuE/C+w7V8K3uRzJHlonoRy202qJmjGgT+ug8W
	AcQ==
X-Received: by 2002:a05:622a:4d08:b0:517:6010:7c71 with SMTP id
 d75a77b69052e-53024dbfce4mr7950491cf.4.1788237078025; Mon, 31 Aug 2026
 21:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
In-Reply-To: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
From: Pratyush Mallick <pratmal@google.com>
Date: Mon, 31 Aug 2026 21:31:06 -0700
X-Gm-Features: AcwNN1W-OquKi310z5tOIsz9OK7PtMpaQzdifnWmAOLie0upZ2KKAIgtlk6wDn4
Message-ID: <CALHaPKcyxUMja5-eCcfWq-SOBXzzu_cPOzZa96gewUW-0Xttqg@mail.gmail.com>
Subject: Re: [PATCH] tools/testing/selftests/mm: add missing .gitignore entries
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the fix and apologies for missing it.

Regards,
Pratyush


On Mon, Aug 31, 2026 at 7:18=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Commit 2bee308f3adb ("selftests/mm: use pattern matching in .gitignore")
> switched to a pattern-matching mechanism to reduce churn in .gitignore.
>
> It however accidentally excluded the page_frag test's-generated module
> intermediate C file with .mod.c extension, and also the local_config.h
> header generated if liburing is available locally.
>
> Explicitly fix both the issues, fixing the module-generated C file as a
> general pattern as these are always intermediate files that should be
> ignored.
>
> Since this is a trivial .gitignore change it doesn't seem necessary to
> treat it as a hotfix.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  tools/testing/selftests/mm/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selfte=
sts/mm/.gitignore
> index fcd892ed21e3..a306d7754786 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -2,7 +2,9 @@
>  *
>  !/**/
>  !*.c
> +*.mod.c
>  !*.h
> +local_config.h
>  !*.sh
>  !.gitignore
>  !Makefile
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260831-fix-mm-selftests-gitignore-dd389da72760
>
> Cheers,
> --
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
