Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968907;
	b=FQ06lWWPvevbx7APu9DXf4KWY+Pt32j8zdHKQeF6TanBKtYkkWu7AtMOaWpNwmEVE1Hq
	 zU5KbybF2qzpuNT3jsNAwxwD9QEBXHTigqmFf7b/OpL4qrZ1qQT4ESNhQwmnynrgEIl3w
	 1UeWyrsj6gM13dmyT6Yz3GSLCpZ3bO9O4Q242u4DwexB7KBW7RL3hEIApNlxzRjhnxCX5
	 DHPFQV7Q6+PwVh+76/yV/3TvFVnNabceSgDu0hYAzXr2/TxtyGpR8EpCdnVOcWaPzTbdq
	 NoBwdJfsEOOa5oHWA0e2mW7qkui318vSG9jbh3eWSTyK8VNVs9DRVGc9sC4+AGCqcYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
	b=eE/z8i60qrD5Sy83Z9SHFyXjGKxgfNDF6B0qlMrdO2J7k8GMJasBrk7/alGSz5ElNNdp
	 Mh2ceSaXQGkghIXs/w/Yl2mMQGBxkoVOqkghdFuRn18pF5WPidzBdBUpPQdHOMawInElC
	 tO3YigX/K3Yhlf3/8pWtKg941kC+tuwzu7GKf8/5TPUFuXAxtWgP7R3zwLIB4fIDub0gi
	 +Wl7vioiVqWnjezuekLF82NvQ8v5GfcKYpsNZ/PfqUa7r8bVEzA7zAFQRzB3JJUe1tBuR
	 CufUv2wo5+PJ63a2i0Nq8EvVBabXa8rc1wF//pD2iJryKZpgCL1Ng4mTzcaYm+afJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy2Q+Xkl;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926D606A32C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 02:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7926D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy2Q+Xkl
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3088515ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 18:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968906; x=1795573706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
        b=cy2Q+XklQ5KqHJHhh/oFJkmh2mqiS/bMvFmsez1b8zvlbdGO1ZLx7dgOmdH7qom5Dr
         kh226ubwjOb6PxOYf68rstZZ1Q2z3P3dyvyIKJnUR3VlFSdRAYXxsoPehePvwxdkhRXs
         DeUEDiCP34ccd7e8hDOHxOS1UfC6z4vlOiBL4j5VrgtcS7XUyUFDo50v3kcsDj7N7KfB
         y1NNU42aTxX7sssOs3AhlJ0viv+klJfxsw4nVVyXxMIi0doOelpjrq1dr6dZoEvBhAZM
         dOuYgQCT1igPRWXDkb8hbj3fKv4+6JCtr4xtv+/khzeHnNepF8f/tYk+kSCentJ9/A3U
         9sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968906; x=1795573706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vta/0qgav/rUrht9WwF12uEPKYQmyrrbFSNEVdW8o0=;
        b=0toMFcRkI4IAGKXUXawJOXqLNtdzBINVnod8Pbnm7uQe3D3MoWfLfMoclmp92XlVln
         VkRnsfmlLcaAaZ81DTsNyBmyMxSPOexg3/5oSdqIHHw6Xdss94Oq2DxzYuDbZ8uF/YjQ
         c3GVnn2vhZ1w5r9FUdhfKXgMV8NyR4MJUOs7Gx6AMyiXQP2cYUw8GBYnaBDLEntVg7ZJ
         t+xID4Qv8SmHqSIFv0DTJZqgl1fjgsL8JsA4unia7ZpeOcCuGwFK6+RrsH1v2RkCMhbT
         D2CqnAJIXsI7OU86lilGFMxOXlHobTXyOos0bOA0vgctLnjXIzOx1CVLXnCAZNdIPjgs
         MmIQ==
X-Forwarded-Encrypted: i=1; AL+hErGXx4JyfAAFB06rGQRlTx2m0gBMMo9PHbLtvLu7O/v2w5jS9/eHly4sAe6sHRcTd2JcQ94NHSVd7ZxGYspYJ6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5GPdJbwJqHemP7HlK0HpImI8DhZ4H/tgimu3B1dk44yxMBlds
	JOH676psJMOl5F6vEd2TtbLpIo8VTPXV8xa/8SOfx1Bm5MaaNDK07Krq
