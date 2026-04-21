Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789063A6B9D
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811811; cv=pass; b=GB3V8FEP5uy3jy8wkCSKpxDIlOs0U6lGLPfHp7ebXh/Ua4EmtS9EaH1/OtzbwSSi0Fh95FQICLOhpG/7by0g1j8nwG3T2pGKvd28mdATKLIZqNGRTLSgKK8fVV6Nl2NOumtte+sDe9hZTStVMoeCROWFYByvHlBuzk7hcpGvz9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811811; c=relaxed/simple;
	bh=RMm1B3gm6JHZLgId0qeTHFr/hRq1ZH8dqi5UXmGTaKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scyP2N4N5JenLd2tZ6UMt03A773EqG5WDcnfPVnqXJQRmjOCxCW0ZhrbqEbF9JHB1w+WcJcMgvDddOEf0rhgh6JkGNEA/mNYVln2U0Yp0BvefX6dcBfVoJfM7gIhyQ0xDuURb7emMqxR0lqm4ofWmkV1mJWneP+x7cbi3Z9BCG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=T75RJCJi; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="T75RJCJi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b4650d5f5cso17845985ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 15:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776811810; cv=none;
        d=google.com; s=arc-20240605;
        b=Vx71Xskn05cCgPSsfHmFgiBZXv91HZUGhNxVliDPvDaLj4rbMR1pf+AdSb6G3gnE1w
         gYvrDUh6q/8/8qWAzQCoxXxE7Loct6wmiSd7uGXy7p66BTCNtt+7Pyr0B4Zp5jI5Rf3z
         AWqhNdh9Clf4oGzYGQlFvu1+2z2O9DI2deIKEwlJ/cUSsVp84TnHBRCFFXDZuxc+auby
         KP/8h+uY8wM97snCjq/9iZ7UskQpGQmIJITavAW3Xr2zOKQ6DGPHEfJKPv+sqvxjkaPl
         CD5lEUWImDUETvEUfy+hPYX6B1iK4DVMsd1QSUS40gA2fMSbooDevO7L81DvCxnDotFj
         6REw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RMm1B3gm6JHZLgId0qeTHFr/hRq1ZH8dqi5UXmGTaKE=;
        fh=LWF5dWPsu4NCCKn/ZeqACeAQf1FlTzurRrvVAWI17qg=;
        b=l1mEUEzxS7X8TJY1XPyqBe0R/+dPzqtvjK+Rqw/fC6A2Xzfl2pDp3rpV39bx+kNbbp
         9zrZkOVkhiEZ1n+xW5r66P0GGapTKNYiT72YVWBITaoIJC1jG+fbOzOOGANNSf2SUm2w
         XTjifiJIfdCVa+X4LnuRjknAJjV1CdkJjZbN5cvuq4S08JahumsZHmfImpc/CqOnJQHL
         ONbL+KPG1fYXU1Z7uIH16zHNvLGiiwu9DrV7Uom9WT+P2Rjwrd6g+rPGcA/rM9ZILSR/
         Dyy4tAIv/bOlxQ21U62qIX8QUdJA+1Ha6laAj7/PoCiIu6kHpz4LYKuH1Ll8rqbBPNjm
         zv1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1776811810; x=1777416610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMm1B3gm6JHZLgId0qeTHFr/hRq1ZH8dqi5UXmGTaKE=;
        b=T75RJCJi/8g+lGjFoandwtXi2tVESI3/UIugg6CRYqICGsXnA9F0jWXhxoqU8IWIix
         UUL1wb9ZPHEFuoCB2QNnaCXPyBEmsUoQ5MFscAFA9HtA0KQ2MMZsGK2/EgFFLhXx00io
         bW6Bj7J/heMT7bxY3FrLeZFRmAE+WjVebBYr38MRBfNrf5nYqEJpja8Kl+XDGoopdYY7
         l2omqBX4MIBqbMIeVia3qbeIx1X/VPODFuQ77ZgOtL3PLa3dtg4VrPzniZrXba79Du/m
         nLZLwwz76lyTwSQHVYHkg1IXngrYczlDySkLNVsfgoZUcXrT+/GTwHT8DKX83WEk/Yyq
         2rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811810; x=1777416610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RMm1B3gm6JHZLgId0qeTHFr/hRq1ZH8dqi5UXmGTaKE=;
        b=oGQcntE3to9EO5ZHpuASW/q44Wck3nrHCKDD1afVOSspnmN8pXqLOITSgLCvumjzfe
         xfDokDocHipw9UCZkxYQe7rsQnIbY/RtTlsOvBHkwA/4T95GqtbmS8WW3r4PFjBOGq0/
         Ll8egEDi18l4hh7YvonWIqb5V33dHGvo1CIhZ80TQSDyLNmbaf6PY5VKlsMCQRWF7fyc
         X4C2Q1kkaUg80qDK5tX0IwZJR3CtLogjWsJTyCsc++ilg2QbEOCrxFZzVAOPlz8zDqTG
         lKsRi3UDqiDN47M6s4pnEGI2MruSVSKObizW6gVr6zgp3R9Z85Nu7gVnsLtbfvWHwKzP
         5LBg==
