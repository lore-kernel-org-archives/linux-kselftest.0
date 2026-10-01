Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DB334F479
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 17:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874635; cv=none; b=atLO5yqGRW1/aw4DKIe5fPQvJchngVcbtHL8yuaKXEZ1XmERfwF4f5YqAbn0Xa/R690ZehMJvTQ9r2/VPD5DiwoImzYHLXoZxdt6Hqjp+YmUfSy1TPAFgbzf2Si6KnnZXWEy8NuiEth7pEBTDiYEremJjaXKrhyqnCe8M8s9wTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874635; c=relaxed/simple;
	bh=iRuh/s6Ipo9nZvx/J9+0+HpYrUaUvgSFRS3OUGAoNwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dY3NbsReIWFlHqNPlZnUBUzNjMxcCR56h9GbxEoMkDSYwGdU4VtjfjcD8ZolTW8oADKmKnsNHroih/uTrQmIsQhGU5b9U7yT5u8USBsm+ScTtIGNKS0PmsovQeRrjXMdj/3ybMo9Racpe3qClSOAIv8tCSjJ+snBsOz40FjIvco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=KPBN5Q7p; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="KPBN5Q7p"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e6e43b9d8so22419375e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790874627; x=1791479427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBgkdMW2PJxTxBX+kIlfjfUkDEKiBwZjSW88C9NEh9s=;
        b=KPBN5Q7pmsFdNiGDGmqAHm+VUxTbNXGzZaVJ/O+EwdGRFHDx6Mrd5lm0Kp6DfoOLyD
         F22C+MjaTY71cLdY9D+c5c5HdmUxlEgAYBhWrh/ejmkXNzReBGPhU3qJ8Me4FfJsFh8N
         5Bf9VgxgX1F6V0A6wYzVxnAi3M/slh1XyXOJFMQMOEV1LsB5/h3TxajpNmvfYqdx57EP
         FMHAtsfpYkhU/2OeTy+USeAIJqt68lUIe5Vs62vtxFtR05krFM8cprK7zAu9slyLwSB7
         cr6OMEf/l4bPiehyGakXhlZX+4BP0jJdKBnP51b2nnz09k+ACttUjhOiYr973KVeF/w/
         dm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874627; x=1791479427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBgkdMW2PJxTxBX+kIlfjfUkDEKiBwZjSW88C9NEh9s=;
        b=hJW+UXfZJNTKK+fA7r4SuNCnzFetcBpGAVpXHEfksUsMr6vUusXEkzfE5d/TNz6p+3
         kfl32D69YWyakZqj+cUrptvLXa5XOJJyAxCeB+Wvq5EAjVpWzCYxpXATFoGsO4ay1imL
         LSKU8JoljbFy7dnhrlS8cHf2sbdmKpfnJKqUQfiYOC5IObZcztauhaBXKVLyimjh+QYN
         98nqaQV8y6GmN5q4OipVrGjF/cJKkKefn4uX0fRzkywzX39VaQY+GA3e2LALU8Ir9IXP
         uVd9A4iThG7YOD8+DxY0QJbRv7q9DatIZysa7jdnQrBstOnsblHPhVkNDYijIyJY9wKO
         eBhg==
X-Forwarded-Encrypted: i=1; AKwUvBx2IxQh0NwdVvASKqyozeG/x2hjiqqv7Vb7vwYtOidQYhsH58Pi+PwXVFjmHCzIXBxYCe+B6PjNJMnaN5n0La0=@vger.kernel.org
X-Gm-Message-State: AFuF++mlQ59eDplztMndjPD5Hv8o7mJ8hrxYJs1b38DKnPkmqFOGf/dF
	1Sj4F5HPAu3LEWzMjtjiKJfTuDG7Ru60iu1khQ+6UdTrNe64b4JdEevK56vcXAyYi+8=
