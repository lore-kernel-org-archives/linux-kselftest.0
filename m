Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D40389111;
	Thu, 20 Aug 2026 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223476; cv=none; b=IiCpUo5Le/wrXHxf9eI1d+fag96tMMz4lEhJmjL+Zv14v5bWentYdNQTZyk547a26OZxdIPuqZappt45podxvSbYb0DdyHKBAN/gUumMQ4EojsdZtIYqwsJoIMQ900iP/65g5j0N8S0mRwxM8HkHxnUFer6+jOLZ8XncWazBi/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223476; c=relaxed/simple;
	bh=LPCaldm1q4JDm8FZLdWWbyaeIP6P1AL+d9WYWPyUt9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZbt/4F6bvXNM/VF+MnCpkqGB4gWZImwc5m/8z3xdXumUDNW29pUx5pgswQzt0ZOu3R2YYvkGoFt67dXlovyM1a72lqGizQK5WHqOUumqiC6hfsb/MRiM7ehX1bExOr9JmO9GTrnPTKdXDl0ls4fV6ve7ZPMHwYZBsdVkF6NDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKEUBudo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKEUBudo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465FF1F000E9;
	Thu, 20 Aug 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787223474;
	bh=SD5iTaJbc9q/M3QLf1krpo13nJxVMOZPGPuInSi7uu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nKEUBudoL/z+PvJxHEUPgdsLzUwBgEvEOex5lRNUtYeHBuDpVPZtvxCIoj489g2bt
	 aklW1DgzWo+yoEMQ0DUC9wXUOW/KdTnnuIWmQeTb6xnnv/ttEdUdC2Z9yMVrGA7Uh2
	 GByTkM9vh8PYAgbN+MZ0UABSRW0j0jhN54oMj+ooPGmd246gHSr4kXF2bJNhezeE0Q
	 QzyvElnOl6VvNNSoRpixQKJGZ3/4iRPzswM49zj3PjZRT6dtUEq4o3rJOg4oeP1uaw
	 bQYRXznCZO7rpPJ2CW632BBnAUaKfMGZo9ZHq7z98e7jDvbeDXP/1zMyJ51HwN3L3y
	 vJidVCcus+VJQ==
From: Simon Horman <horms@kernel.org>
To: fffsqian@163.com
Cc: Simon Horman <horms@kernel.org>,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	sjpark@amazon.de,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	fuqingshuang@kylinos.cn
Subject: Re: [PATCH] selftests/net: fix kill() argument order in fin_ack_lat
Date: Thu, 20 Aug 2026 11:57:01 +0100
Message-ID: <20260820105702.803812-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817091017.281104-1-fffsqian@163.com>
References: <20260817091017.281104-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260817091017.281104-1-fffsqian@163.com?part=1
---
--- Patch [1]: [PATCH] selftests/net: fix kill() argument order in fin_ack_lat ---
commit c8d7888fff6c43f1844cd283115315b6ce892cad
Author: Qingshuang Fu <fuqingshuang@kylinos.cn>

selftests/net: fix kill() argument order in fin_ack_lat

The patch swaps the arguments of the kill() call in sig_handler() so the
server forwards SIGTERM to the client instead of passing a pid as the
signal number, and adds a child_pid > 0 guard so the client (which
inherits the handler and sees child_pid == 0) does not signal the whole
process group.

> diff --git a/tools/testing/selftests/net/fin_ack_lat.c b/tools/testing/selftests/net/fin_ack_lat.c
> index 70187494b57af..f985e01354b44 100644
> --- a/tools/testing/selftests/net/fin_ack_lat.c
> +++ b/tools/testing/selftests/net/fin_ack_lat.c
> @@ -103,7 +103,8 @@ static void server(int sock, struct sockaddr_in address)
>  
>  static void sig_handler(int signum)
>  {
> -	kill(SIGTERM, child_pid);
> +	if (child_pid > 0)
> +		kill(child_pid, SIGTERM);
>  	exit(0);
>  }

[Severity: Low]
[Finding: main-2-1]
[Sources: opus-5]
Now that the forwarding actually works, can the wrapper script's cleanup
path start failing?  Both processes carry the comm name fin_ack_lat
because main() forks:

  child_pid = fork();
  if (!child_pid)
          client(ntohs(laddr.sin_port));
  else
          server(sock, laddr);

so pidof returns two pids in fin_ack_lat.sh:

  set -e
  ...
  cleanup() {
          kill $(pidof fin_ack_lat)
          rm -f $tmpfile
  }

  trap cleanup EXIT

If bash signals the server pid first, the server now runs sig_handler(),
forwards SIGTERM to the client and exits.  The client then exits, is
reparented to init and reaped.  If that completes before bash issues the
second kill(2), the builtin gets ESRCH and returns non-zero.

With set -e in effect, wouldn't that abort the EXIT trap, so the script
exits non-zero even when do_test() saw zero spikes, and rm -f $tmpfile is
skipped, leaving /tmp/fin_ack_latency.*.log behind?

Before this change the forwarding call always failed with EINVAL, so the
client was still alive when bash reached its pid and this window did not
exist.  Would it make sense to make the wrapper tolerant, for example
kill $(pidof fin_ack_lat) 2>/dev/null || true, or to kill only the server
pid?

[Severity: Medium]
[Finding: gpt-5-6-sol-3-4]
[Sources: gpt-5-6-sol, opus-5]
This isn't a bug introduced by this patch, but the new child_pid > 0 guard
is the only place the fork() failure sentinel is considered, and it handles
it by doing nothing.  main() never checks fork() for failure:

  child_pid = fork();
  if (!child_pid)
          client(ntohs(laddr.sin_port));
  else
          server(sock, laddr);

On failure child_pid is -1, the !child_pid test is false, and the process
falls into server()'s infinite accept() loop with no client ever
connecting, so nothing is printed.

fin_ack_lat.sh's do_test() only counts lines and treats an empty log as
success:

  NR_SPIKES=$(wc -l $tmpfile | awk '{print $1}')
  if [ $NR_SPIKES -gt 0 ]

so a fork() failure (EAGAIN/ENOMEM, RLIMIT_NPROC) is scored as a passing
test.  Since this file already uses error() for every other syscall, would
adding if (child_pid < 0) error(-1, errno, "fork"); be appropriate here?
-- 
pw-bot: changes-requested
