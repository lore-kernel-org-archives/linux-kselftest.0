Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329160;
	b=vxB5B8OIXfC+b04s9GdtN/+ktVfdzlZhlRNsIIOSUVfFeitH41UUYHcWfaFVCPqLeiPx
	 Vh+/Cg+5KD1K0WyJnXMuYEzcUvWtyvCblre3006uXl/kQxG3Ni3HeIyPyS4InBMs5iJk9
	 Ri50cbRp00nQXzC5HLhtXDnAwQeTb9bSxIcSyBq1Xh4ihFd51I+NHwoxr9n9LhDL8NSEa
	 wgQTAbSDjuZd0B2XAb6VoIX79vFnvoedaTi5UpXXruhZm59kTq0AoDO7AwH/sMJQBkK+P
	 cbYLTGHxtPGZQ2Udmo3JeFRu22IYgCgeb4KufR6U0FHnNt8kr3ruamlfiRrhztwOLoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329160;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8y9Jl+1LJ8OoB5nJzl2Bt+QCd/i+vREbZWGx+2qkt5U=;
	b=iXP6EOofHlt2Ho13xit9HTe5sHb82GtjmSvK0P0J3NK5ZpMnlHKaoKYuuhaCCAhwpHTs
	 XhsTpLaTexw6BZ2kjYOsNOcwlBQt6CGm01Gqm/ufqjJUIn9DEBDdR5sgxf4YQs/PYQhO2
	 dNrMHzYzO8A0O1H5dJCZAvpTZ7fGzCxiaa6chGS1x2hMOr6uBNwO39UeG0iFqWWwxb/LB
	 PID7h6vFvwR58KX/5sEscbUGfFdTLJQSVssyPHFV2XOlTLv49IqTu2oLIKa5tvwaY9tty
	 xM3/pNliPpW3YiLNCVZ3ZMw0/0OYd36+iP7Izu3lc6yVFVnjzDQi4l5aWsOPj9m2KuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TbvaiESJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345A606A326;
	Tue, 10 Nov 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TbvaiESJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794329159;
	b=OW2cT8y4rHbKXKYFoaw1WuABUpMP6xpZkvJyL4jg6J3OhyNyzkBJjgKVmxNSGDtr1XYu
	 FDad64x1X5aBvjlPYO9jKPk0tR+Vs8bM449pi2aAam4vmVZkhsIRzquuBU0zZgfO/vKQi
	 7ZB7jr79DDBkKya7i5J1Ere0IVKrEmfH/WrSsrxlyTQpkQ0LXD6gRE+iP9+u0cDmRSYtY
	 67Tmp/O7aBP0xFvGiXs2k2+tasK1Ynv01L8VhIxb4fUXCzfNc/SVI8UxB+RS14fUqRBa5
	 Zk92+eD0DJcvAAB9PtTj67EpqL/ICwmJlAmDnmxGHqb+OENt30DuALVvtpuphmSuafQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794329159;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8y9Jl+1LJ8OoB5nJzl2Bt+QCd/i+vREbZWGx+2qkt5U=;
	b=uEXa50z/O9yHAr7UHpy5zTccjfiZj/fVAxNWKRPqcRas3Xg4vdOetG3VByjyDN1CbfBQ
	 GMFNL5C5R3u6Foc6skEL2wh2pulJpNa+8wXst3ocbUqLVXgnuzwfWEfwr/ppyk2vgoSB7
	 IIurG95BOuAvoBFtwj3aNVGwtYCqcK3GGaxNYYjlf2hXHZBkAxwMlWtwMy+vaxOyrTcyd
	 xEgX4S03AiX/x4sNpj/WGnD9CH7TKktz80IOF52I1XajEV5Auxc/Bn/JmiSZ5XE8XAnBo
	 /zEwkKermUEr+BnYuvxvyPviyT85KPPIzIOrzeVDmQG81vKDlRgMfuj5g+NPNhNMpyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D3E81F008A4;
	Tue, 10 Nov 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329159;
	bh=8y9Jl+1LJ8OoB5nJzl2Bt+QCd/i+vREbZWGx+2qkt5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TbvaiESJodq/aM66lzkT0iKL49Jnd6+dKpI4B2kOUhV8PgokGrR0sXCWtEnxDU5dF
	 Oz2TR2V2mLE7Z/ryEMIWU5YhewBTfzVHFsR0x4KRMG9WGRWpKbIMR39j6oZpgvgd/r
	 +HACooefLp8SEEcgyEzjtPFlOs0v7wzFPGFrdj0sz72Ncyl00is2J5MiYadIc/HgrP
	 KJldOuThvIIwef9AxEWlgeUvt8tgRIgceCMkIZ3i8zu4HaBqDk84/3jhA++YYr/6Av
	 jjo2TjzO4jj2aWYP1TsuLubxwdktVObDMQmVIJ9ctMYrpRv0vXlg0QRbJwYipkFCN9
	 xYIF0QStOLk1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 19A0C48C04;
	Tue, 10 Nov 2026 16:45:58 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 00:45:58 +0800
