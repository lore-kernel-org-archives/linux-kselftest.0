From: davem at davemloft.net (David Miller)
Date: Fri, 15 Feb 2019 20:32:42 -0800 (PST)
Subject: [PATCH net-next] selftests: forwarding: Add some missing
 configuration symbols
In-Reply-To: <20190215181457.21101-1-f.fainelli@gmail.com>
References: <20190215181457.21101-1-f.fainelli@gmail.com>
Message-ID: <20190215.203242.1751897990893074948.davem@davemloft.net>

From: Florian Fainelli <f.fainelli at gmail.com>
Date: Fri, 15 Feb 2019 10:14:52 -0800

> For the forwarding selftests to work, we need network namespaces when
> using veth/vrf otherwise ping/ping6 commands like these:
> 
> ip vrf exec vveth0 /bin/ping 192.0.2.2 -c 10 -i 0.1 -w 5
> 
> will fail because network namespaces may not be enabled.
> 
> Signed-off-by: Florian Fainelli <f.fainelli at gmail.com>

Applied.
