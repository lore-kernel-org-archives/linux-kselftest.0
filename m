Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE663905E0;
	Fri,  4 Sep 2026 23:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563880; cv=none; b=Wf0NaBGT3L6UbRUJmITlU64tt+IPqJiVrjQn0/ZJBZrY90bT3Q/7BWit9uq/UVbE/HYzdzPAgeWgOhRNBz810UND4pc02Ss0cAzQHUKRwTbOxuNG800pkw5yDlWeN9weQ3gGL2BZATQerIP4E0ZU9MCtAfZc99J3OLu9W5C6i/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563880; c=relaxed/simple;
	bh=Je5rppzro5SvsrXH8xm34g6LDa+dhjB0Fuob0zI6ygw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lR+/iUHk+0tGNGILUf1gNlcvKQxZkfcv/slwZacvioPtKx5B3xyUCa7DOJZlFPungVXJjwPHevF/v3TLFTYWJO05u3EVeOt9Ksag/UPu4DKaviCyv42mF+wkX6L1AukeBCmfdRUvtjznxwmwf1FwvU92+0scb9KiHJARL0MNK00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlJtH9t0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlJtH9t0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4F61F00AC4;
	Fri,  4 Sep 2026 23:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788563878;
	bh=lgYUi4AtgkCgP00aYeaLm4y6mlTg/I5rBP1KsKrg/B4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dlJtH9t0SC1t2MSQvy+o3NhSUcQnSHYVlGvvktN0DUKgkD8U9I57UZ3OZSW0h8OQT
	 OaNcBMxp91ifJCp/PS1uSs+nQjcM9OqCMIp3WZ8nedDYIDonF0P4Tg3ZwhIFreNNX0
	 SVVwMrb368nIaT6KP5dEAz/CfruV3MHmJQpbWohjb3hRnZHa0AZTQBP45ZuTlXO20e
	 ZVq0qS1BSrydGKibcDaNug+P1J7yObECxGsNN0qj4w2f7zaSTs5pLU7kOPuUHheMBv
	 edbWyrXm937PhZ37+/wpisIYJCEr/xbgoziSGQ9c9SS9GBzBBqhd6P/VQlSrjtUhqq
	 k+7VuOacnI5tg==
From: Jakub Kicinski <kuba@kernel.org>
To: hemendranaik@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v5 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Fri,  4 Sep 2026 16:17:57 -0700
Message-ID: <20260904231757.4082435-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902035231.81866-3-hemendranaik@gmail.com>
References: <20260902035231.81866-3-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
selftests: tc-testing: add fq_pie per-flow class stats test

This adds tdc case 83c0, which builds a TBF parent with an fq_pie child on
$DUMMY, injects ping traffic, and then greps the output of 'tc -s class show'
for per-flow fq_pie statistics.  It also flips case 83be so that 'flows 65536'
is expected to be rejected.

A couple of questions about the new case below.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> index 229fe1bf4a906..d4081fcb09336 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> @@ -12,10 +12,10 @@
>          "setup": [
>          ],
>          "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root fq_pie flows 65536",
> -        "expExitCode": "0",
> +        "expExitCode": "2",
>          "verifyCmd": "$TC qdisc show dev $DUMMY",
>          "matchPattern": "qdisc fq_pie 1: root refcnt 2 limit 10240p flows 65536",
> -        "matchCount": "1",
> +        "matchCount": "0",

[Severity: Low]
This isn't a bug, the flip is correct: patch 1 of this series does add
the cap in fq_pie_change():

	if (!q->flows_cnt || q->flows_cnt > 65535)

The only remark is about the commit message wording:

  "Update case 83be to expect failure for 'flows 65536' after patch 1/3
   caps the flows parameter at 65535."

Once these land, "patch 1/3" no longer identifies anything in git history.
Could the commit message name the change or the behaviour instead, so a
backporter can pair this test flip with the kernel change?

