Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C40318140
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451675; cv=pass; b=RLdsO0SQFN2VuSCb9cgjczrZxhba7094ERLu46ek1Dxr7CDJYOSmxVtyY8vPDjkzq/YitTeaXHetIdphUE1sQijVnEXGVDP1ldHwYvNJcp1/PrlXPgh3WfTfgf6tRdGmsU8cJwLSusVuxg+d3N+V6QVAgLdPU8gSRMUoZ2GWF/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451675; c=relaxed/simple;
	bh=nFXtsQYitzxNyDBIP91p1FAZ7YRHXcxqC5D2Yp0z+J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4DkxsC3fYm8WCG0PE2PhwQDau1Lqe3QSukY/XU+TMftzWZzy8ULg97Jx6v1vmsJHffqIQhRa1P5yl8xRl2/2uuPf/vjtRu37d12h5eQL7ct4uginu+BxOZfX9sj0y8mvKnh0yuaeqa5YnbaN3e2NimqkIUJcUcW/RTIou4FMAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wzimcalo; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wzimcalo"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64eb84d1e37so3842441d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 08:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774451673; cv=none;
        d=google.com; s=arc-20240605;
        b=L/Wn/TPggltOejZG3ywWSyYCBrwAKaRnn7VMU1YV/aBFyzURV3lecJtH3XuMvp8gzA
         FngdUObcDRbYAXhjS8CLTQheADiLG8ICK+gOsilp/H2j72sRred1A3ff4hRubEDUvNaZ
         z9ZQgmM9OwhCva746r6LQmq4IkkFNoXNfLcN74xX7xRgBOMcFwpvoEHtiH4vlgC0aIMi
         5G+VGdR2prbBO0T6IdR3VrDuwwHmangQjriPVnlFxQhFm8yr0utYN6xGXDYtMJ85wLu+
         r1oYcgtwwy862dnVDcHizwhcs4dWAlKLB6t3ohpMefztdqeuOcrMSBUGdBnSxaU0zq0g
         Yhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O66S96rEOTvUqlZiCU3x9vYPPQp/Mje+bdzAnxQr6SY=;
        fh=BevSBJA5qSz7/N+4s0evbA3tAgeqL0BVGj7wm1ClaEg=;
        b=jG4S1Nf36stgaFrTkha30VztzvgWfR/zBBIUu8h7o+n8wWgVTzIi5EU5GE/dGG578j
         4Y/RM9kumJD8JZ55b0ZX7yKfrp1HxV8M5RnAU0vjh4fkoSQsvfu8F7uwbs02128JWzcH
         reixV9kkyToJBSbhPJKx/r8TwxMUX5NGdIsuoUf4oQOP1bDbyrWMX07dsB8e/ZuNK0Mf
         00C47iMQxgLvcLZULnnMHzPGqZGUH5sRdvQwK7nRq1lW2FqOp3jOWpNCFKcCexME1YU3
         hr4JLhKI6EjJMySCZsN95QB2mC8Cgtt/bFg2qjGRL9/+EQBTGgl0gp5cYjAKuMWrPKa2
         frGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774451673; x=1775056473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O66S96rEOTvUqlZiCU3x9vYPPQp/Mje+bdzAnxQr6SY=;
        b=WzimcaloQIGcJR9h7bWHg5NReDB5v0Bzx0hDSMiqCsUVm2gTvjzPdrceLMof4YdEFm
         Wyu6CEnIxBjwGCPRVV6N5mlyi2P2BGQZYo0cYo/uM7yJjWGzLOb/0gypYmL0BeadSBAC
         88HqA/56bAzTjI36SpgKIXCpcg/oT/iXsS+f8LzZft2h4ctDoHAVhBDoH0ZpGGKFapl8
         P/GgiypsSZxI8zYbhS5ZFvhc37DI78FHTjNHXvgKdunAWl07yNd3dIn++Qca0OBEOP6A
         id0N8VLQYvTgspsoummvTIXqX8XPuVyNJWToY9O1XxEiyPsEZxFWjH4Y161pq0FnR5qi
         ZI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451673; x=1775056473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O66S96rEOTvUqlZiCU3x9vYPPQp/Mje+bdzAnxQr6SY=;
        b=Q+4CE5gv1VnEY/tfcHI6bMu1tReEKRNIgYaeLQtNnvHb5/WU+gViXNbOiy5966wmmJ
         Bc1TOAE1NTiWI6k5TujIMXtVCSTUVVfJOvOYSx0NEDXz5UUV/Cic75VPZ4RQWjJnF0U2
         xBSgRdRZlSm4osNbQTOWp6DTAaPXJk07TSDqtTCcB2I4md559jy3R+w9jUXNbNgolEdh
         yJC8KCswQowcK9YJuIX7rh29evzyk5BzmYGt3wg11+gwYMeMwYj4UGEWhOdH8WOytFZW
         OYJwnYtP2pRUb8pKcd8aYx9FPS2Kh88irhtxLuD59Jx3D+3s7rRiUodFY1yoGTUK5C4O
         RUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCFCSDx9PyQW4RGPHG6c6Cxqrn8x4aqyGGY6WsL3zvSZE1fnilUONFyyoEe2aeeTdJ8t0HnS1Jw2nICSX5AKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqSO2jNazlqRCeeHqz0NiHHpeQmwQJgoWoxbvFYwnHlp6JMz/d
	cyXkrJt8+8JlK9UTVCrkqE+SBv4j5a8vUMvH84AukwcSghuFV/5lZU/AKaeeSCRhld0dk0K9VfO
	EBwgGcukyOhoZ+TF1v8Ha5qMpz692qa8nph41u4Bx
