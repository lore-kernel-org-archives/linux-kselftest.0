From: andrew@lunn.ch (Andrew Lunn)
Date: Mon, 15 Jan 2018 22:01:40 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
 forwarding: Add a test for FDB learning
In-Reply-To: <20180115200520.GA27952@splinter>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-3-idosch@mellanox.com>
 <20180115194146.GA31030@lunn.ch> <20180115200520.GA27952@splinter>
Message-ID: <20180115210140.GB31030@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180115210140.-srDc9hph-1ZCY5G23sAZSipSgsHt_H-omovk3PryaU@z>

> Good idea. We can actually do that with only two ports. Disable flooding
> on port A, check packets with DMAC A don't egress the port. Inject a
> packet with SMAC A through port A, check packets with DMAC A egress the
> port.

Hi Ido

You could do it like that. But that is more testing that you can
disable flooding. And how often do users do that?

What does your marketing department tell you about typical users of
your switches? For DSA, we typically have 4 or 5 ports. 4 of those
ports are typically in one bridge, and the remaining port is used
alone. That is the sort of setup i test in DSA. Your switches
typically have 40 ports? Do your users setup 20 bridges each with two
ports?

I would test the use cases which people actually use. I expect people
setup a bridge with multiple ports, and they send traffic without
changing any defaults. So that setup is what i would test.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
