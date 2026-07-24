Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335A3427FA7;
	Fri, 24 Jul 2026 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896470; cv=none; b=B/EXBgNDjBZmd3eOS4BR5NSUOjZH6PYaV/S4etmGJ1P6UHRyTHcpqU/ZJDVYK/Bibh0nESx18jZvv9Ya345GY8CSWGsx5yhDhBXv8WtCllztY9WO1tXolHhyq+b9C30MJCaY2cGGfZCI8Puf9hG/H7gOoxG5Q3Btl+HV+grPjYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896470; c=relaxed/simple;
	bh=W2UtroRajRQKVLmn/1a+6o6tpupNk8fwUilabuH82X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=art4Gz9/u1ffhAAuQB1pMe4ivv1vp0PEQK7wwIL9G3qLX1Qs6DT2e7tdlzA5dj/PIDGiu396kQu3qyoOkyhMRgh8CHVHsKjsN85JRd/Y11w8sKZMHSK2iON2afkIZzn7kdvRHPHdZinHiITtHCJGD7eojwcx70jtdWX9eTed/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ot0AP+zk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ot0AP+zk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59081F000E9;
	Fri, 24 Jul 2026 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784896467;
	bh=skFc3M2alWo96DWgGCiGwbqcnCSjWcQ8sEdzZo+x+mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ot0AP+zkD+1CQsw1bbFSLQtQjv5uKImhlHevPdT+DJWvFC5E10N3FsXK+8lckmGjX
	 TlY+Ld/dS9spfJ31fUhuFFdg4r1nr9Tb02kApfkt/414Z6QovtTnu5EqcIv5m0ddUh
	 D8NF41r9lkvXr3lrssPVqGYMFIC6ybX5PdvFydn8dgRVbvRo6YWdaXv4e1UegGiBR+
	 W4VYO3d6DP6sFWhTESWHLUhErxHUHv3ZQqzcvhk4SaTGM5tQ+MaTNGHep9oHhoAMwh
	 BP2578hmiO18XZL7zOgR2DFnTEmTXNTeSWH0/9KFNf5S6Aa53C9xrDaHxgK+q7Yw2X
	 SgWmDmcRBFvPA==
From: Simon Horman <horms@kernel.org>
To: xiaoliang.yang_1@nxp.com
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	shuah@kernel.org,
	vladimir.oltean@nxp.com,
	vinicius.gomes@intel.com,
	fejes@inf.elte.hu
Subject: Re: [PATCH net-next 5/6] selftest: add tc-testing JSON test cases for act_frer
Date: Fri, 24 Jul 2026 13:34:13 +0100
Message-ID: <20260724123413.670856-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717095549.10565-6-xiaoliang.yang_1@nxp.com>
References: <20260717095549.10565-6-xiaoliang.yang_1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260717095549.10565-3-xiaoliang.yang_1@nxp.com?part=5
---
--- Patch [5]: [PATCH net-next 5/6] selftest: add tc-testing JSON test cases for act_frer ---
commit a49cd24c7418264cc3093ec982fc3e60a41c9d2b
Author: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>

selftest: add tc-testing JSON test cases for act_frer

This commit adds a tc-testing JSON file covering the FRER (IEEE 802.1CB
Frame Replication and Elimination for Reliability) tc action. It introduces
32 test cases that exercise various parameters, statistics, and filter
bindings.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/frer.json b/tools/testing/selftests/tc-testing/tc-tests/actions/frer.json
> new file mode 100644
> index 0000000000000..d5be6ae156f79
> --- /dev/null
> +++ b/tools/testing/selftests/tc-testing/tc-tests/actions/frer.json
> @@ -0,0 +1,785 @@
> +[
[ ... ]
> +  {
> +    "id": "frer_0027",
> +    "name": "Bind frer push action to egress clsact filter",
> +    "category": [
> +      "actions",
> +      "frer"
> +    ],
> +    "setup": [
> +      [
> +        "modprobe act_frer",
> +        0,
> +        1
> +      ],
> +      "ip link del frer_dummy 2>/dev/null || true",
> +      "ip link add frer_dummy type dummy",
> +      "ip link set frer_dummy up",

[Severity: Medium]
Will these tests run in the host's default network namespace because they omit
the nsPlugin requirement?

If a test aborts or crashes before the teardown stage, this could leak dummy
interfaces into the host's root namespace.

[ ... ]
> +  {
> +    "id": "frer_0029",
> +    "name": "Share frer recover action across two ingress filters (refcount check)",
> +    "category": [
> +      "actions",
> +      "frer"
> +    ],
> +    "setup": [
> +      [
> +        "modprobe act_frer",
> +        0,
> +        1
> +      ],
> +      "ip link del frer_a 2>/dev/null || true",
> +      "ip link del frer_b 2>/dev/null || true",
> +      "ip link add frer_a type dummy",
> +      "ip link add frer_b type dummy",

[Severity: Medium]
Similarly, will these dummy interfaces also leak into the host network
namespace if the test fails before teardown?

Could these tests be updated to require nsPlugin to ensure they run in an
isolated network namespace?
