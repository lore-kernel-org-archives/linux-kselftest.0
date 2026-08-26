Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591573BE141
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759586; cv=pass; b=MBxs081UjtXlNqb6N4PAjerqwYYJCrt7HfPmRlz0BQ8CzwAAT8ddC77rIUs7q6xl9vnsEdG/AavI9+hFR6zfXUKCOE3LGnc1aWYfWPfyz6DoTJ7CgahabFK6xYd5b1evNrQBhxKkb+dRjF+x0I5xrg00eGqmKuUEcSJjzzUY/aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759586; c=relaxed/simple;
	bh=nhzcmQbfSdSCC3/voOcltTc6ecAvxBkF++UsUwC1yIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOwKoLAiw429F8/fSMCRVuLporWE0om5UqZ3qdO0pShEQd+KNKN+pJcZ0ZFvoDtSH/9mmkTOzinHnBUwHTLK3NH0hlOJQgdq5k+57CVpwOqq/9Pcc14lJ1sDwTxH6VOiKYkmCsBbZMBJLUULSK7EOYvXPWBS85QHoWlCZ7xaqXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wkXFL+8j; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wkXFL+8j"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5218927884fso11318071cf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 08:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787759583; cv=none;
        d=google.com; s=arc-20260327;
        b=H6e09/qAbBle0BbTVfYSokTR9YezojEs6ggIVEbajdrhUYoSm4x5/wMof9nYdFlWm1
         Ue/BclH9e8/NMmm0fABNbx85ucyr7h+5ShjNhiBM3GPqKEWhImbpxMVpT33GvdIVLQpm
         LtHivslvBhHpgyWaFu3IfHdshlOfRZCR1X54SbuhOMLwdO+0CHtkWU/f3eX/CwR7fwBc
         hQJPCvobrjK7MIVKAq7aR+2s7Fgxx8GmRLzuOHDUXm+NmFZ+XkbNo0mgozaq5Im1/E9+
         GPzibpowpXEKdgdTLv/7hc05F25pMRPpXaV01NcT4mMMxq4/8RR5Q1K3QnMrUAt7Kom8
         b6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/A1U78CmUVxnpdrZlvgInM8HciZ9zbDyKtBI4yHBqq8=;
        fh=DXBrTTHgo6c/YGK4NZBD5eCoMKaqcm2v7cOKy9cA3TY=;
        b=m7rT88Yp9oEjUkdpmYjOsJuiM23RTKbkE8Ea9CJlByht0xBU9TkmYtBT/D3llAPXLI
         gCJaCauN2XiR4wsjIl9GEXtiaVxcsnB5MaLyUEOwJOqbepjSWT7RGXaUSMqiRZKxawJf
         tWl9uwDBUuIi39KTAMZjgrSgjaPh/R7yRTWI0J2P8uzG9+jTFdwoOrKNOpm1YL4QpXNl
         iPgeic2mXc+tWPdCxJKzWo4m0t/WNy81TTcukX6FSqUXE61lbk4b1ENxthdIye6MTZPN
         MF4j4LnMDaGWHt4seD/+Ih52qE6OfCWffPp3OSVwmGkWNpWyLr1KH7rWigzzsULjEnXP
         VeWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787759583; x=1788364383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/A1U78CmUVxnpdrZlvgInM8HciZ9zbDyKtBI4yHBqq8=;
        b=wkXFL+8jVVLQMfdobSGanytS1RBg4CdFQzvlALUAfrMJi/BOtQyuc0szzf78+vW+4p
         /HECmtwNvfcYXTEMByQQD014I91DwSHoa6CLwODjWUNoH7Fa+E2bDZNYOSU//wC9gVTU
         65EhvxE3JOxdc4DvGCP1VLMpjcFkPBtKxzKxFt8Tr4/Q3sFPiZZCUTrXGL/iwPiN8HWn
         Mq8QAUuwEiHGbesY0Nyk7iGsAP3o4Kq6D4AxG36f94U6Ssm4Np1y6KSNs99HhGFsposO
         8GXPxD9R1uBQhGaI6L+PFGm/V3ZfcVLAiOBgbnDuWOz8EU4gslKDxOsRRLeWcWMXdS4i
         vmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759583; x=1788364383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A1U78CmUVxnpdrZlvgInM8HciZ9zbDyKtBI4yHBqq8=;
        b=EAIwYj6rn0zhrPgT9QIRcnn5OttT2QeIbkLelOx7Zn0cHVt0OVXzvZkM65rWMj37e3
         Zpw2MwbwQLHs/BBO1gwaPKdRNhrH1tEZ9CrldZ86HJOLi0l4a/6lacD/TJuFc+7g541p
         Z3E8fpT/c2kVEphJG63i4yMoErmJIflxVCfnCho5zCTXs5MPl1V8EjhrDg+YGWVUkT0t
         YrAurBboUtfuf1Cw1ewJpnvQbfcVvsQf3r+oQGqQ3Ia3wvov8q59XVkJbvX9siofFLgQ
         5bjJESjiVKQ8sFhX69CJwvCCkWtUI1B4MxerB6QhV/N0ynBpnFZ08MOJz11LeJKbB09h
         5nvA==
