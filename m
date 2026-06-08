Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F71A39A048
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958105; cv=pass; b=IIikIaCXHCvKmyjH4DEIXX62ZYI+1lfevm6VZc5mlqg9eJThD/fWqsl+6/JPkSEbPtOulPB8ESZB6lQi/bEnA9tKjG1Kf0qKBFTHVfhRE7xPyxJrNkHIlV93JeH3mmP6TqFAgiDqUXNkcCXKqrRJb6RjcwdTjzDHGDHnFlR8QhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958105; c=relaxed/simple;
	bh=/rpv0hsisGb3nHHvAOO3ELylrxjpXbdj4HzmBdxPovY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gE5+Q5Fdi9a9RR2tytHTawrXttAQJjmjCqhtdSr22IFPqWx7gwJJJO2WuQ6Y6LbwBMjcFZpUwfoB3SO7Y9xY8kwAqDsupginpPttqjvVJMctuVc5nmhONFtNln+SaVRwT/D50VQT7Vid4fUJTfXV4lM89/XC1ZONTZcjubvvtVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZNxa8s+; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZNxa8s+"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-137335bc3caso5994264c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 15:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780958104; cv=none;
        d=google.com; s=arc-20240605;
        b=ZSWoxfc53fJmpKx6bV0hkMQ2b7PLj3K6tVzlnzdyXfvBay+h2EU6eGb0WcMyNXvrah
         IkwYcJ65h5LfwyRyRDB+blS8zS0bWtnNFU+7SsOzoF9MoExVKLlhCVdeR+U1bepkATF4
         WzRLFTCmPhtfsZy0XJf/Wvl7jvjdoqQ6wEp2RbtVrVfanBWzMh6au5oB2A3MwijylCNV
         kX30sOnMvyzbFsUpEKTRgV2NYJJUSuRIcsD89piRykYqQ/lVwZ9rI2Qbv0Qgv1sZbwvF
         arqVS6PHA/qAkW6MLpKgaeZkQ/TP3gRWL2uELZl4IbRXrb+KtLE2PINWY/83KItDmZd+
         IRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/rpv0hsisGb3nHHvAOO3ELylrxjpXbdj4HzmBdxPovY=;
        fh=jExKh7myAprYkHnt4xThQ7eMJ+EUcwE/kBAlq1Fj5jo=;
        b=L0lqPNhT54a3vz7vo/odD9SJjzFUwB2W/+JhOVasqw7s7P+11TrajZk/sghbEcNnvA
         0JhEz3Uny5bDYvebwHHntHZzagZyv8DT65fKGZHYlteK1ABdwkWFSQZzzXcLjDOXTSEt
         pmScrjInA51Fp/NUTfwISW+jTgrClXIg7dTW989TTTGk1MAHp/E+wV8FoL2j4/HJCuV6
         Grh3AwEPbl9uqCMTMsouIVRB3h2ml9nxgxOnxpg1j4YX9X64CuHb3RjeEXCEN2Wrvr8F
         w0gKZIU7zNTdL7IKkD+mnLvuHSwTOLp1BBYiBq0jQBrYDmL0WrTzCTA8JRZn/bFnX0Re
         Gy8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780958104; x=1781562904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rpv0hsisGb3nHHvAOO3ELylrxjpXbdj4HzmBdxPovY=;
        b=UZNxa8s+iZMlCKqqQ1SbxK57Q3Mgj26fl1kt8gO1WwVaxYIsXgTmnrv1WnNIVI21Ef
         53r3p7KPeaiGY7+oDsX+jn1SYPyV2AxytFPoKSKpBFXhlmbWMgBejk7hWBeYAX8Bxxky
         sv1VD8HA3ebiW20l8NaEhreYlqd8yveMID1vmkZZicG0Uco3a6+BVHIi2S3B0WUhxbcL
         KQ6Tfhdo+fNHMKiK+EHvWTJD/c3K4A0C9cA1keoGi8QfjbhMivN+m6ymqIvHLl/NYfx4
         KDF8qzEC6dBWSXSu7ns3YVGCCbVIXJXO0PhK02RIleXx20QbMSJwB+1FPda+HlamrJm7
         AVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780958104; x=1781562904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rpv0hsisGb3nHHvAOO3ELylrxjpXbdj4HzmBdxPovY=;
        b=pdDcsUFKh19H0n8ZkW6rHjipAGHb8o4rmMb8rn+f32ZZZ3BTplIL82Cj3PRto1lA4w
         JlnbXa2zeeSvuja6Tc/QJ2n7JXh0FyZ7ZOVp87fOogW0hTJsqz3kLLaLiESnbUwPtIjg
         jIQrn1+LescA8pPt67Ksb0SeFNNiys/Ho1JYKBwBV6nDgHgxNnlGQAeV/6BXqu+V0i1Y
         H2j3pL+vldEYI0u8ryO7nKIShTZYxP7iN9R2ReaykGOw5MtOa578lFUDN1lqUVYe5s4L
         pX/+1sa0bABYPv7ERMjLnRVY3ClBjW4xvQGvwBtlUuQxf6fYnm8G5dYwG3NnbjWpeT8Q
         /m3A==
