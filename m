From: shuah@kernel.org (Shuah Khan)
Date: Wed, 30 May 2018 21:29:30 -0600
Subject: [PATCH v3] selftests: cgroup/memcontrol: add basic test for
 socket accounting
In-Reply-To: <20180528061845.GA4805@rapoport-lnx>
References: <1527019565-20470-1-git-send-email-rppt@linux.vnet.ibm.com>
 <20180528061845.GA4805@rapoport-lnx>
Message-ID: <46b8563c-912b-add4-8c56-625c738510fd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531032930.2bN1jjSj2e2SeConWbbAqUPqqGDluOaCnt_t0z0PDHI@z>

On 05/28/2018 12:18 AM, Mike Rapoport wrote:
> Hi,
> 
> Are there any updates on this?
> 
> On Tue, May 22, 2018@11:06:05PM +0300, Mike Rapoport wrote:
>> The test verifies that when there is active TCP connection, the
>> memory.stat.sock and memory.current values are close.
>>
>> Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
>> Acked-by: Roman Gushchin <guro at fb.com>
>> ---
>> v3 changes:
>> * added changelog

Now in linux-kselftest next for 4.18-rc1.

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
