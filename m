Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A8B348477;
	Sun,  6 Sep 2026 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706816; cv=none; b=pAGRrCUsNuRUuKZefeRBgdPmnrL/CCQjqY5itvhRYELsmbydifFym5LzD5zpst1vj/sxEIKm0HuyLj/jLNb8OJmmE0ThCnJX49ycCMkflJ7T1ki1TkYNSPKzh65GAQqdU3AKcGqPyhQAlrHuvX2XhYN6Up8WDpyaZtE5625ZzC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706816; c=relaxed/simple;
	bh=4t1aZq9zylqUc/ttKQZdi+wvfPe5wS/AzFHO2o+fkT0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KBzzIkOEnnWymG/bUuhKz2ZLfN6kmJjZGX98qk+YHhdj8xnF139Ryd1/GSsgmlcrGn9/8Pu1tsT18LM3pBSns46+9oZMuBQtEUxjWNgcEYcdTjPb+UoDwEvt5mw5lvZ/5TBEe4ICP1IZZf98fCh6HP0UjnFGxQFG03Ob/9jj0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chxRMw6p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chxRMw6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5371C1F00A3A;
	Sun,  6 Sep 2026 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788706815;
	bh=y0qRBGmKAQjFOOnInniZ2PtLM4LueHtCI63BqEpSAcM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=chxRMw6pnPmw3o0JsNyaABhbJtqwVUx7oSFmZnRMrWWTjyX95R3ubrOZxuBXB598I
	 QItIM3741FixxQ50yfJOT1LVgH8+kr1RLhxXMwLyXCJe0YunAOCagVtpP6UEnKNQma
	 EJcVh6bZCXru0kKC4pk9qRHbYLM/iQXlyIXeJ7wWJBOK2SV2ZJekWGfK9KyZVDGrq8
	 N2REXN7fMsYI68D2BhQO2PvA1rha31vP9who5kxEWn9HQkkJNsZiVVo1/5gW6n9MXU
	 OYv7iezbMcBf1j0TNqShchP7gGJOD7E3WGWuiEV1fIA/x7P7hHIG6IM2c/NHixiVrf
	 PkuIZoBShhgrQ==
Subject: Re: [PATCH net-next v2 1/2] selftests/net/openvswitch: add SCTP flow
 key test over IPv6
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 dev@openvswitch.org, echaudro@redhat.com, edumazet@google.com,
 i.maximets@ovn.org, i.maximets@redhat.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pabeni@redhat.com, shuah@kernel.org, horms@kernel.org
Date: Sun, 06 Sep 2026 15:00:13 +0000
Message-ID: <178870681380.219967.8092391165153774232@kernel.org>
In-Reply-To: <20260902125133.1828572-2-houminxi@gmail.com>
References: <20260902125133.1828572-2-houminxi@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 1

- [Medium] Commit message rationale is not supported by the code it
  claims to cover.
- [Medium] Unsynchronized cross-process assertion makes the test flaky.
- [Low] The patch contains a spurious hunk that rewrites the whitespace
  of the pre-existing `sctp_connect_v4` entry in the `tests` list…

--

selftests/net/openvswitch: add SCTP flow key test over IPv6

Adds test_sctp_connect_v6 to the openvswitch selftest, mirroring the
existing IPv4 SCTP test with NS/NA forwarding flows and
ipv6(proto=132),sctp(dst=4443)/sctp(src=4443) flows gating an
association in three phases, plus a payload transfer check.

A couple of questions about the commit message and the new test below.

[Severity: Medium]
The commit message says:

    After the association succeeds the test also pushes a known payload
    across and verifies the listener received it, so a flow-key bug that
    matches handshake packets but breaks DATA chunks is caught too.

Can such a flow-key bug exist?  The SCTP extraction in
key_extract_l3l4() never looks at chunk types, it only copies the two
port fields out of the 12-byte common header:

