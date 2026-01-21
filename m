Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F253570B9
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 17:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769017759; cv=pass; b=Qs+m5QWbDPMeLc+GZgX4OBt3KF/tc9gdDGXjafUT/X9HQcamLbTigLxm8DPtFuX7vdstD6QAoYuNhUL/EOxoVzACFnLY3Dm2e7MGGi/i1sPTGgjjfUlCUOd581EtE+3YxIdy7fqMwdfmhjsAN40u9I2PR8IZwHT6V4tMczybHxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769017759; c=relaxed/simple;
	bh=bJFETVB/8s8S+qYtgcKAGSY8PzpZ48UQChgv+rtMJf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+E8sORXmiJlsqnaCCqlXBYejRpBQT++C4XLD8Kth+s8BWkp1FGhkO/vS89JsWx+rKWMvYV46dZFKBGOdvnuCM4MUu8HNJ3IWKAZuKz6zpqMrgFIgM26X+KtxEvYVfdF4X1WHnK19+pz/lbxk4TRxzWjjKghAD7rC7Qr8edFy4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bS99YozO; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bS99YozO"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-502acd495feso540951cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 09:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769017756; cv=none;
        d=google.com; s=arc-20240605;
        b=Vn6zYma8GDfJSo69LalwSFXdg4zRswRdK1C43f9fYQZTNqQFGshs3mUnuftNeVRHgO
         t5RW9XDVxUscUIIcyTuMGu48sz/kaU68qyxMiuAnVxj2qpzO0c+wzhLnS1kLGcEaggCQ
         VguEjC4B/LdDlAA1DoquV2FGbvy7wRn7Wj490BMIcuDaVKYzdjRGUA6YsEF3ljwAerv/
         SAzRgoJHlFOJwm/Ze7mJyaKcfsOOUS4dzcfLJVPrIVVvoPjevCKsejKwxJStrA1twpG8
         0liv7flrUamdiJTGw2eNM7tfOW5MuLve3P3csMhleTtzBnmK1gitbfw7mbhd4oz8EP8w
         q9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJFETVB/8s8S+qYtgcKAGSY8PzpZ48UQChgv+rtMJf4=;
        fh=laX2JirPVGgt9MYbjV0UgfQdP8oku61UmMV2uMVoBQs=;
        b=gYtfnWaKLUJkMUOonxMbyMDQ6/J6SyKcP9+NL2nU+QKkC75OxOkvpH9jZUKRlX1RHc
         1n/0fX10Lj/mtE0/9vCW2ZA78oWD0umRkj77jAMfi/D/x7p7J/hted07M4CROhEtTOMC
         0gJzB9QqYAeUCXkEmv8ydaOzPC2ovkQESozYEeXkxkTUXs5HUK3HfarKf7yagorFnaYg
         rNqZHllpYavh608zKRCZje9v8rQWWxiYyGDnnaO8YYACXFPFZWqRZXpuunhzg6Ol/+gN
         F7uRE0K0xEc6K9emMmOz4TSH7u5f4ZHl2PFJKG5Cel9keYlLLoeNRr1LFRX7QBwvGmDm
         dPsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769017756; x=1769622556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJFETVB/8s8S+qYtgcKAGSY8PzpZ48UQChgv+rtMJf4=;
        b=bS99YozOfoJEhLuWH+S2Ufx17Dqd6EaKu0zsUKsj/G5YEfGKcvr0OYJXtfT8lNC69o
         m/+uZYWdBdrTKrL8QEpikf1epZgr0u98df1nW8cbo1g2JnT99K5sZ0tpzQaI23w0xv7D
         TG3zcc5qIqqcjwJ9bG3PYu/8JoqCD4cuIW2zHPMLs5wYjgj56H22gd3GEdg+SVt1HX32
         89x4MBhHLN7ZYXnArAb1GGwhysTKUesVbGmwmcbG0j0xUjGQ4eQw99fDGS34cRPhfLSw
         7mKagQDU9+yEFd69iTuO0NMcz7wEuUfY2XTEgrwlJsbvowgBNrRv+aSPaye0E+Msotlu
         9VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769017756; x=1769622556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bJFETVB/8s8S+qYtgcKAGSY8PzpZ48UQChgv+rtMJf4=;
        b=iqKdHrX50nyBvgr3eQD41ytjkCuY9ufeGgQwk3jcMDJdRAf2UYQJ9JWjPCWRhTfV1o
         AHpOjUOKG9bLVe545mKasC4jD2CuNaEJVxFwgnl+MefMIc/Hw64Ee2iJiPlZxcSzHTNh
         T3m15DIv6+XwZNCeoJnT5MD+Arwwn70W+454mGr3CirucO9tYMGPN60EOYBIGY3XCPli
         r1McW9NkPpmbjTvNu+QQC1B3pbOx5egqmG2jiytCyp1nGKQaZ3nymhJLsAgBqwA4eJEK
         No/mpywd/lcwIZ/tAj/o+CWc5382eoVaChbuEJghyPladfhZ8FA9ejlDt2oNkRH71JNf
         /CvA==
