Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CED1DA628
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774197157; cv=none; b=BIcrHv0U1UwsWsPmksQN1CpTCejsSS/8+O/m4kBcukUTPbc1SHgDPcMyM+4WWVFE3feWnT8SkOxZL8R8x+piyYSAZD8mFtrDJ6Hr1WfNNZ236bX9GIvZRphgG9QUQLiMKy8vK1xKE+vew737GXJTnMhKc6PK8BAEyLOhGi3xYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774197157; c=relaxed/simple;
	bh=86onXyr0j3zbZeSmMOrcZL7rO4mR+xnzbZPSaKqPMZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDDgorkSVIl+KxZjbJWk0GfsimmzC6FLnjalbCTQ7HkbYOWAT2Zv0fHMnVq5+EKfoyyIX7WI/cb90VIJmvw0fBn4an7OYEoaDcMzD0GGncABlpDMDIFY7sQxQ1/QyI9hjGzVmB/U8O7Qk9j4wWXTdgM1BA4PHdNDqf9SSBq9JMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLXGTRzt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLXGTRzt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fb14227cso35941395e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 09:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774197154; x=1774801954; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qtYGdmkqWu+PK4AKFpilD0ArImchmB31I1UOjs7lkVw=;
        b=mLXGTRztuJeVnlspHaQD7y7TyWJYSlb4M9LZaYnjzMPW/Ytl+2WmX2d1gIGeMpXQkt
         rw+7HD0WnKuQMNKcOD4k1R4y2vlxezbHX1Dbm7THCXbAjMAc+1Z/snuE8WWg1kSrfxds
         3XkTcvK1MqYCWSiWVnR1s3pCCjS6A+rr2oCx27MjRD+UcAUrh/dw7AiKpAAlmWEj6PvR
         70PTgE+w/aX4/Yk9+XG0bn2Me6mBYUaavY3YszSV6osa1IkAvvRH9BGjOAZtQoVU+tW3
         zJkuKnVd/wUrs7XaIN1ubUagOGWpeO09P1NRWBj8dtoFKlkGTbT7lWQhbNUPJdreX1Pp
         N9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774197154; x=1774801954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtYGdmkqWu+PK4AKFpilD0ArImchmB31I1UOjs7lkVw=;
        b=L/pUNHpBLYQdA+pDNIz9SSGvHkTuXcMSmWwCXv12aFIUj1GEHxFulz4CxwYgZIuUEU
         nt6g19vVhhb2++3e3VWv603efeMW6ECUWSJDrWlP1O+P1bmT4nTrGhwchA5E/ZvAjNh0
         Apuim9EOCxjN1MBo05FQsRt4KmOc4u7vmaHqZK1RAYpuoN+av+gTA4fcXfqy30eJxGa9
         mWRek4BlLh9ZELtX9QnfHgEkIWy3HslveTsGlI+Be5I1x7RjYYMYX46wvqozb1tKGTxD
         j1vGt+in/MBlMSOWEo4ETrS5KxMYu8eggtW/ifEpKjc3F4TlTy2PP08X6qUTxObXr7tc
         ubBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIypy26oM1ZxSQbXW8ee1VXU7ttEXwGnoyi8k/kkkaUl9hj9M4y9d5xkAZX98OJsNfm2b7qqsNK0r36goii7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcpmIHY2i1IBLIvQ2Xx0HsLKlMFfsEoYuc1ZpK3CmHMVrmOlKf
	skAJSxUf3o4732GAazmu9tjfCCmgWnmbDlzIrH2x1/ZJAQO9o+UPSkTc
X-Gm-Gg: ATEYQzyiGJoCZxWAIwIwiEaKkmzXtNXo6K2ZS6cIO9sretPXr+pqj3cinLRxcYg54R8
	pflPzuQc8QVnedngh5xfb7rQoANKgskDjGzTXeR6qFIx8QePPmuYEuPbFrIBdpAzBveCgwyq31E
	2hVljJWlX6Lyr7FO0lwi1k7zWfkV6nhMqIc1L9EuVeAXp8shC7MwI+ht2OCF2TbEhAaztV86SYa
	d2VKkiY2CJOqn8f0V+owQop+e503BPnXylhAQetxG0HBdkaNw8+gLolVOa2lf/rO4wkGXmaPNcq
	67Ng7/JPmSQ4GKkQU+GWQxPuycTiwyHEMmfenDU0yaIH5Tpozg1y0ileieXk8F2wE1uc3F0Qy2V
	J0PpVehIASwAnUw/6UcSiK408KngpAWAHRkxlQODQ+GxX/8WZb3mPa7WBky3qn++9G3hNC95WjS
	9fkORpQvB5dR+WiybeEHxQlN7RW9sC5pNlxdCg1EacRfe6m0O8MQ5l4Opsf/0mGg==
X-Received: by 2002:a05:600c:5250:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-486fedab733mr131868455e9.4.1774197153561;
        Sun, 22 Mar 2026 09:32:33 -0700 (PDT)
