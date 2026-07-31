Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352E30B514;
	Fri, 31 Jul 2026 01:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461999; cv=none; b=cr5tKCV7leSfGy7rGhqW6ncwsm7v9KauBtTgOfbPtfpcxZwWZB+MBxSeypGYWTJ1eFOWhnc8nt15/lu3q6lvIf2XM3Z3WajByoRORCkBUO0wotzzfwq333vWhd1ngAnQsSmamiqFLUJ+l/7bWj0sRxkb6TZcOC3k9aZBfHeYZm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461999; c=relaxed/simple;
	bh=gmfOvQpg/29MvOXbEpr2ofG95JCpYbrLfEDUPVnB9LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlqfWp4aKCWsAbm0voKpJIAxNZdMrqpBtgmUvW9NxpeR91Uz35tSxIp1BGPOXC+wu+dbmoWo+CDkmvGe9dcEnZ50mkeIDxCFO5FY1tKYKHplT/fQm1GfLVxpmZBZBT/ntdebc5kOl9o7M7pdHDtUxizcK4Hl8Et4ChTGebfTQDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqqY33A4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqqY33A4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8501F00A3D;
	Fri, 31 Jul 2026 01:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785461996;
	bh=h37DEeA+2/1CIikSV0eAJaWf+BOkDP9LtZS32A9B50s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gqqY33A4GQRZ2QKwoPyQqh8XXm573IyKxHXDkOWcHMFtazCf7kPqDJZHoN/EnkRkl
	 1rE6GB8/QH7HIvISqHLtEFCvL2x6hRDn5FFnZPjrP2iBrgMJUAa/hNaoIN+dobgKm/
	 BgO9Bdxb5AQKIZQl4mdgcUb8aW+F/e6XJ00QUB2jTMdeiImd1F1VhIIEobvEMscg6X
	 X3yD855nw39G6YUq0vCkzZ67B8spJWQgdo7mP10ULJEbnSWMuvR7QUrZlH4mTst0AT
	 97NEFCixfFrUeCb4Haf+KReI8LWpAXN7SyR9pCtudHLZl9P4LFl1ayQe93/3affs4a
	 P6LEnfEFciecg==
From: Jakub Kicinski <kuba@kernel.org>
To: marcelomspessoto@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	marcelospe@proton.me
Subject: Re: [PATCH net-next 3/4] selftests: net: test IPV6_FL_F_REFLECT
Date: Thu, 30 Jul 2026 18:39:55 -0700
Message-ID: <20260731013955.752403-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727043516.93101-4-marcelospe@proton.me>
References: <20260727043516.93101-4-marcelospe@proton.me>
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
--- Patch [3]: [PATCH net-next 3/4] selftests: net: test IPV6_FL_F_REFLECT ---
commit 9b79debc5b7eacef4cf0bdc8e171841fff374daf
Author: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>

selftests: net: test IPV6_FL_F_REFLECT

This adds a REFLECT sub-test to tools/testing/selftests/net/ipv6_flowlabel_mgr.c,
reusing the existing tcp_listen()/tcp_connect() helpers to set up a connection.
A new set_flowlabel_consistency() helper toggles
/proc/sys/net/ipv6/flowlabel_consistency around the new test block, since the
kernel refuses IPV6_FL_F_REFLECT while that sysctl is enabled.

A few questions below.

> Author: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
> Signed-off-by: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>

[Severity: Low]
The author address in the commit header (marcelomspessoto@gmail.com) does not
match the Signed-off-by address (marcelospe@proton.me), which checkpatch
reports as "email address ... from: does not match Signed-off-by". Since the
Developer's Certificate of Origin is tied to the author identity, could the
From:/Signed-off-by be made consistent (or both addresses listed) so the patch
can be applied?

> diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> index 383a84ea9385c..da253dff2cfd4 100644
> --- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> +++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c

[ ... ]

> @@ -138,6 +139,19 @@ static void tcp_connect(int listener, uint32_t flowlabel, int *client, int *acce
>  	*accepted = afd;
>  }
>  
> +static void set_flowlabel_consistency(bool enable)
> +{
> +	int fd;
> +
> +	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_WRONLY);
> +	if (fd == -1)
> +		error(1, errno, "open flowlabel_consistency");

[Severity: Low]
Should an unavailable or unwritable sysctl be a skip rather than a hard
failure? Any open()/write()/close() error here calls error(1, ...), which
exits the whole ipv6_flowlabel_mgr binary with status 1, so kselftest reports
FAIL rather than SKIP (exit code 4).

Before this patch the binary only issued setsockopt()/getsockopt() and needed
no privileges, and it already degrades gracefully elsewhere:

		if (setuid(USHRT_MAX)) {
			fprintf(stderr, "[INFO] skip setuid child test\n");
			exit(0);
		}

With this change, environments without a writable /proc/sys hierarchy
(CONFIG_SYSCTL=n, /proc not mounted or read-only, restricted container, no
CAP_NET_ADMIN over the netns) turn all the pre-existing, unrelated flowlabel
management assertions into a FAIL. Could only the REFLECT sub-test be skipped
in that case?

> +	if (write(fd, enable ? "1" : "0", 1) != 1)
> +		error(1, errno, "write flowlabel_consistency");
> +	if (close(fd))
> +		error(1, errno, "close flowlabel_consistency");
> +}

