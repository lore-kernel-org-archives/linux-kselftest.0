Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE323321AA
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994664; cv=pass; b=jKkq6Zu9SFcnrm5g58/wUykKn7kHGRrzW2Ld/9HcPGX+86oYaD9XgF5hqwgNOl+5cywf+d+zcml31zFMJq1KpCQeONWiuXNpjAs4W0ADVRzE6E4NHot8l/GF5q1g3y+oyd0A7sdlch4hpzwx9QmXAviaJFhGlza30/9yOcNGd74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994664; c=relaxed/simple;
	bh=KXz8Z1YsAvBqjHVB5QBXZKVYV6oF9RS44FiMgG7zIIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D48MIu6SGs1ZVoP4p69GNpFAWRR2ZBIkjLuFCw67E8QO6ffXN+lD8GYOhsMqTeQLqcq1fUEBAm4eXuK87N1B4/qBZ0jWkN/lObtOBbAEnwU8krDqAL8eogiI2SS9lE4UqXnHVhcvrGuiKXPiaVMmwCCh4tHImqO2hlxcqJsm5Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HM6ab7h1; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HM6ab7h1"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1271195d2a7so675070c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 15:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774994662; cv=none;
        d=google.com; s=arc-20240605;
        b=PqvJGbgTG/Dsj2KZwKBAxmKlLlVsIQNWHIEGkGT0455c60x36/bOwZZR0l2Mx6zZiV
         xKRCTITAuVUdRN+qXhexG+WmH7pYv7wgpmQwBvVzcWoLnb+D5MZCU0R3I6LmWi+XCOCd
         MGcSx6XM5y57fur0PIXnOZI6ryvMw6W/l2AYHTHGbGSG+xjTIl4h56nioDM58/N9PuYQ
         WCnUllhdrXKEwfZhpF10a2CIDu75dX/1pjWfQIrhmAAr94I5gjSRCY86BQZnlQ/2GCcc
         K6fgkLH5CcAj/VEAxVVN1WRGDm9HUqLWFPO/82JEChj/aMyi3b/B2lhpmXFA1KEx2Irn
         1ZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r4kc3eBNKApVvBhR0MrUdh/NwLBBmhES3WTvFsU9iGI=;
        fh=+fnc4ht1ockCDWF8I496izdOJWXbeSgBh8M6geK2pgg=;
        b=LTrHsappsX1BLnNTxTnuSfEk/9vRjtvK8i7a6/PrPBN7EpRmwaAJstomRzo+Khfc26
         X/+95Y5KFS+T2bog6ND9bRSWHg1MNc0VguZ0hfHHvUpU1i82XtJldZj+Ch/LF08b8Jeq
         J4Rd9fA+IYeGMKJRmLtIQkTyaehSQRVjGZ7cMKWbyom7nduLBXjxOMvtZNWDMXbFBpM5
         IymwjTuZhgSAgmyo1u8D9ZhBToYhMANBC89v0VzW2j1wZ5hS0bHKoTMl8vEaamjfddvv
         Ww9akckZdz1YBk0MG9WGI/5UJsFQ/K2tszbaRw48CeGPvWEvW9GbOSZbRyYUnCD00xc8
         fPyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774994662; x=1775599462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4kc3eBNKApVvBhR0MrUdh/NwLBBmhES3WTvFsU9iGI=;
        b=HM6ab7h1ilYQVfb/3UM4pRXH1ZputZepe+FLPcABlQtMy83+hm5vnj4MOLSP6EaR6u
         t92P5IAkgNgly2CBF3mrNzm39DAeZtC3fiL9SZ+Fa8tU7RbB8vxqySEQWqTgk/n5QG+h
         Ikzfa1+kZMkqLf+fO/3kC4aSAS6dNCawWSzQMrwswnQLFEjpjk/WyhT8HfOZnH+2biVC
         V+Lt7BxvoXcwQJXM9deBF75sJLTo5KVsOINRt62RB/DbqbOxgTfavY2V4OlMXvGmkGop
         qxBhvfEaN+mAU+EHemXchi+Q1vw0USBuh0pZ44o9JsV/I3tdaHPZv8QbzqUSYsvWlmUZ
         PXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774994662; x=1775599462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r4kc3eBNKApVvBhR0MrUdh/NwLBBmhES3WTvFsU9iGI=;
        b=EacSTcQiQakwOdUTIhqM08KBS+05zfFAO4kOD5QAwxmoJewYoBi86JgL/n9F1IjIKC
         OuhBMRK9QQzszewYD5KVpfmO6OWNq50n9OXz6tIQjyeYVIsDl9DQtAUlUIYScm4S6Idx
         bFPIauUb2BL8d1gxVzMPzgVl2y0YUkWIZ1zr+GJhqXT0XcD2UmSc5GSymdkx4e6bg28c
         CDB4ezKyykAw7P4ImiymC/1LFU0ZkGmzWCo/XoxOr147d0IWVYFx6oJPkoawRqqIucJc
         W6EgbFt+n+wsM5CuRPv8q9eXWv0ki6fTx57HRZLPOhYV+CgjPA8bkkVYOQPj62BUfwZI
         /cag==
