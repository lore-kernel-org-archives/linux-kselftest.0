Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11563E00B6;
	Fri, 17 Jul 2026 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276127; cv=none; b=fas+I1gaqT3Kn+Zr+hO8YZl5bqlsEcAQm0QQAJm1+58SzAQ07n12+F0yRXhebOyZ4K/atFIAFYuHQXz6oEBgCvkCmIhFg68SNAWydWiB8Ry/16f6KyRmWP6T3W023KH+Ji8oL4OvQwqqgy/wJconqO/wvIp7SIXZH/wmywxM7Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276127; c=relaxed/simple;
	bh=2hE9mWSFuW1q+zRvnj1YXir2C/yT0R7DjU16wBOGF6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fXwcqyWPmSCLAUanL8OCeMNQR39jaxu8q8Coviu4oPiHzFiR21cFkEFlWvLBg2LsgZVcu1v3Xm/7u3NOh32Xg72vH0VZ5UE1MtxbcABUX1D0acds2EcfyTJRuL8T/NUYsF3OmjWnFR32nG/RwExPjOv+jCt/Si4SmbvZouSp2ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mails.tsinghua.edu.cn; spf=pass smtp.mailfrom=mails.tsinghua.edu.cn; dkim=pass (1024-bit key) header.d=mails.tsinghua.edu.cn header.i=@mails.tsinghua.edu.cn header.b=fBuMExxz; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mails.tsinghua.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.tsinghua.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mails.tsinghua.edu.cn header.i=@mails.tsinghua.edu.cn header.b="fBuMExxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mails.tsinghua.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:
	Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=VrCJPAA5D8+z3s53wYAH4G5t6NO5Tup7gX
	pN+nPBCu4=; b=fBuMExxzeaU4G/RP5vaFr6Vz4ZDerUkXh95ps9ifrVA9Z6zWay
	d5U21v0um7QjF3zktLwGeul9Zp90OuMCzRgMyJb2QqB2nTwK3QgF2TlYnt41vVMO
	8TlzdqAE5iQx314tdoJNxCK7HJkUzVeW4P6zX1XvbrwAj9Bq8w1H8NNTw=
Received: from node118.platform-default.svc.cluster.local (unknown [36.102.215.18])
	by web1 (Coremail) with SMTP id yAQGZQBnCMh45FlqWWMXAA--.33958S4;
	Fri, 17 Jul 2026 16:15:09 +0800 (CST)
From: Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>,
	Yizhou Zhao <zhaoyz24@mails.tsinghua.edu.cn>,
	Ao Wang <wangao@seu.edu.cn>,
	Xuewei Feng <fengxw06@126.com>,
	Qi Li <qli01@tsinghua.edu.cn>,
	Ke Xu <xuke@tsinghua.edu.cn>,
	yyxroy22@gmail.com
Subject: [PATCH net 2/2] selftests/net: packetdrill: cover RST validation in SYN-RECEIVED
Date: Fri, 17 Jul 2026 08:14:43 +0000
Message-Id: <20260717081443.809393-3-yangyx22@mails.tsinghua.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717081443.809393-1-yangyx22@mails.tsinghua.edu.cn>
References: <20260717081443.809393-1-yangyx22@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yAQGZQBnCMh45FlqWWMXAA--.33958S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWDuFWDuF4kGw1kuF1fXrb_yoW5CFyxpF
	45CasxKr1jvry8G3Wxtw4UKa4rXF4kJrW3Gr93JrWDZrs0yrn3ArWFkrWDK3sFgas5tFWF
	qa4jgry2v3s8A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAa
	c4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
	ACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_GFyl
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r
	4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sR_GYLPUUUUU==
X-CM-SenderInfo: 51dqw5r0ssqzpdlo2hxwvl0wxkxdhvlgxou0/

Add packetdrill coverage for the RFC 9293 reset checks on request
sockets in SYN-RECEIVED.  Verify that an exact RST removes the request,
a non-exact in-window RST sends a challenge ACK without removing it,
and an out-of-window RST is silently discarded.

Also cover an RST|ACK with an unacceptable ACK number to ensure RST
sequence validation runs before ACK-field validation.

Signed-off-by: Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>
---
 .../packetdrill/tcp_rfc5961_rst-syn-recv.pkt  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_rst-syn-recv.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_rst-syn-recv.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_rst-syn-recv.pkt
new file mode 100644
index 000000000..3fc2de036
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_rst-syn-recv.pkt
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// RFC 9293 Section 3.10.7.4: in SYN-RECEIVED, an exact RST resets
+// the connection.  A non-exact in-window RST elicits a challenge ACK,
+// while an out-of-window RST is silently discarded.
+
+`./defaults.sh`
+
+// An exact RST removes the request socket.
+   0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+  +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+  +0 bind(3, ..., ...) = 0
+  +0 listen(3, 1) = 0
+  +0 < S 0:0(0) win 1000 <mss 1000,sackOK,nop,nop,nop,wscale 0>
+  +0 > S. 0:0(0) ack 1 <...>
+  +0 < R 1:1(0) win 1000
+ +.1 < . 1:1(0) ack 1 win 1000
+  +0 > R 1:1(0)
+  +0 close(3) = 0
+
+// A non-exact in-window RST gets a challenge ACK and the request survives.
+  +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+  +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+  +0 bind(3, ..., ...) = 0
+  +0 listen(3, 1) = 0
+  +0 < S 0:0(0) win 1000 <mss 1000,sackOK,nop,nop,nop,wscale 0>
+  +0 > S. 0:0(0) ack 1 <...>
+  +0 < R 2:2(0) win 1000
+  +0 > . 1:1(0) ack 1
+  +0 < . 1:1(0) ack 1 win 1000
+  +0 accept(3, ..., ...) = 4
+  +0 close(4) = 0
+  +0 close(3) = 0
+
+// RST sequence validation precedes ACK validation.  Even an RST|ACK
+// with an unacceptable ACK value gets a challenge ACK.
+  +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+  +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+  +0 bind(3, ..., ...) = 0
+  +0 listen(3, 1) = 0
+  +0 < S 0:0(0) win 1000 <mss 1000,sackOK,nop,nop,nop,wscale 0>
+  +0 > S. 0:0(0) ack 1 <...>
+  +0 < R. 2:2(0) ack 100 win 1000
+  +0 > . 1:1(0) ack 1
+  +0 < . 1:1(0) ack 1 win 1000
+  +0 accept(3, ..., ...) = 4
+  +0 close(4) = 0
+  +0 close(3) = 0
+
+// An out-of-window RST is silent and does not remove the request.
+  +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+  +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+  +0 bind(3, ..., ...) = 0
+  +0 listen(3, 1) = 0
+  +0 < S 0:0(0) win 1000 <mss 1000,sackOK,nop,nop,nop,wscale 0>
+  +0 > S. 0:0(0) ack 1 <...>
+  +0 < R 100001:100001(0) win 1000
+ +.1 < . 1:1(0) ack 1 win 1000
+  +0 accept(3, ..., ...) = 4
+  +0 close(4) = 0
+  +0 close(3) = 0
-- 
2.34.1

