Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75A3A0B24
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878005; cv=none; b=VWU9bSWtXa0QQwMTloCqk+JNPcpaO9EbfvzQHRgLYCv0CyneEQoJuhjtmAcaaCvZTzPz47znli6udXh97XDVOTSlrO5fkf1RNNkii314+cyV45g24Vu275oaN+jwG/+I1QbQpPUyXva8lgMZQFHX0ZLfamEHFIoF7aHukzqz1vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878005; c=relaxed/simple;
	bh=rw/8h1D+63nkFtZwWqlY2Q2ISZQHu8o4oIa0YyClyFg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eaANmRfJbdiW/B9Dnv1qC1haDlVxjtzsjzqnHk2eP6PSsdpTknM09TS9rFXU9IHW+gTNMSgX7MRJj8k26s7YQ/JlgGrt/bnszeKJHxZDx1d4rZjdbFn7DUvk1ShA3zYTMducAgL6vjxUgNx5ppLvJ3jTTlAuU8wF3NyOxg7Pqtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PfCtqSyB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ba3JR0LB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfCtqSyB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ba3JR0LB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791878003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rw/8h1D+63nkFtZwWqlY2Q2ISZQHu8o4oIa0YyClyFg=;
	b=PfCtqSyBC6pJh6VVR+28AYh7z6Vl16dmtkREh6LrQFCtRW8BVfHX9ld4qdi6YrIXmSn3KD
	MYZ/zohkjBOkD6boRFZ9SHc6OzdAxm3oEYkTfKCy+GGPB7ODEoJEshCKzBtFAdNNw2pYY7
	juBBsPdesq3LJcBTJPGPbChMJunHvEc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-DitfXSddOV6h_U677RBNXQ-1; Tue, 13 Oct 2026 07:53:21 +0000
X-MC-Unique: DitfXSddOV6h_U677RBNXQ-1
X-Mimecast-MFC-AGG-ID: DitfXSddOV6h_U677RBNXQ_1791878000
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48aef5cfe43so1558213f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791878000; x=1792482800; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rw/8h1D+63nkFtZwWqlY2Q2ISZQHu8o4oIa0YyClyFg=;
        b=Ba3JR0LBNzFaLnQaNdI25N4n67ol4JWNtHJqx5IENqGWa6VnhKbFUvqSo4onrNumjv
         ZT6r0cOSm4lVUgQTuE2qRWmcBUk58Yhjn9loBBhIbvu9Z9S5LcN7XAS7UPOMBqJzqcAZ
         gS0xyVG42OwJcpccBRAO5gfsO6eXbLTR16tDcvbXRS9kcvEkKhnKESo68mYYvTKO9n29
         50zN9a0DHF6lkEWFfyKpnet3sdaOUOoEDvIb2itw7u0hNyauoQ7RIhJGjLkzrmtHofJw
         eQB/3zBMtn/3fs0caRlD2lbueokl6L3NFDHy5oep5YDvM5CQkXgLL1tqAs+/geAjM+DR
         wmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878000; x=1792482800;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rw/8h1D+63nkFtZwWqlY2Q2ISZQHu8o4oIa0YyClyFg=;
        b=xhTf5nyjiJMv70Then/oSCOcb/ewJ545GgWcsgnEjaIDVfanIj3HqgmhNnmJCgs8qk
         k4gQPE3xGiulJ54DQjXsXL5N/3I3TqEPGvuAiwoAUdXIhSX/HbrPYpLJLGyZ5EkZY4Hq
         AT0Ns2HAkx5kn1ERnGUHuSl41Mtzt/6Y9ebGf2ofepuNY44FMKaVbGCPgc3xgV+J6ut9
         MYpVJRJMX/1GWq7iTh+tjHTIfySStosefnj2a+a+8mExt56Al7wZImeMK4QryY3HziuV
         KdhLFR0SLT5JLzbTzwS4hewWz1ZyqJlh5u/Acc6HEm/OSliwU0mKqm1k8XOvjgghGG7U
         j99Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+MkEiadfESpf6LY5V/fH+s7ABIfTe5PsNlC+SQykhIgRnOf6DNEM/gGg5Ynrctt+Uv3v+UtL0FnbhQHaKFKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW3CVlkanJ2bD6kic7J1rjJjrJjFb630uwacE0LxEY6qmqSuPL
	p3Dp5L4JpBS+bgD9eORDBZJkTfA4+ha9EkzKo9MMx5Bjz+vCvGij0tZhRZdlCqNG0iBPbLxILWt
	jl9e07n1Ip0Hw4WFBnI+g5TyFjjXRUtNX05vawCByMnk99iLcLgGxQkqgg0rOOH/OPf13hg==
