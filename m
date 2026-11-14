Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676192;
	b=VIXYeBSrsE2pYxmwpOYbUPX2wYbbrv4AeMAya9MhZbVcaiqCRXwZe2flZevpwAgIuwje
	 Bd6lgNHUac5O8rj4ScJBPtHQlR0Icfqm0S26OUJZDVVMBsld0G19e9gLN0CQkfx6SdXXG
	 SHnQI+6+J0+gU38A1EBGfUUir9lPNGpg4cgFvoyZKXU/X3e6ICbrVbmAf9d1wFkSgCAw9
	 F+QkGvxeI1AwfhzV8erE6I5wjyqSn7vHdybUHz0IZ+42uo6QoOQ45v3ykYRoOpGcVn9Tf
	 BWZ2Km7F1iJHwV5gjVzG2CNNhIFK1+xdVBqLHFWzEX6q/kr2XkoGQq8hlymcsmqdgvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676192;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0GdjTtQZ3wJcZ4URpoeAgc52Y13xDUWhD+cjgtAcWHk=;
	b=yFiSrbApOvKhjKZW03MhSTz+Sg3GR8FOdv0mXXgHNp3/ejEApg0oOiOXakOPXu9cKAEg
	 Ya3H6RQZIRggO35tDJcIzI4Ahi+q/Tl57TZQXSixlZi3W1cKTYrOKeoVx7uSYyBy57IpH
	 7I0OBjr5ukAv/Bv1Pcj3BRy7xcBWvCeBJoHkf7L9fBSFQAjVVJ9eWqv9/hadq6kvJ2HhK
	 yjERXjSJriGzF/ZcdJ8wwAuJ2k0W4HkMUkP/qf/3EZk9g10wEy+oEG5sEtfC41JBjvbMi
	 afMVazWRzgnTDaUkbdOK02p7Hoi9DJp+jqiyjOaB5coqn7JM0edz8z+XVsql/bwWZjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HXKtIlkh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B29606A32D;
	Sat, 14 Nov 2026 17:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HXKtIlkh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C55E1F000C4;
	Sat, 14 Nov 2026 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794676192;
	bh=0GdjTtQZ3wJcZ4URpoeAgc52Y13xDUWhD+cjgtAcWHk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HXKtIlkhl2ZZd6RH6kZsPWAb+S2qX92WBNDHuUbXcGom5xd7pDYSc12NYxyYpogKy
	 ooJ7TRCX8TEXJ/76rVAHv1Yz2JqBUmD5ZxgW3JZ9RIXRjTm2r1uhOcIUfieVCT1zZj
	 7PKUWk8Akyk62nkNV6+MtvPBxwqPW2eR1OcXJ5B5ZqdtZh4CnjaSfHbst/q/kLpoUf
	 47jXCaNbLJolELwc/fQqQzDHUHRfQVOFJIWhGtBYGJnPFcaToZsXHf9p5jJRI8D2lq
	 DYpq/icStsilsHs/axP58vpmHAEhDTARMAr2ru41OPKxrOMbrrbH1KqV/iG3piPncE
	 KYyXGBlMCSO4A==
Subject: Re: [PATCH net-next v3 1/3] net/sched: drr, ets, sfq: skip empty
 rounds in the deficit-refill dequeue loop
From: netdev-bot+sashiko@kernel.org
To: victor@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 jhs@mojatatu.com, sashiko-bot@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 14 Nov 2026 17:09:50 +0000
Message-ID: <179467619090.2199510.9471789623632120012@kernel.org>
In-Reply-To: <QDISC-TIAE.v3.r0.20261109173518-1@mojatatu.com>
References: <QDISC-TIAE.v3.r0.20261109173518-1@mojatatu.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The bulk-refill scan in drr_dequeue()
  (net/sched/sch_drr.c:422-431) and ets_qdisc_dequeue()…
- [Low] The commit "net/sched: drr, ets, sfq: skip empty rounds in the
  deficit-refill dequeue loop" fixes a dequeue stall: one dequeue spins…

--

net/sched: drr, ets, sfq: skip empty rounds in the deficit-refill dequeue loop

This patch changes the DRR, ETS and SFQ dequeue loops. After a full round
in which no class could dequeue, they compute how many rounds remain and
credit every active class that many quanta at once. It also takes the tree
lock when a DRR or ETS class quantum is changed.

Link: https://lore.kernel.org/netdev/3ab59725-e34c-4243-bc72-d93f837bcad1@redhat.com/
Link: https://lore.kernel.org/netdev/CA+NMeC_kwd5yihR3SSqb+Z8wX+NuobntbvpKtAyOwjZ1Xa4mVg@mail.gmail.com/

> Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
> Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260819143213.57401-1-jhs@mojatatu.com

[Severity: Low]
Should this have a Fixes: tag? The patch fixes a dequeue stall: one dequeue
spins up to N * 4096 times under the root lock with BH disabled. It has
Reported-by and Closes trailers, but no Fixes:.

