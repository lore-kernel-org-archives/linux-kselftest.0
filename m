Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793925209;
	b=fmQ5Z8M/tHftSAIeISAj42x2drm3gciEu1tlBcy3P0dpgK/XrDy+Q9FK+5hC2oBqUnLg
	 GkTWi9h4jvsRuT2E0T79YAeXH8u68bYrEpfM7Yf4Vtx+5F+naAEL4sMGcgN+bXZZfIIkb
	 f3sxs3GwlJJrhdY85lLzRFxN+z5eIvS84OWOqqA9fotm0Dy7dfnrzYvIzCGlEK+nsQdsa
	 zYIrHi7EM6iZqNS59hyHlBloa4FlOcCXmFRMR21YojswKYF8yFX9DdQNHmCxlqJtBPI6O
	 g5et7yZ3mVq1aI5nr/oizQSuGXFE6u6jsS2l6yXqH20XTAZxm95WJrYM9UkziF5FAUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SwtNDvLuC8dzEY+y1VuPyC8x8lvTjr4xeYCs0VMxuA0=;
	b=O4SRaJo7ZuOqyrbrLQIIVkKOghLisrJFVgaXJ0iEbo0KtLUd3TkBaT73kxani0lTDSnk
	 ycSpSR0dne9Pv6teHAtGssKBXfsS6v5BB5KrwQeqSGejSLn+wpeL2m/7kt+WLgZzI6WC0
	 y1Kzng+ZAn9BN/PvlzDGLbI0GQ3sRZ2whzSlhqLjHNndyU4QaWTmo21PoAWKiGPZPj3q9
	 V4MnNPqgnBb722nFoWfB6A86o+QKRHCcgV7Xhzt4h97AGyg9QBHHSSmsgQSZMo/dIbAen
	 Yu0Wl3YUGbiyRTJqPEf62Xh1+t2KMS6QfE71gBR28Insa7iJ0aVjnw6K8NNvx1qQy1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ywu+sHfE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1D606A31B
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 00:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C1D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ywu+sHfE
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-54492d8a988so6731cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 16:33:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793925208; cv=none;
        d=google.com; s=arc-20260327;
        b=IzGti2UaUtY4aSXt2eOCs+1STOvi/Kmkkbck1kn/hb/Wb9wmtWutJmHr27M8cz4Fsz
         GIsN6ZdDnlcJRHMDRIaWZ/J2Zkel6aAmsvJorVXKf41/9MJlwG2K5OvUhn2x6aXpSKU4
         BbVVgxBV5KwLQwoluL7pjuFaXxp9WEXWS/oJujEPAHkyzIEZpfafpmIvOWKU4MMKwIhI
         goq2QYp+9RVjd2dvXD6/Qr2DvlrvZ47Sfkgc5iGnUeUKjPuOKGPAmkYfL4mQeg9JaEkY
         nbLkN0VzyjwxIO3wnG1QIkpwVCIfZlArAj5GimfbhTgYmmCzCk9Y4+aE2dYqapYTkkgh
         6ebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwtNDvLuC8dzEY+y1VuPyC8x8lvTjr4xeYCs0VMxuA0=;
        fh=xruURfEFT/dWUwwyHKV0Yy9J/qg04jwseqDgHRJR3u0=;
        b=dxBAyJlfszutv9LRO2uvK4GFaZ+UnS8frHsVwDzQ6jdGlN9FU+HKM5XYly09miv320
         u8+ddlLeS0WxXq3lZfEYvhP32J4swrRrO7NZTYUrPpC41O5Ai5OGvcH/f4KqgDp3VmoB
         r96wKLDSYi5WTF7gBcVjqakIhus4SN2Ehu1EXvPwzr0FF2T45B0Z0D8M46aIVWb+mmCl
         fdi4VN0d24Myxw6hOUCwpMeBiVSmmNmsc46N3WoSMzhtku1vC5FGIDrGdXs2/2kVeKMH
         Qe/xU442LM+LPqagVO94FuJwvWbY+mIV+Xo3o3Uc9mMkDUwNGfdAG54ki2a8t8hK9WWL
         P9Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925208; x=1794530008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwtNDvLuC8dzEY+y1VuPyC8x8lvTjr4xeYCs0VMxuA0=;
        b=Ywu+sHfEQDyswjTmGQokotF0uy7u7pCMR1FBPVPt/uNsbambe0jjQhrWBXTfquzB9N
         GZiNFD1lNrI+2ZdS1Tv/9mkxSh4zUclo/6ejLOo1qkntPK9yqrWWXXyXztvxwgcxo34P
         swCeIhL4ZNgjdIjw4H28L0g4fpaRDpvIgx+zfmvZiie+4msOl8OOKP5KfViJ3jVQpIee
         axQztJfZmKw5NBT3LA1Dzunq0a0wGb6S8okE4abdMKE60zQWa4351nRk4RjQCjKBY/TV
         8iO0zjweZMJabLuprxT9KX6flJRTA9R93M9WhgzMUf3ANqix4ArOKDfhKDBzVT8wAXGr
         9Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925208; x=1794530008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwtNDvLuC8dzEY+y1VuPyC8x8lvTjr4xeYCs0VMxuA0=;
        b=pTdzuketuoqq9UckotWCFpZywPH4GsFLTCOuw2JxWyP8D3zXANuI/c8NSzIx5CbUY4
         eNaRjXIjZ7reFK5gDJ3Of910ChHj31Jd7TU/d8B5WtKl+ccDWj9Xcz0hLJ7Sa4i+AFwd
         1q/Yjpphn2UUabMKTWaXCV5RDaC8UgA3EGLjD96RG2leLXglCEye+t3DrnyDhx/lXn96
         r4y/D9frIy4/BLIsIgWVC+nCBx9ofYdVpIqWrpzmZ46P2uojf9WLk9Js8QiOHSzbNE8H
         Upmim3k0k0JDoOrNSFwsBrv6zQRZpXHwiNp5/Q844UH1mwK9v18yH4qrBdwbsXWC1kQn
         b+gw==
