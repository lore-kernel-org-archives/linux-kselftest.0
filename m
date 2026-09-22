Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B4DF59
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 00:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035742; cv=pass; b=iSK5bLfLbbcww7wbIPseoInLne3LhAatipXTklMzk5Cy+blhhMzXM7vHy5SMSoZgSFKn878fCe7cQpxHE+u1qsUio9lzH92VxdzBNTdAIDZnGQalWYdXmMeZTI50wJHMaiCG8IaPM0A4FBhzk9Ly6n7DZP8vjj0gqz+mjj1/vCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035742; c=relaxed/simple;
	bh=wF3vujnRO1n69hpZtPqhXKokXwTBo6VHQ5JFTi+xvIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQ2/OQDl2GZuNDUau68utQFPopJiJHKq+7FtHnV92YkdOVradnII0sEFQuQtUYIRoeqWk91tfxnoD/oZ58L2hXbZ0OQVNXlLYNZ+GYYu23l8PS2ieCK2oq1OE8SGbmHn98UODj6TT59hYJf1ra87M7J1MTpeh2q7jnGFSWa1qmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=chpa6wZv; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="chpa6wZv"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76c9deeso42567881cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 17:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790035740; cv=none;
        d=google.com; s=arc-20260327;
        b=NHuGsjHnj1W6s4+LUGP9Fn/3YJM5cmBgHdOB+uHHqDF3gzI0ikstNOQl9rfg4C/l3+
         BaPrDyTQSAiROXUj7yhbClVZFfaKn1brBGDThL/1DuKTkCHu12nz5pVkItWPUd2J/GBl
         mVj0PjwJ0VrjTuOwybe+2kY+GpRMdHuIFZuM1shTjWJjJx6CwiE5PKVp+AyoTaYbgqdi
         QvgApdJicjihv5r3N6CBqAIZ7uxvb8q67MfRpSx5L6R0dnD46MBcWp+u01qVS1YElWku
         pCMMeOjp9rtKqj6BYhAwKp1zwsOttuOny+cQ/U18mCAtPHTpv3oYfYKcf9qRfnSnuqH/
         lVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zkltWghb5cMkgMfvZ7QUnNR/9sY6aTvlx7R/Zv+9e4A=;
        fh=iWlsKCnVdgywLLmmGAK+ErOTC0PRhFDzaOmGxlKngHQ=;
        b=DUexzuvNVghPtgJ23NvNXCDt8fM89v35FtPcxLYaeom5wToS9Su2iAnXJFcNALa+vn
         aKbLkOl8iXf3JxGYcDIO3WvYYnDx8hSYtlm9emm8CLOrdQozH5IyZ2lwURG+4B6gyWGM
         U1/g5S+JLNDQIYYuRpVgR0V29bJ2UiYDyQFxLVNHSMQZqpWXJMxdG6yBU/sLyfEOelTX
         EfCD6gnr63wlZAEJX3Z+4j8131PGrYWZby/p1OjeHtzB62oFSMRuwjKMtrnK0NrPAypV
         pY9wJIW6ssWjifJ7Y/yzT+zq6GIt7Q3Qn+x85cazqY/mhc2EjeZRtOgmCgCyFYPdxazb
         jWtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790035740; x=1790640540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zkltWghb5cMkgMfvZ7QUnNR/9sY6aTvlx7R/Zv+9e4A=;
        b=chpa6wZvzAvQKXhvxtY85V/DVP77j6wuiYDpOFew2WQuoQGObt4jqYI9ToWTxfpFZx
         bx/TOSvPuZhJNoo3wXUDh1J9Lv/bcYvr9Rz7LIvgPFGSfFpt3MC2Ka1DjfYs3NJxpNPV
         8r5c6naJgaiRf522hLJPYpNgAikYCxheYENbkAc/yQOetPih4T3DXHuOfKJe+ir5lzs4
         1MwVw1HG3S+LeyT/NQTujhNjrgKeCGEbG2jLQfrkDj6EUUWLe0NOAsmOWXOiYqf1DY32
         PFTTTQu08JQg8qopDb+AwxSUtVORt3mQ9uwMjo5u2C/9DuF2/IYReOVvDii3FyhEuLdm
         4ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035740; x=1790640540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkltWghb5cMkgMfvZ7QUnNR/9sY6aTvlx7R/Zv+9e4A=;
        b=An6UtcLOdbNfbDV2YL0LQr0DBafxIwIWFHC6iFLCcEQxkMaSw++f87PpuH4noyTmGO
         IhfAVcNd8Q0/HbgXKZmEbtyfH2+6Uu3ShiFJdGykmmMi+IP881vU4w0VQVmh/psvtZO5
         Nia1zPjmt5rpS2SM88YK3cug3atD+E10A7GHb66nXmxkOLGwQGd51ZCa+5A8IlmzHfag
         2g3L7eGInc0PX2ZheNjnbTFim16Lffr6zjcVFyYQs20zTq+MDzIbLF0OmtYOXDjSBKt4
         DM90PBfdD3WsIJB6yuGalQatmEFigbAklvuJkq9dOadyJ8t5zYPQ4B/4kw3vz2HleUlW
         0VFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFeCmsaUP6RhAHgdlhmT+zerzXvGnZ6hKOolr2l9Dax4TFdeEerUoQgkapz4VR7cmxfgrqzabxM7cPzn6T10M=@vger.kernel.org
