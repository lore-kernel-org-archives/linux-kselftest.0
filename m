Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBBC42F57B
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132431; cv=pass; b=RH9YqIV4+QEZMgM3v6RMVC80Sa1q0zxeN0IOkYkooMGGh6TwTdyU+z/qeo8tcS64pBGarJfOPyVCAMkJvUaizfFoeE4O3wl4uqUjEcipgdCj1oS6Sp1mmD9uZ0UTSbyWU+IcLfYZMfPgRwh9hv16H3o9+GXHbRZ/cMOgW1bf1lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132431; c=relaxed/simple;
	bh=d4ku0rUPq2W2b4nzjW/2a3G+pwxDd6NAsRFLOoSQPRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGCE0nY6MG+OfUWAqxNbngFnF+VTqMXLlJdL8AbRX4OZ4rG4cvqHQjuXVFWKL2zDQNSDtWi81mjuizVdFjWf4Z3lgJUatk1hZWP/WetrQdt7PbMmInd4vyGPObcRUw/vHU0rTn9cDEwjNQMEgR0Y3ZGjurzn/E8MHCUjUFO65uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xhG3HsYM; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xhG3HsYM"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89a0d53f3d1so82709816d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 01:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773132429; cv=none;
        d=google.com; s=arc-20240605;
        b=CVJteQnMpeseg94guHapaaf5T8bftN06YHzUx2q1VCniGZSqaD1rBlxUUr8fgnGZaZ
         NhV63A8fMEH/BjbjzlM9P078Q3iknHTuBGULLTzPNc0qwug7Zr79GzK8Q3biIHNaT+Ox
         Wp5Fj+6zATQBSp8iXFpv3q64Yy8dkTnXLkU5rK1FmmI0ePcyhiiaFkm/zJV8H9QZ7Rqy
         GR4MEQ1+JGjhGnOgXQD5C68JQ4yep9gLyQMZvnFlBhSMdDWIPawZfUMv0kRsJzon1uyL
         qJmyM0vhYud+p0Y7X2GNMpCyf0UT6w8ooA26vzOhFFE2ZRYZJoU5dVVB7gQdkFPtVPHG
         3kFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/YKfuwEjoceIF72ASHR08YC1df1DlHUUca2FdDvmBo=;
        fh=TWk7q3kuVN9XEOpmipXyYn9WKCuC1Be2PdKzj38bo2I=;
        b=P4cdtMoAs9thH6EdU1ASW3TXJgwY8cfrhGa9cCEdScf5aPTz1n2Dvif1iAXz1Mj9Ko
         WVb23OQvrr7oPKQ1O0ZtuvD3rAGGzcfma+7pmzqHfeDdvabXaFbx03Uiam8RY/4k54Oa
         nk7VlsuOKT6+HkAC4keC3Esv7QkI96fYbP3JXYzO90JquNTYSz9bIbJX4mfiPNJHEwHF
         YvtfcYiouAn/Uj5WwGG/UZZpO7cSZiz2LnzLi1hU8IEfkr9GN68tjOGDsY1+aYSBsuHl
         ZS3Qi8hOYvbeJM9lxTTxhyWPTVlmiHMc2IV4Soy+TMEksS1rc2dPtYh8yckNXFUXrbJK
         b/7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773132429; x=1773737229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/YKfuwEjoceIF72ASHR08YC1df1DlHUUca2FdDvmBo=;
        b=xhG3HsYMI7RPs8xQO/lrS9Jo+wVenz1cbTuAppsQF9yNtLQwfaKo6LALa6Dmau2hvq
         cy5hg+0U4K3XzQZN8IhobA/DeG7gHcD7BptrHZAxtVR+SkZdauq/l4oLFEHau+lQix5H
         A01Y/s/6xdR1GU6s+KWMMuNF13bmRBzgtoS2fTIn3LuSC4HKTk+fMxfYBRHzMMZ94ngN
         wDnD5QWU/Te+JBTDi+ph0ibrm3gLLzN7gmYbNx7hy7icxVuQXmKqF7zr70vEEpUCRAti
         sQd9g//3Jg0EGGSClCHJtJ0C09bjjv+Vguz7N2IsbfzW5FISlO8sAAQQkZStVaHcTk6P
         WpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132429; x=1773737229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/YKfuwEjoceIF72ASHR08YC1df1DlHUUca2FdDvmBo=;
        b=WbpbuxeCmqNW7uuxw28+bFJkun/QfU9HcSHhVz0WffirmDGTPDXs73Fq8nMQ5CDUFs
         TSPBtuskRO8thhnBucTsmUUKZ/akI5PSv+fBDg6CKAG6ITWGOasaOAR3Ze1DMDW9EDVD
         RmNZ32gBXklY/K1Hcu/bNPCEsFTua66CvQTFWdEd6AyyaWRDz4w3LTv520pD5HvSZEU+
         MBuLPP+ejhEQF+3NZSZoMTQ/8F8vmtyVhv31J6hNRiQEwTQ/JN5wHiDKGBcsXSVeGLu0
         6OQ6AG0mzV44G7JgR+ug9cnWJgimMlrBGR6kqG5iLAhPlXdLbM73iEFmWcOooAjJfmgl
         cgqg==
