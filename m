Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689786;
	b=ySgH+Yd8Y5ss7CzAyPzrIYoG/XKZMouva1hgV3Hz/qobmdS4jSwWFLMriH7MwJ4IO9jR
	 mHfnV6r3aLAQgd3bupaLtRIq3LvWHY40X+TrK24Qz7HFI9ZQcYgYUkLgINxORpYCr63sQ
	 ei8syLuL4KVGGYWqQ4D2P5fnx8HFffBg+DAZmbu6JQxDfoEirIOLe7UMTY6HTy5aPPFeM
	 Hzzq+nj72UHjtWlIwFXjN58o01gn+HEY6CC4vU1OfRUbqkzuAji0dGH9ZZRisTTPEzGyg
	 1xH06rnHfJR+OreajQqkrI5jBcoAlimXpbRcy7X5giQ/KTd4wRsC5SddLT1bgV2r2qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689786;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4ZXGoeaecI3R+ku+uI0n3D6iOdN3aQFXKi0GwMW6rKc=;
	b=AhodPdYyDFcdunVCWpJHDsSoXVAWeLlPziGp3mk+4y3/SsYEvWOPk4s5kF4LkFCMbwhO
	 F1+LbWs8hNzIr9mjxj9k9g1TAcMhuuc/46UzFKSL3LdWZItnSdc0NyuItQLfpgcNh84Dy
	 QFnsqF0KvcEdnszLhz/G8GV0hUepjQQcZaHrA/zXp3QKRgMmjSRW3DbfoaB7sXVZuLJAg
	 n+PxLbhg5HVRvwoDU2vjkoefZe/BBXz0ZSTFOca53xHuGNxBKSIPYzB/c9q2Vp64XNQFO
	 YK12cUSez5XvvQ1Jxz3aPxfEM+qukl6Ofvet8mr6e5+pK+RBXYBCH0FZHoJN7POTzLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzbJrUnl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C34606A32F;
	Tue,  3 Nov 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzbJrUnl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793689785;
	b=BkVHtRpmmyCXmxZpG/NMZHplfbzzSbzyKT6w8vl7ughlgWZlyiHgbtzYC2hxyRemNCG2
	 Ib7m8F6lDTHvbsAqCgqDSsx/Xn/cg3fKqUSbapfqfU/IxFlKt358Sj0a3aYl6Zcpq2uvO
	 3X+8DdFeJJV+7Jnqd7Ii2M3MOPXV67CKj0Df0IcEZb/Ou03nvb3sVKgPyqr9jBIIjXKK4
	 vBlLWmvGXNTieQXWqnOtqLHNIzu7HKqMwetAcso3iCEWN9hKP1AYwzKaUrBcg7fW7QgV8
	 KBp9FscKSy9KkpAPZxZBA+Bn/ghPPAtgKkvslKgcC27AHdWJm0/spEDUBfeoZlSDf0g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793689785;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4ZXGoeaecI3R+ku+uI0n3D6iOdN3aQFXKi0GwMW6rKc=;
	b=rrRNsihnrlUSz4w/0xCUEw9frVjl1kv+Q9TaeDuswR8ChyAV3bureHEE5EL7yejIYuul
	 WnZoiY+Clb6X112DkMigKU3gu5DPtexa8SQAamOewH6Drri+QFvdCvEMfRK2bt9piQ7vA
	 8lJNlobINFz2aovJZNqce3lV2iRq81T5Ha6ZeMIOS+uvN2CRZz2Z8nWoVGu9Qx159JmpH
	 0AEcHztCSASPLMVQkRUYrAlvxNK8RnxAjkKLGAHgPD+8s8woWPKL7TFNIvbyDRUMiRtIS
	 MtiYZDfJDp5nkJdLrI3f93+cczKaSXPGoPug5IBvn9gvu4ZGdgx/HYmNGHPQzOL1BwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32F2D1F0093A;
	Tue,  3 Nov 2026 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689785;
	bh=4ZXGoeaecI3R+ku+uI0n3D6iOdN3aQFXKi0GwMW6rKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UzbJrUnln7KUblOpri0xsTclaBUoIL1cHU+5r7UHMdJ9dDozaoL+twOdLyy1rUnfn
	 2jXzfoB3gSku7CgdYbAFYt0nYPjuNmylXO/UtW5c4RcUpG6UsyHbaLGMcXOlr5agI2
	 HgSsIsmY+vsbabxcQCB/m4DO3aplMRlcWZfZayen8Y2C9XBL+M6u/dQCf7v3v72qs+
	 N7+12pl5K4O0xs9gQ/hnKYseHY6CICSqWuoQh1sbsBd6WTgTsQsljy6SKRhF71Ezxy
	 7HUwbooMbxm/Zz6ieTkB6QEpRQzypUM7wmm0CsI7GDybr9r2ZBb8iUJdBWhk44LdQR
	 bfUzV87ixJ+TQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A5EE94680F;
	Tue,  3 Nov 2026 07:09:43 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 15:09:41 +0800
Subject: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
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
Message-Id: <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com>
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
In-Reply-To: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
To: ncardwell@google.com, horms@kernel.org, edumazet@kernel.org, 
 kuba@kernel.org, kuniyu@google.com, shuah@kernel.org, davem@davemloft.net, 
 pabeni@redhat.com
Cc: netdev@vger.kernel.org, panweiping3@gmail.com, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yongjian Wang <echoowall@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793689782; l=1710;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=tSHTvLLOgSct9GANl8Ovs5A8DeUQK9fuisCWedGxu7I=;
 b=7Tuc9x9qlwRRMrOUN0q9KpwoW68HcV6dbFfC2aK1nOFsRzIcMveRC6d6Yba8chy9dxCbiOYrf
 CLZ90SfAumHDbF19G781Pw4knGykv4OSB7nuki5fSKx96gysjQBgGev
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com
Content-Transfer-Encoding: 7bit

From: Yongjian Wang <echoowall@gmail.com>

tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss()
before MTU probing is enabled, and tcp_init_transfer() enables it later
without syncing the MSS again.

With net.ipv4.tcp_mtu_probing=2, a passive connection therefore starts
at the full MSS instead of tcp_base_mss as documented, while an active
connection starts at tcp_base_mss. This has two visible effects, shown
here with tcp_base_mss=1024:

 - The MSS drops when the first probe is acknowledged, from 1460 to 1242,
   although that probe has just shown the path can carry more.

 - On a black hole path the MSS never tries tcp_base_mss. It goes from
   1460 straight to 512, since MTU probing is already enabled when black
   hole detection triggers.

Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only applies
search_low when MTU probing is enabled, so the other tcp_mtu_probing
values keep their behaviour.

The Fixes commit kept tcp_mtup_init() in a single place on purpose, so
sync the MSS next to it instead of moving it back into the
syn_recv_sock() handlers.

Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
 net/ipv4/tcp_input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index e1f2d9765..c13f005b2 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb)
 	struct tcp_sock *tp = tcp_sk(sk);
 
 	tcp_mtup_init(sk);
+	tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
 	icsk->icsk_af_ops->rebuild_header(sk);
 	tcp_init_metrics(sk);
 

-- 
Git-157)


