From: dsahern at gmail.com (David Ahern)
Date: Thu, 1 Mar 2018 12:43:42 -0700
Subject: [PATCH net-next 4/5] selftests: forwarding: Use PING6 instead of
 ping for ipv6 multipath test
In-Reply-To: <20180301193938.GD4839@splinter>
References: <20180301190947.7299-1-dsahern@gmail.com>
 <20180301190947.7299-5-dsahern@gmail.com> <20180301193938.GD4839@splinter>
Message-ID: <f19c8295-74c0-8632-2ee2-cb90f71ea94d@gmail.com>

On 3/1/18 12:39 PM, Ido Schimmel wrote:
> On Thu, Mar 01, 2018 at 11:09:46AM -0800, David Ahern wrote:
>> On Debian jessie ping can not handle IPv6 addresses so the command
>> fails. Use PING6 which is set to ping6.
>>
>> Signed-off-by: David Ahern <dsahern at gmail.com>
> 
> Yep, I forgot to replace that one.
> 
> Reviewed-by: Ido Schimmel <idosch at mellanox.com>
> 
> BTW, I have a patch to convert the IPv6 multipath test to use mz. I'm
> waiting for your L4 hash patches to be accepted :)
> 

Can you forward it? That is what is driving this series.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
