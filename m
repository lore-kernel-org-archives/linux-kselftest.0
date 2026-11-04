Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827614;
	b=WWrUAd4lLwMBdV7WoUGlNijionYecGeiUJKjZ9bjN6ukF1JnhFqOb2MQ64rA0VBeT36H
	 TSVhGe5YVg1fw4MzS7SKS1gELAwGs3AMKNmKv0zTGiNSSOsQ8mucEP9CDu4DvWDmtUFuj
	 MXNwOvyDQMD3wP6TADGmVyp7GQepDiEBInjNajghtktdLm5b1B+4VOFxMJi9W8xG1HjSA
	 mm/EC0pEyTCbOc51hNfqI2tOdtVl0SR6Djn/FvB0GsNys5N7a0HbtpAIfzKYguKr890kl
	 KxPUdpQHvIY0oVopyw+fJg8sgae+ZMA+FlRt1JamvxtQP1er8hD/r+UDd2MLQ/AW0LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Fx8mwjCrbZCWbiZSWWBXN0aiI/C9oFeig/QmjdPJVek=;
	b=kVvo87PLOGqlkZ6FbbdJXPc19OEmHkPn92LP8+Vyh09905xdnNsRCswxGokhxlTTKhHc
	 ZNidY1UMBYrjnck6MY9499tglgRIA16NqBvykoC6wf5rw7g4j95co4Nm1VxdrTmZMwBoO
	 kKYwczFrOFein/ebUzIAAYphD1FylnuklorPYN4fI02FNtebJ8wRoIUnrazjrofDF3qCS
	 QOOK7oWUaBvtVQ+rZMXWoW23N3spzfe2fVFeniTKGgOsK56XWRU/QXY1QDLi8IAxEB7vJ
	 jsvd4f3giSWXGBDYdtEuOdn/7HahkrQGQ+2OkH3uIM67/pwZKNIx23b3HTtuf1Ad4BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vy+SWiVb;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94D606AB3A
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E94D606AB3A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vy+SWiVb
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-536c8f958d7so9079741cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793827612; x=1794432412; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fx8mwjCrbZCWbiZSWWBXN0aiI/C9oFeig/QmjdPJVek=;
        b=Vy+SWiVb/NpXstpdw56lw+criQ5VLmL5fI7nn0T68KlPT3t+Dt/ZXXIrVA+Cb9oTH4
         TPCa6A3seRH9NuwzLYB4U8f/OShYV6IlQIso/owGoN/zGKf8RjT/HHAYQiFq6Md9/AGx
         OQu+WfEphT/kKjXP8GvKBBFJyiAVMrQefdiWdJmUUcdvKTLoDsWtPAZotnQX9UJOrzaQ
         xRONIbMdbEwkr1WI3Kg4PeBEsFZ5Y37wda519hWTRbTA9zS4VszXsqzBXwuK7HvvH0Qa
         FvCJLDSn4KAlIWnCl9a6eAaYBJKX17NVHsnq7L+bnHg+v812XRAWefqQg5U2r0LgvExP
         /fLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827612; x=1794432412;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx8mwjCrbZCWbiZSWWBXN0aiI/C9oFeig/QmjdPJVek=;
        b=wuJ1G1nTg1c2QFtuzLC/6jPz/UEDNuc3dDmT2hfxdUUQUPaHEPISvecNjhgIkUA5H6
         cWrz9HmE/bV/uU1HMMOlWNgNX79HabOObasHn60qHqYs5LFfrchgQmweuD3ta5pZ+JUT
         me62TtglgrdKr0gEXGoJisR/1qVLR6dKMuhnN24IV71Qr0PrRD7GIKcQK6lVJHOKpUFB
         oM4ILi3OI93Be1hQFc9ej5gNZYwlIkCY9VroA8sETm9D2sGg22wFEbdftnPdhcUa7mAq
         glBA37elIMNwK6G2k0BVZTUC7THxHQpkY9jL1L6eWAiYA2k8zxRHMvD2rtRoQngTIgyh
         JbKA==
X-Forwarded-Encrypted: i=1; AKwUvBwBiE8oCtOj8KMCd5ucBh2d+Io5W1CoEy0K5Z9nhtgBfPjrV+LP73v/ZxwIT3aTccqSswr//eHlmcfzILKQp/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ilNFYeYzKRkxW5jKCJJCGXtadJ1SYEe0b0Va8ZCUzPR7CHQE/
	SyIugHxWf916zHrFh2m55lbxmEjhhq+kEF1EhwbrY0zJN+yBIxtTw/5s
