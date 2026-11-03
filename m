Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689785;
	b=CFyUKZE58bbm2QlJjulFeBXsk/Qa7zH2mPj591GLTjCxRdhX200gSYcdok9AkiUZMMH4
	 vVhEaHFocPvc7yZN+HbaUA+7SV75Nn+TGVnPegODzNVYzgHQVijibbK1z0dra/e3U6psV
	 nVzN5+2yd191I6bKli1Bn1gLlqkk+8qzueQoB1lf0YgFkmGxG8Tll8V9otuS8a+kksx+p
	 0wS1kaUnm4Hs5Fg+XSyBW3vQz8DPBJrLn7RQSlsMk6E8xAak1+cLZZV5drBFv99/1uhAJ
	 qmy0xBeqj2cNIu/7WIJ0KS788nyQiuP/XZV7oMRFwuNMxzeXVD9lWonfIM1wOE0UX5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689785;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=v+dvVtZm4YuXJETCzToQrv7Uil5/9N0SUgOCdWkLGM4=;
	b=2Kvz+60eZjwZwB/jknzSioDP9q/5kkTBPzplnoBdVZ2A6r5WNTkrvwLIxBxeGPcUhkvx
	 Oj+USE/Mv3UJteQDRqEWTi8botf2tuQ3Bqi0haK6+5qGocbLlGgiGDL09wq91ycBrSmVk
	 NGSWb2L2X0bCEd7YRIgxJd589LveT8jUXnWT1z0D0zCxjsx9TwknpHDyDjJBsZBHcP3Kw
	 LhDE8tJ1hAXXXtD8lBCuKK/5nILYVHO9ushMnDLq6JoHCD1bH9cXI6wnGDIDc8hjC91+5
	 f0W99OiQPAi256nZ66YcLkmpe325GAmU7bpVCpIBAmNyTdryoaceO8p8+D0AUqg2S5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lB7mqgGR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32794606A324;
	Tue,  3 Nov 2026 07:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lB7mqgGR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793689784;
	b=s6MqJE5OfrdLii5tAQBv9LP489Vjm/coGDzj0wpdvqJW4QvqpCnINPaWhQDXwByPe1v+
	 JnAw2b93EmacrdAZnkRvE5HJ9S6lcP+Sm2haQLKDCVSH4qPxYxcufcloU/UWsNpl7LWsV
	 wYBitSsPcrFnY17WTE/ZiZ3i3GwmfE15Xncs92ipukHZMx3HeNcRgu8es/K/ElPHOsfJs
	 CpTxojL3OM6hrHM4f3l89Luik/wDASfbo+4k8GeGKNKQfpzNdgQlcd559V/je1y9ZXCd0
	 3V+ZLJIV3MfqMcGW3vjy4EN0X/NjKUVeAR3Rj0mPh2OBnp1hJrOgxfbo0YaFpVFiZQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793689784;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=v+dvVtZm4YuXJETCzToQrv7Uil5/9N0SUgOCdWkLGM4=;
	b=G5cJc7j17jk+UO0qUfLT9498XB12xWkVJTUky/U9jwL2AEwXpPK9c+Cvi3NjpQKFZJiE
	 rfQAgN+Xt/Eu3w0NO+Wp8saZjkBO1h+z7NijbV9hkwsFIyqem8jBdmeAR1eqnQUgagR5d
	 RLf2+jMHlUFdjY3Try831r3xLYGueeOt8AC29hFwev48mpMHkF7FbO0vg4Y6somZov9qT
	 xCb/SOiIA+7tYn1v0acNoIsmwf6fP4xIr6j//u4lPZT6Gn2ZxXA1KIwYgllmqt880sCgG
	 CQEEb68duG3WpYUijhqBARhZvKtIpXtWVroflVkEyUxMXtFo61V48Ca+wCyv9D0AoPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 250291F00919;
	Tue,  3 Nov 2026 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689784;
	bh=v+dvVtZm4YuXJETCzToQrv7Uil5/9N0SUgOCdWkLGM4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=lB7mqgGR5DNsZhywpMvGOL3g/tDjMLPaDwlfUfaSZLiVUWsYym4e5idVRBRk4uOsv
	 sREiQ1DdaX4cABRGRyCZfXTK4fQRYFp+3bDwLWiJygMTj5lOoSHMw1iPYP+ydlWQ23
	 AmcwUQiy0h8/OeURHYgMUNXVFsmiQspXHQuIHA81FcFoAMfbxFZV4Fk6gYmSaMgZ+K
	 IMXset8nQSZidx+2+O51ZkKaVbciZX/63GekIAb9E4FFdX2+FSKEjMcX+41i1Vwlf7
	 zJxsm5+SrHsogILy5J6YobosOLc62dKoTxJcZvSHk0HTSoqRcqz73kyLM7n0XPPnhh
	 mq5r8DI9hI7Cg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9468546803;
	Tue,  3 Nov 2026 07:09:43 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Subject: [PATCH net-next 0/4] tcp: fix tcp_base_mss on passive connections
 and test MTU probing
Date: Tue, 03 Nov 2026 15:09:40 +0800
Message-Id: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALSI6WoC/yWMwQqDMBAFf0XeuQtGwbb+ivRgzMZuoaskUQTx3
 03rcRhmdkQOwhFtsSPwKlEmzWBuBYZ3ryOTuMyoyqoxpqzpmxaaw2RFR7pa6h93Wz+9s+w8cjg
 H9rL9px2UEylvCa/LxMV+eEi/J47jBKx0Vy6AAAAA
X-Change-ID: 20261103-mtu-probing-series-a87b39fdbedf
To: ncardwell@google.com, horms@kernel.org, edumazet@kernel.org, 
 kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, davem@davemloft.net, 
 pabeni@redhat.com
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793689782; l=1412;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=jaAiv7oc3XrWZgOFj0uLPEs+taPtXcOPn4WA+vqNjCA=;
 b=R0ssqhNpJtIIHhSW9RvoiT8+/dGCb3h6d3O0KPiv9vOh9NXFRP2xho9/v7joOVVI+7gvT8doP
 zAUmTlJqhtiC9As3pxD/3ZsBYNPq1EaKoZDsZA+kHGPg4t5nPkXsIIX
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com

While adding selftests for MTU probing, I noticed that passive
connections do not start at tcp_base_mss with tcp_mtu_probing=2.
Patch 1 fixes that and patch 2 adds a regression test.

This has been wrong since 2014 and only matters with a non-default
sysctl, so I am sending it to net-next. Patch 1 changes behaviour for
users of tcp_mtu_probing=2. Please let me know if you would prefer it
to go through net or to be backported to stable.

Patches 3 and 4 add the missing coverage for black hole detection
(tcp_mtu_probing=1) and for the MTU search on active connections
(tcp_mtu_probing=2).

---
Yongjian Wang (4):
      tcp: sync MSS after enabling MTU probing on passive connections
      selftests/net: packetdrill: test tcp_base_mss on passive connections
      selftests/net: packetdrill: add TCP black hole detection test
      selftests/net: packetdrill: add TCP MTU probing test

 net/ipv4/tcp_input.c                               |  1 +
 .../net/packetdrill/tcp_mtu_probing_blackhole.pkt  | 37 +++++++++++++++++++
 .../net/packetdrill/tcp_mtu_probing_passive.pkt    | 27 ++++++++++++++
 .../net/packetdrill/tcp_mtu_probing_search.pkt     | 43 ++++++++++++++++++++++
 4 files changed, 108 insertions(+)
---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20261103-mtu-probing-series-a87b39fdbedf

Best regards,
--  
Yongjian Wang <echoowall@gmail.com>


