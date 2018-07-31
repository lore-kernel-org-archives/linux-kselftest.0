From: nikolay@cumulusnetworks.com (Nikolay Aleksandrov)
Date: Tue, 31 Jul 2018 16:50:12 +0300
Subject: [PATCH net-next 1/7] net: ipv4: Control SKB reprioritization
 after forwarding
In-Reply-To: <56e17ee7750b89ff350735ff7cbaf14c63864586.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
 <56e17ee7750b89ff350735ff7cbaf14c63864586.1533030830.git.petrm@mellanox.com>
Message-ID: <5746599c-64b1-f283-cb15-b980605cb704@cumulusnetworks.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180731135012.aDeHSqOlN_TRnPw9M7G6_1fHSOLTH0YMgSJsVEU-a_w@z>

On 07/31/2018 12:56 PM, Petr Machata wrote:
> After IPv4 packets are forwarded, the priority of the corresponding SKB
> is updated according to the TOS field of IPv4 header. This overrides any
> prioritization done earlier by e.g. an skbedit action or ingress-qos-map
> defined at a vlan device.
...
> diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
> index 661348f23ea5..e47503b4e4d1 100644
> --- a/include/net/netns/ipv4.h
> +++ b/include/net/netns/ipv4.h
> @@ -98,6 +98,7 @@ struct netns_ipv4 {
>  	int sysctl_ip_default_ttl;
>  	int sysctl_ip_no_pmtu_disc;
>  	int sysctl_ip_fwd_use_pmtu;
> +	int sysctl_ip_fwd_update_priority;
>  	int sysctl_ip_nonlocal_bind;
>  	/* Shall we try to damage output packets if routing dev changes? */
>  	int sysctl_ip_dynaddr;
> diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
> index f2a0a3bab6b5..d3cfbd89ca3a 100644
> --- a/net/ipv4/af_inet.c
> +++ b/net/ipv4/af_inet.c
> @@ -1802,6 +1802,7 @@ static __net_init int inet_init_net(struct net *net)
>  	 * We set them here, in case sysctl is not compiled.
>  	 */
>  	net->ipv4.sysctl_ip_default_ttl = IPDEFTTL;
> +	net->ipv4.sysctl_ip_fwd_update_priority = true;

nit: since this is an int and to keep the code style of inet_init_net()
     I'd suggest to use 1 instead

>  	net->ipv4.sysctl_ip_dynaddr = 0;
>  	net->ipv4.sysctl_ip_early_demux = 1;
>  	net->ipv4.sysctl_udp_early_demux = 1;
...

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
