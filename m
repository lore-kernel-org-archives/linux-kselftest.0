From: pablo at netfilter.org (Pablo Neira Ayuso)
Date: Tue, 21 May 2019 20:11:25 +0200
Subject: [PATCH v2] selftests: netfilter: missing error check when
 setting up veth interface
In-Reply-To: <20190515064405.3981-1-jeffrin@rajagiritech.edu.in>
References: <20190515064405.3981-1-jeffrin@rajagiritech.edu.in>
Message-ID: <20190521181125.anqj32v3gcwjxs3z@salvia>

On Wed, May 15, 2019 at 12:14:04PM +0530, Jeffrin Jose T wrote:
> A test for  the basic NAT functionality uses ip command which
> needs veth device.There is a condition where the kernel support
> for veth is not compiled into the kernel and the test script
> breaks.This patch contains code for reasonable error display
> and correct code exit.

Applied, thanks.
