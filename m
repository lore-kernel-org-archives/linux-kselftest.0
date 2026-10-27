Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101754;
	b=e02ieup7aNpR5Uo9LrihPYknFEGGrzWEIFLIKmJA/YYrckEH49Sfhf/m5RlP4VYYzL4V
	 5uHvZfsr0N4xlKEsb/WuhSQaKraxiYXI2KUSOyybi7bLFmsQAUFJg8tSpYuvvf2/gMNqu
	 wkxSoC7LoSEpcOQyjMJxDOfkXRGrFgtDR3E/FMI76+kc3EVNzCfAQDQhmNvDne26bP6Up
	 7ePPpUi145w8HJNeiH8wdfPopitYjNhBFj0UcukRKX4iOwv/JbfDIJm8cvA8rLA6nvhgm
	 Z/drIJKcoWMrk+9adXsux7LjDZqxi8LkNG35oZ+TeenVx6Ds+RGGHQsSAQy/9kFimTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101754;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TTJmA88cQwl8RM34llTru5b4J/+2xPkGiT4W3SD2CjI=;
	b=uRtJK/j+3LGsGZxmpN5qT2mjqfPxSfNBoLo4IKjBGA1EFHqVVhn79wiQQX1+ibT1wuHY
	 r7xzOeuxcyohUxTz6lbxhklK22qRnDO8EX4eeqzCFkwRK0q4m6X/zT0Capa0WTwFHUrC5
	 9jG295JMzed5v1/KPSMk+xQkKgkzJqyaF8yj1ETiZSnjeihG8rHq+87h5iZtxwYqo6uA/
	 i44lvPvTJmqKEDi3erbjY9EYo0MofHpjoSN8IqFoIA8gx3xkm6BX7LSN7yBOYRP3RRo6U
	 MJD6j0gr4mJDHImN67FqdYxdngWJUC4lFucAYsFQRjlY6J2YI45vHrAIA/4oeFda+6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKQrZ86V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3393606A336;
	Tue, 27 Oct 2026 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKQrZ86V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7C61F031E2;
	Tue, 27 Oct 2026 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101753;
	bh=TTJmA88cQwl8RM34llTru5b4J/+2xPkGiT4W3SD2CjI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dKQrZ86V/MgtlDd9erFpBEbDINUFDYKxpaJ0c9GzZddPcL5izD/JvS3GMduWQRsw+
	 +uX2yxVaBqp4gpGP4/GlC23UHC8FEMb7v8Mre72s/egjMKM3o/iDfoRo68XUPG9KZL
	 xCU/38JGHWavOHWo12+O3L41eRPHH+UX8KpcuoP9xDu/ERlIYCUzmP++Ujuw7qYPsf
	 FurDh2Uvz1kHhbZZxIs0wBf53AGC2kk6HqyXEtnxsXFn15jvnfE+C1nCbLt9e1/tKZ
	 PweYLnUIRKvaa3CuJXTpPmlrHfZtzS7KBSEkoyHx8GpEDlPf0di9KENeUIUU9nm/2C
	 n34EB43LaI+SA==
Subject: Re: [PATCH net 2/2] selftests: net: netlink-dumps: start a dump with
 a notification queued
From: netdev-bot+sashiko@kernel.org
To: jhonata.poma@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuniyu@google.com
Date: Tue, 27 Oct 2026 11:49:12 +0000
Message-ID: <179310175236.3134.7064612436495160668@kernel.org>
In-Reply-To: <20261023-netlink-dump-livelock-v1-2-478214a635d2@gmail.com>
References: <20261023-netlink-dump-livelock-v1-2-478214a635d2@gmail.com>
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

- [Low] The new test dump_with_queued_ntf in
  tools/testing/selftests/net/netlink-dumps.c needs privileges that the…
- [Low] dump_with_queued_ntf sets done = true as soon as it sees any
  NLMSG_DONE with nlmsg_seq == 1.

--

selftests: net: netlink-dumps: start a dump with a notification queued

