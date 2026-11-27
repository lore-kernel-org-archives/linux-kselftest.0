Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790192;
	b=U3eAh1TLuRtudsDfhwKvZeGDT4NQk/+Zs5Q+oPiiaYOwilFfgY42QjgOqmLdGCaen28o
	 ZNEuIXwaenqh90SzwmuosuSQUVxUiSCBeNcbGdw+mwsNOPXC9VcSW7LuiVYQ6B5BSR5cj
	 XzpJ+a68UAh45zMvy5sMSUGpzcKwz3JFP9cxrkN7nthK3LKMTNFUF8G0rDYttorP9GgyR
	 +3EGLWLyGZZ2gYuR3UoU4U+zDtNN5vFeZRk/ZRybTiXLCfFG/Rm1F7TJGTihUbyiYcCEb
	 +btIO8AsXTIslYdhMkeYoXzdKTQfX/oWGGXu1MHrDkAYCwwErd0TCqtwO7HRLaGCLKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790192;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=AHaTSm6CqCBOKkE+cKbRMkVfAAPiwIJkTVx8GjdxHPs=;
	b=ljgEVDsiE4USRmo3UAHV4i1li3iVM1OUAZxsC+xLRZaDIGyFvo259dfegbUytfTFOjyE
	 Waw5A+C38MYK4MYNEEf1mLttWODdgJa9yAt2/85Rm9U3a2DKits+WtO8Wp1D6ixHZ108D
	 vm7EXTnIkXIFBMqskUZwGSh66PF42eZAqa9VFHX6gIE2F3PD1YpQcSelrCjiF16bLOyse
	 SAi8+QxDE1c/1qzjD43yxDuk7A4mjbeXeerU02hhHmX914G63YwS1nREyR8KjAV+tez7I
	 DfsPvVLLy8FMa2DKcJBP7aBtupoxxRuRG4I2+0Pjd9JPaCQVX3pkeBb+x9kaaDeYzhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frxtFANp;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i64iKlwG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E26075FC2
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 14:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6E26075FC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frxtFANp;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i64iKlwG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795790190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AHaTSm6CqCBOKkE+cKbRMkVfAAPiwIJkTVx8GjdxHPs=;
	b=frxtFANpROUtNQuR2YPB+WhzXewAgC3MCmE3LUyXXC2dYHRxLqlZG7tgAUVzgYEMeLDU9l
	Q6DOERSGhvenfPzH7iOIISYsGlpV7rxragftLiGc4FLO0lQlm8SfUuu71zGvGSFmr9x4Pv
	IL+JrXTaozMt7+jybF2jFBR8HYZEIZg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77--KD9YRnjMKWFVjmVVqyA9A-1; Fri, 27 Nov 2026 14:36:28 +0000
X-MC-Unique: -KD9YRnjMKWFVjmVVqyA9A-1
X-Mimecast-MFC-AGG-ID: -KD9YRnjMKWFVjmVVqyA9A_1795790188
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4bbc86e1eb0so1957093f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795790187; x=1796394987; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHaTSm6CqCBOKkE+cKbRMkVfAAPiwIJkTVx8GjdxHPs=;
        b=i64iKlwGKrIvI054OWHT2Y9Y1gv1AmT0UOp4ovkEMwuzDimg4spZDCi+95cELWfrLn
         C5mkKs6VSvkXU9B0Ipzwo2lqFFKSWwSKAboKhuVXzChz9uJ+/1fm6RjlIJuXCwt4994E
         UDfTbwwm57RcIHcGqav6oM2fJtuMlKe9uwEf955l+cmPEUgdSnZv9MVY8Y0ZDiXCaJVA
         VKbQc6sKToY9A7Q0NolpvbpagC6SEmHD1Uxf+8Z1Pgx06sOxcgQQ/Z6VNN+u3yCVZ9po
         0d4jVyj94OOBVb6envEO/GC+90MnxDSO+bxg/Qn4xiSH0EXAglob2Opb+Ot5FMESI5ks
         NtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790187; x=1796394987;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AHaTSm6CqCBOKkE+cKbRMkVfAAPiwIJkTVx8GjdxHPs=;
        b=DnpJVh+0v8goC7eor3oIqEFis+xIONQ52q99IFx0kNWOuExLfYlgfSdHbvtpEHnmS0
         28XFyJ1X8BqLQWSd54PmjdSFuJ4/5L3/3zuv1kLUrL7yJEohLt6OufuL4/T+YRFHDw86
         dJ29jaGM7E4IkUHxFnsKifNLSxiYGP8ZYWhMfvzjuyhmxMRQXh8RzLXXyh7IWWFIf+rh
         YS/XkqqUuzZbJ6vyt6y4eFVbJ5/d0r59wRSONSN1qTl8dLLEA2lgbw/pG+bUKwy75+4x
         TXImpv3+ynFmdtKPwLT9Q02MdGcfDO4fCyydOctkRaLTiMOR4PN0++w74ekUNmhba8+v
         3rQw==
