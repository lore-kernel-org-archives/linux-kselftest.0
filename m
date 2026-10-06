Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231BC3E51F9
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285838; cv=none; b=lDluHgOuWb4VEBkBnTBzJKHyjcBQGAJKPfyw0vZ8ML7coazP+RHCmfy2Dp5xQUtBu9Th3qH6702k7AAAzliB0pJSd5o5a1GQwHyhn0O8qql4M8Tyf7CZENlWadQad7512vnz7ny77T9GKPOZrUuPNUOB3MadSQZ6Ev3SW3pKr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285838; c=relaxed/simple;
	bh=XdpAnPmZPdfJMv5U124CuZ+lvv41BcjUyVPRFDrgfH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baQcxAIf7SEt3NHF8L0wW1SUACvT3YepNVkbIuLyy/ouks6Y9ByOXH9bGOwZT2o3D53dquvDF3deH4hSAVFFyd1C2A9otO46j4WuheNV+F4Z051QfvkIYB3KesZH4TJ/f8DpZXEk/aKrLbpDAaxiDuGIfZgTUd8TDTLgTJyzG7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hu+FLg7i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hu+FLg7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7F01F00893
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791285836;
	bh=IDroXHxguQo+CybQq2kk/ZUPA2VdUvycoL56+zfLxDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hu+FLg7i2t7X+Gvv7zjSwsfIK0ePD3+7gCZmtEmo/D2gCjTZ1nVbLJr+RURh0P4Q9
	 XSjezRUPz2y6rNF3NCMUxu+ixWUpbiyol7/+FkVo3qRCnJowH3xpMWr0QDB4qX3pkD
	 OH/pm2elW7e0bF8O9R24juwuCe14cV9ArYKXjl/OzTuEOEN2thlklbtRKoDelmOY9T
	 DoTLHtNMUvYsnIJpa07RBmf6xa//wmU7xZr7KiNNOcpvM51NQfS/mXMW+nJMXg9SHy
	 bxqUs1lhYiYOTcW95SWsDc3CttgFLuYsf19tiNquvH2NOgjd0Da3OG4Jzv4InskvEI
	 4gzHfV8tQM2EQ==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-82621039b6bso1394914a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 04:23:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLfHyvKZtAuBDUZ2BjC+6lIb6mTiXw36KQc+NeqGz18kasBVwu0FF4a2gY4UXk+0PFD6ozr1V1HUOYJR5pYj0=@vger.kernel.org
X-Gm-Message-State: AFuF++lRbH18008ludmrWvJH2gx/sVeEdCaphyCBjfEgJAZ0l3u9tZrP
	AV8bFU/0AUYuq8l0NtvIV8RETbB1TWdyTo7IO/ffVHd+5qko1rjWT8HzF2z+lTfGJWjIOfFoyKx
	YHEntHwWg1sNL+bopZP+EJBrkdHLL7r8=
X-Received: by 2002:a05:6808:bce:b0:4b9:e5fa:8905 with SMTP id
 5614622812f47-4fb40c95755mr1060603b6e.24.1791285836048; Tue, 06 Oct 2026
 04:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791248202.git.nramaswamy@openai.com> <f366f5325d7eb96f0edd999b4f984213743914b8.1791248202.git.nramaswamy@openai.com>
 <627cd81c-9824-4d1b-ae47-f7f929a96596@kernel.org>
In-Reply-To: <627cd81c-9824-4d1b-ae47-f7f929a96596@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 6 Oct 2026 13:23:44 +0200
X-Gmail-Original-Message-ID: <CAL4WiipKWgA-EcFWDQd3t7nBwU7AnkLvqs6j--he-dR-SAgqiw@mail.gmail.com>
X-Gm-Features: AclHuK9Cxm4n9Z6ci6iwtPBgh-TQXM8rupzVknHZfA_6PpM4enJvkSaRp7Cx2L0
Message-ID: <CAL4WiipKWgA-EcFWDQd3t7nBwU7AnkLvqs6j--he-dR-SAgqiw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: restore RACK list membership when undoing loss
To: nramaswamy@openai.com, netdev@vger.kernel.org
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Yuchung Cheng <ycheng@google.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 6 oct. 2026 =C3=A0 08:42, Eric Dumazet <edumazet@kernel.org> a =C3=
=A9crit :
>
>
>
> On 10/6/26 07:15, nramaswamy@openai.com wrote:
> > From: Neil Ramaswamy <nramaswamy@openai.com>
> >
> > Partial undo can clear the TCPCB_LOST flag on segments already removed
> > from RACK's list, which prevents subsequent RACK loss detection, leadin=
g
> > to segments only being retransmitted after the RTO. Restoring them to
> > the RACK list as part of partial undo makes sure we can properly
> > reconsider them for fast retransmission in the future.
> >
> > To do this, we first sort (by transmission time) the segments whose
> > TCPCB_LOST flag is being cleared and then linearly insert those back
> > into the RACK list, which is sorted by transmission time.
> >
> > My investigation started from seeing repeated TCP stalls in prod and th=
e
> > mitigation that seemed to prevent these stalls was limiting SO_SNDBUF t=
o
> > 96 KiB. It also seems like others have seen similar symptoms before [1]=
.
> >
> > [1]
> > https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gma=
il.com/
> >
> > Fixes: 043b87d7599e ("tcp: more efficient RACK loss detection")
> > Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
> > Assisted-by: LLM sparse
> > ---
> >   net/ipv4/tcp_input.c | 35 +++++++++++++++++++++++++++++++++++
> >   1 file changed, 35 insertions(+)
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 92bc60716f33..51f04c7474dc 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -69,6 +69,7 @@
> >   #include <linux/module.h>
> >   #include <linux/sysctl.h>
> >   #include <linux/kernel.h>
> > +#include <linux/list_sort.h>
> >   #include <linux/prefetch.h>
> >   #include <linux/bitops.h>
> >   #include <net/dst.h>
> > @@ -2840,16 +2841,50 @@ static void DBGUNDO(struct sock *sk, const char=
 *msg)
