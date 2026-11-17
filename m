Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952467;
	b=faiWV/sHKnrVC5RasYReZX+ENrYO5OlRvqaEdpwBsqmllchvBJFTEQB6+zwejRrCJVL3
	 +REpHTptyFkjbk5fVOeGWANmyEablvUJJPo6hk3uNTtpw0QRGrmns1bIfIPriOoFdKHBK
	 0bN8n1BXm1D+uHx6gNaZx/CudJHdnpfmmeDvrNVjVRVA3TPAxSkNkQQMDG9AtCsx49IR1
	 DHRYN6h5Ug3COyaqwwe/iEUL7GM5m02dTnbCxy3iKql85jgvps4VUOktsk0LANvKHHaNP
	 cm25MoH6zaG/CxiXXsDypHpEmSlAuOwRCX3Na6IMFedUfK9ame0qnXJzLCvj6foEneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unHyNeWX8PX1jyirARf+iKrxDFRYbbmelnAqb9Mc0co=;
	b=ChjB68z8ZmdEb9yBR56SYdlk0Hq7L3XANGOxwfQyTzQwszcJhAErAf8JNcjiSNHXe0MX
	 VQLCa+tzuq22ZaP2VI47GNsvOCrmqSByhEoVxw4gBruGY91BkWqvwFVeJc97Q2eExTFO9
	 lXEgBVDQT9hXMoiIYN29r7+UwOJ2Dr12fITwKX557GT9lB9W/+EQ5AAluzoFsXWaon6xo
	 9AkLu4TaK9J6Yin6eNapZAcy7ytOQV96hLiMPwsmBLwA53lT3+DA0gERpSXo+Z649Bqma
	 XzxSgC5s8XZxZjZOtlyN77t35sRSB/7n9q1WLBWGymRLGtRWXcP2xruNhSngLcBAETQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=riBjzB5M;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99B1606A334
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99B1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=riBjzB5M
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso113387a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952466; x=1795557266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unHyNeWX8PX1jyirARf+iKrxDFRYbbmelnAqb9Mc0co=;
        b=riBjzB5MVLmRh3b1aBuzUIyK3vQW1es77xK0z8CytPctKTSIfvXk0K/rNw9u+Hgzr+
         kVuDVQ/19TWUs2FWaWGrF/RmBLI6do4qWvlV71Pi+omw9UZavtXCuQbDW7pO6ZbsxKqp
         aZ2mA2arpJrAum4A6WZy3AeittLsfQqAc3q1YFvL8fdME14wF+eYBcWOwXm/+ovmf9/S
         ZDwnz84QSnb1/0EaY7/2OIGDQ9PyCVdEiHYk1cQq06H2TnjS7pOGMPnrmG/xGuXy/WXo
         UJIDHDD0P6RpqkRymrW9yEStG05syQGCwKxSfQ0IOJoZMLTqBEtUVXqVC2MKoAdG5xNY
         m+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952466; x=1795557266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unHyNeWX8PX1jyirARf+iKrxDFRYbbmelnAqb9Mc0co=;
        b=fOugDPhghvj2FF3sPWPaINTsN25Hmq57Sgrtr/Zv/1yU71c+fbC1H3Dy72uwJ9z5ME
         SnDZGNb8Vdw8abwf6qrxrpvdLCaD8YkdN6Hj8w1G7invh0daCpF1eeg6W6heMcSd2+pk
         +G23OO3k+I3Vl3PAwZZaEhRWaIqNrO65XRRgJmBzYh5uE/lQFfeS9rKwTMNiYJWk9R78
         GlairYiP+fUktxmYLZjDPo/FzyS4hgs3IVzrCQba2zgICOdAk3pM49+Ylb0TrmZVSxm/
         RnVyYmrQ6BgNYBZShJr5HNbmgIGO+OJ0lLr1BouNRu9tMvN7pkCmLmDDEoQCiY4BAzHF
         A3EQ==