X-Forwarded-Encrypted: i=1; AL+hErHISqOdCuLO+49zQPHbvj2CF0xpMcXWdUJ3MfnMTiXlh7Y67w9rfzxhzbU+RqrKnioGbPb2oxY/35Qm9HeuYnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+It0GFtl+YG9H8pMB8x2aQ7F363AaymeE+/k4EXwksaAqFBkov
	yLyArikzAOKbhiTRBjndzhFxiGf+rrktuj6b+vUb8CErRbemM7Zwi/M/7qjvhooWw17FNg5/SFH
	5wLZuUN7BrUqhYGMmAzKK0IL6I6UlI0+ZUd9woM9poz4WU5/i/sEFrLfXXo4cC05t2uuVgQ==
X-Gm-Gg: AZFdTZcXofh58sEaiB1tdRplpaPS0l3gs01Gxqh77PaHqb9JgrHi4VwDW9DOLe5hlqW
	Sk5popET5XeSfMHgHECc/yurvHlpkNU3aEN74sYUDk+MH0Vb2PN53/DoNZWfdccv2g8ThKUTf5k
	HMrf7jWB+cOxCQkzikTOgRv5QkqYZnBbfjd4a4BzIgGFa+SwhTeEIjxWnNrlkKJ9Mh9OKS5w0+t
	GadNeKkDBsGjqeUZ02GsaON2zxNomaQ7FhhcclEX0pIU3X5McbSE1d8KQptivoESE0VYr+NYQK7
	aQd6bSMPKhYYcEoMenZG5mV15+o1slPGfNzHGEDIVB4trQjKkNFDRd9BJxyPlc7NJlqL+ZIII0g
	QJu2cIltyaTXCvG1emfbjdD+DV4k/tmDkYzBL9PR6kMmmIjQeEqon/BviAmzu9rF8q+dDYK+SUP
	wg
X-Received: by 2002:a5d:64c9:0:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4abb1baaaa5mr50096519f8f.15.1795790187594;
        Fri, 27 Nov 2026 06:36:27 -0800 (PST)
X-Received: by 2002:a5d:64c9:0:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4abb1baaaa5mr50096474f8f.15.1795790187167;
        Fri, 27 Nov 2026 06:36:27 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm48633531f8f.3.2026.11.27.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:36:26 -0800 (PST)
Message-ID: <b3aab99c30da8fbfe8d2a7b1bac7795d2e1d04e2.camel@redhat.com>
Subject: Re: [PATCH v5 3/4] rv: collect per-edge dwell time for per-cpu
 DA/HA monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 rpm@xenomai.org, jan.kiszka@siemens.com, Shuah Khan	
 <skhan@linuxfoundation.org>
Date: Fri, 27 Nov 2026 15:36:25 +0100
In-Reply-To: <adebe91c-09cf-40b3-9780-998cea432226@siemens.com>
References: <20261127113609.650286-1-tobias.schaffner@siemens.com>
	 <20261127113609.650286-4-tobias.schaffner@siemens.com>
	 <edac7605937c5fd1a02458e171ddfa4d5e6c1a36.camel@redhat.com>
	 <adebe91c-09cf-40b3-9780-998cea432226@siemens.com>
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
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-27 at 15:13 +0100, Tobias Schaffner wrote:
> On 11/27/26 14:57, Gabriele Monaco wrote:
> > On Fri, 2026-11-27 at 12:36 +0100, Tobias Schaffner wrote:
> > > Hook the edge-stat facility into the DA/HA layer, so that any per-cpu
> > > automaton monitor also reports how long it lingers in each state.
> > >=20
> > > Account a transition as soon as its state change is committed. An HA
> > > constraint that rejects the transition can therefore reset the monito=
r
> > > without leaving an accounting window for nested events.
> > >=20
> > > Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> > > ---
> >=20
> > Looks good to me, thanks!
> > I'm taking the series.
>=20
> Thanks for all the support! I will continue with the missing bits for
> per_task and maybe also per-object and global monitors soon.

Great, thank you for the nice addition.
On the long run we may also want to have this integrated in the rv tool, pe=
rhaps
to do some filtering, aggregation, or pretty-printing.

One thing at a time though ;)

Cheers,
Gabriele
