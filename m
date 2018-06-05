From: petrm@mellanox.com (Petr Machata)
Date: Tue, 05 Jun 2018 16:15:22 +0300
Subject: [PATCH net-next] selftests: forwarding: Fix importing dependent
 libraries
In-Reply-To: <1ee588d3867b411485be29e45ebbda050920544c.1528203928.git.petrm@mellanox.com>
 (Petr Machata's message of "Tue, 05 Jun 2018 15:07:12 +0200")
References: <1ee588d3867b411485be29e45ebbda050920544c.1528203928.git.petrm@mellanox.com>
Message-ID: <wihefhlbcid.fsf@dev-r-vrt-156.mtr.labs.mlnx>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180605131522.rQ3HSCaoY2t6XtcwAHph72WwWIt_b42XGE_32jAThi8@z>

Petr Machata <petrm at mellanox.com> writes:

> When libraries are sourced from elsewhere from the tree, such as the
> testing/selftests/drivers/net/mlxsw subdirectory, sourcing their own

Sorry, I didn't realize the mirror_bridge.sh is not upstream yet. This
patch is thus immaterial, it will be sent together with the test when it
becomes relevant.

Please ignore.

Thanks,
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