X-Gm-Gg: AYBFou33YaN8vlue38Ycw1/Cr3UZRXfdH4OOeYuQVoHHRGwSU8HS4Ro7mRWIP9jyqGB
	EdZJNbuEJb7iqcl3VznNYdz9RlZ0AvyPFcNfzudEW/AsVM6IlEnvbqP9l3gkeoDyAfKkDNuloDI
	P0c5sPvvWqJL+avGCNhk9DIo15QVNbpronjcwzCAoW4AiApAMfu9PyEv9r0Jv1EY4DJvxT3YzOk
	wcvdm1j3RK9OJn07HCejuNlx+TcyuGP8MxkVIAZISQQpIhjYJjlmGk1eaDR1DRwHhNQE1XCZiM+
	+72k/qKbQVDeQEhkTfOAwg5rRuJEEsp51pUex35En6K3MSsGyhTaZ8lRR1pNF+d7/R0IPyfNdNN
	GIUQSpRCDQpZRTwi6ToIqsppptWBswzhfvm4eLWASa+BeLYGLMQNxQUZhA/L/l3BrrAZka4N62x
	RtBcq11wz19JZOxOsL4yJjwTrHs0/8XoHQMm+10KFiOiuHqMJjGjZ78V9PAjFVjAyvM236D0LN+
	iBIlKpcRgNAcjHDVcB6WA0HhgmhEeSoY9jy4V7VhPU7XOeBIC+DYXZduRCLrIS62JYrDwqX1RGv
	DWHA
X-Received: by 2002:a7b:cd8e:0:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-4a02758ff89mr4168705e9.19.1790874626793;
        Thu, 01 Oct 2026 10:10:26 -0700 (PDT)
Received: from localhost.localdomain ([197.51.130.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0278fb6f1sm2496985e9.9.2026.10.01.10.10.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 10:10:24 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] amt: mark relay data as a UDP tunnel packet, with a selftest
Date: Thu,  1 Oct 2026 20:10:14 +0300
Message-ID: <20261001171016.88208-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series follows the discussion of my earlier [PATCH net] "amt: do
not offer software GSO on the amt device", which I withdrew. Eric
Dumazet pointed out that tx checksum offload is off by default on amt,
so that case does not trigger by default, and that the better fix is to
call udp_tunnel_handle_offloads() in amt_send_multicast_data() like the
other UDP tunnels do. Patch 1 does that, and patch 2 adds the selftest
that I said I would send with it.

The earlier thread: https://lore.kernel.org/all/20260928181554.85766-1-omar@blockcast.net/

The trigger needs a non-default setting (ethtool -K <amt dev> tx on) and a
GSO source, such as a UDP_SEGMENT sender on the relay. The problem was
found by an LLM-assisted code review of drivers/net/amt.c, while
developing an IPv6 outer transport for amt.

Results, from the selftest in patch 2 in a KVM guest on net-next
commit eb0c18404c89 ("amt: pull the AMT header behind the transport
header in amt_parse_type()") with CONFIG_DEBUG_NET=y, eleven runs per
kernel:
without patch 1 the UDP_SEGMENT burst with tx on is dropped (0 of 900
datagrams arrive, tx_dropped of the relay's egress device +100 per run,
a trace shows __udp_gso_segment() returning -EINVAL during the
segmentation on that device); with patch 1 all 900 arrive intact and
tx_dropped does not move. With tx off, and with plain datagrams, both
kernels pass. The existing amt.sh passes with patch 1 (it was not run
on the unpatched kernel).

Not tested: hardware with UDP tunnel segmentation offload, hardware
checksumming on the egress device (the selftest turns it off there, so
the non-GSO CHECKSUM_PARTIAL packet that now leaves with
skb->encapsulation set is only checked through the software path),
KASAN, sparse, the udp_csum=false variant, and NETIF_F_GSO_FRAGLIST.

The selftest is a small sample so far: an earlier version of it failed
intermittently in about 3 of 25 full runs (listener counters rose but
the receiver got nothing, which I think was its idle timer expiring
before the sender started, inferred and not confirmed). The final
version passed or failed as expected in all 22 runs, but those were in
one 4-vCPU KVM guest, so it may still be flaky elsewhere.

Known and not touched here: amt advertises NETIF_F_GSO_FRAGLIST, and
skb_copy_expand() refuses a SKB_GSO_FRAGLIST skb with a WARN_ON_ONCE().
That is independent of this series, I have not reproduced it, and if it
is real it would be a separate fix for the net tree.

Assisted-by: LLM

Omar Ramadan (2):
  amt: mark relay data as a UDP tunnel packet before sending it
  selftests: net: add an amt test for UDP_SEGMENT through the relay

 drivers/net/amt.c                      |  11 +
 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   2 +
 tools/testing/selftests/net/amt_gso.c  | 473 +++++++++++++++++++++++++
 tools/testing/selftests/net/amt_gso.sh | 269 ++++++++++++++
 5 files changed, 756 insertions(+)
 create mode 100644 tools/testing/selftests/net/amt_gso.c
 create mode 100755 tools/testing/selftests/net/amt_gso.sh

-- 
2.43.0

