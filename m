Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47355368285
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771924955; cv=pass; b=VesB6wrd0wExZhtFjEAQ/Ulyogc386FuSsYSN2wah2NOXE+KoIyGf415leV2Y33JHMqJ4vKLugdCCXHQQVjvyO8mQ8wqrLP7JSkkVClVsvxJuCO7O5+BIZmfGv4tieui6DO5/+29TMSUv7hTvmHE8yERbAHGgT0XrmZmlOntnpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771924955; c=relaxed/simple;
	bh=W1IR9WScIDkn/Ldtj14H5MHS1TFfCVSY4+W1vxZj6aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCr4ShmceODqDjJ1UVPfK1v0s8mC379x5fgFY568gZyE2dWLpuV+6rW79+Nbdy9DenVliMjr/F1esZYBddkbwaca6ZQTI82QpS+l5qzZZyhHJB3yqohf/GBkblpIdFWXNKUN2HbnhJIH6n8icHC+0szw+kiSjd/iEmzk7hrOfZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cKmojdgk; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cKmojdgk"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5033387c80aso82645041cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 01:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771924953; cv=none;
        d=google.com; s=arc-20240605;
        b=cSYcz02CPdJV5WNXL8BknkckDUE+FBGabcM6+WPt+s1jljIUyGiZbNQD53wp9P7Vvo
         wSBJAsjQtC3j+thFw59K/7Z5HuULr0ZLpf9n2o6QFs6yb4Sf87Q+sg0CdWxVwEMjEFXR
         uBEJ+CgMlfjwzRbSo10ZLOUfgo+brnDlw4GV99UR8Drcw/qJbgMWWYeMVrcsjblLMqTq
         bTsHjrRcTs+7g3Xl5kiIGeJcuVR7RSMOZVIfsSuj+8/tL/Q5zktO9m6yCe5TmCB4g06H
         HM43z/udOPr9LFxHYK3cZ8aomYKek2tc7ZRCzQ7FJZ/0hJaieCtllLB8Xsp1ylCC8nAW
         8vlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bK9XwEb9y6Wjy1j2b+uWduqpfjZe/0b6JObJU2L/7Zc=;
        fh=fL+3U2eI6yqK8Vjvia7rr3Mby7dd4yEO+bxSKOcv2OU=;
        b=fjKprNYiDN6A6L2KCFPCkEbjW6l9Nj+tBYNdiLupW9ypNllMD/pqF9Kca+B3Ox9apQ
         gQlYqXq5qlbN5S41XgKmsTSZeyiYYYNA8+pVPOtBH0NvXcomDBwIPSq/YmnKtbmmt+z8
         CFiWnwn04IrtBnJQr7sVDAHqqCztgFuh3lz8NoBxeyULpejR40oBNZVFSTbXqVRZtRGf
         bjP6EuEsqUgENe6eTE3g43ETxbTRLPZGQdYTZCfruUlvrFoDSO10i6+9n4LUdj817Jv6
         1Xkj0sngnYfdNcXPd1JbysF46GaoX6U/md7DrUt1n2xY5L0+G9EwhdU0qcKCIPFk+oei
         YLhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771924953; x=1772529753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bK9XwEb9y6Wjy1j2b+uWduqpfjZe/0b6JObJU2L/7Zc=;
        b=cKmojdgkRw4js7rFJxZ1jn65i1bqplTVNCvpA6hkpBQeDVtcB8FH/vkbmTbnDqFaup
         KHNMv5VSsuDxqvMuPofBmFzQXO8PjB61FDeAhCxPPeifvPXoPz0ZNGcy75zjWfR6m7Ra
         HriuqCv5gxqMIDKPGksYZEg82wFhsztUf5IOGjBZbPNYwEgth+niDzLjr5oFguEoVH8O
         6mJTzLH9+GGaL3zVccwSUIiVkdTTnbT9EyZGMC3mtO5p478s5HC2EnHwz5TjSu8KZORN
         aK4nCVoav/Vxw2FtesI65/YoEc2KWdotuub7RsCe4oQU9F41wuxDX3aq6qptWWzbYtdF
         3GTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771924953; x=1772529753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bK9XwEb9y6Wjy1j2b+uWduqpfjZe/0b6JObJU2L/7Zc=;
        b=rUsTi/qmiI3I7jdVbKg+vAM98KdAbg1PodArFVLUcN6s4pD+JcTSn4vE5dmpXwDVcP
         q/3Eux2B6ch1Y5DB6+2ioTkQAEdql7Zn34vKuZyUiKzRWrRBs6z4l9OGOtbVoELJw5Y/
         /Y95A/2tjJZkRxFeB3Y/3shZXz9DyX8dzPimpHtANKOdbvY37SyjkVck6gyA1Kc/1RgU
         EnWUigpdlormqcNTqr8re3TQ8xPbP3MwQ38VA6vA/5hvhRv9LXEEFjecjKb+6BiZklwa
         4ci60PaVEBcOJJQkX54LGkoiuMK7sbFuMJ1jGEQwkiK1Yj7u8qUJDRw2/g6iebwDBE/K
         qQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6eR0cT2oVXsBu3rHzSpVDN8LNOujFOxXR+V/Oh9ZCwfeRqImGcwm8jLvBqXZfjg3nvoFq1+P/p2QRPZDeWCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYt0DzX7Oe2a29d/6LAXHH4tCPXvdhPu41ufl3y3SL1OxeBPBp
	6mZxirtwGa8AJNbi1mCXmB8uhm9A1qRVkAaO8Hz9iHmhyIl8kV4+Um6CP5wCMtF2ykg76R5wvdD
	FuEE/awT1KDy7sGX6Wq0VBHMLN065kK0vlSu6Ws6G
