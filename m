Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749777;
	b=2YUlq+c9CmV7y13T+O1JROViwrF/8z6FcJjrNU+tEoTVg7C6RQqGK8g05nFof5OWlz8/
	 6SVjarv27n8fHGa0vXnpnphWc+evta9tMgbspXlbqeVTiPiZ9hXvlLl9aKV6x0Gzqz2Nl
	 scg2EBFRVKK1SH+yWCOPdQsNkyfwEoVT/EbdezpnU39uZfQlRb2SBdUNnREbkL2+B0Y1g
	 MV5e7Qy5hhYcKSHIM00YzAKD4PUYKYM5bYZKHDzAfqMjrdzDfCxfJ0eAL7+1ql8NYc42k
	 mo0+jdBCzjuRusSr0uBz69MCPizm95QQ2kLfH2ZILcMaR28cIBCpiArJWiN/b+oNTQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
	b=gg1lqnb1crant93TXQaZgA/nG81+88+o2n18nGe/vC1Fw3VIeGgfLWPPesCtj6hK4W4J
	 bkrdtbd0NBZFUEDk8HFXrCgsHkqEHibLPweX38Hm9MGeMbwbv5/ENYcS8HM9SCcHZ9ZZ1
	 0Xg656cRsLA4OCoSo7nx7zEEDKMIoxw+RHpVuBsFP4fqQRjtRg5JZ74HczT4SQmWMIvgx
	 o44+uXG4krXeBsyRB13Qcb+Nza4acyxIz9ADLbnv02rnd0ZWW7PaO547TS13HcnJacsHm
	 AVMnn8vLjjBQicYwQ1ihUfvdQBOMghp41aHiNJUWafZg0Nh6EdUrfZ8HrdpvbQLHBpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVqvKH5+;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A557606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 03:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A557606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVqvKH5+
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38692f62b22so10064689eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 19:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795749775; x=1796354575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
        b=NVqvKH5+lsTodiBLJrm31BYjG5CR5qysR7PW+JLyD1KrTWmHn87Y5QtlZhbOEVlcgT
         gpl7ODF5hxKwBlctYepCz0cihw/9QyiRSKBk5rlK1hxAwhIXnL2EeASnhia07xALY1fG
         d5f9CrxXgpXvnuP8NX031iTiXSQsBitNr+gG4ZONz318AXtdie4lfU1TSzggS+1oJRBN
         i3wIa0xYsWZTQ3dmXlMY7iZrsUSlFmjbhnM3yiH7H65SY5dr4o+TT53iFctxcBZ+C/1+
         ahpAfSJVyWv/ub0KDiBS8IVAaOZ4QCWwIzdF+zAKXazEUsNFimO+pld03eX96mTyiPGn
         UosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749775; x=1796354575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
        b=n29iIafd1nROyzjol7xseZyM0HlvN3NvIahY9xvmG57WKx1tWN4rO0+ggQYddM2V+p
         eQYecSN35/X6kyLHVXXIExfDWA535M8QPTBv+ebVyACViGpS/EdS/rP7AMHAKzX8QpUq
         5OYVmOhFZab+kAvMFoNPU2OxP7FxHZ+shrxw74tPbpDnxdFV22Z51Ip9ibiUbXx7wI1U
         8UktwVm5NzjyzoXE+//gX/7PHjoCFhOYCIRpEF0cqf4HaVthKcrAq3WUYC/4pXPovTwG
         /GvnYV00TOZ+Yg9F5snVkCc9j0o0lqsAo1fD6yhOoH2dL/xszL4SpAu1pskurx5VNisz
         RFkQ==
X-Forwarded-Encrypted: i=1; AL+hErGHbfu2z3dEZZkAAnKXzrzertCoGtJzNbpjQOZ/g1AcKgKZ18TkqIDY27vK6eoBSWPPEi3axGtazXi/8mGGuz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jBoRII7ncTjh+dSh+u8Oa7/40gpcrqjVjLFO6TXAVWn1BSMX2
	C+Jwmiu9C6dszJBzkUcyyaSTWyR7lDr4zerCp3kTXFXy3MHTSvVHUR8o