net/openvswitch/flow.c:key_extract_l3l4() {
    ...
    } else if (key->ip.proto == NEXTHDR_SCTP) {
            if (sctphdr_ok(skb)) {
                    struct sctphdr *sctp = sctp_hdr(skb);
                    key->tp.src = sctp->source;
                    key->tp.dst = sctp->dest;
    ...
}

The IPv4 branch (key->ip.proto == IPPROTO_SCTP) does exactly the same.
So INIT, INIT-ACK, DATA and SACK all produce identical key->tp.src /
key->tp.dst, and the flow key cannot distinguish them.

The same paragraph also says:

    The IPv6 extraction path (parse_ipv6hdr walking extension headers,
    then the proto=132 branch in key_extract) and the v6 side of the SCTP
    netlink validation have no selftest coverage at all

Is that accurate for parse_ipv6hdr()?  The pre-existing test_icmpv6()
in the same script already sends IPv6 traffic through the datapath,
which runs key_extract_l3l4() -> parse_ipv6hdr().  And the new test only
configures fd00::1/fd00::2 and sends plain SCTP6 socat traffic, so no
hop-by-hop, routing or fragment header is ever generated and this loop

net/openvswitch/flow.c:parse_ipv6hdr() {
    ...
    nexthdr = ipv6_find_hdr(skb, &payload_ofs, -1, &frag_off, &flags);
    ...
}

is only exercised in the trivial nexthdr == 132 case.  Could the message
be narrowed to what is genuinely new, i.e. the NEXTHDR_SCTP branch and
the v6 SCTP netlink key?

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index a31f7fb6882d..06bd98d80a08 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -33,7 +33,8 @@ tests="
>  	action_set				set: SET action rewrites fields
>  	trunc					trunc: output truncation
>  	icmpv6					icmpv6: ICMPv6 echo type match
> -	sctp_connect_v4				sctp: SCTP flow key matching
> +	sctp_connect_v4			sctp: SCTP flow key matching
> +	sctp_connect_v6			sctp6: SCTP flow key matching over IPv6

[Severity: Low]
This isn't a bug, but why is the pre-existing sctp_connect_v4 line
rewritten here?  The four tabs become three, which is unrelated to
adding an IPv6 test and the changelog says v2 has "no code changes".

Word splitting is unaffected because IFS is set to tab+newline before
the "for t in ${tests}" loop, but usage() prints the string verbatim:

	echo "Available tests${tests}"

With one leading tab, a 15-character name and four tabs the description
starts at column 48 like every other entry; with three tabs both the
modified sctp_connect_v4 row and the new sctp_connect_v6 row start at
column 40 and are misaligned against the rest of the help output.

>  	psample					psample: Sampling packets with psample"
>  
>  info() {

[ ... ]

> @@ -700,6 +701,100 @@ test_sctp_connect_v4() {
>  	return 0
>  }
>  
> +# sctp_connect_v6 test

[ ... ]

> +	ovs_netns_spawn_daemon "$t" "server" \
> +	    socat -u -t 1 SCTP6-LISTEN:4443,fork \
> +	    OPEN:"$rxfile",creat,append
> +	ovs_wait sctp_eps_has server 4443 || return 1
> +
> +	info "verify SCTP association with port-keyed flows"
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
> +	    || return 1
> +
> +	info "verify SCTP DATA chunk crosses the datapath"
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" \
> +	    <<< "$payload" || return 1
> +	grep -q "$payload" "$rxfile" 2>/dev/null \
> +	    || { info "server did not receive SCTP DATA payload"
> +	         return 1; }

[Severity: Medium]
Can this grep race with the listener and make the test flaky?

$rxfile is written by the forked socat child spawned in the background
by ovs_netns_spawn_daemon():

	ip netns exec $netns $*  >> $ovs_dir/stdout  2>> $ovs_dir/stderr &

The client socat exits once its local send and teardown are done, so its
exit status says nothing about the server child having read the DATA
chunk and written it out.  The grep runs immediately after, with no
barrier in between.

If the server child has not been scheduled yet, the file is either
missing (grep exit 2, hidden by 2>/dev/null) or present but empty (grep
exit 1 - the earlier payload-less association already created it via
creat), and both land in the return 1 branch, giving a [FAIL] and
exitcode=1.

Would ovs_wait be the right primitive here?  It is already used four
lines above for the listener readiness check:

	ovs_wait sctp_eps_has server 4443 || return 1

and ovs_wait() retries for WAIT_TIMEOUT seconds, doubling it when
KSFT_MACHINE_SLOW=yes, which is exactly the loaded-CI case that loses
this race.  The same unsynchronized pattern appears again in the
follow-up commit adding test_sctp_nat_connect_v4, so it is not corrected
later in the series.

> +
> +	ovs_del_flows "$t" sctp6

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260902125133.1828572-1-houminxi%40gmail.com
