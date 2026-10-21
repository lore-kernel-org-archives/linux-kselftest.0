Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.60.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611151;
	b=z3W42hGWL8n89DzOiqM8GIxcEvrrlXp2jGVicJEpdiRLf9Qcfu6AFduEIm6LfJydSUHG
	 zvHl2ONGV77rGdbg3FRU9VWe76bIX9KbKU8fdd8704Ebws4fCNcFFqDEp1f2bi0OsjlUt
	 XJ87DNZ0NWO6ZYitYhhpMy/qyBcT/vCL9eg3R8DvIP8mAKFCDDgBXPeEu/IAXP4guaDMG
	 CzP8WJFqz8hhrL6+KnGQsCCQ0VtjCBjyzezZAKfsgO5cqkdGu3wEFERBm+r13kUAujcTg
	 LOAWRkwGiw8OkB1DNMmtlUN01om1WZpTcehTHjilxUVBK5Yd269qWMM2dwowMywjlHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611151;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1AJY1HD9iPJ3a+q19RwNVosen9aefHlKpAJgGPFeVDA=;
	b=YGKnR0GU/zJHtkq3/eEFj4CFi7ym4HHB4B2GkrS9AEH4ycQLNp/WB+hoajdSyALwYYTu
	 TcNoUFCA8HjZdbta9I30efL3xNgYh9td9PKIhsIRs4gxnyvNKK70hh2rw4VuOx1aOKTDv
	 ALWxd7LZ5nQtbQUC6RcLPUsCqRDw7RcSMGy5IBZDgAQf0jrQ9DdvklAb58Q/wxpcNbH4v
	 PYVwDJZ4cJycI8ElXp73ss2L4U27foi2IGKN05MUw8xRCjcaemj2TS7t35Iao6B2KtfMp
	 Lf95J/SCLq3FM3iGKw95JtLVoq0PhbeV7g3sNzAXNuq8r7TArKkElzC5+L0CqLbyEmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=corp.free.fr;
	spf=pass smtp.mailfrom=corp.free.fr;
	dkim=pass header.d=corp.free.fr header.i=@corp.free.fr header.a=rsa-sha256 header.s=rcs header.b=ao+upnbF;
	arc=none smtp.remote-ip=212.27.60.169
Received: from rcs.proxad.net (rcs.proxad.net [212.27.60.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78343606A31A;
	Wed, 21 Oct 2026 19:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78343606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=corp.free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corp.free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=corp.free.fr header.i=@corp.free.fr header.a=rsa-sha256 header.s=rcs header.b=ao+upnbF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corp.free.fr; s=rcs;
	t=1792611149; bh=XJFGUhlZSKILX5id95wAKnDTG9dzFSXEXzMAUiWNc7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ao+upnbF1cbKALI3wu3gsyG6cGn2HnfN82kX79NeZajCjcoaNFiwzMG0cL0nYHknI
	 kX7oepRVoYCPJihv5Q5EEEQfhVDfXRHzxIGMYoJ9J7UCJDRc14U0QbLccu0R7PZuoF
	 8jtYraZ2ExZ7HZC/lhww+rb880cc0nocir2k/UCUvt5sjMZrYsgDuSz3OpMnCzNbvb
	 GTPCZxd56ga5A08YhtqFiwS27h8qyEyJFGiBbwxL4mK0HHNoMVB2M3ikjS5+5I8yYX
	 6hjCKuLaPbewan3ptYLrNld9pGvuJo+6X/FYoz2nX1stM57TZEXQXMpy6tr5h/HTO8
	 wlnAEwu5H+MYA==
Received: from lnxos-dev.home (82-66-150-212.subs.proxad.net [82.66.150.212])
	by rcs.proxad.net (Postfix) with ESMTPSA id CFA1544C2B43;
	Wed, 21 Oct 2026 21:32:28 +0200 (CEST)
From: Alexandre Cassen <acassen@corp.free.fr>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 1/2] net/sched: act_api: inherit filter offload flags only on new actions
Date: Wed, 21 Oct 2026 21:32:18 +0200
Message-ID: <20261021193222.1318333-2-acassen@corp.free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021193222.1318333-1-acassen@corp.free.fr>
References: <20261021193222.1318333-1-acassen@corp.free.fr>
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

tcf_action_init() gives the skip_sw and skip_hw flags of a filter to the
actions it binds. An action that another filter created gets them too,
they then apply to every filter that uses this action. When a
skip_sw filter reuses the action of a software filter, the software
filter silently stops running it. This happens even when the filter add
fails on a later action. A skip_hw filter likewise prevents a later
filter without flags from reusing the action.

Give the flags only to the actions that the filter creates. The mismatch
check still rejects a filter that reuses an action with a flag that the
filter does not have.

Discovered by manual code inspection after the Sashiko AI review [1] of
a tunnel_key patch questioned how actions get the filter flags.
Reproduced on netdevsim without kernel changes. The egress filter below
runs in software only, since netdevsim offloads only ingress filters.
Once the skip_sw filter reuses its drop action, the last command shows
skip_sw on this action and the egress filter stops dropping packets:

  ethtool -K eth0 hw-tc-offload on
  tc qdisc add dev eth0 clsact
  tc filter add dev eth0 egress protocol ip flower dst_ip 192.0.2.1 \
     action gact drop index 1
  tc filter add dev eth0 ingress protocol ip flower skip_sw \
     dst_ip 192.0.2.2 action gact drop index 1
  tc actions get action gact index 1

Tested with the reproducer and the tc-testing action, matchall and
flower tests.

Fixes: 34d35b4edbbe ("net/sched: act_api: deny mismatched skip_sw/skip_hw flags for actions created by classifiers")
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009051930.3619697-1-acassen%40corp.free.fr [1]
Signed-off-by: Alexandre Cassen <acassen@corp.free.fr>
---
 net/sched/act_api.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/sched/act_api.c b/net/sched/act_api.c
index d9d4f7097624..f238140d62ca 100644
--- a/net/sched/act_api.c
+++ b/net/sched/act_api.c
@@ -1551,6 +1551,9 @@ int tcf_action_init(struct net *net, struct tcf_proto *tp, struct nlattr *nla,
 					err = -EINVAL;
 					goto err;
 				}
+				/* Other filters share an existing action */
+				if (init_res[i - 1] != ACT_P_CREATED)
+					continue;
 				if (skip_sw)
 					act->tcfa_flags |= TCA_ACT_FLAGS_SKIP_SW;
 				if (skip_hw)
-- 
2.43.0

