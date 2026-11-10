Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292703;
	b=eVvy3BtmUHCPPbbcnHMaETx5k21HZ4UNj9TBa9kSL8E7WTrWVqQrtbO/OvfXpcBAxjPj
	 22j3y+LnkaAAwxJQFObC1lWWNB0h+SbOCNV7X1KagtK+LTe924BlmVCVi8ANhCPJZbs5q
	 NBQ2lxvKPeK9ijAA0ugrK9/nsIwb0FovKKDBVoKZJ2I75ZVaKkXfZqR8xKeV3YYnw4dBK
	 J3GaBmko/EfElOa0YWKY9ZKZQh2gAVIYD0/2sSaEn4VPd3B5i83T8eiRCxP5T5VXNBAQb
	 PUR6aCqc27jC5wbiCJJ4GTbvszAqtnzwMax6hdqPOEbLdNU3yLzs7r5msrW+yDslZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292703;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LOiKICujpBzPReN9GW/iERHG8sQmBIYj4fZnX5FM+J8=;
	b=AImgA+4Zk/9SXgT74dWuYgOfBJahMkjIlUEmIxOWOyD9ihf8ZjD9sps9u+qUdAolgskw
	 EsIRUi2LlzEZKAac3alY46R1Qde0VLvqWLZk85QeAKdu6CEZyrHXZM3ika/FCNplOJmJx
	 ZipKDLx0F84ExEsBdn+vVKJY4UniETIUlF/FW49fULpr91VgYmS9V/KpnM5l9J+fpk4jy
	 GikLEegLQdjgDtMXitXzfxxPqD7O6hdv+gbj0/FmrdEmoyi1E7Aw2zBCzgmmI0zjS1vuW
	 IILXSGueB46uyEbuHTbfpy0XWxxSVJBxDz447M4E5lnn5aSkBNfgzVo4MYaRURkzjkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=au9KblM6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BBE606A337;
	Tue, 10 Nov 2026 06:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=au9KblM6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D53F1F00902;
	Tue, 10 Nov 2026 06:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794292703;
	bh=LOiKICujpBzPReN9GW/iERHG8sQmBIYj4fZnX5FM+J8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=au9KblM6MDvvUk3stFQgLY+uzYxsGZluR6/clV6WxupExmxurx0pg07ia67CUdvO0
	 qJ7xZi70FU4EzYb7ZyOPFpfAC2WkZidW7KLwRZMpca0FXX/f9mBZyzCse8+6bYvDoQ
	 gGU//R/X4+j6HriKgXiVkI666AJtiNihCwWTl7dXcB1V0paTCdEDOMOcwCDmNJb1aX
	 oPvNuljJoBLG1jKYdNUXIsll+yaA/Ano9YuR/Le82tDRdz5cgzdvulgFqsRICnHmOo
	 q/YdR7zQ5U54WbWB+PFQdgQ8QtZMIGSjOkwZR31d8TGkl7YaybgZw90RT9mSSREYVK
	 uH22tOA5oqhaA==
Subject: Re: [PATCH net 4/4] selftest: af_unix: Test SIOCINQ and scm_fds with
 OOB and dgram disconnect.
From: netdev-bot+sashiko@kernel.org
To: sidchintamaneni@gmail.com
Cc: kuniyu@google.com, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, willemb@google.com, jannh@google.com,
 tkhai@ya.ru, apais@microsoft.com, rlmenge@gmail.com,
 hargar@linux.microsoft.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 06:38:21 +0000
Message-ID: <179429270185.994134.9244218175897635555@kernel.org>
In-Reply-To: <20261106051905.218638-5-sidchintamaneni@gmail.com>
References: <20261106051905.218638-5-sidchintamaneni@gmail.com>
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

- [Low] Two new tests in
  tools/testing/selftests/net/af_unix/scm_rights.c, oob_fdinfo() and…

--

selftest: af_unix: Test SIOCINQ and scm_fds with OOB and dgram disconnect.

This commit adds a SIOCINQ check to msg_oob's __resetpair() so that the
drained stream receive queue reports 0 unread bytes. It also adds
oob_fdinfo and dgram_disconnect_fdinfo tests to scm_rights.c. These check
that scm_fds in /proc/self/fdinfo/<fd> goes back to 0 when OOB skbs carrying
SCM_RIGHTS are skipped or freed, and when a dgram socket with queued
SCM_RIGHTS skbs disconnects.

> diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
> index c165f250220a4..38a125d9f6e49 100644
> --- a/tools/testing/selftests/net/af_unix/scm_rights.c
> +++ b/tools/testing/selftests/net/af_unix/scm_rights.c

[ ... ]

> @@ -395,4 +425,82 @@ TEST_F(scm_rights, mixed_lowpoint)
>  	close_sockets(6);
>  }
>  
> +TEST_F(scm_rights, oob_fdinfo)
> +{
> +	int recv_fd, ret;
> +	char buf[2];
> +
> +	if (!(variant->flags & MSG_OOB) || variant->disabled)
> +		return;

[Severity: Low]
Should these early returns use SKIP() instead?

In kselftest_harness, a plain return from a TEST_F body counts as a pass.
The scm_rights fixture has 10 variants, and oob_fdinfo() only does real
work on stream_oob and stream_listener_oob. The other 8 variants report
"ok" even though nothing was checked.

dgram_disconnect_fdinfo() later in this patch has the same pattern:

	if (variant->type != SOCK_DGRAM || variant->disabled)
		return;

It only runs on dgram and reports "ok" on the other 9 variants. That makes
17 TAP results that show as passes rather than "# SKIP".

The sibling test scm_rights_denial_lsm.c already uses this form:

	SKIP(return, "requires root");

Also, FIXTURE_SETUP and FIXTURE_TEARDOWN still run for these no-op cases.
FIXTURE_TEARDOWN(scm_rights) does this:

	if (variant->disabled)
		return;

	sleep(1);

So the no-op runs on non-disabled variants add about 7 seconds of runtime.
That is 3 for oob_fdinfo (dgram, stream, stream_listener) and 4 for
dgram_disconnect_fdinfo (stream, stream_oob, stream_listener,
stream_listener_oob).

> +
> +	create_sockets(2);
> +
> +	if (variant->test_listener) {
> +		recv_fd = accept(self->fd[0], NULL, NULL);
> +		ASSERT_LE(0, recv_fd);
> +	} else {
> +		recv_fd = self->fd[0];
> +	}

[ ... ]

> +TEST_F(scm_rights, dgram_disconnect_fdinfo)
> +{
> +	struct sockaddr addr = {
> +		.sa_family = AF_UNSPEC,
> +	};
> +	int ret;
> +
> +	if (variant->type != SOCK_DGRAM || variant->disabled)
> +		return;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106051905.218638-1-sidchintamaneni%40gmail.com
