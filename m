Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686451;
	b=4NQ5p4LxiosTjbxkq6/46pJdDkt05ckfWoDlmhwnccgs2F6CDczteRhDMaozEBYok00P
	 cCpejLJ7TYpboa96wRT12H91fLlz+LoPC33/dFx3I3perklGM/wUMiSMHVUdZGu3X+1sn
	 xybWOTRyXWA1QpXBXF9HEAUWakufma2l/wn745JqCcYdojmCOsPR8CJoOcZVgVns23LMR
	 36hxAsXqN8iQpASWtlxhbtTZF+Ev6nc20uTzxdSWTm5aJe7sTcVJpVx2x6I5qB9xPop0i
	 /wfE9cSidtxcLSmQFW6/x7mrNpgxp8tiKomYPJF3evl6Lvuie/gouDfrNufLHbY0QdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
	b=le7zd3cIliilriEFp3o05z4xdK5f0++iexCI8imZMC28WbPPkt6Eo8v9qwxsQsAbK9xh
	 tMRrqCD6SFFxbsbf96RPrQnrNoQ7/gS63Y3vS4SvfOync8YM9hKpSAVOacfk/CJc2le0I
	 NwHnxRNvCyl1+LvnRj2Gl8sh+PkCpWEV9vckvwtea4k/ZL/XD52gVjtQd19MG3quntpwv
	 iaX8iLR8c0Qz1mDGHt/+d40PNUKFfnanhLY3VOSTL53/Wd/ujvzl4ix0ax4f53vXcld5R
	 TR/1X+EJz6rx1v8FBCA+VuqPrHn1sqZFHw+Aae16DuXiv5w6qgerW2rY0FHnmjvizMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz1I274b;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA31606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 09:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz1I274b
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c506a231b88so915667866b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686449; x=1796291249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
        b=pz1I274bb3JaDemNqdR/CM9tzxoYeezTS5nspEjuTcafiXkOaJI/fb/2vnsSbPj4My
         SvvEZ7qer5UbPKQ5Byb9/P7ZnOOmKBxO6K4R243EX4v6+VT8IHfPWE1FM9l+2clwjVfY
         Bm5RE5HL3QgzksJR1Bf5FumtfQL46zsoSpW6KBrzDWpkKCdh0q7qRj/A56ZAUcICyjCA
         Yar5CS3AxxByziQampabUDCXhYQwEbJPS7c9fKtDQttD5Z04b++4noYTZ0ICA+YZw35I
         2rDfb4MHI4fEf2CzHl0JlnjMM+tpg7/cv56aFbGENgheb3yrwo23tbefAX7d1rS7GfFl
         6i+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686449; x=1796291249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
        b=u7tvyVZK0epQAT9Y0/gTQFTSs400tptL9yEKMyf48f97YNcd2+I0BdIbPx+9NANc95
         sk9zi+PK/LC4SsMG5igJGZtX3m5I1Ae3qOZ1QffpuQVd3Rlrha/aXR6rNQ6PAbI6R7sJ
         brLwbakKJKuNlNo9TdBfF067TiGOWXNL4OqzjY5MsPa+sLnN7Or/+DrE3O+le4PcqfXw
         aim7gv6PCfZYvvRe64X8lM8BkA/i+t63zKCAnlWJBgLw9WpjdtapO51eRCrG8HU1kBDW
         ceASmzrMI3qMH3Nr6QsZW/5sXmbOP+NdCKvB2U+Wb19KxiA8FTcEohvS3/kElMDdJk+O
         M5Aw==
X-Forwarded-Encrypted: i=1; AL+hErFf6/Mrf0oTIIRsT68IVpfVTS3SK8B8ZkfGgAwzd3VWw7/GjD43bFkHJ4V2qa+A2weIgP8YdYHE1RJn3Gzc8rU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FhmPLJe2lpNFOxHHnWlKhR4p6xbhJhgpgUVNCYvbKRWPXJpNb
	DCpNQn8LImJ3DTuXPUJiNfWn9sdrMBeHwUQc/cKeIG7T3i5cpKJaBYZi
