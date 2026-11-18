Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981909;
	b=Kp3l4+zDjHSdP8O8BlZtQwKFzki15Z07xu4esXUGug820McVerMwnxwauOaqS/Zrfgu9
	 tQVo1AvHbHjUijTRFK9D0tgIGmbpV29Hqptzgn0kII3+bBnUKGDf7W6AbgN2iZluoIEkj
	 u+756vKh7o26rH0mV43nnhJ9+sqA6EsaL5pJ0CI3CCouJpf337N6QZEhnHuzlwzl+wfHO
	 iLYSfSUUqAFSm8cjjFOE55BgvQR9tCHS840AGriCTUjh13xWLlb3aEc88R5+QXKaTgody
	 L0su0cGT8rKhtauP2RFlV5jquRFmH+MnvTKCxUn9qYdy3StozZzrtFVqSz9mKk/SRzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981909;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lGFzuVMblmHWoaPkkq3H1BogaS0iZ4fIz8Y5I6dlU/E=;
	b=MgN8icMJdS2hJzJcv3eTHGutXImwc9sbLNgo3OtGYFby96RtrxVXKtoSfyscmJyYg3i/
	 ConNn35MWMvmnwRISVMGMBF2vBrywjCPAAo5hWm7pf+rK5+HYvLN34lqDMYTBhDOYjCzA
	 W7K+yw5t+/qMWjitesBy/4wiqOwUoHXIoK9/6SAFDjM3bw/UN/yZWSa5Rt1Wc+XI5xOlf
	 HCybkzHD67UviLqt3a03ixaNwPFTNWtt0lPVfn3eBHtS/YmX33GkuuFRyrpfrgLucp5KW
	 HOeiCqeedCIsNyy7OsGvVvfMR65bfqh0TFYOyIa1S8Wdlprf8kMJraG4LBxjXAlHNVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DB8KjKpT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E596606A881;
	Wed, 18 Nov 2026 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DB8KjKpT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0783F1F000CB;
	Wed, 18 Nov 2026 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794981908;
	bh=lGFzuVMblmHWoaPkkq3H1BogaS0iZ4fIz8Y5I6dlU/E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DB8KjKpTNQFjBNQDf87cb6e9y2kT2fpOzEV5Jq0WNGgGRLq8k5/6lmaNXDm3tJ5RR
	 0an+eadBaBhmVE7jpb7NAvvygRg5X0BEzfanvXUVKgkjDA/8L+Vssni8gIUCiu/7Pu
	 oUi+1irOxQEaM+G1W/3EWXshEymnPGipxaQGPzs2kbwn3PkSn/9MFOQXEHAyJ7RRBL
	 92Gh6LoAV5d3N93n6VJgizkp3YDRriBP8Im8hRJH0T1rZyib/qjlsozG0NyTncjo/A
	 sKV5fbCzeryfndB1ZTwhjQs2P9ekES6skUvLd2e9Pmng7m26PlI3QS34PavdQPq8ME
	 aB/ikdaZlAF7A==
Subject: Re: [PATCH net-next v4 5/5] selftests: drv-net: psp: add rekey tests
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com
Date: Wed, 18 Nov 2026 06:05:07 +0000
Message-ID: <179498190761.3136.2442491896816949702@kernel.org>
In-Reply-To: <20261116-psp-v4-5-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-5-1a599df2aefa@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch changes the existing shared helper _recv_careful() in
  tools/testing/selftests/drivers/net/psp.py, and the commit message…

--

selftests: drv-net: psp: add rekey tests

This commit adds selftests for rekeying PSP connections. The tests cover
rx-assoc and tx-assoc rejections caused by a PSP version mismatch or by
the PSP state. It also adds rx-assoc, tx-assoc and key-rotate RPC
endpoints to psp_responder.

> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index ce0ab66666030..bd0283f9c9c02 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py

[ ... ]

> @@ -126,7 +157,10 @@ def _recv_careful(s, target, timeout=2):
>      end = time.monotonic() + timeout
>      while time.monotonic() < end:
>          try:
> -            data += s.recv(target - len(data), socket.MSG_DONTWAIT)
> +            chunk = s.recv(target - len(data), socket.MSG_DONTWAIT)
> +            if not chunk:
> +                raise KsftFailEx(f"peer closed after {len(data)} of {target} bytes")
> +            data += chunk
>              if len(data) == target:
>                  return data
>          except BlockingIOError:

[Severity: Low]
This isn't a bug, but this hunk changes _recv_careful(), a helper that
existed before this patch. The commit message doesn't mention it.

Existing tests reach it through _req_echo(), for example
_data_basic_send(). So the change affects more than the new rekey tests:

    _req_echo()
        ksft_eq(_recv_careful(s, 5), b'echo\0')

Before this patch, when the peer closed the socket, recv() returned b''.
The loop then spun without sleeping until the 2 second timeout and
failed with "short read, got N of M bytes".

With this patch it fails at once with "peer closed after N of M bytes".

The only place this is described is the v3 note "fail fast in
_recv_careful() if the peer closes the connection". That note is below
the --- line, so it won't be kept in git history.

Could the commit message say that _recv_careful() now fails fast when
the peer closes the connection? Alternatively, this could go in a
separate patch.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-psp-v4-0-1a599df2aefa%40gmail.com
