Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9F51B19A;
	Tue, 13 Oct 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907904; cv=none; b=YHKtKRaLp2ngwXVJsPmG66J55DxBgjtnqTUkLzHVBRxEBTdD5lamjbhu87t4vTsIK+Su0EnY3KvOQsJEwrqRcyfm269Dfrg7HZNe2JSCRsAv2Otupk2cPIFg/cVblRtXRvXZG3G7rWz9fev98rPanAWH0CTvUciYC95D181mO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907904; c=relaxed/simple;
	bh=vYtJe//Cej1skcWcLY6sBJduPymsZ9gmF5yMWKp882M=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iKMyKfdmyMivkxo2rIn4llIiJ66fRvrj71B6E5aKpQA7WEqL7NM3Hx43jCArM5Uy1NNnKooIZuuyU3z58VejzZocCyOkHrpWGoo0s/Rc1VROMP8BenNM+jlEeqwpa5whnLijTJcbX/6h/W+I4zaoykpGvi5If/FXY98pL1E8SX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EX9zj+rg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EX9zj+rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6461F000FF;
	Tue, 13 Oct 2026 16:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907902;
	bh=fVcT1c94vwIVNx+/IXeHL52s+ezJrEkvPYBjXR8OD3w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EX9zj+rgbfL4sz1rD2bs6TGPX41NbmBrJln8xxr1gD0FpI/WZVNDqiI6+B2CinAYD
	 e3OeW1fAHmX3eAqboT+75ksZluhl9aWLuUJB5wdC+KxBkQvJ9SSbTFvTJPSI7K8+JS
	 KRWp8Sp7I2DmiqqCZbItNnLstK1tQeipqyI9Ip3lrBXStQzr79MDFYGyO8hTPt236x
	 IrGZLb1TwWXSTzMVzGF41XR+jKJtyXG/tWkVWWGE2G7Io6/fLWNNs9ho2766kptIws
	 CD8+5npYEo6p5t9IknnHJyOCdyENCJUyWAMDkEeN2/F6cpYV+MnSU/MPZ2iKhGBKm2
	 PEg9BZnoZCR7g==
Subject: Re: [PATCH net-next v4 6/9] tls: Return copied data ahead of a run of
 empty records
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 16:11:41 +0000
Message-ID: <179190790187.434549.10720335019823028544@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-6-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-6-8cea429565da@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch fixes only the case where the reader has already
  met the low-water mark.

--

tls: Return copied data ahead of a run of empty records

This commit makes tls_sw_recvmsg() leave its receive loop at a
zero-length application_data record once the bytes copied so far meet the
receive low-water mark. Before this change, a peer that sent a stream of
empty records after data could keep the reader in the loop. The reader
held the copied data until the stream stopped or a signal was pending.

Link: https://lore.kernel.org/r/179124254665.434549.12245680127262431659@kernel.org

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index b7790b17f79c6..15a3a6d3f6380 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -1939,6 +1939,12 @@ int tls_sw_recvmsg(struct sock *sk,
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

Can a non-blocking reader still be held here when it has copied some data
but is still below target?

target is computed without regard to MSG_DONTWAIT:

	target = sock_rcvlowat(sk, flags & MSG_WAITALL, len);

So with MSG_DONTWAIT|MSG_WAITALL, or with MSG_DONTWAIT and SO_RCVLOWAT set
above the bytes copied so far, a reader can end up with
0 < decrypted + copied < target.

In that state the new check is false, so the empty record goes to
continue. Empty records advance neither len nor decrypted, so the loop
condition stays true:

	while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

For a non-blocking reader, the usual way out with its partial data is the
-EAGAIN return in tls_rx_rec_wait():

	while (!tls_strp_msg_ready(ctx)) {
		...
		if (!timeo)
			return -EAGAIN;
		...
	}
	...
	return 1;

That check only runs when no record is ready. If the peer has an empty
record ready each time, tls_rx_rec_wait() returns 1. The empty record is
then consumed and the loop runs again. Without the empty records, the
same reader would get -EAGAIN right away, and recv_end would return the
copied bytes.

The reader keeps the copied data until the run of empty records stops or
the nodata && signal_pending() check fires. That is the same delay this
patch fixes for readers that have met target.

The commit message says:

    A reader that has copied nothing still reads empty records
    for as long as they arrive.

This reads as if readers that have copied nothing are the only case left.
The subject line also does not hold for the readers described above.

Later patches in this series do not appear to touch net/, so this case
would still be present after the series.

Would it make sense to also break for a non-blocking read that has
already copied some data? For example:

	if (decrypted + copied >= target ||
	    ((flags & MSG_DONTWAIT) && decrypted + copied))
		break;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-tls-follow-on-v4-0-8cea429565da%40kernel.org