[Severity: Medium]
Does this leave net.ipv6.flowlabel_consistency permanently at 0 in the
namespace the test ran in?

Two things stand out. First, the helper never reads the current value, so
set_flowlabel_consistency(true) is a hardcoded write of "1" rather than a
restore, and an administrator's deliberate 0 is silently overwritten even on
success.

Second, everything between the disable and the "restore" in run_tests() aborts
the process on failure, so the restore is skipped entirely:

#define __expect(x)							\
	do {								\
		if (!(x))						\
			fprintf(stderr, "[OK]   " #x "\n");		\
		else							\
			error(1, 0, "[ERR]  " #x " (line %d)", __LINE__); \
	} while (0)

and tcp_listen()/tcp_connect() likewise call error(1, errno, ...) on
socket/bind/listen/connect/accept failure. There is no atexit() or signal
handler, so any failing assertion (or a signal) exits with the sysctl still 0.

That direction is fail-open, since ipv6_flowlabel_get() only rejects the flag
while the sysctl is set:

net/ipv6/ip6_flowlabel.c:ipv6_flowlabel_get() {
	if (freq->flr_flags & IPV6_FL_F_REFLECT) {
		if (READ_ONCE(net->ipv6.sysctl.flowlabel_consistency)) {
			net_info_ratelimited("Can not set IPV6_FL_F_REFLECT if flowlabel_consistency sysctl is enable\n");
			return -EPERM;
		}
}

Under ipv6_flowlabel.sh the throwaway netns from in_netns.sh absorbs the leak,
but ipv6_flowlabel_mgr is installed as a standalone TEST_GEN_FILES binary with
its own option parsing and is commonly run directly, in which case the writes
land in the caller's (typically init_net) namespace and persist after the test.

Would it fit the existing convention better to set the prerequisite from the
wrapper script inside the namespace, the way the other sysctls in this suite
are handled?

  ./in_netns.sh \
    sh -c 'sysctl -q -w net.ipv6.auto_flowlabels=0 && ./ipv6_flowlabel -l 1'

>  static void run_tests(int fd)
>  {
>  	int wstatus;

[ ... ]

> @@ -254,6 +268,37 @@ static void run_tests(int fd)
>  	close(remote_afd);
>  	close(remote_cfd);
>  	close(remote_listener);
> +
> +	explain("Prepare TCP SYN for REFLECT flag validation");
> +	set_flowlabel_consistency(false);
> +	int reflect_listener = tcp_listen();
> +	struct in6_flowlabel_req reflect_on = {
> +		.flr_action = IPV6_FL_A_GET,
> +		.flr_flags = IPV6_FL_F_REFLECT,
> +	};
> +	explain("Enable REFLECT on the listener before the client connects");
> +	expect_pass(setsockopt(reflect_listener, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_on, sizeof(reflect_on)));

[Severity: Low]
This isn't a bug, but three of the new assertion lines exceed the 100 column
limit checkpatch enforces (counting the leading tab as 8 columns): the
setsockopt() line above is around 113 columns, the getsockopt() line below is
around 111, and the two lines using &reflect_off are around 110. The
pre-existing REMOTE block stays under the limit. Wrapping the arguments or
shortening the variable names would address it.

> +	int reflect_cfd, reflect_afd;
> +	tcp_connect(reflect_listener, 7, &reflect_cfd, &reflect_afd);
> +	struct in6_flowlabel_req reflect_query = {
> +		.flr_action = IPV6_FL_A_GET,
> +	};
> +	socklen_t reflect_query_len = sizeof(reflect_query);
> +	explain("Query the accepted socket's outgoing label, should be reflected");
> +	expect_pass(getsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_query, &reflect_query_len));
> +	expect_pass(ntohl(reflect_query.flr_label) != 7);

[Severity: Low]
Does this line assert the opposite of what it reads as? expect_pass() is
__expect(), which succeeds when the expression is false:

#define __expect(x)							\
	do {								\
		if (!(x))						\
			fprintf(stderr, "[OK]   " #x "\n");		\
		else							\
			error(1, 0, "[ERR]  " #x " (line %d)", __LINE__); \
	} while (0)

#define expect_pass(x)	__expect(x)

So this passes only when ntohl(reflect_query.flr_label) == 7, which is the
intended check, but the failure diagnostic prints
"[ERR]  ntohl(reflect_query.flr_label) != 7", i.e. the inverse of the real
expectation. Someone later "fixing" the condition to == 7 would silently
invert the test so it passes exactly when reflection is broken.

The macro was written for syscall return codes where 0 means pass; would an
explicit comparison spelled out as a return-code style check, or a separate
value-comparison macro, be clearer here? The same idiom was introduced by the
earlier REMOTE patch in this series
(expect_pass(ntohl(freq.flr_label) != 6)), so both could be adjusted together.

> +	struct in6_flowlabel_req reflect_off = {
> +		.flr_action = IPV6_FL_A_PUT,
> +		.flr_flags = IPV6_FL_F_REFLECT,
> +	};
> +	explain("PUT+REFLECT disables reflection on the accepted socket");
> +	expect_pass(setsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off)));
> +	explain("cannot disable reflection twice");
> +	expect_fail(setsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off)));
> +	set_flowlabel_consistency(true);
> +	close(reflect_afd);
> +	close(reflect_cfd);
> +	close(reflect_listener);
>  }