X-Gm-Gg: AZFdTZeMtHPpSZ6My8ZCXxJh7gdY/6N9/GBSIHUWthlWAgOtIE71bbvjPN2Dlzikk0J
	3yc0GEqzcNg8xB+hePkNe0UwgGqaqhCx6lSDedyZDdd9kK8m6naOpE/7x2v3fDigfxz00wInnLS
	/JHEtQRdNhT9EyPtQXeXzoWw8olx8ug6dlRJ9XJ4qEhiYkfgGP1hwA149ZAHahRXmZ+hFBCn5dA
	FQMGBB1v7OWt3mbJifSAbV+KoFEnDyoQsFAu8P1HTblOxeZs28ZIaEwiBkX1Maq+ErPFHThRzC/
	oERB9L+qYkFKVZDK7j/mbVzWUxH0itb42VwOurBO1T/WpmXJ2pnlKcxDU2OUUkQvRv2MaoNFk/n
	6ZgcMQD+9Kjylx6zvOYe7sHVe9pYEwgE9jOcVh/lvdp91Q620TZ2JO8tHO2bH1N9Fssa+85N1Wx
	czXN4TVdmKYBXOf5/KTDnAF3MG8Aza6oFOWYdOSuV566a1viQHfNBlm2y/E4Bd7oHOdBiHIUcJ5
	3L+gDu7cq+wA9CHBojP3luDFMwY45cJDqr1UmI48Epcle8tkLcrsx1bdeG6B9Ct+Giq6COxKl+t
	Jb/9Hw8BC8HnGs0sJawsp1qxvYx/7HC3j2RDi41P0P1qOnzB
X-Received: by 2002:a17:907:3f1b:b0:c51:5547:1771 with SMTP id a640c23a62f3a-c5155471892mr1472031966b.13.1795686449194;
        Thu, 26 Nov 2026 01:47:29 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm727100666b.78.2026.11.26.01.47.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:47:28 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] wireguard: free queued packets on peer removal, and test it
Date: Thu, 26 Nov 2026 11:47:20 +0200
Message-ID: <20261126094722.73025-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Removing a peer while its receive queue is busy can leave packets on the
per-peer queues. Each of them holds a keypair and a peer reference, so
the peer and the keypair are never freed. Patch 1 frees what is left;
patch 2 adds the test Jason asked for in the v1 thread to netns.sh.

Tested on net e50972666 with the WireGuard selftest VM (x86_64 KVM):

  both patches, 4 vCPUs:      pass
  both patches, NR_CPUS=1:    pass
  patch 2 only, NR_CPUS=1:    fail, 4 peers and 4 keypairs
                              "merely created" in 10 removals

Changes in v2:
- Patch 1: code unchanged. The reproduction paragraph in the commit
  message is corrected: the first reproducer only put load on the first
  removal of each run, so "5 in 2140" understated how often this
  happens. Under load it is 25-40% of removals with 1 vCPU.
- Patch 2: new, the netns.sh loop from my reply in the v1 thread plus
  the larger log buffer it needs.
- Rebased on current net.

v1: https://lore.kernel.org/netdev/20261003201625.4572-1-apasichnik9@gmail.com/

Andrii Pasichnyk (2):
  wireguard: peer: free packets left on the per-peer queues on removal
  wireguard: selftests: remove a peer under load

 drivers/net/wireguard/peer.c                  | 24 +++++++++++++++++++
 tools/testing/selftests/wireguard/netns.sh    | 14 +++++++++++
 .../selftests/wireguard/qemu/kernel.config    |  2 +-
 3 files changed, 39 insertions(+), 1 deletion(-)


base-commit: e509726660dd06ce107437aecf7c106c9d3fc1e7
-- 
2.43.0

