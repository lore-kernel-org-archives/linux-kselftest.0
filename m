Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D642354704F
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634613; cv=pass; b=DCqofwUDLhd2eKjhQdKYoAWjnGAcSHiUV8donACpUhXh+FDQTCfYCSrYwUJ77pAG3wtcuN3nMgMBhSPwuyogOIcdSQ4i02JEheRlFZCUAkkinhxfOGhV766A2xQnekuFp5jdCuPD3SwRl8oRSjngBlZcrVwZ0fdCTBGwcUnS3CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634613; c=relaxed/simple;
	bh=ZGJygfgJ1vZiogBEUmUhMjrRiIMouFDNzOqzYt/kMEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZz5D/+NAUiInwtYm0VpF14urKMc7/+lUiPHqmC2d/8vIrbqe2/45LusvzZJvfk/lFQB/ZMtPTkoM0ejT2Oj6qj0kZqJH/97qrXqIQvzhOyKg5z0+rMF+qSstunooQTO2IyZxbdSgXk5j66g0TT4L9+YRoVKb+xQtwyqmYoP9EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLzotch2; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLzotch2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a18617ae90so17385e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 05:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791634610; cv=none;
        d=google.com; s=arc-20260327;
        b=FyD0JweFjWFEC38MWDykSbQmsPG5oigsFjuxXe7WIs91gtPmsUuMeeiW/dmNc7P803
         Yw06A/puh4usvTqmAz2IycIdwiopaJ85CuAkcFoHoAoj+D7MAxeYUOmM616Wq/E3EXUX
         Jbmz7RqElar/1s05hl5HwB7mhqDGQMuxnWyq70IxboXhKAJPuRalHJI6pvD8RuBAQ101
         ZXRKE0rRsngero2qW/VoLHCZ4Ije9wzC2uJgIL9pXbMxapBD1kZRPCD2fUsksz9/84T0
         XNdUlbxZke/3gu3QFY1p+PIHKyovXgwxF0Jx9HiEiRC5bHfu0oS1O/m9NhEV5cnzmqqo
         8KdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGJygfgJ1vZiogBEUmUhMjrRiIMouFDNzOqzYt/kMEQ=;
        fh=02vfsVivNjbaO0MVeqoHcWLSk3lP5Q6guttUs9GnIkE=;
        b=L96ciwXnQXibdH9lwEoWQucwJXbI+5MPc1hrgnMFLisPDxjk2dNHwPs8mtNLRbuW6R
         ec8IEib484jVIbvCRKr99LhNadxhr66WM73lZqurStwtXEsRxnuDJpyWOvueBBjevMzs
         otihZ92gKC3g+mLe0z+VZ4F789ZYA1Q51epA06IpuK5cP89GsSKlmqnpi06NKUFCFkoz
         ChJ3ogA75t4L+m8BFtZiRlS/NprK7t26d2pyJb5oEkog36jWE9XQlNN/uiu0TpV2xrb4
         yhxCjTeolDPeW1cccDnWuXUyoa0m/vJ2PTPZUHPF8PXWeZV7+Fm+j34iJAqBZzz6BIVP
         MyyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791634610; x=1792239410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGJygfgJ1vZiogBEUmUhMjrRiIMouFDNzOqzYt/kMEQ=;
        b=SLzotch267cSplIFK/3jOGd2uYZhN2LkMIowWcOp2gwgO8AfsKn45zcr0lLMYeW+NH
         /XcTIARa8COLG6FrUJIn5H5ZynRIoKUPPcOejFhIJCM3pb6LNaMKoFPDBwtPNaDDEhLV
         4yHDHF4wXgQmZtp+g0avsyh6UmpteQxwzs9je44ybM2qydvCFEPGgT6P7LMA2+6FD2vd
         83vJXIJZ5PdSwJB1NtvOy3vqts1q9HskoOq0XJDLhJHYTzqcCbQjAyMfBP3O/ahEJDw/
         t58CusoJuXmpGU8sMqK3wDIqFOJdg7OHbWQYIWKJ8sPqw/a/7LcRYIHejnp587v7Kb48
         lddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634610; x=1792239410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGJygfgJ1vZiogBEUmUhMjrRiIMouFDNzOqzYt/kMEQ=;
        b=2i7EWUxFyF6QnVS+7AZZHcHBkLPi0PUx9GkOU1kV3urZSR5PW6735FVamUuuJK8ADd
         vbpQXtzdsPX8q/jfgFJK6xRRuovtgVoIPbkkBTu+yIFYNyo/6+D5eyurF9yMEOLDEbhs
         wVzf6sVKqK42iFLBXzXYHrh4u6zHe1z5CMDkZ7xcJ4XAjNETLuIwY7ktnwflET8gt0dt
         fWcOqxBIyJjZpmRD6pr9bp2ietyQYXAysWWSn1iH/T5ElnSIqIPqinVbtFD3LZHsYJRZ
         bYAHgpNiR1P/rmCs9ep/YmsbKoy64JtMaNqpSHvm2AsbdgXKV4MX6hRm46NrGKeYy45G
         kmLw==
