From: dsahern at gmail.com (David Ahern)
Date: Wed, 17 Jan 2018 12:56:01 -0800
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 01/12] selftests:
 forwarding: Add initial testing framework
In-Reply-To: <20180115191853.26129-2-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-2-idosch@mellanox.com>
Message-ID: <3f22af29-6bf9-58fc-9b4c-cc8696c3b163@gmail.com>

On 1/15/18 11:18 AM, Ido Schimmel wrote:
> +### Tests ###
> +
> +ping_test()
> +{
> +	local vrf_name=$1
> +	local dip=$2
> +
> +	RET=0
> +
> +	ip vrf exec $vrf_name ping $dip -c 10 -i 0.1 -w 2 &> /dev/null
> +	check_err $?
> +	print_result "ping"
> +}

IPv6 addresses on debian need ping6:

root at mlx-2700-05:~/selftests# ip vrf exec vrf-h1 ping 2001:db8:2::2 -c
10 -i 0.1 -w 2
ping: unknown host 2001:db8:2::2

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
