Received: from mta1.migadu.com (out-214.mta1.migadu.com [95.215.58.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C3B471274
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251043; cv=none; b=eQVmVUiMIy/hmDZZ7gjOsNaui+ZvQXTLJHUby+l+PO5aHVo2zGecISUEFB1kPksExC+I8oTCqizSouAPK5vu6k4Vjct7HqaBOCOYY36M2z8biawHpyVZMHYVh3kqVhkjLGzcyG1Txhj1G/4NGvfSY3e6XewfqO1byXcDZHvBtE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251043; c=relaxed/simple;
	bh=xOvD7xRvRZjK1MUC2LVvd2XrUqNedh8ivStT0iBqrqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNQvbfiDanXOX3ah+AinSyGxpCZFm79m3s00wg/QMz6bGrEjrzoDMWofZQwX3IoYrdy4EpkATIyM2IDwHUdK1B8kMEcvzmFYCPjAlIwgaHbd058PIpqsu3xmxEkMKNIqUNBtNcFM4DwhMp/a/sKCpiws7VvxgJMjKjZmKAc2GI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZUtcLBnh; arc=none smtp.client-ip=95.215.58.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZUtcLBnh"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xOvD7xRvRZjK1MUC2LVvd2XrUqNedh8ivStT0iBqrqE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788251039; v=1; x=1788855839;
 b=ZUtcLBnh/6e1lWe7dDRyqLbU0QudA2tJB56PrqZDPNB4BjMdJuI1byGzAO82OrGIDLTW4b4C
 S+oAWpUh+xG07kzHOR5ewCddnr/FRFCiuT9EaGxNmJpPrZsqag7Ogc+fNbsGSHJacsfqgnoPGT0
 fDqZZaOmY58Ewrm0k+KGGmms=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b142e79e6ab46137;
	Tue, 01 Sep 2026 08:23:59 +0000
X-Mizu-Trace-ID: b142e79e6ab46137
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 16:23:51 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <apaLl13Saka4Sw1J@fedora>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
 <20260831150818.660de896@kernel.org>
 <apZ3f3vm5sUrcyrZ@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apZ3f3vm5sUrcyrZ@fedora>

On Tue, Sep 01, 2026 at 02:58:17PM +0800, Hangbin Liu wrote:
> On Mon, Aug 31, 2026 at 03:08:18PM -0700, Jakub Kicinski wrote:
> > On Mon, 31 Aug 2026 11:28:10 +0800 Hangbin Liu wrote:
> > > Add ethtool get/set_link_ksettings callbacks to netdevsim so the simulated
> > > link speed and duplex can be queried and configured from userspace.
> > > 
> > > Move NSIM_LINK_SPEED_MAX and NSIM_LINK_SPEED_UNIT from dev.c to netdevsim.h
> > > so they are available to both the devlink rate path and the new ethtool
> > > code. The set callback rejects speeds exceeding NSIM_LINK_SPEED_MAX.
> > > 
> > > The default link speed is set to SPEED_5000 with DUPLEX_FULL, matching the
> > > existing NSIM_LINK_SPEED_MAX definition.
> > 
> > This breaks TDC which uses netdevsim for taprio testing.
> 
> Sigh, I really didn't expect a speed feature could break the tc qdisc
> testing... I will check the reason.

OK, here is the reason. In taprio_set_picos_per_byte(), it init NIC speed to
SPEED_10. If the NIC doesn't support get_link_ksettings, the final calculated
picos_per_byte would be a extremely large number 800000. The later tc taprio
testing `tc qdisc ... sched-entry S 02 300` will always failed in
fill_sched_entry(), as min_duration is also a large number 48000.

After we supports get_link_ksettings for netdevsim, the speed is 5000 and
picos_per_byte will be init to 1600. The later min_duration checking in
fill_sched_entry() is 300 vs 96. So the tc qdisc command always return 0.

To fix the test, I think we should reduce the interval number. e.g.

diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
index cd19d05925e4..c3418bde9ad6 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/taprio.json
@@ -145,7 +145,7 @@
         "setup": [
             "echo \"1 1 8\" > /sys/bus/netdevsim/new_device"
         ],
-        "cmdUnderTest": "$TC qdisc add dev $ETH root handle 1: taprio num_tc 2 queues 1@0 1@1 sched-entry S 01 300 sched-entry S 02 1700 clockid CLOCK_TAI",
+        "cmdUnderTest": "$TC qdisc add dev $ETH root handle 1: taprio num_tc 2 queues 1@0 1@1 sched-entry S 01 30 sched-entry S 02 70 clockid CLOCK_TAI",
         "expExitCode": "2",
         "verifyCmd": "$TC qdisc show dev $ETH",
         "matchPattern": "qdisc taprio 1: root refcnt",

Thanks
Hangbin
