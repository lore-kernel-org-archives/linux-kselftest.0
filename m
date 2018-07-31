From: petrm at mellanox.com (Petr Machata)
Date: Tue, 31 Jul 2018 17:01:15 +0300
Subject: [PATCH net-next 1/7] net: ipv4: Control SKB reprioritization
 after forwarding
In-Reply-To: <5746599c-64b1-f283-cb15-b980605cb704@cumulusnetworks.com>
 (Nikolay Aleksandrov's message of "Tue, 31 Jul 2018 16:50:12 +0300")
References: <cover.1533030830.git.petrm@mellanox.com>
 <56e17ee7750b89ff350735ff7cbaf14c63864586.1533030830.git.petrm@mellanox.com>
 <5746599c-64b1-f283-cb15-b980605cb704@cumulusnetworks.com>
Message-ID: <wihr2jj1p3o.fsf@dev-r-vrt-156.mtr.labs.mlnx>

Nikolay Aleksandrov <nikolay at cumulusnetworks.com> writes:

>> diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
>> index f2a0a3bab6b5..d3cfbd89ca3a 100644
>> --- a/net/ipv4/af_inet.c
>> +++ b/net/ipv4/af_inet.c
>> @@ -1802,6 +1802,7 @@ static __net_init int inet_init_net(struct net *net)
>>  	 * We set them here, in case sysctl is not compiled.
>>  	 */
>>  	net->ipv4.sysctl_ip_default_ttl = IPDEFTTL;
>> +	net->ipv4.sysctl_ip_fwd_update_priority = true;
>
> nit: since this is an int and to keep the code style of inet_init_net()
>      I'd suggest to use 1 instead

OK.

Thanks,
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
