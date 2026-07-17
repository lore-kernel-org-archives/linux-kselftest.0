Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A14346FC4;
	Fri, 17 Jul 2026 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276119; cv=none; b=agnY4rT+Nyl4j9CjolHkxYwpWaefjgR5WHQV2GPSEdQOjYu6z8NB14Yr2FIILzd6vhLg1CwOt0ncRRBff+29mTi8oHj9XjOwUGAci44BexaYh35BIFKygypXXNFuvM5mDxRRbuNFuIFdjiObyGYRw1fyVpP2brKCwebrC8IDceI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276119; c=relaxed/simple;
	bh=h/q/icklG1sXhxqo7RXiLj9SEStk1M6XK/2DD34S9mM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q9sAeCZn/+dvIL2w0/kPbaEFlSjDyRklfkiIcnd6VwVeJKo/uT2s8/kspySD47f9QmnweTfup/e+ox998bV0E1Z9t1R9Mg63BQ0LVWZMVQyYeFSVktCO6yODIyEvqEIAByYKaqkBZ+0o9+USsYZWEQyq0pbaCDXpaLXXzb+kflk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mails.tsinghua.edu.cn; spf=pass smtp.mailfrom=mails.tsinghua.edu.cn; dkim=pass (1024-bit key) header.d=mails.tsinghua.edu.cn header.i=@mails.tsinghua.edu.cn header.b=EVkdezbE; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mails.tsinghua.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.tsinghua.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mails.tsinghua.edu.cn header.i=@mails.tsinghua.edu.cn header.b="EVkdezbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mails.tsinghua.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:
	Date:Message-Id:MIME-Version:Content-Transfer-Encoding; bh=sNB5G
	faereNfR9391Oa9mXaHoiaMBfQa86jIFrNo1OI=; b=EVkdezbElx9LU57w7/LVk
	SK5z0fUzsI/7OhnMKyqChW01/tH0HPLL1Trs55wOHX5vm6XdKEUy5EJ3Qkw1r5WK
	XSRzEFcY9cVHjwvfrji7pn+c78KUgFjMCVI0R0tnxpZyaLoyQLdvO6RkUvt2b5Ws
	4GlXPCLQUbp9qcs1op6ao0=
Received: from node118.platform-default.svc.cluster.local (unknown [36.102.215.18])
	by web1 (Coremail) with SMTP id yAQGZQBnCMh45FlqWWMXAA--.33958S2;
	Fri, 17 Jul 2026 16:14:55 +0800 (CST)
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
Subject: [PATCH net 0/2] tcp: validate RST sequence in SYN-RECEIVED
Date: Fri, 17 Jul 2026 08:14:41 +0000
Message-Id: <20260717081443.809393-1-yangyx22@mails.tsinghua.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yAQGZQBnCMh45FlqWWMXAA--.33958S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWDGFWkWFyrAryxCF18Grg_yoW8Gr1UpF
	4Yk34Yyw4UAryxCwnayw1UXr1ruaykJa17u397tw1rAwnYvryIyr1xKr43Wry7Kas3W3y7
	KF98WF1jkF1DArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14
	v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRXZ2-DUUU
	U
X-CM-SenderInfo: 51dqw5r0ssqzpdlo2hxwvl0wxkxdhvlgxou0/

The SYN-RECEIVED request-socket path accepts any in-window RST and
removes the request, even when SEG.SEQ does not exactly match RCV.NXT.
RFC 9293 requires a challenge ACK for a non-exact in-window RST.

Patch 1 applies the RFC 5961 sequence check to request sockets and shares
the per-netns challenge ACK quota with the established-socket path.
Patch 2 adds a compact packetdrill regression test for exact, non-exact,
RST|ACK, and out-of-window cases.

The implementation was tested with a separate raw-socket A/B harness on
IPv4 and IPv6: the unpatched kernel passed 4/12 cases and the patched
kernel passed 12/12.  The packetdrill test fails on the unpatched kernel
and passes on the patched kernel for IPv4, IPv6, and IPv4-mapped IPv6
under QEMU/TCG.

Yuxiang Yang (2):
  tcp: challenge ACK for non-exact RST in SYN-RECEIVED
  selftests/net: packetdrill: cover RST validation in SYN-RECEIVED

 include/net/tcp.h                             |  2 +
 net/ipv4/tcp_input.c                          | 56 +++++++++++++----
 net/ipv4/tcp_minisocks.c                      | 12 +++-
 .../packetdrill/tcp_rfc5961_rst-syn-recv.pkt  | 61 +++++++++++++++++++
 4 files changed, 117 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_rst-syn-recv.pkt


base-commit: 3f1f755366687d051174739fb99f7d560202f60b
-- 
2.34.1