X-Gm-Message-State: AFuF++kMnuMqtmIDoDtdekpcFBDJLkHAe9x0e06IjvtBoevs8CKRc+7o
	NmeZs5xoJ0cG9rsWtRpjh7FVNP6LaXsbO37t4FEVg3Nd2OiUWul+aQgTU/iwavrIafErZTcglXA
	E5545Ac3sZ1w8k9KXCxOym/oG8hjNS999dGZzwnci
X-Gm-Gg: AYBFou2EWLqOwlogO9BC91FmZXjhgpniNXGAKlBRqk4+bZVwZFbiK11gITj2bhe8eB4
	oT0s4lg0NDIghFt5h+7vQGzLQwYDdF/ZENvD22Anwof50iS03/KKtJ0f93t4+p7Ccy7oGntElQ9
	BIX6aE9WKR7e8snt+/XM7iMAz0oFs4Kl9bX1TGPZykVaiWOuSAlDPnV8JF3+5Opz71oUNSZIKGP
	qO2fatw3bHsVD2CvgvvYjKJu5y/mUaF1C9KiFziT2NqKPWPR+NbNSE9pxrEOMPVA9BNVGgs+1bb
	5OGNhxZC+fK+3Ema1YPYb++8RNcenpJfZCw0bZ/3aEP5l982A4mmiuvTLLXrU8ua3f4+OF3eTYQ
	upWUhf9Hsm85B0oaDsVXBH/b6GHArL2d87fkNYsSvkKeWjBhZp8LA6BExrZsSDv3kDSMg9CZuTw
	eikxmp
X-Received: by 2002:a05:622a:1f8e:b0:530:dc5e:27c2 with SMTP id
 d75a77b69052e-532d8d5e8acmr32325951cf.27.1790035738992; Mon, 21 Sep 2026
 17:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921222609.50824-4-jeffjo@openai.com> <20260921222609.50824-6-jeffjo@openai.com>
In-Reply-To: <20260921222609.50824-6-jeffjo@openai.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 02:08:47 +0200
X-Gm-Features: AcwNN1U-1SKZ5f3WClJb_Otr_H5noTqM0KEs9GkLlh_XKBzCb9vk9EeI4Fd9YSY
Message-ID: <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an old ACK
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:26=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> Add a regression test for a gap-filling packet whose acknowledgment has
> become old. Linux first sends data to the peer. Deliver two peer data
> packets out of order: the later packet acknowledges Linux's data, while
> the delayed packet still carries the earlier acknowledgment. Require
> the final reply to echo the delayed packet's timestamp.
>
> Use a large jump in peer timestamps to represent the idle interval.
> The test checks the echo directly, without waiting for that interval
> and without packet loss or retransmission.
>
> Packetdrill does not currently compare the timestamp-echo field (TSecr),
> so the packet script alone can pass on a broken kernel. Add a shell
> wrapper to check all four outgoing timestamp echoes in packetdrill's
> output. Register the wrapper as the runnable test and keep the packet
> script as a supporting file.
>
> Run the test in a separate network namespace for each of IPv4, IPv6
> and IPv4-mapped IPv6.
>
> Assisted-by: LLM
> Signed-off-by: Jeff Jo <jeffjo@openai.com>