X-Forwarded-Encrypted: i=1; AL+hErE2Vs6U0EL/susKw04xUqmUc0iC098RZD9eISfoCEuqxvT0HW4LLGgvXuxVyLdJT58ZqcBg5LwG9cpVhimaM54=@vger.kernel.org
X-Gm-Message-State: APuU4Z++Qbk4XWHBWzA/7Q/9YAYdkgKe0tu9EEKnbsT5BcQSrnPVZl27
	3ew+anJeTTsHq45gPaxGTR64jSUkT5dnZiVkraCVUfUbYL4CE9cE72z7
X-Gm-Gg: AZFdTZc6yEzmrYV/EAwLsTrDOrmmywKRFRT4NBgwWIkEMYG1D3neA+QuqbxZyX60467
	MiikpA2cpq3oJ0IlUHkb8utsWXYZWFditioE7F4XAbuTOAhrRFbArgMHHkl/0EDpoPhtd8hk8pX
	+tz0oKiCwG0JWwk4ImyE7S11bsOIL0Uc/BMq5EbZq3h5EsqB5Ob9JRFMCNjvpXbBA/CDqMiIx2t
	RLWxHctNLllFcSS/cWp5zlyjC5kT0e8PZuNHSh2rs3z0RwPsbvtp+1Zxp4y9etRcMGJVVwbJ1TD
	jX3NPxMF2QuUPGwAW4DzvudwjuwdA3KKCFVAxgf+vFFcs5V+m5Amd6cwVWYl4swvctFAKnRCgmL
	zmlN9laID8CnkDkjKZfFF0YPZiSXioLgxW90hx3jtSRDKoHE4huDFdPMuy65piwbNjGBdCWwh8e
	l+Jl5L5Y1qU42br7TI0dxfeB9uo4skjPMof5GgwhdL14KVY3ghO5ewElO7Ryo8XKcpuq6pIHWoX
	UB8ofK9HimUlSoKxqnT/4fNXr5ebSk59YXVIAXETyyyMyetuIuvC3hyRnjazK37mJwGj8+ko1wo
	YopwFqtXYx6+lLzyn9XYbw7TsX5g5hdHLOQ=
X-Received: by 2002:a17:90b:4b0d:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b3d0759d9amr653141a91.14.1794952466153;
        Tue, 17 Nov 2026 13:54:26 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm732056a91.10.2026.11.17.13.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:25 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 4/5] netdevsim: report fake timestamping stats
Date: Tue, 17 Nov 2026 13:54:15 -0800
Message-ID: <20261117215416.1901246-5-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

drivers/net selftests can't skip on netdevsim. Implement get_ts_stats
with fixed counters so the stats test can read timestamping statistics.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/netdevsim/ethtool.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/netdevsim/ethtool.c b/drivers/net/netdevsim/ethtool.c
index c3d2bc783d55..e0c4c96209c4 100644
--- a/drivers/net/netdevsim/ethtool.c
+++ b/drivers/net/netdevsim/ethtool.c
@@ -205,6 +205,14 @@ static int nsim_get_ts_info(struct net_device *dev,
 	return 0;
 }
 
+static void nsim_get_ts_stats(struct net_device *dev,
+			      struct ethtool_ts_stats *ts_stats)
+{
+	ts_stats->pkts = 3;
+	ts_stats->lost = 1;
+	ts_stats->err = 0;
+}
+
 static u32 nsim_get_rxfh_key_size(struct net_device *dev)
 {
 	return NETDEV_RSS_KEY_LEN;
@@ -275,6 +283,7 @@ static const struct ethtool_ops nsim_ethtool_ops = {
 	.set_fecparam			= nsim_set_fecparam,
 	.get_fec_stats			= nsim_get_fec_stats,
 	.get_ts_info			= nsim_get_ts_info,
+	.get_ts_stats			= nsim_get_ts_stats,
 };
 
 static void nsim_ethtool_ring_init(struct netdevsim *ns)
-- 
2.52.1