X-Forwarded-Encrypted: i=1; AKwUvBy7dXqRGQgCY/qaqfFBGVbVKVcH4GMuDEh1fVdgQjgP0SAl4L14fK8BTozamin4zsPxjzswJO5NL1O4VZdhkx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2hnnjjuVtcWgqVxc2R1VjS0lyz+L5EeNpcelUBAuD8V8Ij71S
	gpBXXiXCXDL+0vHNzKs2X1pFMBI82j0z7hy97UbSEESqS9CjUZyZqBkZoDSraD1HdVWOTews3mC
	BY6khUXDHAfGANueM8rVMhRLjFoS1BQN3FpSRgHyA
X-Gm-Gg: AYBFou3q0DcRKexAKEN4O79Sqi12Q4XiE4ApiBVhpc44uiKrPxKD+GrSrV0tRZnO6EM
	mAsqiUFosLkEKH2Tu6xAEGyGMhZGX/JmcpBX+dgXOf5wS05ELgP7O38+ijp4SJtKU93HLCcI8TL
	KUV1Ha6lpEwX7C3XwMK5J8lBWkauTd8+hD6E/jTtZFbndUvXWhzmuYJNAZMqTJQpHPYbSRMb6yP
	HY6xzXwvn8035za9EgMhBpQ3p+usHztmV6VEmOM2eGqGsdAQKTVTIBGE/65hL1ZE7IdADqZ4beu
	7euGe73dQYqlavW7MXbNo0HZWr3A0SU+X/3/tSt/GJFKSkd1vYj82M1igBRZf5bIy2Tm6/unvvY
	zIPCHYBmYxk1YVP0/l6Hb1BhuqvInAvxXYWE=
X-Received: by 2002:a05:622a:4012:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-54e1aca53b6mr6923411cf.3.1793925207042; Thu, 05 Nov 2026
 16:33:27 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030043145.2185700-1-weiwan@google.com> <20261030043145.2185700-3-weiwan@google.com>
 <DMMQTFS3ULM2.3HSJGB1UT085M@gmail.com>