X-Gm-Gg: ATEYQzyunJocv8xQlNbs/VXk1zrHMKJNBe9CVNcCF0HOmprw+80mwzgV+FJ9IC3Ekyd
	ezrcZyienzTenH6VZQ+cAJ1IuDLILqddb8MgQHc0cUCu/gFlWme8/xhHabWfi58kivsMtQUtQKs
	2v+EiGDhslhlnqB5gurYGcMnfAyD9hv1IGmzyQF0Eo7q/+GRuw3fYHtuQnNPNKvEMB0Deh7mJU6
	wNUwmXtKc7evaW5+N1Y5aFNVWegUTU+vtuCFwAuK32HvoMv7/ekDLfmNHejQlRGnx5HiesBJ12x
	JgB7ud4W4Ai64lqLg87oxh/znbyVojrGYB2L
X-Received: by 2002:a05:690c:6889:b0:79a:668a:b6e8 with SMTP id
 00721157ae682-79acf6f01ffmr40430887b3.61.1774451673004; Wed, 25 Mar 2026
 08:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324205301.1361608-1-atwellwea@gmail.com> <acOVlten_N_5evGX@gandalf.schnuecks.de>
In-Reply-To: <acOVlten_N_5evGX@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 25 Mar 2026 08:14:21 -0700
X-Gm-Features: AQROBzD8224Q9HN0xgDwAcBw7dcRtTDRPO2HLV_Z6A8nB6U0lDUy4pisitfdkEk
Message-ID: <CANn89iLJJ3EF2-qe4AWJN0teh05x0PPJjOAfB0uG9rNZuJUZUg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] tcp: fix scaled no-shrink rwnd
 quantization slack
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Wesley Atwell <atwellwea@gmail.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:58=E2=80=AFAM Simon Baatz <gmbnomis@gmail.com> w=
rote:
>
> Hi Wesley,
>
> On Tue, Mar 24, 2026 at 02:52:58PM -0600, Wesley Atwell wrote:
> > Hi,
> >
> > This v3 addresses the follow-up review on v2.
> >
> > Eric pointed out that 1/3 does not need the added packetdrill comment
> > and that 2/3 compared signed free_space against an unsigned
> > granularity.
> >
> > This revision drops the extra in-file comment from 1/3 and keeps
> > the scaled-window granularity in int space in 2/3 so the comparison
> > stays type-safe. The overall approach and reproducer remain unchanged
> > from v2.
> >
> > Simon was right that the original 3/3 only showed the explicit
> > rcv_ssthresh-limited ALIGN-up behavior. For v2, 3/3 was replaced with
> > an OOO-memory-based reproducer that first grows rcv_ssthresh with
> > in-order data and then drives raw backed free_space below
> > rcv_ssthresh without advancing rcv_nxt. In the instrumented
> > old-behavior run that shaped this test, the critical ACK reached
> > free_space=3D86190, rcv_ssthresh=3D86286, and still advertised 87040
> > (85 << 10). With 2/3 applied, the same ACK stays at 84.
> >
> > That follow-up also clarified why the broader 2/3 change is required.
> > A narrower variant that preserved the old rcv_ssthresh-limited ALIGN-up
> > behavior was not sufficient: earlier ACKs still stored 85 in tp->rcv_wn=
d,
> > and tcp_select_window() later preserved that extra unit because shrinki=
ng
> > was disallowed. Keeping tp->rcv_wnd representable across the scaled
> > no-shrink path is what lets later ACKs settle at the correct
> > wire-visible edge.
>
> So, you are saying that 84 defines the "correct
> wire-visible edge"?  That's a strong claim.
>
> The test in 3/3 adds OOO packets until the window calculated from
> free_space is 84.  But why stop there?  If I added further OOO
> packets until the calculated window drops to 83, I can claim, by the
> same reasoning, that 83 is the correct value and the initial 84 is
> wrong.
>
> In other words, this is a very synthetic scenario that can be steered
> to arbitrary values.  As stated in v1, I would really like to see a
> packetdrill (or real-world scenario) where the old behavior actually
> hurts (after all, this series claims that the current behavior needs
> to be fixed).
>

This series seems to be a social engineering experiment.

Could we have the prompts that were fed to an AI agent ?

I really do not see the point. RWIN is by essence advisory, and TCP
cannot accept
arbitrary bloated (small skb->len / skb->truesize ratio) anyway.
