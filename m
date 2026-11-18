Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970248;
	b=HjigNxWJTB22SGykTGVZTDWkOTL2IeISHak6A6zArpxpSciLEMUygYaxNPn+UaIMdajc
	 dSzORU2vyIsCyv6ab4nzzK7xn76ORJn2eDyvfAZPG89A13gvcQ6m0cbitAChxFaXXAAtO
	 I2KGOS2bKhGrtoxlC/H+vOu/T64qnScnYOYq+JDYuwtCdmKlUa1cRmliOxHecNpkUJrrf
	 agowsthv3QFYtXPGJWFSFRbaSS8C1JQMu5r4eb1nUhrqwzbKN5ZiJp8mpbig5d0CimOAI
	 WfrB5nGwBzs/dkKiqyExIejJU0EoxxmsDcvss3lGH0a7UzTLiPHdLLm9c3LbYfkQsNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970248;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=epbfdBp28UBBhvRLkexZRai4gc9+i5W8pdU9So+sFKM=;
	b=M7CxfCSvVHK6liaOxa6Dxyf5O7fYYETAj2ljeU3NCxD5wCb6Rcj9wZuGC0BtdiGELmyd
	 OC4xnpJ4OyR2YjYruD1cZ1r95V6hYyUstUOru79zKKDJZK44i7O7a46kRsov6lfJbPg+K
	 K5jmsHSa6aiarBpAsg+GcAzw4WH22m71WdVhFa3HXWNEjQp8CCLRffRDIVLJE423bFE3C
	 QoYfF5c3Y+ciBhrADzF7oEp+ZXa23Dozwz31ItepkXfHHsw8eKxbC57Ys0EBidnRjfdOS
	 GyIPphA3M75NJ9VV22Ns8GbpMU+B6podjaDA/fKo+u9vVYBdW9SLpq1vjg77goT/cCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=BtBblj+1;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=CYEZJRUa;
	arc=none smtp.remote-ip=160.80.4.37
Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E5C606A31C;
	Wed, 18 Nov 2026 02:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=BtBblj+1;
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=CYEZJRUa
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AI2oFTg025412;
	Wed, 18 Nov 2026 03:50:20 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 7FB06120065;
	Wed, 18 Nov 2026 03:50:10 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1794970211; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epbfdBp28UBBhvRLkexZRai4gc9+i5W8pdU9So+sFKM=;
	b=BtBblj+1i796C5YWZB+PuqMkh0iV8sKRwIMRnWrvZzRHu6+RbYSYw+l8tqXxU/LPBJfAEy
	idqTGXl8FlS1u4BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1794970211; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epbfdBp28UBBhvRLkexZRai4gc9+i5W8pdU9So+sFKM=;
	b=CYEZJRUaSneicAGMDJRO5LluZ7qtOH5TtZ39hcq8VURunWEiq+cdoDNYbeH4jS6FVcjw10
	TVePCNWU1dJr7Aa8cQZ7l6yTLRcnXDHUuLKvtwD4RZFbrEq3/JCy38ZBI1wiPFEWpNE92A
	hxadRBMBTUsAoRWQG39ZHutlAIPFG3nD4WJxar7bAkRtTQ1K66Hy/t2SyXPQK3mzY/gDr7
	SnrrldZK8SjJC8ObnWsJCjRaXbyAVIjC0BzPwg1osr83KKWoD8gRPYr+RA4BCwIFWOUg80
	cDWXtutzhl/MC05Zls+NRiXu8Xjs7JJQ8RBK8TSGy+TPbC+cRLt92P63dd4tVA==
Date: Wed, 18 Nov 2026 03:50:10 +0100
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
        Justin Iurman
 <justin.iurman@gmail.com>,
        Andrea Mayer <andrea@common-net.org>,
        Andrea
 Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-Id: <20261118035010.e028076fbd99fbcddd937156@uniroma2.it>
In-Reply-To: <avwUzLyWxZl9cBIX@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
 <20261117035021.e724668d726ecce54e091288@uniroma2.it>
 <avwUzLyWxZl9cBIX@fedora>
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

