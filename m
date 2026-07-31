Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB6930ACE3;
	Fri, 31 Jul 2026 01:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461999; cv=none; b=E/nLIkL1M5Y1Qz4U2nVaIKIL5rVB2n1LikpaJrSDef0qbQNoaK1Dmg4YSWdJ0p32zJPfwW+HAvMbreIfU9j971Tvq9D2kLkJ2ca6hbXqsySJ+f6Qm4BSRjNfyF1p5OsE11IZcjA8fLxviNVPdMlK75zFB6aYg3+lQFCMn75V22I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461999; c=relaxed/simple;
	bh=gY6X8uEij57KXJyJ5Z5kcs8ZsGQaF2m1n6FBnBAQ3Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8DQy02s2OtjdRBRVvY+BLCUcCcqjQRM++W9PGhdpCqiQ446tZOLD14ad3yzBaAzteopU1MHgeu2m8sK3uqUJa4nvgtDGLe+1lnO2t9VPzzjdeP39yraONcLRwOUNKRJpFeyVbxhuKvpfoyMYEUAYGvRTqHJ5IPzY35Zjuqvmag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cy2s4PRc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cy2s4PRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE731F00A3A;
	Fri, 31 Jul 2026 01:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785461995;
	bh=MhIAcRFSztCQ88yI2Cr8ThlB4x3VsspipGLTHzBz9BA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cy2s4PRc+REaqz1I/iEWDyt6E3c0KfwvH2fpZdPj9PGHQsmtaSlhbGQ2rcMDEVtT5
	 IS0XzYYbL8HNxtQ7RN06uMwoEtQkH5qbPofZicYOyc2KtCcqANOD9VEUGaZI8in62k
	 F4Bivj6oBRC6tQyxDsr4GOAJXyOOVyY81Oqsf5a5ES6oTThHblafzNywxgFWWa3kvn
	 i2l32j+plZ+SvrqY4zAw2Ycz+U7GG9mhNmAqz4agyvbqiQghMsCjQjBKB+zUEdcJbB
	 oFmxFYRVbuP+eUHFcUCemQLljHVtyDoI1kjSCGT1Gt8LJ5rwy40rmZjT1ZRUKXsuIC
	 VrVu5k/SVyiNQ==
From: Jakub Kicinski <kuba@kernel.org>
To: marcelomspessoto@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	marcelospe@proton.me
Subject: Re: [PATCH net-next 2/4] selftests: net: test IPV6_FL_F_REMOTE
Date: Thu, 30 Jul 2026 18:39:54 -0700
Message-ID: <20260731013954.752355-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727043516.93101-3-marcelospe@proton.me>
References: <20260727043516.93101-3-marcelospe@proton.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
--- Patch [2]: [PATCH net-next 2/4] selftests: net: test IPV6_FL_F_REMOTE ---
commit bdc4decc572fa37fb4ef0e74f408cc6167e8342d
Author: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>

selftests: net: test IPV6_FL_F_REMOTE

This adds coverage for the IPV6_FL_F_REMOTE flag of IPV6_FLOWLABEL_MGR by
setting up a loopback TCP connection with a flow label on the SYN and then
querying the accepted socket with getsockopt().  The connection setup is
factored into two new helpers, tcp_listen() and tcp_connect().

A few questions below.

[Severity: Low]
The commit message says:

  "This flag retrieves the latest label received by the socket with
   a getsockopt query."

Does the new test actually cover the "latest label" part?

ipv6_flowlabel_opt_get() in net/ipv6/ip6_flowlabel.c returns
np->rcv_flowinfo masked with IPV6_FLOWLABEL_MASK.  For TCP, rcv_flowinfo is
set unconditionally for the child socket from the SYN in
tcp_v6_syn_recv_sock():

  net/ipv6/tcp_ipv6.c:tcp_v6_syn_recv_sock() {
      ...
      newnp->rcv_flowinfo = ip6_flowinfo(ipv6_hdr(skb));
      ...
  }

and it is only refreshed later, in tcp_v6_do_rcv(), when rxflow or rxtclass
are enabled on the socket:

  net/ipv6/tcp_ipv6.c:tcp_v6_do_rcv() {
      ...
      if (np->rxopt.bits.rxflow || np->rxopt.bits.rxtclass)
              np->rcv_flowinfo = ip6_flowinfo(ipv6_hdr(opt_skb));
      ...
  }

The new test queries the accepted socket right after accept(), never sets
IPV6_FLOWINFO or IPV6_TCLASS on it, and never exchanges data afterwards, so
only the SYN-time value is observed and the refresh path above would remain
untested.  Would it make sense to either extend the test (enable
IPV6_FLOWINFO on the accepted socket and send data carrying a second label)
or reword the commit message to say the label seen at connection setup?

> diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> index cfa7e6270994a..383a84ea9385c 100644
> --- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> +++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c

[ ... ]

> @@ -82,6 +92,52 @@ static int flowlabel_renew(int fd, uint32_t label, uint16_t linger)

