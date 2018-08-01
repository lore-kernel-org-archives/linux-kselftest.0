From: davem@davemloft.net (David Miller)
Date: Wed, 01 Aug 2018 09:52:54 -0700 (PDT)
Subject: [PATCH net-next v2 0/7] ipv4: Control SKB reprioritization
 after forwarding
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
Message-ID: <20180801.095254.162481197087516714.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180801165254.T2rWoR4niKNnjJMWfgT_kCLTfxGj_Vkx0KYQWjsFzDo@z>

From: Petr Machata <petrm@mellanox.com>
Date: Wed, 01 Aug 2018 00:35:53 +0200

> After IPv4 packets are forwarded, the priority of the corresponding SKB
> is updated according to the TOS field of IPv4 header. This overrides any
> prioritization done earlier by e.g. an skbedit action or ingress-qos-map
> defined at a vlan device.
> 
> Such overriding may not always be desirable. Even if the packet ends up
> being routed, which implies this is an L3 network node, an administrator
> may wish to preserve whatever prioritization was done earlier on in the
> pipeline.
> 
> Therefore this patch set introduces a sysctl that controls this
> behavior, net.ipv4.ip_forward_update_priority. It's value is 1 by
> default to preserve the current behavior.
> 
> All of the above is implemented in patch #1.
> 
> Value changes prompt a new NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE
> notification, so that the drivers can hook up whatever logic may depend
> on this value. That is implemented in patch #2.
> 
> In patches #3 and #4, mlxsw is adapted to recognize the sysctl. On
> initialization, the RGCR register that handles router configuration is
> set in accordance with the sysctl. The new notification is listened to
> and RGCR is reconfigured as necessary.
> 
> In patches #5 to #7, a selftest is added to verify that mlxsw reflects
> the sysctl value as necessary. The test is expressed in terms of the
> recently-introduced ieee_setapp support, and works by observing how DSCP
> value gets rewritten depending on packet priority. For this reason, the
> test is added to the subdirectory drivers/net/mlxsw. Even though it's
> not particularly specific to mlxsw, it's not suitable for running on
> soft devices (which don't support the ieee_setapp et.al.).
 ...

Series applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