> >   #endif
> >   }
> >
> > +static int tcp_rack_skb_cmp(void *priv, const struct list_head *a,
> > +                         const struct list_head *b)
> > +{
> > +     const struct sk_buff *skb_a =3D list_entry(a, struct sk_buff,
> > +                                            tcp_tsorted_anchor);
> > +     const struct sk_buff *skb_b =3D list_entry(b, struct sk_buff,
> > +                                            tcp_tsorted_anchor);
> > +
> > +     return tcp_skb_sent_after(tcp_skb_timestamp_us(skb_a),
> > +                               tcp_skb_timestamp_us(skb_b),
> > +                               TCP_SKB_CB(skb_a)->end_seq,
> > +                               TCP_SKB_CB(skb_b)->end_seq);
>
> Patch LGTM, but perhaps we could avoid the two div_u64() calls here.
>
>
>         return tcp_skb_sent_after(skb_a->skb_mstamp_ns,
>                                   skb_b->skb_mstamp_ns,
>                                   TCP_SKB_CB(skb_a)->end_seq,
>                                   TCP_SKB_CB(skb_b)->end_seq);
>
>
>
> > +}
> > +
> >   static void tcp_undo_cwnd_reduction(struct sock *sk, bool unmark_loss=
)
> >   {
> >       struct tcp_sock *tp =3D tcp_sk(sk);
> >
> >       if (unmark_loss) {
> > +             LIST_HEAD(restored);
> >               struct sk_buff *skb;
> >
> >               skb_rbtree_walk(skb, &sk->tcp_rtx_queue) {
> > +                     if (TCP_SKB_CB(skb)->sacked & TCPCB_LOST)
> > +                             list_move_tail(&skb->tcp_tsorted_anchor,
> > +                                            &restored);
> >                       TCP_SKB_CB(skb)->sacked &=3D ~TCPCB_LOST;
> >               }
> > +             if (!list_empty(&restored)) {
> > +                     struct list_head *pos =3D &tp->tsorted_sent_queue=
;
> > +
> > +                     /* Ensure lost skbs are added in transmission ord=
er */
> > +                     list_sort(NULL, &restored, tcp_rack_skb_cmp);

Second thoughts (sorry I am currently attending LPC in Prague, little
time this week for reviews)

pw-bot: cr

I am quite concerned about calling list_sort() inside
tcp_undo_cwnd_reduction().

In high-BDP environments (like 100G/200G/400G fabrics), a flow can easily
have thousands of packets in flight. If a loss burst affects, say, 4000
skbs:

1. list_sort() will perform ~45,000 comparisons.
2. With indirect function calls (retpoline cost) and cache misses across
   1MB+ of sk_buff structures, this can freeze the CPU in SoftIRQ under
   the socket lock for multiple milliseconds..

We could avoid list_sort() completely by maintaining a second list,
e.g. tp->tsorted_lost_queue.

Consider the following:

1. When RACK detects loss in tcp_rack_detect_loss(), instead of calling
   list_del_init(&skb->tcp_tsorted_anchor), move the skb to the lost
   queue:

--- a/net/ipv4/tcp_recovery.c
+++ b/net/ipv4/tcp_recovery.c
@@ -101,7 +101,7 @@ static void tcp_rack_detect_loss(struct sock *sk,
u32 *reo_timeout)
  remaining =3D tcp_rack_skb_timeout(tp, skb, reo_wnd);
  if (remaining <=3D 0) {
  tcp_mark_skb_lost(sk, skb);
- list_del_init(&skb->tcp_tsorted_anchor);
+ list_move_tail(&skb->tcp_tsorted_anchor, &tp->tsorted_lost_queue);
  } else {

   Because RACK scans tsorted_sent_queue from oldest to newest, packets
   appended to tsorted_lost_queue are already guaranteed to be in strictly
   increasing departure timestamp order.

2. When a packet is retransmitted, tcp_update_skb_after_send() already
   calls:

   list_move_tail(&skb->tcp_tsorted_anchor, &tp->tsorted_sent_queue);

   So retransmitted packets automatically leave tsorted_lost_queue and
   re-enter the tail of tsorted_sent_queue in O(1).

3. When a partial undo occurs in tcp_undo_cwnd_reduction(), any
   un-retransmitted packets remaining in tsorted_lost_queue are already
   in sorted order.

   Since these lost packets were originally sent prior to any subsequent
   transmissions in tsorted_sent_queue, restoring them can often be done
   with an O(1) list splice at the head:

   if (unmark_loss && !list_empty(&tp->tsorted_lost_queue))
           list_splice_init(&tp->tsorted_lost_queue, &tp->tsorted_sent_queu=
e);

> > +                     while (!list_empty(&restored)) {
> > +                             struct list_head *entry =3D restored.next=
;
> > +
> > +                             while (pos->next !=3D &tp->tsorted_sent_q=
ueue &&
> > +                                    !tcp_rack_skb_cmp(NULL, pos->next,
> > +                                              entry))
> > +                                     pos =3D pos->next;
> > +                             list_move(entry, pos);
> > +                             pos =3D entry;
> > +                     }
> > +             }
> >               tp->lost_out =3D 0;
> >               tcp_clear_all_retrans_hints(tp);
> >       }
>
