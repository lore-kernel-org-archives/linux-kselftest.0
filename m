Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883877;
	b=280WE0TvfZFVlybdvoyB0TylTmkWPDrnSRTflujq4qwSr7pwXjTMDc/hR8XvCX5f373e
	 GeVj1Gq3AoxqYeja6IwaUKgYRPpViUayDvssNeJ+Htl8Sr3X3Ff9xMfz6rrMCblnS+ANq
	 X4WrC1s8wADia1VXYzKLY+8vhRgJWd37tfvFPz7rRKteqP3imAHx1DsmbW4ZvHUnzlZii
	 s1mImq/23CT6n8AP3j2jGwz4x+uXgJm6PKapP6BrigKDbIHltwctJePFIe1uiPltQUnLG
	 yjD4RUW5YpXL/kdQGO2S0irYljTQxJlKWQX7I+ogJrAfhiwcO1phy7pCdfqYwP3hNbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883877;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=HlrkP1BWYUFvZgn9jiQ0vFkRqQCaW4G/qIXqF3E+axo=;
	b=iEoeDExlc8E7VOWVy4plsMISufWnxWGS341zdgGMumrkvOD/jug1oQXThQ3m/50i/Ovd
	 adStsCofivHv3IeZyPbF6IEPUwfBttE5NfvtRNFC8tEroT8HjWPJchcIcyh02lT/bX2mL
	 SL9y42WRsJvezbrbqry3z35mtv33nFopaQD36arLVC+ALyNEKh6SZkSfSwFeVcZQBXN+x
	 1HHv9NyNhcgRJpBObW2vd8VD1jxfCXrAeb3rUm8kmTFqqq2iSoXic+O3Lk6t8YRok2BtP
	 c0FiVcBbguMEP3iB3INXJYwbcVnLNM5hCKQ0viJ5yPpoD4secYsYaQ4mftYN+oZx0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b="N/wMYX1o";
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=gXEIWKr4;
	arc=none smtp.remote-ip=160.80.4.38
Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C354606A31C;
	Tue, 17 Nov 2026 02:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C354606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=N/wMYX1o;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=gXEIWKr4
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AH2oPVt004190;
	Tue, 17 Nov 2026 03:50:31 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id CC2061209A0;
	Tue, 17 Nov 2026 03:50:21 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1794883822; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HlrkP1BWYUFvZgn9jiQ0vFkRqQCaW4G/qIXqF3E+axo=;
	b=N/wMYX1oSWo6b0W1FmE0sa86RbWhoQu7o8wkjzE0ua8VsD8b58ffahRZFygCZ+k2hPue8e
	vRMnEG9Ucu0GtYBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1794883822; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HlrkP1BWYUFvZgn9jiQ0vFkRqQCaW4G/qIXqF3E+axo=;
	b=gXEIWKr48PS3d/aDYMf7TJ2eo5m0xd6902CDtSXu+np3/q6jdYiad6vB96wbulXQc+b2Q1
	pg5I/DUORn9BNgzsacNaLAdeCAcoy0HmjhyhZk0X5FA5CWI6oRQ3Kn/jE+C6EnKQMmU8sp
	3//k5rLGoficYqFY7JGbKXNK/VzJVToQyG82OpOrKtmkPpq7/rvMqou5pxvWMZ7ckI1qVN
	vGZe526/NPFAAww0hrASmPamTri2fLu+0naOkK2ejFjQRUvnM/Rb6rCUtQRg9lyktEE32y
	vxypSf7Gt0WCZeSF04XWjXZnDYNuMyMVWXDcGQR5JckqJMQ9rNF78/EUBl2fQA==
Date: Tue, 17 Nov 2026 03:50:21 +0100
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Hangbin Liu <liuhangbin@kylinos.cn>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Andrea Mayer
 <andrea.mayer@uniroma2.it>,
        Justin Iurman <justin.iurman@gmail.com>,
        Andrea
 Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-Id: <20261117035021.e724668d726ecce54e091288@uniroma2.it>
