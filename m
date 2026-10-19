Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445981;
	b=KAxsouSWLTG8pH8cu9K7Orjx7VWPJv7pheUDTn+7EYNmL3rNVvGw2PeYEML/R/5t2cDU
	 hwgN02ws0FGwTxD6W/p3rPd/LHjt9rP9L/WooBqwbYSIJR7WrvSg1eq6Wm/M6lMknzfLK
	 eWMOVvcbNt+FPEXi5nyJAEWHtgg4NuSBMskFFd3ZDIaeDiIFCdaLuqJxp3KTC4XkBLYm+
	 KeAh6/bIYGifaLRyri6u/ssjDmVLN1DKccBVIMfAdhZzf2EdE3Y1XhcNCctrCzLJPaxPW
	 mkt0ZHKsvNrdSry04efvp7AyqHgp/jGzUJX37VY0EAcYZTiF6PmMudOYiVKb51x9i1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445981;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ayfk9D707IuSir5watYa+UkolTblVMoJkmhTWHZ/yKw=;
	b=UlsCfkZVNhge5pIbRdtizTxtrZnVOR53tU6IunJ5M6rpyulimNHBXQJs2+8EP8dZ54+w
	 1ybN/0VVIpmsSHTIVSHuYfTdemAbFOZbaIgBg1vp77PFI0t+gP0yLYYVMckJJ4bJrknkM
	 soy+K6l9Ba4YF+utU/GWOcgz+2I7SglIc9Wi2+EzrntpwBT4DjWyNqxX+6EWBjI64T9WM
	 rKu7uroq0KhoHDnEsFKtv+ekqqOsy3DRzH1cpZZKSLsIx2IoC9vPnK9WjA65OT2pX+TtR
	 WvvR9HXnMGd/2qoNuYXed4PId2/SAOL3dHyxRFckTvUw0pB5nFvOEbeufKi/h7IZTrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QcBG3MOp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B48D606A32A;
	Mon, 19 Oct 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QcBG3MOp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF5B1F000C4;
	Mon, 19 Oct 2026 21:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445980;
	bh=Ayfk9D707IuSir5watYa+UkolTblVMoJkmhTWHZ/yKw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QcBG3MOpaF9GV6/c8ZTcp8ERRbLoEnROTvqZkUNu4g37COjlGtpQofbpwjEI2FmBo
	 arPgTe3+1kVTM1vMOvlBn/wtzsTZscKo/XwX2sXSWcis9hnV7zzlNxPjZA9+tW2C07
	 ajx3qCTgS7ARLmP4EEyQHqy+y7ahWXQcmRyZ0+q5/cIVYqtSXlJ2Lvkc4XSQGZy5Xc
	 G1KjfGG4Tak/3pV2mw6k5CiO7VYfXuono+vrNIQCE8TB11Pgyx6gbTHHD8I7VKnDn6
	 MpSWoMSFdAyf4vUHavH7IStCfqj/4I4CBm6cF6SCq3+ER4d4Mck8SbdYesP3plijiI
	 no6S1VCyAzM/Q==
Subject: Re: [PATCH net-next v2 3/3] selftests: tc-testing: pin DRR and ETS
 deficit refill semantics
From: netdev-bot+sashiko@kernel.org
To: victor@mojatatu.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, jhs@mojatatu.com, jiri@resnulli.us, netdev@vger.kernel.org,
 horms@kernel.org, sashiko-bot@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 19 Oct 2026 21:39:38 +0000
Message-ID: <179244597889.3135.16923738862014270514@kernel.org>
In-Reply-To: <QDISC-TIAE.v2.r0.20261015163454-3@mojatatu.com>
References: <QDISC-TIAE.v2.r0.20261015163454-3@mojatatu.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The three new tests (3f3e, 57a1, 2177) coordinate with their
  background traffic only through wall-clock sleeps measured against…
- [Medium] selftests: tc: mathematically contradictory expected stats in
  ETS test 2177

--

selftests: tc-testing: pin DRR and ETS deficit refill semantics

This adds three tdc tests (3f3e, 57a1 and 2177) that check DRR and ETS
deficit refill. Each test puts netem delay qdiscs under DRR or ETS. It
starts background traffic in setup and checks the class stats after a
fixed sleep.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
> index 2b61d8d79bde8..d7ac32294738e 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/drr.json
> @@ -86,5 +86,87 @@

[ ... ]

> +        "setup": [
> +            "$IP addr add 10.10.11.10/24 dev $DUMMY",
> +            "$TC qdisc add dev $DUMMY root handle 1: drr",
> +            "$TC class add dev $DUMMY parent 1: classid 1:1 drr quantum 256",
> +            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 2s limit 10",
> +            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match u32 0 0 flowid 1:1",
> +            "ping -c 2 -s 1472 -i 1 10.10.11.11 -I $DUMMY -W 0.01 >/dev/null 2>&1 &"
> +        ],
> +        "cmdUnderTest": "sleep 2.5",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC -s class show dev $DUMMY",
> +        "matchPattern": "deficit 22b",

[Severity: Medium]
Can this test fail now and then on a loaded or debug kernel? The verify
step is tied to the background ping only by wall-clock sleeps measured
against the netem delay. That leaves about 0.5s of slack either way.

