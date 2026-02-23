Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835F634D3BD
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771835812; cv=pass; b=Lk8E8KbZ9OLWALWQDDLJ3MgZUyPd5KdbXQ9mdrpOubHvkvGX0Tjw3YO/i/TcddI92+tvW42FVx8RODJbTdJ+SVcJW/fi1hKFw9BmLITZsIr/LBa0iDJFhYnpi/Hu0Oyk2Mijcq8jKPmYiKQQkV0pP/V2KLuM/UuV04CVlt1UIPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771835812; c=relaxed/simple;
	bh=hrmgggKQvVe10yK6nfrEeI2XixGYRKAk61xhi7TNXM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcZGJ4h0Rtcs0+c4JLB/Q/+1QPq8jl1JsHRrDbQc3ulsH7FCssntCMoiNisx3xstSqXiKy2CUjvAsxtxxf+IfSmA0x9nxSQxq98lzDYSxDk4/xMYutyn1iDvinuM0veMEkQURNKuiPefZ1MulQr90JUszRq0zNbXFbDhC7blfuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bUWw064S; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bUWw064S"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5069b3e0c66so66769771cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 00:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771835809; cv=none;
        d=google.com; s=arc-20240605;
        b=NEDFZUt7L1Z/JbdCCJhOintxUwce9p3ncmr2xVIgyggEvL9yWeuOf/ff0poy2zqQqq
         s0gLq9MZOYTEgcp4SkZTtybLBXFDViyHzQhhQ+5tuTmT7e6QmPNggbod0aolbxfzwrhz
         1lOUHpDZVkkksSGB+btQOHv85oTrOureojCFZZ5vCwUk2KMGoT4SOW7e3Ffg8/av0e82
         LlQSgFlP+0tab0DGATRfoOL37G5dT41L2nmLYX3VishCSS4OrJHFh67utJtiqvICNB5b
         9GhuRj8zc4c3JqbChVAoyIlm0lAAACa/RI8GH/lP4ouRvpPRxSqraHazN5o4uWEqQ6/v
         masA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vbp+UDntQVNzIlEDtZVze6X5jmwY5uUsgN9+rGm4rXU=;
        fh=arRwFX7X/WeLWdPQ17cPJ2toAB0kucn2W6lzzCHCuaA=;
        b=H5kxDL4265oLAmTPiAw61LR/sLJsPsqbFJSSSDOddGji7jdz3S3g5DKFVk7Z3KSMna
         aAkupkQPQ2gwoHF/cRuMeoicXzxduTzFgeBeUjFdHiaSkjIKRH6sGWVLqUMkFqlFO9TZ
         6VZ2TaSQ4Hosm7pW681elg/hNkla32hp76jITQKnECpTTTxRVac+w3Tx3ZY752z4Q2j6
         PYU0TB6NoceU9MDld2i+A7a4EB03xSR5p14irLd2BovRuqYBHZS9IXvrm4gxxUFOvIfP
         dyJMGC/Ntt/mf1j3VWjgs/+LyFecfWVxKeaIZjpIUioh6453o2Heb/qpFetPujGPOy9w
         +Ryg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771835809; x=1772440609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vbp+UDntQVNzIlEDtZVze6X5jmwY5uUsgN9+rGm4rXU=;
        b=bUWw064SHrG7nbChQShN+R6EomHLPmZyF3tQ+fV/EC1Tqs90cwoPCI5ZNSKL76mPz6
         qndetkho5GQCm0poMmXTHIvjyTjpm6Af7cysbqbcxDOOARdnwapEMP5ywrZh9BKLNuWc
         KZraTRVZ07JvyEMkLHm/pVFEwRqiRpcXkYwToZWIUN67bRuwLFo+OxYplVV6H1hYnH+k
         iHdAxm9Jp5j0GrKXVqXzkzQHLLJAo3vC9Nlq7xMGUwsvCwT+oxqBi+mzmL6TXLa4o3/g
         zbgkyeA1vhAjCtiWYrcg1pnVjOHOyTQWQFUtTKGrysdWD6M/K5SMK/YPHGUtAX+gwdeL
         55Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771835809; x=1772440609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vbp+UDntQVNzIlEDtZVze6X5jmwY5uUsgN9+rGm4rXU=;
        b=talnoQfU1gGJo0nq8fti0mQG/DmgjFyyKqUBSoCirobBcEud5fZ2PCcIcamidwCeUR
         vilLwESH1ceqPdrIFD/K4WwnSBiBOw4fsG6eEWB8145s8/HF3+hWwS+Y3511b1yNO/5x
         9fwaGo1NP0WUTbNf6RSUyRKecZ4xtP6RALfXND24Bfj6kf9w/xFNi7zAsP9Cb6RHBKeb
         5Nst+C5phju+5bvGeDG7eSkSR3kjfgQThcGu73Y16K57+jHPRurgvDbxJnUwGiOxCqC/
         Dty2E8ejJh44iFuFUf5+nG4ajePLSqXDjELauDlxJzYshWIzgigYsRwfh1jwDbOypaKt
         1lFg==