X-Forwarded-Encrypted: i=1; AFNElJ95z7Vbltc2Uw6eHDLRyiI/8tAMYFFr8pTNAUZlmQdZooeF0fVI+a3C+7aA26ACo2KqUrjy6WyfwQfmRe2iqtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XkuhoUlZTf4RFmUSFsfeKq1qq70YZ3xrzYE36pcNlBMfrib8
	4beAwRdPGRAvoPWUbbMVGN9s1fAkAR7DnCAH5niiKJ9a0Aw2BFYyqYdIP7RJsNHDA15wKvQuZeF
	Q8mtwF/8m/1RNzqUgYvYLKkm1cp/NKKeCevveg+sh
X-Gm-Gg: AeBDietksx7X0B1IQnjsFOS9MWsVOn2PcQcoH7h882HRK5wDJOW7IvE+2hW2XR5PVGo
	IliUzdCip84ELygp5FAp2fl1V97GK8xV5pU4Y4FF2st/uRDHHZC1JAiDEpDW1JIqOX84tIR23QK
	QDAcYxmaaa5RGcETdXSWGeuUKFbelDtkDdNfVRy2vv7LyxofIrJUKc/UhBvIDEOuEcYsXjsWT46
	jDyiTQ+XDrsZK+IY5gSmukh3S9kxbFkbIfwuWBwXL6k6ku0UvPM7v1ExkdwUkUO5EvWK7BD+RBR
	RI9DxCftK+5+Lmu+qg==
X-Received: by 2002:a17:902:be0a:b0:2b2:481b:de68 with SMTP id
 d9443c01a7336-2b5f9f8f446mr154652785ad.35.1776811809715; Tue, 21 Apr 2026
 15:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
 <aefnIw1Tx_2r5nkS@CMGLRV3> <CAADnVQJQxa+fHM9X8COc60ZMcxF0DMhWbtArg_gPynpbbg55TQ@mail.gmail.com>
 <CAHC9VhSo-M1wK2s2P0B+2F0pJqNguW7Kj-g63anp1xCMSBLa6Q@mail.gmail.com> <CAADnVQL33TOWFmxcWod3BCgmMXSQ=cEp6NCcxgQaJL0C7+Z9zA@mail.gmail.com>
In-Reply-To: <CAADnVQL33TOWFmxcWod3BCgmMXSQ=cEp6NCcxgQaJL0C7+Z9zA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 21 Apr 2026 18:49:57 -0400
X-Gm-Features: AQROBzC8n0JJ9DjsWU-7Puv6JCDhA7IZFjxayYVxpNJDKTQHihIrjlR17p1FK3w
Message-ID: <CAHC9VhSKvC+p5j5Pe1YKB-=vRkRA81K3kp97Q6-H5K+kvYa0AQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF LSM
 programs via BPF kfuncs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Frederick Lawler <fred@cloudflare.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, audit@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 6:15=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Tue, Apr 21, 2026 at 3:10=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > > It's still Nack.
> >
> > Based solely on the diffstat and a quick look, this appears to be an
> > LSM patchset, not necessarily a BPF patchset; yes, there are kfuncs,
> > but they are LSM/audit kfuncs and not core BPF functionality.
> > Regardless, I want to see how the LSS presentation is received before
> > worrying about this too much, but your NACK has been noted.
>
> Paul,
>
> told you countless times LSM cannot touch BPF bits without
> explicit Ack.

Based on a quick glance it doesn't appear that Fred's patches touch
BPF bits, they simply supply kfuncs for users to use in their BPF
programs.

> So, no, you cannot add bpf kfuncs in random places in the kernel

I see plenty of places outside of kernel/bpf that define kfuncs.

> And, no, you cannot call bpf internals through bpf_map_ops, etc.

It doesn't appear that Fred is doing that in his patches.

--=20
paul-moore.com
