Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F933122D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772606260; cv=none; b=p2Gp3YDa6ZB1C2CKJF351Wdm/eChyDKb4d7r0ddhSnr9f6LAm+O6PFeL1ySYOQGX4AIEeY8670Su5HeO4zZnddiV8zCVZt76W+LyXRT483vC29icck88RoGU2CNSen6VDmzy5WDVFlMEhq2xBMl8q1bJmf9RhfIccPA9vvrylf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772606260; c=relaxed/simple;
	bh=lsIWMaQL/3whKexmrcJ91u/Whymn/Pb8xcsaW7Jb11M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InvbyxHv8Yd4qA8NpOPdZmPfN/xCrk4jzbM1W1VZ8CxTn/3fX63bniv5Y2mPXjfIHT89L/8CEmo5dH4J1ySV5EB2z8MqugzxH9U8inCkddiWsKV+AsOxHVzSwwNcVwWqdMnXb7mAW8AjY5+mzh1Y5PbJru6iSbxWAb5PG4Kni6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GhSM2U/8; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GhSM2U/8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772606256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VefZAyfd4lTF4RnV2A7nIRCdqG5nxtx9S7DWo98eaU=;
	b=GhSM2U/8YC96Es7pkV8cwof4OEYp+LUxYDTKPDho37h4hYPlF+IzxY2YlRhUCvJGQnuk6w
	heiudbs8dFsIptmC3EimiGBQ40Vd2s76Ts7IIN1FM7kZbfUZX5z7mjlSYfhWOj7lSYq4Py
	nOQWcshZ7LGy/9it3z5bsDgn4eK8Jmk=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	john.fastabend@gmail.com,
	jakub@cloudflare.com
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	David Ahern <dsahern@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Michal Luczaj <mhal@rbox.co>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v1 1/7] net: add splice_read to struct proto and set it in tcp_prot/tcpv6_prot
Date: Wed,  4 Mar 2026 14:33:52 +0800
Message-ID: <20260304063643.14581-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260304063643.14581-1-jiayuan.chen@linux.dev>
References: <20260304063643.14581-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add a splice_read function pointer to struct proto between recvmsg and
splice_eof. Set it to tcp_splice_read in both tcp_prot and tcpv6_prot.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 include/net/sock.h  | 3 +++
 net/ipv4/tcp_ipv4.c | 1 +
 net/ipv6/tcp_ipv6.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/include/net/sock.h b/include/net/sock.h
index 6c9a83016e95..de28af168ec4 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1317,6 +1317,9 @@ struct proto {
 					   size_t len);
 	int			(*recvmsg)(struct sock *sk, struct msghdr *msg,
 					   size_t len, int flags, int *addr_len);
+	ssize_t			(*splice_read)(struct socket *sock, loff_t *ppos,
+					       struct pipe_inode_info *pipe, size_t len,
+					       unsigned int flags);
 	void			(*splice_eof)(struct socket *sock);
 	int			(*bind)(struct sock *sk,
 					struct sockaddr_unsized *addr, int addr_len);
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index d53d39be291a..fa445f20b427 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -3433,6 +3433,7 @@ struct proto tcp_prot = {
 	.keepalive		= tcp_set_keepalive,
 	.recvmsg		= tcp_recvmsg,
 	.sendmsg		= tcp_sendmsg,
+	.splice_read		= tcp_splice_read,
 	.splice_eof		= tcp_splice_eof,
 	.backlog_rcv		= tcp_v4_do_rcv,
 	.release_cb		= tcp_release_cb,
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index e46a0efae012..277b954c524d 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -2295,6 +2295,7 @@ struct proto tcpv6_prot = {
 	.keepalive		= tcp_set_keepalive,
 	.recvmsg		= tcp_recvmsg,
 	.sendmsg		= tcp_sendmsg,
+	.splice_read		= tcp_splice_read,
 	.splice_eof		= tcp_splice_eof,
 	.backlog_rcv		= tcp_v6_do_rcv,
 	.release_cb		= tcp_release_cb,
-- 
2.43.0