X-Forwarded-Encrypted: i=1; AJvYcCVxOnVtmt0mO8jR3yxjsoj9cNBJ6vvsVQcpot0pm4LFHruQl1ld8c6L4Xb0QjzrWLtEK3spnLo445nTH16AX54=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+hwhtuQVONDvYI2NNOg2vSLJyfFTjeyDnGvbAuVUfwoFYJ5v
	Y9QpAjycEc0fh4r0uBYSgaanUQA61wDpux0mxr76bb8BY2VMiZXIxN6Cx1XhFFnaUR5gI65s1sJ
	4jRc9iQP3b/uakByq5MDcWYdnqv6CGnmZBLwYcXPz
X-Gm-Gg: AZuq6aLWYF1DOyN7sxD8I4iqdRWQrjEd4u3WJu2VoDmXaKs6GOMmWuyKhsgAPLPVNy9
	yJvOxO35rcYJtBznCzZM19teW1Rpe9BihkKdUuQN/+FtSfsFQlQQIuR7cfYHbtAz5aIboazY2kM
	GU0Id71qeL7CV/39i838YpxpWQbbDbT2RCwtUYix6d54tdE+Ccknso5r9xpiQKF2r2k60tN4ain
	VObdbDRrFv9yEF8haI/21wrY9xBIDY89t41qXsJu/LjXBbH13BsC5y4Iq1rmzWWUSK5FWBrkA3w
	fjhkmJY=
X-Received: by 2002:ac8:7dd0:0:b0:4ee:13dc:1040 with SMTP id
 d75a77b69052e-5070bf3b959mr102637101cf.3.1771835809065; Mon, 23 Feb 2026
 00:36:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222-fix_zero_wnd_fin-v1-0-5f4034952f3c@gmail.com>
 <20260222-fix_zero_wnd_fin-v1-1-5f4034952f3c@gmail.com> <CANn89iK5Kk2D-zMiw_2syb9OdmkKdgAA7aGfi8QNZ9XR4=CfvA@mail.gmail.com>