This adds a test, dump_with_queued_ntf, to netlink-dumps.c. It starts an
RTM_GETLINK dump on a socket with a small receive buffer while a link
notification is still queued. The reader peeks before each read, the way
libnl does, and the test expects the dump to complete.

> diff --git a/tools/testing/selftests/net/netlink-dumps.c b/tools/testing/selftests/net/netlink-dumps.c
> index 51129c564d0a6..6f66a478d72f3 100644
> --- a/tools/testing/selftests/net/netlink-dumps.c
> +++ b/tools/testing/selftests/net/netlink-dumps.c

[ ... ]

> +// A dump started while a notification is still queued must make progress
> +// for a reader which peeks before reading, like libnl does
> +TEST(dump_with_queued_ntf)
> +{
> +	struct sockaddr_nl addr = {
> +		.nl_family	= AF_NETLINK,
> +		.nl_groups	= RTMGRP_LINK,
> +	};
> +	int netlink_sock, inet_sock, i;
> +	int rcvbuf = 8192;
> +	bool done = false;
> +	char buf[32768];
> +	ssize_t n;
> +
> +	ASSERT_EQ(unshare(CLONE_NEWNET), 0);

[Severity: Low]
Should this skip instead of fail when the test lacks privileges?

unshare(CLONE_NEWNET) needs CAP_SYS_ADMIN. lo_set_up() calls
ioctl(SIOCSIFFLAGS), which needs CAP_NET_ADMIN. Both results go through
ASSERT_EQ, so an unprivileged run reports FAIL rather than SKIP.

The other tests in this binary (dump_extack, test_sanity,
close_in_progress, close_with_ref) only open netlink sockets, send dump
requests and use mq_open/mq_notify. They already run as a normal user, so
this is the first test that makes the binary need privileges.

Would checking for errno == EPERM and calling SKIP() be enough here?

> +
> +	inet_sock = socket(AF_INET, SOCK_DGRAM, 0);
> +	ASSERT_GE(inet_sock, 0);

[ ... ]

> +		for (nlh = (struct nlmsghdr *)buf; NLMSG_OK(nlh, n);
> +		     nlh = NLMSG_NEXT(nlh, n)) {
> +			if (nlh->nlmsg_seq != dump_links.nlhdr.nlmsg_seq)
> +				continue;
> +			if (nlh->nlmsg_type == NLMSG_ERROR)
> +				EXPECT_EQ(*(int *)NLMSG_DATA(nlh), 0);
> +			if (nlh->nlmsg_type == NLMSG_DONE)
> +				done = true;

[Severity: Low]
Can this pass when the dump ends with an error?

netlink_dump_done() writes the final dump status into the NLMSG_DONE
payload:

net/netlink/af_netlink.c:netlink_dump_done() {
    ...
	memcpy(nlmsg_data(nlh), &nlk->dump_done_errno, sizeof(nlk->dump_done_errno));
    ...
}

If cb->dump() returns -EMSGSIZE with an empty skb, netlink_dump() keeps
the negative value:

net/netlink/af_netlink.c:netlink_dump() {
    ...
		if (nlk->dump_done_errno == -EMSGSIZE && skb->len)
			nlk->dump_done_errno = skb->len;
    ...
}

The dump then ends with an NLMSG_DONE that carries -EMSGSIZE. Other
negative dump errors end the same way.

A dump that starts successfully sends no separate NLMSG_ERROR ack. That
makes the NLMSG_DONE payload the only place the result is reported. This
loop checks the errno only for NLMSG_ERROR, so EXPECT_TRUE(done) still
passes. The test also never checks that an RTM_NEWLINK reply for lo
arrived.

The no-progress case this test targets is still caught, because no DONE
arrives there. The gap is a future regression in skb sizing that ends the
dump early with an error.

The existing nl_get_extack() helper in this file decodes the errno from
NLMSG_DONE as well:

	ea->err = -*(int *)NLMSG_DATA(nlh);

Could the new test check the NLMSG_DONE payload in the same way, and also
check that at least one RTM_NEWLINK message was received?

> +		}
> +	}
> +	EXPECT_TRUE(done);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261023-netlink-dump-livelock-v1-0-478214a635d2%40gmail.com