X-Gm-Gg: AZFdTZeLG4mp9qQNvVn0Re1kfoDeXC9qXp0AW8DnAJ5fIMm7crHJrelLRWX7NrT+zph
	dmqlAj+uHD6tnTfZFY6qwrNQZ9UNeHaAedVBga3RiDyfGs1mF7hgVhMiFS/08fH4jYrR8s7/tDE
	zv4qHlcw8CV1mn2U73I5QuHw2dV0ge0S9trqIsGZ4O/BfdiRLdgjCvZGdCLUPje7ivKQ51/jc6r
	5CEq4RJdt09Lm7Ughfq1bYWVuvizE/OkYgwJ7QwxCn9B0/LaLZ8nMugR6oT2uJztyssTgktGMHH
	/OIkyLb0mafHZEWH+8BJgdFMoQFol0e8GSMkcYHU94H0br7WBdEMpkuqxqU//rq9qCD6rDZ63WY
	1WDi0qQrD8JdCnctqsXdpV+PD2jwMgaB9U9+QsMXQResud4cv0pN9DOgv2du07f0empI+DibWie
	WBNgH8l8JLfwiTg/PkhKMBsnBNtJpNA7eXbe/diQ1Iqo800UdFPiFjQmmQc+P2HzQWScggMrJF4
	j+J5cZS1o848QCgRG1boFbDrQ+V7wtMYOycRqUgZjunddixBT0zHbXZJZ6B9cVABakWWv0A0GAc
	fbdAe8nXYtwzCT8riYMP05RpoLayXvZ8S8J5UjUwV9F6PtbWX/6aFYLAXbAub/bk28dir52/Siz
	aFEyzUvbqlZNo+nwGkVi4X+jLRXC3llt0o+iW33VETWbjKhBij6NcAFIyt4YOoCG34KgigZTtUg
	==
X-Received: by 2002:a05:7300:2728:b0:383:c2f0:e753 with SMTP id 5a478bee46e88-3856c0d0a68mr26266744eec.3.1795749775103;
        Thu, 26 Nov 2026 19:22:55 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm81845568eec.10.2026.11.26.19.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:22:54 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v10 0/2] genetlink: Reject joining multicast groups no family owns
Date: Fri, 27 Nov 2026 03:22:44 +0000
Message-Id: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

genl_bind() lets any user join a multicast group ID that no family owns.
A family registered later can get that ID, and the socket stays a member
without a capability check. Patch 1 makes genl_bind() return -ENOENT for
such an ID. Patch 2 adds a selftest for it.

v10:
- In the selftest, unload drop_monitor only after the test loaded it,
  and ignore a missing modprobe, so that a skip cannot become a
  failure (Sashiko).
- Say in the skip message and the commit message that kernels before
  v6.17 skip the checks, as they have no fixed nsfs inode (Sashiko).
- Decode only the membership bytes the kernel copied (Sashiko).
- Patch 1 is unchanged.

v9: https://lore.kernel.org/netdev/20261125144514.2717012-1-anilkaushikwireless@gmail.com/
- In the selftest, find the initial network namespace with its fixed
  nsfs inode number, not by comparing with PID 1, which is in the same
  namespace as the test in a container (Sashiko).
- Unload drop_monitor at the end of the selftest, so that the next run
  does not skip that check (Sashiko).
- Patch 1 is unchanged. The Sashiko point on it in v8, a family
  unregistered during the join, is the window the commit message
  describes. The fix for it was patch 2 of v5, which was not accepted.

v8: https://lore.kernel.org/netdev/20261123155503.2497063-1-anilkaushikwireless@gmail.com/

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  selftests: net: test joining genetlink groups no family owns

 include/linux/netlink.h                      |   3 +
 include/uapi/linux/net_dropmon.h             |   2 +
 net/netlink/af_netlink.c                     |   6 +
 net/netlink/genetlink.c                      |   5 +-
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 138 +++++++++++++++++++
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

