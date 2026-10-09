Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925793B47CA;
	Fri,  9 Oct 2026 05:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522459; cv=none; b=GyGEX28VJEGiPZ53Tw6xSG/RJShBK0CvBcBSCnuDFoo1NZ7ey7PBg09zz3QXfumbUERiRBvvaMRw21U5JLJwMy9F34R1w8mpRwmVLxvWpI5sjQRwIbB2Jn54m53Iiy7mT2tebgIPIV8ijUG1Q86EJ1I78rogWO7wUxljbcIF9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522459; c=relaxed/simple;
	bh=6KSIPxR2oucmmJS9Oc+TeazMmIG7GfdSnW/Z8ZDhIgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOuZy0Tv8y0fVKH/8LVYevQQPLvIltkELCLF9zI6qRwpVllUnan8+5pLZ+RPRqtyzed0quwqYDQWRtNUC1dcXb3x0c1RrXYK1gvOTLt+A6QTqk/F3H2KfMkFNOJTC2IfSDkFmgMddZrknjuikzuHZqp17tDDp08DTFLEmsGjHfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoLBTEvI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoLBTEvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBFA1F000FF;
	Fri,  9 Oct 2026 05:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791522458;
	bh=i1wOJI3wyJsO2kBd827bI+LJjLPKu5Uyac3mLjr4Ws0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WoLBTEvI1uv1S9IlPYARxriQmztr7bM79FHUKi9QHAADe3UXfwTjQaPYQaowv275o
	 IPVKgsjCXNoiKkSpJjmkh0MK0U6SH/gYGDmNMo7zOfrmEFVzs3n+qDPMXjfnFTsifQ
	 Sg3EITEgzt79bMM/0aO7S4TFmN5/cy3t5Wv7bxMA5j9Y20Pyk71YQ6t+KKmqkoMoFT
	 sbYo34QEspaUhzX//xQxerdKoRDhjLES/Kk++NpWk2tuIIz504+Bnhzg3cGEVGbd7Z
	 OO8pWOChB2+aKpDsWKuBYWteCbWztg/EQ9n8L3ViojyQo0MsZ+sXxKjmKIGvTpAGVT
	 jyG/eIkU8XoeQ==
Message-ID: <aceb97a1-2493-437e-926d-ba8fe68bbf48@kernel.org>
Date: Fri, 9 Oct 2026 07:07:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/3] tcp: restore RACK list membership when undoing
 loss
To: nramaswamy@openai.com, netdev@vger.kernel.org
Cc: Neal Cardwell <ncardwell@google.com>,
 Neal Cardwell <ncardwell.sw@gmail.com>, Kuniyuki Iwashima
 <kuniyu@google.com>, Yuchung Cheng <ycheng@google.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1791506907.git.nramaswamy@openai.com>
 <e11ac4c9231e2ff7b288a10b48baa5378f2e6cc1.1791506907.git.nramaswamy@openai.com>
