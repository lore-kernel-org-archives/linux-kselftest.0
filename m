From: davem at davemloft.net (David Miller)
Date: Thu, 03 May 2018 13:37:34 -0400 (EDT)
Subject: [PATCH net-next mlxsw 0/3] selftests: forwarding: Updates to
 sysctl handling
In-Reply-To: <cover.1525343276.git.petrm@mellanox.com>
References: <cover.1525343276.git.petrm@mellanox.com>
Message-ID: <20180503.133734.1839164892433201492.davem@davemloft.net>

From: Petr Machata <petrm at mellanox.com>
Date: Thu, 03 May 2018 12:36:52 +0200

> Some selftests need to adjust sysctl settings. In order to be neutral to
> the system that the test is run on, it is a good practice to change back
> to the original setting after the test ends. That involves some
> boilerplate that can be abstracted away.
> 
> In patch #1, introduce two functions, sysctl_set() and sysctl_restore().
> The former stores the current value of a given setting, and sets a new
> value. The latter restores the setting to the previously-stored value.
> 
> In patch #2, use these wrappers in a number of tests.
> 
> Additionally in patch #3, fix a problem in mirror_gre_nh.sh, which
> neglected to set a sysctl that's crucial for the test to work.

Luckily that errant 'mlxsw' hides inside of [] so git will get rid of
it :-)

Series applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
