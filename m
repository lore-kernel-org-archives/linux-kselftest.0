From: idosch@idosch.org (Ido Schimmel)
Date: Mon, 26 Feb 2018 22:02:17 +0200
Subject: [PATCH net-next 02/14] selftests: forwarding: Add a test for FDB
 learning
In-Reply-To: <wih4lm3pv9m.fsf@dev-r-vrt-156.mtr.labs.mlnx>
References: <20180226085948.19368-1-idosch@mellanox.com>
 <20180226085948.19368-3-idosch@mellanox.com>
 <wih4lm3pv9m.fsf@dev-r-vrt-156.mtr.labs.mlnx>
Message-ID: <20180226200217.GB4195@splinter>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180226200217.FgPZs8UV1VpEj8-kgga9zd2w3ow14gjZT-TRpg9rqxQ@z>

On Mon, Feb 26, 2018@06:31:49PM +0200, Petr Machata wrote:
> Ido Schimmel <idosch at mellanox.com> writes:
> 
> > +learning_test()
> > +{
> > +	local mac=de:ad:be:ef:13:37
> > +	local ageing_time
> > +	local br_port1=$2	# Connected to `host1_if`.
> > +	local host1_if=$3
> > +	local host2_if=$4
> > +	local bridge=$1
> 
> I don't think applying RXT in Bash is appropriate. The ordering of the
> local variables should instead follow the order of function arguments,
> because that information isn't communicated by the function prototype
> itself, unlike C.

Makes sense. Will fix. Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