X-Gm-Gg: AYBFou0HEnbj0xzbrJLvf9YYGGpkW8oNtm5rv1/bRsG92IKwM+glRXOdvadPHznROKp
	HsT1mN7ofjK/XxYmvAi+mEmVr8TCRqHZsxt0JBviVpmAwMFeNUNqrttLOBejfWQhWgbV0oAA/CN
	WZ5B+mx2DAiHzZgCGFCw9QZF5Hqmo87dfLYdGdpyPQ66KVo1fgRqIcVxD6j38bG7UYeGR6+HJk0
	5AmRZHCQs4T8BOcBtptXDWL4qcqzWSHncy+1qDvG3PchvO5R/2fGS18c5h3nbuVuEHdc4sk2Xh5
	R6IxUHb0t6ozzUWOUHW7EkiUuuqwfeLEFJYeKYXPBmM7JBHqYegU8R+PONMWwCOCcztTWr5L5el
	AsKzmuRq6aoHL+ewfc9UtxWVIJOEgMmXjl/y4CpSg7/idrbNXVycHwMC80etUP5/U/zAbhioYd0
	RWWmEmB14bVJSF6FLJG9eHQpBy1g7v8iT6vDJwmBSwkIfRT+zcRkW3/IAyeLYi7tN9Vj5kg+8aI
	NhQleOTPAx13Llhu85d5q5FcTLVn6Xbo0gd1+0lpLE7OPNOoDSrGLhXkrr6QkHFEB3Z48YDmC/p
	+ChabMq1ekOErIII
X-Received: by 2002:a05:622a:2510:b0:533:8bf0:e6 with SMTP id d75a77b69052e-542b6a703c1mr284677281cf.35.1793827611998;
        Wed, 04 Nov 2026 13:26:51 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::4:a8c5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10c4dcddsm34508841cf.20.2026.11.04.13.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:26:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 16:26:50 -0500
Message-Id: <DMMQTFS3ULM2.3HSJGB1UT085M@gmail.com>
Cc: "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Willem de
 Bruijn" <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net v2 2/2] selftests/net: psp: test bidirectional data
 transfer
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Wei Wang" <weiwan@google.com>, "David S . Miller"
 <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261030043145.2185700-1-weiwan@google.com>
 <20261030043145.2185700-3-weiwan@google.com>
In-Reply-To: <20261030043145.2185700-3-weiwan@google.com>

On Fri Oct 30, 2026 at 12:31 AM EDT, Wei Wang wrote:
> _data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
> only verify unidirectional data transmission from the test socket to
> psp_responder. As a result, they do not exercise the receive path for
> PSP-encrypted TCP data segments arriving at the test socket (such as
> packets redirected across a netkit interface associated via dev-assoc,
> which relies on SKB_EXT_PSP surviving packet scrubbing).
>
> Use the existing "data echo" command in psp_responder to verify that the
> test socket can also receive PSP-encrypted data from the peer in both
> _data_basic_send() and _data_basic_send_netkit_psp_assoc().
>
> Signed-off-by: Wei Wang <weiwan@google.com>
> ---
>  tools/testing/selftests/drivers/net/psp.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/s=
elftests/drivers/net/psp.py
> index 473500901879..e507951b440b 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -120,6 +120,12 @@ def _check_data_rx(cfg, exp_len):
>      ksft_eq(read_len, exp_len)
> =20
> =20
> +def _check_data_echo(cfg, s):
> +    _send_with_ack(cfg, b'data echo\0')
> +    s.settimeout(1.0)

I'm not a huge fan of setting the blocking timeout here. If we are going
to set a timeout it should be when the socket is created. Otherwise this
function has an unexpected side-effect. Another option is to use non
blocking reads with timeout like:

def _recv_careful(s, target, timeout=3D2):
    """Read exactly target bytes, tolerating short reads"""
    data =3D b''
    end =3D time.monotonic() + timeout
    while time.monotonic() < end:
        try:
            data +=3D s.recv(target - len(data), socket.MSG_DONTWAIT)
            if len(data) =3D=3D target:
                return data
        except BlockingIOError:
            time.sleep(0.001)
    raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")


def _req_echo(cfg, s):
    """Ask the peer to echo, and check the reply arrives intact"""
    _send_with_ack(cfg, b'data echo\0')
    ksft_eq(_recv_careful(s, 5), b'echo\0')

> +    ksft_eq(s.recv(5), b'echo\0')
> +
> +
>  def _check_data_outq(s, exp_len, force_wait=3DFalse):
>      outq =3D 0
>      for _ in range(10):
> @@ -478,6 +484,7 @@ def _data_basic_send(cfg, version, ipver):
> =20
>      data_len =3D _send_careful(cfg, s, 100)
>      _check_data_rx(cfg, data_len)
> +    _check_data_echo(cfg, s)
>      _close_psp_conn(cfg, s)
> =20
> =20
> @@ -726,6 +733,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, i=
pver):
> =20
>          data_len =3D _send_careful(cfg, sock, 100)
>          _check_data_rx(cfg, data_len)
> +        _check_data_echo(cfg, sock)
>          _close_psp_conn(cfg, sock)
> =20
> =20

I'm ok with the approach overall. The coverage is sufficient for the
purposes of the series.