X-Forwarded-Encrypted: i=1; AJvYcCWqVPA0NsOaOpvaNhNKdJUCovKSN2HBt9LO9+RC/ycqlLQ38nUFVqYXfo+GQl+rTz5YlkJgP4KMqJjMGdhRXEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQilDECNGywK7lAIHcmttk8RNHiPAVTKI17v325i8L1UtI4Pt
	ntHM1aF5Hd+u5TIsLEsEElSnvk3OXPnWgraWO3peCiXewIHa+tLTBiaxAr9fsjaMjw9P+hdXxle
	iAVcJtatHHXwk7cpcaoZgHeC7+uf36vw4nkUHyag1
X-Gm-Gg: ATEYQzwlGzrALy6aPsiyK4JM4hC0yu3FwPMpbnoPZGnx6ChCXpWeuttiC8CgqyQHXlp
	4Ydk85B+jPBBx0jPGB1IquEt4VJPfSscDGhcJ9JBslcoywTACI8EjbrPmarZaX5XntqGBEgQGzK
	5CWBqGi6gzzySIfNKTXctfwEWO1AFehluujlRrA1PwZHuBzGoSqQEOaGAXK5zgPN3IQVeNN8DN0
	cSmCGWaTan3HW0TePhTc82dLc5qlMONo5O+N5VgFr18Z8iX1g/dYiXkZEYcl4/CYGbnoV+yCiwx
	7OfsC/tOxM7TnCiaaVTIkgK4wQUGldQ94zNHsjwjjP+OzNP2RC23fiXUPNAaP0Clj+aMfA==
X-Received: by 2002:a05:7022:684:b0:123:2c98:f65d with SMTP id
 a92af1059eb24-12be6437dd6mr762968c88.13.1774994661813; Tue, 31 Mar 2026
 15:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330080746.319680-2-jiayuan.chen@linux.dev>
 <6ee24770a2b014219d86839b2243e1b7bad4dc4f520457269d5e8ca2b21c2cb8@mail.kernel.org>
 <d1a739d2-c4ea-4fae-aeaf-f49e75dac0f3@linux.dev> <CAAVpQUD1n7L6LkP32H_Ct71RLNpJ2RQWFc8w08+c8h=U_tDjpQ@mail.gmail.com>
 <79805496-9996-40b6-8cbf-0beaf7dd5473@linux.dev>
In-Reply-To: <79805496-9996-40b6-8cbf-0beaf7dd5473@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 31 Mar 2026 15:04:09 -0700
X-Gm-Features: AQROBzAQ8y8qSCQrKpuNkixRyfIBAjxtkwpMokHCZ1Bvt_oQRokJ_pel-hcekD4
Message-ID: <CAAVpQUBbAQO8rSE-WSS1M7kEcD_sQ_9zHTyJg-+v2FoVuHZ8Kw@mail.gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: tcp: Reject non-TCP skb in bpf_sk_assign_tcp_reqsk()
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, bot+bpf-ci@kernel.org, bpf@vger.kernel.org, 
	clm@meta.com, daniel@iogearbox.net, john.fastabend@gmail.com, sdf@fomichev.me, 
	ast@kernel.org, andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, kpsingh@kernel.org, haoluo@google.com, 
	jolsa@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	martin.lau@kernel.org, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 8:19=E2=80=AFPM Martin KaFai Lau <martin.lau@linux.=
dev> wrote:
>
> On 3/30/26 6:35 PM, Kuniyuki Iwashima wrote:
> > On Mon, Mar 30, 2026 at 2:26=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linu=
x.dev> wrote:
> >>
> >>
> >> On 3/30/26 5:00 PM, bot+bpf-ci@kernel.org wrote:
> >>>> #if IS_BUILTIN(CONFIG_IPV6)
> >>>>       case htons(ETH_P_IPV6):
> >>>> +            if (ipv6_hdr(skb)->nexthdr !=3D IPPROTO_TCP)
> >>>> +                    return -EINVAL;
> >>>> +
> >>>>               ops =3D &tcp6_request_sock_ops;
> >>> For IPv6, ipv6_hdr(skb)->nexthdr gives the type of the header
> >>> immediately following the base IPv6 header. If extension headers
> >>> are present (hop-by-hop options, routing, etc.), nexthdr would be
> >>> the extension header type rather than IPPROTO_TCP, even when the
> >>> packet is a valid TCP segment.
> >>>
> >>> Would it be worth using ipv6_find_hdr() here, similar to
> >>> bpf_update_srh_state() in the same file, to walk past any extension
> >>> headers? The IPv4 check above is fine since ip_hdr(skb)->protocol
> >>> always identifies the transport protocol directly.
> >>>
> >>> In practice this is very unlikely to matter since TCP SYN packets
> >>> with IPv6 extension headers are essentially non-existent, but the
> >>> check as written would reject them.
> >>>
> >>>
> >>> ---
> >>> AI reviewed your patch. Please fix the bug or email reply why it's no=
t a bug.
> >>> See:https://github.com/kernel-patches/vmtest/blob/master/ci/claude/RE=
ADME.md
> >>>
> >>> CI run summary:https://github.com/kernel-patches/bpf/actions/runs/237=
35111188
> >>
> >>
> >> Thanks for the analysis.
> >>
> >> There are many places in the kernel that check nexthdr directly withou=
t
> >> walking extension headers.
> >>
> >> I'd prefer to keep it simple for now and leave ipv6_find_hdr() as a
> >> potential future improvement if needed.
> >
> > +1.
> >
> > Given this feature is to create a reqsk to process on this running
> > host, it does not make sense to support such ext options.
>
> While at header reading, does it need a pskb_may_pull() before reading?

Ah good point, now that we read skb->data, pskb_may_pull() is needed indeed=
.
