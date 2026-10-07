Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C363F4DE2;
	Wed,  7 Oct 2026 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353705; cv=none; b=ovkTghis6gF1r7RAgTNpEpiqEj40n5XvsFXJDieMLaLZFTAiTVZYeNc6FRVEaRjNALk/Gk+XskJGv9yIvoKu5dMThYTtJSz7hnjQ6Ow7yHrP/XQjazq7AGXOomGBgumXu4i2IWpTpcuJ1Q8zSerKlJaSU/8NyJvO+WZKskhmkZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353705; c=relaxed/simple;
	bh=jz3JTIH9cnjR89bcm1Z7dcWOKNi8RvAZjX96fTjgyp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=We5gXBHmjMkWcKEUw6xu9cZ9YFwN9Wy1GHWd9RZto/LP0o858OgJCyLJlyJhS7AojCsoijhta+cEXMvj6NKHA6xEK7XPyqX7eFpTcc5GD9/tRoq4Bc78uY48S/3xG3dIGn5P2Dm9Lck1bQFDtttD2RAFX/gHd+c8p8Ep4TJ7C7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Szg3DE3a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Szg3DE3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB32B1F0089B;
	Wed,  7 Oct 2026 06:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791353703;
	bh=t8A8MODsa9K7Ase1/BF1LKsGRvpJ5GDk5tI8fsiCzEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Szg3DE3aF5rNJK1zY7kGdYrXHmzlC+QmV8uzUOAPa5s4TG3S9qskUbYuSh7k4jDTx
	 HoOyitgdeawWcAg9EuEOIRMCRW6haMT0SKyTaQVkukayNzVrFE6VY/FA1lZlvc3jEg
	 SQxf2sMq5ieANg+Mniew8Db+sfADqzsMA/uT45BaFxXML0XK+JlYb+I53RepfBe+FL
	 ZhcqMxgBL7aXEs57hWfGJQKnvjoC2rEml5Jr0tInnwNHjllzko3cctoS/HQ+J/3AkQ
	 SwtuQWmTBZSI4jwmg1mWcwWV/EHd5aluXRZPqdn/CdEYDpHh7xStTHr5R86r2VCKo0
	 TLwcpXJcYioMA==
Message-ID: <9b4b59ac-6e64-4dd2-88c1-c3f7844bbd36@kernel.org>
Date: Wed, 7 Oct 2026 08:14:56 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/net: test tcp_rmem lower bound
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007054508.1059927-1-sahaj123.sc@gmail.com>
Content-Language: en-US
From: Eric Dumazet <edumazet@kernel.org>
In-Reply-To: <20261007054508.1059927-1-sahaj123.sc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/7/26 07:45, Sahaj Chaudhari wrote:
> Exercise a tcp_rmem default below 4096 and verify that it is rejected.
> A tiny default can make TCP receive-window accounting space zero and
> trigger a divide-by-zero when the receive buffer grows.
> 
> Run the test in a fresh network namespace and verify that rejection
> leaves the setting unchanged.
> 
> Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
> ---
>   tools/testing/selftests/net/.gitignore     |  1 +
>   tools/testing/selftests/net/Makefile       |  1 +
>   tools/testing/selftests/net/tcp_rmem_min.c | 78 ++++++++++++++++++++++
>   3 files changed, 80 insertions(+)
>   create mode 100644 tools/testing/selftests/net/tcp_rmem_min.c
> 
> diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
> index dacd36ed8455..44de061e3eef 100644
> --- a/tools/testing/selftests/net/.gitignore
> +++ b/tools/testing/selftests/net/.gitignore
> @@ -48,6 +48,7 @@ tcp_fastopen_backup_key
>   tcp_inq
>   tcp_mmap
>   tcp_port_share
> +tcp_rmem_min
>   tfo
>   timestamping
>   tls
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 590b33e16d9f..595f0e6c38b0 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -198,6 +198,7 @@ TEST_GEN_PROGS := \
>   	so_incoming_cpu \
>   	tap \
>   	tcp_port_share \
> +	tcp_rmem_min \
>   	tls \
>   	udp_splice_checksum \
>   # end of TEST_GEN_PROGS
> diff --git a/tools/testing/selftests/net/tcp_rmem_min.c b/tools/testing/selftests/net/tcp_rmem_min.c
> new file mode 100644
> index 000000000000..dd2305d7e599
> --- /dev/null
> +++ b/tools/testing/selftests/net/tcp_rmem_min.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <sched.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "kselftest.h"
> +
> +#define TCP_RMEM_PATH "/proc/sys/net/ipv4/tcp_rmem"
> +
> +static int read_tcp_rmem(char *buf, size_t size)
> +{
> +	int fd = open(TCP_RMEM_PATH, O_RDONLY | O_CLOEXEC);
> +	ssize_t len;
> +
> +	if (fd < 0)
> +		return -1;
> +
> +	len = read(fd, buf, size - 1);
> +	close(fd);
> +	if (len < 0)
> +		return -1;
> +
> +	buf[len] = '\0';
> +	return 0;
> +}
> +
> +int main(void)
> +{
> +	/* tcp_rmem is min, default, max; keep min valid and lower the default. */
> +	static const char invalid_default[] = "4096 1 6291456";
> +	char before[128], after[128];
> +	ssize_t len;
> +	int fd, write_errno;
> +
> +	ksft_print_header();
> +	ksft_set_plan(1);
> +
> +	if (unshare(CLONE_NEWNET)) {
> +		if (errno == EPERM || errno == EACCES)
> +			ksft_exit_skip("network namespace unavailable\n");
> +		ksft_exit_fail_perror("unshare(CLONE_NEWNET)");
> +	}
> +
> +	if (read_tcp_rmem(before, sizeof(before)))
> +		ksft_exit_fail_perror("read tcp_rmem before write");
> +
> +	fd = open(TCP_RMEM_PATH, O_WRONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		ksft_exit_fail_perror("open tcp_rmem");
> +
> +	len = write(fd, invalid_default, sizeof(invalid_default) - 1);
> +	write_errno = errno;
> +	close(fd);
> +
> +	if (len >= 0) {
> +		ksft_test_result_fail("tcp_rmem accepted a default below 4096\n");
> +		ksft_finished();
> +	}
> +	if (write_errno != EINVAL && write_errno != ERANGE) {
> +		errno = write_errno;
> +		ksft_exit_fail_perror("write tcp_rmem");
> +	}
> +
> +	if (read_tcp_rmem(after, sizeof(after)))
> +		ksft_exit_fail_perror("read tcp_rmem after rejected write");
> +	if (strcmp(before, after)) {


I do not think we want one selftest per sysctl range check.

net/ has more than 500 sysctls, most of them with bounds. A test
asserting that tcp_rmem's lower bound is 4096 only restates the table,
and proc_dointvec_minmax() itself is already covered by
tools/testing/selftests/sysctl.

This does not scale: each of these adds a binary, a CI slot and
something to maintain. This one already breaks if tcp_rmem[0] is not
4096 (PAGE_SIZE > 4K, or tuned host), because elements are stored one
by one and the rejected write still changes the min.

What would be useful is a single generic test: in a fresh netns, walk
the writable /proc/sys/net entries, set each to the extreme values the
kernel accepts, run some loopback TCP/UDP traffic, and check that
nothing splats. No bounds to duplicate, new sysctls covered for free,
and it would have caught the divide by zero fixed in commit
83a945a529d6 ("tcp: do not let tcp_rmem be set below 4096").

Thanks.

pw-bot: cr

