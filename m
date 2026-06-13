Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD26279DC9;
	Sat, 13 Jun 2026 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781363543; cv=none; b=M1ErPL/ES4tpUYkxR2+zEh+68Tx32HpgasRgRRZXQ0qIi3c5lQMxb8mKMNl6vwiBx96WzK5p1o5ma5IrALZEA0F8JlZmdf7LOoLnVd3wkKdf45CCTGkWT3gvrPxhVUzj8RjUgMFDzMOMGnhG0cOiK6uef68exlbm+Dakw5EZ4iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781363543; c=relaxed/simple;
	bh=7wuzSeV0qr+p1aiw4dVV8bfGRO/5vafsYwhfMCePCe4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V9PxYdu1EQ/XHUXCT+Gv48iv3E+Mx6Z0kDKi4PvXH7XKzasoEHrevri5cR12eBULJfApNSMvBbE2L+giUZj7G+mcUrKb65jUW6Q1Y3nEDPSdYtaatFIMpWJyq/G07SZ5rSvMb78yEGJUuV+3N0zwbts8+QDs3MMAzIaS30xnNoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l60OYMv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l60OYMv2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E72AC19425;
	Sat, 13 Jun 2026 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781363543;
	bh=7wuzSeV0qr+p1aiw4dVV8bfGRO/5vafsYwhfMCePCe4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=l60OYMv28eV+VN3J/wr45WE7Q5saAWR4+jHoyw3inE7cQfyEg0JYa3bgY9W7Vcwqx
	 diAbvMztGm7Pz9RJr3pHsG26b7+o1rrNwM1WRsC+FOZyZEVBM+AxMyEfH4D/JNKJ1j
	 pafkwWIya57TJHF/qtZ7CgW9jhFx3+TcKl5YmJvzamqoiLgcJNK0L8uVcLjz07SncO
	 ib+7BSYUpVSfz1nr/nszX+XgG9jxgpuLKyBleYKvkX65vbXDEKiHZm9NQDXqupuSyW
	 grDNlRQM0v+d4CqpX9usKP94JeqtbRz8ee73nsbboDImh0vBeHQhSYCof+ecBy4NHK
	 9p/cW9qC8JAag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E846CCD98D8;
	Sat, 13 Jun 2026 15:12:22 +0000 (UTC)
From: Laika Price via B4 Relay <devnull+laikabcprice.gmail.com@kernel.org>
Subject: [PATCH net v2 0/2] ip_tunnel: fix PMTU ICMP reply routing
Date: Sat, 13 Jun 2026 16:12:16 +0100
Message-Id: <20260613-master-v2-0-061b70fd45dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNwQ7CIBAFf6XZsxhAQ8WT/2F6oLBt19jSABJN0
 3+X1qPHSebNWyBiIIxwrRYImCmSnwrIQwV2MFOPjFxhkFwqrsSJjSYmDMxIrYVSreZKQ5HngB2
 999C9+XF8tQ+0aVtvxkAx+fDZn7LYvL9oFkww19Va4QWlq8+3fjT0PFo/QrOu6xcFn+wNrgAAA
 A==
X-Change-ID: 20260613-master-a299166b9069
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Laika Price <laikabcprice@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781363541; l=1026;
 i=laikabcprice@gmail.com; s=20260613; h=from:subject:message-id;
 bh=LedJ39BQchjQxS/5EHaqWA5pNnfquMEPobE2MJNmYB8=;
 b=LVcIebVR00z6R4p8iujA6Ffn7Eyt9ylqp9uAu6KtwdUZavaUnhQxaCVR4kJGoDUKbhmLrnTv+
 43OXDxvCGDAASkchl1qKY6PDPxosYWIA5BCkh6ry/qhLr/9k6Qom3Qj
X-Developer-Key: i=laikabcprice@gmail.com; a=ed25519;
 pk=mFSMw2odvyxt1H4QHAdwZVuwHduNzUMDKbWFOcwhDCg=
X-Endpoint-Received: by B4 Relay for laikabcprice@gmail.com/20260613 with
 auth_id=819
X-Original-From: Laika Price <laikabcprice@gmail.com>
Reply-To: laikabcprice@gmail.com



---
Changes in v2:
- Fix incorrect PMTU exceptions test
- Link to v1: https://patch.msgid.link/20260613-master-v1-1-df796e8e2d74@gmail.com

To: David Ahern <dsahern@kernel.org>
To: Ido Schimmel <idosch@nvidia.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Laika Price (2):
      [net] ip_tunnel: drop stale dst from generated PMTU ICMP replies
      [net] selftests: pmtu: fix incorrect PMTU exception generation

 net/ipv4/ip_tunnel_core.c           | 2 ++
 tools/testing/selftests/net/pmtu.sh | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 2a2974b5145cdf2f4db134be1a2157e9ca4a1cf0
change-id: 20260613-master-a299166b9069

Best regards,
--  
Laika Price <laikabcprice@gmail.com>


