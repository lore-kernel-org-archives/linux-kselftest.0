Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905317;
	b=1UIH8W83JVuJ2mBn0422OEY44/wUx4t0reC6ifPyOVYCoNcgg3xSBLAEO5vfoJtaY0RK
	 zVUFin5UO/TydEyInTCEp7CsavWZZAuNXxDSYYjFoMtciTUndw6C9rHTeSFDpMKYZPjmb
	 qWph2IoEhuvJ8Q/uocfozC8rMkCI/ah3nHMwy2969WZ2n6tBaLHWpK20X2o8F0pReGR13
	 qFlvbZa3vdho2VVY7Sf+yeEywUff8Sh9NPPjDv22C9cVVusEvV1hdAPIfJO1/JBcg6D46
	 SZqNYd6jKS85tcwXRXYUzaUYrhtli7NwQ2ConOMtM4PpEzM9X6mCge9KnpAOB0IU9kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905317;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OF6Cp5FG0HrDU4fEnYEdsDYyzWBxBPMclGmCe3hKMhY=;
	b=Kyo7HQS7FqH71flf7e6G8+uGTpSdyTx9tUGZM+ZzYOgC+sR0bDntiQPQfX7zNf4jE0Z6
	 /6IqlTZJVpUKBsHaBoZ2ZNCJLMahPgGOCRKxuQ4xahAQLX+0ifOgkDkbOim5MzdWUk6+d
	 wMaK8ZBbBLMy6uSlv+e4EsU512GVW8MVbk5dFahSKYYrY50p/OQxNwAdmzKvj0RmSyqpd
	 0VRipvkKZ4BS84L//WlOr9TKaz7srS7Q/KTxZgw1pAUYlcxIBIrrRkAIB7J4Ak8epxPoK
	 IspTFgh/ZamjDtIxivsqK8NiKuuz4lLmhXEMdnH8Msg8bMcAsjoJ0FSYf7BOk7DPRwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="cgQgs/dO";
	arc=none smtp.remote-ip=91.218.175.12
Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2A3606A889
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2A3606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cgQgs/dO
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LQmkq3cSMRegdHM94Dm1Vc2r2vLITOvaUszwP4C6EyQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794905307; v=1; x=1795510107;
 b=cgQgs/dOoWlnzob1ObJRhaMmHYy+dgmR44aPy7coGph3V3l1WJ6er1iD1aI27clxqTg5LsQC
 ZEjLkhoR4h0F5OMr2oxuUbQX2KaCi12msTw0Xzdp1Z6lQK99CTz54WAvd6njqbAZ9cKJ85B4zTO
 mI8RKviDtSSSXfTuL+JMq3DE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8a9d863a83631418;
	Tue, 17 Nov 2026 08:48:26 +0000
X-Mizu-Trace-ID: 8a9d863a83631418
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 16:48:12 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Justin Iurman <justin.iurman@gmail.com>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-ID: <avwUzLyWxZl9cBIX@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
 <20261117035021.e724668d726ecce54e091288@uniroma2.it>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117035021.e724668d726ecce54e091288@uniroma2.it>

Hi Andrea,
On Tue, Nov 17, 2026 at 03:50:21AM +0100, Andrea Mayer wrote:
> On Thu, 12 Nov 2026 17:28:00 +0800
> Hangbin Liu <hangbin.liu@linux.dev> wrote:
> 
> > Add an End.X flavor scenario to srv6_end_flavors_test.sh that applies
> > the same PSP policies as the End scenario, alone and combined with
> > NEXT-C-SID, with every node bound through its adjacency (e.g. 4>2 for
> > rt-4 towards rt-2, 2>h towards the host), and exercise it with the
> > existing host connectivity tests.
> >
> > Teach the policy and endpoint helpers about <nodeid:op:act> elements:
> > __get_srv6_rtcfg_act() extracts the action, the __get_*_func()
> > helpers pick the Function for the action, __get_act_cfg() derives the
> > End.X next hop, and build_csid()/get_rt_sid() keep the adjacency so
> > it is encoded into the C-SIDs (e.g. fcbb:0:34a9:: is End.X on rt-3
> > towards rt-4).
> >
> > There is no need to re-check the ip command capability as it already
> > supports setting PSP flavor with End.X.
> 
> Hi Hangbin,
> thanks for adding the End.X scenario.
> 
> I see these main areas to work on:
> - How an element is read. The "router>adjacency" form is read in
>   different places, each with its own sed or cut. IMO, the selftest
>   would be easier to extend to other behaviors and flavor combinations
>   if the nodes were read in one place, with small helpers. What
>   depends on the behavior could also be chosen in one place.
> - A check of the elements, so that a mistake in a Policy does not go
>   unnoticed.
> - A check of the kernel support for End.X PSP.
> - The End.X tests with a consumed SRH.
> - One End.X SID per adjacency also without NEXT-C-SID, where today
>   the SIDs of a router do not depend on the adjacency.
> 
> The comments below are ideas on how to address each of them, plus
> some smaller points. There may also be other parts of the selftest
> to adapt.