In-Reply-To: <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Thu, 12 Nov 2026 17:28:00 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> Add an End.X flavor scenario to srv6_end_flavors_test.sh that applies
> the same PSP policies as the End scenario, alone and combined with
> NEXT-C-SID, with every node bound through its adjacency (e.g. 4>2 for
> rt-4 towards rt-2, 2>h towards the host), and exercise it with the
> existing host connectivity tests.
>
> Teach the policy and endpoint helpers about <nodeid:op:act> elements:
> __get_srv6_rtcfg_act() extracts the action, the __get_*_func()
> helpers pick the Function for the action, __get_act_cfg() derives the
> End.X next hop, and build_csid()/get_rt_sid() keep the adjacency so
> it is encoded into the C-SIDs (e.g. fcbb:0:34a9:: is End.X on rt-3
> towards rt-4).
>
> There is no need to re-check the ip command capability as it already
> supports setting PSP flavor with End.X.

Hi Hangbin,
thanks for adding the End.X scenario.

I see these main areas to work on:
- How an element is read. The "router>adjacency" form is read in
  different places, each with its own sed or cut. IMO, the selftest
  would be easier to extend to other behaviors and flavor combinations
  if the nodes were read in one place, with small helpers. What
  depends on the behavior could also be chosen in one place.
- A check of the elements, so that a mistake in a Policy does not go
  unnoticed.
- A check of the kernel support for End.X PSP.
- The End.X tests with a consumed SRH.
- One End.X SID per adjacency also without NEXT-C-SID, where today
  the SIDs of a router do not depend on the adjacency.

The comments below are ideas on how to address each of them, plus
some smaller points. There may also be other parts of the selftest
to adapt.

>
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> I didn't add `host_srv6_end_flv_consumed_srh_tests()` for End.X because
> the extra policy insertion does not work with the End.X policy. The packet
> resolves the destination via the next hop directly, rather than doing a
> re-lookup in table 90.

The ingress router can insert the extra SRH instead, on the first SID
of the Policy. As in the End tests, an End SID of the base setup can
then consume it. This way, we can add these tests for End.X too. What
do you think?

> [snip]
> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 374b43661c28..5b1b13586df0 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> [snip]
>  __get_srv6_rtcfg_id()
>  {
>  	local element="$1"
>  
> +	echo "${element}" | sed 's/:.*//; s/>[1234h]//g'
> +}
> [snip]
> +__get_srv6_rtcfg_all_id()
> +{
> +	local element="$1"
> +
>  	echo "${element}" | cut -d':' -f1
>  }
>  

The same node is read again in build_csid(), get_rt_sid() and
setup_rt_endpoints(), each time in its own way. Two small helpers,
one returning the router of a node and one its adjacency, could
replace these sed and cut. __get_srv6_rtcfg_id() above would then not
need the sed, and __get_srv6_rtcfg_all_id() would probably not be
needed at all. Without NEXT-C-SID, __setup_rt_policy() could then get
each SID of the Policy from get_rt_sid(), as setup_rt_endpoints()
does.

> [snip]
> +__get_noflv_func()
> +{
> +	local act="$1"
> +
> +	case "${act}" in
> +	"End")
> +		echo "${END_FUNC}" ;;
> +	"End.X")
> +		echo "${ENDX_FUNC}" ;;
> +	esac
> +}
> +
> +__get_psp_func()
> +{
> +	local act="$1"
> +
> +	case "${act}" in
> +	"End")
> +		echo "${END_PSP_FUNC}" ;;
> +	"End.X")
> +		echo "${ENDX_PSP_FUNC}" ;;
> +	esac
> +}
> +
> +__get_csid_psp_func()
> +{
> +	local act="$1"
> +
> +	case "${act}" in
> +	"End")
> +		echo "${END_CSID_PSP_FUNC}" ;;
> +	"End.X")
> +		echo "${ENDX_CSID_PSP_FUNC}" ;;
> +	esac
> +}

The three __get_*_func() helpers differ only in the constants. As a
possible simplification, they could be one function with, for example,
a case on the behavior and the operation ("End noflv", "End psp", ...,
"End.X next-csid,psp"). Then the Functions are chosen in one place,
also for a new behavior.