X-Forwarded-Encrypted: i=1; AFNElJ/i73731pNk5lOvqZR6yG+0IDYUBLjqj2YWx6EYH1VSZOEp5e0O3bT/QfqBcHyhJQeF8d+sSEdHkvafUniE3ac=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe18JJkBWtgSn92H1o1Q0ZHrNrxTyzu+BAuwUt27BFLeIg3XjM
	x5MS17Bwe5nLcKJXd7y2/+0YqoxYuDUOvfZNz2JPrph7sPcc/I4UUTxcx/cvQ5zdiIXbtHzsttC
	3WqO77WkeM1kY8p93VLWSZPa/sg5yZFxHA+fvSqDX
X-Gm-Gg: Acq92OFf0FbeA1MMelv3YXomJ4hIeTsuNZXCqdqAk1lcvwE1Gc4baRpESqRKui2+AG0
	R+hBRxMbuKZzeNp7OcipeWeGPo43Z6sEJHOSz1NsWAbm606F2cxexJYS/5hvwb79wirfNBzYczp
	Un5Orevs3ANBorzSDh0VY37lNAR4RV1dWE/evXO/ovUWguZRKU9Uby60r10lIZKAG9ayTGlrzAL
	uCXwTEcmWN+Z8QIcFMEpfN43JnvccSdzVGABp+P1g1R0E4OzVz5L6fozdC2iK2nukvUmAtw1yTy
	SsS6JBvfUZOOgedzaL5dCXnpJXwMQCMuQE0CSqxL2rdaRNkr1jcTxnYQzcs7OEX5qo3zPT0cEyU
	4iyyv/O8rRcUglaM9tIdNcmGPb0UwTF8kE6gZnGzH0RjWU1SRb+SazAJvM1xZ
X-Received: by 2002:a05:7022:510:b0:136:83f5:c80 with SMTP id
 a92af1059eb24-138066608abmr7982404c88.4.1780958102929; Mon, 08 Jun 2026
 15:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608125846.157004-1-jiayuan.chen@linux.dev>
 <20260608125846.157004-2-jiayuan.chen@linux.dev> <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
 <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com> <CAAVpQUATP7S7OEZw4P_7fp5zmQO-T5jByxAfp0+YsjRENeWscg@mail.gmail.com>
 <CAADnVQKa2Z2HKKZMhyD1HrurQ4LTcCS0Mm0YPxtisGKwVfcxmg@mail.gmail.com>
 <CAAVpQUCJH3iknHSfNwMqvHVc_V09zNDK-YbXbqa-=K159PTqiw@mail.gmail.com> <DJ40JYME18U1.3RA3TUXB3MH3M@gmail.com>
In-Reply-To: <DJ40JYME18U1.3RA3TUXB3MH3M@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 8 Jun 2026 15:34:51 -0700
X-Gm-Features: AVVi8CdeAbkRwHhPre5-1lF1rzTOH3OTwg-sIWZIP8BtHCUTHJ-Y9jp0mJntayw
Message-ID: <CAAVpQUC1Ot9vr09gNoe+vxgLoqU8Wwn2DV+CQZYYpAJUATJiWg@mail.gmail.com>
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock() for
 BPF-assigned sockets
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Joe Stringer <joe@wand.net.nz>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 3:16=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon Jun 8, 2026 at 2:35 PM PDT, Kuniyuki Iwashima wrote:
> >>
> >> btw is earlier sashiko TOCTOU concern real?
> >
> > Yes, the selftest in patch 2 should reproduce null-ptr-deref.
> > (I tested one in a prior version)
> >
> >
> >> iph->protocol =3D IPPROTO_TCP;
> >> bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
> >> iph->protocol =3D IPPROTO_UDP;
> >>
> >> as far as I can tell past bpf_sk_assign_tcp_reqsk()
> >> the networking stack only looks at skb->protocol,
> >> so modifying iph->protocol will only mess up
> >> things on the wire (if this packet goes out).
> >
> > ip_rcv_finish_core() uses iph->protocol for early demux
> > and ip_local_deliver_finish() also uses it for demux.
>
> ok. Another idea... we can keep the checks on bpf side and
> teach the verifier to invalidate packet pointers at bpf_sk_assign_tcp_req=
sk()
> and introduce new concept of "readonly skb".
> So after invalidation the reloaded sbk->data will be read only.

Yes, this is exactly what I had in mind in the other thread :)

---8<---
On top of L4 validation in bpf_sk_assign() and bpf_sk_assign_tcp_reqsk(),
can't we mark such an skb immutable after the helpers and catch
subsequent writes to skb->data on the verifier ?
---8<---


> There is no such thing today. The verifier only understands PTR_TO_PACKET
> as read/write. So it's not easy, but probably good thing to have
> for this and other cases where bpf prog shouldn't touch the packet
> once it called some kfunc/helper.

This would be useful and we could (re)move some validations from
the fast path.