Thanks for your kind review.

> > Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> > ---
> > I didn't add `host_srv6_end_flv_consumed_srh_tests()` for End.X because
> > the extra policy insertion does not work with the End.X policy. The packet
> > resolves the destination via the next hop directly, rather than doing a
> > re-lookup in table 90.
> 
> The ingress router can insert the extra SRH instead, on the first SID
> of the Policy. As in the End tests, an End SID of the base setup can
> then consume it. This way, we can add these tests for End.X too. What
> do you think?

For the End.X Policy (i.a) testing, we have SID List=fcff:3::a,fcff:4::af1,fcff:2::af1,cafe::2.
And we configured the next hop policy for the SID on each rt. e.g

On rt3: fcff:3::000a table 90 encap seg6local action End.X nh6 fcf0:0:3:4::4
On rt4: fcff:4::0af1 table 90 encap seg6local action End.X nh6 fcf0:0:2:4::2 flavors psp
on rt2: fcff:2::0af1 table 90 encap seg6local action End.X nh6 cafe::2 flavors psp

When the packet arrive on rt4, it's dst is set to fcff:2::af1. And the new
insert policy (fcff:2::0af1 table 90 encap seg6 mode inline segs fcff:3::000e dev dum0)
doesn't works as the End.X policy will goto next hop fcf0:0:2:4::2 directly
instead of looking at fcff:2::af1 on table 90.

Would you add more info about the ingress route?

> 
> > [snip]
> > diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > index 374b43661c28..5b1b13586df0 100755
> > --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > [snip]
> >  __get_srv6_rtcfg_id()
> >  {
> >  	local element="$1"
> >  
> > +	echo "${element}" | sed 's/:.*//; s/>[1234h]//g'
> > +}
> > [snip]
> > +__get_srv6_rtcfg_all_id()
> > +{
> > +	local element="$1"
> > +
> >  	echo "${element}" | cut -d':' -f1
> >  }
> >  
> 
> The same node is read again in build_csid(), get_rt_sid() and
> setup_rt_endpoints(), each time in its own way. Two small helpers,
> one returning the router of a node and one its adjacency, could
> replace these sed and cut. __get_srv6_rtcfg_id() above would then not
> need the sed, and __get_srv6_rtcfg_all_id() would probably not be
> needed at all. Without NEXT-C-SID, __setup_rt_policy() could then get
> each SID of the Policy from get_rt_sid(), as setup_rt_endpoints()
> does.

For a single End.X node, e.g. "4>2", we can return the router (4) and adjacent
router (2). But how to get multi nodes. e.g. "4>2,2>3", with theses 2 small
helpers?

> 
> > [snip]
> > +__get_noflv_func()
> > +{
> > +	local act="$1"
> > +
> > +	case "${act}" in
> > +	"End")
> > +		echo "${END_FUNC}" ;;
> > +	"End.X")
> > +		echo "${ENDX_FUNC}" ;;
> > +	esac
> > +}
> > +
> > +__get_psp_func()
> > +{
> > +	local act="$1"
> > +
> > +	case "${act}" in
> > +	"End")
> > +		echo "${END_PSP_FUNC}" ;;
> > +	"End.X")
> > +		echo "${ENDX_PSP_FUNC}" ;;
> > +	esac
> > +}
> > +
> > +__get_csid_psp_func()
> > +{
> > +	local act="$1"
> > +
> > +	case "${act}" in
> > +	"End")
> > +		echo "${END_CSID_PSP_FUNC}" ;;
> > +	"End.X")
> > +		echo "${ENDX_CSID_PSP_FUNC}" ;;
> > +	esac
> > +}
> 
> The three __get_*_func() helpers differ only in the constants. As a
> possible simplification, they could be one function with, for example,
> a case on the behavior and the operation ("End noflv", "End psp", ...,
> "End.X next-csid,psp"). Then the Functions are chosen in one place,
> also for a new behavior.

