From: dsahern@gmail.com (David Ahern)
Date: Thu, 1 Mar 2018 14:44:11 -0700
Subject: [PATCH net-next 2/5] selftests: forwarding: Only check for mz
 when it is needed
In-Reply-To: <20180301193618.GB4839@splinter>
References: <20180301190947.7299-1-dsahern@gmail.com>
 <20180301190947.7299-3-dsahern@gmail.com> <20180301193618.GB4839@splinter>
Message-ID: <5f0c7d0e-b7a7-ee38-3965-8754f17d9505@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180301214411.nywZQWYdPmPVXIOVPe9f0ezJagTEPQYfIHlNP-8REhw@z>

On 3/1/18 12:36 PM, Ido Schimmel wrote:
> On Thu, Mar 01, 2018@11:09:44AM -0800, David Ahern wrote:
>> Add a CHECK_MZ flag and only check if mz exists when flag is set.
>> If it does not exist, exit non-0.
>>
>> Signed-off-by: David Ahern <dsahern at gmail.com>
> 
> The only test that doesn't require it is router.sh so I'm not sure it's
> worth the effort. If you still want to keep the patch then
> bridge_vlan_aware.sh needs to be patched as well.
> 

ok, I'll drop this one
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