In-Reply-To: <DMMQTFS3ULM2.3HSJGB1UT085M@gmail.com>
From: Wei Wang <weiwan@google.com>
Date: Thu, 5 Nov 2026 16:33:16 -0800
X-Gm-Features: AclHuK9xp-pEOHgQDu3wgVgSsasOVenE5wfE8_PWHekQkM41Loq5TSIyXBPNcLU
Message-ID: <CAEA6p_DCmSskWz5VUOQTmgcnsFDTKH3mSnOdxOxEJg2CU4k0vA@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] selftests/net: psp: test bidirectional data transfer
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:26=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.com=
> wrote:
>
> On Fri Oct 30, 2026 at 12:31 AM EDT, Wei Wang wrote:
> > _data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
> > only verify unidirectional data transmission from the test socket to
> > psp_responder. As a result, they do not exercise the receive path for
> > PSP-encrypted TCP data segments arriving at the test socket (such as
> > packets redirected across a netkit interface associated via dev-assoc,
> > which relies on SKB_EXT_PSP surviving packet scrubbing).
> >
> > Use the existing "data echo" command in psp_responder to verify that th=
e
> > test socket can also receive PSP-encrypted data from the peer in both
> > _data_basic_send() and _data_basic_send_netkit_psp_assoc().
> >
> > Signed-off-by: Wei Wang <weiwan@google.com>
> > ---
> >  tools/testing/selftests/drivers/net/psp.py | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing=
/selftests/drivers/net/psp.py
> > index 473500901879..e507951b440b 100755
> > --- a/tools/testing/selftests/drivers/net/psp.py
> > +++ b/tools/testing/selftests/drivers/net/psp.py
> > @@ -120,6 +120,12 @@ def _check_data_rx(cfg, exp_len):
> >      ksft_eq(read_len, exp_len)
> >
> >
> > +def _check_data_echo(cfg, s):
> > +    _send_with_ack(cfg, b'data echo\0')
> > +    s.settimeout(1.0)
>
> I'm not a huge fan of setting the blocking timeout here. If we are going
> to set a timeout it should be when the socket is created. Otherwise this
> function has an unexpected side-effect. Another option is to use non
> blocking reads with timeout like:
>

Will switch to non blocking reads in next version.

> def _recv_careful(s, target, timeout=3D2):
>     """Read exactly target bytes, tolerating short reads"""
>     data =3D b''
>     end =3D time.monotonic() + timeout
>     while time.monotonic() < end:
>         try:
>             data +=3D s.recv(target - len(data), socket.MSG_DONTWAIT)
>             if len(data) =3D=3D target:
>                 return data
>         except BlockingIOError:
>             time.sleep(0.001)
>     raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")
>
>
> def _req_echo(cfg, s):
>     """Ask the peer to echo, and check the reply arrives intact"""
>     _send_with_ack(cfg, b'data echo\0')
>     ksft_eq(_recv_careful(s, 5), b'echo\0')
>
> > +    ksft_eq(s.recv(5), b'echo\0')
> > +
> > +
> >  def _check_data_outq(s, exp_len, force_wait=3DFalse):
> >      outq =3D 0
> >      for _ in range(10):
> > @@ -478,6 +484,7 @@ def _data_basic_send(cfg, version, ipver):
> >
> >      data_len =3D _send_careful(cfg, s, 100)
> >      _check_data_rx(cfg, data_len)
> > +    _check_data_echo(cfg, s)
> >      _close_psp_conn(cfg, s)
> >
> >
> > @@ -726,6 +733,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version,=
 ipver):
> >
> >          data_len =3D _send_careful(cfg, sock, 100)
> >          _check_data_rx(cfg, data_len)
> > +        _check_data_echo(cfg, sock)
> >          _close_psp_conn(cfg, sock)
> >
> >
>
> I'm ok with the approach overall. The coverage is sufficient for the
> purposes of the series.
