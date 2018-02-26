From: andrew@lunn.ch (Andrew Lunn)
Date: Mon, 26 Feb 2018 14:48:02 +0100
Subject: [PATCH net-next 01/14] selftests: forwarding: Add initial
 testing framework
In-Reply-To: <20180226085948.19368-2-idosch@mellanox.com>
References: <20180226085948.19368-1-idosch@mellanox.com>
 <20180226085948.19368-2-idosch@mellanox.com>
Message-ID: <20180226134802.GC1195@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180226134802.PHhna5iRYl8TfQIx6Z0u2mUDQfh1bYQHx6527EwOeWU@z>

> +                             br0
> +                              +
> +               vrf-h1         |           vrf-h2
> +                 +        +---+----+        +
> +                 |        |        |        |
> +    192.0.2.1/24 +        +        +        + 192.0.2.2/24
> +               swp1     swp2     swp3     swp4
> +                 +        +        +        +
> +                 |        |        |        |
> +                 +--------+        +--------+
> +

> +setup_prepare
> +setup_wait
> +
> +ping_test $h1 192.0.2.2
> +ping6_test $h1 2001:db8:1::2

How about putting 192.0.2.3/24 on br0, and pinging to/from
it. Otherwise you don't test the slow path. 

I would also suggest a much simpler first test.

> +                             
> +                              
> +               vrf-h1                                         vrf-h2
> +                 +                                              +
> +                 |                                              |
> +    192.0.2.1/24 +        + 192.0.2.2/24  192.0.3.1/24 +        + 192.0.3.2/24
> +               swp1     swp2                          swp3     swp4
> +                 +        +                            +        +
> +                 |        |                            |        |
> +                 +--------+                            +--------+

Ping from 192.0.2.1 to 192.0.2.2 and test there are 0 packets seen on
swp3 and swp4. I've seen DSA drivers get this wrong before, forgetting
to ensure ports are properly separated by default.

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
