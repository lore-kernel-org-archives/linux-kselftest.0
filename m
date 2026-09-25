Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B6369D5C;
	Fri, 25 Sep 2026 23:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790379284; cv=none; b=oBRIhOy0x7Z+qVaebIl7c2vT1H7k207VH5G901ShcLBYH+NDrURuIhhHQp+r7/ikAzo3PhZn89vR8hJsLIv03W5wTcEL0cjP/lJWq1tt5ueqiLmwIOj4vhJ9yNv9D4YIBu49Jnsw/xY2N7a0f22BUF5Lcc6W0CQihYgNIjm+0xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790379284; c=relaxed/simple;
	bh=NWJThGrnhGmtycxFuNuma0cl65L5VPfKTcrTyXHeXp4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hUv81woN0rMXDZhEnjbAHAzgjMQT5Y19JP9Uy3p+X/iIkQAcObHanR0Jvu+SYwogPkzv7/V+MylO49A32nnoxPIEJTTgyh9fPnGETYqVuUtp0ipaKD952SHP4EPMHtm+QV7YeKQVFjopas7Z7J6Fkdw664F99kdVlirfvS/qANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOVZmagE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOVZmagE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48561F000FF;
	Fri, 25 Sep 2026 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790379282;
	bh=RqyiriqVq69FE1rsc8UbHI5RvSGFba77M/+Bys6lc30=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gOVZmagE3PeRxa9cOARjsF6kgnHznud06dbxMTXCOqY91IDO+Pw1TNJub+4R3bLFf
	 itsZOeC/PcCNkbuGCGgWLeWNWTIqXwoRUeBc0sZAJ+CuXLwEkDyDVz8rGPZBz7jEsv
	 dOGhpW2xVZ8tO28h372go/4WMPL0mdXCtOWVQaBoWqJAr1dRJxEEjGWl829mOaXGhV
	 3LGDlxAIaVxEVsJnlVCXZ83wFkxTqguHTKjWmfxNvwBWEFWFlDkq468khkFqiSV+0d
	 uxW3nLiO42tuJqVmVi495rpmkItCRpYsJTDLQ1GLfU32xJEnh2YUAQJp8WbIs66IrQ
	 ZhZMRQLaBVPvQ==
Subject:
 Re: [PATCH net 2/2] selftests: net: check timestamp echo after an old ACK
From: netdev-bot+sashiko@kernel.org
To: jeffjo@openai.com
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 25 Sep 2026 23:34:41 +0000
Message-ID: <179037928147.2160803.8053900243533632906@kernel.org>
In-Reply-To: <20260921222609.50824-6-jeffjo@openai.com>
References: <20260921222609.50824-6-jeffjo@openai.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] tcp_old_ack_ts.sh re-implements the packetdrill runner but
  copies only half of the KSFT_MACHINE_SLOW policy: it adds…
- [Low] The only assertion the new test adds over plain packetdrill is an
  awk scrape of packetdrill's --verbose human-readable log…
- [Low] The new wrapper invokes packetdrill with only --ip_version, --mtu
  and the optional tolerance flag (tcp_old_ack_ts.sh lines 25-26),…
