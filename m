Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB195468C3A;
	Sun, 11 Oct 2026 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750924; cv=none; b=j3pA3AgNjgWR1lkxhNFCFxWhzEBEO53Tusfv3Er3/wB6b6nq3HjIWADQ+OoFklUouBMOJfJWfUEYtl3F/hmis92pD2MUBG+3Yo3FxUNrYVzhPsvaO36xd3S2u6nzoirleDmAFkufGpDyn2dMWC7gdVtwJ9zsNErC2DIMG39Zows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750924; c=relaxed/simple;
	bh=MdhBSWMkH5B0g/syQmzrzTRP4k36Iu4mtTHjUVJgaOI=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r1T8cMHxByFojAsh9Y+lcD6L948t/T6RS3CWHfT+tdcBtcu4HNdWaeXpHXP2a9xKg7+0wyblPG/dzS97NdRAtlxleImj81BIv95bhKfDAYsEQ6deMIsTokEgmzOgDvxDdanQ7JoDJaFn3UNUZwFoZFoPcskAzc4iTK+aUVpvnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lE+DKoBB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lE+DKoBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73831F0089C;
	Sun, 11 Oct 2026 20:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750923;
	bh=lzGqfdN5Tzs+Y8CjpI3gQJFIpm5Za23/5/CBYGFbB5w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lE+DKoBBa61M2jwRH3LaF2CJV9wF5WyydwyozGJg4iNBGAdlPaDZ9LPR8+SXD8WGZ
	 d+P4s5K9nwDjuHIsgS9h2yLOXeJuaOAfWDXs/y4c8zkAbqWSHM29fXsqLzeC9ZkD2+
	 9JkdWXm5MrtKMsO5bSIuydDkbbjD/LhE8+O/5isu1dBZYSzD9p3Td1j2L9lExRS4I4
	 Ms+wYbNTVOlpz8x5uIGl9k3K3akinqfwF0dhB/jYpDsbz5X12xTErXBufp+ZVfN+/3
	 PjRpQKHdV8u2Nj213qRUJU22SI947/7KJWJA0KbN47gbJbL5r2Pb/HIlaEwT5kV0Fx
	 NsHtNi/ebJr7A==
Subject: Re: [PATCH net-next v3 5/9] tls: Consume empty data records in
 tls_sw_recvmsg()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 11 Oct 2026 20:35:22 +0000
Message-ID: <179175092232.434549.18278320872097507378@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-5-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-5-6d52d98389b3@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The concern: with MSG_PEEK, the new empty-record branch in
  tls_sw_recvmsg() (line 1934) consumes the empty record and sets…
- [Low] At this commit, the only zero-length-record selftest,
  TEST_F(zero_len, test) in tools/testing/selftests/net/tls.c, uses TLS…

Pre-existing issues:
- [Medium] tls_sw_recvmsg() (net/tls/tls_sw.c) can return 0, which
  userspace reads as EOF, on a connection that is still live.
- [Medium] In tls_sw_recvmsg() (net/tls/tls_sw.c), a reader keeps
  consuming empty application_data records with the socket lock held for…

--

tls: Consume empty data records in tls_sw_recvmsg()

This patch adds a branch to tls_sw_recvmsg() that consumes zero-length
application_data records as soon as they are decrypted. Before this, the
peek and async arms queued every empty record on rx_list. The new branch
sets MSG_EOR itself and continues the receive loop.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index ff82e2f4e9e52..b7f3edf9828e0 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1927,6 +1927,19 @@ int tls_sw_recvmsg(struct sock *sk,
>  		nodata = !chunk;
>  		tls_rx_rec_done(ctx);
>  
> +		/* Keep an empty record off rx_list. On the zero-copy path
> +		 * the strparser owns darg.skb, and tls_rx_rec_done() has
> +		 * released it.
> +		 */
> +		if (!chunk && control == TLS_RECORD_TYPE_DATA) {
> +			if (!darg.zc)
> +				consume_skb(darg.skb);

[Severity: Low]
This isn't a bug, but at this commit the only zero-length record selftest
is TEST_F(zero_len, test) in tools/testing/selftests/net/tls.c. It receives
on a zc-capable TLS 1.2 socket with a user buffer and without MSG_PEEK:

	EXPECT_EQ(__tls_recv_cmsg(_metadata, self->cfd, NULL,
				  buf, sizeof(buf), MSG_DONTWAIT), ret);

So every empty record takes the darg.zc arm, and this consume_skb() call
never runs in that test.

A later patch in the series, "selftests: tls: Add peek and splice coverage
for zero-length records", adds TEST_F(zero_len_peek, test). That test uses
MSG_DONTWAIT | MSG_PEEK, which covers this non-zc path. The async arm is
still not covered, because that needs an async crypto driver.

> +
> +			/* An empty record still marks a boundary. */
> +			msg->msg_flags |= MSG_EOR;
> +			continue;
> +		}

[Severity: Medium]
This is a pre-existing issue, but can tls_sw_recvmsg() return 0 on a live
connection? This would happen when an empty application_data record is
followed directly by a non-data record, such as an alert or a TLS 1.3
NewSessionTicket or KeyUpdate.

For the empty record, tls_record_content_type() sets control to
TLS_RECORD_TYPE_DATA and emits the TLS_GET_RECORD_TYPE cmsg. This branch
then consumes the record and continues.

For the next record, tls_record_content_type() finds a type mismatch:

	} else if (*control != tlm->control) {
		return 0;
	}

The err <= 0 arm in tls_sw_recvmsg() then queues that skb on rx_list and
jumps to recv_end with err == 0. Since copied == 0, this returns 0:

	return copied ? : err;

An application that does not check the cmsg would read that as EOF. One
example is OpenSSL's ktls_read_record path.

The zc and sync non-zc arms already behaved this way before this patch.
The zero_len 0data_0data_ctrl variant in tools/testing/selftests/net/tls.c
also expects this result:

	.recs = { &id0_data_l0, &id1_data_l0, &id2_ctrl_l11, },
	.recv_ret = { 0, 11, -EAGAIN, },

Is a 0 return with a DATA cmsg the intended behaviour here?

[Severity: Medium]
This is a pre-existing issue, but this branch always continues. An empty
record changes neither bound in the loop condition:

	while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

So with the socket lock held, a reader keeps consuming empty records for
as long as the peer streams them. Only the nodata && signal_pending()
check at the top of the loop ends the run.

Take a MSG_DONTWAIT reader that has copied nothing. tls_rx_rec_wait()
returns -EAGAIN only when no record is ready, so that reader can stay in
the kernel while the peer keeps records coming. Other users of the socket
wait in lock_sock() during that time. tls_read_flush_backlog() can reach
__release_sock() and cond_resched(), so this is a stall rather than a
lockup.

The commit message mentions this: "still reads empty records for as long
as they arrive, until a signal is pending". The sibling reader,
tls_sw_read_sock(), caps a run of empty records:

	if (++nodata >= TLS_RX_NODATA_LIMIT) {
		schedule_work(&ctx->data_ready_work);
		break;
	}

Would a similar cap make sense in tls_sw_recvmsg()?

At this commit the branch also keeps going after the rcvlowat target has
been met. Data already copied is then held back while empty records keep
arriving. The next patch in the series, "tls: Return copied data ahead of
a run of empty records", adds a "decrypted + copied >= target" break to
this branch, which fixes that part.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-tls-follow-on-v3-0-6d52d98389b3%40kernel.org