>          "teardown": [
>          ]
>      },
> @@ -40,5 +40,32 @@
> +    {
> +        "id": "83c0",
> +        "name": "FQ-PIE class stats accessible via tc class show",
> +        "category": [
> +            "qdisc",
> +            "fq_pie"
> +        ],
> +        "plugins": {
> +            "requires": "nsPlugin"
> +        },
> +        "setup": [
> +            "$IP link set dev $DUMMY up || true",
> +            "$IP addr add 10.10.11.10/24 dev $DUMMY || true",
> +            "$TC qdisc add dev $DUMMY root handle 1: tbf rate 8bit burst 100b latency 100ms",
> +            "$TC qdisc add dev $DUMMY parent 1:1 handle 2: fq_pie limit 100 flows 1",
> +            "ping -c 50 -i 0.001 -s 500 10.10.11.11 -I $DUMMY > /dev/null 2>&1 || true"
> +        ],

[Severity: Medium]
Can any of this ping traffic actually reach the fq_pie child?

'burst 100b' sets q->max_size to 100 in tbf_change():

net/sched/sch_tbf.c:tbf_change() {
	...
	if (tb[TCA_TBF_BURST]) {
		max_size = nla_get_u32(tb[TCA_TBF_BURST]);
		buffer = psched_l2t_ns(&rate, max_size);
	...
}

and tbf_enqueue() drops oversized non-GSO packets before they are handed to
the child qdisc:

net/sched/sch_tbf.c:tbf_enqueue() {
	if (qdisc_pkt_len(skb) > q->max_size) {
		if (skb_is_gso(skb) &&
		    skb_gso_validate_mac_len(skb, q->max_size))
			return tbf_segment(skb, sch, to_free);
		return qdisc_drop(skb, sch, to_free);
	}
	...
}

'ping -s 500' produces roughly 542-byte frames (500 payload + 8 ICMP +
20 IP + 14 Ethernet), so all 50 packets look like they are dropped in TBF
and fq_pie never sees a packet.  $DUMMY is IFF_NOARP (dummy_setup() in
drivers/net/dummy.c), so the neighbour goes straight to NUD_NOARP and the
ICMP frames really do reach the qdisc, and there are no ARP solicitations
that could stand in as smaller traffic.

With nothing queued, fq_pie_walk() skips the flow entirely:

net/sched/sch_fq_pie.c:fq_pie_walk() {
	for (i = 0; i < q->flows_cnt; i++) {
		if (list_empty(&q->flows[i].flowchain)) {
			arg->count++;
			continue;
		}
	...
}

so no 'class fq_pie 2:N' line is printed and the verify step sees 0 matches
against matchCount 1.  Existing cases using the same
'tbf rate 8bit burst 100b' parent in
tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json keep the ping
payload at the default 56 bytes so the frame stays under max_size.  Would
dropping '-s 500' (or raising the TBF burst above the frame size) be the
intent here?

> +        "cmdUnderTest": "$TC -s class show dev $DUMMY",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC -s class show dev $DUMMY",
> +        "matchPattern": "class fq_pie 2:[0-9]+ .*prob .*delay .*deficit",
> +        "matchCount": "1",

[Severity: Medium]
Which iproute2 version prints these tokens?

The 'prob', 'delay' and 'deficit' strings correspond to the new UAPI added
by the first patch of this series:

include/uapi/linux/pkt_sched.h
	struct tc_fq_pie_cl_stats {
		__u64 prob;
		__u32 delay;
		__s32 deficit;
		__u32 avg_dq_rate;
		__u32 dq_rate_estimating;
	};

fq_pie_dump_class_stats() exports that as an opaque TCA_STATS_APP blob:

net/sched/sch_fq_pie.c:fq_pie_dump_class_stats() {
	...
	if (idx < q->flows_cnt)
		return gnet_stats_copy_app(d, &xstats, sizeof(xstats));
}

and tc_fill_tclass() tags the class dump with the qdisc kind:

net/sched/sch_api.c:tc_fill_tclass() {
	...
	if (nla_put_string(skb, TCA_KIND, q->ops->id))
		goto nla_put_failure;
	...
}

so tc routes the blob to q_fq_pie's existing print_xstats, which only knows
the legacy qdisc counters (pkts_in, overlimit, overmemory, dropped,
ecn_mark, new_flow_count, new_flows_len, old_flows_len, memory_used) and
has no notion of the new type discriminator.  With any released tc the
regex matches 0 times while matchCount is 1, and tdc has no iproute2
version gating, so the case fails permanently rather than being skipped.

The commit message says:

  "The test fails on a kernel without fq_pie class ops."

Should it also state the required iproute2 change, since the case cannot
pass on a patched kernel with a shipped tc either?

> +        "teardown": [
> +            "$TC qdisc del dev $DUMMY handle 1: root",
> +            "$IP addr del 10.10.11.10/24 dev $DUMMY || true"
> +        ]
>      }
>  ]
