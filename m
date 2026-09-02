Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE3B38F929;
	Wed,  2 Sep 2026 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333391; cv=none; b=T/HHRKHfKje4ymILhFdFkQtqaCdyZFIR6byFU98dBao8zAdz6upZPYylBl+mkdE7pz1SW+L0NYsTBIMAmGLVXRJg0KnUwmNPqAk34R3A4oqnq1KZHwtyll3SkxUGiiTFwU0uwtbF80Fr8q8QAjDD/1I3pOROnlTtQ4LKg0367u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333391; c=relaxed/simple;
	bh=vlCUORUrkFxC2f8FPjXKAu56xwLksBmkaS5jHDrYj7U=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GjM4h+vuWzTe2lf+xNV8f8FZe626L0iUV5oLflUtoMNvwtprKM+JaMGnGGI/YnEI2Z3JLdUZ78YYXVC26DKnWUDYAudd1hgOIDpdR2VSc6TyF+vlAfCXw+vFAxul45bXoNWXJUpjSWUsbo6jZOWMY0M1IB1VEQp3DWsg+boFe+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ui+4q7Nx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ui+4q7Nx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67B31F00AC4;
	Wed,  2 Sep 2026 07:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788333388;
	bh=yVPU+hlOscZWW1rX8y1wh88T+GrbWAwzNbcQ70O8j+o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ui+4q7NxLbnPuEsNHRur2uETW6DiCmw1djJ85IJkgui5ivpZssCbH3YKS7Msaj8o5
	 S3eS5TxNbpgDsAwCbHQXuvEassRBqZtYLT6EptMcLtZW4kWJ5QWt1NV8ixt6UMA0l3
	 kb8v8OKuoNgakfoY3tOb3lLnhY6OAQN40+2DsYsKhwuMQilcoqlqtkyrytxqPxWTpG
	 Q4ikFmMISq4urhJjDgfWndIRcoXTAHO8yAYW5U/1u4NifEfUj7RuKUVj/VbFQUkcYh
	 BSU5VieAI819cBuTHm83P0ek2cbBCAtP/ta0ZBJKBcOMG3V+Ryd5ScRbrhomFHUAPn
	 vb+NdWhIHBt/g==
Subject: Re: [net-next] selftests: net: csum: filter packets by source address
 and port
From: netdev-bot+sashiko@kernel.org
To: willemdebruijn.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com
Date: Wed, 02 Sep 2026 07:16:27 +0000
Message-ID: <178833338726.3394541.13779692240559712632@kernel.org>
In-Reply-To: <20260831210128.1359978-1-willemdebruijn.kernel@gmail.com>
References: <20260831210128.1359978-1-willemdebruijn.kernel@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 0 · Low: 0

- [High] Incomplete fix: the patch adds source-address/source-port
  filtering only to the PF_PACKET verification path…

--

selftests: net: csum: filter packets by source address and port

The csum receiver now checks the source address and source port in
recv_verify_packet_tcp(), recv_verify_packet_udp(), recv_verify_packet_ipv4()
and recv_verify_packet_ipv6(), skipping non-matching packets. It also adds a
20us inter-packet delay in do_tx() and drops a stale comment at the top of
the file.

> diff --git a/tools/testing/selftests/net/lib/csum.c b/tools/testing/selftests/net/lib/csum.c
> index e28884ce3ab39..139465054f85a 100644
> --- a/tools/testing/selftests/net/lib/csum.c
> +++ b/tools/testing/selftests/net/lib/csum.c

[ ... ]

> @@ -647,6 +649,9 @@ static int recv_verify_packet_udp(void *th, int len)
>  		return recv_verify_packet_udp_encap(udph + 1,
>  						    len - sizeof(*udph));
>  
> +	if (!cfg_zero_sum && udph->source != htons(cfg_port_src))
> +		return -1;
> +
>  	return recv_verify_csum(th, len, ntohs(udph->source), udph->check);
>  }

[Severity: High]
Does this cover the second receive path used by the UDP tests?

For cfg_proto == IPPROTO_UDP the test also opens a real SOCK_DGRAM socket in
recv_prepare_udp() and drains it in recv_udp(). That socket is only bound to
the local address and cfg_port_dst; there is no connect() to the sender and
recv_udp() uses plain recv() without inspecting the peer:

tools/testing/selftests/net/lib/csum.c:recv_prepare_udp() {
	fd = socket(cfg_family, SOCK_DGRAM, 0);
	...
	if (bind(fd, (void *)&cfg_daddr4, sizeof(cfg_daddr4)))
		error(1, errno, "bind r");
}

tools/testing/selftests/net/lib/csum.c:recv_udp() {
	while (1) {
		ret = recv(fd, buf, sizeof(buf), MSG_DONTWAIT);
		...
		count++;
	}
}

do_rx() then turns that count into a hard failure in exactly the -E case this
patch targets:

tools/testing/selftests/net/lib/csum.c:do_rx() {
	if (cfg_proto == IPPROTO_UDP)
		count_udp += recv_udp(fdr);
	...
	if (cfg_bad_csum && count_udp)
		error(1, 0, "rx: unexpected packets at udp");
}

The test's own crafted bad-checksum datagrams are dropped by the kernel UDP
checksum check, so count_udp is expected to stay zero. An unrelated
background datagram sent to the local address at cfg_port_dst with a valid
checksum is delivered to this socket and counted, and the test aborts. The
in-tree cases ipv4_rx_udp_invalid and ipv6_rx_udp_invalid in
tools/testing/selftests/drivers/net/hw/csum.py run csum with -E and UDP, so
they still appear exposed to background traffic after this change.

Would it make sense to also connect() the receive UDP socket to
cfg_saddr:cfg_port_src, or use recvfrom() and drop datagrams whose peer does
not match, with the same cfg_zero_sum exception used above since the source
port is computed at send time in that mode?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831210128.1359978-1-willemdebruijn.kernel%40gmail.com