Thanks, I will merge them together.

> 
> > [snip]
> > @@ -713,10 +814,10 @@ op_has_next_csid()
> >  #  $1 - router
> >  #  $2 - operation <op> of the element (e.g. "next-csid,psp")
> >  #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> > -# e.g. input: "4" "psp" "0ef1"
> > -#      output: "fcff:4::0ef1"
> > -#      input: "4" "next-csid,psp" "e9"
> > -#      output: "fcbb:0:40e9::/48"
> > +# e.g. input: "4" "psp" "0ef1", output: "fcff:4::0ef1"
> > +#      input: "4>2" "psp" "0af1", output: "fcff:4::0af1"
> > +#      input: "4" "next-csid,psp" "e9", output: "fcbb:0:40e9::/48"
> > +#      input: "4>2" "next-csid,psp" "a9", output: "fcbb:0:42a9::/48"
> >  get_rt_sid()
> >  {
> >  	local rt="$1"
> > @@ -730,6 +831,7 @@ get_rt_sid()
> >  		return
> >  	fi
> >  
> > +	rt=$(echo "${rt}" | sed 's/>.*//')
> >  	echo "${LOCATOR_SERVICE}:${rt}::${func}"
> >  }
> 
> Without NEXT-C-SID, get_rt_sid() drops the adjacency, as the Sashiko
> review also notes: "4>2:psp:End.X" and "4>3:psp:End.X" would both get
> fcff:4::0af1. I think each adjacency should have its own SID. The
> SID could carry the adjacency, as the C-SID already does. Then
> __setup_rt_policy() needs the new SID. Calling get_rt_sid() there,
> as suggested above, would do that.

Hmm, do you want to set the adjacency like xaf1 or xxa1?
e.g. ffcf:4::2af1 for 4>2:psp:End.X, ffcf:4::3af1 for 4>3:psp:End.X
or
ffcf:4::42a1 for 4>2:psp:End.X, ffcf:4::43a1 for 4>3:psp:End.X?

The second one may also need to adjust the End address. e.g.
fcff:x::ef1 -> fcff:x::e1

