Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF43CD8D1
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233718; cv=pass; b=TbAogxGxILuoWHzojXlibbT5qujmBuv4/pRA4BYUNI7XpLeBmbBVfE59tT9Tg6/gakRpaMEKnLztaxcoFfZWphiHsIWBkvKv3ltKl+ItLsihpHJBV3O6Lhshntyic4NHB9gXp03mKIDb2IORCwi5WRxjyL9ERszFIztHo4ZllQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233718; c=relaxed/simple;
	bh=QU5nQFj9zTMuLvpMp7ysPwBJAS+h8cyhyd8jT8E2Q64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfXZTDfc1LWo2mhxThmw1tVmTgejdcTxjAL8hzQKBv6WH9zXp2UCKHyZbirYEG/clHRZ/SSpkPGZTcoF2l9AIHuwi2udH+jllN1SoMW1iVd1Q6iOjKk+kVZGG+y5UjW+YLRZHKyf+GruZPiOlyy+QJgxSUtxvotq1G/ZZlo7S80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ExYWp4nG; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ExYWp4nG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c04152730so310997266b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 09:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775233710; cv=none;
        d=google.com; s=arc-20240605;
        b=DYmoWvuEjt7aj/V3uyvcZWsbXcQMgGQAThxREEZAJK21sGKAQKLHGi3en3YbSbPKJw
         NQqgcPMTxni4kd4g0I4MjL8n9QjuHKz/CYVQrW3XIXbSFwnyzZIbCHN6+SLM76yWZ/eM
         thzqQXMwvUNU/29PTgSUlL0YJfW+GGK67+E1WoxVy1CvdP2ECECNQsFCXe6TyMXXqvR9
         lPAfWAD5tB+GCgjrzXgs2nHllgG9+ZAwtNvJI7I27kZJpcG3GIKSY66tiK+pCRcIH5LD
         IiKKYru2OclZDX+RNFhG0ZdP5jsNuUE0fep+kpl7LxYegC2rj1tlCot/VWUdM3Qjfxc9
         AFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QU5nQFj9zTMuLvpMp7ysPwBJAS+h8cyhyd8jT8E2Q64=;
        fh=WlisL2iRkYqx8qmB1YFLZBWb1HBpw5Hc/QEWSi4qcv0=;
        b=Z1Pw9bBpJawhRa2/oik112L7wy4pasBDDuq1OjDe8tsnbMpacLaMcCcG1pc3P9pSfj
         n0Poz97r+EM3LU+6ZeSYklevEdVLeq5mQwuA+zNeSybhG+VWTYN8JwRUDhE4GO11dwT4
         CFwD4vOiddKRicZsuBYj1H8bh8XmZVs8vFb+NLaANoxZHXCGOFCaIMGYgqhE92tGz4VO
         J57/wOsf7O0xsKqPtsGngry1khPJHdVB4qM+4ULv1Q2t3r1gFr35RF2FiS86k8NBCKbo
         FwKGZ4WY/yD8QkaF3Q7L3QSnRaoPLXKg8LXhJFJd4e0suD6c1C6K6plTcMJb1guql0to
         JmbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775233710; x=1775838510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU5nQFj9zTMuLvpMp7ysPwBJAS+h8cyhyd8jT8E2Q64=;
        b=ExYWp4nGM9cQ3l9TK67XwcYGcZLHX9WAISx5F3IlSLTucjgqBu+VFC9zmxXKjJsEsY
         ycWT02+ujpvuc0mz5Amxcu3fuItNSABe4dwnXTsLP5oRDute2hhYrEEe6smDU/QCZ34G
         5rCDXFaUD3DG1ROyBREOpXtya9UkL7Gu0hxQx7ylTg9uLvMWDCBURZFcHsf4kH/HrQUa
         TjnFLD1sDtHixWtho3WeWWAWV2FrOnUgj8AmWz40gyjkBU4Sd44BrgNq0VqdqPMMzbvE
         XYhfHrxUTLeEqObdbjHXUeMOnSBKoztbGb/VAFG+IQ1vVYDr7h3tdjN+tTY/g8ps63gh
         nqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233710; x=1775838510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QU5nQFj9zTMuLvpMp7ysPwBJAS+h8cyhyd8jT8E2Q64=;
        b=JvzO7xsZBq6aIW4tR2lieaKr06t7RY7FPTu15hTZJGmfM5WgEl7pNZee6M0/F/Ip/P
         zDbDSM3L0smrVFQJl95SmqBmqZ3OK5TP6lpeNHjH/MpLt61kd32HSC9lAd2lDS8d1JxW
         37oDq+qy70uKKxObFSWgEcFpT6fiC+hklEH7iUUW/TzwT4ASSOlDgoupyu8IgfRTeMdh
         PBPWrGgJEqKhR+vuF5mV2RnkvkVo+Q1hUjMyE9WXhtubBANWTm8jFxRLbCouKTfxxiVt
         z3uUTQqbV9tV8rmUNJWD8QzBhTRZqQyL0wlEuJWXkUjclLgYloQAMTMrYOVxfd0kUa5b
         PXcA==