Content-Language: en-US
From: Eric Dumazet <edumazet@kernel.org>
In-Reply-To: <e11ac4c9231e2ff7b288a10b48baa5378f2e6cc1.1791506907.git.nramaswamy@openai.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/26 07:00, nramaswamy@openai.com wrote:
> From: Neil Ramaswamy <nramaswamy@openai.com>
> 
> Partial undo can clear the TCPCB_LOST flag on segments already removed
> from RACK's list, which prevents subsequent RACK loss detection, leading
> to segments only being retransmitted after the RTO.
> 
> This patch uses the implementation provided by Neal Cardwell to linearly
> insert lost segments that have not been retransmitted back into the RACK
> list. The core observation is that segments that are lost but not ever
> retransmitted are already sorted by their transmission timestamp, which
> allows us to insert them into RACK's list linearly, without needing to
> pre-sort them.
> 
> Segments with TCPCB_EVER_RETRANS are left for RTO recovery. Their
> transmission order can differ from their sequence order, so reinserting
> them would require addiitonal work (e.g. sorting) before reinsertion into
> the RACK list. We assume that this case is rare, and allow those segments
> to be transmitted by the RTO.
> 
> My investigation started from seeing repeated TCP stalls in prod and the
> mitigation that seemed to prevent these stalls was limiting SO_SNDBUF to
> 96 KiB. It also seems like others have seen similar symptoms before [1].
> 
> [1]
> https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gmail.com/
> 
> Fixes: 043b87d7599e ("tcp: more efficient RACK loss detection")
> Suggested-by: Neal Cardwell <ncardwell@google.com>
> Suggested-by: Yuchung Cheng <ycheng@google.com>
> Link: https://lore.kernel.org/netdev/20261006141300.1722466-1-ncardwell.sw@gmail.com/
> Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
> Assisted-by: LLM sparse
> ---
>   net/ipv4/tcp_input.c | 50 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 92bc60716f33..d0a1e8899c4b 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -2840,15 +2840,63 @@ static void DBGUNDO(struct sock *sk, const char *msg)
>   #endif
>   }
>   
> +/* Is skb @a after skb @b in tp->tsorted_sent_queue (send) order? */
> +static bool tcp_tsorted_after(const struct list_head *a,
> +			      const struct list_head *b)
> +{
> +	const struct sk_buff *skb_a = list_entry(a, struct sk_buff,
> +						 tcp_tsorted_anchor);
> +	const struct sk_buff *skb_b = list_entry(b, struct sk_buff,
> +						 tcp_tsorted_anchor);
> +
> +	return tcp_skb_sent_after(tcp_skb_timestamp_us(skb_a),
> +				  tcp_skb_timestamp_us(skb_b),
> +				  TCP_SKB_CB(skb_a)->end_seq,
> +				  TCP_SKB_CB(skb_b)->end_seq);

pw-bot: cr

You ignored my initial feedback.

https://lore.kernel.org/netdev/627cd81c-9824-4d1b-ae47-f7f929a96596@kernel.org/

Thanks.

> +}
> +
> +/* Link skb back into tp->tsorted_sent_queue in send order, at or after
> + * pos, and advance pos to it. Leave skb alone if it was sent before
> + * pos. During undo, all relink calls together traverse the RACK list
> + * at most once, as pos only moves forward.
> + */
> +static void tcp_tsorted_relink_skb(struct tcp_sock *tp, struct sk_buff *skb,
> +				   struct list_head **pos_ptr)
> +{
> +	struct list_head *head = &tp->tsorted_sent_queue;
> +	struct list_head *node = &skb->tcp_tsorted_anchor;
> +	struct list_head *pos = *pos_ptr;
> +
> +	if (pos != head && !tcp_tsorted_after(node, pos))
> +		return;
> +	while (pos->next != head && !tcp_tsorted_after(pos->next, node))
> +		pos = pos->next;
> +	if (pos != node)		/* not already linked in place */
> +		list_move(node, pos);
> +	*pos_ptr = node;
> +}
> +
>   static void tcp_undo_cwnd_reduction(struct sock *sk, bool unmark_loss)
>   {
>   	struct tcp_sock *tp = tcp_sk(sk);
>   
>   	if (unmark_loss) {
> +		struct list_head *pos = &tp->tsorted_sent_queue;
>   		struct sk_buff *skb;
>   
>   		skb_rbtree_walk(skb, &sk->tcp_rtx_queue) {
> -			TCP_SKB_CB(skb)->sacked &= ~TCPCB_LOST;
> +			u8 sacked = TCP_SKB_CB(skb)->sacked;
> +
> +			TCP_SKB_CB(skb)->sacked = sacked & ~TCPCB_LOST;
> +			/* RACK unlinked the skbs it marked lost. Skbs never
> +			 * retransmitted keep their original send times, which
> +			 * increase with sequence, so in one forward pass we
> +			 * relink them all. For the rare case of undo after
> +			 * lost retransmissions, we will fall back to RTO.
> +			 */
> +			if ((sacked & (TCPCB_LOST | TCPCB_EVER_RETRANS)) ==
> +			    TCPCB_LOST)
> +				tcp_tsorted_relink_skb(tp, skb, &pos);
>   		}
>   		tp->lost_out = 0;
>   		tcp_clear_all_retrans_hints(tp);

