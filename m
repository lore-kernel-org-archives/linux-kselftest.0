Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B18238758D;
	Mon, 24 Aug 2026 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597621; cv=none; b=bwPMNEe4B9Q6mlLE+GBDjCN/EVBCnwvmHZUZT2Ar4FpZDUVLSCN2Vfrw7SfGMOWF7tmw5j1wJ33A1mkEN064+Lcq96mT+GnWGUSKfU8Peb+9wWpgzfX6KFxqkc2LrwZwcZ13ci5jmFyGg0/RKZAeBAxbh0u+PVcgSOqMLqPdt34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597621; c=relaxed/simple;
	bh=IIghnF4fpPkcMl/Bedeo6WE38G1vgp9ffPcJjLvlU8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiDvoE7A4J1S643a3UfYyfKZ9oVR9gAzTstNvg88F1PfJZVi/ooAQqmAorDshF1F4Xwl4Z0GYgWwenMOMvftlp0e88LMLDnuZhTJ44zRvXJcavP22wX7dU78jCwxry7ikLPHgjODdSX25YijimMMZ0yUVP/jl5ZzAKbsNw4aKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNl9ztiO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNl9ztiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CA71F000E9;
	Mon, 24 Aug 2026 18:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787597620;
	bh=1bpJD3GPuLPuC7xpOlTd/gvIIA5y75ZeRNm/K2390ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZNl9ztiOTLIjc4iMuc/9Nm6EXB0+jQnQGcV5/TiKjRfAuH2p1JLGrWiYhFPVW0AW8
	 jyUpnnB5STmY5416rFaf7A912EuelYKNXFWeoy7DXMpr3e1jCPPXuA0ccm7XHOXC7F
	 NlX4qm2LxZ7qdvGnxbbWRoCw+6C1b6+xL0DXGhvbFTTR4JsSphtvW6xpz7IOr2GwNj
	 ltv2OAkjKk86XYv/brTyJvwknYPgVvIgvbLJSpM8GQrpdncvASzENHjvMfly9ZGPqA
	 Wp6w/pSuvmDbN4sVO4znhW8Da1p5lQmI+X9P5n/mvTUaFym1NL5OhlPniUhPPJOhJe
	 ePVj5c0WhYxrw==
From: Jakub Kicinski <kuba@kernel.org>
To: junjie.cao@intel.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vinicius.gomes@intel.com,
	shuah@kernel.org,
	bestswngs@gmail.com,
	uladzislau.zhauniarovich@gmail.com,
	hdanton@sina.com,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 3/3] selftests/tc-testing: taprio: add case for the software minimum interval
Date: Mon, 24 Aug 2026 11:53:38 -0700
Message-ID: <20260824185339.2704038-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820062715.278124-4-junjie.cao@intel.com>
References: <20260820062715.278124-4-junjie.cao@intel.com>
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
selftests/tc-testing: taprio: add case for the software minimum interval

This adds a tdc case (id f4b2) to tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
which asserts that a pure software taprio schedule with 50000 ns entries is
rejected, since the entries are below TAPRIO_MIN_SW_INTERVAL_NS.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
> index cd19d05925e40..3fe66839f8aed 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
> @@ -154,6 +154,28 @@
>              "echo \"1\" > /sys/bus/netdevsim/del_device"
>          ]
>      },
> +    {
> +        "id": "f4b2",
> +        "name": "Add taprio Qdisc with software interval below the minimum",
> +        "category": [
> +            "qdisc",
> +            "taprio"
> +        ],
> +        "plugins": {
> +            "requires": "nsPlugin"
> +        },
> +        "setup": [
> +            "echo \"1 1 8\" > /sys/bus/netdevsim/new_device"
> +        ],
> +        "cmdUnderTest": "$TC qdisc add dev $ETH root handle 1: taprio num_tc 2 queues 1@0 1@1 sched-entry S 01 50000 sched-entry S 02 50000 clockid CLOCK_TAI",
> +        "expExitCode": "2",

[Severity: Low]
This isn't a bug, but should there also be a companion case that pins the
other half of the rule?  The kernel rule this case targets is conditional in
taprio_min_interval():

net/sched/sch_taprio.c:taprio_min_interval() {
	s64 min_interval = length_to_duration(q, ETH_ZLEN);

	/* Only pure software schedules arm the per-entry hrtimer. */
	if (!FULL_OFFLOAD_IS_ENABLED(q->flags) &&
	    !TXTIME_ASSIST_IS_ENABLED(q->flags))
		min_interval = max_t(s64, min_interval,
				     TAPRIO_MIN_SW_INTERVAL_NS);

	return min_interval;
}

The new f4b2 case only covers the branch being taken.  Reading the rest of
taprio.json, no case appears able to flip that branch: the flags-carrying
cases ba39, 9462, 8d92, d092, 8471, 0a85 and 3e1e all use 300000 ns
intervals with "flags 0x1", and e8a1/6a83 use 20000000 ns with "flags 0x2",
so they pass whether or not the 100 us floor is gated on the flags.

Would that mean a change making the floor unconditional, and thus rejecting
hardware-offloaded or txtime-assist schedules with sub-100 us gates, still
leaves the whole taprio.json suite reporting PASS, including f4b2?

A mirror case using "flags 0x1" with the same 50000 ns entries and
expExitCode 0 would cover the exemption.  On netdevsim this looks feasible:
netdevsim has no get_link_ksettings, so taprio_set_picos_per_byte() falls
back to SPEED_10, giving picos_per_byte 800000 and
length_to_duration(ETH_ZLEN) of 48000 ns, so 50000 ns entries and the
derived 100000 ns cycle are above the unconditional floor.

> +        "verifyCmd": "$TC qdisc show dev $ETH",
> +        "matchPattern": "qdisc taprio 1: root refcnt",
> +        "matchCount": "0",
> +        "teardown": [
> +            "echo \"1\" > /sys/bus/netdevsim/del_device"
> +        ]
> +    },

[ ... ]
