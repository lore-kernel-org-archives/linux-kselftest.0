Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772A42F7EFC
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044760; cv=pass; b=KCsGONOVdD1hEmf5/XvjaAIJwcuvnEWzq1ESMhJHUJePV1G3f5hFnpGMMhnqMVDRe1hQuiPNSjMcxjArpPhystWtKRIVgn91/hheP8r5jZx41B6pbZ2AEHkGtrApBT6CaNt4N7p2vYJGSzwXeI7yu4diuBOJPS7+aSNBf9A6CW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044760; c=relaxed/simple;
	bh=XbM5mvbWc9paH/BwOcf9yfdJsUhPviAwXolypUvmZFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPPUz3SLDsVqfknUVWosM7ySd3rHwCNxk48xkGBYtfnCKffoEnsRO4Ljp3oi80MG6HJCLicwGj4yIgOiMuIJcz9Z05MkOlkjQWrrU6cIBHabB4Fzp3+NOE7aXIsEcmEl1PrY+IXk+uVF6i/bWeGkt2cxWQNjKx8z0GJJcf1evQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tlXDfLE1; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tlXDfLE1"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1354403c610so4279237c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 12:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779044757; cv=none;
        d=google.com; s=arc-20240605;
        b=hza7Mtilu3aNUaK/HR2w1qrJvZvPYXpo+TGENPBn7JQt3oq78f19faOAMTsA/r/PQF
         7TKL1B7EXlYxB/g+RPfI8Rfv1wxB4ZUsCJqEGYtic1daT3P3NFgKsXvcrmrIVGZkzBKC
         e3HK0I7MxPIyOyo4Ma10Z5JfMpGFtSB0aqO5Gcb4w7UHOVwLBMjSJAyP30rEeEQ0mx96
         pXcP04bwzjjGC2B+9TK54snDOba2/kfCpKBA4cUzDo2L5yVe+1Csh5xHIrTPzR+dY/Kc
         AiE4mK7W6YNHcSMuH+nFNTbGOPhb9IFUu4VdPPmTSQ88Ztpy/Dt7QxHjEAXDOi/qvWjN
         zW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=abJhYwB8JC9dEFfSSuV5SaFRqRFuY1+kFO+c4Er1UNc=;
        fh=w72PZWTjgf/eBuFtorSvyhMk0ZFMJiuQea3ecyqWCkM=;
        b=D7N64w2KCaSm0F8zIXtjgZd4l+WezTXRec2yvNqXlMVV5BTHgbPC8MH6qTZpDWwP+V
         imawtgQoo6Kq8gDcwQMGZsKCJe42+D4cHo6HnYpoFvBd+23AXeAz4r2/rU0HqM0qH5Er
         m9EsI+yOwD6TOKEfS+XxZxIhMmgGhPUe4gZCOqAHIXiDx2OAyva2yRgccEFCRXFYJvVO
         uViLs4vG/BQmhDIUky6InBLSar1V28m4KIxKYO+/Th2DOIqyR+v5p78rG8FuLexO30/K
         fYbZWIURuTETyuRTTL/r3RRrCs04a6+zFnloEQ1TkauNQT8UJ5Z4fh3akKJgiMQJ7mR1
         u5EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779044757; x=1779649557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abJhYwB8JC9dEFfSSuV5SaFRqRFuY1+kFO+c4Er1UNc=;
        b=tlXDfLE1SZCLFTfwNeAtfwC9Ntmhlb9ABD/zyb03eqyw9ZADe/LUSzCvcs59diXCsI
         RwqjcB8wTHmJWfVN8r8vPqnUYBSn/KWf2iFbDToftSj7MLoTmpOo64sbpdNQNgiP98NZ
         9MmziKJT8qEdSrktT685M+ReSIae/0xGpJIUearzrau2h+xpfv5nPgjpNq4mBHqAAHxg
         Aw9/QZk+2LSI2ChoKpt7qfswPEehq5GLkTTmPUvm3eseCPOcSDNOWxLzFm9kgGc+R1Ax
         eBIudMpnnA+0hWjCjVbWakLV+MkYF2fczhfQvQvoBo2qhc9y5401KazLoeBmV22qbp8X
         If7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779044757; x=1779649557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=abJhYwB8JC9dEFfSSuV5SaFRqRFuY1+kFO+c4Er1UNc=;
        b=UYj8tCyfX3CDRnF7CtfR5gRSonjc9AXirjNrBvOSKhHby/QFYcYsKyLFOHzD7fDkDt
         AmoRcHEpFiMksVRvmx2JCSZrXVakg4QJl7IGAAiFtum+O0kZdLwCtFqjRiStHqLyX5ri
         qlqJSXyDAqZY4bHzQJW/j6VjhHMC88CkhOBVwwTMTZ5Dx38odwzLcKe/bVKLV5w/PPcA
         W7oSGiYgo0uBuxyBb8SH+dNIm3g5swtduWxEMNLodOpfGXnc6YNdMY281ZbclRP3COMX
         aqNauRmgfPTPV+7gWCPb8n5uYPOCtqKgoBnHENgwtQ9j9S/DegUT+567AcCsJ+JXUqNG
         a1Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+skBWHrs2fdv1q7Hz1ILWAEicBt2n4DS/swy+j27v98OoGvEQye2Lp6fm9v/kMboydQCmQrsYXGsYLcNlpvnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+ZuRTjOGggUF6Vf8JcNLb6u1DW1CMh7E54cLhh23vn+uh3Ff
	LCKMjOy29TbgmshQac8ThBUeAGTDaTiP9QKr1LfpgQfeCTtThNPNBMFh4NBIWd7ZLsQBjscsAuG
	R2Q5BBU4PkcE5mye7OG6+qGosr6lhYzBdchrFK/QddwlOVFLrZTZsW3wPLIU=