X-Forwarded-Encrypted: i=1; AHgh+RoeWjMTp6Ni4BTu/rCkc2SwhxzTXTiRc/VStY3aqi4Fldz6PueQNE59+Y2cH1iPvGbZ6n3R4YF4Se6DbmHI9Ew=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Ro1AYJvEER+9N1h4wuLvZ8Lp3ksQ2p+6MoeRiaw7tDJEpSGz
	NGar55fADVVj23iO45GKfmlKF3fTN4yV7jK4QpLrGdbVrOGsXV/l7obRkya1NY602CRIMhce+ZZ
	VnE9ZdTYobX1oYxY9FrOC18UQf9iygYfeCUMBQuvM
X-Gm-Gg: AR+sD11uUA4QuCQemgjOSu+yz05dwBNf4KG415/uTiwn1bYF9iySWvRaqoCc1GbBzpL
	+Nm7XM8+h4sNUDmkx7GT7WC9f2JJDp2DU8naapmF78MfLVLjGOcqhxG4qRFOGqxEybyfksic26W
	2hfOW+Bk1UiV7NIpgjUlT1nFqpYZ44LCtlsrVgwg2QiHdT57FSnjWIpPdeZhsKGCEl9QvTw5dSp
	LsnkZZ2rUnbfIaSJ8mNaGaPCqdy7LPCnWYBCvxY2XFO6Fd/o9DIfw+6vBXU8xNHJtLY/KVn/Ipj
	j5VncY634T0CddF9q06zes5S0B7uLQMfds3Zv1SNlDqkCcmNC52NLhzLzCZXpH8pMeV+jdZZZrn
	wtc+PgSAqkNvpyJPsAs2AVFxpiI479/l/XYuU8iClCcGqc5/s1FdYdcP7MYI=
X-Received: by 2002:a05:622a:a905:b0:52f:9e5c:3402 with SMTP id
 d75a77b69052e-52f9e5c3d24mr21245771cf.23.1787759582224; Wed, 26 Aug 2026
 08:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826141145.67823-1-jiayuan.chen@linux.dev> <20260826141145.67823-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260826141145.67823-2-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 26 Aug 2026 17:52:51 +0200