exec_cmd() in tdc.py waits only for the shell to exit:

    proc = subprocess.Popen(command,
        shell=True,
        ...
    (rawout, serr) = proc.communicate(timeout=NAMES['TIMEOUT'])

The ping runs in the background with its output sent to /dev/null. Setup
can therefore move on before ping has started or queued anything.
nsPlugin also wraps every command in ip netns exec, which adds more
startup latency.

Say ping sends at T and T+1. Netem then releases the packets at T+2 and
T+3, and the verify command runs at about T+2.5 plus overheads.

If verify runs before the first release, the deficit is still 256. If it
runs after the second release, qlen is 0 and drr_dump_class_stats()
reports 0:

net/sched/sch_drr.c:drr_dump_class_stats() {
    ...
	memset(&xstats, 0, sizeof(xstats));
	if (qlen)
		xstats.deficit = READ_ONCE(cl->deficit);
    ...
}

In both cases "deficit 22b" won't match.

Test 57a1 in drr.json and test 2177 in ets.json have the same timing
dependency. Netem must release the first python3 pair (send time + 3s)
before verify runs at about 3.5s. It must still hold the second pair,
which is sent after "sleep 1" plus python3 startup.

Both conditions hold only if python3 startup, ip netns exec and the
sleep overheads vary by less than about 0.5s.

These are nsPlugin tests, so mp_bins() puts them in the parallel bins.
tdc.sh runs ./tdc.py -J"$(nproc)", which is capped at 4 workers. That
means they run alongside other namespace-heavy tests, and startup latency
gets longer and less predictable on KASAN or lockdep kernels.

Could the tests sync with the traffic instead? One option is to have
setup wait for the expected qlen or backlog before the sleep. Another is
a much longer netem delay, so the window doesn't depend on process
startup time.

[ ... ]

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> @@ -1007,5 +1007,59 @@
>          "teardown": [
>              "echo \"1\" > /sys/bus/netdevsim/del_device"
>          ]
> +    },
> +    {
> +        "id": "2177",
> +        "name": "ETS serves the band that fits its deficit first",
> +        "category": [
> +            "qdisc",
> +            "ets"
> +        ],
> +        "plugins": {
> +            "requires": "nsPlugin"
> +        },
> +        "setup": [
> +            "$IP addr add 10.10.11.10/24 dev $DUMMY",
> +            "sh -c 'echo 1 > /proc/sys/net/ipv6/conf/$DUMMY/disable_ipv6' || true",
> +            "$TC qdisc add dev $DUMMY root handle 1: ets bands 2 quanta 256 256",
> +            "$TC qdisc add dev $DUMMY parent 1:1 handle 10: netem delay 3s limit 10",
> +            "$TC qdisc add dev $DUMMY parent 1:2 handle 20: netem delay 3s limit 10",
> +            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 1111 0xffff flowid 1:1",
> +            "$TC filter add dev $DUMMY parent 1: protocol ip prio 1 u32 match ip dport 2222 0xffff flowid 1:2",
> +            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &",
> +            "sleep 1",
> +            "python3 -c \"import socket; a=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); b=socket.socket(socket.AF_INET,socket.SOCK_DGRAM); a.sendto(b'A'*1472,('10.10.11.11',1111)); b.sendto(b'B'*472,('10.10.11.11',2222))\" >/dev/null 2>&1 &"
> +        ],
> +        "cmdUnderTest": "sleep 2.5",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC -j -s class show dev $DUMMY",
> +        "matchJSON": [
> +            {
> +                "class": "ets",
> +                "handle": "1:1",
> +                "root": true,
> +                "stats": {
> +                    "bytes": 1514,
> +                    "packets": 1,
> +                    "backlog": 3028,
> +                    "qlen": 2
> +                }
> +            },
> +            {
> +                "class": "ets",
> +                "handle": "1:2",
> +                "root": true,
> +                "stats": {
> +                    "bytes": 514,
> +                    "packets": 1,
> +                    "backlog": 514,
> +                    "qlen": 1
> +                }
> +            }
> +        ],
> +        "matchCount": "1",
> +        "teardown": [
> +            "$TC qdisc del dev $DUMMY root"
> +        ]
>      }
>  ]

[Severity: Medium]
Does the expectation for band 1:1 match the traffic the setup
generates? Only two packets ever reach 1:1: the 1514-byte datagrams
from the two python3 runs. The expected stats say one of them was
sent (bytes 1514, packets 1), yet both are still queued (backlog 3028,
qlen 2). Read literally, that needs three packets in the band.

It also differs from 57a1. The commit message calls 2177 the same
case under ETS, but 57a1 expects bytes 0 and packets 0 for 1:1.

If the test really passes, as the commit message says, I suspect the
reason is how ETS reports band stats. ets_class_dump_stats() returns
the child qdisc's counters (cl->qdisc->bstats and its qstats), not
per-band ETS counters.

ets_qdisc_dequeue() looks at the head of the band through
cl->qdisc->ops->peek(), which for netem is qdisc_peek_dequeued(). That
calls netem_dequeue(), which bumps netem's bstats. It then parks the
skb in gso_skb and adds it back to qlen and backlog. So "bytes": 1514
would be the packet ETS peeked at and couldn't afford, not one it
sent.

If that is what happens, this assertion pins netem's peek accounting
rather than the ETS deficit refill. A change to how ETS peeks, or to
how the child's counters are kept, would break the test without any
change in scheduling order. If it isn't what happens, the test fails
every time.

Could you confirm which it is? If it's the peek artifact, would it be
better to assert only on band 1:2, or on something that reflects ETS's
own dequeue decision? Either way, please note in the test why 1:1 is
expected to differ from 57a1.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-TIAE.v2.r0.20261015163454%40mojatatu.com