X-Gm-Gg: Acq92OF+vzLRDofX1TwyAIB6qYtMj1/g+nor4pMtc4DV74jzuRFiBPZ6tFw4jvgZoNx
	BOH+tyVIWGynb/5d7RdAA73sgjVcFr/jvASEByRnSnOAODdxpYY3AMK0ZMTrG6p75WkdZoh9b4u
	BahGX7/d39TJadysL7k9TULhrXXg4ELzL9gGE0MJFLZdweED2o4KeyvO1s6UlkZLe0MOXNVhBeO
	nmPtXpocx9qGqBaebndV7ZtCU6lgq1Zxayz504j0mTNQE3VRrDrkwD3Vyt71PzDAWm24qPltIXg
	D6LB+LHq+48PaGb0iHrTFEXpDOdJxVNI+EaVkTPJXN94aHrG1yFzsy8gfXvOCT3OVRgxkrUrEMZ
	H+mwBFqG+pur6azxMDeY+fHUR4fxYUL4=
X-Received: by 2002:a05:7022:6612:b0:12d:ce34:3f92 with SMTP id
 a92af1059eb24-1350552c4c6mr6095623c88.31.1779044756936; Sun, 17 May 2026
 12:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517184158.2757505-1-sbrivio@redhat.com> <20260517184158.2757505-2-sbrivio@redhat.com>
In-Reply-To: <20260517184158.2757505-2-sbrivio@redhat.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 17 May 2026 12:05:45 -0700
X-Gm-Features: AVHnY4J-uhOwPJ__pKbIwWCtDN2Q6UDjgz7zzoOQpMDDgmkelBaTcQCTUqVl71E
Message-ID: <CAAVpQUCiHA=z62udnWLVyv0LeGsAHr+A=_o-8fomHZfJZJO2aQ@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: Don't accept data when socket is in repair mode
To: Stefano Brivio <sbrivio@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pavel Emelyanov <xemul@scylladb.com>, Laurent Vivier <lvivier@redhat.com>, Jon Maloy <jmaloy@redhat.com>, 
	Dmitry Safonov <dima@arista.com>, Andrei Vagin <avagin@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neal Cardwell <ncardwell@google.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:41=E2=80=AFAM Stefano Brivio <sbrivio@redhat.com=
> wrote:
>
> Once a socket enters repair mode (TCP_REPAIR socket option with
> TCP_REPAIR_ON value), it's possible to dump the receive sequence
> number (TCP_QUEUE_SEQ) and the contents of the receive queue itself
> (using TCP_REPAIR_QUEUE to select it).
>
> If we receive data after the application fetched the sequence number
> or saved the contents of the queue, though, the application will now
> have outdated information, which defeats the whole functionality,
> because this leads to gaps in sequence and data once they're restored
> by the target instance of the application, resulting in a hanging or
> otherwise non-functional TCP connection.
>
> This type of race condition was discovered in the KubeVirt integration
> of passt(1), using a remote iperf3 client connected to an iperf3
> server running in the guest which is being migrated. The setup allows
> traffic to reach the origin node hosting the guest during the
> migration.
>
> If passt dumps sequence number and contents of the queue *before*
> further data is received and acknowledged to the peer by the kernel,
> once the TCP data connection is migrated to the target node, the
> remote client becomes unable to continue sending, because a portion
> of the data it sent *and received an acknowledgement for* is now lost.
>
> Schematically:
>
> 1. client --seq 1:100--> origin host --> passt --> guest --> server
>
> 2. client <--ACK: 100-- origin host
>
> 3. migration starts,