X-Gm-Gg: AZFdTZfwaTFfp5hDJyH2u10hbxlK/KtGUNV7HVWD8NMwVJDMQ66WY+9DOTuSXk+NUj0
	5ntPU+HMZbVwqAiBMCbOT6kY0E4j792v8r+3p6heSW8A/0YKahyKeHZO8GqlMZcfBKloy0wYKGL
	NWmd37TwGRlztRMCNVYX2ITcx99I7uhL9Kb+3oCAXxBAdKDbCqiL+lcCHye0DiFuPmuy1hbZwj3
	v3NIoAHfjFIuN0z+GabXnpnOwa11OHo/nWAYJ93sGbvO0aVOs7E0hQG7vvCd2p9Mk8FhW1GAXJk
	zZ2hsCzLpcfvFM2kU3G45egbffIvphVHW3s/emgb3gcCaZu0Y85MS0EKJUcw0FacOCTWD9/R5DE
	YOxR3hF3pBMLOxv38Ynj3UPSGlBxFTTvdyCl40QPYTv4D6Y4QNLEoqcXf7SVdgRUmDgahjpC0s9
	/JHHJXMhB8ng/ZGaPrmAQTjX8M85jc+SDmeFa/aIpvcM0U1pd7kzWcOIrF9wr4GqMSYcyNirKFW
	WcQLy3urZ8KC8ZXxt610moeN+nUvaQUigf3ii4ffaV7EJBoQJRC7sYxLF7HJ0gCItGNnYY2kmH5
	Pay0ZM17Sor4xo2xlq9e3qPw1EAvyqroP/1dNqs77ShqhPjyz2G2DZUQ1lqhpv+GE7/OXwR6p3i
	GzBE88uFkUBVzlf/YcGWLX+s=
X-Received: by 2002:a17:902:cec3:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2eff754e4d0mr12461425ad.57.1794968905750;
        Tue, 17 Nov 2026 18:28:25 -0800 (PST)
Received: from message.eml ([2a09:bac1:76e0:450::21f:e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6181423sm4715605ad.32.2026.11.17.18.28.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:28:25 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] tcp: roccet: do not restart from idle on RTO retransmission
Date: Wed, 18 Nov 2026 10:28:12 +0800
Message-ID: <20261118022813.9778-2-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118022813.9778-1-zhiqizhangg@gmail.com>
References: <20261118022813.9778-1-zhiqizhangg@gmail.com>
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

roccet sets .cong_control, so tcp_slow_start_after_idle_check() returns
early and roccet implements the idle restart in cwnd_event_tx_start().

An RTO retransmission also raises CA_EVENT_TX_START: tcp_enter_loss()
marks the outstanding packets lost, which drains the in-flight count
while tp->packets_out stays non-zero.  If delta >= icsk_rto,
roccet_cwnd_event_tx_start() then takes the idle restart and overwrites
tp->snd_ssthresh with tcp_snd_cwnd() == TCP_INIT_CWND.

When a TLP probe was sent, the RTO timer is rearmed for a full icsk_rto
at that point and the probe is the last transmit, so the first RTO is
affected.  Without TLP, the first RTO can escape: the timer is armed
when the first packet of the flight is sent, and pacing spreads the
following ones, so now - tp->lsndtime < icsk_rto.  The second RTO is
always affected, since it fires one backed-off icsk_rto after the first
RTO retransmit.

roccet_state(TCP_CA_Loss) calls roccet_reset(), which clears the private
state; ca->state is already LAUNCH and last_max_cwnd is already 0 when
roccet_cwnd_event_tx_start() runs, with or without this fix.  The only
field the idle restart breaks is tp->snd_ssthresh: it overwrites the
value preserved by roccet_state() with TCP_INIT_CWND.

Skip the idle restart while packets are outstanding.  The packetdrill
test in the next patch fails at the first RTO without this fix
(snd_ssthresh == 10) and passes with it.

Fixes: 819d59638796 ("tcp: Add TCP ROCCET congestion control module.")
Link: https://lore.kernel.org/all/179179785248.434549.16829837649351382748@kernel.org/
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 net/ipv4/tcp_roccet.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_roccet.c b/net/ipv4/tcp_roccet.c
index 04b9e52466..1769e4bbe3 100644
--- a/net/ipv4/tcp_roccet.c
+++ b/net/ipv4/tcp_roccet.c
@@ -1144,8 +1144,12 @@ static void roccet_cwnd_event_tx_start(struct sock *sk)
 			ca->epoch_start = now;
 	}
 
-	/* After idle periods, go into LAUNCH with slow start */
-	if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
+	/* After idle periods, go into LAUNCH with slow start.
+	 * We are not idle if packets are outstanding (e.g. RTO retransmit),
+	 * see tcp_slow_start_after_idle_check().
+	 */
+	if (!tp->packets_out &&
+	    READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_slow_start_after_idle) &&
 	    delta >= inet_csk(sk)->icsk_rto) {
 		tp->snd_ssthresh = tcp_snd_cwnd(tp);
 		tcp_snd_cwnd_set(tp, min(TCP_INIT_CWND, tp->snd_cwnd_clamp));
-- 
2.54.0 (Apple Git-157)


