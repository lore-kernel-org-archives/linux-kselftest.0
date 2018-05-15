From: shuah@kernel.org (Shuah Khan)
Date: Tue, 15 May 2018 11:03:29 -0600
Subject: [PATCH] selftests: cgroup/memcontrol: add basic test for swap
 controls
In-Reply-To: <20180515164034.GF2368884@devbig577.frc2.facebook.com>
References: <1526400353-12991-1-git-send-email-rppt@linux.vnet.ibm.com>
 <20180515164034.GF2368884@devbig577.frc2.facebook.com>
Message-ID: <74c0905f-efce-7409-9da3-34fac29ff3cb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180515170329.d_EGDX6UD3GaEXMzn3wa8xmjJRbrL0F8pTCyaqS5VRo@z>

On 05/15/2018 10:40 AM, Tejun Heo wrote:
> On Tue, May 15, 2018@07:05:53PM +0300, Mike Rapoport wrote:
>> The new test verifies that memory.swap.max and memory.swap.current behave
>> as expected for simple allocation scenarios
>>
>> Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
> 
> Looks good to me.
> 
> Acked-by: Tejun Heo <tj at kernel.org>
> 
> Thanks.
> 

Thanks. Applied to linux-kselftest next for 4.18-rc1

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