Received: from gandalf.schnuecks.de (p5b2e2ef5.dip0.t-ipconnect.de. [91.46.46.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b949e1sm478665705e9.9.2026.03.22.09.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:32:33 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 6B4903054C7C; Sun, 22 Mar 2026 17:32:32 +0100 (CET)
Date: Sun, 22 Mar 2026 17:32:32 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Wesley Atwell <atwellwea@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, horms@kernel.org,
	kuba@kernel.org, kuniyu@google.com, ncardwell@google.com,
	pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net-next 3/3] selftests: packetdrill: cover scaled rwnd
 quantization slack
Message-ID: <acAZoCnlITtD7ufM@gandalf.schnuecks.de>
References: <20260317065137.1533226-1-atwellwea@gmail.com>
 <20260317065137.1533226-4-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317065137.1533226-4-atwellwea@gmail.com>

Hi Wesley,

On Tue, Mar 17, 2026 at 12:51:37AM -0600, Wesley Atwell wrote:
> Add a packetdrill reproducer for the scaled no-shrink quantization case.
> 
> The sequence leaves slightly more than 84 scaled units of backed credit
> after one skb is drained. The buggy ALIGN() path rounds that up and
> exposes a fresh extra unit, so the wire-visible window becomes 85.

I ran this test on current net-next with assertions on all advertised
windows.  The following passes:

...
   +0 < P. 10001:11024(1023) ack 1 win 257
   * > .  1:1(0) ack 11024 win 85

// Free one skb, then force an outbound packet so the current advertised
// window is observable both on the wire and via TCP_INFO.
   +0 read(4, ..., 10000) = 10000
   +0 write(4, ..., 1) = 1
   * > P. 1:2(1) ack 11024 win 85
   +0 %{ assert (tcpi_rcv_wnd >> 10) == 85, tcpi_rcv_wnd }%

// Queue a tiny OOO skb. This should not create fresh sender-visible credit
// on the next ACK after the first post-drain window update.
   +0 < P. 12024:12025(1) ack 2 win 257
   * > .  2:2(0) ack 11024 win 85
   +0 %{ assert (tcpi_rcv_wnd >> 10) == 85, tcpi_rcv_wnd }%


I do not see an “extra unit” after draining; the sender-visible
window stays at 85 throughout.

In this flow the receive window is limited by rcv_ssthresh (86286)
and not by memory (free_space > 92000).  The effect of the change
looks to be that the previous code settles at rcv_ssthresh rounded
up, while the patched code settles at rcv_ssthresh rounded down.

The choice in the current code seem to be explicit, in the
shrink_window_allowed branch we have:

	if (free_space > tp->rcv_ssthresh) {
		free_space = tp->rcv_ssthresh;
		/* new window should always be an exact multiple of scaling factor
		 *
		 * For this case, we ALIGN "up" (increase free_space) because
		 * we know free_space is not zero here, it has been reduced from
		 * the memory-based limit, and rcv_ssthresh is not a hard limit
		 * (unlike sk_rcvbuf).
		 */
		free_space = ALIGN(free_space, (1 << tp->rx_opt.rcv_wscale));
	}

Thus, we explicitly round up when we are constrained by rcv_ssthresh.

As Paolo noted, once free_space gets smaller we already round down,
so the current behavior appears to be: round up while there is
headroom (possibly constrained by rcv_ssthresh), and round down once
memory starts to get tight, which makes sense IMHO.

Given that, this test case demonstrates that the new code now expects
rounding down even when there is ample memory, but it does not show a
concrete improvement in the situation the patch is meant to fix
(i.e. a case where the current rounding-up behavior actually hurts).

> Then queue a tiny OOO skb so the next ACK re-runs the no-shrink path
> after a small receive-memory change without advancing rcv_nxt. With the
> fix in place, both ACKs keep the sender-visible window at 84.

And without it, both ACKs keep the sender-visible window at 85.
 
> This provides fail-before/pass-after coverage for both the immediate
> quantization bug and the follow-on ACK transition that reuses the stored
> window state.
> 
> Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
> ---
>  .../packetdrill/tcp_rcv_quantization_credit.pkt    | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt
> 
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt
> new file mode 100644
> index 0000000000000000000000000000000000000000..8ea96281b601f2d161cfd84967cad91cedb03151
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +--ip_version=ipv4

Is there a particular reason to restrict this to IPv4 only?

> +--mss=1000
> +
> +`./defaults.sh
> +sysctl -q net.ipv4.tcp_moderate_rcvbuf=0
> +sysctl -q net.ipv4.tcp_shrink_window=0
> +sysctl -q net.ipv4.tcp_rmem="4096 131072 $((32*1024*1024))"`
> +
> +// Exercise the scaled no-shrink path in __tcp_select_window().
> +// The sequence below leaves slightly more than 84 scaled units of backed
> +// credit after one skb is drained. The buggy ALIGN() path rounds that up and

I'd drop the "buggy ALIGN() path" wording in the comment.  If the
change lands, there is no longer such a path, and the comment should
just describe the behavior the test is checking.

> +// exposes a fresh extra unit; the fixed path keeps the sender-visible window
> +// at 84. Then queue a tiny OOO skb so the next ACK re-runs the no-shrink
> +// path after a small receive-memory change without advancing rcv_nxt.

- Simon

-- 
Simon Baatz <gmbnomis@gmail.com>
