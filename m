Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A26C3E49C4
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 05:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524859; cv=none; b=dVVq2lv6xCoq0MAvCqa8niaelLn4Ewb6QxoMCHCWLWWWiSZAMQa5ws+jM1A0e4bDYEoQBwENq4cHeBanseylK6EPe0x4It9gQJ7mH7ea9SdLptanpveRFV/fhpgDkvRtwDiX3CuEcIwJ8ofAhobz4jVCPb0+JPVjCX1063F/7hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524859; c=relaxed/simple;
	bh=VYy2rbGQC2RdtOpzlrJiWSegUq9hlWo2pAx9579dENE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onRCpXZY2gREpy5RKV5q/iWJqn3psCRaYG4lfszQ95OLPg195vyV8FJ3XTmRz6jzj4QAO/TNqo1JK+oKEOIFYZPbHHk0qF6QOHjBrvhvwweOOWuU7cJgpUKneP1W/Nm77MQbRd8Z2Z7W4CvF6rGJqTpwaFsPV13pPeko2OFaMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fozDY/ZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fozDY/ZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32D41F000FF
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 05:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791524857;
	bh=IsGx97RgM8+2NU8wXdDA6EIGSG1c/gLn7f6vrBW/zic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fozDY/ZIMuTebIYilL17pqjavQHqqp1QISyHsT7DGADT+C5p98gpoADxHFefiUiST
	 cjKi9zrNnE6+euLt97eK3JcT8BLhTxlQkPxcCyAUH9hhuRkNloZ9yiJdDo5qDOcsC9
	 uXTuC4zcqxymwzgK+NEXwntzUlX0DXQDhswYW/GC+vvtrpJ8p2GnzmXctf8JErUdxl
	 zXozCv4zyMJMRL4SvZbSBfJ8qRxoeiCUfiTXNtzcmy5aVo4PTb8X7XCdFELwR8/7Th
	 ZSVctqj2m7156xAImB5nMyNMaEn6SeJLbqTkWqUE+Cz+RhJgWalBcQnWlvVNKLF47J
	 k0wpzsHTO0IXQ==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6c1983dfaffso4852049eaf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 22:47:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGwkZBhsTqYBhnLIZJP54+zorszIiJBZ9Kg4IjlMBq6zii3hguZBCXZJNCrICZ1afoRT8aInkGC3oL7bC/FOs=@vger.kernel.org
X-Gm-Message-State: AFuF++kWOtURMTrgjkvoya8fvF55UJLqAZsU7bPm/UnqHL+c9FkHTUQz
	0rghBHR3kz9rVvHMxnElXka2T2G3ZTBHQ2qqEBmQU7JSN8Wg+A1AKmn+5wff+BYdQy6GF3L69Ys
	jwZMvdBmN/s0I075oK3w5+223QIrdTjI=
X-Received: by 2002:a05:6820:8118:b0:6d7:c5f2:9c14 with SMTP id
 006d021491bc7-6ef08c78a38mr747471eaf.4.1791524857192; Thu, 08 Oct 2026
 22:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791506907.git.nramaswamy@openai.com> <976f8457bffbc513197d6ff5c052ca7c4bd6ed03.1791506907.git.nramaswamy@openai.com>
In-Reply-To: <976f8457bffbc513197d6ff5c052ca7c4bd6ed03.1791506907.git.nramaswamy@openai.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 9 Oct 2026 07:47:26 +0200
X-Gmail-Original-Message-ID: <CAL4Wiip9RyA-2=p0SVwBcn-oe0864FqqF3QMTCX_7=+ErcJp6Q@mail.gmail.com>
X-Gm-Features: AclHuK91G6IRlIqoAjVWmpyrxCrXqPKYP2WF59BVsz-PHSystkYQmdWjZCNt61U
Message-ID: <CAL4Wiip9RyA-2=p0SVwBcn-oe0864FqqF3QMTCX_7=+ErcJp6Q@mail.gmail.com>
Subject: Re: [PATCH net v3 3/3] selftests: net: packetdrill: test RTO fallback
 after partial undo