Thanks for your patches. But really we must not work around
packetdrill bugs like this.

pw-bot:cr

In the original 2013 packetdrill (commit 77954df72a78),
verify_outbound_live_tcp_options()
checked TS val against tolerance_usecs, then temporarily overwrote
actual_packet's TS val
with script_ts_val and called same_tcp_options(actual_packet,
script_packet) (memcmp),
which did verify TS ecr.

When commit 9a0ade62b7c8 ("net-test: packetdrill: merge Google
packetdrill changes
through April 2018") refactored option verification into a per-option
switch (actual_option->kind),
case TCPOPT_TIMESTAMP: checked actual_ts_val vs script_ts_val and
ended with break;
instead of checking actual_option->data.time_stamp.ecr (or rewriting
actual_ts_val to script_ts_val
and falling through to default:).

Fixing packetdrill in run_packet.c is just:

diff --git a/gtests/net/packetdrill/run_packet.c
b/gtests/net/packetdrill/run_packet.c
index 4aa235d35585..f5fdc8699970 100644
--- a/gtests/net/packetdrill/run_packet.c
+++ b/gtests/net/packetdrill/run_packet.c
@@ -1483,6 +1483,10 @@ static int verify_outbound_tcp_option(
                        asprintf(error, "bad outbound TCP timestamp
value, tolerance %ld", tolerance_usecs);
                        return STATUS_ERR;
                }
+               if (check_field("tcp_ts_ecr",
+                               packet_tcp_ts_ecr(script_packet),
+                               packet_tcp_ts_ecr(actual_packet), error))
+                       return STATUS_ERR;
                break;

        default:

Please work with Neal Cardwell to get packetdrill fixed, then ask
netdev maintainers to
upgrade packetdrill on their test servers.



Note: Even with existing packetdrill binaries in the wild that don't
check TS ecr,
tp->rx_opt.ts_recent is still directly testable in pure .pkt via PAWS
(tcp_paws_discard()),
the same way tcp_ts_recent_invalid_ack.pkt works:


// SPDX-License-Identifier: GPL-2.0
// An out-of-order segment advances SND.UNA. The gap filler still carries
// its original, older ACK; accepting its data must refresh TS.Recent.
--tcp_ts_tick_usecs=3D1000
`./defaults.sh`
0.000 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
+0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
+0 bind(3, ..., ...) =3D 0
+0 listen(3, 1) =3D 0
0.100 < S 0:0(0) win 20000 <mss 1000,sackOK,TS val 900 ecr 0>
+0 > S. 0:0(0) ack 1 <mss 1460,sackOK,TS val 100 ecr 900>
0.200 < . 1:1(0) ack 1 win 20000 <nop,nop,TS val 1000 ecr 100>
+0 accept(3, ..., ...) =3D 4
0.300 write(4, ..., 17) =3D 17
+0 > P. 1:18(17) ack 1 <nop,nop,TS val 300 ecr 1000>
0.310 < P. 18:35(17) ack 18 win 20000 <nop,nop,TS val 301001 ecr 300>
+0 > . 18:18(0) ack 1 <nop,nop,TS val 310 ecr 1000,nop,nop,sack 18:35>
0.320 < P. 1:18(17) ack 1 win 20000 <nop,nop,TS val 301000 ecr 100>
+0 > . 18:18(0) ack 35 <nop,nop,TS val 320 ecr 301000>
// Verify TS.Recent was updated to 301000: a segment with TSval < 301000
// (but > old TS.Recent 1000) must be rejected by PAWS and trigger dupack 3=
5.
0.330 < P. 35:52(17) ack 18 win 20000 <nop,nop,TS val 300999 ecr 320>
+0 > . 18:18(0) ack 35 <nop,nop,TS val 330 ecr 301000>
+0 read(4, ..., 34) =3D 34
