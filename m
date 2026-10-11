Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAB2469837;
	Sun, 11 Oct 2026 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750926; cv=none; b=gx2EQFcsWpkKMLBlr8qrJYgV8Hqcvw55z6Nb/w1j8YmwdM9RNQrcGUrDC/oN0sr/EUe1kk8XOf0eTRhGodbtxKvtyrlauwQTVmQ4O2+IRHCfY8KppHbFvhNIae3kOA4wt5vcfCad4f0TTdHpV3Z49kk/0Shl70+9tnLz4ZAu3IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750926; c=relaxed/simple;
	bh=e7QT3SsYr0JHQ9H9umJ2k17iSH4izfr6KKE/hIwlQ2g=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jhbXl5nvL3UX3LA4YNK9bLXU/WJlqe1JCyJ76NpbV3s0T6e0wAl2h7yTW5NwdbBsO7pDCP04olI1KQE/V0tajgRIELrEQzkk5ywfF7HlA+zXpGkVGuNL+jBEqVOcnkD3R+xdHtkddE15YNmkY7bmqf/p1lBDhhvI/RZkHmvPajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOXYtlzB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOXYtlzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E281F0089B;
	Sun, 11 Oct 2026 20:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750924;
	bh=8FE/7thoXkP2rxSPSe4s5tC4CjAPnwzchcLCubm2LTk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OOXYtlzB8d46QBzxHL/c3BUsiNWmMfBz1mAVA8YY9Am4AVVl+Qu9oYi7SlCp6Kobx
	 rXHO0IL1F3P7vkf/ZwnWrI1Sxcn1XcBHayKFnOv6SqJLA6itK1CcV29K8UgWeBNRGa
	 XDm0S3vJrDxdZcVW9y+XuGgJTBhC8LS+pMQFZXa0WnScDzrXYtmXLfDQlQreOjRD6t
	 RM/lGUcNKt7ehISEUf8drbQ+pvk8MMTU8NrmZRT2FHgB61B4boWQ8VXzx05zyKTp5f
	 eVrj3s7GNOcuwoQkHiFWMKu4BwBN4Pl+FO4yN1LE1zBaSIlcoihscOB7cDdBVXOW2P
	 8LuoacN1kLXgw==
Subject: Re: [PATCH net-next v3 6/9] tls: Return copied data ahead of a run of
 empty records
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 11 Oct 2026 20:35:23 +0000
Message-ID: <179175092355.434549.9915477729935214479@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-6-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-6-6d52d98389b3@kernel.org>
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

- [Low] The commit "tls: Return copied data ahead of a run of empty
  records" fixes a delay a remote peer can cause in tls_sw_recvmsg(),…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but the new
  early exit in tls_sw_recvmsg() only fires when `decrypted + copied >=…

--

tls: Return copied data ahead of a run of empty records

This patch makes tls_sw_recvmsg() leave the receive loop at a zero-length
application_data record once the receive low-water mark has been met. Data
that has already been copied then goes back to the reader. Before this, it
stayed in the loop while a peer kept sending empty records.

Link: https://lore.kernel.org/r/179124254665.434549.12245680127262431659@kernel.org

> Suggested-by: sashiko-bot <netdev-bot+sashiko@kernel.org>
> Link: https://lore.kernel.org/r/179124254665.434549.12245680127262431659@kernel.org
> Signed-off-by: Chuck Lever <cel@kernel.org>

[Severity: Low]
Should this commit carry a Fixes: tag?

The commit message describes a delay that a remote peer can cause, but the
trailers only contain Suggested-by and Link.

Every other kernel patch in this series has a Fixes: tag. That includes
"tls: Check for a pending signal after an empty record", which is also
described as not reproduced and uses Fixes: c46234ebb4d1.

The behavior predates the series. Before "tls: Consume empty data records
in tls_sw_recvmsg()", an empty record went through the normal path with
decrypted += 0 and len -= 0. The || tls_strp_msg_ready(ctx) loop condition
then kept the reader in the loop.

That parent commit carries Fixes: 692d7b5d1f91. It also adds the
!chunk && control == TLS_RECORD_TYPE_DATA branch that this patch changes.

Without a tag here, would stable backports that take the parent commit
miss this follow-up?

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index b7f3edf9828e0..fd6f944ffd677 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -1937,6 +1937,12 @@ int tls_sw_recvmsg(struct sock *sk,
>  
>  			/* An empty record still marks a boundary. */
>  			msg->msg_flags |= MSG_EOR;
> +
> +			/* Return data already copied instead of holding it
> +			 * through a run of empty records.
> +			 */
> +			if (decrypted + copied >= target)
> +				break;
>  			continue;
>  		}

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. What
happens to a reader that has copied some data but is still below target?

In tls_sw_recvmsg(), target comes from:

	target = sock_rcvlowat(sk, flags & MSG_WAITALL, len);

Under MSG_WAITALL, including MSG_DONTWAIT | MSG_WAITALL, that is the full
len. With SO_RCVLOWAT set, it can also be larger than what was copied.

Such a reader still takes the continue on every empty DATA record.
Neither decrypted nor len advances.

The timeout doesn't seem to limit this. tls_rx_rec_wait() recomputes the
timeout on every call, but only checks it inside the wait loop:

	timeo = sock_rcvtimeo(sk, nonblock);

	while (!tls_strp_msg_ready(ctx)) {
		...
		if (!timeo)
			return -EAGAIN;
		...
	}

When a record is already parsed, the loop body never runs. So neither the
zero MSG_DONTWAIT timeout nor SO_RCVTIMEO is checked.

The backlog also keeps refilling. tls_read_flush_backlog() calls
sk_flush_backlog() whenever tcp_inq() is small:

	if (done - *flushed_at < SZ_128K && tcp_inq(sk) > max_rec)
		return false;

	*flushed_at = done;
	return sk_flush_backlog(sk);

Could a peer that keeps sending empty records hold a nonblocking
MSG_WAITALL reader with partial progress in tls_sw_recvmsg()
indefinitely?

It looks like the call only ends on one of these:

  - a pending signal (the nodata && signal_pending(current) check)
  - an error
  - the peer stops sending empty records

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-tls-follow-on-v3-0-6d52d98389b3%40kernel.org