X-Forwarded-Encrypted: i=1; AJvYcCU30u1tSuXZ1+UvBFlhtFLg6hgKiw7+76w91YM/BVjj63lKUU/aFBUrLPa1P2hBes0csRdMqPFhm8RI4d3ffGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaNDtR1pJJb6ufctfOX9uLST85BbwMpiAT5FU2dzgClQvGgLP0
	n+0fTBSUaDf+CMkmLi0ziImNgmM+hvnEPUqboTbSzPIXB6z63qCL6w1s26xIB0f6la2BGU7Tfku
	UUyBDigDYZzoVsoVKnJBlkIylE+uF+A==
X-Gm-Gg: AZuq6aJnGij3Cj2PdtrmIBv7osuGtzoQZjJxKqOKHyM/3K3ufnX2uCUHl2A8TIkNsrP
	PHJ/Pqs9RYJ/H9gsYj7I+uDHWrngUA8hWeMR2OzkBiN5z2V+GMQ6HpJMQOyWn7YWLHwJUQ1rMUt
	Qra4BJDB2EIRCNeE2Kuf+vN154DsmDShyNtrgV2npfOf3gHpJD4BN9q7sbwvFwGAlgGJGxOfzql
	uU89Zra+sl1KO5Btq9sIpPejnPSzxZKTPMzsAGGDTk1YeuObGX18KgbNPFe9fZfcdxhpg==
X-Received: by 2002:a05:622a:138e:b0:4f4:df23:ab5d with SMTP id
 d75a77b69052e-502a1fb819bmr246174781cf.75.1769017756125; Wed, 21 Jan 2026
 09:49:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121094114.1801-3-qikeyu2017@gmail.com> <214f9680-b4ce-4c20-85f1-3560624fb49c@linux.dev>
In-Reply-To: <214f9680-b4ce-4c20-85f1-3560624fb49c@linux.dev>
From: Kery Qi <qikeyu2017@gmail.com>
Date: Thu, 22 Jan 2026 01:49:06 +0800
X-Gm-Features: AZwV_QjH6BXPXrkEVHqbCx-mJw09CMFyRNHihec20xuFw-uHKCUvM1lTXAVPTr8
Message-ID: <CALEuBam-2=QcXHH81RPdEcQ6zguY8EjzUt-Rh3BW=fn4F7vi_Q@mail.gmail.com>
Subject: Re: [PATCH bpf] selftests/bpf: Fix resource leak in serial_test_wq on
 attach failure
To: Yonghong Song <yonghong.song@linux.dev>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, shuah@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, yatsenko@meta.com, bentiss@kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the review.

You are completely right regarding wq__open_and_load(): if it fails,
it returns NULL and performs its own cleanup, so an immediate return
is correct there.

However, my concern is about the next step: wq__attach(wq_skel).

If wq__open_and_load() succeeds, wq_skel is allocated. If wq__attach()
subsequently fails, the original code returns immediately without
calling wq__destroy(wq_skel), which causes a memory leak of the
skeleton object.

The proposed goto clean_up is intended to ensure wq__destroy(wq_skel)
is called specifically when wq__attach() fails.

Does that make sense?

Best regards,

Kery

Yonghong Song <yonghong.song@linux.dev> =E4=BA=8E2026=E5=B9=B41=E6=9C=8821=
=E6=97=A5=E5=91=A8=E4=B8=89 23:45=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 1/21/26 1:41 AM, Kery Qi wrote:
> > When wq__attach() fails, serial_test_wq() returns early without calling
> > wq__destroy(), leaking the skeleton resources allocated by
> > wq__open_and_load(). This causes ASAN leak reports in selftests runs.
> >
> > Fix this by jumping to a common clean_up label that calls wq__destroy()
> > on all exit paths after successful open_and_load.
> >
> > Note that the early return after wq__open_and_load() failure is correct
> > and doesn't need fixing, since that function returns NULL on failure
> > (after internally cleaning up any partial allocations).
> >
> > Fixes: 8290dba51910 ("selftests/bpf: wq: add bpf_wq_start() checks")
> > Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
>
> Acked-by: Yonghong Song <yonghong.song@linux.dev>
>
