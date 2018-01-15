From: idosch@idosch.org (Ido Schimmel)
Date: Mon, 15 Jan 2018 22:05:20 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
 forwarding: Add a test for FDB learning
In-Reply-To: <20180115194146.GA31030@lunn.ch>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-3-idosch@mellanox.com>
 <20180115194146.GA31030@lunn.ch>
Message-ID: <20180115200520.GA27952@splinter>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180115200520.Q8O2i19Vd7V1w13Gmx9tOWIrhcHJNnW1nuAPmD-R5d0@z>

Hi Andrew,

On Mon, Jan 15, 2018@08:41:46PM +0100, Andrew Lunn wrote:
> On Mon, Jan 15, 2018@09:18:43PM +0200, Ido Schimmel wrote:
> > Send a packet with a specific destination MAC, make sure it was learned
> > on the ingress port and then aged-out.
> 
> It would be interesting to show the hardware actually uses the FDB,
> not just learns it. Send some packets back, and ensure they go out the
> intended port. Also, check they don't go out a third port, i.e. make
> sure the hardware is not flooding. Once it has aged-out, then test is
> is flooding out all ports.

Good idea. We can actually do that with only two ports. Disable flooding
on port A, check packets with DMAC A don't egress the port. Inject a
packet with SMAC A through port A, check packets with DMAC A egress the
port.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