X-Gm-Features: AcwNN1Udvbdfj1DbWjOiCAJ8x73rQxJ0GSWWRifRu8ry20zOWq2VrfeuYmkOmP4
Message-ID: <CANn89iLAZMNspMM_cf+Y6-JVY5gO3sB98sjWQx-BLQhGWySE7g@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests/net: packetdrill: add tcp_urg_ptr_retransmit
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Yuchung Cheng <ycheng@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:12=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> Drive a connection into urgent mode and force a multi-segment retransmit,
> checking that each retransmitted segment keeps its own urg_ptr.
>
> The test asserts the fixed behaviour: the hole is retransmitted as two
> independent skbs, each with its own urg_ptr (5001 and 4001) and no PSH.
> An unpatched kernel instead sends one super-skb whose GSO split copies
> urg_ptr onto the second segment and also sets PSH there, so on an unpatch=
ed
> kernel the mismatch shows up on the PSH bit (actual P.U ... urg 5001) bef=
ore
> the urg_ptr:
>
>         tcp_urg_ptr_retransmit.pkt:63: live packet field tcp_psh:
>                 expected: 0 (0x0) vs actual: 1 (0x1)
>         script packet:  .U 1001:2001(1000) ack 1
>         actual packet:  P.U 1001:2001(1000) ack 1 win 1050
>
> After the fix the retransmit carries a per-segment urg_ptr and the test
> passes.
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  .../packetdrill/tcp_urg_ptr_retransmit.pkt    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_urg_ptr_r=
etransmit.pkt
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_urg_ptr_retransm=
it.pkt b/tools/testing/selftests/net/packetdrill/tcp_urg_ptr_retransmit.pkt
> new file mode 100644
> index 000000000000..22f750ce09c1
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_urg_ptr_retransmit.pkt
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0
> +--ip_version=3Dipv4
> +//
> +// Reproduce urg_ptr being copied across segments on a multi-segment ret=
ransmit
> +// in urgent mode (regression since 10d3be569243).
> +//
> +//   server (kernel, under test)                 client (packetdrill)
> +//     |  write(5000): 1:1001 .. 4001:5001            |     mss 1000 fro=
m
> +//     | -------------------------------------------> |     the client S=
YN
> +//     |  send(MSG_OOB): 5001:5002 urg 1              |     snd_up =3D 5=
002
> +//     | -------------------------------------------> |
> +//     |            SACK 2001:5002, leaving hole 1:2001|
> +//     | <------------------------------------------- |
> +//     |  retransmit hole 1:2001 as ONE skb:          |
> +//     |    seq=3D1, 2 segments, urg_ptr =3D 5002-1 =3D 5001|
> +//     |  tun tso off -> software GSO splits it:      |
> +//     |    seg A  1:1001    urg_ptr 5001  (correct)  |
> +//     |    seg B  1001:2001 urg_ptr ?                |
> +//     |        want 5002-1001 =3D 4001                 |
> +//     |        bug  inherits 5001  <- caught here    |
> +//     | -------------------------------------------> |
> +//
> +
> +`./defaults.sh`
> +
> +    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 1) =3D 0
> +
> +// 1. client force mss=3D1000
> +  +.1 < S 0:0(0) win 32792 <mss 1000,sackOK,nop,nop,nop,wscale 7>
> +   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 8>
> +  +.1 < . 1:1(0) ack 1 win 320
> +   +0 accept(3, ..., ...) =3D 4
> +
> +// 2. server sends 5000 bytes; TSO on, so packetdrill sees whole super-s=
kbs
> +   +0 write(4, ..., 5000) =3D 5000
> +   +0 > P. 1:5001(5000) ack 1
> +
> +// 3. server send OOB
> +   +0 send(4, ..., 1, MSG_OOB) =3D 1
> +   +0 > PU. 5001:5002(1) ack 1 urg 1
> +
> +// We could disable GSO at the start of the script, but then the PSH fla=
g on
> +// the 5 initial server segments is not deterministic and hard to match.=
 Keep
> +// TSO on for the initial send (one super-skb, stable PSH) and disable i=
t only
> +// here, so software GSO splits the retransmit and each segment's urg_pt=
r is
> +// checked on the wire.
> +   +0 `ethtool -K tun0 tso off gso off gro off lro off 2>/dev/null`

nit: I suspect "ethtool -K tun0 tso off" is enough.

Reviewed-by: Eric Dumazet <edumazet@google.com>
