Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0672FFDF4
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 20:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064056; cv=pass; b=YJ0pI1ftDstmQRl9SSXNyzB/NsKuRVKnd1c43nPP6nPQ0q5Co7QyQwABSWZBufIxB6YfXiAaeoT0jK583vrbTvCDNv5ehAjvC3VpvIhYowddw7dSOuKDCrPkJkAFnqtw1b59qld3OFPKEvLjOs05xpjuhiyWhaOD+1BDBc6AAbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064056; c=relaxed/simple;
	bh=jfXmnznKLJiTPbD5h8TXzPoCYSLFywcnZTDixTwqnvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvYcPj0TsWgCRbnUffbFnEkbjs5NIqL/+cK2YbNgHb1lT8CIYXqmnpPOKpiYNgLKFZ3uvliYK3u1a2OZpUaTxt+v3H65N7UaPf5RRktXaY2GheIVXpCoTGDXnkX15oKZ9nAQMHpPM+go+4d0oGnfg8Vk41q2ZCjWIjIa3LOGfqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i35lvgzw; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i35lvgzw"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8e526081ceso19944766b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 12:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770064053; cv=none;
        d=google.com; s=arc-20240605;
        b=dkzzjvDhYAaNu2HQNpc30mvDFUL8KFxoCqWbkOQg0Iio8rz2qi53ipaDmA71/wBzZT
         sJrWvWjii1ZZcXCxHju/rAy2H7m2fQ4GwwAiwEj0Q4RCK4FD+8hAV0NcL4cyk2dI4Gmf
         awcfhKvy4bMURujtrSG/+eW+hvZxP0Yto6N7TeMmpSdDrD0El5O7xrBWN3h6FCNWtSj6
         tMEeyzXPl0K5hpiuFjLlbJ1RuuFdz/3g1Fca31hPn6Ig617oYG+/9c5Ks02lk+0JhVkc
         +gsWZcuGqwxaOn9HkDAFzWFZhKdb14SEffyAk+q0rEM00X0AdGP5Pj3HegXitqLOlJm+
         vGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tVRk+zilHW9UjKLQgTp2UA+pwv3RE3RSIRFfK1s01Ps=;
        fh=JBbi3NE2wxgxOb/gWoKqTuYQIHZH1TQcrpREWdS0U6s=;
        b=jpudqocVacgvUU+CA61RY0FQsExiptcijKwX4pcQ34C89H9OJhrLZo1gC84WB/KZzY
         QTGYuyyLM6uFQgiKCK+NFMEABFQEGLeMFeN6FhXBTFQ5Wf5/sldgPQQoQlhH3pz6Bp0U
         F0k2b43b+i/YNdqxxqhj3xh7IBcHtrMyaRM/H6jT6nLdhXrR8EHs7vNDb2LLZc1Kdq1C
         M69WRrpgpzdDiYeS9wO/a+6rtCYWWIyI8xngAFXPmff/Z47Gc86JTOje84PBtzXi49Od
         yT9WmumQCCFaE602hVney3zQ/3lEJQUorNd6ARQUCo/s/pg9gduaccJA4sH3sAPIPvOF
         U8zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770064053; x=1770668853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVRk+zilHW9UjKLQgTp2UA+pwv3RE3RSIRFfK1s01Ps=;
        b=i35lvgzw+EpxLEACaPBJPib1skMRWoVPBETG80k2waGjMfR0bvTZjqFY4pJKbGWn5E
         5z5qZlpRY0MUjIuDeqPiYZ5mJsYcukgBq4FlMWsg5BlznYf+Tb5OQV5igiNXwUBcKK8h
         WanbW26nVcvkhzR6FzEL08DsaIBY1+GGPt4MZnGjaXjCQNR37xzJoWZal2rtGXPrqIhH
         YTiFolGNtNFzwocVne0qhe4Glb8NUm+b4eM48yuDO8eM0RLgYVgm3aCewqU8C3vJdBRp
         aumxQz3314vbyn9SMtuvn8s8DXlZfqEzcjauhwS7efbvBqHQVb8mQ9U15CmJgt116OhL
         xI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064053; x=1770668853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tVRk+zilHW9UjKLQgTp2UA+pwv3RE3RSIRFfK1s01Ps=;
        b=BUgAK4CsMiL4hdmJctHELjbuyAsAppvMLj9JRTwuQFJzOj3+UAyPZ/mKDPYF9qzPM5
         wI7uFP7UiyRiueaJJ0xMEE/UlpwWR8LA4a3FhwOeeMS73xOT9OUG364OC3SHpaHOGK9P
         7Ei4Y4cQnJPEx7NEOUgNplWn4GAuFIh0KbsJgr7NfBDsw46MeVQ7Az38TJ2Q0CqLXc4A
         WTQKxHM9xOE4wE8u5XGbKVi66kBPtjZq2A6dcZXe3bZV8RN652BMInhUrfBHzo/e5buX
         1YFm3t404VBT0eGU5W1xy3fpKf8y6Gn+JyqHg8bBFQYBgmqffxscsvirRfNydU8AkqN1
         bo9w==