On Tue, 17 Nov 2026 16:48:12 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> Hi Andrea,
> On Tue, Nov 17, 2026 at 03:50:21AM +0100, Andrea Mayer wrote:
> > On Thu, 12 Nov 2026 17:28:00 +0800
> > Hangbin Liu <hangbin.liu@linux.dev> wrote:
> > 
> > > Add an End.X flavor scenario to srv6_end_flavors_test.sh that applies
> > > the same PSP policies as the End scenario, alone and combined with
> > > NEXT-C-SID, with every node bound through its adjacency (e.g. 4>2 for
> > > rt-4 towards rt-2, 2>h towards the host), and exercise it with the
> > > existing host connectivity tests.
> > >
> > > Teach the policy and endpoint helpers about <nodeid:op:act> elements:
> > > __get_srv6_rtcfg_act() extracts the action, the __get_*_func()
> > > helpers pick the Function for the action, __get_act_cfg() derives the
> > > End.X next hop, and build_csid()/get_rt_sid() keep the adjacency so
> > > it is encoded into the C-SIDs (e.g. fcbb:0:34a9:: is End.X on rt-3
> > > towards rt-4).
> > >
> > > There is no need to re-check the ip command capability as it already
> > > supports setting PSP flavor with End.X.
> > 
> > Hi Hangbin,
> > thanks for adding the End.X scenario.
> > 
> > I see these main areas to work on:
> > - How an element is read. The "router>adjacency" form is read in
> >   different places, each with its own sed or cut. IMO, the selftest
> >   would be easier to extend to other behaviors and flavor combinations
> >   if the nodes were read in one place, with small helpers. What
> >   depends on the behavior could also be chosen in one place.
> > - A check of the elements, so that a mistake in a Policy does not go
> >   unnoticed.
> > - A check of the kernel support for End.X PSP.
> > - The End.X tests with a consumed SRH.
> > - One End.X SID per adjacency also without NEXT-C-SID, where today
> >   the SIDs of a router do not depend on the adjacency.
> > 
> > The comments below are ideas on how to address each of them, plus
> > some smaller points. There may also be other parts of the selftest
> > to adapt.
>
> Thanks for your kind review.
>
> > > Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> > > ---
> > > I didn't add `host_srv6_end_flv_consumed_srh_tests()` for End.X because
> > > the extra policy insertion does not work with the End.X policy. The packet
> > > resolves the destination via the next hop directly, rather than doing a
> > > re-lookup in table 90.
> > 
> > The ingress router can insert the extra SRH instead, on the first SID
> > of the Policy. As in the End tests, an End SID of the base setup can
> > then consume it. This way, we can add these tests for End.X too. What
> > do you think?
>
> For the End.X Policy (i.a) testing, we have SID List=fcff:3::a,fcff:4::af1,fcff:2::af1,cafe::2.
> And we configured the next hop policy for the SID on each rt. e.g
>
> On rt3: fcff:3::000a table 90 encap seg6local action End.X nh6 fcf0:0:3:4::4
> On rt4: fcff:4::0af1 table 90 encap seg6local action End.X nh6 fcf0:0:2:4::2 flavors psp
> on rt2: fcff:2::0af1 table 90 encap seg6local action End.X nh6 cafe::2 flavors psp
>
> When the packet arrive on rt4, it's dst is set to fcff:2::af1. And the new
> insert policy (fcff:2::0af1 table 90 encap seg6 mode inline segs fcff:3::000e dev dum0)
> doesn't works as the End.X policy will goto next hop fcf0:0:2:4::2 directly
> instead of looking at fcff:2::af1 on table 90.
>
> Would you add more info about the ingress route?

Hi Hangbin,

With one SID per adjacency (see the SID format below), the SID List of
(i.a) is fcff:3::400a,fcff:4::2af1,fcff:2::0af1,cafe::2. The ingress router
is rt-1. After rt-1 applies the Policy, the DA is the first SID,
fcff:3::400a, and rt-1 looks it up in table 90. The route that inserts the
extra SRH can go on rt-1, as the End tests already do for (i.b) on rt-2:

  fcff:3::400a table 90 encap seg6 mode inline segs fcff:4::000e dev dum0

rt-4 consumes the extra SRH with its End SID, and sets the DA back to
fcff:3::400a. Then the packet follows the End.X Policy. The other End.X
Policies work the same way, with the route on their ingress router, for
their first SID. Would this work for you?

>
> > 
> > > [snip]
> > > diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > > index 374b43661c28..5b1b13586df0 100755
> > > --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > > +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > > [snip]
> > >  __get_srv6_rtcfg_id()
> > >  {
> > >  	local element="$1"
> > >  
> > > +	echo "${element}" | sed 's/:.*//; s/>[1234h]//g'
> > > +}
> > > [snip]
> > > +__get_srv6_rtcfg_all_id()
> > > +{
> > > +	local element="$1"
> > > +
> > >  	echo "${element}" | cut -d':' -f1
> > >  }
> > >  
> > 
> > The same node is read again in build_csid(), get_rt_sid() and
> > setup_rt_endpoints(), each time in its own way. Two small helpers,
> > one returning the router of a node and one its adjacency, could
> > replace these sed and cut. __get_srv6_rtcfg_id() above would then not
> > need the sed, and __get_srv6_rtcfg_all_id() would probably not be
> > needed at all. Without NEXT-C-SID, __setup_rt_policy() could then get
> > each SID of the Policy from get_rt_sid(), as setup_rt_endpoints()
> > does.
>
> For a single End.X node, e.g. "4>2", we can return the router (4) and adjacent
> router (2). But how to get multi nodes. e.g. "4>2,2>3", with theses 2 small
> helpers?