X-Gm-Gg: AYBFou00/6WtMxneTVOjEpf5eXty+aEixjfz/v7C5kayQQ/IR1ZQIt7l3tp6if+glTF
	XLEsQDmyF502MWxNmXbE+8FYPhewzBjmMrclqZf92OwF6shmpzrF1eWOBQTrL1dO2H0X7NG6CjT
	dM+WYIWFHOy+xnYdBJmDyC84KdwyLETvfBX8J7jl26It2vtnWpBsd5WKAdYTSA8zdFsfpgt2Iby
	uvx34TSNSEQUZmUt9iVBHJ74SyPoEI1eRF6nUfso3h0OIHT7SGTA4akWayPLziGqPsbARvkjdgi
	3h2cWoLZiq/IFsZgRcFSghFM22R4BxpD3HTIxV6gyQWsQUhhQjPeNGPzZTHF/ep7lUDn1JZ59Ib
	Ah8R+3dMdx0e6Yitx9mN/sJcOe1R/
X-Received: by 2002:a05:6000:41cc:b0:48d:bae6:d7ba with SMTP id ffacd0b85a97d-48dbae6d911mr20398651f8f.26.1791877999791;
        Tue, 13 Oct 2026 00:53:19 -0700 (PDT)
X-Received: by 2002:a05:6000:41cc:b0:48d:bae6:d7ba with SMTP id ffacd0b85a97d-48dbae6d911mr20398627f8f.26.1791877999400;
        Tue, 13 Oct 2026 00:53:19 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac37acsm3531102f8f.34.2026.10.13.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:53:16 -0700 (PDT)
Message-ID: <8ba6ca530f6f35c04ce7147ad601eee6bca2d792.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] rv: per-edge dwell-time statistics for per-cpu
 monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>, Tobias Schaffner
	 <tobias.schaffner@siemens.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Tue, 13 Oct 2026 09:53:14 +0200
In-Reply-To: <20261012152129.4c57786c@gandalf.local.home>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
		<4759c9b0dacdf1f9c0cf47158895860dbd0ec401.camel@redhat.com>
		<cfd7123a-e83d-490d-918b-154d45aad92d@siemens.com>
	 <20261012152129.4c57786c@gandalf.local.home>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-10-12 at 15:21 -0400, Steven Rostedt wrote:
> This brings back memories of conversations I had with Daniel. When asked
> about how this is being used in formal verification of safety critical
> systems, he told me that only the RV verifier itself needed to be verifie=
d
> and to show what it is verifying can be verified via it. For example,
> running Linux in autonomous vehicles handling critical systems the watchd=
og
> had to be verified that it could catch lockups. As the watchdog would
> trigger fail-safe mode if something went wrong. RV would be monitoring th=
e
> watchdog and if RV detected something it would panic the machine, which
> would immediately force the vehicle into fail-safe mode (stop lots of
> features and only keep those that can stop the vehicle safely).

Yeah I talked to the same people working on that project, eventually there =
were
more problems like verifying RV can't be affected by the code it's verifyin=
g.
This is still an open problem though.

> Can using BPF as the RV verifier be formally verified? As verification fo=
r
> RV monitors did look at the binary. Is BPF optimized to machine language
> before it enters the kernel? If not, can we formally verify the BPF
> verifier created the correct binary? Maybe, I don't know.

As far as I understand, verifying the BPF verifier would take an insane amo=
unt
of work, the go-to approach is manually validating only the code you know y=
ou
are running. Let's say up to a point where you can realistically say it beh=
aves
like you want it to.
In short, having a verifier doesn't add much value here, at least until som=
eone
verifies that too.

Then there are the levels of indirection, BPF C code gets compiled to BPF
bytecode and that gets JIT compiled inside the kernel. Now it's machine cod=
e.

If people are normally not validating clang/gcc produce machine code consis=
tent
to the verified source code, this case should be equivalent, but I'm just
speculating here.

Gabriele