> [snip]
>  # Return the C-SID of a router: the Locator-Node (4 bits), i.e. the ID of the
>  # router, followed by the parameter of the behavior (4 bits, 0) and the
>  # Function (8 bits).
>  # args:
>  #  $1 - router
>  #  $2 - Function (e.g. "e9")
> -# e.g. input: "4" "e9"
> -#      output: "40e9"
> +# e.g. input: "4" "e9", output: "40e9"
> +#      input: "4>2" "a9", output: "42a9"
>  build_csid()
>  {
>  	local nodeid="$1"
>  	local func="$2"
>  
> -	printf "${LCNODE_FMT}%s" "${nodeid}" "${func}"
> +	nodeid=$(echo "${nodeid}" | sed 's/>//; s/h/0/')
> +	[[ ${#nodeid} -eq 1 ]] && mid=0 || mid=""
> +	printf "%s%s%s" "${nodeid}" "$mid" "${func}"
>  }

Here the parameter of the behavior comes from the length of the
string after the sed, and mid is not local. The callers of
build_csid() could set the parameter from the behavior and the
adjacency of the node. The parameter is the adjacent router for End.X,
and 0 for End and towards the host. For example, with the Function a9
or e9:

	End     4      e9      40e9
	End.X   4>2    a9      42a9
	End.X   2>h    a9      20a9

The comment above still says that the parameter is 0 ("(4 bits, 0)").

> [snip]
> @@ -713,10 +814,10 @@ op_has_next_csid()
>  #  $1 - router
>  #  $2 - operation <op> of the element (e.g. "next-csid,psp")
>  #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> -# e.g. input: "4" "psp" "0ef1"
> -#      output: "fcff:4::0ef1"
> -#      input: "4" "next-csid,psp" "e9"
> -#      output: "fcbb:0:40e9::/48"
> +# e.g. input: "4" "psp" "0ef1", output: "fcff:4::0ef1"
> +#      input: "4>2" "psp" "0af1", output: "fcff:4::0af1"
> +#      input: "4" "next-csid,psp" "e9", output: "fcbb:0:40e9::/48"
> +#      input: "4>2" "next-csid,psp" "a9", output: "fcbb:0:42a9::/48"
>  get_rt_sid()
>  {
>  	local rt="$1"
> @@ -730,6 +831,7 @@ get_rt_sid()
>  		return
>  	fi
>  
> +	rt=$(echo "${rt}" | sed 's/>.*//')
>  	echo "${LOCATOR_SERVICE}:${rt}::${func}"
>  }

Without NEXT-C-SID, get_rt_sid() drops the adjacency, as the Sashiko
review also notes: "4>2:psp:End.X" and "4>3:psp:End.X" would both get
fcff:4::0af1. I think each adjacency should have its own SID. The
SID could carry the adjacency, as the C-SID already does. Then
__setup_rt_policy() needs the new SID. Calling get_rt_sid() there,
as suggested above, would do that.

> [snip]
> @@ -765,26 +867,34 @@ setup_rt_endpoint()
>  
>  # Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
>  # args:
> -#  $1 - <nodeid> of the element: one router, or a comma-separated list
> +#  $1 - <nodeid:op:act> element
>  #  $2 - operation <op> of the element (e.g. "next-csid,psp")
>  #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> -#  $4 - SRv6 Endpoint behavior and flavors (e.g. "End flavors psp")
> -# e.g. input: "4,2" "next-csid,psp" "e9"
> -#             "End flavors next-csid,psp lblen 32 nflen 16"
> +#  $4 - flavor configuration of the behavior, without the action
> +#       (e.g. "flavors psp")
> +# e.g. input: "4,2:next-csid,psp" "next-csid,psp" "e9"
> +#             "flavors next-csid,psp lblen 32 nflen 16"
>  #      result: the behavior is added on rt-4, bound to fcbb:0:40e9::/48, and
>  #              on rt-2, bound to fcbb:0:20e9::/48
>  setup_rt_endpoints()
>  {
> -	local node="$1"
> +	local nodeid="$1"
>  	local op_type="$2"
>  	local func="$3"
>  	local behavior_cfg="$4"
> +	local nodes node next_node
> +	local act act_cfg
>  	local sid
>  	local rt
>  
> -	for rt in $(echo "${node}" | sed 's/,/ /g'); do
> -		sid="$(get_rt_sid "${rt}" "${op_type}" "${func}")"
> -		setup_rt_endpoint "${rt}" "${sid}" "${behavior_cfg}"
> +	nodes="$(__get_srv6_rtcfg_all_id "${nodeid}")"
> +	act="$(__get_srv6_rtcfg_act "${nodeid}")"
> +	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
> +		rt=$(echo "${node}" | cut -d'>' -f1)
> +		next_node=$(echo "${node}" | cut -d'>' -f2)
> +		act_cfg="$(__get_act_cfg "${act}" "${rt}" "${next_node}")"
> +		sid="$(get_rt_sid "${node}" "${op_type}" "${func}")"
> +		setup_rt_endpoint "${rt}" "${sid}" "${act_cfg} ${behavior_cfg}"
>  	done
>  }

setup_rt_endpoints() now gets the whole element, and reads it again
with the same helpers as __setup_rt_policy(). I think
__setup_rt_policy() can read the element once, and pass only what
setup_rt_endpoints() needs, for example the nodes and the behavior.

Nit: I would declare one local per line in the new code, as in the
rest of the selftest.

> [snip]
> @@ -824,7 +934,8 @@ setup_rt_host_proxy()
>  #       cafe::x:yy on the loopback of the host (e.g. 2:e9)
>  #  $2 - SRv6 router configured for enforcing the SRv6 Policy
>  #  $3 - compact way to represent a list of SRv6 routers with their operations
> -#       (i.e. behaviors) that each of them needs to perform. Every <nodeid:op>
> +#       (i.e. behaviors) that each of them needs to perform. Every
> +#       <nodeid:op:act>
>  #       element constructs a SID that is associated with the behavior <op> on
>  #       the <nodeid> node. The list of such elements forms an SRv6 Policy.
>  #       For "next-csid,psp", <nodeid> is a comma-separated list of node IDs.
> @@ -841,34 +952,38 @@ __setup_rt_policy()
>  	local container
>  	local function
>  	local op_type
> +	local nodes
>  	local node
> +	local act
>  	local n
>  
>  	in_nsname="$(get_rtname "${encap_rt}")"
>  
>  	for n in ${policy_rts}; do
>  		node="$(__get_srv6_rtcfg_id "${n}")"
> +		nodes="$(__get_srv6_rtcfg_all_id "${n}")"
>  		op_type="$(__get_srv6_rtcfg_op "${n}")"
> +		act="$(__get_srv6_rtcfg_act "${n}")"

I would also describe the new syntax in the comment of
__setup_rt_policy() above: the ">" with the adjacency, "h" for the
host, and the ":End.X" field.

A mistake in an element can also go unnoticed. With "1>h:psp",
rt-1 gets End instead of End.X, and the End.X tests still pass. Could
a check at the top of this loop make the test fail on such an element?
The check could also refuse an End.X element without an adjacency,
e.g. "4:psp:End.X".
On a setup error, cleanup() reports SKIP, unless the check sets ret
to ksft_fail first.

> [snip]
> @@ -1479,4 +1623,12 @@ host_srv6_end_flv_next_csid_psp_tests
>  host_srv6_end_flv_consumed_srh_tests
>  defer_scope_pop
>  
> +defer_scope_push
> +set -e
> +setup_endx_flv_psp
> +set +e
> +host_srv6_end_flv_psp_tests "End.X"
> +host_srv6_end_flv_next_csid_psp_tests "End.X"
> +defer_scope_pop
> +
>  print_log_test_results

On a kernel with End PSP but without End.X PSP, the whole script ends
as SKIP, after the End tests passed. This can happen without any
backport, since the selftests from mainline can also be run on older
stable kernels. The selftest already probes End PSP with
test_kernel_supp_or_ksft_skip(), for kernels without it. We could
probe End.X PSP first in the same way, with an nh6, but returning
instead of exiting. If each scenario is moved into its own function,
the End.X one can return early, and only that scenario is skipped.

Sashiko asks whether the End.X tests would also pass if End.X worked
as End. The "1>h:psp" case above suggests that they would. I think it
is worth a look.

If you want a hand with any of these points, I am glad to help.

Thanks,
Andrea