In-Reply-To: <CANn89iK5Kk2D-zMiw_2syb9OdmkKdgAA7aGfi8QNZ9XR4=CfvA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 23 Feb 2026 09:36:38 +0100
X-Gm-Features: AaiRm52Hy4mj7KY80-wpFNvA2-ANxwYSkjGXPviKg5SUI27iW8AraDDM3-yinIY
Message-ID: <CANn89iKBjfaoWaUh6Ar2Lj-MJODywLpHzbQif=aa8q387qutZA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: re-enable acceptance of FIN packets when
 RWIN is 0
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 9:01=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Sun, Feb 22, 2026 at 1:35=E2=80=AFPM Simon Baatz via B4 Relay
> <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> >
> > From: Simon Baatz <gmbnomis@gmail.com>
> >
> > Commit 2bd99aef1b19 ("tcp: accept bare FIN packets under memory
> > pressure") allowed accepting FIN packets in tcp_data_queue() even when
> > the receive window was closed, to prevent ACK/FIN loops with broken
> > clients.
> >
> > Such a FIN packet is in sequence, but because the FIN consumes a
> > sequence number, it extends beyond the window. Before commit
> > 9ca48d616ed7 ("tcp: do not accept packets beyond window"),
> > tcp_sequence() only required the seq to be within the window. After
> > that change, the entire packet (including the FIN) must fit within the
> > window. As a result, such FIN packets are now dropped and the handling
> > path is no longer reached.
> >
> > Be more lenient by not counting the sequence number consumed by the
> > FIN when calling tcp_sequence(), restoring the previous behavior for
> > cases where only the FIN extends beyond the window.
> >
> > Fixes: 9ca48d616ed7 ("tcp: do not accept packets beyond window")
>
> OK, but this commit is fine ? It seems the issue is coming from buggy pee=
rs ?
>
> Eventually the receive queue would be drained by the application, the
> peer would retransmit
> this FIN, and it would be accepted.
>
> > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> > ---
> >  net/ipv4/tcp_input.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index e7b41abb82aad33d8cab4fcfa989cc4771149b41..fde612f12d3625000081958=
d13cec8779684a642 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -6379,7 +6379,12 @@ static bool tcp_validate_incoming(struct sock *s=
k, struct sk_buff *skb,
> >
> >  step1:
> >         /* Step 1: check sequence number */
> > -       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq, TCP_SKB_CB(sk=
b)->end_seq);
> > +
> > +       /* Some stacks are known to handle FIN incorrectly; allow the F=
IN
> > +        * to extend beyond the window and check it in detail later.
> > +        */
> > +       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq,
> > +                             TCP_SKB_CB(skb)->end_seq - th->fin);
>
> I don't think this is the right fix. Basically it says that FIN do not
> count, but TCP RFC says otherwise.
>
> It also adds code in TCP fast path.

We can keep fast path unchanged with this variant.

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index e7b41abb82aad33d8cab4fcfa989cc4771149b41..156c92450f3ed00357aff2ef3e5=
86b83f3cecb5e
100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -4858,15 +4858,24 @@ static enum skb_drop_reason
tcp_disordered_ack_check(const struct sock *sk,
  */

 static enum skb_drop_reason tcp_sequence(const struct sock *sk,
-                                        u32 seq, u32 end_seq)
+                                        u32 seq, u32 end_seq,
+                                        const struct tcphdr *th)
 {
        const struct tcp_sock *tp =3D tcp_sk(sk);
+       u32 seq_limit;

        if (before(end_seq, tp->rcv_wup))
                return SKB_DROP_REASON_TCP_OLD_SEQUENCE;

-       if (after(end_seq, tp->rcv_nxt + tcp_receive_window(tp))) {
-               if (after(seq, tp->rcv_nxt + tcp_receive_window(tp)))
+       seq_limit =3D tp->rcv_nxt + tcp_receive_window(tp);
+       if (unlikely(after(end_seq, seq_limit))) {
+               /* Some stacks are known to handle FIN incorrectly;
allow the FIN
+                * to extend beyond the window and check it in detail later=
.
+                */
+               if (!after(end_seq - th->fin, seq_limit))
+                       return SKB_NOT_DROPPED_YET;
+
+               if (after(seq, seq_limit))
                        return SKB_DROP_REASON_TCP_INVALID_SEQUENCE;

                /* Only accept this packet if receive queue is empty. */
@@ -6379,7 +6388,8 @@ static bool tcp_validate_incoming(struct sock
*sk, struct sk_buff *skb,

 step1:
        /* Step 1: check sequence number */
-       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq,
TCP_SKB_CB(skb)->end_seq);
+       reason =3D tcp_sequence(sk, TCP_SKB_CB(skb)->seq,
+                             TCP_SKB_CB(skb)->end_seq, th);
        if (reason) {
                /* RFC793, page 37: "In all states except SYN-SENT, all res=
et
                 * (RST) segments are validated by checking their SEQ-field=
s."