A list of nodes comes with NEXT-C-SID, where the element constructs one
C-SID container. build_csid_container() and setup_rt_endpoints() already
loop over these nodes, one at a time. The helpers would be used in these
loops, on each node. For example, in build_csid_container():

	"4>2,2>3"  ->  4>2: router 4, adjacency 2  ->  42a9
	               2>3: router 2, adjacency 3  ->  23a9
	           ->  fcbb:0:42a9:23a9::

>
> > 
> > > [snip]
> > > +__get_noflv_func()
> > > +{
> > > +	local act="$1"
> > > +
> > > +	case "${act}" in
> > > +	"End")
> > > +		echo "${END_FUNC}" ;;
> > > +	"End.X")
> > > +		echo "${ENDX_FUNC}" ;;
> > > +	esac
> > > +}
> > > +
> > > +__get_psp_func()
> > > +{
> > > +	local act="$1"
> > > +
> > > +	case "${act}" in
> > > +	"End")
> > > +		echo "${END_PSP_FUNC}" ;;
> > > +	"End.X")
> > > +		echo "${ENDX_PSP_FUNC}" ;;
> > > +	esac
> > > +}
> > > +
> > > +__get_csid_psp_func()
> > > +{
> > > +	local act="$1"
> > > +
> > > +	case "${act}" in
> > > +	"End")
> > > +		echo "${END_CSID_PSP_FUNC}" ;;
> > > +	"End.X")
> > > +		echo "${ENDX_CSID_PSP_FUNC}" ;;
> > > +	esac
> > > +}
> > 
> > The three __get_*_func() helpers differ only in the constants. As a
> > possible simplification, they could be one function with, for example,
> > a case on the behavior and the operation ("End noflv", "End psp", ...,
> > "End.X next-csid,psp"). Then the Functions are chosen in one place,
> > also for a new behavior.
>
> Thanks, I will merge them together.
>
> > 
> > > [snip]
> > > @@ -713,10 +814,10 @@ op_has_next_csid()
> > >  #  $1 - router
> > >  #  $2 - operation <op> of the element (e.g. "next-csid,psp")
> > >  #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> > > -# e.g. input: "4" "psp" "0ef1"
> > > -#      output: "fcff:4::0ef1"
> > > -#      input: "4" "next-csid,psp" "e9"
> > > -#      output: "fcbb:0:40e9::/48"
> > > +# e.g. input: "4" "psp" "0ef1", output: "fcff:4::0ef1"
> > > +#      input: "4>2" "psp" "0af1", output: "fcff:4::0af1"
> > > +#      input: "4" "next-csid,psp" "e9", output: "fcbb:0:40e9::/48"
> > > +#      input: "4>2" "next-csid,psp" "a9", output: "fcbb:0:42a9::/48"
> > >  get_rt_sid()
> > >  {
> > >  	local rt="$1"
> > > @@ -730,6 +831,7 @@ get_rt_sid()
> > >  		return
> > >  	fi
> > >  
> > > +	rt=$(echo "${rt}" | sed 's/>.*//')
> > >  	echo "${LOCATOR_SERVICE}:${rt}::${func}"
> > >  }
> > 
> > Without NEXT-C-SID, get_rt_sid() drops the adjacency, as the Sashiko
> > review also notes: "4>2:psp:End.X" and "4>3:psp:End.X" would both get
> > fcff:4::0af1. I think each adjacency should have its own SID. The
> > SID could carry the adjacency, as the C-SID already does. Then
> > __setup_rt_policy() needs the new SID. Calling get_rt_sid() there,
> > as suggested above, would do that.
>
> Hmm, do you want to set the adjacency like xaf1 or xxa1?
> e.g. ffcf:4::2af1 for 4>2:psp:End.X, ffcf:4::3af1 for 4>3:psp:End.X
> or
> ffcf:4::42a1 for 4>2:psp:End.X, ffcf:4::43a1 for 4>3:psp:End.X?
>
> The second one may also need to adjust the End address. e.g.
> fcff:x::ef1 -> fcff:x::e1

The first one you propose, fcff:4::2af1, seems reasonable. The adjacency
takes the place of the leading 0 of the Function (0af1 -> 2af1). Towards
the host the 0 stays, as in the C-SID, and the End SIDs do not change.

> [snip]

Thanks,
Andrea