X-Forwarded-Encrypted: i=1; AJvYcCXOaFYVNTaR680EAMsT/1ZKkbNvN8U60c81FOboV0uzYn3y98CyeRqrhQZt4EJgNlp4ZBho+lzMMB/BJkKi//A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDlscmI9o/tUXqNafi8wPTA0HpC3EM113QeJOI0Czon32RS5i6
	uEKv3goa76eCb/niNvIQhfGeK2eklMkg8d7jDcX2LmkX1Romkkg+rUXXkkghJc2Lm6LihJpdFMM
	X1Ecz2iSE0Hn1HG3ADA4SVmW9iFnxDR7lBpp7QcVs
X-Gm-Gg: AeBDietInN8S7K8H+Q8kTwTuscKWhmiRRy9Li7oJ91x3flF+cZZB2xoReOG6VbcYM1k
	B4rnPPkyssC/NmZovx4LOo+XxB328Z9jhGtm+WPCgMER6X1h1wqSNqsuirwd3kzGZwGehwXjavN
	X965vRDVMhvzCcGfajwxh4ctiQr77iFR9Cv4lYslJDMcGIcVI3GJHDYT/+Xzlw2IyjllTL94cOu
	KByB8NppkNjLSOyRb6a0C0+Pb1UiEjN0P2M6v0960UHez8GZYYHxm0g9z9Lap92umJKeJJqtyyn
	OmEz/X75RX4DHaWN/j9KjoC5+hlAoYvbmqnQHjIfwtL6wM/SEvL6
X-Received: by 2002:a17:907:984:b0:b98:4f24:a6d with SMTP id
 a640c23a62f3a-b9c672d41acmr191528966b.11.1775233709065; Fri, 03 Apr 2026
 09:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
 <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com>
 <2026040236-kiln-carat-bb6d@gregkh> <CAG2Kctpr7vBm_=Xz4H5FHYAfFxg=bDt35j6B4EprfUGio=Ftew@mail.gmail.com>
 <2026040357-undefined-gave-c98e@gregkh>
In-Reply-To: <2026040357-undefined-gave-c98e@gregkh>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 3 Apr 2026 09:28:16 -0700
X-Gm-Features: AQROBzBqCMHYMQgCewV6iBEDIM5gfYH7CX8XlpEk6-JJdgIOB-Bl687I7GX7WKY
Message-ID: <CAG2KctqOLeYm_NFUjGdXQcBo1KhSZpXFQxQdM-DQBV4Mn0ahTw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 3:04=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Apr 02, 2026 at 12:37:12PM -0700, Samuel Wu wrote:
> > On Wed, Apr 1, 2026 at 9:06=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Apr 01, 2026 at 12:07:12PM -0700, Samuel Wu wrote:
> > > > On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:

[ ... ]

> > The data is fundamental for debugging and improving power at scale.
> > The original discussion and patch [1] provide more context of the
> > intent. To summarize the history, debugfs was unstable and insecure,
> > leading to the current sysfs implementation. However, sysfs has the
> > constraint of one attribute per node, requiring 10 sysfs accesses per
> > wakeup source.
>
> Ok, as the sysfs api doesn't work your use case anymore, why do we need
> to keep it around at all?
>
> > That said, I completely agree that reading 1500+ sysfs files at once
> > is unreasonable. Perhaps the sysfs approach was manageable at the time
> > of [1], but moving forward we need a more scalable solution. This is
> > the main motivator and makes BPF the sane approach, as it improves
> > traversal in nearly every aspect (e.g. cycles, memory, simplicity,
> > scalability).
>
> I'm all for making this more scalable and work for your systems now, but
> consider if you could drop the sysfs api entirely, would you want this
> to be a different type of api entirely instead of having to plug through
> these using ebpf?

Almost all use cases want all this data at once, so AFAICT BPF offers
the best performance for that. But of course, open to discussion if
there is an alternative API that matches BPF's performance for this
use case.

I'm not opposed to dropping the sysfs approach, and I attempted to do
so in the v1 patch [1]. I'm not sure who else currently uses those
sysfs nodes, but a config flag should remove friction and could be a
stepping stone toward deprecation/removal.

[1]: https://lore.kernel.org/all/20260320160055.4114055-3-wusamuel@google.c=
om/

Thanks!
-- Sam
