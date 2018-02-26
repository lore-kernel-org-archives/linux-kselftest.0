From: petrm@mellanox.com (Petr Machata)
Date: Mon, 26 Feb 2018 18:31:49 +0200
Subject: [PATCH net-next 02/14] selftests: forwarding: Add a test for FDB
 learning
In-Reply-To: <20180226085948.19368-3-idosch@mellanox.com> (Ido Schimmel's
 message of "Mon, 26 Feb 2018 10:59:36 +0200")
References: <20180226085948.19368-1-idosch@mellanox.com>
 <20180226085948.19368-3-idosch@mellanox.com>
Message-ID: <wih4lm3pv9m.fsf@dev-r-vrt-156.mtr.labs.mlnx>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180226163149.BgFDiS4XfElOcgBbUAqNuYJsxFAOm7L9cKGGALA6Paw@z>

Ido Schimmel <idosch at mellanox.com> writes:

> +learning_test()
> +{
> +	local mac=de:ad:be:ef:13:37
> +	local ageing_time
> +	local br_port1=$2	# Connected to `host1_if`.
> +	local host1_if=$3
> +	local host2_if=$4
> +	local bridge=$1

I don't think applying RXT in Bash is appropriate. The ordering of the
local variables should instead follow the order of function arguments,
because that information isn't communicated by the function prototype
itself, unlike C.

Thanks,
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