X-Forwarded-Encrypted: i=1; AJvYcCW+D98abh4U1L69Xm6Mtriy2P80ajSI3Hz1p44bczvDqvRf3cQ94Wgx0pcgxP4eWE88ybAZMy3Xzu7uqZGGbCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6DFBgoSr9bSdXarKyYk/rIXzYiGZiE5xnGNCOwGRdZwq/HnbZ
	9lghnvLAtUrz+CJvbCZ/Ulr48LgzQT2znh4J9nHZFHxeRjPz5izCY4s+g3r94IFuvnDZoXgQbJ+
	qFdEs95W2j5+5xC80adJ99xnwBGaq25Gb94PKQrZw
X-Gm-Gg: ATEYQzwPK6SPqAyMuZdfmlPS+ePiw8tty1yLsgVagpa3GhIEaaWuIzbSMTxrsVK4Kr7
	4nj/tktRIW/s89x8SnCqQRJQWV5Hm4l++I0NalSsopA4ls+uAoh0ymvJ9TqzyLUYkxznh/Df2+m
	ahz0R9kutGy0g6E9seMyERhXPWVRYU298V+6ylFKPS346Ycvr5t6CAuJlP9005vWIvEtRTKRKPs
	FuaeXE3XiUz8TpDcLZ3tElHTwtZVYr55BF5xg0af5cod/GEMe0TkNRYjyxZMVdzr1Xk90/Rt67j
	52+I4MQ=
X-Received: by 2002:ad4:5fcb:0:b0:89a:13a5:77c4 with SMTP id
 6a1803df08f44-89a30a809dbmr212994566d6.29.1773132428381; Tue, 10 Mar 2026
 01:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-4-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-4-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 09:46:57 +0100
X-Gm-Features: AaiRm515yCYx-zywRXphow2t71Syn2XmFVDbg53R2r2K3-5MlWrmIcf8VHqN2p8
Message-ID: <CANn89iLrpBui8OGtPTV+Vkane7xHNErPB8a3AgOEawpi7CLU3g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/6] selftests/net: packetdrill: add tcp_rcv_wnd_shrink_nomem.pkt
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 9:03=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> This test verifies
> - the sequence number checks using the maximum advertised window
>   sequence number and
> - the logic for handling received data in tcp_data_queue()
>
> for the cases:
>
> 1. The window is reduced to zero because of memory
>
> 2. The window grows again but still does not reach the originally
>    advertised window
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks !

> +// Ooo partial segment, in adv. window -> accept
> +   +0 < P. 1040001:1042001(2000) ack 2001 win 257
> +   +0 > .  2001:2001(0) ack 1042001 <nop,nop,sack 1040001:1041001>
> +
> +// Ooo segment, in max adv. window, beyond adv. window -> drop (SKB_DROP=
_REASON_TCP_OVERWINDOW)
> +   +0 < P. 1105001:1106001(1000) ack 2001 win 257
> +   +0 > .  2001:2001(0) ack 1042001
> +// Ooo segment, beyond max adv. window, beyond adv. window -> drop (SKB_=
DROP_REASON_TCP_INVALID_SEQUENCE)
> +   +0 < P. 2000001:2001001(1000) ack 2001 win 257
> +   +0 > .  2001:2001(0) ack 1042001
> +// Check LINUX_MIB_BEYOND_WINDOW has been incremented twice
> +   +0 `nstat -s | grep TcpExtBeyondWindow | grep -q " 4 "`
> +
> +// We are allowed to go beyond the window and buffer with one packet
> +   +0 < P. 1042001:1062001(20000) ack 2001 win 257
> +    * > .  2001:2001(0) ack 1062001
> +   +0 < P. 1062001:1082001(20000) ack 2001 win 257
> +    * > .  2001:2001(0) ack 1082001 win 0
> +
> +// But not more: In order segment, in max adv. window -> drop (SKB_DROP_=
REASON_TCP_ZEROWINDOW)
> +   +0 < P. 1082001:1083001(1000) ack 2001 win 257
> +    * > .  2001:2001(0) ack 1082001
> +// Check LINUX_MIB_TCPZEROWINDOWDROP has been incremented again
> +   +0 `nstat -s | grep TcpExtTCPZeroWindowDrop| grep -q " 3 "`
>
> --
> 2.53.0
>
>