Here, a netfilter rule or bpf prog must be installed to
drop packets temporarily until migration completes.

We do not want unlikely tests in the fast path.

You can find a similar issue:
https://lore.kernel.org/netdev/20260130145122.368748-1-me@linux.beauty/

> passt enables repair mode, dumps the sequence
>    number (101) and sends it to the target node of the guest migration
>
> 4. client --seq 101:201--> origin host (passt not receiving anymore)
>
> 5. client <--ACK: 201-- origin host
>
> 6. migration completes, and passt restores sequence number 101 on the
>    migrated socket
>
> 7. client --seq 201:301--> target host (now seeing a sequence jump)
>
> 8. client <--ACK: 100-- target host
>
> ...and the connection can't recover anymore, because the client can't
> resend data that was already (erroneously) acknowledged. We need to
> avoid step 5. above.
>
> This would equally affect CRIU (the other known user of TCP_REPAIR),
> should data be received while the original container is frozen: the
> sequence dumped and the contents of the saved incoming queue would
> then depend on the timing.
>
> The race condition is also illustrated in the kselftests introduced
> by the next patch.
>
> To prevent this issue, discard data received for a socket in repair
> mode, with a new reason, SKB_DROP_REASON_SOCKET_REPAIR.
>
> Fixes: ee9952831cfd ("tcp: Initial repair mode")
> Tested-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
> ---
>  include/net/dropreason-core.h |  3 +++
>  net/ipv4/tcp_input.c          | 14 +++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.=
h
> index 2f312d1f67d6..19ab9e6ffc33 100644
> --- a/include/net/dropreason-core.h
> +++ b/include/net/dropreason-core.h
> @@ -9,6 +9,7 @@
>         FN(SOCKET_CLOSE)                \
>         FN(SOCKET_FILTER)               \
>         FN(SOCKET_RCVBUFF)              \
> +       FN(SOCKET_REPAIR)               \
>         FN(UNIX_DISCONNECT)             \
>         FN(UNIX_SKIP_OOB)               \
>         FN(PKT_TOO_SMALL)               \
> @@ -158,6 +159,8 @@ enum skb_drop_reason {
>         SKB_DROP_REASON_SOCKET_FILTER,
>         /** @SKB_DROP_REASON_SOCKET_RCVBUFF: socket receive buff is full =
*/
>         SKB_DROP_REASON_SOCKET_RCVBUFF,
> +       /** @SKB_DROP_REASON_SOCKET_REPAIR: socket is in repair mode */
> +       SKB_DROP_REASON_SOCKET_REPAIR,
>         /**
>          * @SKB_DROP_REASON_UNIX_DISCONNECT: recv queue is purged when SO=
CK_DGRAM
>          * or SOCK_SEQPACKET socket re-connect()s to another socket or no=
tices
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index d5c9e65d9760..6eca34274f97 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6457,6 +6457,7 @@ static bool tcp_validate_incoming(struct sock *sk, =
struct sk_buff *skb,
>   *       or pure receivers (this means either the sequence number or the=
 ack
>   *       value must stay constant)
>   *     - Unexpected TCP option.
> + *     - Socket is in repair mode.
>   *
>   *     When these conditions are not satisfied it drops into a standard
>   *     receive procedure patterned after RFC793 to handle all cases.
> @@ -6506,7 +6507,8 @@ void tcp_rcv_established(struct sock *sk, struct sk=
_buff *skb)
>
>         if ((tcp_flag_word(th) & TCP_HP_BITS) =3D=3D tp->pred_flags &&
>             TCP_SKB_CB(skb)->seq =3D=3D tp->rcv_nxt &&
> -           !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
> +           !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt) &&
> +           !tp->repair) {
>                 int tcp_header_len =3D tp->tcp_header_len;
>                 s32 delta =3D 0;
>                 int flag =3D 0;
> @@ -6632,6 +6634,11 @@ void tcp_rcv_established(struct sock *sk, struct s=
k_buff *skb)
>                 goto discard;
>         }
>
> +       if (tp->repair) {
> +               reason =3D SKB_DROP_REASON_SOCKET_REPAIR;
> +               goto discard;
> +       }
> +
>         /*
>          *      Standard slow path.
>          */
> @@ -7125,6 +7132,11 @@ tcp_rcv_state_process(struct sock *sk, struct sk_b=
uff *skb)
>         int queued =3D 0;
>         SKB_DR(reason);
>
> +       if (tp->repair) {
> +               SKB_DR_SET(reason, SOCKET_REPAIR);
> +               goto discard;
> +       }
> +
>         switch (sk->sk_state) {
>         case TCP_CLOSE:
>                 SKB_DR_SET(reason, TCP_CLOSE);
> --
> 2.43.0
>