> 
> > [snip]
> > @@ -765,26 +867,34 @@ setup_rt_endpoint()
> >  
> >  # Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
> >  # args:
> > -#  $1 - <nodeid> of the element: one router, or a comma-separated list
> > +#  $1 - <nodeid:op:act> element
> >  #  $2 - operation <op> of the element (e.g. "next-csid,psp")
> >  #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> > -#  $4 - SRv6 Endpoint behavior and flavors (e.g. "End flavors psp")
> > -# e.g. input: "4,2" "next-csid,psp" "e9"
> > -#             "End flavors next-csid,psp lblen 32 nflen 16"
> > +#  $4 - flavor configuration of the behavior, without the action
> > +#       (e.g. "flavors psp")
> > +# e.g. input: "4,2:next-csid,psp" "next-csid,psp" "e9"
> > +#             "flavors next-csid,psp lblen 32 nflen 16"
> >  #      result: the behavior is added on rt-4, bound to fcbb:0:40e9::/48, and
> >  #              on rt-2, bound to fcbb:0:20e9::/48
> >  setup_rt_endpoints()
> >  {
> > -	local node="$1"
> > +	local nodeid="$1"
> >  	local op_type="$2"
> >  	local func="$3"
> >  	local behavior_cfg="$4"
> > +	local nodes node next_node
> > +	local act act_cfg
> >  	local sid
> >  	local rt
> >  
> > -	for rt in $(echo "${node}" | sed 's/,/ /g'); do
> > -		sid="$(get_rt_sid "${rt}" "${op_type}" "${func}")"
> > -		setup_rt_endpoint "${rt}" "${sid}" "${behavior_cfg}"
> > +	nodes="$(__get_srv6_rtcfg_all_id "${nodeid}")"
> > +	act="$(__get_srv6_rtcfg_act "${nodeid}")"
> > +	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
> > +		rt=$(echo "${node}" | cut -d'>' -f1)
> > +		next_node=$(echo "${node}" | cut -d'>' -f2)
> > +		act_cfg="$(__get_act_cfg "${act}" "${rt}" "${next_node}")"
> > +		sid="$(get_rt_sid "${node}" "${op_type}" "${func}")"
> > +		setup_rt_endpoint "${rt}" "${sid}" "${act_cfg} ${behavior_cfg}"
> >  	done
> >  }
> 
> setup_rt_endpoints() now gets the whole element, and reads it again
> with the same helpers as __setup_rt_policy(). I think
> __setup_rt_policy() can read the element once, and pass only what
> setup_rt_endpoints() needs, for example the nodes and the behavior.
> 
> Nit: I would declare one local per line in the new code, as in the
> rest of the selftest.
> 
> > [snip]
> > @@ -824,7 +934,8 @@ setup_rt_host_proxy()
> >  #       cafe::x:yy on the loopback of the host (e.g. 2:e9)
> >  #  $2 - SRv6 router configured for enforcing the SRv6 Policy
> >  #  $3 - compact way to represent a list of SRv6 routers with their operations
> > -#       (i.e. behaviors) that each of them needs to perform. Every <nodeid:op>
> > +#       (i.e. behaviors) that each of them needs to perform. Every
> > +#       <nodeid:op:act>
> >  #       element constructs a SID that is associated with the behavior <op> on
> >  #       the <nodeid> node. The list of such elements forms an SRv6 Policy.
> >  #       For "next-csid,psp", <nodeid> is a comma-separated list of node IDs.
> > @@ -841,34 +952,38 @@ __setup_rt_policy()
> >  	local container
> >  	local function
> >  	local op_type
> > +	local nodes
> >  	local node
> > +	local act
> >  	local n
> >  
> >  	in_nsname="$(get_rtname "${encap_rt}")"
> >  
> >  	for n in ${policy_rts}; do
> >  		node="$(__get_srv6_rtcfg_id "${n}")"
> > +		nodes="$(__get_srv6_rtcfg_all_id "${n}")"
> >  		op_type="$(__get_srv6_rtcfg_op "${n}")"
> > +		act="$(__get_srv6_rtcfg_act "${n}")"
> 
> I would also describe the new syntax in the comment of
> __setup_rt_policy() above: the ">" with the adjacency, "h" for the
> host, and the ":End.X" field.
> 
> A mistake in an element can also go unnoticed. With "1>h:psp",
> rt-1 gets End instead of End.X, and the End.X tests still pass. Could
> a check at the top of this loop make the test fail on such an element?
> The check could also refuse an End.X element without an adjacency,
> e.g. "4:psp:End.X".
> On a setup error, cleanup() reports SKIP, unless the check sets ret
> to ksft_fail first.

Thanks, I will add a check for this.

> 
> > [snip]
> > @@ -1479,4 +1623,12 @@ host_srv6_end_flv_next_csid_psp_tests
> >  host_srv6_end_flv_consumed_srh_tests
> >  defer_scope_pop
> >  
> > +defer_scope_push
> > +set -e
> > +setup_endx_flv_psp
> > +set +e
> > +host_srv6_end_flv_psp_tests "End.X"
> > +host_srv6_end_flv_next_csid_psp_tests "End.X"
> > +defer_scope_pop
> > +
> >  print_log_test_results
> 
> On a kernel with End PSP but without End.X PSP, the whole script ends
> as SKIP, after the End tests passed. This can happen without any
> backport, since the selftests from mainline can also be run on older
> stable kernels. The selftest already probes End PSP with
> test_kernel_supp_or_ksft_skip(), for kernels without it. We could
> probe End.X PSP first in the same way, with an nh6, but returning
> instead of exiting. If each scenario is moved into its own function,
> the End.X one can return early, and only that scenario is skipped.
> 
> Sashiko asks whether the End.X tests would also pass if End.X worked
> as End. The "1>h:psp" case above suggests that they would. I think it
> is worth a look.

Also a check for this.

Thanks
Hangbin
