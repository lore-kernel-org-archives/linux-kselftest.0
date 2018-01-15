From: andrew@lunn.ch (Andrew Lunn)
Date: Mon, 15 Jan 2018 20:41:46 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
 forwarding: Add a test for FDB learning
In-Reply-To: <20180115191853.26129-3-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-3-idosch@mellanox.com>
Message-ID: <20180115194146.GA31030@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180115194146.3-6eWa_qHN1U3VNETGqobQlqVuvhytlN4SMwb484e9M@z>

On Mon, Jan 15, 2018@09:18:43PM +0200, Ido Schimmel wrote:
> Send a packet with a specific destination MAC, make sure it was learned
> on the ingress port and then aged-out.

Hi Ido

It would be interesting to show the hardware actually uses the FDB,
not just learns it. Send some packets back, and ensure they go out the
intended port. Also, check they don't go out a third port, i.e. make
sure the hardware is not flooding. Once it has aged-out, then test is
is flooding out all ports.

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