X-Forwarded-Encrypted: i=1; AKwUvBzvz0kTc5A4pY3/1kkYCzaW+DhHDJPRbVKtkerr7bI03BcjsHvkpqzoJcFmxTnMGUYgE/UIb66sOrDNKMEnxuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU40C+SSKkoexMmbFWPSgUxuxevkOonaEdjBt/zYsjVY/QcspJ
	6i4xZegnueO9Gu5W4QIbWE7T3DAZ3ZjF7E9MrJKcmzQ1lANXcartE+DZg29DrwqMWk6nKxxE5Q0
	JhbrEYcQMeUX96lkACZKh47T8h3bdW4tUb3Vo9UzB
X-Gm-Gg: AYBFou3WpoIXo6x7qrjmFcMDMwibL6caF0Ys2MkMuZ0O8Y1zf0nj3h7uJ8hLjl9yyfQ
	JgQMOrFOg6Qdi/9MIBmmv/xMZNaRDPNk4tr1ITuj+F3ogn4S/Wuax4IXXzZ5T6njKytc8fI2fa+
	ByONdAcsLg4jPV1pM/myneDzPTzdp6V2NkczZP/HqBVW8jjuHMpQS2IMiI069Cba6byUhNTtvke
	s2BpKWeaL6lkZTCz4q3r9uubI9GbM2AVxRDTm0DLQw7tF1+ncydnQBzz/B5D0as+5fmXrjfsgOw
	bUgl4kkoQu26rC0KIsD1pdsalSft9pFPjHpQh77AhRCFcTJTLz1P2Xtz+I3EgILMTzK9S5vw+YT
	pobMp3mUyXms=
X-Received: by 2002:a05:600c:a10e:b0:4a1:80d4:55ce with SMTP id
 5b1f17b1804b1-4a195b30c84mr305755e9.4.1791634609468; Sat, 10 Oct 2026
 05:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com>
 <CABdmKX2VHqWrPb2O3Uqdccx=nP66gECU0kVc=4tZdGqSEZvuGQ@mail.gmail.com> <20261010025252.3716641-1-odys.yuan@gmail.com>
In-Reply-To: <20261010025252.3716641-1-odys.yuan@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sat, 10 Oct 2026 05:16:37 -0700
X-Gm-Features: AclHuK-buTBub6GSvkPbrPC0OJrukJaaCD5TTns2vZsTz9QpTX-JSgssQ-hs3Wg
Message-ID: <CABdmKX2CkaBzSqeaDHYUC594wiwjJ0edjZyGp6uSD+5GeDk_zA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Accept unnamed dma-bufs in the
 dmabuf_iter default test
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 7:53=E2=80=AFPM Qiliang Yuan <odys.yuan@gmail.com> w=
rote:
>
> On Fri, Oct 9, 2026 at 5:07 PM T.J. Mercier <tjmercier@google.com> wrote:
> > Hi Qiliang, are you running this locally instead of with:
> > tools/testing/selftests/bpf/vmtest.sh -- ./test_progs?
>
> Yes, I ran ./test_progs directly in a Debian testing VM, not through
> vmtest.sh. The VM runs a GNOME desktop on virtio-gpu, and gnome-shell,
> mutter-x11-frames and ibus-x11 each hold a 4 KiB udmabuf without a name
> (their fdinfo shows exp_name udmabuf and no name line). As the
> iterator walks every dma-buf in the system, default_iter fails on such
> a machine before it gets to the two buffers it created. The minimal VM
> of vmtest.sh has no such buffers, so it doesn't show up there.
>
> The subtest only checks its own two buffers, so skipping over the name
> of any other buffer seemed safer than relying on all of them having
> one.
>
> Thanks,
> Qiliang

Thanks for the explanation and the fix.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
