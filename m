Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056139F168;
	Tue,  6 Oct 2026 06:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268973; cv=none; b=kImy4zd+T4Nct+fI5ZcUdctpKXcoCG+MGPs6CGWxYqObyn00Kr94uPgUBuS7ylCUDML9HCcM9Mg6j7i/qJtuFBn/9xqHr++dLGYHkBDsvthFdLXjkaACKy86+izCCGUV/po3+RuHOKVc22hKSQ+guGHO7bDntxVh4ATPL5B82sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268973; c=relaxed/simple;
	bh=grT5w55n9KT/Bw2RQ3BIElns2y94PD7YPRmHGce3iH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxyjItAPxmi5CHhMdurFMtxpw+/EfExkif7pe+pilegEtkdzpe89mFTM3ERLdXIbFqb6JboTuDd3x9U1W1JaiAfeg6nx2ELlzh9nE0wRZp/IEGpnsr1xyPVuAiwYnWGgoqgEaFDiIrH+PcXIo2hLz+6rlWF2yD+F7rXNcIfPuPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6WHuvI/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6WHuvI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333C81F000FF;
	Tue,  6 Oct 2026 06:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791268972;
	bh=WeoVw3GGuQlcRqP0/GpwTKMgCBrAgdBN20PLE9/CpsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=R6WHuvI/lx6NZBtG6vKbuyNUrxJqCd9Id63i2sWlXhmk80jIv59l8csvkkaJ04rXc
	 G069wcQxhEl5VPADuOkWlyuGlINah1BV2XLZlxs9BXvLRDwFxACq6Twg5Nj8jNIgzY
	 Z7eeYH3NZkv3V+cX5ty8Ds/Q4+Q7iQ0KDzI3u1dxla1Tl4VzVVwATU5ZFBhXW6HVej
	 tBoIntcf4PDjHKONsggvcooQ4SQG1fZm41F1owmWV3KLce+9N6Y24kwZOMHPpKzgr2
	 reirSs8Kog/1IPRLlT95L1DXLu4K/MtNVEyHBIqSypbTc/9pFFLLecmX036VxJPf9+
	 L4JJUcanjiLYA==
Message-ID: <627cd81c-9824-4d1b-ae47-f7f929a96596@kernel.org>
Date: Tue, 6 Oct 2026 08:42:44 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] tcp: restore RACK list membership when undoing
 loss
To: nramaswamy@openai.com, netdev@vger.kernel.org
Cc: Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Yuchung Cheng <ycheng@google.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1791248202.git.nramaswamy@openai.com>
 <f366f5325d7eb96f0edd999b4f984213743914b8.1791248202.git.nramaswamy@openai.com>
Content-Language: en-US
From: Eric Dumazet <edumazet@kernel.org>
In-Reply-To: <f366f5325d7eb96f0edd999b4f984213743914b8.1791248202.git.nramaswamy@openai.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/6/26 07:15, nramaswamy@openai.com wrote:
> From: Neil Ramaswamy <nramaswamy@openai.com>
> 
> Partial undo can clear the TCPCB_LOST flag on segments already removed
> from RACK's list, which prevents subsequent RACK loss detection, leading
> to segments only being retransmitted after the RTO. Restoring them to
> the RACK list as part of partial undo makes sure we can properly
> reconsider them for fast retransmission in the future.
> 
> To do this, we first sort (by transmission time) the segments whose
> TCPCB_LOST flag is being cleared and then linearly insert those back
> into the RACK list, which is sorted by transmission time.
> 
> My investigation started from seeing repeated TCP stalls in prod and the
> mitigation that seemed to prevent these stalls was limiting SO_SNDBUF to
> 96 KiB. It also seems like others have seen similar symptoms before [1].
> 
> [1]
> https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gmail.com/
> 
> Fixes: 043b87d7599e ("tcp: more efficient RACK loss detection")
> Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
> Assisted-by: LLM sparse
> ---
>   net/ipv4/tcp_input.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 92bc60716f33..51f04c7474dc 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -69,6 +69,7 @@
>   #include <linux/module.h>
>   #include <linux/sysctl.h>
>   #include <linux/kernel.h>
> +#include <linux/list_sort.h>
>   #include <linux/prefetch.h>
>   #include <linux/bitops.h>
>   #include <net/dst.h>
> @@ -2840,16 +2841,50 @@ static void DBGUNDO(struct sock *sk, const char *msg)
>   #endif
>   }
>   
> +static int tcp_rack_skb_cmp(void *priv, const struct list_head *a,
> +			    const struct list_head *b)
> +{
> +	const struct sk_buff *skb_a = list_entry(a, struct sk_buff,
> +					       tcp_tsorted_anchor);
> +	const struct sk_buff *skb_b = list_entry(b, struct sk_buff,
> +					       tcp_tsorted_anchor);
> +
> +	return tcp_skb_sent_after(tcp_skb_timestamp_us(skb_a),
> +				  tcp_skb_timestamp_us(skb_b),
> +				  TCP_SKB_CB(skb_a)->end_seq,
> +				  TCP_SKB_CB(skb_b)->end_seq);

Patch LGTM, but perhaps we could avoid the two div_u64() calls here.


	return tcp_skb_sent_after(skb_a->skb_mstamp_ns,
				  skb_b->skb_mstamp_ns,
				  TCP_SKB_CB(skb_a)->end_seq,
				  TCP_SKB_CB(skb_b)->end_seq);



> +}
> +
>   static void tcp_undo_cwnd_reduction(struct sock *sk, bool unmark_loss)
>   {
>   	struct tcp_sock *tp = tcp_sk(sk);
>   
>   	if (unmark_loss) {
> +		LIST_HEAD(restored);
>   		struct sk_buff *skb;
>   
>   		skb_rbtree_walk(skb, &sk->tcp_rtx_queue) {
> +			if (TCP_SKB_CB(skb)->sacked & TCPCB_LOST)
> +				list_move_tail(&skb->tcp_tsorted_anchor,
> +					       &restored);
>   			TCP_SKB_CB(skb)->sacked &= ~TCPCB_LOST;
>   		}
> +		if (!list_empty(&restored)) {
> +			struct list_head *pos = &tp->tsorted_sent_queue;
> +
> +			/* Ensure lost skbs are added in transmission order */
> +			list_sort(NULL, &restored, tcp_rack_skb_cmp);
> +			while (!list_empty(&restored)) {
> +				struct list_head *entry = restored.next;
> +
> +				while (pos->next != &tp->tsorted_sent_queue &&
> +				       !tcp_rack_skb_cmp(NULL, pos->next,
> +						 entry))
> +					pos = pos->next;
> +				list_move(entry, pos);
> +				pos = entry;
> +			}
> +		}
>   		tp->lost_out = 0;
>   		tcp_clear_all_retrans_hints(tp);
>   	}