X-Gm-Gg: AZuq6aJ/VPbXdTOCOouRtRdBAogI4VuKElNZ8rk4h0lfNkcFgF8sj5ut1EsUxekKZeI
	H0UvEYMDpeaqZISaREcMw3Z+HbA/saT1CyYW+LZuy56y1izbouQGW7SGF545Si2djCuBnA1iEMN
	AjOsN9otLoO2Ox7PFF1r6D7Tf15w12D74LJ5gLaSvbLYQlyK+YFO1g18uOGnViESWTHuQKiE2tN
	yjt5yzvIFnJJHfGV0zfp9Ze59ax2OjcWo3RY+wAvn8gvPbSP+4e7r+Lmo6S8/jcltm+867jGMVE
	Q5h6IFUM0taRpdqhtrhZcnHESKAwP2KdtFJmbiH4bw==
X-Received: by 2002:ac8:7fc1:0:b0:4ee:1dd0:5a50 with SMTP id
 d75a77b69052e-5070c2bd60amr156825011cf.17.1771924952622; Tue, 24 Feb 2026
 01:22:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
 <CANn89iLd=P2nftdMReVkc+d-8+0PGi1ACxhrhnVCxFVxNOhvJg@mail.gmail.com> <aZuaQSdsuWaAZza8@gandalf.schnuecks.de>
In-Reply-To: <aZuaQSdsuWaAZza8@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 24 Feb 2026 10:22:21 +0100
X-Gm-Features: AaiRm522a6qXQbkPHi8t91KDO1mc-rlMizziA9EwmS69J1Clnl3Iw5_n02w5ZPk
Message-ID: <CANn89iL1rQ=ZhuQwNsxt2H1LPtigJbbNx+WtSjqDqJ1dmpF_ug@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/4] tcp: RFC 7323-compliant window
 retraction handling
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Stefano Brivio <sbrivio@redhat.com>, Jon Maloy <jmaloy@redhat.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Christian Ebner <c.ebner@proxmox.com>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 1:07=E2=80=AFAM Simon Baatz <gmbnomis@gmail.com> wr=
ote:
>
> Hi Eric,
>
> On Fri, Feb 20, 2026 at 09:58:00AM +0100, Eric Dumazet wrote:
> > Hi Simon, thanks for the clean series.
> >
> > I would guess you use some AI ? This is fine, just curious.
>
> Thank you!  Yes, I=E2=80=99ve found AI helpful for getting familiar with =
a
> new code base.  I also use it to refine or clean up the wording of
> bigger commit messages.  Code generation works quite well for quick,
> throw=E2=80=91away code (like reproducers).
>
> > Can you add more tests, in memory stress situations ?
> >
> > Like :
> >
> > A receiver grew the RWIN over time up to 8 MB.
> >
> > Then the application (or the kernel under stress) used SO_RCVBUF to 16K=
.
> >
> > I want to make sure the socket wont accept packets to fill the prior
> > window and consume 8MB
>
> I suspect generating 8=E2=80=AFMB worth of RX data in packetdrill won't b=
e
> fun (unless there=E2=80=99s a trick I=E2=80=99m missing).  And using regu=
lar TCP
> sockets on both ends would probably be rather uninteresting (no
> packets sent once RWIN =3D 0)
>

8MB was only to show my point.

A packetdrill test reaching 1MB should be doable.
