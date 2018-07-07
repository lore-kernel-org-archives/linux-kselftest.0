From: davem@davemloft.net (David Miller)
Date: Sat, 07 Jul 2018 20:29:49 +0900 (KST)
Subject: [PATCH net-next 0/2] Add a mlxsw-specific test for
 mirror-to-gretap
In-Reply-To: <cover.1530816800.git.petrm@mellanox.com>
References: <cover.1530816800.git.petrm@mellanox.com>
Message-ID: <20180707.202949.1265543604105090553.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180707112949.1pH0ISCMbA-de9Tr315kYILkLE80OdTyer7X8wKLnUc@z>

From: Petr Machata <petrm@mellanox.com>
Date: Thu, 05 Jul 2018 21:10:53 +0200

> Some configurations of mirror-to-gretap are impossible for mlxsw to
> offload. Add a test that checks that these out-of-domain conditions are
> handled properly by mlxsw.
> 
> In patch #1, fix mirror_gre_lib.sh and mirror_gre_topo_lib.sh so that
> they can be imported from directories other than forwarding/.
> 
> In patch #2, add a test to check handling of several scenarios that
> mlxsw is expected to fail to offload.

Series applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