[ ... ]

> +static void tcp_connect(int listener, uint32_t flowlabel, int *client, int *accepted)
> +{
> +	INIT_SIN6_LOOPBACK(addr);
> +	const int one = 1;
> +	int cfd, afd;
> +
> +	cfd = socket(PF_INET6, SOCK_STREAM, 0);
> +	if (cfd == -1)
> +		error(1, errno, "socket client");
> +
> +	if (flowlabel_get(cfd, flowlabel, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE))
> +		error(1, errno, "flowlabel_get");

[Severity: Low]
Should this get be paired with the existing flowlabel_put() helper?

Every other test in this file pairs get and put explicitly, but tcp_connect()
only releases the label implicitly through close(cfd).  That path goes
fl6_free_socklist() -> fl_release(), and fl_release() applies the linger
timeout rather than freeing the label right away:

  net/ipv6/ip6_flowlabel.c:fl_release() {
      ...
      fl->lastuse = jiffies;
      if (atomic_dec_and_test(&fl->users)) {
              unsigned long ttd = fl->lastuse + fl->linger;
      ...
  }

So the label value stays reserved for roughly FL_MIN_LINGER seconds after the
helper's socket is closed.  The commit message says the helpers exist so other
features such as IPV6_FL_F_REFLECT can reuse them; wouldn't a second
tcp_connect(listener, 6, ...) in the same run then fail in flowlabel_get()
with IPV6_FL_S_EXCL|IPV6_FL_F_CREATE and abort the whole binary via
error(1, ...)?  Adding flowlabel_put(cfd, flowlabel) before closing the client
socket, or making the share mode a parameter, would match the style used
elsewhere in this file.

> +	if (setsockopt(cfd, SOL_IPV6, IPV6_FLOWINFO_SEND, &one, sizeof(one)))
> +		error(1, errno, "setsockopt flowinfo_send");
> +	addr.sin6_flowinfo = htonl(flowlabel);
> +
> +	if (connect(cfd, (void *)&addr, sizeof(addr)))
> +		error(1, errno, "connect");
> +
> +	afd = accept(listener, NULL, NULL);
> +	if (afd == -1)
> +		error(1, errno, "accept");
> +
> +	*client = cfd;
> +	*accepted = afd;
> +}
> +
>  static void run_tests(int fd)
>  {
>  	int wstatus;
> @@ -183,6 +239,21 @@ static void run_tests(int fd)
>  		expect_fail(flowlabel_get(fd, 5, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));
>  	}
>  
> +	explain("Prepare TCP SYN for REMOTE flag validation");
> +	int remote_listener = tcp_listen();
> +	int remote_cfd, remote_afd;

[Severity: Low]
This isn't a bug, but these declarations come after executable statements,
while run_tests() already declares wstatus and pid at the top of the function
and the rest of the file uses top-of-block declarations.  selftests/net
CFLAGS do not turn on -Wdeclaration-after-statement so it builds, but hoisting
remote_listener, remote_cfd, remote_afd, freq and freq_len to the top of
run_tests() (or putting the new test in its own block) would keep the style
consistent with no change in behaviour.

> +	tcp_connect(remote_listener, 6, &remote_cfd, &remote_afd);
> +	struct in6_flowlabel_req freq = {
> +		.flr_action = IPV6_FL_A_GET,
> +		.flr_flags = IPV6_FL_F_REMOTE,
> +	};
> +	socklen_t freq_len = sizeof(freq);
> +	explain("Query for label sent by client with IPV6_FL_F_REMOTE");
> +	expect_pass(getsockopt(remote_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &freq, &freq_len));
> +	expect_pass(ntohl(freq.flr_label) != 6);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Is this assertion written the way it was intended?

expect_pass() succeeds when its argument evaluates to zero:

  #define __expect(x)						\
	do {							\
		if (!(x))					\
			fprintf(stderr, "[OK]   " #x "\n");	\
		else						\
			error(1, 0, "[ERR]  " #x " (line %d)", __LINE__); \
	} while (0)

  #define expect_pass(x)	__expect(x)
  #define expect_fail(x)	__expect(!(x))

So expect_pass(ntohl(freq.flr_label) != 6) passes exactly when the label is
6, which is the intended check, but it reads as the opposite and the log line
printed on success is "[OK]   ntohl(freq.flr_label) != 6".  Every other use of
expect_pass()/expect_fail() in this file passes a setsockopt()/getsockopt()
return code rather than a value comparison.

Would a plain check be clearer here, for example:

  if (ntohl(freq.flr_label) != REMOTE_LABEL)
	error(1, 0, "unexpected remote flowlabel %u", ntohl(freq.flr_label));

Also, the expected label appears twice as a bare literal, in
tcp_connect(remote_listener, 6, ...) and in the comparison against 6.  Could a
named constant be used at both sites so they cannot drift apart?

> +	close(remote_afd);
> +	close(remote_cfd);
> +	close(remote_listener);
>  }