X-Forwarded-Encrypted: i=1; AJvYcCVIh4RaEiCql59HQDLJsbGyEqvsafFzBjEt2A2pR9JEuWD7tZCueF3bKVpWAEUO/UEHABVT323ct0Q8cBCKObM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaH3uassWCxGSaabM4XIatDs1ENgIqxPw2zL01XWymU5QICOow
	IiLikWaCJt30o0zuo+LvCtqhOSrZA1MaqtiQR0I0QmPVjMKq1jeAYlvoSZ/Oyyui2ivwUKnFUmi
	lQJjoaP7tNkRWuXUlNaLb7ha/6PPBB3Dd2t48MX5L
X-Gm-Gg: AZuq6aJbjdEuiPEqf6Yj1u3I46N5krhOLhpyHOY3yokanz+TuQkMG6jH8LIFkCLpQhq
	KndF3UMZ1xc4FjUpVjhXYYeIQWJTGnu+5LmFbBtL2zLHv/iSQ2FRRVjcVymOTfa0kHyoGyiIqkw
	0eadIx8wTOimYzWXax2eb/s+4MzxRugO+VWEGwlQ+5w2LQUSAubjABqpyoLRxDkWTpKNbn8WXmB
	coe8jSunZvz7Cj7rEsmZq8hkGIjbbLjK6F9JLBJA/Zkq2ZOuVgitMF8Vb+Rq2Tmyai4qzMhaCwS
	JVQ4CAgmsxKN5uBUzX1UCajF497omnko0Epp
X-Received: by 2002:a17:907:7252:b0:b8e:380:5669 with SMTP id
 a640c23a62f3a-b8e83909daamr46612566b.32.1770064053184; Mon, 02 Feb 2026
 12:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124012133.2451708-4-wusamuel@google.com> <9f904e57ca365036b12263b0d0a06b915e6090631df159d17f4e8a9651c1f5ff@mail.kernel.org>
In-Reply-To: <9f904e57ca365036b12263b0d0a06b915e6090631df159d17f4e8a9651c1f5ff@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 2 Feb 2026 12:27:21 -0800
X-Gm-Features: AZwV_Qg29xnGZqAdFJeszWEWENOogIq3Hn6LIMQK7pgNDZsdLvyvbyvFqAYEMNc
Message-ID: <CAG2KctpjRWiLEur+27JZZ0bftDfBLj-dy6TA79iLYk-DQfr2MQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/3] selftests/bpf: Add tests for wakeup_sources
To: bot+bpf-ci@kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 5:50=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/wakeup_source_iter.=
c b/tools/testing/selftests/bpf/prog_tests/wakeup_source_iter.c
> > new file mode 100644
> > index 000000000000..c8a38717e284
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/wakeup_source_iter.c
>
> [ ... ]
>
> > +static int get_ws_iter_stream(struct wakeup_source_iter *skel, int *it=
er_fd,
> > +                           FILE **iter_file)
> > +{
> > +     *iter_fd =3D bpf_iter_create(
> > +                     bpf_link__fd(skel->links.wakeup_source_collector)=
);
> > +     if (!ASSERT_OK_FD(*iter_fd, "iter_create"))
> > +             return -1;
> > +
> > +     *iter_file =3D fdopen(*iter_fd, "r");
> > +     if (!ASSERT_OK_PTR(*iter_file, "fdopen"))
> > +             return -1;
> > +
> > +     return 0;
> > +}
>
> If bpf_iter_create() fails above, get_ws_iter_stream() returns -1 without
> writing to *iter_file.
>

This should be fine, if the BPF iter file isn't created, we will not
write to that file.

> > +static void subtest_ws_iter_check_active_count(struct wakeup_source_it=
er *skel)
> > +{
>
> [ ... ]
>
> > +     char *line =3D NULL;
> > +     bool found_ws =3D false;
> > +     FILE *iter_file =3D NULL;
> > +     int iter_fd =3D -1;
>
> This function correctly initializes iter_file and iter_fd before calling
> get_ws_iter_stream().
>
> [ ... ]
>
> > +}
> > +
> > +static void subtest_ws_iter_check_sleep_times(struct wakeup_source_ite=
r *skel)
> > +{
> > +     bool found_test_ws =3D false;
> > +     struct WakeupSourceInfo ws_info;
> > +     char *line =3D NULL;
> > +     FILE *iter_file;
> > +     int iter_fd;
>
> In contrast to subtest_ws_iter_check_active_count(), iter_file and iter_f=
d
> are not initialized here.
>

Ack, this is important and I can address it in the v4 of the patch.

> > +
> > +     if (get_ws_iter_stream(skel, &iter_fd, &iter_file))
> > +             goto cleanup;
>
> [ ... ]
>
> > +cleanup:
> > +     if (iter_file)
> > +             fclose(iter_file);
> > +     else if (iter_fd >=3D 0)
> > +             close(iter_fd);
> > +}
>
> If get_ws_iter_stream() fails at bpf_iter_create(), can this access
> uninitialized iter_file and iter_fd? The cleanup code would then evaluate
> garbage values, potentially calling fclose() with an invalid pointer.
>

Correct, and this issue will be fixed when the variables are
initialized as pointed out in the previous comment.

>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/213068=
80863