Subject: [PATCH net-next v4 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
To: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, 
 edumazet@kernel.org, horms@kernel.org, kuniyu@google.com, 
 ncardwell@google.com, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, panweiping3@gmail.com, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794329156; l=2652;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=Mz0+KsqQBxhWJlyZhAiEUnDL/oZgfrLTgEwG3eDqtks=;
 b=lOpdu2t1/HknQKiDM/kdhS7CxpI1N/KpY8LGOPTA4RpuY8k9oW0b5KlqX4DjyPun0QyF1jm0b
 jbQmw4a57rlDT03JuPtCt9xKnT40UwcTC3Kf5/gdWkkx7L9O/JPHXKk
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=2) has
no selftest coverage.

Add a test for an active connection. Check that it starts at
tcp_base_mss, that it sends the first probe half way between
tcp_base_mss and the peer's MSS once cwnd allows it, and that an
acknowledged probe raises the MSS and leads to a larger probe.

The SYN offers timestamps and the scripted SYN-ACK declines them.
This also checks that MTU probing uses the negotiated header length
for the initial send MSS.

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 .../net/packetdrill/tcp_mtu_probing_search.pkt     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
new file mode 100644
index 000000000000..a48acff8685e
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test packetization layer path MTU discovery with tcp_mtu_probing=2: an
+// active connection starts at tcp_base_mss and raises its MSS by binary search
+// as probes are acknowledged.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_mtu_probing=2
+sysctl -q net.ipv4.tcp_base_mss=1024`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation is now in progress)
+   +0 > S 0:0(0) <...>
+  +.1 < S. 0:0(0) ack 1 win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > . 1:1(0) ack 1
+   +0 fcntl(3, F_SETFL, O_RDWR) = 0
+
+// The initial window is sent with tcp_base_mss. No probe yet, cwnd is below 11.
+   +0 write(3, ..., 40000) = 40000
+   +0 > P. 1:2049(2048) ack 1
+   +0 > P. 2049:4097(2048) ack 1
+   +0 > P. 4097:6145(2048) ack 1
+   +0 > P. 6145:8193(2048) ack 1
+   +0 > P. 8193:10241(2048) ack 1
+
+// The first probe is half way between tcp_base_mss and the peer's MSS.
+  +.1 < . 1:1(0) ack 10241 win 65535
+   +0 > . 10241:11483(1242) ack 1
+   +0 > P. 11483:13531(2048) ack 1
+   +0 > P. 13531:15579(2048) ack 1
+   +0 > P. 15579:17627(2048) ack 1
+   +0 > P. 17627:19675(2048) ack 1
+   +0 > P. 19675:21723(2048) ack 1
+   +0 > P. 21723:23771(2048) ack 1
+   +0 > P. 23771:25819(2048) ack 1
+   +0 > P. 25819:27867(2048) ack 1
+   +0 > P. 27867:29915(2048) ack 1
+
+// Acknowledging the probe raises the MSS, and the next probe is larger.
+  +.1 < . 1:1(0) ack 29915 win 65535
+   +0 > . 29915:31266(1351) ack 1
+   +0 > P. 31266:33750(2484) ack 1

-- 
Git-157)


