From: andrew@lunn.ch (Andrew Lunn)
Date: Wed, 17 Jan 2018 22:18:18 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 01/12] selftests:
 forwarding: Add initial testing framework
In-Reply-To: <3f22af29-6bf9-58fc-9b4c-cc8696c3b163@gmail.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-2-idosch@mellanox.com>
 <3f22af29-6bf9-58fc-9b4c-cc8696c3b163@gmail.com>
Message-ID: <20180117211818.GF5894@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180117211818.3Hgh1t5Yrkinl5wwi8I8XbJbbT2DiKP-ri84t9xG8jI@z>

> IPv6 addresses on debian need ping6:
> 
> root at mlx-2700-05:~/selftests# ip vrf exec vrf-h1 ping 2001:db8:2::2 -c
> 10 -i 0.1 -w 2
> ping: unknown host 2001:db8:2::2

Hi David

Depends on you vintage of Debian:

$ ping 2607:f8b0:4009:813::2004
PING 2607:f8b0:4009:813::2004(2607:f8b0:4009:813::2004) 56 data bytes
64 bytes from 2607:f8b0:4009:813::2004: icmp_seq=1 ttl=54 time=22.1 ms
64 bytes from 2607:f8b0:4009:813::2004: icmp_seq=2 ttl=54 time=20.7 ms
^C
--- 2607:f8b0:4009:813::2004 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 20.714/21.426/22.139/0.727 ms

I however don't know when this generally because available, but
stretch, buster and sid appear to have it.

  Andrew

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