To: nramaswamy@openai.com
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Neal Cardwell <ncardwell.sw@gmail.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Yuchung Cheng <ycheng@google.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 9 oct. 2026 =C3=A0 07:01, <nramaswamy@openai.com> a =C3=A9crit :
>
> From: Neil Ramaswamy <nramaswamy@openai.com>
>
> Tests that a segment that is lost but also previously retransmitted is no=
t
> added back to the RACK list during partial undo, and is instead
> retransmitted by the RTO. It utilizes the fact that a TLP doesn't increme=
nt
> retrans_out, which needs to be 0 for partial undo (but this scenario may
> also happen without the TLP).
>
> Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
> Assisted-by: LLM
> ---

This test passes with or without patch 1/3, so it does not test the fix.

It records that a 3-segment flow with one TLP and one late ACK has to
wait for an RTO, and whoever fixes that later will have to rewrite it.

A single TLP probe is enough to get TCPCB_EVER_RETRANS on a segment, so
I am not convinced this case is rare.

Let me come back to tp->tsorted_lost_queue [1]. I was too terse there
("often") and it did not get discussed.

tcp_rack_detect_loss() walks tsorted_sent_queue from oldest to newest,
and whatever it leaves there was sent after what it just marked lost.
So if it does

list_move_tail(&skb->tcp_tsorted_anchor, &tp->tsorted_lost_queue);

instead of list_del_init(), the lost queue stays sorted by send time
across scans, for free. This also holds for skbs that were retransmitted
(TLP probe, lost retransmit), because they sit in tsorted_sent_queue at
their last transmit time. No TCPCB_EVER_RETRANS special case, no
comparator.

- Retransmit: tcp_update_skb_after_send() already moves the skb to the
  tail of tsorted_sent_queue.
- SACK and cumulative ACK: list_del_init()/list_del() are unchanged.
- tcp_fragment(): buff lands next to skb in the lost queue. Today, for
  an skb RACK has unlinked, list_add() builds a 2-node ring that belongs
  to no list.
- Undo in fast recovery: everything in the lost queue was sent before
  everything still in tsorted_sent_queue, so this is a
  list_splice_init() at the head. O(1), no walk, no timestamp compare.

The "often" is the RTO case: tcp_timeout_mark_lost() leaves the skbs it
marks in tsorted_sent_queue, and they can be older than what RACK moves
to the lost queue afterwards. So undo needs a check: splice at the head
if tsorted_sent_queue is empty or the lost tail was sent before the sent
head, otherwise merge the two sorted lists (the forward walk from Neal's
patch, without the EVER_RETRANS test).

Cost is one list_head in tcp_sock and an INIT_LIST_HEAD() in
tcp_init_sock(), tcp_create_openreq_child() and tcp_write_queue_purge().
Reneged skbs are on neither list and would stay as they are today.
Neal's point about per-socket state is fair, but I think 16 bytes is a
reasonable price for not needing the RTO fallback at all.

With that, B is back in tsorted_sent_queue after the undo at .490 in
your scenario. tcp_undo_cwnd_reduction() sets tp->rack.advanced, RACK
looks at B in the same ACK (sent around .413, rack.rtt_us 40ms from C,
reo_wnd around 10ms), marks it lost again and it is retransmitted
immediately. The test then has the same shape as 2/3 (untested):

  .490 < . 1:1(0) ack 1001 win 20000 <TS val 1390 ecr 210,sack 2001:3001>
   +0~+.05 > P. 1001:2001(1000) ack 1 <...>
   +0 %{ assert tcpi_retransmits =3D=3D 0, tcpi_retransmits }%

and it fails on current kernels, which is what we want from a selftest
shipped with a fix.

If Neal and Yuchung still prefer the stateless version I can live with
it, but then the 3/3 changelog should say that the test passes without
1/3 and documents a known limitation.

[1] https://lore.kernel.org/netdev/CAL4WiipKWgA-EcFWDQd3t7nBwU7AnkLvqs6j--h=
e-dR-SAgqiw@mail.gmail.com/

Thanks.