- [Low] The same subtest is reported under different descriptions
  depending on outcome: `ktap_test_pass "$family"` (tcp_old_ack_ts.sh…

--

selftests: net: check timestamp echo after an old ACK

This adds a packetdrill fixture that delivers two peer data segments out of
order and requires the reply to the gap filler to echo the delayed packet's
timestamp.  Since packetdrill does not compare TSecr, a shell wrapper runs
the script per family and scrapes the four outbound timestamp echoes out of
packetdrill's verbose log.  The wrapper becomes the runnable test and the
.pkt file is demoted to a supporting file.

A few questions about the new wrapper below.

> diff --git a/tools/testing/selftests/net/packetdrill/Makefile b/tools/testing/selftests/net/packetdrill/Makefile
> index ff54641493e99..4695d8258aa1f 100644
> --- a/tools/testing/selftests/net/packetdrill/Makefile
> +++ b/tools/testing/selftests/net/packetdrill/Makefile
> @@ -7,6 +7,9 @@ TEST_INCLUDES := \
>  	../../kselftest/ktap_helpers.sh \
>  # end of TEST_INCLUDES
>  
> -TEST_PROGS := $(wildcard *.pkt)
> +# This fixture requires its wrapper to validate outbound timestamp echoes.
> +TEST_PROGS := $(filter-out tcp_old_ack_ts.pkt,$(wildcard *.pkt))
> +TEST_PROGS += tcp_old_ack_ts.sh
> +TEST_FILES := tcp_old_ack_ts.pkt
>  
>  include ../../lib.mk

> diff --git a/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
> new file mode 100644
> index 0000000000000..d13f5ea4ac12c
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
> @@ -0,0 +1,23 @@

[ ... ]

> +0.100 < S 0:0(0) win 20000 <mss 1000,sackOK,TS val 900 ecr 0>
> ++0 > S. 0:0(0) ack 1 <mss 1460,sackOK,TS val 100 ecr 900>
> +0.200 < . 1:1(0) ack 1 win 20000 <nop,nop,TS val 1000 ecr 100>
> ++0 accept(3, ..., ...) = 4
> +0.300 write(4, ..., 17) = 17
> ++0 > P. 1:18(17) ack 1 <nop,nop,TS val 300 ecr 1000>
> +0.310 < P. 18:35(17) ack 18 win 20000 <nop,nop,TS val 301001 ecr 300>
> ++0 > . 18:18(0) ack 1 <nop,nop,TS val 310 ecr 1000,nop,nop,sack 18:35>
> +0.320 < P. 1:18(17) ack 1 win 20000 <nop,nop,TS val 301000 ecr 100>
> ++0 > . 18:18(0) ack 35 <nop,nop,TS val 320 ecr 301000>
> ++0 read(4, ..., 34) = 34

> diff --git a/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh
> new file mode 100755
> index 0000000000000..4c4534a81e784
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.sh
> @@ -0,0 +1,57 @@

[ ... ]

> +optargs=()
> +if [[ -n "${KSFT_MACHINE_SLOW}" ]]; then
> +	optargs+=(--tolerance_usecs=14000)
> +fi

[Severity: Medium]
Should this branch also downgrade failures the way ksft_runner.sh does?  The
shared runner that handles every other .pkt in this directory reacts to the
same variable with two changes, not one:

tools/testing/selftests/net/packetdrill/ksft_runner.sh:
	failfunc=ktap_test_fail

	if [[ -n "${KSFT_MACHINE_SLOW}" ]]; then
		optargs+=('--tolerance_usecs=14000')
		failfunc=ktap_test_xfail
	fi
	...
	for ip_version in $ip_versions; do
		unshare -n packetdrill ${ip_args[$ip_version]} ${optargs[@]} $script > /dev/null \
			&& ktap_test_pass $ip_version || $failfunc $ip_version
	done

Here the tolerance bump is copied but the ktap_test_xfail substitution is
not, and the wrapper calls ktap_test_fail unconditionally in both failure
paths below.

Since ktap_finished() only exits KSFT_PASS when pass+skip+xfail equals the
plan, doesn't that mean a timing hiccup on a KSFT_MACHINE_SLOW machine turns
this into a hard "not ok" and exit 1, while the sibling scripts in the same
directory report xfail for the identical condition?

The script is all "+0" expectations with inbound events 10 ms apart at 0.310
and 0.320 against a 14 ms slow-machine tolerance, so is this not exactly the
case the xfail policy was added for?

Relatedly, the Makefile opt-out means each future wrapped fixture needs
another filter-out term, and each wrapper grows its own copy of this policy.
Would teaching ksft_runner.sh about an optional per-script checker keep the
policy in one place?

> +
> +ktap_print_header
> +ktap_set_plan 3
> +
> +for family in ipv4 ipv6 ipv4-mapped-ipv6; do
> +	mtu=1500
> +	[[ "$family" == ipv6 ]] && mtu=1520
> +	if ! unshare -n packetdrill --verbose --ip_version="$family" \
> +		--mtu="$mtu" "${optargs[@]}" tcp_old_ack_ts.pkt >"$log" 2>&1; then

[Severity: Low]
This invocation passes only --ip_version, --mtu and the optional tolerance
flag, while ksft_runner.sh passes a full per-family address set from its
ip_args table:

	[ipv4]="--ip_version=ipv4
		--local_ip=192.168.0.1
		--gateway_ip=192.168.0.1
		--netmask_ip=255.255.0.0
		--remote_ip=192.0.2.1
		..."

Note that the in-tree table deliberately sets --gateway_ip equal to
--local_ip for ipv4 and ipv4-mapped-ipv6, and uses fd3d:0a0b:17d6::1 /
fd3d:0a0b:17d6:8888::1 / fd3d:fa7b:d17d::1 for ipv6.

Does this test then run against packetdrill's compiled-in defaults rather
than the in-tree network configuration?  The hardcoded family list and mtu
here also stop tracking any later change to ip_args (a new family, changed
addresses, or new -D defines).

> +		sed 's/^/# /' "$log"
> +		ktap_test_fail "$family: packetdrill"
> +		continue
> +	fi
> +
> +	# Packetdrill checks packet structure and timing but ignores outbound
> +	# TSecr. Require all four observed echoes, including the gap-filling ACK.
> +	if awk '
> +	/outbound sniffed packet:/ {
> +		count++
> +		if (!match($0, /ecr [0-9]+/)) {
> +			bad = 1
> +			next
> +		}
> +		echoes = echoes (count == 1 ? "" : ",") \
> +			substr($0, RSTART + 4, RLENGTH - 4)
> +	}
> +	END {
> +		if (bad || count != 4 || echoes != "900,1000,1000,301000") {
> +			print "# unexpected timestamp echoes: " echoes
> +			exit 1
> +		}
> +	}' "$log"; then

[Severity: Low]
The only assertion this test adds over plain packetdrill is a scrape of the
--verbose human readable log: it requires the literal string "outbound
sniffed packet:", an "ecr <N>" token on that same line, exactly four such
lines, and the concatenation "900,1000,1000,301000".

packetdrill is out of tree and its version is not pinned here; the script
only does "command -v packetdrill" and never verifies that --verbose is
accepted or that the dump wording matches.  If the tool's dump layout
changes, or an extra outbound packet is sniffed, does the resulting "not ok
<family>: timestamp echo" not look identical to the kernel regression this
test is meant to catch?  The directory convention in ksft_runner.sh is to
skip when the external tool is unusable, and there is no skip path here.

In the zero-match case the diagnostic is also misleading.  With no matching
line, echoes is never assigned, so the END block prints:

	# unexpected timestamp echoes: 

with an empty list, which points triage at the kernel rather than at the log
parsing.  Would printing count, or distinguishing "no outbound packets
found" from "wrong echoes", make that clearer?

One more observation: the expected echoes now live in two places, as inert
ecr fields in tcp_old_ack_ts.pkt (which packetdrill does not verify) and as
the hardcoded string here, so an edit to one silently skews the other.

> +		ktap_test_pass "$family"
> +	else
> +		sed 's/^/# /' "$log"
> +		ktap_test_fail "$family: timestamp echo"
> +	fi
> +done

[Severity: Low]
This isn't a bug, but the same subtest number is reported under different
descriptions depending on the outcome:

	ok 1 ipv4
	not ok 1 ipv4: packetdrill
	not ok 1 ipv4: timestamp echo

ksft_runner.sh uses the identical description for pass, fail and xfail.
Since KTAP consumers key on the description, would it be better to pass
"$family" in all three calls and leave the reason to the "#" diagnostic
lines that sed already emits?

> +
> +ktap_finished

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921222609.50824-4-jeffjo%40openai.com