The earlier commit 8f735d64382d ("net/sched: bound qdisc_pkt_len to
prevent qdisc soft lockup") fixed the unbounded form of the same refill
loop, and it carried Fixes: 1da177e4c3f4. Without a Fixes: tag here,
stable has nothing to target for the remaining bounded but long form of
the loop.

> diff --git a/net/sched/sch_drr.c b/net/sched/sch_drr.c
> index 8621d057edd9f..bff7b307e98eb 100644
> --- a/net/sched/sch_drr.c
> +++ b/net/sched/sch_drr.c

[ ... ]

> @@ -402,6 +410,51 @@ static struct sk_buff *drr_dequeue(struct Qdisc *sch)
>  			return skb;
>  		}
>  
> +		/* No class could dequeue in the last full round. Add the
> +		 * quanta for the rounds still needed in one pass.
> +		 */
> +		if (!scanned && cl == first) {
> +			unsigned int rounds = UINT_MAX;
> +			struct drr_class *iter, *tmp;
> +			bool skip = true;
> +
> +			scanned = true;
> +			list_for_each_entry_safe(iter, tmp, &q->active, alist) {
> +				unsigned int pkt_len;
> +				struct sk_buff *peek;
> +
> +				/* A child that emptied itself while peeking
> +				 * is no longer in the list and needs no rounds.
> +				 */
> +				peek = iter->qdisc->ops->peek(iter->qdisc);
> +				if (!peek)
> +					continue;
> +				pkt_len = qdisc_pkt_len(peek);
> +				if (pkt_len <= iter->deficit) {
> +					skip = false;
> +					break;
> +				}
> +				rounds = min(rounds,
> +					     DIV_ROUND_UP(pkt_len - iter->deficit,
> +							  READ_ONCE(iter->quantum)));
> +			}
> +			if (skip && rounds != UINT_MAX) {
> +				list_for_each_entry(iter, &q->active, alist)
> +					WRITE_ONCE(iter->deficit,
> +						   iter->deficit + rounds *
> +						   READ_ONCE(iter->quantum));

[Severity: Medium]
Is the comment above the peek accurate? When peek() returns NULL in
drr_dequeue() the class is skipped with continue. Nothing checks that it
has actually left q->active.

If the class is still linked, its need never limited rounds. But the
refill loop above walks all of q->active and adds rounds * quantum to
that class too.

Can a backlogged child return NULL here after it returned a packet earlier
in the same round? multiq_peek() does not cache its result, and it skips
bands whose TX queue is stopped:

net/sched/sch_multiq.c:multiq_peek() {
    ...
		if (!netif_xmit_stopped(
		    netdev_get_tx_queue(qdisc_dev(sch), curband))) {
			qdisc = q->queues[curband];
			skb = qdisc->ops->peek(qdisc);
    ...
}

Another CPU can change the TX queue state while this CPU holds the root
lock. Examples are a qdisc-bypass sender going through dev_direct_xmit(),
or a driver reset or link-down path.

multiq can be grafted under a DRR or ETS class. Such a class stays on
q->active because it still has packets.

Every class that is counted has deficit >= quantum >= 256, and pkt_len is
bounded by QDISC_PKT_LEN_MAX. So rounds <= 4095, and rounds * quantum on
its own fits in a u32.

The sum can still wrap. Take a skipped class B with quantum 1 << 20 that
already got its quantum this round, so its deficit is in [2^20, 2^21).
If a quantum 256 class needs 4095 rounds, then:

    iter->deficit + rounds * READ_ONCE(iter->quantum)

wraps B's u32 deficit. With a smaller rounds nothing wraps, but B can still
gain up to about 4 GiB of credit. It can then send thousands of
stab-inflated packets back to back and starve the other classes. Each
repeated scan after a refill can add more credit.

In the old loop, a NULL peek at the head ended the dequeue through
qdisc_warn_nonwc() and goto out. A class gained at most one quantum per
visit.

Does this conflict with the commit message statement that "Deficits and
service order are the same as with the one-quantum loop"?

One option is to abandon the bulk refill (skip = false; break) when peek()
returns NULL and !list_empty(&iter->alist). Another is to credit only the
classes that were counted. Either way, the comment above the peek would
need updating.

> +				/* A child may show a longer head now that its
> +				 * deficit is positive; scan again if it still
> +				 * cannot send.
> +				 */
> +				first = NULL;
> +				scanned = false;
> +				continue;
> +			}
> +		}

[ ... ]

> diff --git a/net/sched/sch_ets.c b/net/sched/sch_ets.c
> index 6cc902a038387..86fdf772fe2e5 100644
> --- a/net/sched/sch_ets.c
> +++ b/net/sched/sch_ets.c

[ ... ]

> @@ -493,6 +500,50 @@ static struct sk_buff *ets_qdisc_dequeue(struct Qdisc *sch)

[ ... ]

> +				peek = iter->qdisc->ops->peek(iter->qdisc);
> +				if (!peek)
> +					continue;

[ ... ]

> +			if (skip && rounds != UINT_MAX) {
> +				list_for_each_entry(iter, &q->active, alist)
> +					iter->deficit += rounds *
> +							 READ_ONCE(iter->quantum);

[Severity: Medium]
The same pattern is in ets_qdisc_dequeue(). A class whose child peek()
returns NULL is skipped without checking that it left q->active. It then
gets rounds * quantum in the refill loop, and the ETS quantum can also be
up to 1 << 20.

Would the same fix apply here?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-TIAE.v3.r0.20261109173518%40mojatatu.com
